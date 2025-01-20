@interface IDSOTREncrypter
- (IDSOTRController)OTRController;
- (IDSOTREncrypter)initWithOTRController:(id)a3 OTRToken:(id)a4;
- (NSString)OTRToken;
- (id)decryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5;
- (id)encryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5;
@end

@implementation IDSOTREncrypter

- (IDSOTREncrypter)initWithOTRController:(id)a3 OTRToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSOTREncrypter;
  v9 = [(IDSOTREncrypter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_OTRController, a3);
    objc_storeStrong((id *)&v10->_OTRToken, a4);
  }

  return v10;
}

- (id)encryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 length];
  if (v9 && v10 && self->_OTRToken)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v32 = sub_1002DF900;
    v33 = sub_1002DF910;
    id v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002DF918;
    v23[3] = &unk_100988278;
    v23[4] = self;
    v25 = buf;
    id v24 = v8;
    v26 = &v27;
    [v9 performSyncBlock:v23];
    if (a5 || *((unsigned char *)v28 + 24))
    {
      if (*((unsigned char *)v28 + 24)) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = a5 == 0;
      }
      int64_t v12 = 101;
      if (v11) {
        int64_t v12 = 0;
      }
      *a5 = v12;
    }
    id v13 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v8 length];
      v16 = [(IDSOTREncrypter *)self OTRToken];
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v17 = [v8 length];
      v20 = [(IDSOTREncrypter *)self OTRToken];
      _IDSWarnV();

      id v18 = objc_msgSend(v8, "length", v17, v9, v20);
      v21 = [(IDSOTREncrypter *)self OTRToken];
      _IDSLogV();

      objc_msgSend(v8, "length", v18, v9, v21);
      v22 = [(IDSOTREncrypter *)self OTRToken];
      _IDSLogTransport();
    }
    id v13 = 0;
    if (a5) {
      *a5 = 101;
    }
  }

  return v13;
}

- (id)decryptData:(id)a3 onQueue:(id)a4 error:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 length];
  if (v9 && v10 && self->_OTRToken)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v32 = sub_1002DF900;
    v33 = sub_1002DF910;
    id v34 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 1;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002DFF90;
    v23[3] = &unk_100988278;
    v23[4] = self;
    v25 = buf;
    id v24 = v8;
    v26 = &v27;
    [v9 performSyncBlock:v23];
    if (a5 || *((unsigned char *)v28 + 24))
    {
      if (*((unsigned char *)v28 + 24)) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = a5 == 0;
      }
      int64_t v12 = 100;
      if (v11) {
        int64_t v12 = 0;
      }
      *a5 = v12;
    }
    id v13 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v8 length];
      v16 = [(IDSOTREncrypter *)self OTRToken];
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v32 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid OTR Encrypt parameters -- failing {inputDataLength: %llu, queue: %@, OTRToken: %@}", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v17 = [v8 length];
      v20 = [(IDSOTREncrypter *)self OTRToken];
      _IDSWarnV();

      id v18 = objc_msgSend(v8, "length", v17, v9, v20);
      v21 = [(IDSOTREncrypter *)self OTRToken];
      _IDSLogV();

      objc_msgSend(v8, "length", v18, v9, v21);
      v22 = [(IDSOTREncrypter *)self OTRToken];
      _IDSLogTransport();
    }
    id v13 = 0;
    if (a5) {
      *a5 = 100;
    }
  }

  return v13;
}

- (IDSOTRController)OTRController
{
  return self->_OTRController;
}

- (NSString)OTRToken
{
  return self->_OTRToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OTRToken, 0);

  objc_storeStrong((id *)&self->_OTRController, 0);
}

@end