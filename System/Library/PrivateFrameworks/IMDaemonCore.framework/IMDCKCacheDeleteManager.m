@interface IMDCKCacheDeleteManager
+ (id)sharedInstance;
- (BOOL)_deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:(id)a3;
- (BOOL)_shouldFetchNextBatch:(unint64_t)a3 totalTransfers:(id)a4;
- (BOOL)allowsWritingToDisk;
- (BOOL)alreadyCapturedErrorWithAutoBugCapture;
- (BOOL)canMarkPurgeableIfIsRichLinkForTransferGUID:(id)a3;
- (BOOL)canWriteFileOfEstimatedSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4;
- (BOOL)isDeviceLowOnDiskSpace;
- (BOOL)isUpdatingAttachmentFileSizes;
- (BOOL)isUsingCentralizedModel;
- (BOOL)shouldDownloadAssetsOfSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4;
- (IMDCKCacheDeleteManager)init;
- (IMPurgedAttachmentHandler)purgedAttachmentHandler;
- (id)__wrapperAroundCacheDeletePurgeableCallback:(id)a3 urgency:(int)a4;
- (id)__wrapperAroundCacheDeletePurgingCallback:(id)a3 urgency:(int)a4;
- (id)_cacheDeleteGuidanceDictionaryForRequestedSize:(unint64_t)a3;
- (id)_cacheDeleteRequestCacheableSpaceGuidanceWithID:(id)a3 diskVolume:(id)a4 urgency:(int)a5 requestedSize:(unint64_t)a6;
- (id)_ckUtilitiesSharedInstance;
- (id)_copyAttachmentRecord:(id)a3;
- (id)_fileTransfersToDelete:(id)a3;
- (id)_fileTransfersToValidate:(id)a3;
- (id)_getIndexSetForBatch:(id)a3 indexOfTransfers:(unint64_t)a4;
- (id)createDictionaryForNotDeletingAnyAttachments:(id)a3 urgency:(int)a4;
- (id)deleteAttachmentsAndReturnBytesDeleted:(id)a3 urgency:(int)a4;
- (id)reportAvailableSpaceToBeDeleted:(id)a3 urgency:(int)a4;
- (int64_t)_deleteAttachmentsAndReturnBytesDeleted:(int)a3;
- (int64_t)_deleteFilesOnDiskAndUpdateTransfers:(id)a3;
- (int64_t)_purgeableSpaceGivenUrgency:(int)a3;
- (int64_t)purgeAttachments:(int64_t)a3;
- (int64_t)purgeableAttachmentSize;
- (unint64_t)_indexOfNextBatch:(id)a3 totalTransfers:(id)a4 indexOfTransfers:(unint64_t)a5;
- (void)_cacheDeleteSetUp;
- (void)_fetchTransfersFromCloudKit:(id)a3 indexOfTransfers:(unint64_t)a4 numberOfBatchesToFetch:(unint64_t)a5 activity:(id)a6 withCompletion:(id)a7;
- (void)_fetchTransfersFromCloudKit:(id)a3 withActivity:(id)a4;
- (void)_postTransferInfoOfDeletedTransfers:(id)a3;
- (void)batchCompletedWithTransfers:(id)a3;
- (void)metricAttachmentsToPurge:(int64_t)a3 withActivity:(id)a4;
- (void)registerWithCacheDelete;
- (void)resetAttachmentWatermark;
- (void)setAllowsWritingToDisk:(BOOL)a3;
- (void)setAlreadyCapturedErrorWithAutoBugCapture:(BOOL)a3;
- (void)setDeviceLowOnDiskSpace:(BOOL)a3;
- (void)setIsUpdatingAttachmentFileSizes:(BOOL)a3;
- (void)setIsUsingCentralizedModel:(BOOL)a3;
- (void)setPurgedAttachmentHandler:(id)a3;
- (void)updateAttachmentFileSizesWithActivity:(id)a3;
@end

@implementation IMDCKCacheDeleteManager

+ (id)sharedInstance
{
  if (qword_1EBE2B850 != -1) {
    dispatch_once(&qword_1EBE2B850, &unk_1F3391040);
  }
  v2 = (void *)qword_1EBE2B980;

  return v2;
}

- (IMDCKCacheDeleteManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMDCKCacheDeleteManager;
  v2 = [(IMDCKCacheDeleteManager *)&v7 init];
  v3 = (IMDCKCacheDeleteManager *)v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 9) = 65537;
    v4 = [[IMPurgedAttachmentHandler alloc] initWithBatchSize:64];
    purgedAttachmentHandler = v3->_purgedAttachmentHandler;
    v3->_purgedAttachmentHandler = v4;

    [(IMPurgedAttachmentHandler *)v3->_purgedAttachmentHandler setDelegate:v3];
  }
  return v3;
}

- (id)_ckUtilitiesSharedInstance
{
  return +[IMDCKUtilities sharedInstance];
}

- (BOOL)_deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:(id)a3
{
  v3 = (_xpc_activity_s *)a3;
  v4 = v3;
  if (v3)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (IMOSLoggingEnabled())
      {
        v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", buf, 2u);
        }
      }
      if (!xpc_activity_set_state(v4, 3) && IMOSLoggingEnabled())
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", v10, 2u);
        }
      }
      char v7 = 0;
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    v8 = +[IMDCKUtilities sharedInstance];
    char v7 = [v8 isDeviceCharging];
  }
  return v7;
}

- (void)updateAttachmentFileSizesWithActivity:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  activity = (_xpc_activity_s *)a3;
  if ([(IMDCKCacheDeleteManager *)self isUpdatingAttachmentFileSizes])
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Is already updating file sizes, returning", buf, 2u);
      }
LABEL_5:
    }
  }
  else
  {
    if (IMBagIntValueWithDefault())
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_52;
      }
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Server bag does not allow attachment filesize updating, retunring", buf, 2u);
      }
      goto LABEL_5;
    }
    [(IMDCKCacheDeleteManager *)self setIsUpdatingAttachmentFileSizes:1];
    v5 = IMGetCachedDomainValueForKey();
    uint64_t v6 = [v5 longLongValue];

    unsigned int v34 = 0;
    uint64_t v7 = 0;
    *(void *)&long long v8 = 138412290;
    long long v31 = v8;
    do
    {
      if (!-[IMDCKCacheDeleteManager _deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:](self, "_deviceConditionsAllowsAttachmentFileSizeUpdateForActivity:", activity, v31))break; {
      context = (void *)MEMORY[0x1E016A370]();
      }
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = [NSNumber numberWithLongLong:v6];
          v11 = [NSNumber numberWithInt:v34];
          *(_DWORD *)buf = 138412546;
          v42 = v10;
          __int16 v43 = 2112;
          v44 = v11;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Calling IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark with rowID %@ iteration %@", buf, 0x16u);
        }
      }
      updated = (void *)IMDAttachmentUpdateAttachmentFileSizeWithRowIDGreaterThanWatermark();
      v35 = updated;
      if (updated)
      {
        if ([updated count])
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v13 = v35;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v37 != v15) {
                  objc_enumerationMutation(v13);
                }
                v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                v18 = [v17 objectForKey:@"filename"];
                v19 = [v17 objectForKey:@"rowID"];
                uint64_t v7 = [v19 longLongValue];

                v20 = [v17 objectForKey:@"guid"];
                BOOL v21 = [(IMDCKCacheDeleteManager *)self canMarkPurgeableIfIsRichLinkForTransferGUID:v20];
                if (v18) {
                  BOOL v22 = v21;
                }
                else {
                  BOOL v22 = 0;
                }
                if (v22)
                {
                  v23 = +[IMDAttachmentStore sharedInstance];
                  [v23 markAttachmentPurgeable:v18];
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
            }
            while (v14);
          }
        }
        else
        {
          v7 += 20;
          if (IMOSLoggingEnabled())
          {
            v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Got an empty set of attachments back - there are still more so increasing watermark by 20", buf, 2u);
            }
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No more attachment fileSizes to fix up, got nil back from query", buf, 2u);
          }
        }
        uint64_t v7 = -1;
      }
      if (IMOSLoggingEnabled())
      {
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = [NSNumber numberWithLongLong:v7];
          *(_DWORD *)buf = v31;
          v42 = v27;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Previous batch of attachment filesize updates completed, setting new watermark to be %@", buf, 0xCu);
        }
      }
      v28 = [NSNumber numberWithLongLong:v7];
      IMSetDomainValueForKey();

      ++v34;
      uint64_t v6 = v7;
    }
    while (v35);
    if (activity)
    {
      BOOL v29 = xpc_activity_set_state(activity, 5);
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = v29;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Stopping filesize update. Set state attachment filesizes updated activity result %d", buf, 8u);
        }
      }
    }
    [(IMDCKCacheDeleteManager *)self setIsUpdatingAttachmentFileSizes:0];
  }
LABEL_52:
}

- (void)registerWithCacheDelete
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9738D30;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  if (qword_1EBE2BB78 != -1) {
    dispatch_once(&qword_1EBE2BB78, block);
  }
}

- (void)_cacheDeleteSetUp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
      int v5 = [v4 cacheDeleteEnabled];
      uint64_t v6 = @"NO";
      if (v5) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Setting up cache delete callbacks cache delete enabled %@", buf, 0xCu);
    }
  }
  [(IMDCKCacheDeleteManager *)self isUsingCentralizedModel];
  [(IMDCKCacheDeleteManager *)self setIsUsingCentralizedModel:IMGetDomainBoolForKeyWithDefaultValue()];
  if ([(IMDCKCacheDeleteManager *)self isUsingCentralizedModel])
  {
    CacheDeleteRegisterInfoCallbacks();
    CacheDeleteInitPurgeMarker();
    CFStringRef v7 = CFStringCreateWithCString(0, (const char *)[@"/var/mobile/Library/SMS" fileSystemRepresentation], 0x8000100u);
    int v8 = [@"/var/mobile/Library/SMS" isEqualToString:@"all"];
    v9 = &unk_1F33C5FE8;
    if (v8) {
      v9 = 0;
    }
    id v10 = v9;
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[1] = (id)v7;
    objc_copyWeak(v11, (id *)buf);
    CacheDeleteRegisterPurgeNotification();
    objc_destroyWeak(v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    CacheDeleteRegisterInfoCallbacks();
  }
}

- (void)resetAttachmentWatermark
{
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    v2 = +[IMDAttachmentStore sharedInstance];
    [v2 markAllAttachmentsAsNotPurgeable];

    IMSetDomainValueForKey();
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Attachment watermark reset to 0", v4, 2u);
      }
    }
  }
}

- (id)_cacheDeleteRequestCacheableSpaceGuidanceWithID:(id)a3 diskVolume:(id)a4 urgency:(int)a5 requestedSize:(unint64_t)a6
{
  CFStringRef v7 = NSNumber;
  id v8 = a4;
  [v7 numberWithUnsignedLong:a6];
  v9 = (void *)CacheDeleteRequestCacheableSpaceGuidance();

  return v9;
}

- (id)_cacheDeleteGuidanceDictionaryForRequestedSize:(unint64_t)a3
{
  if (qword_1EA8CA510 != -1) {
    dispatch_once(&qword_1EA8CA510, &unk_1F3391080);
  }

  return (id)MEMORY[0x1F4181798](self, sel__cacheDeleteRequestCacheableSpaceGuidanceWithID_diskVolume_urgency_requestedSize_);
}

- (BOOL)canWriteFileOfEstimatedSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(IMDCKCacheDeleteManager *)self isDeviceLowOnDiskSpace])
  {
    if (v4)
    {
      CFStringRef v7 = [(IMDCKCacheDeleteManager *)self _cacheDeleteGuidanceDictionaryForRequestedSize:a3];
      id v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_GUIDANCE"];
      v9 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
      unint64_t v10 = [v9 unsignedLongLongValue];

      [(IMDCKCacheDeleteManager *)self setDeviceLowOnDiskSpace:v10 < a3];
      -[IMDCKCacheDeleteManager setAllowsWritingToDisk:](self, "setAllowsWritingToDisk:", [v8 isEqualToString:@"CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE"] ^ 1);
      if (![(IMDCKCacheDeleteManager *)self allowsWritingToDisk]
        && IMOSLoggingEnabled())
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = [NSNumber numberWithUnsignedLong:a3];
          int v14 = 138412546;
          uint64_t v15 = v7;
          __int16 v16 = 2112;
          v17 = v12;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Cache delete  guidance %@ requested size %@", (uint8_t *)&v14, 0x16u);
        }
      }
    }
  }
  else if (![(IMDCKCacheDeleteManager *)self isDeviceLowOnDiskSpace])
  {
    [(IMDCKCacheDeleteManager *)self setAllowsWritingToDisk:1];
  }
  return [(IMDCKCacheDeleteManager *)self allowsWritingToDisk];
}

- (BOOL)shouldDownloadAssetsOfSize:(unint64_t)a3 refreshCachedValue:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = -[IMDCKCacheDeleteManager _cacheDeleteGuidanceDictionaryForRequestedSize:](self, "_cacheDeleteGuidanceDictionaryForRequestedSize:");
    CFStringRef v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_GUIDANCE"];
    -[IMDCKCacheDeleteManager setAllowsWritingToDisk:](self, "setAllowsWritingToDisk:", [v7 isEqualToString:@"CACHE_DELETE_GUIDANCE_DO_NOT_EXPAND_CACHE"] ^ 1);
    if (![(IMDCKCacheDeleteManager *)self allowsWritingToDisk]
      && IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [NSNumber numberWithUnsignedLong:a3];
        int v11 = 138412546;
        v12 = v6;
        __int16 v13 = 2112;
        int v14 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Cache delete  guidance %@ requested size %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  return [(IMDCKCacheDeleteManager *)self allowsWritingToDisk];
}

- (id)reportAvailableSpaceToBeDeleted:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFStringRef v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int64_t v8 = [(IMDCKCacheDeleteManager *)self _purgeableSpaceGivenUrgency:v4];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = [NSNumber numberWithLongLong:v8];
      *(_DWORD *)buf = 134218242;
      int64_t v17 = v8;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Purgeable callback -- purgeableSpace: %lld purgeableNumber: %@", buf, 0x16u);
    }
  }
  int v11 = objc_msgSend(NSNumber, "numberWithLongLong:", v8, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v7);
  v15[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:2];

  return v12;
}

- (id)deleteAttachmentsAndReturnBytesDeleted:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CFStringRef v7 = [v6 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int64_t v8 = [(IMDCKCacheDeleteManager *)self _deleteAttachmentsAndReturnBytesDeleted:v4];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [MEMORY[0x1E4F29060] isMainThread];
      int v11 = @"NO";
      *(_DWORD *)buf = 134218498;
      int64_t v18 = v8;
      __int16 v19 = 2112;
      if (v10) {
        int v11 = @"YES";
      }
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      BOOL v22 = v11;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Purge callback -- Deleted bytes: %lld, volume: %@ is running on main thread: %@", buf, 0x20u);
    }
  }
  v12 = objc_msgSend(NSNumber, "numberWithLongLong:", v8, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v7);
  v16[1] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:2];

  return v13;
}

- (id)createDictionaryForNotDeletingAnyAttachments:(id)a3 urgency:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  id v6 = [NSNumber numberWithLongLong:0];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "nothingToPurgeDictionary -- volume: %@ purgeableSpace: %@", buf, 0x16u);
    }
  }
  v10[0] = @"CACHE_DELETE_VOLUME";
  v10[1] = @"CACHE_DELETE_AMOUNT";
  v11[0] = v5;
  v11[1] = v6;
  int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (BOOL)canMarkPurgeableIfIsRichLinkForTransferGUID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDAttachmentStore sharedInstance];
  int v5 = [v4 attachmentWithGUID:v3];

  id v6 = +[IMDMessageStore sharedInstance];
  CFStringRef v7 = [v6 messageForAttachmentGUID:v3];

  int64_t v8 = [v7 balloonBundleID];
  uint64_t v9 = [v8 isEqualToString:*MEMORY[0x1E4F6CC10]];

  int v10 = [v5 canMarkPurgeableIfIsRichLink:v9];
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v5 filename];
      int v13 = [v5 hideAttachment];
      uint64_t v14 = [v7 balloonBundleID];
      uint64_t v15 = (void *)v14;
      uint64_t v16 = @"NO";
      int v19 = 138413314;
      id v20 = v3;
      if (v13) {
        int64_t v17 = @"YES";
      }
      else {
        int64_t v17 = @"NO";
      }
      if (v10) {
        uint64_t v16 = @"YES";
      }
      __int16 v21 = 2112;
      BOOL v22 = v12;
      __int16 v23 = 2112;
      v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "canMarkPurgeableIfIsRichLinkForTransferGUID: %@ file: [%@], hideAttachment: [%@], bundleID: [%@] purgeable: [%@]", (uint8_t *)&v19, 0x34u);
    }
  }

  return v10;
}

- (id)_copyAttachmentRecord:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([v3 count] - 1) > 8) {
    [v3 objectAtIndexedSubscript:9];
  }
  else {
  id v4 = [v3 lastObject];
  }
  int v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();
  if (!v5)
  {
    int v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();
    if (!v5)
    {
      if ([v3 count])
      {
        unint64_t v6 = 0;
        CFStringRef v7 = 0;
        do
        {
          int64_t v8 = [v3 objectAtIndexedSubscript:v6];
          int v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();

          if (!v5)
          {
            uint64_t v9 = [v3 objectAtIndexedSubscript:v6];
            int v5 = (void *)IMDAttachmentRecordCopyAttachmentForGUIDIsLegacyGUID();

            if (!v5) {
              break;
            }
          }
          ++v6;
          CFStringRef v7 = v5;
        }
        while (v6 < [v3 count]);
      }
      else
      {
        int v5 = 0;
      }
    }
  }

  return v5;
}

- (int64_t)_purgeableSpaceGivenUrgency:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(IMDCKCacheDeleteManager *)self purgeableAttachmentSize];
  uint64_t v5 = v4;
  switch(a3)
  {
    case 1:
      double v6 = (double)v4;
      double v7 = 0.25;
      goto LABEL_6;
    case 2:
      double v6 = (double)v4;
      double v7 = 0.5;
      goto LABEL_6;
    case 3:
      double v6 = (double)v4;
      double v7 = 0.75;
LABEL_6:
      int64_t v8 = (uint64_t)(v6 * v7);
      break;
    case 4:
      int64_t v8 = v4;
      break;
    default:
      int64_t v8 = 0;
      break;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134218496;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      int64_t v14 = v8;
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "_purgeableSpaceGivenUrgency -- Bytes available to purge: %lld result: %lld urgency: %d", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v8;
}

- (int64_t)_deleteAttachmentsAndReturnBytesDeleted:(int)a3
{
  int64_t v5 = -[IMDCKCacheDeleteManager _purgeableSpaceGivenUrgency:](self, "_purgeableSpaceGivenUrgency:");
  if (a3 == 4)
  {
    uint64_t v6 = -1;
  }
  else
  {
    uint64_t v6 = v5;
    if (v5 < 0)
    {
      if (IMOSLoggingEnabled())
      {
        double v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v11 = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "We somehow got back a negative number of bytes to delete so we don't want to delete anything", v11, 2u);
        }
      }
      uint64_t v6 = 0;
    }
  }
  int64_t v8 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  int v9 = [v8 cacheDeleteEnabled];

  if (v9) {
    return [(IMDCKCacheDeleteManager *)self purgeAttachments:v6];
  }
  else {
    return 0;
  }
}

- (id)__wrapperAroundCacheDeletePurgeableCallback:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = [(IMDCKCacheDeleteManager *)self reportAvailableSpaceToBeDeleted:v6 urgency:v4];
  int64_t v8 = [(IMDCKCacheDeleteManager *)self createDictionaryForNotDeletingAnyAttachments:v6 urgency:v4];

  int v9 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  LODWORD(v6) = [v9 cacheDeleteEnabled];

  if (v6)
  {
    id v10 = v7;

    int64_t v8 = v10;
  }

  return v8;
}

- (id)__wrapperAroundCacheDeletePurgingCallback:(id)a3 urgency:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = [(IMDCKCacheDeleteManager *)self deleteAttachmentsAndReturnBytesDeleted:v6 urgency:v4];
  int64_t v8 = [(IMDCKCacheDeleteManager *)self createDictionaryForNotDeletingAnyAttachments:v6 urgency:v4];

  int v9 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  LODWORD(v6) = [v9 cacheDeleteEnabled];

  if (v6)
  {
    id v10 = v7;

    int64_t v8 = v10;
  }

  return v8;
}

- (int64_t)purgeableAttachmentSize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  char v3 = [v2 cacheDeleteEnabled];

  if (v3)
  {
    int64_t PurgeableDiskSpace = IMDAttachmentRecordGetPurgeableDiskSpace();
    if (IMOSLoggingEnabled())
    {
      int64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [NSNumber numberWithLongLong:PurgeableDiskSpace];
        int v9 = 138412290;
        id v10 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Purgeable space %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Tried to obtain purgeable attachments without proper default ---- please set them: defaults write com.apple.madrid EnableCacheDelete -BOOL YES", (uint8_t *)&v9, 2u);
      }
    }
    return 0;
  }
  return PurgeableDiskSpace;
}

- (int64_t)purgeAttachments:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  char v6 = [v5 cacheDeleteEnabled];

  int v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      int64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v19 = 134217984;
        int64_t v20 = a3;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "purgeAttachments with bytes: %lld", (uint8_t *)&v19, 0xCu);
      }
    }
    int v9 = (void *)IMDAttachmentRecordCopyAttachmentsToPurgeForDiskSpace();
    if (v9)
    {
      id v10 = [(IMDCKCacheDeleteManager *)self _fileTransfersToDelete:v9];
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v9 count];
          uint64_t v13 = [v10 count];
          int v19 = 134218240;
          int64_t v20 = v12;
          __int16 v21 = 2048;
          uint64_t v22 = v13;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "We got back %lu records from persistence to delete which resulted in %lu file transfers to delete", (uint8_t *)&v19, 0x16u);
        }
      }
      int64_t v14 = [(IMDCKCacheDeleteManager *)self _deleteFilesOnDiskAndUpdateTransfers:v10];

      goto LABEL_26;
    }
    if (IMIsRunningInAutomation())
    {
      int v16 = [MEMORY[0x1E4F6E6E8] sharedInstance];
      [v16 postCoreAutomationNotificationFinishedPurgingAttachments:0 withErrorString:@"No attachments to delete"];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, " We didn't get back any attachments to purge", (uint8_t *)&v19, 2u);
      }
    }
LABEL_25:
    int64_t v14 = 0;
LABEL_26:

    return v14;
  }
  if (v7)
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Tried to purge attachments without proper default ---- please set them: defaults write com.apple.madrid PurgeWithCacheDelete -BOOL YES", (uint8_t *)&v19, 2u);
    }
  }
  if (IMIsRunningInAutomation())
  {
    int v9 = [MEMORY[0x1E4F6E6E8] sharedInstance];
    [v9 postCoreAutomationNotificationFinishedPurgingAttachments:0 withErrorString:@"PurgeWithCacheDelete default not enabled"];
    goto LABEL_25;
  }
  return 0;
}

- (id)_fileTransfersToDelete:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = IMFileTransferFromIMDAttachmentRecordRef(v9);
        if (v10)
        {
          [v4 addObject:v10];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = [v9 rowID];
            *(_DWORD *)buf = 134217984;
            uint64_t v19 = v12;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "We failed to create an IMFileTransfer for IMDAttachmentRecordRef with identifier: %lld", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (int64_t)_deleteFilesOnDiskAndUpdateTransfers:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v3 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  char v4 = [v3 cacheDeleteEnabled];

  if (v4)
  {
    if (IMIsRunningInAutomation()) {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v35 = 0;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v6 = v34;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (!v7)
    {
      int64_t v36 = 0;
      goto LABEL_47;
    }
    int64_t v36 = 0;
    uint64_t v8 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v11 = [v10 existsAtLocalPath];
        int v12 = IMOSLoggingEnabled();
        if (v11)
        {
          if (v12)
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              long long v14 = [v10 localPath];
              long long v15 = [v10 guid];
              *(_DWORD *)buf = 138412546;
              __int16 v43 = v14;
              __int16 v44 = 2112;
              uint64_t v45 = v15;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "We are removing the file at path: %@ for transfer: %@", buf, 0x16u);
            }
          }
          long long v16 = +[IMDAttachmentStore sharedInstance];
          long long v17 = [v10 localPath];
          char v18 = [v16 isSafeToDeleteAttachmentAtPath:v17];

          if (v18)
          {
            uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
            int64_t v20 = [v10 localPath];
            id v37 = 0;
            [v19 removeItemAtPath:v20 error:&v37];
            uint64_t v21 = v37;

            int v22 = IMOSLoggingEnabled();
            if (v21)
            {
              if (v22)
              {
                uint64_t v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v43 = v21;
                  _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "There was an error trying to remove the file: %@", buf, 0xCu);
                }
              }
            }
            else
            {
              if (v22)
              {
                uint64_t v29 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "We successfully removed the file - setting the transfer state to waiting for accept", buf, 2u);
                }
              }
              uint64_t v30 = [v10 totalBytes];
              if (IMIsRunningInAutomation()) {
                [v35 addObject:v10];
              }
              long long v31 = +[IMDFileTransferCenter sharedInstance];
              [v31 updateTransferAsWaitingForAccept:v10];

              uint64_t v21 = 0;
              v36 += v30;
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                __int16 v27 = [v10 guid];
                v28 = [v10 localPath];
                *(_DWORD *)buf = 138412546;
                __int16 v43 = v27;
                __int16 v44 = 2112;
                uint64_t v45 = v28;
                _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "We attempted to delete a path that was not safe to delete for guid: %@ path: %@", buf, 0x16u);
              }
            }
            uint64_t v21 = 0;
          }
        }
        else
        {
          if (!v12) {
            continue;
          }
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v24 = [v10 guid];
            __int16 v25 = [v10 localPath];
            *(_DWORD *)buf = 138412546;
            __int16 v43 = v24;
            __int16 v44 = 2112;
            uint64_t v45 = v25;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "The transfer we want to remove does not exist at its local path -- transfer (%@) local path (%@)", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (!v7)
      {
LABEL_47:

        if (IMIsRunningInAutomation()) {
          [(IMDCKCacheDeleteManager *)self _postTransferInfoOfDeletedTransfers:v35];
        }

        goto LABEL_50;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Tried to call _deleteFilesOnDiskAndUpdateTransfers without proper default ---- please set them: defaults write com.apple.madrid EnableCacheDelete -BOOL YES", buf, 2u);
    }
  }
  int64_t v36 = 0;
LABEL_50:

  return v36;
}

- (void)_postTransferInfoOfDeletedTransfers:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v8 = [v7 localPath];
        int v9 = (void *)v8;
        id v10 = @"-1";
        if (v8) {
          id v10 = (__CFString *)v8;
        }
        int v11 = v10;

        uint64_t v12 = [v7 transferState];
        uint64_t v13 = [v7 existsAtLocalPath];
        if (v12) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = v13;
        }
        v31[0] = @"existsAtLocalPath";
        long long v15 = [NSNumber numberWithBool:v13];
        v32[0] = v15;
        v32[1] = v11;
        v31[1] = @"localPath";
        v31[2] = @"transferState";
        long long v16 = [NSNumber numberWithInteger:v12];
        v32[2] = v16;
        v31[3] = @"success";
        long long v17 = [NSNumber numberWithBool:v14];
        v32[3] = v17;
        char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

        uint64_t v19 = [v7 guid];

        [v24 setObject:v18 forKey:v19];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v4);
  }

  if (IMOSLoggingEnabled())
  {
    int64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v24 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v30 = v21;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Created %lu dictionarie(s) for transfer info of deleted attachment(s)", buf, 0xCu);
    }
  }
  int v22 = [MEMORY[0x1E4F6E6E8] sharedInstance];
  [v22 postCoreAutomationNotificationFinishedPurgingAttachments:v24 withErrorString:0];
}

- (void)metricAttachmentsToPurge:(int64_t)a3 withActivity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  int v8 = [v7 deviceConditionsAllowPeriodicSync];

  int v9 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  int v10 = [v9 cloudKitSyncingEnabled];

  int v11 = IMOSLoggingEnabled();
  if (v10 & v8)
  {
    if (v11)
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 134217984;
        int64_t v19 = a3;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "We are going to try and fetch attachments we would want to delete from local disk with bytes to free up: %lld", (uint8_t *)&v18, 0xCu);
      }
    }
    uint64_t v13 = (void *)IMDAttachmentRecordCopyAttachmentsToMetricForDiskSpace();
    if ([v13 count])
    {
      uint64_t v14 = [(IMDCKCacheDeleteManager *)self _fileTransfersToValidate:v13];
      [(IMDCKCacheDeleteManager *)self _fetchTransfersFromCloudKit:v14 withActivity:v6];
    }
  }
  else if (v11)
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = @"NO";
      if (v10) {
        long long v17 = @"YES";
      }
      else {
        long long v17 = @"NO";
      }
      if (v8) {
        long long v16 = @"YES";
      }
      int v18 = 138412546;
      int64_t v19 = (int64_t)v17;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Did NOT metric fetching synced attachments from CloudKit. CK Enabled %@ , device conditions allow sync %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (id)_fileTransfersToValidate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = IMFileTransferFromIMDAttachmentRecordRef(*(void **)(*((void *)&v12 + 1) + 8 * i));
        if ([v9 existsAtLocalPath])
        {
          [v4 addObject:v9];
        }
        else if (IMOSLoggingEnabled())
        {
          int v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v9;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We got a fileTransfer that doesn't exist that we think we can delete for CacheDelete: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_fetchTransfersFromCloudKit:(id)a3 withActivity:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = vcvtpd_u64_f64((double)(unint64_t)[v6 count] / 30.0);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      unint64_t v12 = v8;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Going to try and fetch from sync controller with %ld batches to fetch", (uint8_t *)&v11, 0xCu);
    }
  }
  int v10 = +[IMDCKAttachmentSyncController sharedInstance];
  [v10 setIsSyncing:1];

  [(IMDCKCacheDeleteManager *)self _fetchTransfersFromCloudKit:v6 indexOfTransfers:0 numberOfBatchesToFetch:v8 activity:v7 withCompletion:&unk_1F33910A0];
}

- (id)_getIndexSetForBatch:(id)a3 indexOfTransfers:(unint64_t)a4
{
  uint64_t v5 = [a3 count];
  if (v5 - a4 >= 0x1E) {
    uint64_t v6 = 30;
  }
  else {
    uint64_t v6 = v5 - a4;
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", a4, v6);

  return v7;
}

- (unint64_t)_indexOfNextBatch:(id)a3 totalTransfers:(id)a4 indexOfTransfers:(unint64_t)a5
{
  return [a3 count] + a5;
}

- (BOOL)_shouldFetchNextBatch:(unint64_t)a3 totalTransfers:(id)a4
{
  id v6 = a4;
  id v7 = [(IMDCKCacheDeleteManager *)self _ckUtilitiesSharedInstance];
  char v8 = [v7 deviceConditionsAllowPeriodicSync];

  if (v8)
  {
    BOOL v9 = [v6 count] - 1 >= a3;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v12 = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "We disconnected from power or wifi in between batches, so cutting the batches short", v12, 2u);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_fetchTransfersFromCloudKit:(id)a3 indexOfTransfers:(unint64_t)a4 numberOfBatchesToFetch:(unint64_t)a5 activity:(id)a6 withCompletion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v28 = a6;
  id v26 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      long long v15 = [NSNumber numberWithUnsignedLong:a4];
      long long v16 = [NSNumber numberWithUnsignedLong:a5];
      *(_DWORD *)buf = 138412802;
      long long v38 = v14;
      __int16 v39 = 2112;
      long long v40 = v15;
      __int16 v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_fetchTransfers with totalTransferCount: %@ index of transfers: %@ number of batches to fetch: %@", buf, 0x20u);
    }
  }
  id v17 = -[IMDCKCacheDeleteManager _getIndexSetForBatch:indexOfTransfers:](self, "_getIndexSetForBatch:indexOfTransfers:", v12, a4, v26);
  int v18 = [v12 objectsAtIndexes:v17];
  unint64_t v19 = [(IMDCKCacheDeleteManager *)self _indexOfNextBatch:v18 totalTransfers:v12 indexOfTransfers:a4];
  BOOL v20 = [(IMDCKCacheDeleteManager *)self _shouldFetchNextBatch:v19 totalTransfers:v12];
  uint64_t v21 = +[IMDCKAttachmentSyncController sharedInstance];
  BOOL alreadyCapturedErrorWithAutoBugCapture = self->_alreadyCapturedErrorWithAutoBugCapture;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1D973C9B8;
  v29[3] = &unk_1E6B75680;
  unint64_t v33 = a4;
  unint64_t v34 = v19;
  unint64_t v35 = a5;
  BOOL v36 = v20;
  v29[4] = self;
  id v30 = v12;
  id v31 = v28;
  id v32 = v27;
  id v23 = v27;
  id v24 = v28;
  id v25 = v12;
  [v21 _fetchAndValidateFileTransfersFromCloudKit:v18 capturedWithABC:alreadyCapturedErrorWithAutoBugCapture activity:v24 completion:v29];
}

- (void)batchCompletedWithTransfers:(id)a3
{
  id v4 = a3;
  if (IMIsRunningInAutomation()) {
    [(IMDCKCacheDeleteManager *)self _postTransferInfoOfDeletedTransfers:v4];
  }
}

- (IMPurgedAttachmentHandler)purgedAttachmentHandler
{
  return self->_purgedAttachmentHandler;
}

- (void)setPurgedAttachmentHandler:(id)a3
{
}

- (BOOL)alreadyCapturedErrorWithAutoBugCapture
{
  return self->_alreadyCapturedErrorWithAutoBugCapture;
}

- (void)setAlreadyCapturedErrorWithAutoBugCapture:(BOOL)a3
{
  self->_BOOL alreadyCapturedErrorWithAutoBugCapture = a3;
}

- (BOOL)allowsWritingToDisk
{
  return self->_allowsWritingToDisk;
}

- (void)setAllowsWritingToDisk:(BOOL)a3
{
  self->_allowsWritingToDisk = a3;
}

- (BOOL)isDeviceLowOnDiskSpace
{
  return self->_deviceLowOnDiskSpace;
}

- (void)setDeviceLowOnDiskSpace:(BOOL)a3
{
  self->_deviceLowOnDiskSpace = a3;
}

- (BOOL)isUsingCentralizedModel
{
  return self->_isUsingCentralizedModel;
}

- (void)setIsUsingCentralizedModel:(BOOL)a3
{
  self->_isUsingCentralizedModel = a3;
}

- (BOOL)isUpdatingAttachmentFileSizes
{
  return self->_isUpdatingAttachmentFileSizes;
}

- (void)setIsUpdatingAttachmentFileSizes:(BOOL)a3
{
  self->_isUpdatingAttachmentFileSizes = a3;
}

- (void).cxx_destruct
{
}

@end