@interface _LAKeyStoreKeyNull
- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3;
- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3;
- (NSData)acl;
- (NSData)publicKeyHash;
- (NSString)identifier;
- (_LAKeyStoreKeyNull)init;
- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6;
- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5;
- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7;
- (void)exportBytesWithCompletion:(id)a3;
- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6;
- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6;
@end

@implementation _LAKeyStoreKeyNull

- (_LAKeyStoreKeyNull)init
{
  v10.receiver = self;
  v10.super_class = (Class)_LAKeyStoreKeyNull;
  v2 = [(_LAKeyStoreKeyNull *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    uint64_t v6 = +[LASecAccessControl serializeACL:](LASecAccessControl, "serializeACL:", +[LASecAccessControl denyAllACL]);
    acl = v2->_acl;
    v2->_acl = (NSData *)v6;

    publicKeyHash = v2->_publicKeyHash;
    v2->_publicKeyHash = (NSString *)&stru_1F19E1C60;
  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)acl
{
  return self->_acl;
}

- (NSData)publicKeyHash
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);

  return (NSData *)v2;
}

- (void)exportBytesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (void)signData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (BOOL)canSignUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)decryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 context:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (BOOL)canDecryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)exchangeKeysWithPublicKey:(id)a3 secKeyAlgorithm:(__CFString *)a4 secKeyParameters:(id)a5 context:(id)a6 completion:(id)a7
{
  id v8 = a7;
  id v9 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a7 + 2))(v8, 0, v9);
}

- (BOOL)canExchangeKeysUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)encryptData:(id)a3 secKeyAlgorithm:(__CFString *)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (BOOL)canEncryptUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void)verifyData:(id)a3 signature:(id)a4 secKeyAlgorithm:(__CFString *)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = +[LAAuthorizationError resourceNotFound];
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (BOOL)canVerifyUsingSecKeyAlgorithm:(__CFString *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_acl, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end