@interface IDSMessageHashChecker
- (BOOL)allowMessageData:(id)a3;
- (BOOL)allowMessageData:(id)a3 withDelayedCommitBlock:(id *)a4;
- (BOOL)usePairingKey;
- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3;
- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3 messageHashStore:(id)a4 usePairingKey:(BOOL)a5;
- (IDSMessageHashStore)messageHashStore;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)_legacyIdentity;
- (void)setMessageHashStore:(id)a3;
- (void)setUsePairingKey:(BOOL)a3;
@end

@implementation IDSMessageHashChecker

- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3
{
  id v4 = a3;
  v5 = +[IDSMessageHashStore sharedInstance];
  v6 = [(IDSMessageHashChecker *)self initWithRegistrationKeyManager:v4 messageHashStore:v5 usePairingKey:1];

  return v6;
}

- (IDSMessageHashChecker)initWithRegistrationKeyManager:(id)a3 messageHashStore:(id)a4 usePairingKey:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSMessageHashChecker;
  v11 = [(IDSMessageHashChecker *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_registrationKeyManager, a3);
    objc_storeStrong((id *)&v12->_messageHashStore, a4);
    v12->_usePairingKey = a5;
  }

  return v12;
}

- (BOOL)allowMessageData:(id)a3
{
  id v4 = a3;
  v5 = [(IDSMessageHashChecker *)self _legacyIdentity];
  v6 = v5;
  BOOL v7 = 0;
  if (v4 && v5)
  {
    id v13 = 0;
    v8 = [v5 protectedHashOfMessageData:v4 error:&v13];
    id v9 = v13;
    if (v8)
    {
      unsigned int v10 = [(IDSMessageHashStore *)self->_messageHashStore containsMessageHash:v8];
      messageHashStore = self->_messageHashStore;
      if (!v10)
      {
        [(IDSMessageHashStore *)messageHashStore addMessageHash:v8];
        BOOL v7 = 1;
        goto LABEL_8;
      }
      [(IDSMessageHashStore *)messageHashStore updateCreationDateForHash:v8];
    }
    BOOL v7 = 0;
LABEL_8:
  }
  return v7;
}

- (BOOL)allowMessageData:(id)a3 withDelayedCommitBlock:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(IDSMessageHashChecker *)self _legacyIdentity];
  v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    id v15 = 0;
    unsigned int v10 = [v7 protectedHashOfMessageData:v6 error:&v15];
    id v11 = v15;
    if (v10)
    {
      if (![(IDSMessageHashStore *)self->_messageHashStore containsMessageHash:v10])
      {
        if (a4)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_10013A9F0;
          v13[3] = &unk_100983670;
          v13[4] = self;
          id v14 = v10;
          *a4 = objc_retainBlock(v13);
        }
        else
        {
          [(IDSMessageHashStore *)self->_messageHashStore addMessageHash:v10];
        }
        BOOL v9 = 1;
        goto LABEL_11;
      }
      [(IDSMessageHashStore *)self->_messageHashStore updateCreationDateForHash:v10];
    }
    BOOL v9 = 0;
LABEL_11:
  }
  return v9;
}

- (id)_legacyIdentity
{
  BOOL usePairingKey = self->_usePairingKey;
  registrationKeyManager = self->_registrationKeyManager;
  if (usePairingKey)
  {
    id v4 = [(IDSRegistrationKeyManager *)registrationKeyManager latestMessageProtectionFullIdentityForDataProtectionClass:2];
  }
  else
  {
    v5 = [(IDSRegistrationKeyManager *)registrationKeyManager fullDeviceIdentityContainer];
    id v4 = [v5 legacyFullIdentity];
  }

  return v4;
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (BOOL)usePairingKey
{
  return self->_usePairingKey;
}

- (void)setUsePairingKey:(BOOL)a3
{
  self->_BOOL usePairingKey = a3;
}

- (IDSMessageHashStore)messageHashStore
{
  return self->_messageHashStore;
}

- (void)setMessageHashStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHashStore, 0);

  objc_storeStrong((id *)&self->_registrationKeyManager, 0);
}

@end