@interface COClusterConfiguration
+ (BOOL)_validateServices:(unint64_t)a3 options:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6;
+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7;
+ (id)_prefixFromDomain:(id)a3;
+ (id)configurationForExplicitClusterIdentifier:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5;
+ (id)domainPermittedCharacterSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClusterConfiguration:(id)a3;
- (COClusterConfiguration)initWithCoder:(id)a3;
- (COClusterRealm)realm;
- (NSString)globalServiceName;
- (NSString)prefix;
- (id)_initWithPrefix:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7;
- (id)description;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)requiredServices;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COClusterConfiguration

- (id)_initWithPrefix:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)COClusterConfiguration;
  v15 = [(COClusterConfiguration *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    prefix = v15->_prefix;
    v15->_prefix = (NSString *)v16;

    v15->_requiredServices = a4;
    v15->_options = a5;
    uint64_t v18 = [v13 copy];
    realm = v15->_realm;
    v15->_realm = (COClusterRealm *)v18;

    uint64_t v20 = [v14 copy];
    globalServiceName = v15->_globalServiceName;
    v15->_globalServiceName = (NSString *)v20;
  }
  return v15;
}

+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6
{
  id v10 = a6;
  v11 = [a1 _prefixFromDomain:a3];
  if (v11 && [a1 _validateServices:a4 options:a5]) {
    id v12 = (void *)[objc_alloc((Class)a1) _initWithPrefix:v11 requiredServices:a4 options:a5 realm:v10 globalServiceName:0];
  }
  else {
    id v12 = 0;
  }

  return (COClusterConfiguration *)v12;
}

+ (COClusterConfiguration)configurationWithDomain:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5 realm:(id)a6 globalServiceName:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [a1 _prefixFromDomain:a3];
  v15 = (void *)v14;
  uint64_t v16 = 0;
  if (!(a4 & 3 | a5 & 1) && v14) {
    uint64_t v16 = (void *)[objc_alloc((Class)a1) _initWithPrefix:v14 requiredServices:a4 options:a5 realm:v12 globalServiceName:v13];
  }

  return (COClusterConfiguration *)v16;
}

+ (id)configurationForExplicitClusterIdentifier:(id)a3 requiredServices:(unint64_t)a4 options:(unint64_t)a5
{
  id v8 = a3;
  if (![v8 length])
  {
    id v12 = 0;
    goto LABEL_11;
  }
  v9 = [a1 domainPermittedCharacterSet];
  id v10 = [v9 invertedSet];

  if ([v8 rangeOfCharacterFromSet:v10] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = COLogForCategory(7);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[COClusterConfiguration configurationForExplicitClusterIdentifier:requiredServices:options:]();
    }

    goto LABEL_9;
  }
  if (![a1 _validateServices:a4 options:a5])
  {
LABEL_9:
    id v12 = 0;
    goto LABEL_10;
  }
  v11 = +[_COClusterRealmExplicitMembership realmWithClusterIdentifier:v8];
  id v12 = (void *)[objc_alloc((Class)a1) _initWithPrefix:&stru_26CDCB508 requiredServices:a4 options:a5 realm:v11 globalServiceName:0];

LABEL_10:
LABEL_11:

  return v12;
}

- (COClusterConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefix"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiredServices"];
    uint64_t v7 = [v6 unsignedIntegerValue];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    uint64_t v9 = [v8 unsignedIntegerValue];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"realm"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"globalService"];
    if (v5 && v6 && v8 && v10)
    {
      id v12 = [(COClusterConfiguration *)self _initWithPrefix:v5 requiredServices:v7 options:v9 realm:v10 globalServiceName:v11];
    }
    else
    {

      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
    v5 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  v5 = [(COClusterConfiguration *)self prefix];
  [v4 encodeObject:v5 forKey:@"prefix"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[COClusterConfiguration requiredServices](self, "requiredServices"));
  [v4 encodeObject:v6 forKey:@"requiredServices"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[COClusterConfiguration options](self, "options"));
  [v4 encodeObject:v7 forKey:@"options"];

  id v8 = [(COClusterConfiguration *)self realm];
  [v4 encodeObject:v8 forKey:@"realm"];

  id v9 = [(COClusterConfiguration *)self globalServiceName];
  [v4 encodeObject:v9 forKey:@"globalService"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(COClusterConfiguration *)self prefix];
  unint64_t v7 = [(COClusterConfiguration *)self requiredServices];
  unint64_t v8 = [(COClusterConfiguration *)self options];
  id v9 = [(COClusterConfiguration *)self realm];
  id v10 = [v3 stringWithFormat:@"<%@: %p, pfx(%@) s(%#0lx) o(%#0lx) r(%@)>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)hash
{
  v2 = [(COClusterConfiguration *)self prefix];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COClusterConfiguration *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(COClusterConfiguration *)self isEqualToClusterConfiguration:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToClusterConfiguration:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(COClusterConfiguration *)self prefix];
  unint64_t v7 = [v5 prefix];
  if ([v6 isEqualToString:v7])
  {
    unint64_t v8 = [(COClusterConfiguration *)self requiredServices];
    if (v8 == [v5 requiredServices])
    {
      unint64_t v9 = [(COClusterConfiguration *)self options];
      if (v9 == [v5 options])
      {
        id v10 = [(COClusterConfiguration *)self realm];
        v11 = [v5 realm];
        if (![v10 isEqual:v11])
        {
          char v15 = 0;
LABEL_15:

          goto LABEL_10;
        }
        id v12 = [(COClusterConfiguration *)self globalServiceName];
        if (v12 || ([v5 globalServiceName], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v13 = [(COClusterConfiguration *)self globalServiceName];
          uint64_t v14 = [v5 globalServiceName];
          char v15 = [v13 isEqual:v14];

          if (v12)
          {
LABEL_14:

            goto LABEL_15;
          }
        }
        else
        {
          char v15 = 1;
        }
        id v12 = (void *)v3;
        goto LABEL_14;
      }
    }
  }
  char v15 = 0;
LABEL_10:

  return v15;
}

+ (id)domainPermittedCharacterSet
{
  if (domainPermittedCharacterSet_onceToken != -1) {
    dispatch_once(&domainPermittedCharacterSet_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)domainPermittedCharacterSet_permitted;

  return v2;
}

void __53__COClusterConfiguration_domainPermittedCharacterSet__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F089C0]);
  v1 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
  [v0 formUnionWithCharacterSet:v2];

  uint64_t v3 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  [v0 formUnionWithCharacterSet:v3];

  [v0 addCharactersInString:@"_"];
  [v0 addCharactersInString:@"-"];
  [v0 addCharactersInString:@"."];
  id v4 = (void *)domainPermittedCharacterSet_permitted;
  domainPermittedCharacterSet_permitted = (uint64_t)v0;
}

+ (BOOL)_validateServices:(unint64_t)a3 options:(unint64_t)a4
{
  if (!a3)
  {
    id v4 = COLogForCategory(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[COClusterConfiguration _validateServices:options:](v4);
    }
    goto LABEL_14;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFF0) != 0)
  {
    id v4 = COLogForCategory(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[COClusterConfiguration _validateServices:options:].cold.4();
    }
LABEL_14:

    return 0;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    id v4 = COLogForCategory(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[COClusterConfiguration _validateServices:options:]();
    }
    goto LABEL_14;
  }
  BOOL result = 1;
  if ((a3 & 3) != 0 && !a4)
  {
    id v4 = COLogForCategory(7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[COClusterConfiguration _validateServices:options:]();
    }
    goto LABEL_14;
  }
  return result;
}

+ (id)_prefixFromDomain:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [(id)objc_opt_class() domainPermittedCharacterSet];
    id v5 = [v4 invertedSet];

    if ([v3 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v6 = [NSString stringWithFormat:@"d-cluster.%@", v3];
    }
    else
    {
      unint64_t v7 = COLogForCategory(7);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[COClusterConfiguration _prefixFromDomain:]();
      }

      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)requiredServices
{
  return self->_requiredServices;
}

- (unint64_t)options
{
  return self->_options;
}

- (COClusterRealm)realm
{
  return self->_realm;
}

- (NSString)globalServiceName
{
  return self->_globalServiceName;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_globalServiceName, 0);

  objc_storeStrong((id *)&self->_realm, 0);
}

+ (void)configurationForExplicitClusterIdentifier:requiredServices:options:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Invalid character in cluster identifier %@", v2, v3, v4, v5, v6);
}

+ (void)_validateServices:(os_log_t)log options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21D3E0000, log, OS_LOG_TYPE_ERROR, "Invalid cluster configuration: at least one service required", v1, 2u);
}

+ (void)_validateServices:options:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Invalid cluster configuration: services %lX require Coordinator option", v2, v3, v4, v5, v6);
}

+ (void)_validateServices:options:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Invalid cluster configuration: unknown options %lX", v2, v3, v4, v5, v6);
}

+ (void)_validateServices:options:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Invalid cluster configuration: unknown services %lX", v2, v3, v4, v5, v6);
}

+ (void)_prefixFromDomain:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21D3E0000, v0, v1, "Invalid character in cluster domain %@", v2, v3, v4, v5, v6);
}

@end