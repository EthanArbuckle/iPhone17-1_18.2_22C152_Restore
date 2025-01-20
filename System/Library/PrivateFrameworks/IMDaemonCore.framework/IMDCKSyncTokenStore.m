@interface IMDCKSyncTokenStore
+ (id)tokenForKey:(id)a3;
+ (void)migrateKey:(id)a3 fromDatabase:(id)a4;
+ (void)persistToken:(id)a3 forKey:(id)a4;
- (id)tokenForKey:(id)a3;
- (void)migrateKey:(id)a3 fromDatabase:(id)a4;
- (void)persistToken:(id)a3 forKey:(id)a4;
@end

@implementation IMDCKSyncTokenStore

- (void)migrateKey:(id)a3 fromDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() migrateKey:v6 fromDatabase:v5];
}

- (id)tokenForKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() tokenForKey:v3];

  return v4;
}

- (void)persistToken:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() persistToken:v6 forKey:v5];
}

+ (void)migrateKey:(id)a3 fromDatabase:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [NSString stringWithFormat:@"%@-syncStoreVersion", v5];
  if (!IMGetAppIntForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Migrating sync token {key: %@, db: %@, version: %ld}", buf, 0x20u);
      }
    }
    id v9 = objc_alloc(MEMORY[0x1E4F6B810]);
    v10 = [v6 stringByExpandingTildeInPath];
    v11 = (void *)[v9 initWithPath:v10 storeName:@"IMDCKChatSyncController" dataProtectionClass:0];

    v12 = [v11 dataForKey:v5 error:0];
    int v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v5;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Found token data, saving to sms.db {key: %@}", buf, 0xCu);
        }
      }
      IMDKVPersistValueForKey();
    }
    else if (v13)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "No token data found {key: %@}", buf, 0xCu);
      }
    }
    [v11 deleteDatabase];
    IMSetAppValueForKey();
  }
}

+ (id)tokenForKey:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = IMDKVValueForKey();
  if ([v4 length])
  {
    id v10 = 0;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v10];
    id v6 = v10;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A388]) initWithCoder:v5];
    if (v6 && IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v6;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Failed to unarchive ckserver change token. Error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)persistToken:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  if (v9)
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28DB0];
    id v6 = a4;
    id v7 = (id)[[v5 alloc] initRequiringSecureCoding:1];
    [v9 encodeWithCoder:v7];
    v8 = [v7 encodedData];
    IMDKVPersistValueForKey();
  }
  else
  {
    id v7 = a4;
    IMDKVPersistValueForKey();
  }
}

@end