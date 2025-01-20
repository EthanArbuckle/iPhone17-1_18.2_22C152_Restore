@interface IMDCKDatabaseManager
+ (IMDCKDatabaseManager)sharedInstance;
- (BOOL)_serverSaysToUseOldContainer;
- (CKContainer)manateeContainer;
- (CKContainer)nickNameContainer;
- (CKContainer)truthContainer;
- (IMDCKDatabaseManager)init;
- (id)_nickNameContainer;
- (id)_nickNameContainerIdentifier;
- (id)manateeDataBase;
- (id)nickNamePublicDatabase;
- (id)truthDatabase;
- (id)truthPublicDatabase;
- (void)fetchCurrentUserForNicknameContainer:(id)a3;
@end

@implementation IMDCKDatabaseManager

- (CKContainer)truthContainer
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Using Manatee Container", v6, 2u);
    }
  }
  manateeContainer = self->_manateeContainer;

  return manateeContainer;
}

+ (IMDCKDatabaseManager)sharedInstance
{
  if (qword_1EBE2B888 != -1) {
    dispatch_once(&qword_1EBE2B888, &unk_1F3391740);
  }
  v2 = (void *)qword_1EBE2B9C0;

  return (IMDCKDatabaseManager *)v2;
}

- (IMDCKDatabaseManager)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)IMDCKDatabaseManager;
  v2 = [(IMDCKDatabaseManager *)&v16 init];
  if (v2 && (IMIsRunningInUnitTesting() & 1) == 0)
  {
    v3 = +[IMDCKUtilities sharedInstance];
    int v4 = [v3 shouldUseDevContainer];

    int v5 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v5)
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = @"com.apple.messages.cloud";
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "**** Initializing dev container with ID %@", buf, 0xCu);
        }
      }
      uint64_t v7 = 2;
    }
    else
    {
      if (v5)
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = @"com.apple.messages.cloud";
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Initializing production container %@", buf, 0xCu);
        }
      }
      uint64_t v7 = 1;
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.messages.cloud" environment:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    [v10 setMmcsEncryptionSupport:2];
    [v10 setUseZoneWidePCS:1];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v9 options:v10];
    manateeContainer = v2->_manateeContainer;
    v2->_manateeContainer = (CKContainer *)v11;

    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = v2->_manateeContainer;
        *(_DWORD *)buf = 138412290;
        v18 = (__CFString *)v14;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Manatee container %@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (BOOL)_serverSaysToUseOldContainer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  v3 = [v2 objectForKey:@"use-old-nickname-container"];
  BOOL v4 = [v3 unsignedIntegerValue] != 0;
  int v5 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v6 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6DE00] forKey:@"UseOldProfilesContainer"];

  int v7 = v6 | v4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:0];
      id v10 = (void *)v9;
      uint64_t v11 = @"NO";
      int v13 = 138412802;
      if (v7) {
        uint64_t v11 = @"YES";
      }
      v14 = v11;
      __int16 v15 = 2112;
      objc_super v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Server says to use new container? %@ {serverbagValue: %@ version: %@}", (uint8_t *)&v13, 0x20u);
    }
  }

  return v7;
}

- (id)_nickNameContainerIdentifier
{
  if ([(IMDCKDatabaseManager *)self _serverSaysToUseOldContainer]) {
    return @"com.apple.internal.messages.memoji";
  }
  else {
    return @"com.apple.messages.profiles";
  }
}

- (id)_nickNameContainer
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  nickNameContainer = self->_nickNameContainer;
  if (!nickNameContainer)
  {
    BOOL v4 = [(IMDCKDatabaseManager *)self _nickNameContainerIdentifier];
    int v5 = +[IMDCKUtilities sharedInstance];
    int v6 = [v5 shouldUseDevNickNameContainer];

    int v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          uint64_t v18 = v4;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "**** Initializing dev nick name container with ID %@", (uint8_t *)&v17, 0xCu);
        }
      }
      uint64_t v9 = 2;
    }
    else
    {
      if (v7)
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          uint64_t v18 = v4;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Initializing production container %@", (uint8_t *)&v17, 0xCu);
        }
      }
      uint64_t v9 = 1;
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:v4 environment:v9];
    id v12 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    [v12 setUseZoneWidePCS:1];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v11 options:v12];
    __int16 v15 = self->_nickNameContainer;
    p_nickNameContainer = &self->_nickNameContainer;
    *p_nickNameContainer = (CKContainer *)v13;

    nickNameContainer = *p_nickNameContainer;
  }

  return nickNameContainer;
}

- (id)truthDatabase
{
  v2 = [(IMDCKDatabaseManager *)self truthContainer];
  v3 = [v2 privateCloudDatabase];

  return v3;
}

- (id)truthPublicDatabase
{
  v2 = [(IMDCKDatabaseManager *)self truthContainer];
  v3 = [v2 publicCloudDatabase];

  return v3;
}

- (id)manateeDataBase
{
  v2 = [(IMDCKDatabaseManager *)self manateeContainer];
  v3 = [v2 privateCloudDatabase];

  return v3;
}

- (id)nickNamePublicDatabase
{
  if (IMSharedHelperNickNameEnabled())
  {
    v3 = [(IMDCKDatabaseManager *)self _nickNameContainer];
    BOOL v4 = [v3 publicCloudDatabase];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Nicknames NOT enabled, returning nil public database", v7, 2u);
      }
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (void)fetchCurrentUserForNicknameContainer:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDCKDatabaseManager *)self _nickNameContainer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97AFCB0;
  v7[3] = &unk_1E6B765A0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchUserRecordIDWithCompletionHandler:v7];
}

- (CKContainer)manateeContainer
{
  return self->_manateeContainer;
}

- (CKContainer)nickNameContainer
{
  return self->_nickNameContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nickNameContainer, 0);

  objc_storeStrong((id *)&self->_manateeContainer, 0);
}

@end