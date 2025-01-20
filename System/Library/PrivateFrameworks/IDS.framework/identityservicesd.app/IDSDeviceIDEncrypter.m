@interface IDSDeviceIDEncrypter
- (BOOL)forceLegacy;
- (IDSDAccountController)accountController;
- (IDSDeviceIDEncrypter)initWithPublicKeyStorage:(id)a3 accountController:(id)a4 fullDeviceIdentityContainerEncrypter:(id)a5 rateLimiter:(id)a6 forceLegacy:(BOOL)a7;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSPublicKeyStorage)publicKeyStorage;
- (IDSRateLimiter)rateLimiter;
- (NSString)deviceID;
- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5;
- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 error:(id *)a6;
- (id)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 error:(id *)a5;
- (id)_validateDecryptionParametersWithError:(id *)a3;
- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6;
- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9;
- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8;
- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)setDeviceID:(id)a3;
@end

@implementation IDSDeviceIDEncrypter

- (IDSDeviceIDEncrypter)initWithPublicKeyStorage:(id)a3 accountController:(id)a4 fullDeviceIdentityContainerEncrypter:(id)a5 rateLimiter:(id)a6 forceLegacy:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSDeviceIDEncrypter;
  v17 = [(IDSDeviceIDEncrypter *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_publicKeyStorage, a3);
    objc_storeStrong((id *)&v18->_accountController, a4);
    objc_storeStrong((id *)&v18->_fullDeviceIdentityContainerEncrypter, a5);
    objc_storeStrong((id *)&v18->_rateLimiter, a6);
    v18->_forceLegacy = a7;
  }

  return v18;
}

- (id)_legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(IDSDeviceIDEncrypter *)self deviceID];
  unsigned int v11 = [v10 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];

  if (v11)
  {
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Tried to PK to default paired device!! -- failing", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    if (a5)
    {
      id v13 = +[NSError errorWithDomain:IDSEncryptionErrorDomain code:2 userInfo:0];
LABEL_17:
      id v16 = 0;
      *a5 = v13;
      goto LABEL_27;
    }
LABEL_18:
    id v16 = 0;
    goto LABEL_27;
  }
  id v14 = [(IDSDeviceIDEncrypter *)self deviceID];

  if (!v14)
  {
    v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Tried to encrypt to nil device ID -- failing", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    if (a5)
    {
      id v13 = +[NSError errorWithDomain:IDSEncryptionErrorDomain code:3 userInfo:0];
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v15 = [(IDSPublicKeyStorage *)self->_publicKeyStorage publicDeviceIdentityContainerForDeviceID:self->_deviceID];
  if (v15)
  {
    id v16 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter legacyEncryptData:v8 withEncryptedAttributes:v9 withPublicDeviceIdentityContainer:v15 error:a5];
  }
  else
  {
    v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(IDSDeviceIDEncrypter *)self deviceID];
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Missing identity to encrypt with {deviceID: %@}", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v21 = [(IDSDeviceIDEncrypter *)self deviceID];
      _IDSWarnV();

      v22 = [(IDSDeviceIDEncrypter *)self deviceID];
      _IDSLogV();

      v23 = [(IDSDeviceIDEncrypter *)self deviceID];
      _IDSLogTransport();
    }
    if (a5)
    {
      +[NSError errorWithDomain:IDSEncryptionErrorDomain code:4 userInfo:0];
      id v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
    }
  }

LABEL_27:

  return v16;
}

- (id)_validateDecryptionParametersWithError:(id *)a3
{
  v5 = [(IDSDeviceIDEncrypter *)self deviceID];

  if (v5)
  {
    v6 = [(IDSPublicKeyStorage *)self->_publicKeyStorage publicDeviceIdentityContainerForDeviceID:self->_deviceID];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned int v11 = [(IDSDeviceIDEncrypter *)self deviceID];
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Missing identity to decrypt with {deviceID: %@}", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        id v13 = [(IDSDeviceIDEncrypter *)self deviceID];
        _IDSWarnV();

        id v14 = [(IDSDeviceIDEncrypter *)self deviceID];
        _IDSLogV();

        id v15 = [(IDSDeviceIDEncrypter *)self deviceID];
        _IDSLogTransport();
      }
      if (a3)
      {
        *a3 = +[NSError errorWithDomain:IDSDecryptionErrorDomain code:4 userInfo:0];
      }
    }
  }
  else
  {
    id v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Tried to encrypt to nil device ID -- failing", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    if (a3)
    {
      +[NSError errorWithDomain:IDSDecryptionErrorDomain code:3 userInfo:0];
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned int v11 = [(IDSDeviceIDEncrypter *)self _validateDecryptionParametersWithError:a6];
  if (v11)
  {
    v12 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter decryptData:v9 withPublicDeviceIdentityContainer:v11 error:a6 usingIdentifier:v10 isRetry:0];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v14 = 0;
  id v9 = [(IDSDeviceIDEncrypter *)self _validateDecryptionParametersWithError:&v14];
  id v10 = v14;
  if (v9)
  {
    unsigned int v11 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter decryptData:v7 decryptionContext:0 withPublicDeviceIdentityContainer:v9 usingIdentifier:v8 isRetry:0];
  }
  else
  {
    id v12 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
    [v12 failWithError:v10];
    unsigned int v11 = [v12 promise];
  }

  return v11;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100081CB4;
  v33 = sub_100081CC4;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100081CB4;
  v27 = sub_100081CC4;
  id v28 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100081CCC;
  v18[3] = &unk_100980C20;
  v21 = &v29;
  v18[4] = self;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  v22 = &v23;
  [v12 performSyncBlock:v18];
  if (a6)
  {
    id v15 = (void *)v24[5];
    if (v15) {
      *a6 = v15;
    }
  }
  id v16 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

- (void)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(IDSDeviceIDEncrypter *)self deviceID];
  unsigned int v15 = [v14 isEqualToString:IDSDeviceDefaultPairedDeviceUniqueID];

  if (v15)
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Tried to PK to default paired device!! -- failing", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    v17 = +[NSError errorWithDomain:IDSEncryptionErrorDomain code:2 userInfo:0];
    (*((void (**)(id, void, void *, void))v13 + 2))(v13, 0, v17, 0);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100081F88;
  v22[3] = &unk_100980950;
  v22[4] = self;
  id v23 = v10;
  id v25 = v12;
  id v26 = v13;
  id v24 = v11;
  id v18 = v12;
  id v19 = v13;
  id v20 = v11;
  id v21 = v10;
  [v18 performAsyncBlock:v22];
}

- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  id v34 = sub_100081CB4;
  v35 = sub_100081CC4;
  id v36 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100081CB4;
  uint64_t v29 = sub_100081CC4;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000827E4;
  v19[3] = &unk_100980C48;
  v22 = &v31;
  v19[4] = self;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  BOOL v24 = a5;
  id v21 = v16;
  id v23 = &v25;
  [v14 performSyncBlock:v19];
  if (a7) {
    *a7 = (id) v26[5];
  }
  id v17 = (id)v32[5];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100082978;
  v19[3] = &unk_100980CC0;
  v19[4] = self;
  id v20 = v13;
  BOOL v24 = a6;
  id v22 = a5;
  id v23 = a8;
  id v21 = v14;
  id v15 = v22;
  id v16 = v23;
  id v17 = v14;
  id v18 = v13;
  [v15 performAsyncBlock:v19];
}

- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9
{
}

- (IDSPublicKeyStorage)publicKeyStorage
{
  return self->_publicKeyStorage;
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (IDSRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (BOOL)forceLegacy
{
  return self->_forceLegacy;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_fullDeviceIdentityContainerEncrypter, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_accountController, 0);

  objc_storeStrong((id *)&self->_publicKeyStorage, 0);
}

@end