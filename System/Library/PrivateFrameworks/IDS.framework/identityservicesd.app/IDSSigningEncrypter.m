@interface IDSSigningEncrypter
- (IDSDServiceController)serviceController;
- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner;
- (IDSSigningEncrypter)initWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5 serviceController:(id)a6 fullDeviceIdentitySigner:(id)a7;
- (IDSSigningKeyDiversifier)keyDiversifier;
- (NSString)service;
- (id)_signData:(id)a3 withType:(int64_t)a4 error:(id *)a5;
- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6;
- (id)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6;
- (unsigned)_retrieveKeyIndex;
- (unsigned)keyIndex;
- (unsigned)keyType;
- (void)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6;
- (void)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6;
@end

@implementation IDSSigningEncrypter

- (IDSSigningEncrypter)initWithKeyType:(unsigned int)a3 keyDiversifier:(id)a4 service:(id)a5 serviceController:(id)a6 fullDeviceIdentitySigner:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IDSSigningEncrypter;
  v17 = [(IDSSigningEncrypter *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_keyType = a3;
    objc_storeStrong((id *)&v17->_keyDiversifier, a4);
    objc_storeStrong((id *)&v18->_service, a5);
    objc_storeStrong((id *)&v18->_serviceController, a6);
    v18->_keyIndex = [(IDSSigningEncrypter *)v18 _retrieveKeyIndex];
    objc_storeStrong((id *)&v18->_fullDeviceIdentitySigner, a7);
  }

  return v18;
}

- (void)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D3D98;
  v11[3] = &unk_100981888;
  v11[4] = self;
  id v12 = a3;
  id v13 = a6;
  int64_t v14 = a4;
  id v9 = v13;
  id v10 = v12;
  [a5 performAsyncBlock:v11];
}

- (void)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 withCompletion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D3F8C;
  v11[3] = &unk_100981888;
  v11[4] = self;
  id v12 = a3;
  id v13 = a6;
  int64_t v14 = a4;
  id v9 = v13;
  id v10 = v12;
  [a5 performAsyncBlock:v11];
}

- (id)batchSignDatas:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000D41F8;
  v24 = sub_1000D4208;
  id v25 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000D4210;
  v15[3] = &unk_1009818B0;
  v17 = &v20;
  v15[4] = self;
  id v12 = v10;
  id v16 = v12;
  int64_t v18 = a4;
  v19 = a6;
  [v11 performSyncBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

- (id)signData:(id)a3 withType:(int64_t)a4 onQueue:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1000D41F8;
  v31 = sub_1000D4208;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1000D41F8;
  id v25 = sub_1000D4208;
  id v26 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D4444;
  v16[3] = &unk_1009818D8;
  int64_t v18 = &v27;
  v16[4] = self;
  id v12 = v10;
  v19 = &v21;
  int64_t v20 = a4;
  id v17 = v12;
  [v11 performSyncBlock:v16];
  if (a6)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a6 = v13;
    }
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (unsigned)_retrieveKeyIndex
{
  if ([(IDSSigningEncrypter *)self keyType] != 1) {
    return 0;
  }
  v3 = [(IDSSigningEncrypter *)self serviceController];
  v4 = [(IDSSigningEncrypter *)self service];
  v5 = [v3 serviceWithIdentifier:v4];
  unsigned __int16 v6 = (unsigned __int16)[v5 applicationKeyIndex];

  return v6;
}

- (id)_signData:(id)a3 withType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned int v9 = [(IDSSigningEncrypter *)self keyType];
  if (v9 == 1)
  {
    if ([(IDSSigningEncrypter *)self keyIndex])
    {
      id v12 = [(IDSSigningEncrypter *)self fullDeviceIdentitySigner];
      uint64_t v13 = [(IDSSigningEncrypter *)self keyIndex];
      id v14 = [(IDSSigningEncrypter *)self keyDiversifier];
      id v11 = [v12 signData:v8 usingApplicationKeyIndex:v13 diversifier:v14 error:a5];

      goto LABEL_9;
    }
    if (a5)
    {
      +[NSError errorWithDomain:IDSSigningErrorDomain code:5 userInfo:0];
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else if (!v9)
  {
    id v10 = [(IDSSigningEncrypter *)self fullDeviceIdentitySigner];
    id v11 = [v10 signData:v8 withSignatureType:a4 error:a5];

    goto LABEL_9;
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (unsigned)keyType
{
  return self->_keyType;
}

- (IDSSigningKeyDiversifier)keyDiversifier
{
  return self->_keyDiversifier;
}

- (NSString)service
{
  return self->_service;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (unsigned)keyIndex
{
  return self->_keyIndex;
}

- (IDSMPFullDeviceIdentitySigner)fullDeviceIdentitySigner
{
  return self->_fullDeviceIdentitySigner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullDeviceIdentitySigner, 0);
  objc_storeStrong((id *)&self->_serviceController, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_keyDiversifier, 0);
}

@end