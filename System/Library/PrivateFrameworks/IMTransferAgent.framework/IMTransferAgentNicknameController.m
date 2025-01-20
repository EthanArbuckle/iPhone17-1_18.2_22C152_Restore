@interface IMTransferAgentNicknameController
+ (id)sharedInstance;
- (BOOL)_serverSaysToUseOldContainer;
- (BOOL)shouldUseDevNickNameContainer;
- (CKContainer)nickNameContainer;
- (double)_retryIntervalForRetryCount:(unint64_t)a3;
- (id)_errorWrappingError:(id)a3;
- (id)_nickNameContainer;
- (id)_nickNameContainerIdentifier;
- (id)_nickNameFetchConfiguration;
- (id)_nickNamePublicDB;
- (id)_nickNameSaveConfiguration;
- (id)lockdownManager;
- (id)nickNamePublicDatabase;
- (void)_handleSaveNicknameError:(id)a3 queue:(id)a4 withCompletionBlock:(id)a5;
- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:(id)a3 wallpaperRecordToSave:(id)a4 deletingRecordID:(id)a5 queue:(id)a6 withCompletionBlock:(id)a7;
- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:(id)a3 deletingRecordIDs:(id)a4 queue:(id)a5 withCompletionBlock:(id)a6;
- (void)cloudKitOperationWithRetryCount:(unint64_t)a3 queue:(id)a4 withError:(id)a5 operation:(id)a6;
- (void)deleteAllPersonalNicknamesOnQueue:(id)a3 withCompletion:(id)a4;
- (void)fetchAllNicknamesForCurrentUser:(id)a3;
- (void)fetchCurrentUserForNicknameContainer:(id)a3;
- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 knownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 queue:(id)a10 completionBlock:(id)a11;
- (void)performCloudKitOperation:(id)a3 queue:(id)a4 withError:(id)a5;
- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
- (void)setPersonalNicknameData:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6;
@end

@implementation IMTransferAgentNicknameController

+ (id)sharedInstance
{
  if (qword_26AF3FDD0 != -1) {
    dispatch_once(&qword_26AF3FDD0, &unk_26F0B8E88);
  }
  v2 = (void *)qword_26AF3FDF8;
  return v2;
}

- (void)getNicknameWithRecordID:(id)a3 decryptionKey:(id)a4 wallpaperDataTag:(id)a5 wallpaperLowResDataTag:(id)a6 wallpaperMetadataTag:(id)a7 knownSender:(BOOL)a8 shouldDecodeImageFields:(BOOL)a9 queue:(id)a10 completionBlock:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a11;
  if ([MEMORY[0x263F4AF78] supportsNameAndPhoto])
  {
    if ([v17 length])
    {
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = sub_23CAFB1E8;
      v43 = sub_23CAFB1F8;
      id v44 = 0;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = sub_23CAFB200;
      v27[3] = &unk_264E81088;
      id v28 = v17;
      id v29 = v21;
      id v30 = v19;
      BOOL v37 = a8;
      id v31 = v20;
      v32 = self;
      id v24 = v22;
      id v33 = v24;
      id v34 = v18;
      BOOL v38 = a9;
      id v35 = v23;
      v36 = &v39;
      v25 = (void *)MEMORY[0x23ECF1F70](v27);
      [(IMTransferAgentNicknameController *)self performCloudKitOperation:v25 queue:v24 withError:v40[5]];

      _Block_object_dispose(&v39, 8);
    }
    else
    {
      v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.nickname" code:1 userInfo:0];
      (*((void (**)(id, void, void *))v23 + 2))(v23, 0, v26);
    }
  }
}

- (void)fetchCurrentUserForNicknameContainer:(id)a3
{
  id v4 = a3;
  v5 = [(IMTransferAgentNicknameController *)self _nickNameContainer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_23CAFBCE8;
  v7[3] = &unk_264E810B0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchUserRecordIDWithCompletionHandler:v7];
}

- (void)fetchAllNicknamesForCurrentUser:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_23CAFBD8C;
  v6[3] = &unk_264E81100;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IMTransferAgentNicknameController *)self fetchCurrentUserForNicknameContainer:v6];
}

- (void)setPersonalNicknameData:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x263F08928];
  v14 = (void *)MEMORY[0x263EFFA08];
  id v15 = a3;
  v16 = [v14 setWithObject:objc_opt_class()];
  id v21 = 0;
  id v17 = [v13 _strictlyUnarchivedObjectOfClasses:v16 fromData:v15 error:&v21];

  id v18 = v21;
  if (v17) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    [(IMTransferAgentNicknameController *)self setPersonalNickname:v17 oldRecordID:v10 queue:v11 completionBlock:v12];
  }
  else
  {
    id v20 = [(IMTransferAgentNicknameController *)self _errorWrappingError:v18];
    (*((void (**)(id, void, void, void, void, void, void, void, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, v20);
  }
}

- (void)setPersonalNickname:(id)a3 oldRecordID:(id)a4 queue:(id)a5 completionBlock:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [v14 avatar];
      id v17 = [v16 imageFilePath];
      *(_DWORD *)buf = 138412546;
      id v50 = v14;
      __int16 v51 = 2112;
      v52 = v17;
      _os_log_impl(&dword_23CAED000, v15, OS_LOG_TYPE_INFO, "Client request to store new personal nickname %@ path%@", buf, 0x16u);
    }
  }
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = sub_23CAFC6D8;
  v47[3] = &unk_264E81128;
  id v18 = v13;
  v47[4] = self;
  id v48 = v18;
  BOOL v19 = (void (**)(void, void, void, void, void, void, void, void, void))MEMORY[0x23ECF1F70](v47);
  id v46 = 0;
  id v20 = [MEMORY[0x263F4B000] generatePreKeyWithError:&v46];
  id v21 = v46;
  id v22 = v21;
  if (v20)
  {
    id v44 = 0;
    id v45 = 0;
    id v42 = v21;
    id v43 = 0;
    v32 = [v14 publicRecordsForNicknameWithPreKey:v20 wallpaperDataTag:&v45 lowResWallpaperDataTag:&v44 wallpaperMetadataTag:&v43 error:&v42];
    id v23 = v45;
    id v28 = v44;
    id v29 = v43;
    id v24 = v42;

    id v31 = [v32 objectForKeyedSubscript:@"profileRecord"];
    id v30 = [v32 objectForKeyedSubscript:@"wallpaperRecord"];
    if (v31)
    {
      if ([v11 length]) {
        v27 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v11];
      }
      else {
        v27 = 0;
      }
      id v25 = objc_alloc_init(MEMORY[0x263F4A870]);
      [v25 startTimingForKey:@"Nickname Upload"];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = sub_23CAFC824;
      v33[3] = &unk_264E81150;
      id v34 = v25;
      id v35 = v14;
      id v36 = v31;
      uint64_t v41 = v19;
      id v37 = v20;
      id v38 = v23;
      id v39 = v28;
      id v40 = v29;
      id v26 = v25;
      [(IMTransferAgentNicknameController *)self _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:v36 wallpaperRecordToSave:v30 deletingRecordID:v27 queue:v12 withCompletionBlock:v33];
    }
    else
    {
      ((void (**)(void, void, void, void, void, void, void, void, id))v19)[2](v19, 0, 0, 0, 0, 0, 0, 0, v24);
    }

    id v22 = v24;
  }
  else
  {
    ((void (**)(void, void, void, void, void, void, void, void, id))v19)[2](v19, 0, 0, 0, 0, 0, 0, 0, v21);
  }
}

- (void)deleteAllPersonalNicknamesOnQueue:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Client request to delete personal nickname with recordID", buf, 2u);
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_23CAFCC98;
  v11[3] = &unk_264E811A0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(IMTransferAgentNicknameController *)self fetchAllNicknamesForCurrentUser:v11];
}

- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecord:(id)a3 wallpaperRecordToSave:(id)a4 deletingRecordID:(id)a5 queue:(id)a6 withCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v14)
  {
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObject:v14];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [MEMORY[0x263EFF980] array];
  BOOL v19 = v18;
  if (v12)
  {
    [v18 addObject:v12];
    if (v13) {
      [v19 addObject:v13];
    }
  }
  if ([v17 count])
  {
    id v20 = objc_alloc_init(MEMORY[0x263F4A870]);
    [v20 startTimingForKey:@"Nickname Delete"];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    id v31 = sub_23CAFD120;
    v32 = &unk_264E811C8;
    id v33 = v20;
    id v34 = v12;
    id v35 = self;
    id v36 = v19;
    id v21 = v15;
    id v37 = v21;
    id v38 = v16;
    id v22 = v20;
    uint64_t v23 = MEMORY[0x23ECF1F70](&v29);
    id v24 = self;
    id v25 = v16;
    id v26 = v15;
    id v27 = v13;
    id v28 = (void *)v23;
    -[IMTransferAgentNicknameController _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:](v24, "_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:deletingRecordIDs:queue:withCompletionBlock:", 0, v17, v21, v23, v29, v30, v31, v32);

    id v13 = v27;
    id v15 = v26;
    id v16 = v25;
  }
  else
  {
    [(IMTransferAgentNicknameController *)self _updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:v19 deletingRecordIDs:0 queue:v15 withCompletionBlock:v16];
  }
}

- (void)_updateEncryptedPersonalNicknameToPublicCloudKitDBSavingRecords:(id)a3 deletingRecordIDs:(id)a4 queue:(id)a5 withCompletionBlock:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_23CAED000, v14, OS_LOG_TYPE_INFO, "Publishing Nickname to CloudKit Public DB with record %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v11 && IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_23CAED000, v15, OS_LOG_TYPE_INFO, "Deleting Nickname from CloudKit Public DB with recordID %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_23CAFB1E8;
  id v34 = sub_23CAFB1F8;
  id v35 = 0;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = sub_23CAFD53C;
  id v24 = &unk_264E81290;
  id v16 = v11;
  id v25 = v16;
  id v17 = v10;
  id v26 = v17;
  id v27 = self;
  id v18 = v12;
  id v28 = v18;
  id v19 = v13;
  id v29 = v19;
  p_long long buf = &buf;
  id v20 = (void *)MEMORY[0x23ECF1F70](&v21);
  -[IMTransferAgentNicknameController performCloudKitOperation:queue:withError:](self, "performCloudKitOperation:queue:withError:", v20, v18, *(void *)(*((void *)&buf + 1) + 40), v21, v22, v23, v24);

  _Block_object_dispose(&buf, 8);
}

- (void)_handleSaveNicknameError:(id)a3 queue:(id)a4 withCompletionBlock:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  if (v8)
  {
    if ([v8 code] == 2)
    {
      id v11 = [v8 userInfo];
      id v12 = [v11 valueForKey:*MEMORY[0x263EFD4C8]];
      id v13 = [v12 allValues];
    }
    else
    {
      v31[0] = v8;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    }
  }
  else
  {
    id v13 = 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v18 code] == 19 || objc_msgSend(v18, "code") == 12)
        {
          *((unsigned char *)v27 + 24) = 1;
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = sub_23CAFDF94;
          v19[3] = &unk_264E812B8;
          uint64_t v21 = &v26;
          id v20 = v10;
          [(IMTransferAgentNicknameController *)self deleteAllPersonalNicknamesOnQueue:v9 withCompletion:v19];

          goto LABEL_22;
        }
        if ([v18 code] == 14) {
          *((unsigned char *)v27 + 24) = 0;
        }
        if ([v18 code] == 15) {
          *((unsigned char *)v27 + 24) = 0;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, *((unsigned __int8 *)v27 + 24));
  }
LABEL_22:
  _Block_object_dispose(&v26, 8);
}

- (void)performCloudKitOperation:(id)a3 queue:(id)a4 withError:(id)a5
{
}

- (void)cloudKitOperationWithRetryCount:(unint64_t)a3 queue:(id)a4 withError:(id)a5 operation:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v11 userInfo];
  id v14 = [v13 objectForKey:*MEMORY[0x263EFD4A0]];

  if (v14)
  {
    [(IMTransferAgentNicknameController *)self _retryIntervalForRetryCount:a3];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.0;
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_23CAFE218;
  v23[3] = &unk_264E81308;
  unint64_t v27 = a3;
  v23[4] = self;
  id v17 = v10;
  long long v24 = v17;
  id v18 = v11;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  id v20 = (void (**)(void))MEMORY[0x23ECF1F70](v23);
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v29 = a3;
      __int16 v30 = 2048;
      double v31 = v16;
      _os_log_impl(&dword_23CAED000, v21, OS_LOG_TYPE_INFO, "Dispatching CloudKit operation with retry: %lu and retryInterval: %f", buf, 0x16u);
    }
  }
  if (v16 <= 0.0)
  {
    v20[2](v20);
  }
  else
  {
    dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
    dispatch_after(v22, v17, v20);
  }
}

- (id)nickNamePublicDatabase
{
  if (IMSharedHelperNickNameEnabled())
  {
    v3 = [(IMTransferAgentNicknameController *)self _nickNameContainer];
    id v4 = [v3 publicCloudDatabase];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_23CAED000, v5, OS_LOG_TYPE_INFO, "Nicknames NOT enabled, returning nil public database", v7, 2u);
      }
    }
    id v4 = 0;
  }
  return v4;
}

- (id)_nickNamePublicDB
{
  return (id)MEMORY[0x270F9A6D0](self, sel_nickNamePublicDatabase);
}

- (id)_nickNameSaveConfiguration
{
  id v2 = objc_alloc_init(MEMORY[0x263EFD778]);
  [v2 setQualityOfService:25];
  return v2;
}

- (id)_nickNameFetchConfiguration
{
  id v2 = objc_alloc_init(MEMORY[0x263EFD778]);
  [v2 setQualityOfService:25];
  [v2 setPreferAnonymousRequests:1];
  return v2;
}

- (double)_retryIntervalForRetryCount:(unint64_t)a3
{
  return pow(1.5, (double)(4 - a3));
}

- (BOOL)_serverSaysToUseOldContainer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F4A0B8] sharedInstanceForBagType:1];
  v3 = [v2 objectForKey:@"use-old-nickname-container"];
  BOOL v4 = [v3 unsignedIntegerValue] != 0;
  id v5 = [MEMORY[0x263F4AF68] sharedInstance];
  int v6 = [v5 getBoolFromDomain:*MEMORY[0x263F4ADC0] forKey:@"UseOldProfilesContainer"];

  int v7 = v6 | v4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:0];
      id v10 = (void *)v9;
      id v11 = @"NO";
      int v13 = 138412802;
      if (v7) {
        id v11 = @"YES";
      }
      id v14 = v11;
      __int16 v15 = 2112;
      double v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_23CAED000, v8, OS_LOG_TYPE_INFO, "Server says to use new container? %@ {serverbagValue: %@ version: %@}", (uint8_t *)&v13, 0x20u);
    }
  }

  return v7;
}

- (id)_nickNameContainerIdentifier
{
  if ([(IMTransferAgentNicknameController *)self _serverSaysToUseOldContainer]) {
    return @"com.apple.internal.messages.memoji";
  }
  else {
    return @"com.apple.messages.profiles";
  }
}

- (id)_nickNameContainer
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  nickNameContainer = self->_nickNameContainer;
  if (!nickNameContainer)
  {
    BOOL v4 = [(IMTransferAgentNicknameController *)self _nickNameContainerIdentifier];
    BOOL v5 = [(IMTransferAgentNicknameController *)self shouldUseDevNickNameContainer];
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        int v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          __int16 v17 = v4;
          _os_log_impl(&dword_23CAED000, v7, OS_LOG_TYPE_INFO, "**** Initializing dev nick name container with ID %@", (uint8_t *)&v16, 0xCu);
        }
      }
      uint64_t v8 = 2;
    }
    else
    {
      if (v6)
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          __int16 v17 = v4;
          _os_log_impl(&dword_23CAED000, v9, OS_LOG_TYPE_INFO, "Initializing production container %@", (uint8_t *)&v16, 0xCu);
        }
      }
      uint64_t v8 = 1;
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:v4 environment:v8];
    id v11 = objc_alloc_init(MEMORY[0x263EFD628]);
    [v11 setUseZoneWidePCS:1];
    uint64_t v12 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v10 options:v11];
    id v14 = self->_nickNameContainer;
    p_nickNameContainer = &self->_nickNameContainer;
    *p_nickNameContainer = (CKContainer *)v12;

    nickNameContainer = *p_nickNameContainer;
  }
  return nickNameContainer;
}

- (BOOL)shouldUseDevNickNameContainer
{
  int v3 = IMGetCachedDomainBoolForKey();
  if (v3)
  {
    BOOL v4 = [(IMTransferAgentNicknameController *)self lockdownManager];
    char v5 = [v4 isInternalInstall];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)lockdownManager
{
  return (id)[MEMORY[0x263F4A840] sharedInstance];
}

- (id)_errorWrappingError:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    char v5 = [v3 domain];
    int v6 = [v5 lowercaseString];
    int v7 = [v6 containsString:@"blastdoor"];

    if (v7)
    {
      id v8 = v4;
    }
    else
    {
      id v11 = [v4 description];
      if (v11)
      {
        uint64_t v21 = *MEMORY[0x263F07F80];
        uint64_t v12 = [v4 description];
        v22[0] = v12;
        int v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      }
      else
      {
        int v13 = 0;
      }

      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = [v4 domain];
      int v16 = (void *)v15;
      if (v15) {
        __int16 v17 = (__CFString *)v15;
      }
      else {
        __int16 v17 = @"com.apple.nickname";
      }
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v4, "code"), v13);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F80];
    id v20 = @"Unknown error (inner error is nil).";
    id v10 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v8 = [v9 errorWithDomain:@"com.apple.nickname" code:1 userInfo:v10];
  }
  return v8;
}

- (CKContainer)nickNameContainer
{
  return self->_nickNameContainer;
}

- (void).cxx_destruct
{
}

@end