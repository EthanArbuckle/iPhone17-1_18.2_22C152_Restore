@interface BCSHousekeeper
- (BCSHousekeeper)initWithUserDefaults:(id)a3;
- (BCSHousekeeper)initWithUserDefaults:(id)a3 currentVersion:(int64_t)a4;
- (NSUserDefaults)userDefaults;
- (int64_t)currentVersion;
- (void)cleanupDataAtOldPathsIfNeeded;
@end

@implementation BCSHousekeeper

- (BCSHousekeeper)initWithUserDefaults:(id)a3
{
  return [(BCSHousekeeper *)self initWithUserDefaults:a3 currentVersion:1];
}

- (BCSHousekeeper)initWithUserDefaults:(id)a3 currentVersion:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BCSHousekeeper;
  v8 = [(BCSHousekeeper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDefaults, a3);
    v9->_currentVersion = a4;
  }

  return v9;
}

- (void)cleanupDataAtOldPathsIfNeeded
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(BCSHousekeeper *)self userDefaults];
  uint64_t v4 = [v3 integerForKey:@"BCSHousekeepingCurrentVersion"];

  if (v4 >= [(BCSHousekeeper *)self currentVersion])
  {
    v5 = ABSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[BCSHousekeeper cleanupDataAtOldPathsIfNeeded]";
      __int16 v9 = 2048;
      uint64_t v10 = v4;
      _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s Cleanup not needed. Last completed cleanup task number: %ld", buf, 0x16u);
    }
  }
  else
  {
    id v6 = [(BCSHousekeeper *)self userDefaults];
    objc_msgSend(v6, "setInteger:forKey:", -[BCSHousekeeper currentVersion](self, "currentVersion"), @"BCSHousekeepingCurrentVersion");
  }
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end