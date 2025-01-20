@interface IDSHashingDeviceIdentityEncrypter
- (IDSHashingDeviceIdentityEncrypter)initWithDeviceIdentityContainerEncrypter:(id)a3 messageHashChecker:(id)a4;
- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter;
- (IDSMessageHashChecker)messageHashChecker;
- (id)_checkMessageHashForData:(id)a3 identifier:(id)a4 isRetry:(BOOL)a5 delayedCommitBlock:(id *)a6;
- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7;
- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 usingIdentifier:(id)a5 isRetry:(BOOL)a6;
- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11;
- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6;
@end

@implementation IDSHashingDeviceIdentityEncrypter

- (IDSHashingDeviceIdentityEncrypter)initWithDeviceIdentityContainerEncrypter:(id)a3 messageHashChecker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSHashingDeviceIdentityEncrypter;
  v9 = [(IDSHashingDeviceIdentityEncrypter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fullDeviceIdentityContainerEncrypter, a3);
    objc_storeStrong((id *)&v10->_messageHashChecker, a4);
  }

  return v10;
}

- (id)legacyEncryptData:(id)a3 withEncryptedAttributes:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  return [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter legacyEncryptData:a3 withEncryptedAttributes:a4 withPublicDeviceIdentityContainer:a5 error:a6];
}

- (id)encryptData:(id)a3 encryptionContext:(id)a4 forceSizeOptimizations:(BOOL)a5 resetState:(BOOL)a6 withEncryptedAttributes:(id)a7 withPublicDeviceIdentityContainer:(id)a8 usedIdentifier:(id *)a9 metadata:(id *)a10 error:(id *)a11
{
  return -[IDSMPFullDeviceIdentityContainerEncrypter encryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttributes:withPublicDeviceIdentityContainer:usedIdentifier:metadata:error:](self->_fullDeviceIdentityContainerEncrypter, "encryptData:encryptionContext:forceSizeOptimizations:resetState:withEncryptedAttributes:withPublicDeviceIdentityContainer:usedIdentifier:metadata:error:", a3, a4, a5, a6, a7, a8);
}

- (id)offGridKeyDistributionEncryptData:(id)a3 encryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 error:(id *)a6
{
  return [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter offGridKeyDistributionEncryptData:a3 encryptionContext:a4 withPublicDeviceIdentityContainer:a5 error:a6];
}

- (id)_checkMessageHashForData:(id)a3 identifier:(id)a4 isRetry:(BOOL)a5 delayedCommitBlock:(id *)a6
{
  id v10 = a3;
  if ([a4 isEqualToString:IDSMPLegacyIdentityIdentifier])
  {
    unsigned __int8 v11 = [(IDSMessageHashChecker *)self->_messageHashChecker allowMessageData:v10 withDelayedCommitBlock:a6];
    objc_super v12 = 0;
    if ((v11 & 1) == 0 && !a5)
    {
      objc_super v12 = +[NSError errorWithDomain:IDSDecryptionErrorDomain code:5 userInfo:0];
    }
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 error:(id *)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = [(IDSHashingDeviceIdentityEncrypter *)self _checkMessageHashForData:v12 identifier:v14 isRetry:v7 delayedCommitBlock:0];
  v16 = v15;
  if (a5 && v15)
  {
    v17 = 0;
    *a5 = v15;
  }
  else
  {
    v17 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter decryptData:v12 withPublicDeviceIdentityContainer:v13 error:a5 usingIdentifier:v14 isRetry:v7];
  }

  return v17;
}

- (id)decryptData:(id)a3 withPublicDeviceIdentityContainer:(id)a4 usingIdentifier:(id)a5 isRetry:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  id v13 = [(IDSHashingDeviceIdentityEncrypter *)self _checkMessageHashForData:v10 identifier:v12 isRetry:v6 delayedCommitBlock:&v20];
  id v14 = v20;
  if (v13)
  {
    id v15 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
    [v15 failWithError:v13];
    v16 = [v15 promise];
  }
  else
  {
    id v15 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter decryptData:v10 decryptionContext:0 withPublicDeviceIdentityContainer:v11 usingIdentifier:v12 isRetry:v6];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000D11FC;
    v18[3] = &unk_100981790;
    id v19 = v14;
    v16 = [v15 then:v18];
  }

  return v16;
}

- (id)decryptData:(id)a3 decryptionContext:(id)a4 withPublicDeviceIdentityContainer:(id)a5 usingIdentifier:(id)a6 isRetry:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v23 = 0;
  v16 = [(IDSHashingDeviceIdentityEncrypter *)self _checkMessageHashForData:v12 identifier:v15 isRetry:v7 delayedCommitBlock:&v23];
  id v17 = v23;
  if (v16)
  {
    id v18 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
    [v18 failWithError:v16];
    id v19 = [v18 promise];
  }
  else
  {
    id v18 = [(IDSMPFullDeviceIdentityContainerEncrypter *)self->_fullDeviceIdentityContainerEncrypter decryptData:v12 decryptionContext:v13 withPublicDeviceIdentityContainer:v14 usingIdentifier:v15 isRetry:v7];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000D14A4;
    v21[3] = &unk_100981790;
    id v22 = v17;
    id v19 = [v18 then:v21];
  }

  return v19;
}

- (IDSMPFullDeviceIdentityContainerEncrypter)fullDeviceIdentityContainerEncrypter
{
  return self->_fullDeviceIdentityContainerEncrypter;
}

- (IDSMessageHashChecker)messageHashChecker
{
  return self->_messageHashChecker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHashChecker, 0);

  objc_storeStrong((id *)&self->_fullDeviceIdentityContainerEncrypter, 0);
}

@end