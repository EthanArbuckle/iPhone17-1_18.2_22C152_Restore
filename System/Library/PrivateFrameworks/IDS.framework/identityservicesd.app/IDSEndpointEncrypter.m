@interface IDSEndpointEncrypter
- (BOOL)_isNGMKeyType;
- (BOOL)_isSecKeyType;
- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 error:(id *)a7;
- (IDSCertifiedDeliveryReplayCommitter)replayCommitter;
- (IDSEndpoint)endpoint;
- (IDSEndpointEncrypter)initWithEndpoint:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 replayCommitter:(id)a5 forceEncryptionType:(int64_t)a6;
- (IDSEndpointEncrypter)initWithEndpoint:(id)a3 fullDeviceIdentitySigner:(id)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityEncrypter;
- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7;
- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 usedIdentifier:(id *)a8 onQueue:(id)a9 metadata:(id *)a10 error:(id *)a11;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6;
- (int64_t)forceEncryptionType;
- (unsigned)keyType;
- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9;
- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8;
- (void)setEndpoint:(id)a3;
- (void)setForceEncryptionType:(int64_t)a3;
- (void)setFullDeviceIdentityEncrypter:(id)a3;
- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7;
@end

@implementation IDSEndpointEncrypter

- (IDSEndpointEncrypter)initWithEndpoint:(id)a3 fullDeviceIdentityContainerEncrypter:(id)a4 replayCommitter:(id)a5 forceEncryptionType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSEndpointEncrypter;
  v14 = [(IDSEndpointEncrypter *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_endpoint, a3);
    objc_storeStrong((id *)&v15->_fullDeviceIdentityContainerEncrypter, a4);
    objc_storeStrong((id *)&v15->_replayCommitter, a5);
    v15->_forceEncryptionType = a6;
  }

  return v15;
}

- (IDSEndpointEncrypter)initWithEndpoint:(id)a3 fullDeviceIdentitySigner:(id)a4 keyType:(unsigned int)a5 keyDiversifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)IDSEndpointEncrypter;
  v14 = [(IDSEndpointEncrypter *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_endpoint, a3);
    objc_storeStrong((id *)&v15->_fullDeviceIdentitySigner, a4);
    v15->_keyType = a5;
    objc_storeStrong((id *)&v15->_keyDiversifier, a6);
  }

  return v15;
}

- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 usedIdentifier:(id *)a8 onQueue:(id)a9 metadata:(id *)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a9;
  uint64_t v20 = [(IDSEndpoint *)self->_endpoint publicDeviceIdentityContainer];
  v21 = (void *)v20;
  if (self->_endpoint && v20)
  {
    if (a11) {
      *a11 = 0;
    }
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = sub_10030A9C4;
    v59 = sub_10030A9D4;
    id v60 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = sub_10030A9C4;
    v53 = sub_10030A9D4;
    id v54 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = sub_10030A9C4;
    v47 = sub_10030A9D4;
    id v48 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = sub_10030A9C4;
    v41 = sub_10030A9D4;
    id v42 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10030A9DC;
    v26[3] = &unk_100988A28;
    v26[4] = self;
    v31 = &v55;
    id v27 = v16;
    id v28 = v17;
    id v29 = v21;
    v32 = &v43;
    BOOL v35 = a5;
    BOOL v36 = a6;
    id v30 = v18;
    v33 = &v49;
    v34 = &v37;
    [v19 performSyncBlock:v26];
    if (a11)
    {
      v22 = (void *)v44[5];
      if (v22) {
        *a11 = v22;
      }
    }
    if (a8) {
      *a8 = (id) v50[5];
    }
    if (a10) {
      *a10 = (id) v38[5];
    }
    id v23 = (id)v56[5];

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v55, 8);
  }
  else if (a11)
  {
    +[NSError errorWithDomain:IDSEncryptionErrorDomain code:7 userInfo:0];
    id v23 = 0;
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(IDSEndpoint *)self->_endpoint publicDeviceIdentityContainer];
  v14 = (void *)v13;
  if (self->_endpoint) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (a6)
    {
      +[NSError errorWithDomain:IDSEncryptionErrorDomain code:7 userInfo:0];
      id v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    if (a6) {
      *a6 = 0;
    }
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = sub_10030A9C4;
    BOOL v35 = sub_10030A9D4;
    id v36 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_10030A9C4;
    id v29 = sub_10030A9D4;
    id v30 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10030AD90;
    v19[3] = &unk_100988A50;
    id v23 = &v25;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v14;
    v24 = &v31;
    [v12 performSyncBlock:v19];
    if (a6)
    {
      id v17 = (void *)v32[5];
      if (v17) {
        *a6 = v17;
      }
    }
    id v16 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }

  return v16;
}

- (id)decryptData:(id)a3 usingIdentifier:(id)a4 isRetry:(BOOL)a5 onQueue:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  BOOL v15 = [(IDSEndpoint *)self->_endpoint publicDeviceIdentityContainer];
  if (!v15)
  {
    if (a7)
    {
      +[NSError errorWithDomain:IDSDecryptionErrorDomain code:4 userInfo:0];
      id v27 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v27 = 0;
    }
    goto LABEL_15;
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_10030A9C4;
  v46 = sub_10030A9D4;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_10030A9C4;
  v40 = sub_10030A9D4;
  id v41 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10030B1E4;
  v29[3] = &unk_100988A78;
  uint64_t v33 = &v42;
  v29[4] = self;
  id v30 = v12;
  id v31 = v15;
  v34 = &v36;
  id v32 = v13;
  BOOL v35 = a5;
  [v14 performSyncBlock:v29];
  id v16 = (void *)v37[5];
  if (v16)
  {
    id v17 = [v16 domain];
    if (![v17 isEqualToString:IDSDecryptionErrorDomain]
      || [(id)v37[5] code] != (id)12 && objc_msgSend((id)v37[5], "code") != (id)9)
    {
      goto LABEL_8;
    }
    id v18 = [(IDSEndpointEncrypter *)self endpoint];
    id v19 = [v18 identityContainerDeserializationError];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      id v17 = [(id)v37[5] domain];
      id v21 = [(id)v37[5] code];
      NSErrorUserInfoKey v48 = NSUnderlyingErrorKey;
      id v22 = [(IDSEndpointEncrypter *)self endpoint];
      id v23 = [v22 identityContainerDeserializationError];
      uint64_t v49 = v23;
      v24 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v25 = +[NSError errorWithDomain:v17 code:v21 userInfo:v24];
      v26 = (void *)v37[5];
      v37[5] = v25;

LABEL_8:
    }
  }
  if (a7) {
    *a7 = (id) v37[5];
  }
  id v27 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

LABEL_15:

  return v27;
}

- (void)decryptData:(id)a3 usingIdentifier:(id)a4 onQueue:(id)a5 isRetry:(BOOL)a6 replayKey:(id)a7 withCompletion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(IDSEndpoint *)self->_endpoint publicDeviceIdentityContainer];
  if (v19)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10030B428;
    v22[3] = &unk_100988AC8;
    v22[4] = self;
    id v23 = v17;
    id v27 = v18;
    id v24 = v14;
    id v25 = v19;
    id v26 = v15;
    BOOL v28 = a6;
    [v16 performAsyncBlock:v22];
  }
  else
  {
    BOOL v20 = +[NSError errorWithDomain:IDSDecryptionErrorDomain code:4 userInfo:0];
    id v21 = objc_alloc_init(IDSDecryptionMetadata);
    (*((void (**)(id, void, void, void *, IDSDecryptionMetadata *))v18 + 2))(v18, 0, 0, v20, v21);
  }
}

- (void)decryptData:(id)a3 decryptionContext:(id)a4 usingIdentifier:(id)a5 onQueue:(id)a6 isRetry:(BOOL)a7 replayKey:(id)a8 withCompletion:(id)a9
{
}

- (void)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10030B9CC;
  v17[3] = &unk_100988AF0;
  v17[4] = self;
  id v18 = v12;
  id v20 = a7;
  int64_t v21 = a5;
  id v19 = v13;
  id v14 = v20;
  id v15 = v13;
  id v16 = v12;
  [a6 performAsyncBlock:v17];
}

- (BOOL)verifySignedData:(id)a3 matchesData:(id)a4 forType:(int64_t)a5 onQueue:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  BOOL v28 = sub_10030A9C4;
  id v29 = sub_10030A9D4;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10030BD80;
  v19[3] = &unk_100988B18;
  v19[4] = self;
  id v22 = &v31;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  id v23 = &v25;
  int64_t v24 = a5;
  id v21 = v16;
  [v14 performSyncBlock:v19];
  if (a7) {
    *a7 = (id) v26[5];
  }
  char v17 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)_isNGMKeyType
{
  return [(IDSEndpointEncrypter *)self keyType] == 0;
}

- (BOOL)_isSecKeyType
{
  return [(IDSEndpointEncrypter *)self keyType] == 1;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (IDSCertifiedDeliveryReplayCommitter)replayCommitter
{
  return self->_replayCommitter;
}

- (IDSEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (int64_t)forceEncryptionType
{
  return self->_forceEncryptionType;
}

- (void)setForceEncryptionType:(int64_t)a3
{
  self->_forceEncryptionType = a3;
}

- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner
{
  return self->_fullDeviceIdentitySigner;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityEncrypter
{
  return self->_fullDeviceIdentityEncrypter;
}

- (void)setFullDeviceIdentityEncrypter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullDeviceIdentityEncrypter, 0);
  objc_storeStrong((id *)&self->_keyDiversifier, 0);
  objc_storeStrong((id *)&self->_fullDeviceIdentitySigner, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_replayCommitter, 0);

  objc_storeStrong((id *)&self->_fullDeviceIdentityContainerEncrypter, 0);
}

@end