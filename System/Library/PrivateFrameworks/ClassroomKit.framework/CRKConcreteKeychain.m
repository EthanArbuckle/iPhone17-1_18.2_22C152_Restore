@interface CRKConcreteKeychain
+ (CRKConcreteKeychain)defaultKeychain;
- (CRKConcreteKeychain)initWithBaseQueryAttributes:(id)a3;
- (NSDictionary)baseQueryAttributes;
- (NSString)description;
- (id)addCertificate:(id)a3 toAccessGroup:(id)a4;
- (id)addIdentity:(id)a3 toAccessGroup:(id)a4;
- (id)addItem:(void *)a3 toAccessGroup:(id)a4;
- (id)addPrivateKey:(id)a3 toAccessGroup:(id)a4;
- (id)certificateWithPersistentID:(id)a3;
- (id)identityWithPersistentID:(id)a3;
- (id)makeCertificateWithData:(id)a3;
- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4;
- (id)makeIdentityWithConfiguration:(id)a3;
- (id)makeItemWithPersistentID:(id)a3 itemClass:(id)a4 creationBlock:(id)a5;
- (id)makePasswordFacade;
- (id)makePrivateKeyWithData:(id)a3;
- (id)passwordForService:(id)a3;
- (id)privateKeyWithPersistentID:(id)a3;
- (void)copyItemWithPersistentID:(id)a3 itemClass:(id)a4;
- (void)removeItemWithPersistentID:(id)a3;
- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5;
@end

@implementation CRKConcreteKeychain

+ (CRKConcreteKeychain)defaultKeychain
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F17590];
  v7[0] = *MEMORY[0x263EFFB40];
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = (void *)[objc_alloc((Class)a1) initWithBaseQueryAttributes:v3];

  return (CRKConcreteKeychain *)v4;
}

- (CRKConcreteKeychain)initWithBaseQueryAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteKeychain;
  v5 = [(CRKConcreteKeychain *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    baseQueryAttributes = v5->_baseQueryAttributes;
    v5->_baseQueryAttributes = (NSDictionary *)v6;
  }
  return v5;
}

- (id)addCertificate:(id)a3 toAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", [v6 underlyingCertificate], v7);

  return v8;
}

- (id)addIdentity:(id)a3 toAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", [v6 underlyingIdentity], v7);

  return v8;
}

- (id)addPrivateKey:(id)a3 toAccessGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[CRKConcreteKeychain addItem:toAccessGroup:](self, "addItem:toAccessGroup:", [v6 underlyingPrivateKey], v7);

  return v8;
}

- (void)setPassword:(id)a3 forService:(id)a4 accessGroup:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CRKConcreteKeychain *)self makePasswordFacade];
  [v11 setPassword:v10 forService:v9 accessGroup:v8];
}

- (id)certificateWithPersistentID:(id)a3
{
  return [(CRKConcreteKeychain *)self makeItemWithPersistentID:a3 itemClass:*MEMORY[0x263F171C0] creationBlock:&__block_literal_global_25];
}

CRKConcreteCertificate *__51__CRKConcreteKeychain_certificateWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [[CRKConcreteCertificate alloc] initWithCertificate:a2];

  return v2;
}

- (id)identityWithPersistentID:(id)a3
{
  return [(CRKConcreteKeychain *)self makeItemWithPersistentID:a3 itemClass:*MEMORY[0x263F171D0] creationBlock:&__block_literal_global_3_1];
}

CRKConcreteIdentity *__48__CRKConcreteKeychain_identityWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [[CRKConcreteIdentity alloc] initWithIdentity:a2];

  return v2;
}

- (id)privateKeyWithPersistentID:(id)a3
{
  return [(CRKConcreteKeychain *)self makeItemWithPersistentID:a3 itemClass:*MEMORY[0x263F171E0] creationBlock:&__block_literal_global_6_1];
}

CRKConcretePrivateKey *__50__CRKConcreteKeychain_privateKeyWithPersistentID___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [[CRKConcretePrivateKey alloc] initWithPrivateKey:a2];

  return v2;
}

- (id)passwordForService:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteKeychain *)self makePasswordFacade];
  id v6 = [v5 passwordForService:v4];

  return v6;
}

- (id)makeIdentityWithCertificate:(id)a3 privateKey:(id)a4
{
  return +[CRKConcreteIdentity identityWithCertificate:a3 privateKey:a4];
}

- (id)makeIdentityWithConfiguration:(id)a3
{
  return +[CRKConcreteIdentity identityWithConfiguration:a3];
}

- (id)makeCertificateWithData:(id)a3
{
  return +[CRKConcreteCertificate certificateWithData:a3];
}

- (id)makePrivateKeyWithData:(id)a3
{
  return +[CRKConcretePrivateKey privateKeyWithData:a3];
}

- (void)removeItemWithPersistentID:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CRKConcreteKeychain *)self baseQueryAttributes];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v11 = *MEMORY[0x263F175B0];
  v12[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v6 addEntriesFromDictionary:v7];

  OSStatus v8 = SecItemDelete((CFDictionaryRef)v6);
  if (v8 != -25300 && v8)
  {
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v8 userInfo:0];
    id v10 = _CRKLogGeneral_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteKeychain removeItemWithPersistentID:]((uint64_t)v4, v9);
    }
  }
}

- (id)makePasswordFacade
{
  v3 = [CRKKeychainPasswordFacade alloc];
  id v4 = [(CRKConcreteKeychain *)self baseQueryAttributes];
  v5 = [(CRKKeychainPasswordFacade *)v3 initWithBaseQueryAttributes:v4];

  return v5;
}

- (void)copyItemWithPersistentID:(id)a3 itemClass:(id)a4
{
  v20[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = [(CRKConcreteKeychain *)self baseQueryAttributes];
  id v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = *MEMORY[0x263F17530];
  v19[0] = *MEMORY[0x263F175B0];
  v19[1] = v10;
  uint64_t v11 = *MEMORY[0x263EFFB40];
  v20[0] = v6;
  v20[1] = v11;
  v19[2] = *MEMORY[0x263F171B8];
  v20[2] = v7;
  v12 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v9 addEntriesFromDictionary:v12];

  CFTypeRef v18 = 0;
  OSStatus v13 = SecItemCopyMatching((CFDictionaryRef)v9, &v18);
  if (v13)
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v13 userInfo:0];
    v15 = _CRKLogGeneral_1();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteKeychain copyItemWithPersistentID:itemClass:]((uint64_t)v6, v14);
    }

    CFTypeRef v16 = 0;
  }
  else
  {
    CFTypeRef v16 = v18;
  }

  return (void *)v16;
}

- (id)makeItemWithPersistentID:(id)a3 itemClass:(id)a4 creationBlock:(id)a5
{
  OSStatus v8 = (void (**)(id, void *))a5;
  id v9 = [(CRKConcreteKeychain *)self copyItemWithPersistentID:a3 itemClass:a4];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v8[2](v8, v9);
    CFRelease(v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)addItem:(void *)a3 toAccessGroup:(id)a4
{
  v27[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(CRKConcreteKeychain *)self baseQueryAttributes];
  OSStatus v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = *MEMORY[0x263F17528];
  v26[0] = *MEMORY[0x263F175B8];
  v26[1] = v9;
  uint64_t v10 = *MEMORY[0x263EFFB40];
  v27[0] = a3;
  v27[1] = v10;
  v26[2] = *MEMORY[0x263F16E90];
  v27[2] = *MEMORY[0x263F16EA8];
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
  [v8 addEntriesFromDictionary:v11];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F16E80]];
  CFTypeRef result = 0;
  uint64_t v12 = SecItemAdd((CFDictionaryRef)v8, &result);
  OSStatus v13 = (void *)result;
  if (v12 == -25299)
  {
    uint64_t v14 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
    CFTypeRef v15 = result;

    OSStatus v13 = (void *)v15;
    if (!v14) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v14 = v12;
    if (!v12) {
      goto LABEL_8;
    }
  }
  CFTypeRef v16 = _CRKLogGeneral_1();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    CFTypeRef v18 = [NSNumber numberWithInt:v14];
    *(_DWORD *)buf = 138543874;
    v21 = a3;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    v25 = v18;
    _os_log_error_impl(&dword_224C00000, v16, OS_LOG_TYPE_ERROR, "Could not add item %{public}@ to group %{public}@: %{public}@", buf, 0x20u);
  }
LABEL_8:

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKConcreteKeychain *)self baseQueryAttributes];
  id v6 = [v3 stringWithFormat:@"<%@: %p { baseQueryAtrributes = %@ }>", v4, self, v5];

  return (NSString *)v6;
}

- (NSDictionary)baseQueryAttributes
{
  return self->_baseQueryAttributes;
}

- (void).cxx_destruct
{
}

- (void)removeItemWithPersistentID:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v3, v4, "Could not remove keychain item with persistentID %@. Error (ignored): %{public}@.", v5, v6, v7, v8, v9);
}

- (void)copyItemWithPersistentID:(uint64_t)a1 itemClass:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 verboseDescription];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224C00000, v3, v4, "Cannot retrieve item with persistentID %@: Error: %{public}@", v5, v6, v7, v8, v9);
}

@end