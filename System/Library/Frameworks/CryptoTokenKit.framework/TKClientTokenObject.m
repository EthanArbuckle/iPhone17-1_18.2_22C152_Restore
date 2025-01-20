@interface TKClientTokenObject
- (BOOL)bumpKeyWithError:(id *)a3;
- (BOOL)commitKeyWithError:(id *)a3;
- (BOOL)deleteWithError:(id *)a3;
- (NSData)accessControl;
- (NSData)objectID;
- (NSData)publicKey;
- (NSData)value;
- (NSDictionary)keychainAttributes;
- (TKClientTokenObject)initWithSession:(id)a3 objectID:(id)a4 attributes:(id)a5;
- (TKClientTokenSession)session;
- (__SecAccessControl)accessControlRef;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)attestKeyObject:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)decapsulate:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)decrypt:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)exchangeKey:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (id)operationResult:(id)a3 error:(id *)a4;
- (id)sign:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (void)accessControlRef;
@end

@implementation TKClientTokenObject

- (TKClientTokenSession)session
{
  return self->_session;
}

- (__SecAccessControl)accessControlRef
{
  if (!self->_accessControlRef)
  {
    v3 = [(TKClientTokenObject *)self accessControl];

    if (v3)
    {
      id v9 = 0;
      v4 = [(TKClientTokenObject *)self accessControl];
      v5 = (void *)SecAccessControlCreateFromData();
      id accessControlRef = self->_accessControlRef;
      self->_id accessControlRef = v5;

      if (!self->_accessControlRef)
      {
        v7 = TK_LOG_client_0();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          [(TKClientTokenObject *)(uint64_t *)&v9 accessControlRef];
        }
      }
    }
  }
  return (__SecAccessControl *)self->_accessControlRef;
}

- (TKClientTokenObject)initWithSession:(id)a3 objectID:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TKClientTokenObject;
  v12 = [(TKClientTokenObject *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_objectID, a4);
    uint64_t v14 = [v11 objectForKeyedSubscript:@"pubk"];
    publicKey = v13->_publicKey;
    v13->_publicKey = (NSData *)v14;

    uint64_t v16 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3B548]];
    accessControl = v13->_accessControl;
    v13->_accessControl = (NSData *)v16;

    uint64_t v18 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    value = v13->_value;
    v13->_value = (NSData *)v18;

    v20 = (NSDictionary *)[v11 mutableCopy];
    [(NSDictionary *)v20 removeObjectForKey:@"pubk"];
    keychainAttributes = v13->_keychainAttributes;
    v13->_keychainAttributes = v20;
  }
  return v13;
}

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CryptoTokenKit", -1, MEMORY[0x1E4F1CC08], a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)operationResult:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 isEqual:MEMORY[0x1E4F1CC38]])
  {
    id v8 = [MEMORY[0x1E4F1C9B8] data];
LABEL_10:
    id v11 = v8;
    goto LABEL_11;
  }
  id v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v7 isEqual:v9];

  if (!v10)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"TKClientToken.m", 275, @"Unexpected result: %@", v7 object file lineNumber description];
      }
    }
    id v8 = v7;
    goto LABEL_10;
  }
  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_11:

  return v11;
}

- (id)sign:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = [(TKClientTokenObject *)self operation:2 data:a3 algorithms:a4 parameters:a5 error:a6];
  id v9 = [(TKClientTokenObject *)self operationResult:v8 error:a6];

  return v9;
}

- (id)decrypt:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = [(TKClientTokenObject *)self operation:3 data:a3 algorithms:a4 parameters:a5 error:a6];
  id v9 = [(TKClientTokenObject *)self operationResult:v8 error:a6];

  return v9;
}

- (id)exchangeKey:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = [(TKClientTokenObject *)self operation:4 data:a3 algorithms:a4 parameters:a5 error:a6];
  id v9 = [(TKClientTokenObject *)self operationResult:v8 error:a6];

  return v9;
}

- (id)decapsulate:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = [(TKClientTokenObject *)self operation:1003 data:a3 algorithms:a4 parameters:a5 error:a6];
  id v9 = [(TKClientTokenObject *)self operationResult:v8 error:a6];

  return v9;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a4)
  {
    v15 = @"nonce";
    v16[0] = a4;
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    id v10 = a4;
    id v11 = [v9 dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  v12 = [(TKClientTokenObject *)self operation:1000 data:v8 algorithms:MEMORY[0x1E4F1CBF0] parameters:v11 error:a5];
  v13 = [(TKClientTokenObject *)self operationResult:v12 error:a5];

  return v13;
}

- (id)attestKeyObject:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v21 = @"attesteeSystemSession";
  id v10 = NSNumber;
  id v11 = [v8 session];
  v12 = [v11 parameters];
  v13 = [v12 objectForKeyedSubscript:@"forceSystemSession"];
  uint64_t v14 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  v22[0] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (v9) {
    [v16 setObject:v9 forKeyedSubscript:@"nonce"];
  }
  v17 = [v8 objectID];
  uint64_t v18 = [(TKClientTokenObject *)self operation:1000 data:v17 algorithms:MEMORY[0x1E4F1CBF0] parameters:v16 error:a5];
  v19 = [(TKClientTokenObject *)self operationResult:v18 error:a5];

  return v19;
}

- (BOOL)bumpKeyWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F1C9B8] data];
  v6 = [(TKClientTokenObject *)self operation:1001 data:v5 algorithms:MEMORY[0x1E4F1CBF0] parameters:MEMORY[0x1E4F1CC08] error:a3];
  id v7 = [(TKClientTokenObject *)self operationResult:v6 error:a3];
  LOBYTE(a3) = v7 != 0;

  return (char)a3;
}

- (BOOL)commitKeyWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F1C9B8] data];
  v6 = [(TKClientTokenObject *)self operation:1002 data:v5 algorithms:MEMORY[0x1E4F1CBF0] parameters:MEMORY[0x1E4F1CC08] error:a3];
  id v7 = [(TKClientTokenObject *)self operationResult:v6 error:a3];
  LOBYTE(a3) = v7 != 0;

  return (char)a3;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x1E4F1CC08]];
  }
  return 0;
}

- (NSData)objectID
{
  return self->_objectID;
}

- (NSData)accessControl
{
  return self->_accessControl;
}

- (NSData)value
{
  return self->_value;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAttributes, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_accessControl, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong(&self->_accessControlRef, 0);
}

- (void)accessControlRef
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  v5 = [a2 accessControl];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "Failed to create AC from data: %{public}@ (AC data: %{public}@)", (uint8_t *)&v6, 0x16u);
}

@end