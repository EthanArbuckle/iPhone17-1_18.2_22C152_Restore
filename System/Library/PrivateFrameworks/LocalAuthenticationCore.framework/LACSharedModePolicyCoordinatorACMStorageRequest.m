@interface LACSharedModePolicyCoordinatorACMStorageRequest
- (BOOL)isEqual:(id)a3;
- (LACSharedModePolicyCoordinatorACMStorageRequest)initWithKey:(int64_t)a3 BOOLValue:(BOOL)a4;
- (LACXPCClient)client;
- (NSData)acl;
- (NSData)value;
- (NSUUID)contextID;
- (int64_t)domain;
- (int64_t)key;
- (unsigned)identifier;
- (void)setAcl:(id)a3;
- (void)setClient:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setKey:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation LACSharedModePolicyCoordinatorACMStorageRequest

- (unsigned)identifier
{
  return self->_identifier;
}

- (int64_t)key
{
  return self->_key;
}

- (LACSharedModePolicyCoordinatorACMStorageRequest)initWithKey:(int64_t)a3 BOOLValue:(BOOL)a4
{
  BOOL v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACSharedModePolicyCoordinatorACMStorageRequest;
  v5 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)&v17 init];
  v6 = v5;
  if (v5)
  {
    v5->_domain = 0;
    v5->_key = a3;
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v18 length:1];
    value = v6->_value;
    v6->_value = (NSData *)v7;

    acl = v6->_acl;
    v6->_acl = 0;

    v10 = [LACXPCClient alloc];
    v11 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v12 = [(LACXPCClient *)v10 initWithConnection:v11];
    client = v6->_client;
    v6->_client = (LACXPCClient *)v12;

    contextID = v6->_contextID;
    v6->_contextID = 0;

    int v15 = identifierCounter++;
    v6->_identifier = v15;
  }
  return v6;
}

- (NSData)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self identifier];
    if (v6 != [v5 identifier]) {
      goto LABEL_12;
    }
    int64_t v7 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self key];
    if (v7 != [v5 key]) {
      goto LABEL_12;
    }
    int64_t v8 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self domain];
    if (v8 != [v5 domain]) {
      goto LABEL_12;
    }
    v9 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self acl];
    uint64_t v10 = [v5 acl];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      uint64_t v12 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self acl];
      v13 = [v5 acl];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_12;
      }
    }
    v16 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self contextID];
    uint64_t v17 = [v5 contextID];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      BOOL v18 = (void *)v17;
      v19 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self contextID];
      v20 = [v5 contextID];
      int v21 = [v19 isEqual:v20];

      if (!v21)
      {
LABEL_12:
        char v15 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    v23 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self value];
    uint64_t v24 = [v5 value];
    if (v23 == (void *)v24)
    {
      char v15 = 1;
      v25 = v23;
    }
    else
    {
      v25 = (void *)v24;
      v26 = [(LACSharedModePolicyCoordinatorACMStorageRequest *)self value];
      v27 = [v5 value];
      char v15 = [v26 isEqual:v27];
    }
    goto LABEL_13;
  }
  char v15 = 0;
LABEL_14:

  return v15;
}

- (void)setValue:(id)a3
{
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (NSData)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
}

- (LACXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void)setContextID:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

@end