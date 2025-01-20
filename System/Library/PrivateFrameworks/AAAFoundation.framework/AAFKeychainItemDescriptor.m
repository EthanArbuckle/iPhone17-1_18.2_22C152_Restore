@interface AAFKeychainItemDescriptor
- (AAFKeychainItemDescriptor)initWithAttributes:(id)a3;
- (NSString)accessGroup;
- (NSString)account;
- (NSString)creator;
- (NSString)itemProtocol;
- (NSString)label;
- (NSString)securityDomain;
- (NSString)server;
- (NSString)service;
- (NSString)sharingGroup;
- (id)_keychainAccessibleWithAccessible:(unint64_t)a3;
- (id)_keychainClassWithClass:(unint64_t)a3;
- (id)_objectForOptionalBool:(unint64_t)a3;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_accessibleWithKeychainAccessible:(id)a3;
- (unint64_t)_classWithKeychainClass:(id)a3;
- (unint64_t)_optionalValueFromObject:(id)a3;
- (unint64_t)invisible;
- (unint64_t)itemAccessible;
- (unint64_t)itemClass;
- (unint64_t)synchronizable;
- (unint64_t)sysBound;
- (unint64_t)useDataProtection;
- (void)setAccessGroup:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCreator:(id)a3;
- (void)setInvisible:(unint64_t)a3;
- (void)setItemAccessible:(unint64_t)a3;
- (void)setItemClass:(unint64_t)a3;
- (void)setItemProtocol:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setServer:(id)a3;
- (void)setService:(id)a3;
- (void)setSharingGroup:(id)a3;
- (void)setSynchronizable:(unint64_t)a3;
- (void)setSysBound:(unint64_t)a3;
- (void)setUseDataProtection:(unint64_t)a3;
@end

@implementation AAFKeychainItemDescriptor

- (AAFKeychainItemDescriptor)initWithAttributes:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)AAFKeychainItemDescriptor;
  v5 = [(AAFKeychainItemDescriptor *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B978]];
    v5->_itemClass = [(AAFKeychainItemDescriptor *)v5 _classWithKeychainClass:v6];

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B558]];
    v5->_itemAccessible = [(AAFKeychainItemDescriptor *)v5 _accessibleWithKeychainAccessible:v7];

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
    account = v5->_account;
    v5->_account = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B850]];
    service = v5->_service;
    v5->_service = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B848]];
    server = v5->_server;
    v5->_server = (NSString *)v12;

    uint64_t v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B838]];
    securityDomain = v5->_securityDomain;
    v5->_securityDomain = (NSString *)v14;

    uint64_t v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B788]];
    label = v5->_label;
    v5->_label = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B550]];
    accessGroup = v5->_accessGroup;
    v5->_accessGroup = (NSString *)v18;

    uint64_t v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B858]];
    sharingGroup = v5->_sharingGroup;
    v5->_sharingGroup = (NSString *)v20;

    uint64_t v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B7C8]];
    itemProtocol = v5->_itemProtocol;
    v5->_itemProtocol = (NSString *)v22;

    uint64_t v24 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B670]];
    creator = v5->_creator;
    v5->_creator = (NSString *)v24;

    v26 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B698]];
    v5->_invisible = [(AAFKeychainItemDescriptor *)v5 _optionalValueFromObject:v26];

    v27 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B878]];
    v5->_synchronizable = [(AAFKeychainItemDescriptor *)v5 _optionalValueFromObject:v27];

    v28 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD08]];
    v5->_useDataProtection = [(AAFKeychainItemDescriptor *)v5 _optionalValueFromObject:v28];

    v29 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3B888]];
    v5->_sysBound = [(AAFKeychainItemDescriptor *)v5 _optionalValueFromObject:v29];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAFKeychainItemDescriptor);
  v4->_itemClass = self->_itemClass;
  v4->_itemAccessible = self->_itemAccessible;
  uint64_t v5 = [(NSString *)self->_account copy];
  account = v4->_account;
  v4->_account = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_service copy];
  service = v4->_service;
  v4->_service = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_server copy];
  server = v4->_server;
  v4->_server = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_securityDomain copy];
  securityDomain = v4->_securityDomain;
  v4->_securityDomain = (NSString *)v11;

  uint64_t v13 = [(NSString *)self->_label copy];
  label = v4->_label;
  v4->_label = (NSString *)v13;

  uint64_t v15 = [(NSString *)self->_accessGroup copy];
  accessGroup = v4->_accessGroup;
  v4->_accessGroup = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_sharingGroup copy];
  sharingGroup = v4->_sharingGroup;
  v4->_sharingGroup = (NSString *)v17;

  uint64_t v19 = [(NSString *)self->_itemProtocol copy];
  itemProtocol = v4->_itemProtocol;
  v4->_itemProtocol = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_creator copy];
  creator = v4->_creator;
  v4->_creator = (NSString *)v21;

  v4->_invisible = self->_invisible;
  v4->_synchronizable = self->_synchronizable;
  v4->_useDataProtection = self->_useDataProtection;
  v4->_sysBound = self->_sysBound;
  return v4;
}

- (id)attributes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AAFKeychainItemDescriptor *)self _keychainClassWithClass:self->_itemClass];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3B978]];

  uint64_t v5 = [(AAFKeychainItemDescriptor *)self _keychainAccessibleWithAccessible:self->_itemAccessible];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B558]];

  [v3 setObject:self->_account forKeyedSubscript:*MEMORY[0x1E4F3B5C0]];
  [v3 setObject:self->_service forKeyedSubscript:*MEMORY[0x1E4F3B850]];
  [v3 setObject:self->_server forKeyedSubscript:*MEMORY[0x1E4F3B848]];
  [v3 setObject:self->_securityDomain forKeyedSubscript:*MEMORY[0x1E4F3B838]];
  [v3 setObject:self->_label forKeyedSubscript:*MEMORY[0x1E4F3B788]];
  [v3 setObject:self->_accessGroup forKeyedSubscript:*MEMORY[0x1E4F3B550]];
  [v3 setObject:self->_sharingGroup forKeyedSubscript:*MEMORY[0x1E4F3B858]];
  [v3 setObject:self->_itemProtocol forKeyedSubscript:*MEMORY[0x1E4F3B7C8]];
  [v3 setObject:self->_creator forKeyedSubscript:*MEMORY[0x1E4F3B670]];
  v6 = [(AAFKeychainItemDescriptor *)self _objectForOptionalBool:self->_invisible];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B698]];

  uint64_t v7 = [(AAFKeychainItemDescriptor *)self _objectForOptionalBool:self->_synchronizable];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B878]];

  uint64_t v8 = [(AAFKeychainItemDescriptor *)self _objectForOptionalBool:self->_useDataProtection];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3BD08]];

  uint64_t v9 = [(AAFKeychainItemDescriptor *)self _objectForOptionalBool:self->_sysBound];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B888]];

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (id)_keychainClassWithClass:(unint64_t)a3
{
  if (a3 - 1 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E6CFA720 + a3 - 1);
  }
  return v4;
}

- (unint64_t)_classWithKeychainClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F3B988]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B998]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B9A0]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B990]])
  {
    unint64_t v4 = 4;
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
    id v4 = **((id **)&unk_1E6CFA740 + a3 - 1);
  }
  return v4;
}

- (unint64_t)_accessibleWithKeychainAccessible:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F3B5B0]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B570]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B5A8]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B5B8]])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3B578]])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)_optionalValueFromObject:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 BOOLValue]) {
    return 2;
  }
  return 1;
}

- (id)_objectForOptionalBool:(unint64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CC38];
  if (a3 != 2) {
    id v3 = 0;
  }
  if (a3 == 1) {
    return (id)MEMORY[0x1E4F1CC28];
  }
  else {
    return v3;
  }
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

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (void)setSharingGroup:(id)a3
{
}

- (NSString)itemProtocol
{
  return self->_itemProtocol;
}

- (void)setItemProtocol:(id)a3
{
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
}

- (unint64_t)invisible
{
  return self->_invisible;
}

- (void)setInvisible:(unint64_t)a3
{
  self->_invisible = a3;
}

- (unint64_t)synchronizable
{
  return self->_synchronizable;
}

- (void)setSynchronizable:(unint64_t)a3
{
  self->_synchronizable = a3;
}

- (unint64_t)useDataProtection
{
  return self->_useDataProtection;
}

- (void)setUseDataProtection:(unint64_t)a3
{
  self->_useDataProtection = a3;
}

- (unint64_t)sysBound
{
  return self->_sysBound;
}

- (void)setSysBound:(unint64_t)a3
{
  self->_sysBound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_itemProtocol, 0);
  objc_storeStrong((id *)&self->_sharingGroup, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end