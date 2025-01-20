@interface FileWriteStreamAdapter
- (void)consumeData:(id)a3 withCompletionHandler:(id)a4;
- (void)finishWithCompletionHandler:(id)a3;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)resetWithCompletionHandler:(id)a3;
- (void)suspendWithCompletionHandler:(id)a3;
- (void)truncateWithCompletionHandler:(id)a3;
@end

@implementation FileWriteStreamAdapter

- (void)consumeData:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  verifier = self->_verifier;
  if (verifier)
  {
    id v15 = 0;
    int v9 = sub_1002EAD44((uint64_t)verifier, v6, &v15);
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
    int v6 = sub_1002EA924((uint64_t)verifier, &v10);
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
    v5 = (DigestVerifier *)sub_1002EA840([DigestVerifier alloc], self->_digest, 0);
    verifier = self->_verifier;
    self->_verifier = v5;
  }
  self->_unint64_t savedBytes = 0;
  id v7 = +[NSFileHandle fileHandleForUpdatingAtPath:self->_downloadPath];
  if (v7)
  {
    digest = self->_digest;
    if (digest) {
      BOOL v9 = digest->_chunkSize == 0;
    }
    else {
      BOOL v9 = 1;
    }
    id v10 = ASDLogHandleForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        logKey = self->_logKey;
        downloadPath = self->_downloadPath;
        *(_DWORD *)buf = 138412546;
        v56 = logKey;
        __int16 v57 = 2114;
        unint64_t v58 = (unint64_t)downloadPath;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Not validating existing partial download because chunkSize is zero: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (v11)
      {
        v14 = self->_logKey;
        id v15 = self->_downloadPath;
        *(_DWORD *)buf = 138412546;
        v56 = v14;
        __int16 v57 = 2114;
        unint64_t v58 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@] Validating existing partial download: %{public}@", buf, 0x16u);
      }

      while (1)
      {
        v17 = self->_digest;
        uint64_t v18 = v17 ? v17->_chunkSize : 0;
        id v54 = 0;
        v19 = [v7 readDataUpToLength:v18 error:&v54];
        id v20 = v54;
        if (v20) {
          break;
        }
        v21 = (ChunkedDigest *)[v19 length];
        v22 = self->_digest;
        if (v22) {
          v22 = (ChunkedDigest *)v22->_chunkSize;
        }
        if (v21 != v22) {
          break;
        }
        v23 = self->_verifier;
        uint64_t v53 = 0;
        char v24 = sub_1002EAD44((uint64_t)v23, v19, &v53);

        if ((v24 & 1) == 0) {
          goto LABEL_23;
        }
      }
    }
LABEL_23:
    v25 = self->_verifier;
    if (v25) {
      unint64_t bytesValidated = v25->_bytesValidated;
    }
    else {
      unint64_t bytesValidated = 0;
    }
    id v52 = 0;
    unsigned int v27 = [v7 truncateAtOffset:bytesValidated error:&v52];
    unint64_t v28 = (unint64_t)v52;
    if (v27)
    {
      v29 = self->_verifier;
      if (v29) {
        v29 = (DigestVerifier *)v29->_bytesValidated;
      }
      self->_unint64_t savedBytes = (unint64_t)v29;
      v30 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_logKey;
        unint64_t savedBytes = self->_savedBytes;
        v33 = self->_downloadPath;
        *(_DWORD *)buf = 138412802;
        v56 = v31;
        __int16 v57 = 2048;
        unint64_t v58 = savedBytes;
        __int16 v59 = 2114;
        v60 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] Validated %{bytes}llu at: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      v30 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_logKey;
        *(_DWORD *)buf = 138412546;
        v56 = v48;
        __int16 v57 = 2114;
        unint64_t v58 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[%@] Error attempting to truncate partial download: %{public}@", buf, 0x16u);
      }
    }

    id v51 = 0;
    unsigned __int8 v34 = [v7 closeAndReturnError:&v51];
    unint64_t v35 = (unint64_t)v51;
    if ((v34 & 1) == 0)
    {
      v36 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v49 = self->_logKey;
        *(_DWORD *)buf = 138412546;
        v56 = v49;
        __int16 v57 = 2114;
        unint64_t v58 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "[%@] Error attempting to close file handle: %{public}@", buf, 0x16u);
      }
    }
    if (v28 | v35)
    {
      v37 = +[NSFileManager defaultManager];
      v38 = self->_downloadPath;
      id v50 = 0;
      [v37 removeItemAtPath:v38 error:&v50];
      id v39 = v50;

      v40 = ASDLogHandleForCategory();
      v41 = v40;
      if (v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        {
          v42 = self->_logKey;
          *(_DWORD *)buf = 138412546;
          v56 = v42;
          __int16 v57 = 2114;
          unint64_t v58 = (unint64_t)v39;
          _os_log_fault_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "[%@] Unable to delete previous download: %{public}@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v43 = self->_logKey;
        v44 = self->_downloadPath;
        *(_DWORD *)buf = 138412546;
        v56 = v43;
        __int16 v57 = 2114;
        unint64_t v58 = (unint64_t)v44;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[%@] Deleted partially downloaded file due to previous errors: %{public}@", buf, 0x16u);
      }
    }
  }
  +[NSOutputStream outputStreamToFileAtPath:self->_downloadPath append:self->_savedBytes != 0];
  v45 = (NSOutputStream *)objc_claimAutoreleasedReturnValue();
  outputStream = self->_outputStream;
  self->_outputStream = v45;

  [(NSOutputStream *)self->_outputStream open];
  v47 = [(NSOutputStream *)self->_outputStream streamError];
  v4[2](v4, self->_savedBytes, v47);
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
  v5 = (void (**)(id, id))a3;
  [(NSOutputStream *)outputStream close];
  int v6 = +[NSFileManager defaultManager];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_digest, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_downloadPath, 0);
}

@end