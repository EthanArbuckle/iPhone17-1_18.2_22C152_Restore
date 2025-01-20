@interface SOKerberosHeimdalPluginSettings
+ (BOOL)createSettingCacheEntryIfNeededWithError:(id *)a3;
+ (BOOL)deleteSettingsForRealm:(id)a3 error:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (HeimCred_s)createCacheEntryWithError:(id *)a3;
+ (HeimCred_s)retrieveCacheEntry;
+ (HeimCred_s)retrieveCurrentSettingsForRealm:(id)a3;
+ (HeimCred_s)retrieveSetting:(id)a3 forRealm:(id)a4;
+ (NSString)appSSOKerberosCacheName;
+ (id)retrieveAllCurrentSettings;
+ (id)retrieveCurrentSettingsForRealm:(id)a3 error:(id *)a4;
+ (id)stringWithCredentialUseMode:(int64_t)a3;
+ (void)deleteAllSettings;
+ (void)retrieveAllCurrentSettings;
+ (void)retrieveCacheEntry;
+ (void)setAppSSOKerberosCacheName:(id)a3;
- (BOOL)isDefaultRealm;
- (BOOL)saveSetting:(id)a3 data:(id)a4 withError:(id *)a5;
- (BOOL)saveWithError:(id *)a3;
- (NSArray)hosts;
- (NSArray)kdcs;
- (NSDictionary)domainRealmMapping;
- (NSString)realm;
- (NSString)siteCode;
- (NSUUID)currentCredential;
- (SOKerberosHeimdalPluginSettings)init;
- (SOKerberosHeimdalPluginSettings)initWithCoder:(id)a3;
- (SOKerberosHeimdalPluginSettings)initWithRealm:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)credentialUseMode;
- (void)currentCredential;
- (void)encodeWithCoder:(id)a3;
- (void)setCredentialUseMode:(int64_t)a3;
- (void)setCurrentCredential:(id)a3;
- (void)setDefaultRealm:(BOOL)a3;
- (void)setDomainRealmMapping:(id)a3;
- (void)setHosts:(id)a3;
- (void)setKdcs:(id)a3;
- (void)setSiteCode:(id)a3;
- (void)siteCode;
@end

@implementation SOKerberosHeimdalPluginSettings

- (SOKerberosHeimdalPluginSettings)init
{
  return 0;
}

- (SOKerberosHeimdalPluginSettings)initWithRealm:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOKerberosHeimdalPluginSettings;
  v6 = [(SOKerberosHeimdalPluginSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_realm, a3);
  }

  return v7;
}

- (NSUUID)currentCredential
{
  v2 = [(SOKerberosHeimdalPluginSettings *)self realm];
  v3 = +[SOKerberosHeimdalPluginSettings retrieveSetting:@"com.apple.AppSSO.Kerberos.CurrentCredential" forRealm:v2];

  if (!v3) {
    goto LABEL_10;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)HeimCredCopyAttributes();
  id v5 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F476F8]);
  if (v4) {
    CFRelease(v4);
  }
  if (!v5
    || ([MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CFRelease(v3);

LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = (void *)v6;
  v8 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHeimdalPluginSettings currentCredential]();
  }

  CFRelease(v3);
LABEL_11:
  return (NSUUID *)v7;
}

- (void)setCurrentCredential:(id)a3
{
  uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v6 = (void *)v5;
  if (!a3 || v5)
  {
    [(SOKerberosHeimdalPluginSettings *)self saveSetting:@"com.apple.AppSSO.Kerberos.CurrentCredential" data:v5 withError:0];
  }
  else
  {
    v7 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings setCurrentCredential:](self);
    }
  }
}

- (NSString)siteCode
{
  v2 = [(SOKerberosHeimdalPluginSettings *)self realm];
  v3 = +[SOKerberosHeimdalPluginSettings retrieveSetting:@"com.apple.AppSSO.Kerberos.SiteCode" forRealm:v2];

  if (!v3) {
    goto LABEL_10;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)HeimCredCopyAttributes();
  uint64_t v5 = CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263F476F8]);
  if (v4) {
    CFRelease(v4);
  }
  if (!v5
    || ([MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CFRelease(v3);

LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = (void *)v6;
  v8 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHeimdalPluginSettings siteCode]();
  }

  CFRelease(v3);
LABEL_11:
  return (NSString *)v7;
}

- (void)setSiteCode:(id)a3
{
  uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v6 = (void *)v5;
  if (!a3 || v5)
  {
    [(SOKerberosHeimdalPluginSettings *)self saveSetting:@"com.apple.AppSSO.Kerberos.SiteCode" data:v5 withError:0];
  }
  else
  {
    v7 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings setSiteCode:](self);
    }
  }
}

+ (NSString)appSSOKerberosCacheName
{
  return (NSString *)(id)_appsSSOKerberosCacheName;
}

+ (void)setAppSSOKerberosCacheName:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(SOKerberosHeimdalPluginSettings *)self realm];
  if ([(SOKerberosHeimdalPluginSettings *)self isDefaultRealm]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [(SOKerberosHeimdalPluginSettings *)self domainRealmMapping];
  v8 = [(SOKerberosHeimdalPluginSettings *)self hosts];
  objc_super v9 = [(SOKerberosHeimdalPluginSettings *)self kdcs];
  v10 = +[SOKerberosHeimdalPluginSettings stringWithCredentialUseMode:[(SOKerberosHeimdalPluginSettings *)self credentialUseMode]];
  v11 = [v3 stringWithFormat:@"<%@: %p> Realm: %@, isDefaultRealm: %@, domainRealmMapping: %@, hosts: %@, kdcs: %@, credentialUseMode: %@", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  uint64_t v4 = [(SOKerberosHeimdalPluginSettings *)self realm];
  [v3 setObject:v4 forKeyedSubscript:@"realm"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SOKerberosHeimdalPluginSettings isDefaultRealm](self, "isDefaultRealm"));
  [v3 setObject:v5 forKeyedSubscript:@"isDefaultRealm"];

  uint64_t v6 = [(SOKerberosHeimdalPluginSettings *)self domainRealmMapping];
  [v3 setObject:v6 forKeyedSubscript:@"domainRealmMapping"];

  v7 = [(SOKerberosHeimdalPluginSettings *)self hosts];
  [v3 setObject:v7 forKeyedSubscript:@"hosts"];

  v8 = [(SOKerberosHeimdalPluginSettings *)self kdcs];
  [v3 setObject:v8 forKeyedSubscript:@"kdcs"];

  objc_super v9 = [(SOKerberosHeimdalPluginSettings *)self siteCode];
  [v3 setObject:v9 forKeyedSubscript:@"siteCode"];

  v10 = [(SOKerberosHeimdalPluginSettings *)self currentCredential];
  v11 = [v10 UUIDString];
  [v3 setObject:v11 forKeyedSubscript:@"currentCredential"];

  v12 = +[SOKerberosHeimdalPluginSettings stringWithCredentialUseMode:[(SOKerberosHeimdalPluginSettings *)self credentialUseMode]];
  [v3 setObject:v12 forKeyedSubscript:@"credentialUseMode"];

  return v3;
}

+ (id)stringWithCredentialUseMode:(int64_t)a3
{
  v3 = @"kerberosDefault";
  if (a3 == 1) {
    v3 = @"whenNotSpecified";
  }
  if (a3 == 2) {
    return @"always";
  }
  else {
    return v3;
  }
}

- (BOOL)saveWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
  if (v5)
  {
    BOOL v6 = [(SOKerberosHeimdalPluginSettings *)self saveSetting:@"com.apple.AppSSO.Kerberos.Configuration" data:v5 withError:a3];
  }
  else
  {
    v7 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings saveWithError:](self);
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)saveSetting:(id)a3 data:(id)a4 withError:(id *)a5
{
  v27[6] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:](self, v9);
  }

  v10 = [(SOKerberosHeimdalPluginSettings *)self realm];
  v11 = +[SOKerberosHeimdalPluginSettings retrieveSetting:v7 forRealm:v10];

  if (v11)
  {
    char v12 = HeimCredSetAttribute();
LABEL_8:
    CFRelease(v11);
    goto LABEL_9;
  }
  if (!v8)
  {
    char v12 = 0;
    goto LABEL_9;
  }
  v13 = +[SOKerberosHeimdalPluginSettings retrieveCacheEntry];
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = *MEMORY[0x263F47770];
    uint64_t v16 = *MEMORY[0x263F47768];
    v26[0] = *MEMORY[0x263F47780];
    v26[1] = v16;
    uint64_t v17 = *MEMORY[0x263F47788];
    v27[0] = v15;
    v27[1] = v17;
    uint64_t v18 = *MEMORY[0x263F476F0];
    v27[2] = v7;
    uint64_t v19 = *MEMORY[0x263F47760];
    v26[2] = v18;
    v26[3] = v19;
    v20 = [(SOKerberosHeimdalPluginSettings *)self realm];
    uint64_t v21 = *MEMORY[0x263F476F8];
    v27[3] = v20;
    v27[4] = v8;
    uint64_t v22 = *MEMORY[0x263F47758];
    v26[4] = v21;
    v26[5] = v22;
    v27[5] = HeimCredGetUUID();
    v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:6];

    v11 = (HeimCred_s *)HeimCredCreate();
    char v12 = v11 != 0;

    CFRelease(v14);
    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
    v25 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:]();
    }

    char v12 = 0;
  }
LABEL_9:

  return v12;
}

+ (BOOL)createSettingCacheEntryIfNeededWithError:(id *)a3
{
  uint64_t v4 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.5();
  }

  uint64_t v5 = +[SOKerberosHeimdalPluginSettings retrieveCacheEntry];
  BOOL v6 = SO_LOG_SOKerberosHeimdalPluginSettings();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.4();
    }
LABEL_11:

    CFRelease(v5);
    return 1;
  }
  if (v7) {
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:]();
  }

  uint64_t v5 = +[SOKerberosHeimdalPluginSettings createCacheEntryWithError:a3];
  BOOL v6 = SO_LOG_SOKerberosHeimdalPluginSettings();
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:]();
    }
    goto LABEL_11;
  }
  if (v8) {
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:]();
  }

  return 0;
}

+ (HeimCred_s)retrieveCacheEntry
{
  v12[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F47770];
  uint64_t v3 = *MEMORY[0x263F47768];
  v11[0] = *MEMORY[0x263F47780];
  v11[1] = v3;
  uint64_t v4 = *MEMORY[0x263F47788];
  v12[0] = v2;
  v12[1] = v4;
  v11[2] = *MEMORY[0x263F476F0];
  uint64_t v5 = [a1 appSSOKerberosCacheName];
  v12[2] = v5;
  BOOL v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  BOOL v7 = (void *)HeimCredCopyQuery();
  if ([v7 count])
  {
    if ((unint64_t)[v7 count] >= 2)
    {
      BOOL v8 = SO_LOG_SOKerberosHeimdalPluginSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SOKerberosHeimdalPluginSettings retrieveCacheEntry]();
      }
    }
    objc_super v9 = [v7 firstObject];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (HeimCred_s)createCacheEntryWithError:(id *)a3
{
  v15[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosHeimdalPluginSettings createCacheEntryWithError:]();
  }

  uint64_t v5 = *MEMORY[0x263F47770];
  uint64_t v6 = *MEMORY[0x263F47768];
  v14[0] = *MEMORY[0x263F47780];
  v14[1] = v6;
  uint64_t v7 = *MEMORY[0x263F47788];
  v15[0] = v5;
  v15[1] = v7;
  uint64_t v8 = *MEMORY[0x263F476E8];
  v15[2] = &unk_26D33C200;
  uint64_t v9 = *MEMORY[0x263F476F0];
  v14[2] = v8;
  v14[3] = v9;
  v10 = [a1 appSSOKerberosCacheName];
  v15[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  char v12 = (HeimCred_s *)HeimCredCreate();
  return v12;
}

+ (HeimCred_s)retrieveCurrentSettingsForRealm:(id)a3
{
  return (HeimCred_s *)[a1 retrieveSetting:@"com.apple.AppSSO.Kerberos.Configuration" forRealm:a3];
}

+ (HeimCred_s)retrieveSetting:(id)a3 forRealm:(id)a4
{
  v19[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 retrieveCacheEntry];
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    uint64_t v10 = *MEMORY[0x263F47768];
    v18[0] = *MEMORY[0x263F47780];
    v18[1] = v10;
    uint64_t v11 = *MEMORY[0x263F47788];
    v19[0] = *MEMORY[0x263F47770];
    v19[1] = v11;
    uint64_t v12 = *MEMORY[0x263F47760];
    v18[2] = *MEMORY[0x263F476F0];
    v18[3] = v12;
    v19[2] = v6;
    v19[3] = v7;
    v18[4] = *MEMORY[0x263F47758];
    v19[4] = HeimCredGetUUID();
    v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];
    CFRelease(v9);
    v14 = (void *)HeimCredCopyQuery();
    if ([v14 count])
    {
      if ((unint64_t)[v14 count] >= 2)
      {
        uint64_t v15 = SO_LOG_SOKerberosHeimdalPluginSettings();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[SOKerberosHeimdalPluginSettings retrieveSetting:forRealm:]();
        }
      }
      uint64_t v16 = [v14 firstObject];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    v13 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:]();
    }
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)retrieveCurrentSettingsForRealm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:error:]();
  }

  uint64_t v8 = [a1 retrieveSetting:@"com.apple.AppSSO.Kerberos.Configuration" forRealm:v6];
  if (v8)
  {
    uint64_t v9 = (const void *)v8;
    CFDictionaryRef v10 = (const __CFDictionary *)HeimCredCopyAttributes();
    uint64_t v11 = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F476F8]);
    if (v10) {
      CFRelease(v10);
    }
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:a4];
      if (v12)
      {
        v13 = SO_LOG_SOKerberosHeimdalPluginSettings();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:error:]();
        }
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)retrieveAllCurrentSettings
{
  v37[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 retrieveCacheEntry];
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = *MEMORY[0x263F47770];
    uint64_t v5 = *MEMORY[0x263F47768];
    v36[0] = *MEMORY[0x263F47780];
    v36[1] = v5;
    uint64_t v6 = *MEMORY[0x263F47788];
    v37[0] = v4;
    v37[1] = v6;
    uint64_t v7 = *MEMORY[0x263F476F0];
    v37[2] = @"com.apple.AppSSO.Kerberos.Configuration";
    uint64_t v8 = *MEMORY[0x263F47758];
    v36[2] = v7;
    v36[3] = v8;
    v37[3] = HeimCredGetUUID();
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    CFRelease(v3);
    CFDictionaryRef v10 = (void *)HeimCredCopyQuery();
    if ([v10 count])
    {
      v28 = v9;
      id v29 = (id)[MEMORY[0x263EFFA68] mutableCopy];
      if ([v10 count])
      {
        unint64_t v12 = 0;
        v13 = 0;
        v14 = (const void *)*MEMORY[0x263F476F8];
        *(void *)&long long v11 = 138412546;
        long long v27 = v11;
        do
        {
          uint64_t v15 = objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v27);

          CFDictionaryRef v16 = (const __CFDictionary *)HeimCredCopyAttributes();
          uint64_t v17 = CFDictionaryGetValue(v16, v14);
          if (v16) {
            CFRelease(v16);
          }
          if (v17)
          {
            uint64_t v18 = (void *)MEMORY[0x263F08928];
            uint64_t v19 = (void *)MEMORY[0x263EFFA08];
            v35[0] = objc_opt_class();
            v35[1] = objc_opt_class();
            v35[2] = objc_opt_class();
            v35[3] = objc_opt_class();
            v35[4] = objc_opt_class();
            v35[5] = objc_opt_class();
            v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:6];
            uint64_t v21 = [v19 setWithArray:v20];
            id v30 = v13;
            uint64_t v22 = [v18 unarchivedObjectOfClasses:v21 fromData:v17 error:&v30];
            id v23 = v30;

            if (v22)
            {
              [v29 addObject:v22];
            }
            else if (v23)
            {
              v24 = SO_LOG_SOKerberosHeimdalPluginSettings();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                v32 = v15;
                __int16 v33 = 2112;
                id v34 = v23;
                _os_log_error_impl(&dword_221304000, v24, OS_LOG_TYPE_ERROR, "error with settings: %@, %@", buf, 0x16u);
              }
            }
            v13 = v23;
          }
          else
          {
            id v23 = v13;
          }

          ++v12;
        }
        while ([v10 count] > v12);
      }
      else
      {
        id v23 = 0;
      }
      v25 = SO_LOG_SOKerberosHeimdalPluginSettings();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        +[SOKerberosHeimdalPluginSettings retrieveAllCurrentSettings]();
      }

      uint64_t v9 = v28;
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    uint64_t v9 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:]();
    }
    id v29 = 0;
  }

  return v29;
}

+ (BOOL)deleteSettingsForRealm:(id)a3 error:(id *)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = SO_LOG_SOKerberosHeimdalPluginSettings();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[SOKerberosHeimdalPluginSettings deleteSettingsForRealm:error:]();
  }

  uint64_t v7 = [a1 retrieveCacheEntry];
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    uint64_t v9 = *MEMORY[0x263F47770];
    uint64_t v10 = *MEMORY[0x263F47768];
    v18[0] = *MEMORY[0x263F47780];
    v18[1] = v10;
    uint64_t v11 = *MEMORY[0x263F47788];
    v19[0] = v9;
    v19[1] = v11;
    uint64_t v12 = *MEMORY[0x263F47760];
    v19[2] = v5;
    uint64_t v13 = *MEMORY[0x263F47758];
    v18[2] = v12;
    v18[3] = v13;
    v19[3] = HeimCredGetUUID();
    v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    char v15 = HeimCredDeleteQuery();
    CFRelease(v8);
  }
  else
  {
    CFDictionaryRef v16 = SO_LOG_SOKerberosHeimdalPluginSettings();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:]();
    }

    char v15 = 1;
  }

  return v15;
}

+ (void)deleteAllSettings
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "deleteAllSettings", v2, v3, v4, v5, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOKerberosHeimdalPluginSettings)initWithCoder:(id)a3
{
  v48[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_realm);
  int v6 = [v4 containsValueForKey:v5];

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = NSStringFromSelector(sel_realm);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

    if (v9)
    {
      uint64_t v10 = [(SOKerberosHeimdalPluginSettings *)self initWithRealm:v9];
      if (v10)
      {
        uint64_t v11 = NSStringFromSelector(sel_isDefaultRealm);
        int v12 = [v4 containsValueForKey:v11];

        if (v12)
        {
          uint64_t v13 = NSStringFromSelector(sel_isDefaultRealm);
          v10->_defaultRealm = [v4 decodeBoolForKey:v13];
        }
        v14 = NSStringFromSelector(sel_domainRealmMapping);
        int v15 = [v4 containsValueForKey:v14];

        if (v15)
        {
          CFDictionaryRef v16 = (void *)MEMORY[0x263EFFA08];
          v48[0] = objc_opt_class();
          v48[1] = objc_opt_class();
          v48[2] = objc_opt_class();
          uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:3];
          uint64_t v18 = [v16 setWithArray:v17];
          uint64_t v19 = NSStringFromSelector(sel_domainRealmMapping);
          uint64_t v20 = [v4 decodeObjectOfClasses:v18 forKey:v19];
          domainRealmMapping = v10->_domainRealmMapping;
          v10->_domainRealmMapping = (NSDictionary *)v20;
        }
        uint64_t v22 = NSStringFromSelector(sel_hosts);
        int v23 = [v4 containsValueForKey:v22];

        if (v23)
        {
          v24 = (void *)MEMORY[0x263EFFA08];
          v47[0] = objc_opt_class();
          v47[1] = objc_opt_class();
          v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
          v26 = [v24 setWithArray:v25];
          long long v27 = NSStringFromSelector(sel_hosts);
          uint64_t v28 = [v4 decodeObjectOfClasses:v26 forKey:v27];
          hosts = v10->_hosts;
          v10->_hosts = (NSArray *)v28;

          if (!v10->_hosts)
          {
            uint64_t v30 = objc_opt_new();
            v31 = v10->_hosts;
            v10->_hosts = (NSArray *)v30;
          }
        }
        v32 = NSStringFromSelector(sel_kdcs);
        int v33 = [v4 containsValueForKey:v32];

        if (v33)
        {
          id v34 = (void *)MEMORY[0x263EFFA08];
          v46[0] = objc_opt_class();
          v46[1] = objc_opt_class();
          v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
          v36 = objc_msgSend(v34, "setWithArray:", v35, v46[0]);
          v37 = NSStringFromSelector(sel_kdcs);
          uint64_t v38 = [v4 decodeObjectOfClasses:v36 forKey:v37];
          kdcs = v10->_kdcs;
          v10->_kdcs = (NSArray *)v38;

          if (!v10->_kdcs)
          {
            uint64_t v40 = objc_opt_new();
            v41 = v10->_kdcs;
            v10->_kdcs = (NSArray *)v40;
          }
        }
        v42 = NSStringFromSelector(sel_credentialUseMode);
        int v43 = [v4 containsValueForKey:v42];

        if (v43)
        {
          v44 = NSStringFromSelector(sel_credentialUseMode);
          v10->_credentialUseMode = [v4 decodeIntegerForKey:v44];
        }
      }
      self = v10;

      uint64_t v9 = self;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  realm = self->_realm;
  id v5 = a3;
  int v6 = NSStringFromSelector(sel_realm);
  [v5 encodeObject:realm forKey:v6];

  BOOL defaultRealm = self->_defaultRealm;
  uint64_t v8 = NSStringFromSelector(sel_isDefaultRealm);
  [v5 encodeBool:defaultRealm forKey:v8];

  domainRealmMapping = self->_domainRealmMapping;
  uint64_t v10 = NSStringFromSelector(sel_domainRealmMapping);
  [v5 encodeObject:domainRealmMapping forKey:v10];

  hosts = self->_hosts;
  int v12 = NSStringFromSelector(sel_hosts);
  [v5 encodeObject:hosts forKey:v12];

  kdcs = self->_kdcs;
  v14 = NSStringFromSelector(sel_kdcs);
  [v5 encodeObject:kdcs forKey:v14];

  int64_t credentialUseMode = self->_credentialUseMode;
  NSStringFromSelector(sel_credentialUseMode);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:credentialUseMode forKey:v16];
}

- (NSString)realm
{
  return self->_realm;
}

- (BOOL)isDefaultRealm
{
  return self->_defaultRealm;
}

- (void)setDefaultRealm:(BOOL)a3
{
  self->_BOOL defaultRealm = a3;
}

- (NSDictionary)domainRealmMapping
{
  return self->_domainRealmMapping;
}

- (void)setDomainRealmMapping:(id)a3
{
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
}

- (NSArray)kdcs
{
  return self->_kdcs;
}

- (void)setKdcs:(id)a3
{
}

- (int64_t)credentialUseMode
{
  return self->_credentialUseMode;
}

- (void)setCredentialUseMode:(int64_t)a3
{
  self->_int64_t credentialUseMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kdcs, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
  objc_storeStrong((id *)&self->_domainRealmMapping, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)currentCredential
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "returning currentCredential: %@", v2, v3, v4, v5, v6);
}

- (void)setCurrentCredential:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "error encoding currentCredential for realm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)siteCode
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "returning siteCode: %@", v2, v3, v4, v5, v6);
}

- (void)setSiteCode:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "error encoding siteCode for realm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)saveWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "error encoding settings for realm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)saveSetting:data:withError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "settings cache entry missing", v2, v3, v4, v5, v6);
}

- (void)saveSetting:(void *)a1 data:(NSObject *)a2 withError:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 realm];
  int v5 = 138412546;
  uint8_t v6 = a1;
  __int16 v7 = 2112;
  uint8_t v8 = v4;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "createOrSaveSettings: %@, realm: %@", (uint8_t *)&v5, 0x16u);
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "creating settings cache failed", v2, v3, v4, v5, v6);
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "settings cache created", v2, v3, v4, v5, v6);
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "creating settings cache", v2, v3, v4, v5, v6);
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "settings cache already exists", v2, v3, v4, v5, v6);
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "createSettingCacheEntryIfNeededWithError", v2, v3, v4, v5, v6);
}

+ (void)retrieveCacheEntry
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_221304000, v0, v1, "More than one cache entry", v2, v3, v4, v5, v6);
}

+ (void)createCacheEntryWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_221304000, a2, OS_LOG_TYPE_ERROR, "Error creating cache entry: %@", (uint8_t *)&v3, 0xCu);
}

+ (void)createCacheEntryWithError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "createCacheEntry", v2, v3, v4, v5, v6);
}

+ (void)retrieveSetting:forRealm:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "More than one entry for: %{public}@", v1, 0xCu);
}

+ (void)retrieveCurrentSettingsForRealm:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "returning settings: %@", v2, v3, v4, v5, v6);
}

+ (void)retrieveCurrentSettingsForRealm:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "retrieveCurrentSettingsForRealm: %@", v2, v3, v4, v5, v6);
}

+ (void)retrieveAllCurrentSettings
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "retrieveAllCurrentSettings: %@", v2, v3, v4, v5, v6);
}

+ (void)deleteSettingsForRealm:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_221304000, v0, v1, "deleteSettingsForRealm: %@", v2, v3, v4, v5, v6);
}

@end