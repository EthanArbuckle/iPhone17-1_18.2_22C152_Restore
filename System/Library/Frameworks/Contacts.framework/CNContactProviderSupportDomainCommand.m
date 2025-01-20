@interface CNContactProviderSupportDomainCommand
+ (BOOL)supportsSecureCoding;
+ (id)addDomain:(id)a3;
+ (id)disableDomain:(id)a3;
+ (id)disableDomain:(id)a3 bundleIdentifier:(id)a4;
+ (id)enableDomain:(id)a3;
+ (id)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5;
+ (id)fetchAllDomains;
+ (id)fetchAllDomainsCount;
+ (id)fetchContainerIdentifierForDomain:(id)a3;
+ (id)fetchDomainEnabled:(id)a3;
+ (id)fetchRegisteredDomains;
+ (id)invalidateExtensionForDomain:(id)a3;
+ (id)new;
+ (id)removeDomain:(id)a3;
+ (id)resetEnumerationForDomain:(id)a3;
+ (id)synchronizeDomain:(id)a3 usingSession:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSynchronize;
- (CNContactProviderSupportDomain)domain;
- (CNContactProviderSupportDomainCommand)init;
- (CNContactProviderSupportDomainCommand)initWithCoder:(id)a3;
- (CNContactProviderSupportDomainCommand)initWithCommandType:(id)a3;
- (CNContactProviderSupportSession)session;
- (NSString)bundleIdentifier;
- (NSString)commandType;
- (NSString)domainIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setSession:(id)a3;
- (void)setShouldSynchronize:(BOOL)a3;
@end

@implementation CNContactProviderSupportDomainCommand

- (CNContactProviderSupportDomainCommand)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)new
{
  id v2 = a1;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNContactProviderSupportDomainCommand)initWithCommandType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      -[CNContactProviderSupportDomainCommand initWithCommandType:]();
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CNContactProviderSupportDomainCommand;
  v6 = [(CNContactProviderSupportDomainCommand *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_commandType, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)addDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand addDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"AddDomain"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomain:v3];

  return v4;
}

+ (id)removeDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"RemoveDomain"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)fetchRegisteredDomains
{
  id v2 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"FetchRegisteredDomains"];

  return v2;
}

+ (id)fetchDomainEnabled:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"FetchDomainEnabled"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)enableDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"EnableDomain"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)disableDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"DisableDomain"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)fetchContainerIdentifierForDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"FetchDomainContainerIdentifier"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)synchronizeDomain:(id)a3 usingSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:]();
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v6) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
    +[CNContactProviderSupportDomainCommand synchronizeDomain:usingSession:]();
  }
LABEL_10:
  v7 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"SynchronizeDomain"];
  [(CNContactProviderSupportDomainCommand *)v7 setDomainIdentifier:v5];
  [(CNContactProviderSupportDomainCommand *)v7 setSession:v6];

  return v7;
}

+ (id)invalidateExtensionForDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"InvalidateExtension"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)resetEnumerationForDomain:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_7 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
      +[CNContactProviderSupportDomainCommand removeDomain:]();
    }
  }
  v4 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"ResetEnumeration"];
  [(CNContactProviderSupportDomainCommand *)v4 setDomainIdentifier:v3];

  return v4;
}

+ (id)fetchAllDomainsCount
{
  id v2 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"FetchAllDomainsCount"];

  return v2;
}

+ (id)fetchAllDomains
{
  id v2 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"FetchAllDomains"];

  return v2;
}

+ (id)enableDomain:(id)a3 bundleIdentifier:(id)a4 shouldSynchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v7) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:]();
    if (v8) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v8) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
    +[CNContactProviderSupportDomainCommand enableDomain:bundleIdentifier:shouldSynchronize:]();
  }
LABEL_10:
  v9 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"EnableDomain"];
  [(CNContactProviderSupportDomainCommand *)v9 setDomainIdentifier:v7];
  [(CNContactProviderSupportDomainCommand *)v9 setBundleIdentifier:v8];
  [(CNContactProviderSupportDomainCommand *)v9 setShouldSynchronize:v5];

  return v9;
}

+ (id)disableDomain:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT))
  {
    +[CNContactProviderSupportDomainCommand removeDomain:]();
    if (v6) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v6) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_7 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_7, &__block_literal_global_111);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_7, OS_LOG_TYPE_FAULT)) {
    +[CNContactProviderSupportDomainCommand enableDomain:bundleIdentifier:shouldSynchronize:]();
  }
LABEL_10:
  id v7 = [[CNContactProviderSupportDomainCommand alloc] initWithCommandType:@"DisableDomain"];
  [(CNContactProviderSupportDomainCommand *)v7 setDomainIdentifier:v5];
  [(CNContactProviderSupportDomainCommand *)v7 setBundleIdentifier:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportDomainCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandType"];
  id v6 = [(CNContactProviderSupportDomainCommand *)self initWithCommandType:v5];
  if (v6)
  {
    if ([v4 containsValueForKey:@"_domainIdentifier"])
    {
      id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domainIdentifier"];
      uint64_t v8 = [v7 copy];
      domainIdentifier = v6->_domainIdentifier;
      v6->_domainIdentifier = (NSString *)v8;
    }
    if ([v4 containsValueForKey:@"_bundleIdentifier"])
    {
      objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
      uint64_t v11 = [v10 copy];
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v11;
    }
    if ([v4 containsValueForKey:@"_domain"])
    {
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_domain"];
      uint64_t v14 = [v13 copy];
      domain = v6->_domain;
      v6->_domain = (CNContactProviderSupportDomain *)v14;
    }
    if ([v4 containsValueForKey:@"_session"])
    {
      v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_session"];
      uint64_t v17 = [v16 copy];
      session = v6->_session;
      v6->_session = (CNContactProviderSupportSession *)v17;
    }
    if ([v4 containsValueForKey:@"_shouldSynchronize"]) {
      v6->_shouldSynchronize = [v4 decodeBoolForKey:@"_shouldSynchronize"];
    }
    v19 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeObject:self->_commandType forKey:@"commandType"];
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier) {
    [v8 encodeObject:domainIdentifier forKey:@"_domainIdentifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v8 encodeObject:bundleIdentifier forKey:@"_bundleIdentifier"];
  }
  id v6 = v8;
  if (self->_session)
  {
    [v8 encodeObject:self->_domain forKey:@"_domain"];
    id v6 = v8;
    session = self->_session;
    if (session)
    {
      [v8 encodeObject:session forKey:@"_session"];
      id v6 = v8;
    }
  }
  [v6 encodeBool:self->_shouldSynchronize forKey:@"_shouldSynchronize"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNContactProviderSupportDomainCommand alloc];
  id v5 = [(CNContactProviderSupportDomainCommand *)self commandType];
  id v6 = [(CNContactProviderSupportDomainCommand *)v4 initWithCommandType:v5];

  id v7 = [(CNContactProviderSupportDomainCommand *)self domainIdentifier];
  [(CNContactProviderSupportDomainCommand *)v6 setDomainIdentifier:v7];

  id v8 = [(CNContactProviderSupportDomainCommand *)self bundleIdentifier];
  [(CNContactProviderSupportDomainCommand *)v6 setBundleIdentifier:v8];

  v9 = [(CNContactProviderSupportDomainCommand *)self domain];
  [(CNContactProviderSupportDomainCommand *)v6 setDomain:v9];

  objc_super v10 = [(CNContactProviderSupportDomainCommand *)self session];
  [(CNContactProviderSupportDomainCommand *)v6 setSession:v10];

  [(CNContactProviderSupportDomainCommand *)v6 setShouldSynchronize:[(CNContactProviderSupportDomainCommand *)self shouldSynchronize]];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNContactProviderSupportDomainCommand *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    unint64_t v5 = (unint64_t)[(CNContactProviderSupportDomainCommand *)self commandType];
    unint64_t v6 = (unint64_t)[(CNContactProviderSupportDomainCommand *)v4 commandType];
    if (v5 | v6)
    {
      if (![(id)v5 isEqual:v6]) {
        goto LABEL_14;
      }
    }
    unint64_t v7 = (unint64_t)[(CNContactProviderSupportDomainCommand *)self domainIdentifier];
    unint64_t v8 = (unint64_t)[(CNContactProviderSupportDomainCommand *)v4 domainIdentifier];
    if (v7 | v8)
    {
      if (![(id)v7 isEqual:v8]) {
        goto LABEL_14;
      }
    }
    if (((unint64_t v9 = (unint64_t)[(CNContactProviderSupportDomainCommand *)self bundleIdentifier],
           unint64_t v10 = (unint64_t)[(CNContactProviderSupportDomainCommand *)v4 bundleIdentifier],
           !(v9 | v10))
       || [(id)v9 isEqual:v10])
      && ((unint64_t v11 = (unint64_t)[(CNContactProviderSupportDomainCommand *)self domain],
           unint64_t v12 = (unint64_t)[(CNContactProviderSupportDomainCommand *)v4 domain],
           !(v11 | v12))
       || [(id)v11 isEqual:v12])
      && ((unint64_t v13 = (unint64_t)[(CNContactProviderSupportDomainCommand *)self session],
           unint64_t v14 = (unint64_t)[(CNContactProviderSupportDomainCommand *)v4 session],
           !(v13 | v14))
       || [(id)v13 isEqual:v14]))
    {
      BOOL v15 = [(CNContactProviderSupportDomainCommand *)self shouldSynchronize];
      BOOL v16 = v15 ^ [(CNContactProviderSupportDomainCommand *)v4 shouldSynchronize] ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (NSString)commandType
{
  return self->_commandType;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (CNContactProviderSupportDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (CNContactProviderSupportSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BOOL)shouldSynchronize
{
  return self->_shouldSynchronize;
}

- (void)setShouldSynchronize:(BOOL)a3
{
  self->_shouldSynchronize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_commandType, 0);
}

- (void)initWithCommandType:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1909E3000, v0, v1, "parameter ‘commandType’ must be nonnull", v2, v3, v4, v5, v6);
}

+ (void)addDomain:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1909E3000, v0, v1, "parameter ‘domain’ must be nonnull", v2, v3, v4, v5, v6);
}

+ (void)removeDomain:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1909E3000, v0, v1, "parameter ‘domainIdentifier’ must be nonnull", v2, v3, v4, v5, v6);
}

+ (void)synchronizeDomain:usingSession:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1909E3000, v0, v1, "parameter ‘session’ must be nonnull", v2, v3, v4, v5, v6);
}

+ (void)enableDomain:bundleIdentifier:shouldSynchronize:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1909E3000, v0, v1, "parameter ‘bundleIdentifier’ must be nonnull", v2, v3, v4, v5, v6);
}

@end