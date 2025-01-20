@interface FileWriteStreamAdapter
- (ChunkedDigest)digest;
- (FileWriteStreamAdapter)initWithDownloadPath:(id)a3;
- (NSString)logKey;
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)setDigest:(id)a3;
- (void)setLogKey:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation FileWriteStreamAdapter

- (FileWriteStreamAdapter)initWithDownloadPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FileWriteStreamAdapter;
  v6 = [(FileWriteStreamAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_downloadPath, a3);
  }

  return v7;
}

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  verifier = self->_verifier;
  if (verifier)
  {
    id v15 = 0;
    unsigned int v9 = [(DigestVerifier *)verifier verifyData:v6 error:&v15];
    id v10 = v15;
    if (!v9)
    {
      v7[2](v7, v10, 0);
      goto LABEL_9;
    }
  }
  else
  {
    id v10 = 0;
  }
  outputStream = self->_outputStream;
  id v12 = v6;
  if (-[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", [v12 bytes], objc_msgSend(v12, "length")) == -1)
  {
    v14 = [(NSOutputStream *)self->_outputStream streamError];
  }
  else
  {
    id v13 = [v12 length];
    v14 = 0;
    self->_savedBytes += (unint64_t)v13;
  }
  v7[2](v7, v14, 0);

LABEL_9:
}

- (void)finishWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  verifier = self->_verifier;
  if (verifier)
  {
    id v10 = 0;
    unsigned int v6 = [(DigestVerifier *)verifier finalAndVerifyError:&v10];
    id v7 = v10;
    v8 = v7;
    if (v6) {
      id v9 = 0;
    }
    else {
      id v9 = v7;
    }
  }
  else
  {
    v8 = 0;
    id v9 = 0;
  }
  [(NSOutputStream *)self->_outputStream close];
  ((void (**)(id, id))v4)[2](v4, v9);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, unint64_t, void *))a3;
  if (self->_digest)
  {
    id v5 = [[DigestVerifier alloc] initWithChunkedDigest:self->_digest resumptionOffset:0];
    verifier = self->_verifier;
    self->_verifier = v5;
  }
  self->_unint64_t savedBytes = 0;
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:self->_downloadPath];
  if (v7)
  {
    if ([(ChunkedDigest *)self->_digest chunkSize])
    {
      if (qword_1003A0740 != -1) {
        dispatch_once(&qword_1003A0740, &stru_10035A7A8);
      }
      v8 = off_100399D98;
      if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_DEFAULT))
      {
        logKey = self->_logKey;
        downloadPath = self->_downloadPath;
        *(_DWORD *)buf = 138543618;
        v44 = logKey;
        __int16 v45 = 2114;
        unint64_t v46 = (unint64_t)downloadPath;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Validating existing partial download: %{public}@", buf, 0x16u);
      }
      while (1)
      {
        unsigned int v11 = [(ChunkedDigest *)self->_digest chunkSize];
        id v42 = 0;
        id v12 = [v7 readDataUpToLength:v11 error:&v42];
        id v13 = v42;
        if (v13) {
          break;
        }
        id v14 = [v12 length];
        if (v14 != (id)[(ChunkedDigest *)self->_digest chunkSize]) {
          break;
        }
        id v15 = self->_verifier;
        uint64_t v41 = 0;
        unsigned __int8 v16 = [(DigestVerifier *)v15 verifyData:v12 error:&v41];

        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
      }
    }
    else
    {
      if (qword_1003A0740 != -1) {
        dispatch_once(&qword_1003A0740, &stru_10035A7A8);
      }
      v17 = off_100399D98;
      if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_logKey;
        v19 = self->_downloadPath;
        *(_DWORD *)buf = 138543618;
        v44 = v18;
        __int16 v45 = 2114;
        unint64_t v46 = (unint64_t)v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not validating existing partial download because chunkSize is zero: %{public}@", buf, 0x16u);
      }
    }
LABEL_18:
    unint64_t v20 = [(DigestVerifier *)self->_verifier bytesValidated];
    id v40 = 0;
    unsigned int v21 = [v7 truncateAtOffset:v20 error:&v40];
    unint64_t v22 = (unint64_t)v40;
    if (v21)
    {
      self->_unint64_t savedBytes = [(DigestVerifier *)self->_verifier bytesValidated];
      if (qword_1003A0740 != -1) {
        dispatch_once(&qword_1003A0740, &stru_10035A7A8);
      }
      v23 = off_100399D98;
      if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_logKey;
        unint64_t savedBytes = self->_savedBytes;
        v26 = self->_downloadPath;
        *(_DWORD *)buf = 138543874;
        v44 = v24;
        __int16 v45 = 2048;
        unint64_t v46 = savedBytes;
        __int16 v47 = 2114;
        v48 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Validated %llu bytes at: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      if (qword_1003A0740 != -1) {
        dispatch_once(&qword_1003A0740, &stru_10035A7A8);
      }
      if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_ERROR)) {
        sub_1002CAB34();
      }
    }
    id v39 = 0;
    unsigned __int8 v27 = [v7 closeAndReturnError:&v39];
    unint64_t v28 = (unint64_t)v39;
    if ((v27 & 1) == 0)
    {
      if (qword_1003A0740 != -1) {
        dispatch_once(&qword_1003A0740, &stru_10035A7A8);
      }
      if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_ERROR)) {
        sub_1002CAAC8();
      }
    }
    if (v22 | v28)
    {
      v29 = +[NSFileManager defaultManager];
      v30 = self->_downloadPath;
      id v38 = 0;
      [v29 removeItemAtPath:v30 error:&v38];
      id v31 = v38;

      if (v31)
      {
        if (qword_1003A0740 != -1) {
          dispatch_once(&qword_1003A0740, &stru_10035A7A8);
        }
        if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_FAULT)) {
          sub_1002CAA4C();
        }
      }
      else
      {
        if (qword_1003A0740 != -1) {
          dispatch_once(&qword_1003A0740, &stru_10035A7A8);
        }
        v32 = off_100399D98;
        if (os_log_type_enabled((os_log_t)off_100399D98, OS_LOG_TYPE_DEFAULT))
        {
          v33 = self->_logKey;
          v34 = self->_downloadPath;
          *(_DWORD *)buf = 138543618;
          v44 = v33;
          __int16 v45 = 2114;
          unint64_t v46 = (unint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted partially downloaded file due to previous errors: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  +[NSOutputStream outputStreamToFileAtPath:self->_downloadPath append:self->_savedBytes != 0];
  v35 = (NSOutputStream *)objc_claimAutoreleasedReturnValue();
  outputStream = self->_outputStream;
  self->_outputStream = v35;

  [(NSOutputStream *)self->_outputStream open];
  v37 = [(NSOutputStream *)self->_outputStream streamError];
  v4[2](v4, self->_savedBytes, v37);
}

- (void)suspendWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  v4 = (void (**)(id, void))a3;
  [(NSOutputStream *)outputStream close];
  v4[2](v4, 0);
}

- (void)truncateWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  id v5 = (void (**)(id, id))a3;
  [(NSOutputStream *)outputStream close];
  unsigned int v6 = +[NSFileManager defaultManager];
  downloadPath = self->_downloadPath;
  id v9 = 0;
  [v6 removeItemAtPath:downloadPath error:&v9];
  id v8 = v9;

  v5[2](v5, v8);
}

- (void)resetWithCompletionHandler:(id)a3
{
  outputStream = self->_outputStream;
  v4 = (void (**)(id, void))a3;
  [(NSOutputStream *)outputStream close];
  v4[2](v4, 0);
}

- (ChunkedDigest)digest
{
  return (ChunkedDigest *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDigest:(id)a3
{
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLogKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_downloadPath, 0);
}

@end