@interface SOKerberosRealmSettings
- (BOOL)delayUserSetupCleared;
- (BOOL)networkAvailable;
- (BOOL)passwordChangeInProgress;
- (BOOL)passwordNeverExpires;
- (BOOL)platformSSOLoginInProgress;
- (BOOL)userCancelledLogin;
- (NSData)pkinitPersistientRef;
- (NSDate)dateADPasswordCanChange;
- (NSDate)dateADPasswordLastChangedWhenSynced;
- (NSDate)dateExpirationChecked;
- (NSDate)dateExpirationNotificationSent;
- (NSDate)dateLastLogin;
- (NSDate)dateLocalPasswordLastChanged;
- (NSDate)dateLocalPasswordLastChangedWhenSynced;
- (NSDate)dateLoginCancelled;
- (NSDate)dateNextPacRefresh;
- (NSDate)datePasswordExpires;
- (NSDate)datePasswordLastChanged;
- (NSDate)datePasswordLastChangedAtLogin;
- (NSDate)dateUserSignedOut;
- (NSMutableArray)siteCodeCache;
- (NSNumber)daysUntilExpiration;
- (NSString)networkHomeDirectory;
- (NSString)notificationName;
- (NSString)realm;
- (NSString)smartCardTokenID;
- (NSString)userName;
- (NSString)userPrincipalName;
- (NSUUID)credentialUUID;
- (NSUserDefaults)defaults;
- (OS_dispatch_semaphore)platformSSOLoginSemaphore;
- (SOKerberosRealmSettings)initWithRealm:(id)a3;
- (id)dumpSiteCodeCache;
- (id)realmKey:(id)a3;
- (id)siteCodeForNetworkFingerprint:(id)a3;
- (int)notifyToken;
- (void)cacheSiteCode:(id)a3;
- (void)dealloc;
- (void)loadSiteCodes;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platformSSOLoginInProgress;
- (void)removeAllValues;
- (void)save;
- (void)saveSiteCodes;
- (void)setCredentialUUID:(id)a3;
- (void)setDateADPasswordCanChange:(id)a3;
- (void)setDateADPasswordLastChangedWhenSynced:(id)a3;
- (void)setDateExpirationChecked:(id)a3;
- (void)setDateExpirationNotificationSent:(id)a3;
- (void)setDateLastLogin:(id)a3;
- (void)setDateLocalPasswordLastChanged:(id)a3;
- (void)setDateLocalPasswordLastChangedWhenSynced:(id)a3;
- (void)setDateLoginCancelled:(id)a3;
- (void)setDateNextPacRefresh:(id)a3;
- (void)setDatePasswordExpires:(id)a3;
- (void)setDatePasswordLastChanged:(id)a3;
- (void)setDatePasswordLastChangedAtLogin:(id)a3;
- (void)setDateUserSignedOut:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelayUserSetupCleared:(BOOL)a3;
- (void)setNetworkAvailable:(BOOL)a3;
- (void)setNetworkHomeDirectory:(id)a3;
- (void)setNotificationName:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setPasswordChangeInProgress:(BOOL)a3;
- (void)setPasswordNeverExpires:(BOOL)a3;
- (void)setPkinitPersistientRef:(id)a3;
- (void)setPlatformSSOLoginInProgress:(BOOL)a3;
- (void)setRealm:(id)a3;
- (void)setSiteCodeCache:(id)a3;
- (void)setSmartCardTokenID:(id)a3;
- (void)setUserCancelledLogin:(BOOL)a3;
- (void)setUserName:(id)a3;
- (void)setUserPrincipalName:(id)a3;
- (void)startListeningForPlatformSSOTGTChanges;
@end

@implementation SOKerberosRealmSettings

- (SOKerberosRealmSettings)initWithRealm:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SO_LOG_SOKerberosRealmSettings();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SOKerberosRealmSettings initWithRealm:]";
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_221304000, v6, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v17.receiver = self;
  v17.super_class = (Class)SOKerberosRealmSettings;
  v7 = [(SOKerberosRealmSettings *)&v17 init];
  if (v7)
  {
    uint64_t v8 = objc_opt_new();
    siteCodeCache = v7->_siteCodeCache;
    v7->_siteCodeCache = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_realm, a3);
    uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    defaults = v7->_defaults;
    v7->_defaults = (NSUserDefaults *)v10;

    v12 = v7->_defaults;
    v13 = [(SOKerberosRealmSettings *)v7 realmKey:@"siteCodeCache"];
    [(NSUserDefaults *)v12 addObserver:v7 forKeyPath:v13 options:5 context:0];

    v7->_notifyToken = -1;
    uint64_t v14 = [NSString stringWithFormat:@"com.apple.Kerberos.%@", v5];
    notificationName = v7->_notificationName;
    v7->_notificationName = (NSString *)v14;
  }
  return v7;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
}

- (id)realmKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SOKerberosRealmSettings *)self realm];
  uint8_t v6 = [v5 stringByAppendingFormat:@":%@", v4];

  return v6;
}

- (void)removeAllValues
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [v3 dictionaryRepresentation];
  uint64_t v5 = [v4 allKeys];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        v12 = [(SOKerberosRealmSettings *)self realm];
        v13 = [v12 stringByAppendingFormat:@":"];
        int v14 = [v11 hasPrefix:v13];

        if (v14)
        {
          v15 = [(SOKerberosRealmSettings *)self defaults];
          [v15 removeObjectForKey:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)save
{
}

- (NSString)userPrincipalName
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"userPrincipalName"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSString *)v5;
}

- (void)setUserPrincipalName:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"userPrincipalName"];
  [v6 setObject:v4 forKey:v5];
}

- (NSString)userName
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"userName"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSString *)v5;
}

- (void)setUserName:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"userName"];
  [v6 setObject:v4 forKey:v5];
}

- (NSUUID)credentialUUID
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"credentialUUID"];
  uint64_t v5 = [v3 objectForKey:v4];

  if (v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  }
  else {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setCredentialUUID:(id)a3
{
  id v4 = a3;
  id v7 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [v4 UUIDString];

  id v6 = [(SOKerberosRealmSettings *)self realmKey:@"credentialUUID"];
  [v7 setObject:v5 forKey:v6];
}

- (NSData)pkinitPersistientRef
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"pkinitPersistientRef"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSData *)v5;
}

- (void)setPkinitPersistientRef:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"pkinitPersistientRef"];
  [v6 setObject:v4 forKey:v5];
}

- (NSString)smartCardTokenID
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"smartCardTokenID"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSString *)v5;
}

- (void)setSmartCardTokenID:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"smartCardTokenID"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateLastLogin
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateLastLogin"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateLastLogin:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateLastLogin"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)datePasswordLastChanged
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordLastChanged"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDatePasswordLastChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordLastChanged"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)datePasswordLastChangedAtLogin
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordLastChangedAtLogin"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDatePasswordLastChangedAtLogin:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordLastChangedAtLogin"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateNextPacRefresh
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateNextPacRefresh"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateNextPacRefresh:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateNextPacRefresh"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateADPasswordCanChange
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordCanChange"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateADPasswordCanChange:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordCanChange"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateLocalPasswordLastChanged
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateLocalPasswordLastChanged"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateLocalPasswordLastChanged:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateLocalPasswordLastChanged"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateADPasswordLastChangedWhenSynced
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateADPasswordLastChangedWhenSynced"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateADPasswordLastChangedWhenSynced:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateADPasswordLastChangedWhenSynced"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateLocalPasswordLastChangedWhenSynced
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateLocalPasswordLastChangedWhenSynced"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateLocalPasswordLastChangedWhenSynced:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateLocalPasswordLastChangedWhenSynced"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)datePasswordExpires
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordExpires"];
  uint64_t v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDatePasswordExpires:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  uint64_t v5 = [(SOKerberosRealmSettings *)self realmKey:@"datePasswordExpires"];
  [v6 setObject:v4 forKey:v5];
}

- (BOOL)passwordNeverExpires
{
  uint64_t v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"passwordNeverExpires"];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setPasswordNeverExpires:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"passwordNeverExpires"];
  [v6 setBool:v3 forKey:v5];
}

- (NSDate)dateExpirationNotificationSent
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateExpirationNotificationSent"];
  char v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateExpirationNotificationSent:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateExpirationNotificationSent"];
  [v6 setObject:v4 forKey:v5];
}

- (NSDate)dateExpirationChecked
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateExpirationChecked"];
  char v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateExpirationChecked:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateExpirationChecked"];
  [v6 setObject:v4 forKey:v5];
}

- (NSNumber)daysUntilExpiration
{
  uint64_t v2 = [(SOKerberosRealmSettings *)self datePasswordExpires];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  char v5 = NSNumber;
  return (NSNumber *)[v5 numberWithDouble:v4 / 86400.0];
}

- (NSString)networkHomeDirectory
{
  double v3 = [(SOKerberosRealmSettings *)self defaults];
  double v4 = [(SOKerberosRealmSettings *)self realmKey:@"networkHomeDirectory"];
  char v5 = [v3 objectForKey:v4];

  return (NSString *)v5;
}

- (void)setNetworkHomeDirectory:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"networkHomeDirectory"];
  [v6 setObject:v4 forKey:v5];
}

- (BOOL)delayUserSetupCleared
{
  double v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"delayUserSetupCleared"];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setDelayUserSetupCleared:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"delayUserSetupCleared"];
  [v6 setBool:v3 forKey:v5];
}

- (BOOL)networkAvailable
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"networkAvailable"];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setNetworkAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"networkAvailable"];
  [v6 setBool:v3 forKey:v5];
}

- (BOOL)userCancelledLogin
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"userCancelledLogin"];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setUserCancelledLogin:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"userCancelledLogin"];
  [v6 setBool:v3 forKey:v5];
}

- (NSDate)dateLoginCancelled
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateLoginCancelled"];
  char v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateLoginCancelled:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateLoginCancelled"];
  [v6 setObject:v4 forKey:v5];
}

- (BOOL)passwordChangeInProgress
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"passwordChangeInProgress"];
  char v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (void)setPasswordChangeInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"passwordChangeInProgress"];
  [v6 setBool:v3 forKey:v5];
}

- (NSDate)dateUserSignedOut
{
  BOOL v3 = [(SOKerberosRealmSettings *)self defaults];
  id v4 = [(SOKerberosRealmSettings *)self realmKey:@"dateUserSignedOut"];
  char v5 = [v3 objectForKey:v4];

  return (NSDate *)v5;
}

- (void)setDateUserSignedOut:(id)a3
{
  id v4 = a3;
  id v6 = [(SOKerberosRealmSettings *)self defaults];
  char v5 = [(SOKerberosRealmSettings *)self realmKey:@"dateUserSignedOut"];
  [v6 setObject:v4 forKey:v5];
}

- (OS_dispatch_semaphore)platformSSOLoginSemaphore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_platformSSOLoginSemaphore;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)platformSSOLoginInProgress
{
  p_int notifyToken = &self->_notifyToken;
  int notifyToken = self->_notifyToken;
  if (notifyToken == -1)
  {
    if (notify_register_check([(NSString *)self->_notificationName UTF8String], p_notifyToken))
    {
      char v5 = SO_LOG_SOKerberosRealmSettings();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosRealmSettings platformSSOLoginInProgress]();
      }
    }
    int notifyToken = *p_notifyToken;
    uint64_t state64 = 0;
    if (notifyToken == -1)
    {
      id v6 = SO_LOG_SOKerberosRealmSettings();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosRealmSettings platformSSOLoginInProgress](v6);
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t state64 = 0;
  }
  if (notify_get_state(notifyToken, &state64))
  {
    id v6 = SO_LOG_SOKerberosRealmSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosRealmSettings platformSSOLoginInProgress]();
    }
LABEL_13:
  }
  id v7 = [NSNumber numberWithUnsignedLongLong:state64];
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setPlatformSSOLoginInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  p_int notifyToken = &self->_notifyToken;
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    goto LABEL_17;
  }
  if (notify_register_check([(NSString *)self->_notificationName UTF8String], p_notifyToken))
  {
    id v7 = SO_LOG_SOKerberosRealmSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosRealmSettings platformSSOLoginInProgress]();
    }
  }
  int notifyToken = *p_notifyToken;
  if (*p_notifyToken != -1)
  {
LABEL_17:
    if (notify_set_state(notifyToken, v3))
    {
      char v8 = SO_LOG_SOKerberosRealmSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosRealmSettings setPlatformSSOLoginInProgress:]();
      }
    }
  }
  if (notify_post([(NSString *)self->_notificationName UTF8String]))
  {
    uint64_t v9 = SO_LOG_SOKerberosRealmSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosRealmSettings setPlatformSSOLoginInProgress:]();
    }
  }
}

- (void)startListeningForPlatformSSOTGTChanges
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "notify_register_dispatch failed: %u", v2, v3, v4, v5, v6);
}

void __65__SOKerberosRealmSettings_startListeningForPlatformSSOTGTChanges__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  int v2 = [*(id *)(a1 + 32) platformSSOLoginInProgress];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    if (v3) {
      goto LABEL_7;
    }
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    uint64_t v5 = *(void *)(a1 + 32);
    uint8_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    dispatch_semaphore_signal(v3);
    uint64_t v7 = *(void *)(a1 + 32);
    uint8_t v6 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;
  }

LABEL_7:
  objc_sync_exit(obj);
}

- (id)dumpSiteCodeCache
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(SOKerberosRealmSettings *)v2 siteCodeCache];
  dispatch_semaphore_t v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return v4;
}

- (void)cacheSiteCode:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint8_t v6 = [(SOKerberosRealmSettings *)v5 siteCodeCache];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 networkFingerprint];
        v13 = [v4 networkFingerprint];
        int v14 = [v12 isEqualToString:v13];

        if (v14) {
          [(NSMutableArray *)v5->_siteCodeCache removeObject:v11];
        }
        [v11 age];
        if (v15 > 432000.0) {
          [(NSMutableArray *)v5->_siteCodeCache removeObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  long long v16 = SO_LOG_SOKerberosRealmSettings();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v17 = [v4 code];
    [(SOKerberosRealmSettings *)v17 cacheSiteCode:v16];
  }

  [(NSMutableArray *)v5->_siteCodeCache addObject:v4];
  [(SOKerberosRealmSettings *)v5 saveSiteCodes];
  objc_sync_exit(v5);
}

- (id)siteCodeForNetworkFingerprint:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint8_t v6 = [(SOKerberosRealmSettings *)v5 siteCodeCache];
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 networkFingerprint];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v13 = SO_LOG_SOKerberosRealmSettings();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            int v14 = [v10 code];
            [(SOKerberosRealmSettings *)v14 siteCodeForNetworkFingerprint:v13];
          }

          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v5);
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = SO_LOG_SOKerberosRealmSettings();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:]();
  }

  v13 = [(SOKerberosRealmSettings *)self realmKey:@"siteCodeCache"];
  int v14 = [v9 isEqualToString:v13];

  if (v14) {
    [(SOKerberosRealmSettings *)self loadSiteCodes];
  }
  double v15 = [(SOKerberosRealmSettings *)self realmKey:@"platformSSOLoginInProgress"];
  int v16 = [v9 isEqualToString:v15];

  if (v16)
  {
    long long v17 = self;
    objc_sync_enter(v17);
    long long v18 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

    if (v18)
    {
      long long v19 = SO_LOG_SOKerberosRealmSettings();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:]();
      }

      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      platformSSOLoginSemaphore = v17->_platformSSOLoginSemaphore;
      v17->_platformSSOLoginSemaphore = (OS_dispatch_semaphore *)v20;
    }
    else
    {
      uint64_t v22 = [(SOKerberosRealmSettings *)v17 platformSSOLoginSemaphore];

      if (v22)
      {
        v23 = SO_LOG_SOKerberosRealmSettings();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosRealmSettings observeValueForKeyPath:ofObject:change:context:]();
        }

        dispatch_semaphore_signal((dispatch_semaphore_t)v17->_platformSSOLoginSemaphore);
      }
    }
    objc_sync_exit(v17);
  }
}

- (void)loadSiteCodes
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "Error deserializing plist: %{public}@", v1, 0xCu);
}

- (void)saveSiteCodes
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "Error archiving site code cache: error: %{public}@", v1, 0xCu);
}

- (NSMutableArray)siteCodeCache
{
  return self->_siteCodeCache;
}

- (void)setSiteCodeCache:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDefaults:(id)a3
{
}

- (NSString)realm
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRealm:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_int notifyToken = a3;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_siteCodeCache, 0);
  objc_storeStrong((id *)&self->_platformSSOLoginSemaphore, 0);
}

- (void)platformSSOLoginInProgress
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
}

- (void)setPlatformSSOLoginInProgress:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)setPlatformSSOLoginInProgress:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_221304000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)cacheSiteCode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_221304000, a3, (uint64_t)a3, "caching site code: %@", (uint8_t *)a2);
}

- (void)siteCodeForNetworkFingerprint:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0(&dword_221304000, a3, (uint64_t)a3, "found cached site code: %@", (uint8_t *)a2);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "signaling sem: %@", v2);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "Creating sem: %@", v2);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_221304000, v1, OS_LOG_TYPE_DEBUG, "Defaults updated: %@, %@", v2, 0x16u);
}

@end