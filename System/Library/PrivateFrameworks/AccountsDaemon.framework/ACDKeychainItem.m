@interface ACDKeychainItem
+ (id)new;
- (ACDKeychainItem)init;
- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3;
- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3 properties:(id)a4;
- (BOOL)_setMetadata:(id)a3 withError:(id *)a4;
- (BOOL)hasCustomAccessControl;
- (BOOL)save:(id *)a3;
- (BOOL)synchronizable;
- (BOOL)useDataProtectionKeychain;
- (NSDictionary)metadata;
- (NSString)accessGroup;
- (NSString)accessibility;
- (NSString)account;
- (NSString)service;
- (__CFData)persistentRef;
- (id)_metadataWithError:(id *)a3;
- (id)_modifiedProperties;
- (id)debugDescription;
- (id)description;
- (int64_t)version;
- (void)_clearDirtyProperties;
- (void)_markPropertyDirty:(id)a3;
- (void)_reloadProperties;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)reload;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibility:(id)a3;
- (void)setAccount:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setService:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation ACDKeychainItem

+ (id)new
{
  return 0;
}

- (ACDKeychainItem)init
{
  return 0;
}

- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ACDKeychainItem;
  v4 = [(ACDKeychainItem *)&v6 init];
  if (v4)
  {
    v4->_persistentRef = (__CFData *)CFRetain(a3);
    [(ACDKeychainItem *)v4 _reloadProperties];
  }
  return v4;
}

- (ACDKeychainItem)initWithPersistentRef:(__CFData *)a3 properties:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ACDKeychainItem;
  v7 = [(ACDKeychainItem *)&v11 init];
  if (v7)
  {
    v7->_persistentRef = (__CFData *)CFRetain(a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6];
    properties = v7->_properties;
    v7->_properties = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)dealloc
{
  persistentRef = self->_persistentRef;
  if (persistentRef) {
    CFRelease(persistentRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)ACDKeychainItem;
  [(ACDKeychainItem *)&v4 dealloc];
}

- (void)reload
{
  [(ACDKeychainItem *)self _clearDirtyProperties];

  [(ACDKeychainItem *)self _reloadProperties];
}

- (BOOL)save:(id *)a3
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  if (self->_persistentRef)
  {
    if ([(NSMutableSet *)self->_dirtyProperties count])
    {
      v5 = (void *)*MEMORY[0x263F17580];
      keys[0] = *(void **)MEMORY[0x263F175B0];
      keys[1] = v5;
      id v6 = (void *)*MEMORY[0x263EFFB40];
      values[0] = self->_persistentRef;
      values[1] = v6;
      CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
      CFDictionaryRef v8 = [(ACDKeychainItem *)self _modifiedProperties];
      OSStatus v9 = SecItemUpdate(v7, v8);
      CFRelease(v7);
      BOOL v10 = v9 == 0;
      if (v9)
      {
        if (a3)
        {
          *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB078] code:v9 userInfo:0];
        }
      }
      else
      {
        [(ACDKeychainItem *)self _clearDirtyProperties];
      }
    }
    else
    {
      return 1;
    }
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFB070] code:10003 userInfo:0];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v10;
}

- (NSString)account
{
  v2 = [(NSMutableDictionary *)self->_properties stringValueForKey:*MEMORY[0x263F16ED8]];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)service
{
  v2 = [(NSMutableDictionary *)self->_properties stringValueForKey:*MEMORY[0x263F17090]];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)accessGroup
{
  v2 = [(NSMutableDictionary *)self->_properties stringValueForKey:*MEMORY[0x263F16E80]];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)accessibility
{
  v2 = [(NSMutableDictionary *)self->_properties stringValueForKey:*MEMORY[0x263F16E90]];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (BOOL)synchronizable
{
  return [(NSMutableDictionary *)self->_properties BOOLValueForKey:*MEMORY[0x263F170B0]];
}

- (BOOL)useDataProtectionKeychain
{
  return [(NSMutableDictionary *)self->_properties BOOLValueForKey:*MEMORY[0x263F17580]];
}

- (BOOL)hasCustomAccessControl
{
  uint64_t v2 = [(NSMutableDictionary *)self->_properties valueForKey:*MEMORY[0x263F16E70]];
  if (v2) {
    LOBYTE(v2) = SecAccessControlGetConstraints() != 0;
  }
  return v2;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)[(ACDKeychainItem *)self _metadataWithError:0];
}

- (id)_metadataWithError:(id *)a3
{
  objc_super v4 = [(NSMutableDictionary *)self->_properties dataValueForKey:*MEMORY[0x263F16F30]];
  if (v4)
  {
    id v9 = 0;
    v5 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v9];
    id v6 = v9;
    if (v6)
    {
      CFDictionaryRef v7 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ACDKeychainItem _metadataWithError:]((uint64_t)v6, v7);
      }

      if (a3) {
        *a3 = v6;
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)version
{
  uint64_t v2 = [(ACDKeychainItem *)self metadata];
  v3 = [v2 objectForKeyedSubscript:@"ACKeychainItemVersion"];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setAccount:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(ACDKeychainItem *)self account];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)[v7 copy];
    [(ACDKeychainItem *)self _setValue:v6 forProperty:*MEMORY[0x263F16ED8]];
  }
}

- (void)setService:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(ACDKeychainItem *)self service];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)[v7 copy];
    [(ACDKeychainItem *)self _setValue:v6 forProperty:*MEMORY[0x263F17090]];
  }
}

- (void)setAccessGroup:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(ACDKeychainItem *)self accessGroup];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)[v7 copy];
    [(ACDKeychainItem *)self _setValue:v6 forProperty:*MEMORY[0x263F16E80]];
  }
}

- (void)setAccessibility:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(ACDKeychainItem *)self accessibility];
  char v5 = [v7 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)[v7 copy];
    [(ACDKeychainItem *)self _setValue:v6 forProperty:*MEMORY[0x263F16E90]];
  }
}

- (void)setSynchronizable:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ACDKeychainItem *)self synchronizable] != a3)
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(ACDKeychainItem *)self _setValue:v5 forProperty:*MEMORY[0x263F170B0]];
  }
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)_setMetadata:(id)a3 withError:(id *)a4
{
  if (a3)
  {
    id v12 = 0;
    id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:&v12];
    id v7 = v12;
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = _ACDKeychainLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACDKeychainItem _setMetadata:withError:]((uint64_t)v7, v9);
      }

      if (a4) {
        *a4 = v7;
      }
    }
    else
    {
      [(ACDKeychainItem *)self _setValue:v6 forProperty:*MEMORY[0x263F16F30]];
    }
  }
  else
  {
    BOOL v10 = objc_msgSend(MEMORY[0x263EFF8F8], "data", 0, a4);
    [(ACDKeychainItem *)self _setValue:v10 forProperty:*MEMORY[0x263F16F30]];

    return 1;
  }
  return v8;
}

- (void)setVersion:(int64_t)a3
{
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [(ACDKeychainItem *)self metadata];
  id v8 = [v5 dictionaryWithDictionary:v6];

  id v7 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKey:@"ACKeychainItemVersion"];

  [(ACDKeychainItem *)self setMetadata:v8];
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  properties = self->_properties;
  id v7 = a4;
  [(NSMutableDictionary *)properties setObject:a3 forKey:v7];
  [(ACDKeychainItem *)self _markPropertyDirty:v7];
}

- (void)_markPropertyDirty:(id)a3
{
  id v4 = a3;
  dirtyProperties = self->_dirtyProperties;
  id v8 = v4;
  if (!dirtyProperties)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v7 = self->_dirtyProperties;
    self->_dirtyProperties = v6;

    id v4 = v8;
    dirtyProperties = self->_dirtyProperties;
  }
  [(NSMutableSet *)dirtyProperties addObject:v4];
}

- (void)_clearDirtyProperties
{
  self->_dirtyProperties = 0;
  MEMORY[0x270F9A758]();
}

- (id)_modifiedProperties
{
  BOOL v3 = [(NSMutableSet *)self->_dirtyProperties allObjects];
  properties = self->_properties;
  id v5 = [MEMORY[0x263EFF9D0] null];
  id v6 = [(NSMutableDictionary *)properties objectsForKeys:v3 notFoundMarker:v5];

  id v7 = [NSDictionary dictionaryWithObjects:v6 forKeys:v3];

  return v7;
}

- (void)_reloadProperties
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = [NSNumber numberWithInt:a1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "Got invalid status from keychain: %@", (uint8_t *)&v4, 0xCu);
}

- (id)description
{
  BOOL v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACDKeychainItem *)self account];
  id v7 = [(ACDKeychainItem *)self service];
  BOOL v8 = [(ACDKeychainItem *)self synchronizable];
  id v9 = @"NO";
  if (v8) {
    id v9 = @"YES";
  }
  BOOL v10 = [v3 stringWithFormat:@"<%@: %p {username: %@, service: %@, synchronizable: %@}>", v5, self, v6, v7, v9];

  return v10;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ACDKeychainItem *)self account];
  id v7 = [(ACDKeychainItem *)self service];
  BOOL v8 = [(ACDKeychainItem *)self accessGroup];
  id v9 = [(ACDKeychainItem *)self accessibility];
  BOOL v10 = [(ACDKeychainItem *)self synchronizable];
  objc_super v11 = @"NO";
  if (v10) {
    objc_super v11 = @"YES";
  }
  id v12 = [v3 stringWithFormat:@"<%@: %p {\n\taccount: %@,\n\tservice: %@,\n\taccessGroup: %@,\n\taccessibility: %@,\n\tsynchronizable: %@,\n\tdirtyProperties: %@\n}>", v5, self, v6, v7, v8, v9, v11, self->_dirtyProperties];

  return v12;
}

- (__CFData)persistentRef
{
  return self->_persistentRef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyProperties, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)_metadataWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "Failed to decode keychain metadata: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setMetadata:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2183AD000, a2, OS_LOG_TYPE_ERROR, "Failed to encode keychain metadata: %@", (uint8_t *)&v2, 0xCu);
}

@end