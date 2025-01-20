@interface CSFFollowUp
+ (BOOL)anyUserHasEngagedWithCFU;
+ (BOOL)hasDSID;
+ (BOOL)hasEngagedWithCFU;
+ (NSDate)hasEngagedWithCFUDate;
+ (NSDictionary)persistentDomain;
+ (NSNumber)hasEngagedWithCFUGlobalDomain;
+ (NSString)userDefaultsKey;
+ (NSUserDefaults)defaults;
+ (id)_persistentDomain;
+ (void)hasEngagedWithCFUGlobalDomain;
+ (void)setHasEngagedWithCFU:(BOOL)a3;
+ (void)setHasEngagedWithCFUDate:(id)a3;
+ (void)setHasEngagedWithCFUGlobalDomain:(id)a3;
@end

@implementation CSFFollowUp

+ (NSUserDefaults)defaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CloudSubscriptionFeatures.followup.engagement"];
  return (NSUserDefaults *)v2;
}

+ (BOOL)hasDSID
{
  v2 = [MEMORY[0x1E4F179D0] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = objc_msgSend(v3, "aa_personID");
  BOOL v5 = v4 != 0;

  return v5;
}

+ (NSString)userDefaultsKey
{
  v2 = [MEMORY[0x1E4F179D0] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  v4 = objc_msgSend(v3, "aa_personID");

  if (v4)
  {
    BOOL v5 = [NSString stringWithFormat:@"hasEngaged.%@", v4];
  }
  else
  {
    BOOL v5 = @"hasEngaged.device";
  }

  return (NSString *)v5;
}

+ (BOOL)hasEngagedWithCFU
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFFollowUp hasEngagedWithCFUDate];
  if (!v2)
  {
    BOOL v7 = +[CSFFollowUp hasDSID];
    v4 = _CSFGetLogSystem();
    BOOL v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        LOWORD(v15) = 0;
        v9 = "No existing value for hasEngagedWithCFU. Returning NO.";
LABEL_16:
        _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      if (v8)
      {
        v10 = +[CSFFollowUp userDefaultsKey];
        v11 = +[CSFFollowUp persistentDomain];
        int v15 = 138412546;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, "No existing value for key %@ (no DSID included). Checking if any users have seen the CFU in persistent domain %@.", (uint8_t *)&v15, 0x16u);
      }
      BOOL v12 = +[CSFFollowUp anyUserHasEngagedWithCFU];
      v4 = _CSFGetLogSystem();
      BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v13)
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, "Previous DSID has engaged with CFU. Returning YES.", (uint8_t *)&v15, 2u);
        }
        goto LABEL_5;
      }
      if (v13)
      {
        LOWORD(v15) = 0;
        v9 = "No user on this device has ever engaged with CFU. Returning NO.";
        goto LABEL_16;
      }
    }
    BOOL v6 = 0;
    goto LABEL_18;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v4 = [v3 stringFromDate:v2];

  BOOL v5 = _CSFGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1A8C7F000, v5, OS_LOG_TYPE_DEFAULT, "User has engaged with CFU? YES - on Date %@", (uint8_t *)&v15, 0xCu);
  }

LABEL_5:
  BOOL v6 = 1;
LABEL_18:

  return v6;
}

+ (void)setHasEngagedWithCFU:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "now", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setHasEngagedWithCFUDate:v4];
}

+ (NSDate)hasEngagedWithCFUDate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFFollowUp defaults];
  id v3 = +[CSFFollowUp userDefaultsKey];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      goto LABEL_11;
    }
    BOOL v8 = _CSFGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A8C7F000, v8, OS_LOG_TYPE_DEFAULT, "Existing value is not NSDate. Resetting to nil.", (uint8_t *)&v10, 2u);
    }

    +[CSFFollowUp setHasEngagedWithCFU:0];
  }
  else
  {
    BOOL v6 = _CSFGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = +[CSFFollowUp userDefaultsKey];
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "No existing value for key %@, returning nil.", (uint8_t *)&v10, 0xCu);
    }
  }
  id v5 = 0;
LABEL_11:

  return (NSDate *)v5;
}

+ (void)setHasEngagedWithCFUDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[CSFFollowUp defaults];
  id v5 = +[CSFFollowUp userDefaultsKey];
  [v4 setObject:v3 forKey:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  BOOL v7 = [v6 stringFromDate:v3];

  BOOL v8 = _CSFGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[CSFFollowUp userDefaultsKey];
    int v10 = 138412546;
    v11 = v9;
    __int16 v12 = 2112;
    BOOL v13 = v7;
    _os_log_impl(&dword_1A8C7F000, v8, OS_LOG_TYPE_DEFAULT, "Set hasEngagedWithCFUDate (key %@) to value: %@", (uint8_t *)&v10, 0x16u);
  }
}

+ (BOOL)anyUserHasEngagedWithCFU
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = +[CSFFollowUp persistentDomain];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(v2, "allKeys", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = ((char *)i + 1))
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        BOOL v8 = [v2 objectForKeyedSubscript:v7];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = _CSFGetLogSystem();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v15 = v7;
            _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, "Found user has engaged with CFU with key %@", buf, 0xCu);
          }

          LOBYTE(v4) = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v4;
}

+ (NSDictionary)persistentDomain
{
  v2 = +[CSFFollowUp defaults];
  id v3 = [v2 persistentDomainForName:@"com.apple.CloudSubscriptionFeatures.followup.engagement"];

  return (NSDictionary *)v3;
}

+ (NSNumber)hasEngagedWithCFUGlobalDomain
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _persistentDomain];
  id v3 = [v2 objectForKey:@"com.apple.csf.cfuengagement"];

  if (!v3)
  {
    BOOL v8 = _CSFGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CSFFollowUp hasEngagedWithCFUGlobalDomain](v8);
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = _CSFGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CSFFollowUp hasEngagedWithCFUGlobalDomain](v8);
    }
LABEL_12:

    id v7 = 0;
    goto LABEL_13;
  }
  int v4 = [v3 BOOLValue];
  uint64_t v5 = _CSFGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v4) {
      id v6 = @"YES";
    }
    int v10 = 138412290;
    long long v11 = v6;
    _os_log_impl(&dword_1A8C7F000, v5, OS_LOG_TYPE_DEFAULT, "[Global Domain] User has engaged with CFU? %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = v3;
LABEL_13:

  return (NSNumber *)v7;
}

+ (void)setHasEngagedWithCFUGlobalDomain:(id)a3
{
  id v7 = a3;
  int v4 = [a1 _persistentDomain];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (!v5) {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  }
  [v5 setObject:v7 forKeyedSubscript:@"com.apple.csf.cfuengagement"];
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setPersistentDomain:v5 forName:*MEMORY[0x1E4F283E0]];
}

+ (id)_persistentDomain
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 persistentDomainForName:*MEMORY[0x1E4F283E0]];

  return v3;
}

+ (void)hasEngagedWithCFUGlobalDomain
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A8C7F000, log, OS_LOG_TYPE_ERROR, "Defaults-stored value is not of expected type.", v1, 2u);
}

@end