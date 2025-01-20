@interface TKClientTokenAdvertisedItem
- (NSData)objectID;
- (NSDictionary)keychainAttributes;
- (NSString)localizedName;
- (TKClientTokenAdvertisedItem)initWithSession:(id)a3 keychainAttributes:(id)a4 secRef:(id)a5;
- (TKClientTokenSession)session;
- (__SecCertificate)certificateRef;
- (__SecIdentity)identityRef;
- (__SecKey)keyRef;
- (id)keychainClass;
- (unint64_t)keyUsage;
- (void)certificateRef;
- (void)keyRef;
@end

@implementation TKClientTokenAdvertisedItem

- (TKClientTokenAdvertisedItem)initWithSession:(id)a3 keychainAttributes:(id)a4 secRef:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TKClientTokenAdvertisedItem;
  v12 = [(TKClientTokenAdvertisedItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_keychainAttributes, a4);
    objc_storeStrong(&v13->_secRef, a5);
  }

  return v13;
}

- (NSData)objectID
{
  v2 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F3B8B0]];

  return (NSData *)v3;
}

- (NSString)localizedName
{
  v2 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];

  return (NSString *)v3;
}

- (id)keychainClass
{
  v2 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];

  return v3;
}

- (unint64_t)keyUsage
{
  v2 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
  v3 = [v2 objectForKeyedSubscript:@"keyUsage"];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (__SecKey)keyRef
{
  v3 = [(TKClientTokenAdvertisedItem *)self keychainClass];
  int v4 = [v3 isEqual:*MEMORY[0x1E4F3B9A0]];

  if (!v4) {
    return 0;
  }
  result = (__SecKey *)self->_secRef;
  if (!result)
  {
    v6 = [(TKClientTokenAdvertisedItem *)self session];
    v7 = [v6 token];
    v8 = [v7 tokenID];

    CFErrorRef error = 0;
    id v9 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
    id v10 = (void *)[v9 mutableCopy];

    id v11 = [(TKClientTokenAdvertisedItem *)self session];
    [v10 setObject:v11 forKeyedSubscript:@"u_TokenSession"];

    CFDataRef v12 = [MEMORY[0x1E4F1C9B8] data];
    SecKeyRef v13 = SecKeyCreateWithData(v12, (CFDictionaryRef)v10, &error);
    id secRef = self->_secRef;
    self->_id secRef = v13;

    if (!self->_secRef)
    {
      objc_super v15 = TK_LOG_client_0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[TKClientTokenAdvertisedItem keyRef]();
      }
    }
    return (__SecKey *)self->_secRef;
  }
  return result;
}

- (__SecCertificate)certificateRef
{
  v3 = [(TKClientTokenAdvertisedItem *)self keychainClass];
  int v4 = [v3 isEqual:*MEMORY[0x1E4F3B980]];

  if (!v4) {
    return 0;
  }
  result = (__SecCertificate *)self->_secRef;
  if (!result)
  {
    v6 = [(TKClientTokenAdvertisedItem *)self keychainAttributes];
    CFDataRef v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];

    SecCertificateRef v8 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
    id secRef = self->_secRef;
    self->_id secRef = v8;

    if (!self->_secRef)
    {
      id v10 = [(TKClientTokenAdvertisedItem *)self session];
      id v11 = [v10 token];
      CFDataRef v12 = [v11 tokenID];

      SecKeyRef v13 = TK_LOG_client_0();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        [(TKClientTokenAdvertisedItem *)(uint64_t)v12 certificateRef];
      }
    }
    return (__SecCertificate *)self->_secRef;
  }
  return result;
}

- (__SecIdentity)identityRef
{
  v3 = [(TKClientTokenAdvertisedItem *)self keychainClass];
  int v4 = [v3 isEqual:*MEMORY[0x1E4F3B990]];

  if (v4) {
    return (__SecIdentity *)self->_secRef;
  }
  else {
    return 0;
  }
}

- (TKClientTokenSession)session
{
  return self->_session;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainAttributes, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong(&self->_secRef, 0);
}

- (void)keyRef
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1_2(&dword_1BED55000, v0, v1, "Failed to create key from advertised item of token %{public}@, error: %{public}@");
}

- (void)certificateRef
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1BED55000, a2, a3, "Failed to create certificate from advertised item of token %{public}@, data: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end