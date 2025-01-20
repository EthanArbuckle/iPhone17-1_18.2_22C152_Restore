@interface AKKeychainItemDescriptor
+ (id)pcsAuthDescriptor;
- (AKKeychainItemDescriptor)initWithAttributes:(id)a3;
- (BOOL)isInvisible;
- (BOOL)isSynchronizable;
- (BOOL)shouldUseDataProtection;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)label;
- (NSString)securityDomain;
- (NSString)server;
- (NSString)service;
- (id)_keychainAccessibleWithAccessible:(unint64_t)a3;
- (id)_keychainClassWithClass:(unint64_t)a3;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_accessibleWithKeychainAccessible:(id)a3;
- (unint64_t)_classWithKeychainClass:(id)a3;
- (unint64_t)itemAccessible;
- (unint64_t)itemClass;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setInvisible:(BOOL)a3;
- (void)setItemAccessible:(unint64_t)a3;
- (void)setItemClass:(unint64_t)a3;
- (void)setLabel:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setServer:(id)a3;
- (void)setService:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setUseDataProtection:(BOOL)a3;
@end

@implementation AKKeychainItemDescriptor

- (AKKeychainItemDescriptor)initWithAttributes:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AKKeychainItemDescriptor;
  v5 = [(AKKeychainItemDescriptor *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:kSecClass];
    v5->_itemClass = [(AKKeychainItemDescriptor *)v5 _classWithKeychainClass:v6];

    v7 = [v4 objectForKeyedSubscript:kSecAttrAccessible];
    v5->_itemAccessible = [(AKKeychainItemDescriptor *)v5 _accessibleWithKeychainAccessible:v7];

    uint64_t v8 = [v4 objectForKeyedSubscript:kSecAttrAccount];
    account = v5->_account;
    v5->_account = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:kSecAttrService];
    service = v5->_service;
    v5->_service = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:kSecAttrServer];
    server = v5->_server;
    v5->_server = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:kSecAttrSecurityDomain];
    securityDomain = v5->_securityDomain;
    v5->_securityDomain = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:kSecAttrLabel];
    label = v5->_label;
    v5->_label = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:kSecAttrAccessGroup];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:kSecAttrIsInvisible];
    invisible = v5->_invisible;
    v5->_invisible = (NSNumber *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:kSecAttrSynchronizable];
    synchronizable = v5->_synchronizable;
    v5->_synchronizable = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:kSecUseDataProtectionKeychain];
    useDataProtection = v5->_useDataProtection;
    v5->_useDataProtection = (NSNumber *)v24;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AKKeychainItemDescriptor);
  v4->_itemClass = self->_itemClass;
  v4->_itemAccessible = self->_itemAccessible;
  v5 = (NSString *)[(NSString *)self->_account copy];
  account = v4->_account;
  v4->_account = v5;

  v7 = (NSString *)[(NSString *)self->_service copy];
  service = v4->_service;
  v4->_service = v7;

  v9 = (NSString *)[(NSString *)self->_server copy];
  server = v4->_server;
  v4->_server = v9;

  v11 = (NSString *)[(NSString *)self->_securityDomain copy];
  securityDomain = v4->_securityDomain;
  v4->_securityDomain = v11;

  v13 = (NSString *)[(NSString *)self->_label copy];
  label = v4->_label;
  v4->_label = v13;

  v15 = (NSString *)[(NSString *)self->_accessGroup copy];
  accessGroup = v4->_accessGroup;
  v4->_accessGroup = v15;

  v17 = (NSNumber *)[(NSNumber *)self->_invisible copy];
  invisible = v4->_invisible;
  v4->_invisible = v17;

  v19 = (NSNumber *)[(NSNumber *)self->_synchronizable copy];
  synchronizable = v4->_synchronizable;
  v4->_synchronizable = v19;

  v21 = (NSNumber *)[(NSNumber *)self->_useDataProtection copy];
  useDataProtection = v4->_useDataProtection;
  v4->_useDataProtection = v21;

  return v4;
}

- (BOOL)isInvisible
{
  return [(NSNumber *)self->_invisible BOOLValue];
}

- (void)setInvisible:(BOOL)a3
{
  self->_invisible = +[NSNumber numberWithBool:a3];

  _objc_release_x1();
}

- (BOOL)isSynchronizable
{
  return [(NSNumber *)self->_synchronizable BOOLValue];
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = +[NSNumber numberWithBool:a3];

  _objc_release_x1();
}

- (BOOL)shouldUseDataProtection
{
  return [(NSNumber *)self->_useDataProtection BOOLValue];
}

- (void)setUseDataProtection:(BOOL)a3
{
  self->_useDataProtection = +[NSNumber numberWithBool:a3];

  _objc_release_x1();
}

- (id)attributes
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(AKKeychainItemDescriptor *)self _keychainClassWithClass:self->_itemClass];
  [v3 setObject:v4 forKeyedSubscript:kSecClass];

  v5 = [(AKKeychainItemDescriptor *)self _keychainAccessibleWithAccessible:self->_itemAccessible];
  [v3 setObject:v5 forKeyedSubscript:kSecAttrAccessible];

  [v3 setObject:self->_account forKeyedSubscript:kSecAttrAccount];
  [v3 setObject:self->_service forKeyedSubscript:kSecAttrService];
  [v3 setObject:self->_server forKeyedSubscript:kSecAttrServer];
  [v3 setObject:self->_securityDomain forKeyedSubscript:kSecAttrSecurityDomain];
  [v3 setObject:self->_label forKeyedSubscript:kSecAttrLabel];
  [v3 setObject:self->_accessGroup forKeyedSubscript:kSecAttrAccessGroup];
  [v3 setObject:self->_invisible forKeyedSubscript:kSecAttrIsInvisible];
  [v3 setObject:self->_synchronizable forKeyedSubscript:kSecAttrSynchronizable];
  [v3 setObject:self->_useDataProtection forKeyedSubscript:kSecUseDataProtectionKeychain];
  id v6 = [v3 copy];

  return v6;
}

- (id)_keychainClassWithClass:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = (id *)&kSecClassGenericPassword;
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 2)
  {
    id v4 = (id *)&kSecClassInternetPassword;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (unint64_t)_classWithKeychainClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kSecClassGenericPassword])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:kSecClassInternetPassword])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)_keychainAccessibleWithAccessible:(unint64_t)a3
{
  if (a3 - 1 > 4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)*(&off_100227F28 + a3 - 1);
  }
  return v4;
}

- (unint64_t)_accessibleWithKeychainAccessible:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kSecAttrAccessibleWhenUnlocked])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:kSecAttrAccessibleAfterFirstUnlock])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:kSecAttrAccessibleWhenUnlockedThisDeviceOnly])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)itemClass
{
  return self->_itemClass;
}

- (void)setItemClass:(unint64_t)a3
{
  self->_itemClass = a3;
}

- (unint64_t)itemAccessible
{
  return self->_itemAccessible;
}

- (void)setItemAccessible:(unint64_t)a3
{
  self->_itemAccessible = a3;
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_useDataProtection, 0);
  objc_storeStrong((id *)&self->_synchronizable, 0);

  objc_storeStrong((id *)&self->_invisible, 0);
}

+ (id)pcsAuthDescriptor
{
  v2 = objc_alloc_init(AKKeychainItemDescriptor);
  [(AKKeychainItemDescriptor *)v2 setService:@"com.apple.akd.pcsauth.keychain_service"];
  [(AKKeychainItemDescriptor *)v2 setAccessGroup:@"com.apple.akd.pcsauth"];
  [(AKKeychainItemDescriptor *)v2 setItemClass:1];
  [(AKKeychainItemDescriptor *)v2 setItemAccessible:0];
  [(AKKeychainItemDescriptor *)v2 setInvisible:1];
  [(AKKeychainItemDescriptor *)v2 setSynchronizable:0];
  [(AKKeychainItemDescriptor *)v2 setUseDataProtection:1];

  return v2;
}

@end