@interface HKTokenKeychainItem
+ (BOOL)_addTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6;
+ (BOOL)_deleteTokenIdentifiedByName:(id)a3 error:(id *)a4;
+ (BOOL)_isTokenPresentIdentifiedByName:(id)a3 error:(id *)a4;
+ (BOOL)_makeTokenSynchronizableIfNeededIdentifiedByName:(id)a3 error:(id *)a4;
+ (BOOL)_storeTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6;
+ (BOOL)_updateTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6;
+ (id)_fetchTokenIdentifiedByName:(id)a3 error:(id *)a4;
+ (id)_identifyingAttributesForKeyIdentifiedByName:(id)a3;
+ (id)_keyQueryAttributesForKeyIdentifiedByName:(id)a3;
+ (id)_storableAttributesForKeyIdentifiedByName:(id)a3 data:(id)a4 modificationDate:(id)a5 synchronizable:(BOOL)a6;
+ (id)tokenKeychainItemSecurityClass;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)isPresentWithError:(id *)a3;
- (BOOL)makeTokenSynchronizableIfNeededWithError:(id *)a3;
- (BOOL)storeLocalToken:(id)a3 error:(id *)a4;
- (BOOL)storeSynchronizableToken:(id)a3 error:(id *)a4;
- (HKTokenKeychainItem)init;
- (HKTokenKeychainItem)initWithName:(id)a3;
- (NSString)name;
- (id)fetchWithError:(id *)a3;
@end

@implementation HKTokenKeychainItem

- (HKTokenKeychainItem)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKTokenKeychainItem)initWithName:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HKTokenKeychainItem.m", 20, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HKTokenKeychainItem;
  v6 = [(HKTokenKeychainItem *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;
  }
  return v6;
}

- (BOOL)isPresentWithError:(id *)a3
{
  id v5 = objc_opt_class();
  name = self->_name;

  return [v5 _isTokenPresentIdentifiedByName:name error:a3];
}

- (BOOL)makeTokenSynchronizableIfNeededWithError:(id *)a3
{
  id v5 = objc_opt_class();
  name = self->_name;

  return [v5 _makeTokenSynchronizableIfNeededIdentifiedByName:name error:a3];
}

- (id)fetchWithError:(id *)a3
{
  v3 = [(id)objc_opt_class() _fetchTokenIdentifiedByName:self->_name error:a3];
  if (v3) {
    uint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)storeLocalToken:(id)a3 error:(id *)a4
{
  v6 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(id)objc_opt_class() _storeTokenIdentifiedByName:self->_name data:v6 synchronizable:0 error:a4];

  return (char)a4;
}

- (BOOL)storeSynchronizableToken:(id)a3 error:(id *)a4
{
  v6 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(id)objc_opt_class() _storeTokenIdentifiedByName:self->_name data:v6 synchronizable:1 error:a4];

  return (char)a4;
}

- (BOOL)deleteWithError:(id *)a3
{
  id v5 = objc_opt_class();
  name = self->_name;

  return [v5 _deleteTokenIdentifiedByName:name error:a3];
}

+ (id)tokenKeychainItemSecurityClass
{
  return (id)*MEMORY[0x263F171D8];
}

+ (id)_identifyingAttributesForKeyIdentifiedByName:(id)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"HKTokenKeychainItem.m", 64, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v14[0] = *MEMORY[0x263F171B8];
  v6 = [a1 tokenKeychainItemSecurityClass];
  v15[0] = v6;
  v14[1] = *MEMORY[0x263F16ED8];
  uint64_t v7 = [v5 dataUsingEncoding:4];
  uint64_t v8 = *MEMORY[0x263F16E90];
  uint64_t v9 = *MEMORY[0x263F16EC8];
  v15[1] = v7;
  v15[2] = v9;
  uint64_t v10 = *MEMORY[0x263F170B0];
  v14[2] = v8;
  v14[3] = v10;
  v15[3] = *MEMORY[0x263F170B8];
  objc_super v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v11;
}

+ (id)_keyQueryAttributesForKeyIdentifiedByName:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [a1 _identifyingAttributesForKeyIdentifiedByName:a3];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v7 = *MEMORY[0x263F17520];
  v8[0] = *MEMORY[0x263EFFB40];
  id v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

+ (id)_storableAttributesForKeyIdentifiedByName:(id)a3 data:(id)a4 modificationDate:(id)a5 synchronizable:(BOOL)a6
{
  BOOL v6 = a6;
  v30[5] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"HKTokenKeychainItem.m", 85, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"HKTokenKeychainItem.m", 86, @"Invalid parameter not satisfying: %@", @"date" object file lineNumber description];

LABEL_3:
  v15 = [a1 _identifyingAttributesForKeyIdentifiedByName:v11];
  v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = *MEMORY[0x263F16F38];
  uint64_t v18 = *MEMORY[0x263EFFB40];
  v30[0] = *MEMORY[0x263EFFB40];
  uint64_t v19 = *MEMORY[0x263F17008];
  v29[0] = v17;
  v29[1] = v19;
  v20 = v14;
  if (!v14)
  {
    v20 = [MEMORY[0x263EFF910] date];
  }
  uint64_t v21 = *MEMORY[0x263F17028];
  uint64_t v22 = *MEMORY[0x263F17030];
  v30[1] = v20;
  v30[2] = v22;
  uint64_t v23 = *MEMORY[0x263F170B0];
  v29[2] = v21;
  v29[3] = v23;
  uint64_t v24 = *MEMORY[0x263EFFB38];
  if (v6) {
    uint64_t v24 = v18;
  }
  v29[4] = *MEMORY[0x263F175A8];
  v30[3] = v24;
  v30[4] = v12;
  v25 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];
  [v16 addEntriesFromDictionary:v25];

  if (!v14) {

  }
  return v16;
}

+ (BOOL)_isTokenPresentIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = [a1 _identifyingAttributesForKeyIdentifiedByName:v6];
  uint64_t v8 = SecItemCopyMatching(v7, 0);
  if (v8 == -25308 || v8 == 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = v8;
    if (v8 != -25300)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      id v13 = HKSensitiveLogItem();
      objc_msgSend(v12, "hk_assignError:code:format:", a4, 3, @"Failed to check for presence of token with name %@, OSStatus: %d", v13, v11);
    }
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_makeTokenSynchronizableIfNeededIdentifiedByName:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFDictionaryRef v7 = [a1 _identifyingAttributesForKeyIdentifiedByName:v6];
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v25 = *MEMORY[0x263F17518];
  uint64_t v9 = *MEMORY[0x263EFFB40];
  v26[0] = *MEMORY[0x263EFFB40];
  BOOL v10 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v8 setValuesForKeysWithDictionary:v10];

  CFTypeRef result = 0;
  uint64_t v11 = SecItemCopyMatching((CFDictionaryRef)v8, &result);
  if (!v11)
  {
    uint64_t v12 = *MEMORY[0x263F170B0];
    id v13 = [(id)result objectForKeyedSubscript:*MEMORY[0x263F170B0]];
    char v14 = [v13 BOOLValue];

    if (v14) {
      goto LABEL_8;
    }
    uint64_t v23 = v12;
    uint64_t v24 = v9;
    uint64_t v11 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1]);
  }
  if (v11 == -25308)
  {
    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    v16 = HKSensitiveLogItem();
    objc_msgSend(v18, "hk_assignError:code:format:", a4, 6, @"Token is not accessible (device locked?), name: %@", v16, v21);
LABEL_11:

    BOOL v17 = 0;
    goto LABEL_12;
  }
  if (v11)
  {
    if (v11 == -25300)
    {
      v15 = (void *)MEMORY[0x263F087E8];
      v16 = HKSensitiveLogItem();
      objc_msgSend(v15, "hk_assignError:code:format:", a4, 118, @"No token found for name %@", v16, v21);
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      v16 = HKSensitiveLogItem();
      objc_msgSend(v19, "hk_assignError:code:format:", a4, 3, @"Failed to fetch token for name %@, OSStatus: %d", v16, v11);
    }
    goto LABEL_11;
  }
LABEL_8:
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

+ (id)_fetchTokenIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = [a1 _keyQueryAttributesForKeyIdentifiedByName:v6];
  CFTypeRef result = 0;
  uint64_t v8 = SecItemCopyMatching(v7, &result);
  if (v8 == -25308)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = HKSensitiveLogItem();
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 6, @"Token is not accessible (device locked?), name: %@", v12);
LABEL_7:

    goto LABEL_9;
  }
  uint64_t v9 = v8;
  if (v8 == -25300)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = HKSensitiveLogItem();
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 118, @"No token found for name %@", v12);
    goto LABEL_7;
  }
  if (!v8)
  {
    BOOL v10 = (void *)result;
    goto LABEL_10;
  }
  char v14 = (void *)MEMORY[0x263F087E8];
  v15 = HKSensitiveLogItem();
  objc_msgSend(v14, "hk_assignError:code:format:", a4, 3, @"Failed to fetch token for name %@, OSStatus: %d", v15, v9);

LABEL_9:
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

+ (BOOL)_storeTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ([v11 length])
  {
    char v12 = [a1 _updateTokenIdentifiedByName:v10 data:v11 synchronizable:v7 error:a6];
  }
  else
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    char v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = HKSensitiveLogItem();
    objc_msgSend(v13, "hk_assignError:code:format:", a6, 3, @"Cannot store %@ with an empty token for name %@", v15, v16);

    char v12 = 0;
  }

  return v12;
}

+ (BOOL)_updateTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v27[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  CFDictionaryRef v12 = [a1 _identifyingAttributesForKeyIdentifiedByName:v10];
  v26[0] = *MEMORY[0x263F17008];
  uint64_t v13 = [MEMORY[0x263EFF910] date];
  char v14 = (void *)v13;
  v15 = (uint64_t *)MEMORY[0x263EFFB40];
  if (!v7) {
    v15 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v16 = *MEMORY[0x263F170B0];
  uint64_t v17 = *v15;
  v27[0] = v13;
  v27[1] = v17;
  uint64_t v18 = *MEMORY[0x263F175A8];
  v26[1] = v16;
  void v26[2] = v18;
  v27[2] = v11;
  uint64_t v19 = SecItemUpdate(v12, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3]);

  if (v19 == -25308)
  {
    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = HKSensitiveLogItem();
    objc_msgSend(v21, "hk_assignError:code:format:", a6, 6, @"Token is not accessible (device locked?), name: %@", v22, v25);
LABEL_10:

    char v20 = 0;
    goto LABEL_11;
  }
  if (!v19)
  {
    char v20 = 1;
    goto LABEL_11;
  }
  if (v19 != -25300)
  {
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = HKSensitiveLogItem();
    objc_msgSend(v23, "hk_assignError:code:format:", a6, 3, @"Failed to update token for name %@, OSStatus: %d", v22, v19);
    goto LABEL_10;
  }
  char v20 = [a1 _addTokenIdentifiedByName:v10 data:v11 synchronizable:v7 error:a6];
LABEL_11:

  return v20;
}

+ (BOOL)_addTokenIdentifiedByName:(id)a3 data:(id)a4 synchronizable:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x263EFF910];
  id v12 = a4;
  uint64_t v13 = [v11 date];
  CFDictionaryRef v14 = [a1 _storableAttributesForKeyIdentifiedByName:v10 data:v12 modificationDate:v13 synchronizable:v7];

  uint64_t v15 = SecItemAdd(v14, 0);
  if (v15)
  {
    uint64_t v16 = v15;
    if (v15 == -25308)
    {
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = HKSensitiveLogItem();
      objc_msgSend(v17, "hk_assignError:code:format:", a6, 6, @"Token is not accessible (device locked?), name: %@", v18, v22);
    }
    else
    {
      char v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = HKSensitiveLogItem();
      objc_msgSend(v20, "hk_assignError:code:format:", a6, 3, @"Failed to add token for name %@, OSStatus: %d", v18, v16);
    }

    BOOL v19 = 0;
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

+ (BOOL)_deleteTokenIdentifiedByName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  CFDictionaryRef v7 = [a1 _keyQueryAttributesForKeyIdentifiedByName:v6];
  uint64_t v8 = SecItemDelete(v7);
  if (v8 == -25300 || v8 == 0)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v10 = v8;
    id v11 = (void *)MEMORY[0x263F087E8];
    id v12 = HKSensitiveLogItem();
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, @"Failed to delete token for name %@, OSStatus: %d", v12, v10);

    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end