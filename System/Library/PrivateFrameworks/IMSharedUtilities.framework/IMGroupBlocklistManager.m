@interface IMGroupBlocklistManager
+ (id)groupsBlocklistFilename;
+ (id)sharedInstance;
- (BOOL)hasFileChanged;
- (BOOL)isFeatureDisabled;
- (BOOL)isGroupInBlocklist:(id)a3;
- (IMGroupBlocklistManager)init;
- (NSDate)lastModifiedDate;
- (id)initFromFile:(id)a3;
- (void)_updateLastModifiedDate:(id)a3;
- (void)blocklistGroupId:(id)a3;
- (void)loadData;
- (void)loadFromFile:(id)a3;
- (void)reloadIfNeeded;
- (void)save;
- (void)setLastModifiedDate:(id)a3;
@end

@implementation IMGroupBlocklistManager

+ (id)groupsBlocklistFilename
{
  v2 = IMSystemRootDirectory();
  v3 = [(id)qword_1E94F8478 stringByExpandingTildeInPath];
  v4 = [v2 stringByAppendingPathComponent:v3];
  v5 = [v4 stringByAppendingPathComponent:@"/com.apple.messages.group-blacklist.plist"];

  return v5;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A086212C;
  block[3] = &unk_1E5A10168;
  block[4] = a1;
  if (qword_1EB4A6598 != -1) {
    dispatch_once(&qword_1EB4A6598, block);
  }
  v2 = (void *)qword_1E94FFC38;

  return v2;
}

- (IMGroupBlocklistManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMGroupBlocklistManager;
  v2 = [(IMGroupBlocklistManager *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)qword_1E9522588;
    qword_1E9522588 = (uint64_t)v3;

    v5 = v2;
  }

  return v2;
}

- (id)initFromFile:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMGroupBlocklistManager;
  v5 = [(IMGroupBlocklistManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(IMGroupBlocklistManager *)v5 loadFromFile:v4];
    objc_super v7 = v6;
  }

  return v6;
}

- (BOOL)hasFileChanged
{
  id v3 = [(IMGroupBlocklistManager *)self lastModifiedDate];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = +[IMGroupBlocklistManager groupsBlocklistFilename];
  if (v3)
  {
    uint64_t v13 = 0;
    v6 = [v4 attributesOfItemAtPath:v5 error:&v13];
    uint64_t v7 = v13;
    v8 = [v6 objectForKey:*MEMORY[0x1E4F28310]];

    BOOL v9 = 0;
    if (!v7)
    {
      if (v8)
      {
        v10 = [(IMGroupBlocklistManager *)self lastModifiedDate];
        BOOL v9 = [v10 compare:v8] != 0;
      }
    }

    return v9;
  }
  else
  {
    char v12 = [v4 fileExistsAtPath:v5];

    return v12;
  }
}

- (void)blocklistGroupId:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IMGroupBlocklistManager *)self isFeatureDisabled])
  {
    [(IMGroupBlocklistManager *)self reloadIfNeeded];
    v5 = [(id)qword_1E9522588 objectForKey:v4];

    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v4;
          _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Already blocklisted groupId: %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    else
    {
      if (v6)
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v4;
          _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Blocklisting groupId: %@", (uint8_t *)&v11, 0xCu);
        }
      }
      BOOL v9 = (void *)qword_1E9522588;
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v9 setValue:v10 forKey:v4];

      [(IMGroupBlocklistManager *)self save];
    }
  }
}

- (BOOL)isGroupInBlocklist:(id)a3
{
  id v4 = a3;
  if ([(IMGroupBlocklistManager *)self isFeatureDisabled])
  {
    BOOL v5 = 0;
  }
  else
  {
    [(IMGroupBlocklistManager *)self reloadIfNeeded];
    int v6 = [(id)qword_1E9522588 objectForKey:v4];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)isFeatureDisabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"md-group-blacklist-disable"];

  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Checking if feature is disabled by bag key: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  char v5 = [v3 BOOLValue];

  return v5;
}

- (void)save
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = +[IMGroupBlocklistManager groupsBlocklistFilename];
  id v4 = (void *)qword_1E9522588;
  char v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = [@"file://" stringByAppendingString:v3];
  int v7 = [v5 URLWithString:v6];
  id v12 = 0;
  [v4 writeToURL:v7 error:&v12];
  id v8 = v12;

  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v3;
        __int16 v15 = 2112;
        id v16 = v8;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Failed to save to %@: Error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v9)
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Saved to %@", buf, 0xCu);
      }
    }
    [(IMGroupBlocklistManager *)self _updateLastModifiedDate:v3];
  }
}

- (void)loadData
{
  id v3 = +[IMGroupBlocklistManager groupsBlocklistFilename];
  [(IMGroupBlocklistManager *)self loadFromFile:v3];
}

- (void)loadFromFile:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
  int v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = [@"file://" stringByAppendingString:v4];
  id v8 = [v6 URLWithString:v7];
  id v17 = 0;
  uint64_t v9 = [v5 initWithContentsOfURL:v8 error:&v17];
  id v10 = v17;
  int v11 = (void *)qword_1E9522588;
  qword_1E9522588 = v9;

  LOBYTE(v7) = qword_1E9522588 == 0;
  int v12 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v12)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        uint64_t v21 = (uint64_t)v10;
        _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Failed to load blocklist from file(%@). Error: %@", buf, 0x16u);
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = (void *)qword_1E9522588;
    qword_1E9522588 = (uint64_t)v15;
  }
  else
  {
    if (v12)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v4;
        __int16 v20 = 2112;
        uint64_t v21 = qword_1E9522588;
        _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Loaded blocklist from file(%@) %@.", buf, 0x16u);
      }
    }
    [(IMGroupBlocklistManager *)self _updateLastModifiedDate:v4];
  }
}

- (void)_updateLastModifiedDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (NSDate *)a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  int v6 = [v5 attributesOfItemAtPath:v4 error:&v14];
  uint64_t v7 = (NSDate *)v14;
  id v8 = [v6 objectForKey:*MEMORY[0x1E4F28310]];

  if (v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [(IMGroupBlocklistManager *)self setLastModifiedDate:v9];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        lastModifiedDate = self->_lastModifiedDate;
        *(_DWORD *)buf = 138412802;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v7;
        __int16 v19 = 2112;
        __int16 v20 = lastModifiedDate;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Failed to get date of last update from file(%@): %@. Set to %@.", buf, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = self->_lastModifiedDate;
        *(_DWORD *)buf = 138412802;
        id v16 = v8;
        __int16 v17 = 2112;
        v18 = v13;
        __int16 v19 = 2112;
        __int16 v20 = v4;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Setting lastModifiedDate to %@ from %@ file(%@).", buf, 0x20u);
      }
    }
    [(IMGroupBlocklistManager *)self setLastModifiedDate:v8];
  }
}

- (void)reloadIfNeeded
{
  if ([(IMGroupBlocklistManager *)self hasFileChanged])
  {
    MEMORY[0x1F4181798](self, sel_loadData);
  }
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end