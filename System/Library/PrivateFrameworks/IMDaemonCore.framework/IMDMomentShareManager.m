@interface IMDMomentShareManager
+ (id)_copiedFileURLFromAssetExportFileURLs:(id)a3 transferGUID:(id)a4 error:(id *)a5;
+ (id)_copyItemAtURL:(id)a3 toTemporaryDirectoryWithName:(id)a4 isDirectory:(BOOL)a5 error:(id *)a6;
+ (id)_fetchResultForCuratedOrFirstForMomentShare:(id)a3 outFetchType:(int64_t *)a4;
+ (id)_fileTransferForAssetUUID:(id)a3 forMessage:(id)a4 momentShare:(id)a5 atIndex:(unint64_t)a6 ofTotal:(unint64_t)a7;
+ (id)_generateTransfersForAssetUUIDs:(id)a3 forMessage:(id)a4 inChat:(id)a5 momentShare:(id)a6;
+ (id)_loadCMMTransfersForMessage:(id)a3;
+ (id)sharedInstance;
+ (int64_t)_targetCountForContext:(id)a3;
+ (void)_acceptMomentShare:(id)a3 completionHandler:(id)a4;
+ (void)_clearCMMTransfersForCMMMessage:(id)a3;
+ (void)_requestResourceFileURLsForAsset:(id)a3 fileTransfer:(id)a4 completionHandler:(id)a5;
+ (void)fetchMomentShareFromShareURL:(id)a3 forMessage:(id)a4 completionHandler:(id)a5;
- (BOOL)messageHasUnfinishedTransfers:(id)a3;
- (IMDMomentShareManager)init;
- (NSMutableDictionary)shareURLsToContexts;
- (id)_assetUUIDToUnfinishedTransferMapFromTransfers:(id)a3;
- (id)_contextForMomentShareURL:(id)a3 forMessage:(id)a4 inChat:(id)a5 createIfNeeded:(BOOL)a6;
- (void)_acceptMomentShareIfNecessaryForContext:(id)a3 isRetry:(BOOL)a4;
- (void)_fetchAssetsForAcceptedMomentShareWithContext:(id)a3;
- (void)_generateTransfersForContext:(id)a3;
- (void)_handleIngestionFailureForContext:(id)a3;
- (void)_handleMomentShareFetchForContext:(id)a3 momentShare:(id)a4 error:(id)a5;
- (void)_handleResourceRequestForContext:(id)a3 asset:(id)a4 transfer:(id)a5 didCompleteWithFileURL:(id)a6 error:(id)a7;
- (void)_persistAttachmentAtFileURL:(id)a3 forFileTransfer:(id)a4;
- (void)_removeFinishedIngestionContext:(id)a3;
- (void)_startAssetExportForContext:(id)a3;
- (void)_transitionToCompletedStateForContext:(id)a3;
- (void)_transitionToFetchingMomentShareForContext:(id)a3;
- (void)_transitionToGenerateTransfersStateForContextIfNecessary:(id)a3;
- (void)_transitionToWaitingForAssetsForContext:(id)a3;
- (void)_updateContext:(id)a3 withChange:(id)a4;
- (void)_updatePendingTransferMapForContext:(id)a3 completedTransfer:(id)a4;
- (void)photoLibraryDidChange:(id)a3;
- (void)regenerateTransfersForMessage:(id)a3 inChat:(id)a4 addingAssetWithUUID:(id)a5;
- (void)registerAndAcceptMomentShareForMessage:(id)a3 inChat:(id)a4 resetAssetTransfers:(BOOL)a5;
- (void)setShareURLsToContexts:(id)a3;
@end

@implementation IMDMomentShareManager

+ (id)sharedInstance
{
  if (qword_1EBE2B828 != -1) {
    dispatch_once(&qword_1EBE2B828, &unk_1F3390B60);
  }
  v2 = (void *)qword_1EBE2B958;

  return v2;
}

- (IMDMomentShareManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDMomentShareManager;
  v2 = [(IMDMomentShareManager *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(IMDMomentShareManager *)v2 setShareURLsToContexts:v3];

    v4 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    [v4 registerChangeObserver:v2];
  }
  return v2;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D96E8DF4;
  v6[3] = &unk_1E6B73218;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_updateContext:(id)a3 withChange:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 momentShare];
  v8 = [v6 changeDetailsForObject:v7];
  v9 = [v8 objectAfterChanges];
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v9 uuid];
        v12 = [v5 message];
        v13 = [v12 guid];
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updating moment share %@ in response to photo library change for message %@", buf, 0x16u);
      }
    }
    [v5 setMomentShare:v9];
  }
  v14 = [v5 assetsFetch];
  v15 = [v6 changeDetailsForFetchResult:v14];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 fetchResultAfterChanges];
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v21 = [v5 message];
        v19 = [v21 guid];
        uint64_t v20 = [v17 count];
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        __int16 v25 = 2112;
        v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = v20;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Updating moment share fetch for message %@ with change %@. Count is now %lu", buf, 0x20u);
      }
    }
    [v5 setAssetsFetch:v17];

    goto LABEL_14;
  }
  if (v9) {
LABEL_14:
  }
    [(IMDMomentShareManager *)self _transitionToGenerateTransfersStateForContextIfNecessary:v5];
}

- (void)_transitionToFetchingMomentShareForContext:(id)a3
{
  id v4 = a3;
  if ([v4 state])
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D98FEC20(v4);
    }
  }
  else
  {
    [v4 setState:1];
    id v6 = objc_opt_class();
    id v7 = [v4 shareURL];
    v8 = [v4 message];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1D96E9390;
    v9[3] = &unk_1E6B74278;
    v9[4] = self;
    id v10 = v4;
    [v6 fetchMomentShareFromShareURL:v7 forMessage:v8 completionHandler:v9];
  }
}

- (void)_handleMomentShareFetchForContext:(id)a3 momentShare:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 state] == 1)
  {
    if (v8)
    {
      [v7 setMomentShare:v8];
      [v7 setState:2];
      [(IMDMomentShareManager *)self _acceptMomentShareIfNecessaryForContext:v7 isRetry:0];
    }
    else
    {
      [(IMDMomentShareManager *)self _handleIngestionFailureForContext:v7];
    }
  }
  else
  {
    v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D98FECCC(v7);
    }
  }
}

- (void)_transitionToWaitingForAssetsForContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 2)
  {
    id v5 = [v4 momentShare];
    uint64_t v11 = 0;
    id v6 = [(id)objc_opt_class() _fetchResultForCuratedOrFirstForMomentShare:v5 outFetchType:&v11];
    [v4 setFetchType:v11];
    [v4 setAssetsFetch:v6];
    [v4 setState:3];
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [v4 message];
        v9 = [v8 guid];
        id v10 = [v4 momentShare];
        *(_DWORD *)buf = 138412802;
        v13 = v6;
        __int16 v14 = 2112;
        v15 = v9;
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Starting to monitor fetch result: %@ for message: %@ moment share: %@", buf, 0x20u);
      }
    }
    [(IMDMomentShareManager *)self _transitionToGenerateTransfersStateForContextIfNecessary:v4];
  }
  else
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D98FED78(v4, v5);
    }
  }
}

- (void)_transitionToGenerateTransfersStateForContextIfNecessary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    unint64_t v5 = [(id)objc_opt_class() _targetCountForContext:v4];
    id v6 = [v4 assetsFetch];
    unint64_t v7 = [v6 count];

    if (v7 >= v5)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [v4 momentShare];
          id v10 = [v9 uuid];
          int v11 = 138412546;
          v12 = v10;
          __int16 v13 = 2048;
          unint64_t v14 = v5;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Moment share %@ is done fetching %lu assets. Generating transfers", (uint8_t *)&v11, 0x16u);
        }
      }
      [v4 setState:4];
      [(IMDMomentShareManager *)self _generateTransfersForContext:v4];
    }
  }
}

- (void)_transitionToCompletedStateForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 4)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [v4 message];
        unint64_t v7 = [v6 guid];
        id v8 = [v4 momentShare];
        v9 = [v8 uuid];
        int v11 = 138412546;
        v12 = v7;
        __int16 v13 = 2112;
        unint64_t v14 = v9;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Moment share ingestion complete for message %@. moment share UUID %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [v4 setState:5];
    [(IMDMomentShareManager *)self _removeFinishedIngestionContext:v4];
  }
  else
  {
    id v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1D98FEE30(v4, v10);
    }
  }
}

- (void)_generateTransfersForContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 assetsFetch];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v11), "uuid", (void)v19);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  __int16 v13 = objc_opt_class();
  unint64_t v14 = [v4 message];
  uint64_t v15 = [v4 chat];
  __int16 v16 = [v4 momentShare];
  v17 = [v13 _generateTransfersForAssetUUIDs:v6 forMessage:v14 inChat:v15 momentShare:v16];

  uint64_t v18 = [(IMDMomentShareManager *)self _assetUUIDToUnfinishedTransferMapFromTransfers:v17];
  [v4 addTransfers:v18];
  [(IMDMomentShareManager *)self _startAssetExportForContext:v4];
}

+ (void)fetchMomentShareFromShareURL:(id)a3 forMessage:(id)a4 completionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [v8 getCMMState];
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v8 guid];
      __int16 v13 = (void *)v12;
      if (v10 > 4) {
        unint64_t v14 = @"invalid CMM state";
      }
      else {
        unint64_t v14 = off_1E6B743B0[v10];
      }
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v34 = v14;
      __int16 v35 = 2048;
      unint64_t v36 = v10;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Fetching moment share from %@ for message %@ CMM state %@ (%lu)", buf, 0x2Au);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v34) = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D96E9E8C;
  aBlock[3] = &unk_1E6B742A0;
  v32 = buf;
  id v15 = v8;
  id v29 = v15;
  id v16 = v7;
  id v30 = v16;
  id v17 = v9;
  id v31 = v17;
  uint64_t v18 = _Block_copy(aBlock);
  long long v19 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  long long v20 = [v19 librarySpecificFetchOptions];

  [MEMORY[0x1E4F391B0] fetchMomentShareFromShareURL:v16 options:v20 completionHandler:v18];
  dispatch_time_t v21 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D96EA0D8;
  block[3] = &unk_1E6B73240;
  id v26 = v15;
  __int16 v27 = buf;
  id v25 = v16;
  id v22 = v15;
  id v23 = v16;
  dispatch_after(v21, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(buf, 8);
}

+ (void)_acceptMomentShare:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96EA2A8;
  v7[3] = &unk_1E6B72C60;
  id v8 = v5;
  id v6 = v5;
  [a3 acceptMomentShareWithCompletion:v7];
}

- (id)_contextForMomentShareURL:(id)a3 forMessage:(id)a4 inChat:(id)a5 createIfNeeded:(BOOL)a6
{
  BOOL v26 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v28 = a5;
  __int16 v27 = [(IMDMomentShareManager *)self shareURLsToContexts];
  uint64_t v11 = [v27 objectForKey:v9];
  uint64_t v12 = [v10 guid];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
      long long v19 = [v18 message];
      long long v20 = [v19 guid];

      if ([v12 isEqualToString:v20]) {
        break;
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v23 = v18;

    if (v23)
    {
      id v22 = v27;
      dispatch_time_t v21 = v28;
      goto LABEL_17;
    }
    id v22 = v27;
    dispatch_time_t v21 = v28;
    if (!v26) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_9:

    id v22 = v27;
    dispatch_time_t v21 = v28;
    if (!v26)
    {
      id v23 = 0;
      goto LABEL_17;
    }
  }
  id v23 = [[IMDMomentShareIngestionContext alloc] initWithURL:v9 message:v10 inChat:v21];
  if (v13)
  {
    [v13 addObject:v23];
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithObject:v23];
    [v22 setObject:v24 forKey:v9];
  }
LABEL_17:

  return v23;
}

- (void)_removeFinishedIngestionContext:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D96EA664;
  v6[3] = &unk_1E6B73218;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_handleIngestionFailureForContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 message];
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1D98FF020();
  }

  [v5 setCMMState:1];
  id v7 = +[IMDMessageStore sharedInstance];
  LOWORD(v9) = 1;
  id v8 = (id)objc_msgSend(v7, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v5, 1, 0, 0, 0, 1, v9);

  [v4 setState:6];
  [(IMDMomentShareManager *)self _removeFinishedIngestionContext:v4];
}

- (void)registerAndAcceptMomentShareForMessage:(id)a3 inChat:(id)a4 resetAssetTransfers:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v8 guid];
      uint64_t v12 = [v8 balloonBundleID];
      id v13 = [v8 payloadData];
      uint64_t v14 = @"YES";
      *(_DWORD *)buf = 138413058;
      v60 = v11;
      if (v13) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      if (!v5) {
        uint64_t v14 = @"NO";
      }
      __int16 v61 = 2112;
      uint64_t v62 = (uint64_t)v12;
      __int16 v63 = 2112;
      v64 = v15;
      __int16 v65 = 2112;
      unint64_t v66 = (unint64_t)v14;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Register and accept ShareURL for message: %@ with bundleID: %@ hasPayload: %@ reset asset transfers: %@", buf, 0x2Au);
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F6E898];
  uint64_t v17 = [v8 balloonBundleID];
  uint64_t v18 = [v8 body];
  long long v19 = [v8 payloadData];
  long long v20 = [v16 photoShareURLFromPluginBundleID:v17 contentString:v18 payload:v19 shouldAccept:0];

  if (v20)
  {
    unint64_t v21 = [v8 getCMMState];
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v8 guid];
        uint64_t v24 = (void *)v23;
        if (v21 > 4) {
          id v25 = @"invalid CMM state";
        }
        else {
          id v25 = off_1E6B743B0[v21];
        }
        *(_DWORD *)buf = 138413058;
        v60 = v20;
        __int16 v61 = 2112;
        uint64_t v62 = v23;
        __int16 v63 = 2112;
        v64 = v25;
        __int16 v65 = 2048;
        unint64_t v66 = v21;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Processing CMM shareURL %@ for message %@ with state %@ (%lu)", buf, 0x2Au);
      }
    }
    if (v21 == 4 && !v5)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_64;
      }
      BOOL v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v28 = [v8 guid];
        *(_DWORD *)buf = 138412546;
        v60 = v20;
        __int16 v61 = 2112;
        uint64_t v62 = (uint64_t)v28;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Moment shareURL %@ for message %@ is already done", buf, 0x16u);
      }
      goto LABEL_18;
    }
    if (v5)
    {
      long long v29 = [(IMDMomentShareManager *)self _contextForMomentShareURL:v20 forMessage:v8 inChat:v9 createIfNeeded:0];
      long long v30 = v29;
      if (v29)
      {
        if ([v29 state] > 3)
        {
          if ([v30 state] != 4)
          {
            v41 = IMLogHandleForCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              sub_1D98FF0C8((uint64_t)v20, v30);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              v43 = [v8 guid];
              *(_DWORD *)buf = 138412546;
              v60 = v43;
              __int16 v61 = 2112;
              uint64_t v62 = (uint64_t)v20;
              _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Clearing and restarting transfers for in-progress message %@, moment share %@", buf, 0x16u);
            }
          }
          [(id)objc_opt_class() _clearCMMTransfersForCMMMessage:v8];
          [v30 clearAllTransfers];
          v44 = [v8 fileTransferGUIDs];
          uint64_t v45 = [v44 count];

          [v8 setCMMAssetOffset:v45];
          v46 = +[IMDMessageStore sharedInstance];
          LOWORD(v58) = 1;
          id v47 = (id)objc_msgSend(v46, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v58);

          [(IMDMomentShareManager *)self _generateTransfersForContext:v30];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            long long v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              long long v32 = [v8 guid];
              *(_DWORD *)buf = 138412546;
              v60 = v32;
              __int16 v61 = 2112;
              uint64_t v62 = (uint64_t)v20;
              _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Message %@. No need to reset transfers for in-progress ingestion of moment share %@", buf, 0x16u);
            }
          }
          v33 = [v8 fileTransferGUIDs];
          uint64_t v34 = [v33 count];

          [v8 setCMMAssetOffset:v34];
          __int16 v35 = +[IMDMessageStore sharedInstance];
          LOWORD(v58) = 1;
          id v36 = (id)objc_msgSend(v35, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v58);
        }
LABEL_63:

        goto LABEL_64;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = [v8 guid];
          unint64_t v39 = [v8 getCMMState];
          if (v39 > 4) {
            v40 = @"invalid CMM state";
          }
          else {
            v40 = off_1E6B743B0[v39];
          }
          *(_DWORD *)buf = 138412546;
          v60 = v38;
          __int16 v61 = 2112;
          uint64_t v62 = (uint64_t)v40;
          _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Resetting transfers on message %@ in state %@ and restarting ingestion", buf, 0x16u);
        }
      }
      [(id)objc_opt_class() _clearCMMTransfersForCMMMessage:v8];
    }
    long long v30 = [(IMDMomentShareManager *)self _contextForMomentShareURL:v20 forMessage:v8 inChat:v9 createIfNeeded:1];
    BOOL v48 = [v30 state] == 0;
    int v49 = IMOSLoggingEnabled();
    if (v48)
    {
      if (v49)
      {
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = [v8 guid];
          *(_DWORD *)buf = 138412546;
          v60 = v20;
          __int16 v61 = 2112;
          uint64_t v62 = (uint64_t)v53;
          _os_log_impl(&dword_1D967A000, v52, OS_LOG_TYPE_INFO, "Registering moment shareURL %@ for message %@ and beginning ingestion", buf, 0x16u);
        }
      }
      v54 = [v8 fileTransferGUIDs];
      uint64_t v55 = [v54 count];

      [v8 setCMMStateToRegisteredAndAssetOffsetTo:v55];
      v56 = +[IMDMessageStore sharedInstance];
      LOWORD(v58) = 1;
      id v57 = (id)objc_msgSend(v56, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v58);

      [(IMDMomentShareManager *)self _transitionToFetchingMomentShareForContext:v30];
    }
    else if (v49)
    {
      v50 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        v51 = [v8 guid];
        *(_DWORD *)buf = 138412546;
        v60 = v20;
        __int16 v61 = 2112;
        uint64_t v62 = (uint64_t)v51;
        _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Ingestion of moment shareURL %@ for message %@ is already underway", buf, 0x16u);
      }
    }
    goto LABEL_63;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v26 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = [v8 guid];
      *(_DWORD *)buf = 138412290;
      v60 = v27;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No share URL found for %@", buf, 0xCu);
    }
LABEL_18:
  }
LABEL_64:
}

- (void)_acceptMomentShareIfNecessaryForContext:(id)a3 isRetry:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 momentShare];
  id v8 = [v6 message];
  if ([v7 status] == 2)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v8 guid];
        *(_DWORD *)buf = 138412546;
        long long v20 = v7;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Accepting share %@ for message %@", buf, 0x16u);
      }
    }
    uint64_t v11 = objc_opt_class();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1D96EB3A0;
    v13[3] = &unk_1E6B742F0;
    id v14 = v7;
    id v15 = v8;
    uint64_t v16 = self;
    id v17 = v6;
    BOOL v18 = a4;
    [v11 _acceptMomentShare:v14 completionHandler:v13];
  }
  else if ([v7 status] == 1 || objc_msgSend(v7, "status") == 3)
  {
    [(IMDMomentShareManager *)self _fetchAssetsForAcceptedMomentShareWithContext:v6];
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF16C();
    }

    [(IMDMomentShareManager *)self _handleIngestionFailureForContext:v6];
  }
}

- (void)_fetchAssetsForAcceptedMomentShareWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 momentShare];
  id v6 = [v4 message];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v5 uuid];
      id v9 = [v6 guid];
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Transitioning to accepted state for moment share %@ message %@", buf, 0x16u);
    }
  }
  [v6 setCMMState:2];
  id v10 = +[IMDMessageStore sharedInstance];
  LOWORD(v12) = 1;
  id v11 = (id)objc_msgSend(v10, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v6, 1, 0, 0, 0, 1, v12);

  [(IMDMomentShareManager *)self _transitionToWaitingForAssetsForContext:v4];
}

+ (id)_loadCMMTransfersForMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 getCMMAssetOffset];
  BOOL v5 = [v3 fileTransferGUIDs];
  uint64_t v6 = objc_msgSend(v5, "subarrayWithRange:", v4, objc_msgSend(v5, "count") - v4);

  id v7 = +[IMDAttachmentStore sharedInstance];
  long long v20 = (void *)v6;
  id v8 = [v7 attachmentsWithGUIDs:v6];

  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    uint64_t v14 = *MEMORY[0x1E4F6D3F0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [v16 attributionInfo];
        BOOL v18 = [v17 objectForKey:v14];

        if (v18) {
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)regenerateTransfersForMessage:(id)a3 inChat:(id)a4 addingAssetWithUUID:(id)a5
{
  BOOL v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1D98FF3A8(v5);
  }
}

- (id)_assetUUIDToUnfinishedTransferMapFromTransfers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v19;
    uint64_t v9 = *MEMORY[0x1E4F6D3F0];
    *(void *)&long long v7 = 138412546;
    long long v17 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v11, "transferState", v17, (void)v18) <= 4)
        {
          uint64_t v12 = [v11 attributionInfo];

          if (v12)
          {
            uint64_t v13 = [v11 attributionInfo];
            uint64_t v14 = [v13 objectForKey:v9];

            if (v14)
            {
              if (IMOSLoggingEnabled())
              {
                __int16 v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v17;
                  long long v23 = v14;
                  __int16 v24 = 2112;
                  id v25 = v11;
                  _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "TransferMap entry %@ to %@", buf, 0x16u);
                }
              }
              [v4 setValue:v11 forKey:v14];
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)messageHasUnfinishedTransfers:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = [(id)objc_opt_class() _loadCMMTransfersForMessage:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96EBD54;
  v7[3] = &unk_1E6B74318;
  void v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)_startAssetExportForContext:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  uint64_t v4 = [v23 assetsFetch];
  long long v21 = [v23 message];
  char v5 = [v23 assetUUIDsToFileTransfers];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v7 = 138412802;
    long long v20 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "uuid", v20);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        int v13 = IMOSLoggingEnabled();
        if (v12)
        {
          if (v13)
          {
            uint64_t v14 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              __int16 v15 = [v21 guid];
              *(_DWORD *)buf = 138412546;
              v33 = v15;
              __int16 v34 = 2112;
              __int16 v35 = v11;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Message %@: Begin request for resource file URLs for asset %@", buf, 0x16u);
            }
          }
          uint64_t v16 = objc_opt_class();
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = sub_1D96EC13C;
          v24[3] = &unk_1E6B74340;
          v24[4] = self;
          id v25 = v23;
          uint64_t v26 = v10;
          id v27 = v12;
          [v16 _requestResourceFileURLsForAsset:v10 fileTransfer:v27 completionHandler:v24];
        }
        else
        {
          if (v13)
          {
            long long v17 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              long long v18 = [v21 guid];
              uint64_t v19 = [v5 count];
              *(_DWORD *)buf = v20;
              v33 = v18;
              __int16 v34 = 2112;
              __int16 v35 = v11;
              __int16 v36 = 2048;
              uint64_t v37 = v19;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Message %@: Not requesting asset for %@, not in transfer map. %lu left for processing", buf, 0x20u);
            }
          }
          [(IMDMomentShareManager *)self _handleIngestionFailureForContext:v23];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v6);
  }
}

- (void)_handleResourceRequestForContext:(id)a3 asset:(id)a4 transfer:(id)a5 didCompleteWithFileURL:(id)a6 error:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v32 = a7;
  v33 = [v11 message];
  __int16 v15 = [v12 uuid];
  uint64_t v16 = [v11 assetUUIDsToFileTransfers];
  id v17 = [v16 objectForKeyedSubscript:v15];
  if (v17 == v13)
  {
    if (v14)
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          long long v21 = [v33 guid];
          *(_DWORD *)buf = 138412546;
          v41 = v21;
          __int16 v42 = 2112;
          id v43 = v15;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Message %@: Completed request for resource file URLs for asset: %@", buf, 0x16u);
        }
      }
      uint64_t v29 = [v13 guid];
      int v22 = IMOSLoggingEnabled();
      if (v29)
      {
        if (v22)
        {
          id v23 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            __int16 v24 = objc_msgSend(v13, "guid", v29);
            *(_DWORD *)buf = 138412546;
            v41 = v24;
            __int16 v42 = 2112;
            id v43 = v15;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Setting syndication identifier to %@ on asset with UUID %@", buf, 0x16u);
          }
        }
        id v25 = objc_msgSend(MEMORY[0x1E4F39228], "sharedMomentSharePhotoLibrary", v29);
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = sub_1D96EC6A4;
        v37[3] = &unk_1E6B73218;
        id v38 = v12;
        id v39 = v13;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = sub_1D96EC718;
        v34[3] = &unk_1E6B73B78;
        id v35 = v39;
        id v36 = v15;
        [v25 performChanges:v37 completionHandler:v34];
      }
      else if (v22)
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v15;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "IMDMomentShareManager - Not setting syndication identifier on asset with UUID %@ due to missing syndication identifier", buf, 0xCu);
        }
      }
      -[IMDMomentShareManager _persistAttachmentAtFileURL:forFileTransfer:](self, "_persistAttachmentAtFileURL:forFileTransfer:", v14, v13, v29);
      [(IMDMomentShareManager *)self _updatePendingTransferMapForContext:v11 completedTransfer:v13];
    }
    else
    {
      uint64_t v26 = IMLogHandleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        long long v28 = [v33 guid];
        *(_DWORD *)buf = 138412802;
        v41 = v28;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        id v45 = v32;
        _os_log_error_impl(&dword_1D967A000, v26, OS_LOG_TYPE_ERROR, "Message %@: Failed request for resource file URLs for asset: %@, error: %@", buf, 0x20u);
      }
      [(IMDMomentShareManager *)self _handleIngestionFailureForContext:v11];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v33 guid];
      *(_DWORD *)buf = 138412802;
      v41 = v19;
      __int16 v42 = 2112;
      id v43 = v17;
      __int16 v44 = 2112;
      id v45 = v15;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message %@: Original transfer %@ not found for asset %@", buf, 0x20u);
    }
  }
}

+ (id)_copyItemAtURL:(id)a3 toTemporaryDirectoryWithName:(id)a4 isDirectory:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = IMSafeTemporaryDirectory();
  id v12 = [v11 URLByAppendingPathComponent:v10];

  id v13 = [v12 path];

  id v14 = [v9 lastPathComponent];
  __int16 v15 = [v13 stringByAppendingPathComponent:v14];

  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v29 = 0;
  char v17 = [v16 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v18 = v29;
  id v19 = v18;
  if ((v17 & 1) == 0)
  {
    if (a6) {
      *a6 = v18;
    }
    int v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF568();
    }
    goto LABEL_15;
  }
  id v28 = v18;
  char v20 = [v16 removeItemAtPath:v15 error:&v28];
  id v21 = v28;

  if ((v20 & 1) != 0 || [v21 code] == 4)
  {
    int v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:v7];
    id v27 = v21;
    char v23 = [v16 copyItemAtURL:v9 toURL:v22 error:&v27];
    id v19 = v27;

    if (v23)
    {
      int v22 = v22;
      __int16 v24 = v22;
      goto LABEL_16;
    }
    if (a6) {
      *a6 = v19;
    }
    id v25 = IMLogHandleForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF498();
    }

LABEL_15:
    __int16 v24 = 0;
    goto LABEL_16;
  }
  if (a6) {
    *a6 = v21;
  }
  int v22 = IMLogHandleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_1D98FF500();
  }
  __int16 v24 = 0;
  id v19 = v21;
LABEL_16:

  return v24;
}

+ (id)_copiedFileURLFromAssetExportFileURLs:(id)a3 transferGUID:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F393D8]];
  uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F393E0]];
  id v12 = (void *)v11;
  if (v10) {
    id v13 = v10;
  }
  else {
    id v13 = (void *)v11;
  }
  id v14 = v13;
  if (!v14)
  {
    id v29 = a5;
    id v20 = [NSString stringWithFormat:@"No photo or video file URL in file URLs: %@, for transfer: %@", v8, v9];
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    v34[0] = v20;
    int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v19 = [v21 errorWithDomain:@"IMDMomentShareManagerErrorDomain" code:-1 userInfo:v22];

    char v23 = IMLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF5D0();
    }
    __int16 v15 = 0;
    goto LABEL_24;
  }
  id v32 = 0;
  __int16 v15 = (void *)[a1 _copyItemAtURL:v14 toTemporaryDirectoryWithName:v9 isDirectory:0 error:&v32];
  id v16 = v32;
  char v17 = v16;
  if (v15)
  {
    id v18 = v15;
    id v19 = 0;
  }
  else
  {
    id v30 = a5;
    id v19 = v16;
    __int16 v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF6A8();
    }

    a5 = v30;
  }

  if (v10) {
    BOOL v25 = v12 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25 && v15 != 0)
  {
    id v31 = 0;
    char v23 = [a1 _copyItemAtURL:v12 toTemporaryDirectoryWithName:v9 isDirectory:0 error:&v31];
    id v20 = v31;
    if (v23)
    {
LABEL_25:

      goto LABEL_26;
    }
    id v29 = a5;

    id v20 = v20;
    id v27 = IMLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF638();
    }

    __int16 v15 = 0;
    id v19 = v20;
LABEL_24:
    a5 = v29;
    goto LABEL_25;
  }
LABEL_26:
  if (a5 && !v15) {
    *a5 = v19;
  }

  return v15;
}

+ (void)_requestResourceFileURLsForAsset:(id)a3 fileTransfer:(id)a4 completionHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v42 = 0;
  uint64_t v11 = [MEMORY[0x1E4F38F38] exportRequestForAsset:v8 error:&v42];
  id v12 = v42;
  if (v11)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F39278]);
    [v13 setDontAllowRAW:1];
    id v41 = 0;
    id v14 = [MEMORY[0x1E4F39270] fetchResourcesToShareForAsset:v8 requestOptions:v13 error:&v41];
    id v28 = v41;
    id v29 = v14;
    if (v14)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      __int16 v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v26 = a1;
        id v27 = v12;
        uint64_t v18 = 0;
        uint64_t v19 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v15);
            }
            v18 += objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "fileSize", v26, v27, v28, v29);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v17);
        a1 = v26;
        id v12 = v27;
        goto LABEL_17;
      }
    }
    else
    {
      __int16 v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1D98FF7A4();
      }
    }
    uint64_t v18 = 0;
LABEL_17:

    int v22 = [v9 guid];
    char v23 = +[IMDFileTransferCenter sharedInstance];
    [v23 updateTransfer:v22 currentBytes:0 totalBytes:v18];

    id v24 = objc_alloc_init(MEMORY[0x1E4F38F40]);
    [v24 setVariant:1];
    [v24 setDontAllowRAW:1];
    [v24 setDisableMetadataCorrections:1];
    [v24 setResultHandlerQueue:MEMORY[0x1E4F14428]];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1D96ED090;
    v30[3] = &unk_1E6B74368;
    id v31 = v22;
    uint64_t v35 = v18;
    id v36 = a1;
    id v32 = v9;
    id v34 = v10;
    id v33 = v8;
    id v25 = v22;
    [v11 exportWithOptions:v24 completionHandler:v30];

    goto LABEL_18;
  }
  id v21 = IMLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1D98FF718();
  }

  (*((void (**)(id, void, id))v10 + 2))(v10, 0, v12);
LABEL_18:
}

- (void)_persistAttachmentAtFileURL:(id)a3 forFileTransfer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 guid];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Persisting attachment at fileURL: %@ for transfer: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v9 = +[IMDFileTransferCenter sharedInstance];
  id v10 = [v9 transferForGUID:v7];

  uint64_t v11 = [v5 lastPathComponent];
  id v12 = IMUTITypeForFilename();
  id v13 = [v5 path];
  [v10 setFilename:v13];

  [v10 setTransferredFilename:v11];
  [v10 setType:v12];
  id v14 = [v5 path];
  [v10 _setLocalPath:v14];

  [v10 _setLocalURL:v5];
  __int16 v15 = +[IMDAttachmentStore sharedInstance];
  [v15 storeAttachment:v10 associateWithMessageWithGUID:0];

  uint64_t v16 = +[IMDFileTransferCenter sharedInstance];
  [v16 endTransfer:v7];
}

- (void)_updatePendingTransferMapForContext:(id)a3 completedTransfer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 message];
  id v9 = [v8 guid];
  id v10 = [v6 assetUUIDsToFileTransfers];
  if (v10)
  {
    uint64_t v11 = [v7 attributionInfo];
    id v12 = [v11 objectForKey:*MEMORY[0x1E4F6D3F0]];

    [v6 completeTransferForAssetUUID:v12];
    uint64_t v13 = [v10 count];
    int v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        __int16 v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v22 = [v10 count];
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "%lu assets still pending export", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v14)
      {
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = (uint64_t)v9;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Last outstanding asset requested for message %@, setting IMCMMStateCompleted", buf, 0xCu);
        }
      }
      if (v8 && ![(IMDMomentShareManager *)self messageHasUnfinishedTransfers:v8])
      {
        [v8 setCMMState:4];
        id v18 = +[IMDMessageStore sharedInstance];
        LOWORD(v20) = 257;
        id v19 = (id)objc_msgSend(v18, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v8, 1, 0, 0, 0, 1, v20);

        [(IMDMomentShareManager *)self _transitionToCompletedStateForContext:v6];
      }
      else
      {
        int v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1D98FF998();
        }

        [(IMDMomentShareManager *)self _handleIngestionFailureForContext:v6];
      }
    }
  }
  else
  {
    id v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1D98FF930();
    }
  }
}

+ (void)_clearCMMTransfersForCMMMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _loadCMMTransfersForMessage:v4];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = [v6 arrayByApplyingSelector:sel_guid];
    id v8 = +[IMDAttachmentStore sharedInstance];
    [v8 deleteAttachmentsWithGUIDs:v7];

    id v9 = [v4 fileTransferGUIDs];
    id v10 = (void *)[v9 mutableCopy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "removeObject:", *(void *)(*((void *)&v18 + 1) + 8 * v14++), (void)v18);
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v12);
    }

    if (IMOSLoggingEnabled())
    {
      __int16 v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = [v11 count];
        int v17 = [v4 guid];
        *(_DWORD *)buf = 134218498;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        id v25 = v17;
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Deleting %lu transferGUIDS from CMM message %@, rl transfers left %@", buf, 0x20u);
      }
    }
    objc_msgSend(v4, "setFileTransferGUIDs:", v10, (void)v18);
  }
}

+ (id)_generateTransfersForAssetUUIDs:(id)a3 forMessage:(id)a4 inChat:(id)a5 momentShare:(id)a6
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v49 = a6;
  BOOL v48 = v11;
  if ([v10 count])
  {
    uint64_t v13 = [v11 getCMMAssetOffset];
    uint64_t v14 = [v10 count];
    __int16 v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14 + v13];
    int v17 = [v11 fileTransferGUIDs];
    id v47 = objc_msgSend(v17, "subarrayWithRange:", 0, v13);

    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v47;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Starting with RL transfer GUIDs %@", buf, 0xCu);
      }
    }
    [v16 addObjectsFromArray:v47];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1D96EDFD8;
    v50[3] = &unk_1E6B74390;
    id v55 = a1;
    id v19 = v48;
    id v51 = v19;
    id v52 = v49;
    uint64_t v56 = v13;
    uint64_t v57 = v14;
    id v44 = v15;
    id v53 = v44;
    id v46 = v16;
    id v54 = v46;
    [v10 enumerateObjectsUsingBlock:v50];
    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = [v19 guid];
        *(_DWORD *)buf = 138412290;
        v60 = v21;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Setting Message %@ to CMM state Generated", buf, 0xCu);
      }
    }
    uint64_t v22 = (void *)[v46 copy];
    [v19 setFileTransferGUIDs:v22];

    [v19 setCMMState:3];
    if ([v19 isFromMe])
    {
      uint64_t v23 = +[IMDMessageStore sharedInstance];
      LOWORD(v43) = 1;
      id v24 = (id)[v23 storeMessage:v19 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0 updateMessageCache:1 calculateUnreadCount:v43 reindexMessage:v44];
    }
    else
    {
      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
      [v19 setTimeRead:v29];

      objc_msgSend(v19, "setFlags:", objc_msgSend(v19, "flags") | 0x2000);
      uint64_t v30 = [v19 flags];
      uint64_t v23 = +[IMDMessageStore sharedInstance];
      LOWORD(v43) = 1;
      id v31 = (id)[v23 storeMessage:v19 forceReplace:1 modifyError:0 modifyFlags:1 flagMask:v30 | 0x2000 updateMessageCache:1 calculateUnreadCount:v43 reindexMessage:v44];
    }

    id v58 = v19;
    id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    id v33 = (void *)IMCreateSerializedItemsFromArray();

    id v34 = +[IMDBroadcastController sharedProvider];
    uint64_t v35 = objc_msgSend(v34, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v12, "isBlackholed"));
    id v36 = [v12 accountID];
    long long v37 = [v12 chatIdentifier];
    uint64_t v38 = [v12 style];
    long long v39 = [v12 properties];
    [v35 account:v36 chat:v37 style:v38 chatProperties:v39 messagesUpdated:v33];

    if (IMOSLoggingEnabled())
    {
      long long v40 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        id v41 = [v19 guid];
        *(_DWORD *)buf = 138412290;
        v60 = v41;
        _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Persisted attachments to message %@", buf, 0xCu);
      }
    }
    id v28 = v45;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = [v11 guid];
        id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "assetCount"));
        *(_DWORD *)buf = 138412802;
        v60 = v26;
        __int16 v61 = 2112;
        uint64_t v62 = v27;
        __int16 v63 = 2112;
        id v64 = v49;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Not generating transfers for message %@ because there are no asset UUIDs moment share with count %@: %@", buf, 0x20u);
      }
    }
    id v28 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

+ (id)_fileTransferForAssetUUID:(id)a3 forMessage:(id)a4 momentShare:(id)a5 atIndex:(unint64_t)a6 ofTotal:(unint64_t)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 guid];
  uint64_t v13 = IMFileTransferGUIDForLocalOnlyFileTransferRepresentingCMMAssetAtIndexInMessageGUID();
  uint64_t v14 = +[IMDFileTransferCenter sharedInstance];
  __int16 v15 = [v14 transferForGUID:v13];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v17 = [v11 shareURL];
  long long v18 = [v17 absoluteString];
  [v16 setObject:v18 forKey:*MEMORY[0x1E4F6D3E8]];

  [v16 setObject:v26 forKey:*MEMORY[0x1E4F6D3F0]];
  id v19 = [NSNumber numberWithUnsignedInteger:a7];
  [v16 setObject:v19 forKey:*MEMORY[0x1E4F6D3D8]];

  if (v15)
  {
    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v16;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Existing transfer found for %@, setting attribution %@", buf, 0x16u);
      }
    }
    [v15 setAttributionInfo:v16];
  }
  else
  {
    long long v21 = +[IMDFileTransferCenter sharedInstance];
    LOWORD(v25) = 0;
    [v21 makeNewIncomingTransferWithGUID:v13 filename:0 isDirectory:0 totalBytes:0 hfsType:0 hfsCreator:0 hfsFlags:v25];

    uint64_t v22 = +[IMDFileTransferCenter sharedInstance];
    __int16 v15 = [v22 transferForGUID:v13];

    uint64_t v23 = [v10 guid];
    [v15 setMessageGUID:v23];

    [v15 setAttributionInfo:v16];
  }

  return v15;
}

+ (id)_fetchResultForCuratedOrFirstForMomentShare:(id)a3 outFetchType:(int64_t *)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  id v8 = [v5 preview];
  id v9 = [v8 curatedAssetIdentifiers];
  unint64_t v10 = [v9 count];

  unint64_t v11 = [v5 assetCount];
  BOOL v13 = v10 > 9 || v10 >= v11;
  if (v10 && !v13)
  {
    uint64_t v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFA00(v5, v14);
    }
  }
  if (!v13)
  {
    [v7 setFetchLimit:10];
    __int16 v15 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v7];
    int64_t v16 = 2;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  __int16 v15 = [MEMORY[0x1E4F38EB8] fetchCuratedAssetsInAssetCollection:v5 options:v7];
  int64_t v16 = 1;
  if (a4) {
LABEL_16:
  }
    *a4 = v16;
LABEL_17:

  return v15;
}

+ (int64_t)_targetCountForContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 momentShare];
  if (!v4)
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFA8C(v3, v9);
    }
    goto LABEL_10;
  }
  uint64_t v5 = [v3 fetchType];
  if (!v5)
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D98FFB30(v4, v9);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      id v6 = [v4 preview];
      id v7 = [v6 curatedAssetIdentifiers];
      int64_t v8 = [v7 count];

      goto LABEL_12;
    }
LABEL_11:
    int64_t v8 = 0;
    goto LABEL_12;
  }
  if ((unint64_t)[v4 assetCount] > 9) {
    int64_t v8 = 10;
  }
  else {
    int64_t v8 = [v4 assetCount];
  }
LABEL_12:

  return v8;
}

- (NSMutableDictionary)shareURLsToContexts
{
  return self->_shareURLsToContexts;
}

- (void)setShareURLsToContexts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end