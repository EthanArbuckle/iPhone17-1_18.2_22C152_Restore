@interface CESRSpeechProfileInstance
+ (id)loadAllInstancesAtSpeechProfileSiteURL:(id)a3 error:(id *)a4;
+ (id)loadInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)loadOrCreateInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)_updateOptions:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstance:(id)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)updateOptions:(unsigned __int8)a3 error:(id *)a4;
- (CCSetChangeRegistry)changeRegistry;
- (CESRSpeechProfileInstance)init;
- (CESRSpeechProfileInstance)initWithSpeechProfileSiteURL:(id)a3 create:(BOOL)a4 locale:(id)a5 options:(unsigned __int8)a6 error:(id *)a7;
- (NSLocale)locale;
- (id)_changeRegistryFilename;
- (id)_updateVersion:(id)a3 forKeys:(id)a4 logKey:(id)a5;
- (id)description;
- (id)lastCompletedVersionForSpeechCategory:(id)a3;
- (id)lastRegisteredVersionForSpeechCategory:(id)a3;
- (unint64_t)hash;
- (unsigned)options;
- (void)recordUpdateCompletedForSpeechCategories:(id)a3 version:(id)a4;
- (void)registerUpdateForSpeechCategories:(id)a3 version:(id)a4;
@end

@implementation CESRSpeechProfileInstance

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRegistry, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (CCSetChangeRegistry)changeRegistry
{
  return self->_changeRegistry;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSLocale *)self->_locale hash];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[CESRSpeechProfileInstance options](self, "options"));
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqualToInstance:(id)a3
{
  id v4 = a3;
  locale = self->_locale;
  v6 = [v4 locale];
  if ([(NSLocale *)locale isEqual:v6])
  {
    int v7 = [(CESRSpeechProfileInstance *)self options];
    BOOL v8 = v7 == [v4 options];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CESRSpeechProfileInstance *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CESRSpeechProfileInstance *)self isEqualToInstance:v5];

  return v6;
}

- (BOOL)updateOptions:(unsigned __int8)a3 error:(id *)a4
{
  log = self->_log;
  BOOL v6 = [NSNumber numberWithUnsignedChar:a3];
  LOBYTE(a4) = [(CESRDictionaryLog *)log writeUpdatedObject:v6 forKey:@"options" error:a4];

  return (char)a4;
}

- (unsigned)options
{
  v2 = [(CESRDictionaryLog *)self->_log objectForKey:@"options"];
  unsigned __int8 v3 = [v2 unsignedCharValue];

  return v3;
}

- (id)lastCompletedVersionForSpeechCategory:(id)a3
{
  log = self->_log;
  id v4 = a3;
  unint64_t v5 = [(CESRDictionaryLog *)log mutableDictionaryForKey:@"completed" error:0];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)lastRegisteredVersionForSpeechCategory:(id)a3
{
  log = self->_log;
  id v4 = a3;
  unint64_t v5 = [(CESRDictionaryLog *)log mutableDictionaryForKey:@"registered" error:0];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)recordUpdateCompletedForSpeechCategories:(id)a3 version:(id)a4
{
  log = self->_log;
  id v5 = [(CESRSpeechProfileInstance *)self _updateVersion:a4 forKeys:a3 logKey:@"completed"];
  [(CESRDictionaryLog *)log writeUpdatedObject:v5 forKey:@"completed" error:0];
}

- (void)registerUpdateForSpeechCategories:(id)a3 version:(id)a4
{
  log = self->_log;
  id v5 = [(CESRSpeechProfileInstance *)self _updateVersion:a4 forKeys:a3 logKey:@"registered"];
  [(CESRDictionaryLog *)log writeUpdatedObject:v5 forKey:@"registered" error:0];
}

- (id)_updateVersion:(id)a3 forKeys:(id)a4 logKey:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(CESRDictionaryLog *)self->_log mutableDictionaryForKey:a5 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v10, "setObject:forKey:", v8, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  return v10;
}

- (BOOL)_updateOptions:(unsigned __int8)a3 error:(id *)a4
{
  log = self->_log;
  BOOL v6 = [NSNumber numberWithUnsignedChar:a3];
  LOBYTE(a4) = [(CESRDictionaryLog *)log writeUpdatedObject:v6 forKey:@"options" error:a4];

  return (char)a4;
}

- (BOOL)remove:(id *)a3
{
  int v5 = -[CCSetChangeRegistry clearAllBookmarksAndCommit:](self->_changeRegistry, "clearAllBookmarksAndCommit:");
  if (v5)
  {
    log = self->_log;
    LOBYTE(v5) = [(CESRDictionaryLog *)log clear:a3];
  }
  return v5;
}

- (id)description
{
  unsigned __int8 v3 = NSString;
  id v4 = [(NSLocale *)self->_locale localeIdentifier];
  int v5 = CESRSpeechProfileInstanceOptionsDescription([(CESRSpeechProfileInstance *)self options]);
  BOOL v6 = [v3 stringWithFormat:@"%@:[%@]", v4, v5];

  return v6;
}

- (id)_changeRegistryFilename
{
  v2 = [(NSLocale *)self->_locale localeIdentifier];
  unsigned __int8 v3 = [@"registry_" stringByAppendingString:v2];

  return v3;
}

- (CESRSpeechProfileInstance)initWithSpeechProfileSiteURL:(id)a3 create:(BOOL)a4 locale:(id)a5 options:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  BOOL v10 = a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CESRSpeechProfileInstance;
  uint64_t v14 = [(CESRSpeechProfileInstance *)&v34 init];
  if (!v14) {
    goto LABEL_7;
  }
  v14->_dataProtectionClass = SFProtectionClassForDataSiteURL();
  objc_storeStrong((id *)&v14->_locale, a5);
  v15 = [(NSLocale *)v14->_locale localeIdentifier];

  if (!v15)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F281F8];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v27 = NSString;
    v28 = [v13 localeIdentifier];
    v29 = [v27 stringWithFormat:@"Invalid locale: %@ in speechProfileSite: %@", v28, v12];
    v36[0] = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v31 = [v25 errorWithDomain:v26 code:-1000 userInfo:v30];
    v32 = v31;
    if (a7 && v31) {
      *a7 = v31;
    }

    goto LABEL_13;
  }
  v16 = [(NSLocale *)v14->_locale localeIdentifier];
  long long v17 = [@"instance_" stringByAppendingString:v16];

  long long v18 = [[CESRDictionaryLog alloc] initWithFilename:v17 protectionClass:v14->_dataProtectionClass directory:v12 readOnly:0 create:v10 error:a7];
  log = v14->_log;
  v14->_log = v18;

  if (!v14->_log || v10 && ![(CESRSpeechProfileInstance *)v14 _updateOptions:v8 error:a7])
  {

LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F57FC0]);
  v21 = [(CESRSpeechProfileInstance *)v14 _changeRegistryFilename];
  uint64_t v22 = [v20 initWithFilename:v21 directory:v12 protectionClass:v14->_dataProtectionClass error:a7];
  changeRegistry = v14->_changeRegistry;
  v14->_changeRegistry = (CCSetChangeRegistry *)v22;

  v24 = (CESRSpeechProfileInstance *)v14->_changeRegistry;
  if (v24) {
LABEL_7:
  }
    v24 = v14;
LABEL_14:

  return v24;
}

- (CESRSpeechProfileInstance)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (id)loadInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CESRSpeechProfileInstance alloc] initWithSpeechProfileSiteURL:v8 create:0 locale:v7 options:0 error:a5];

  return v9;
}

+ (id)loadOrCreateInstanceAtSpeechProfileSiteURL:(id)a3 locale:(id)a4 options:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CESRSpeechProfileInstance alloc] initWithSpeechProfileSiteURL:v10 create:1 locale:v9 options:v7 error:a6];

  return v11;
}

+ (id)loadAllInstancesAtSpeechProfileSiteURL:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v5 path];
  v29 = a4;
  v30 = v6;
  id v8 = [v6 contentsOfDirectoryAtPath:v7 error:a4];

  if (v8)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v35 = 1;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v26 = v8;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      v27 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 relativeToURL:v5];
          v16 = [v15 path];

          if ([v30 fileExistsAtPath:v16 isDirectory:&v35]) {
            BOOL v17 = v35 == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17 && [v14 hasPrefix:@"instance_"])
          {
            long long v18 = [v14 substringFromIndex:objc_msgSend(@"instance_", "length")];
            long long v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v18];
            uint64_t v20 = +[CESRSpeechProfileInstance loadInstanceAtSpeechProfileSiteURL:v5 locale:v19 error:v29];
            if (!v20)
            {

              id v24 = 0;
              id v8 = v26;
              v23 = v28;
              goto LABEL_22;
            }
            v21 = (void *)v20;
            [v28 addObject:v20];

            id v9 = v27;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v22 = *MEMORY[0x1E4F4E380];
    v23 = v28;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "+[CESRSpeechProfileInstance loadAllInstancesAtSpeechProfileSiteURL:error:]";
      __int16 v38 = 2112;
      id v39 = v28;
      _os_log_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_INFO, "%s Managed profile instances: %@", buf, 0x16u);
    }
    id v24 = v28;
    id v8 = v26;
LABEL_22:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

@end