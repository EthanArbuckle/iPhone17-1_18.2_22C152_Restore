@interface CKStoragePlugin
+ (id)_representedApp;
- (BOOL)_attachmentsTakeUpMoreSpaceThanBytes:(unint64_t)a3;
- (BOOL)_attachmentsTakeUpSignificantSpace;
- (BOOL)_cloudKitEnabled;
- (BOOL)_forceShowingAutoDeleteMessagesTip;
- (BOOL)_forceShowingReviewLargeAttachmentsTip;
- (BOOL)_shouldDisplayAutoDeleteMessagesTip;
- (BOOL)_shouldDisplayReviewLargeAttachmentsTip;
- (BOOL)cachedAttachmentsTakeUpSignificantSpace;
- (CKStoragePlugin)init;
- (IMCloudKitHooks)cloudKitHooks;
- (IMDirectoryContentsSizes)messageDirectorySizes;
- (IMMessageDirectoryContents)messageDirectoryContents;
- (NSArray)appSpecifiers;
- (NSArray)cloudAppSpecifiers;
- (NSDate)cachedAttachmentsTakeUpSignificantSpaceDate;
- (NSDictionary)spaceTakenByAttachmentClass;
- (OS_dispatch_queue)privateWorkQueue;
- (PSSpecifier)initialAppSpecifier;
- (STStorageActionTip)cachedReviewLargeAttachmentsTip;
- (STStorageActionTip)cachedReviewLargeConversationsTip;
- (STStorageOptionTip)cachedAutoDeleteMessagesTip;
- (STStorageOptionTip)cachedMessagesIniCloudTip;
- (_TtC7ChatKit20CKCloudTipDescriptor)cloudTipDescriptor;
- (double)lastQuerySpaceSavedByAutoDeletingMessagesTime;
- (double)lastQuerySpaceSavedByNonSyncedDeletingAttachments;
- (double)lastQuerySpaceSavedByReviewingLargeConversationsTime;
- (id)_autoDeleteMessagesTip;
- (id)_messagesIniCloudTip;
- (id)_reviewLargeAttachmentsTip;
- (id)_spaceTakenForSpecifier:(id)a3;
- (id)cloudDocumentSpecifiers;
- (id)documentAppIdentifiers;
- (id)documentSpecifiersForApp:(id)a3;
- (id)externDataSizeAppIdentifiers;
- (id)tips;
- (int64_t)_purgeableDiskSpace;
- (int64_t)_totalSpaceOfAttachments;
- (int64_t)externDataSizeForApp:(id)a3;
- (unint64_t)_spaceSavedByAutoDeleteMessages;
- (unint64_t)_spaceSavedByDeletingNonSyncedAttachments;
- (unint64_t)_spaceSavedByReviewingLargeConversations;
- (unint64_t)_totalSpaceOfLargeConversations;
- (unint64_t)cachedSpaceSavedByAutoDeletingMessages;
- (unint64_t)cachedSpaceSavedByDeletingNonSyncedAttachments;
- (unint64_t)cachedSpaceSavedByReviewingLargeConversations;
- (unint64_t)messageDatabaseSize;
- (void)_configureCloudTipController;
- (void)_displayICloudErrorMessage;
- (void)_enableAutoDeleteMessages;
- (void)_enableMessagesIniCloud;
- (void)_iCloudHooksSetEnabledReturned:(id)a3;
- (void)_loadAppSpecifiers;
- (void)_loadAttachmentSizes;
- (void)_loadiCloudAppSpecifiers;
- (void)_refreshMessageIniCloudTipIfNeeded;
- (void)calculateDirectorySizesIfNeeded;
- (void)dealloc;
- (void)enableOptionForTip:(id)a3;
- (void)setAppSpecifiers:(id)a3;
- (void)setCachedAttachmentsTakeUpSignificantSpace:(BOOL)a3;
- (void)setCachedAttachmentsTakeUpSignificantSpaceDate:(id)a3;
- (void)setCachedAutoDeleteMessagesTip:(id)a3;
- (void)setCachedMessagesIniCloudTip:(id)a3;
- (void)setCachedReviewLargeAttachmentsTip:(id)a3;
- (void)setCachedReviewLargeConversationsTip:(id)a3;
- (void)setCachedSpaceSavedByAutoDeletingMessages:(unint64_t)a3;
- (void)setCachedSpaceSavedByDeletingNonSyncedAttachments:(unint64_t)a3;
- (void)setCachedSpaceSavedByReviewingLargeConversations:(unint64_t)a3;
- (void)setCloudAppSpecifiers:(id)a3;
- (void)setCloudKitHooks:(id)a3;
- (void)setCloudTipDescriptor:(id)a3;
- (void)setLastQuerySpaceSavedByAutoDeletingMessagesTime:(double)a3;
- (void)setLastQuerySpaceSavedByNonSyncedDeletingAttachments:(double)a3;
- (void)setLastQuerySpaceSavedByReviewingLargeConversationsTime:(double)a3;
- (void)setPrivateWorkQueue:(id)a3;
- (void)setSpaceTakenByAttachmentClass:(id)a3;
@end

@implementation CKStoragePlugin

- (int64_t)externDataSizeForApp:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() _representedApp];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    if ([(CKStoragePlugin *)self _cloudKitEnabled])
    {
      [(CKStoragePlugin *)self calculateDirectorySizesIfNeeded];
      v7 = [(CKStoragePlugin *)self messageDirectorySizes];
      uint64_t v8 = [v7 totalSize];
      uint64_t v10 = v9;
      v11 = [(CKStoragePlugin *)self messageDirectorySizes];
      uint64_t v12 = [v11 totalPurgableSize];
      uint64_t v14 = v13;

      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = (void *)MEMORY[0x1E4F28EE0];
          v17 = [(CKStoragePlugin *)self messageDirectorySizes];
          uint64_t v18 = [v17 totalSize];
          v20 = objc_msgSend(v16, "stringFromFileSize:", v18, v19);
          int v38 = 138412290;
          v39 = v20;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "             Total size: %@", (uint8_t *)&v38, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)MEMORY[0x1E4F28EE0];
          v23 = [(CKStoragePlugin *)self messageDirectorySizes];
          uint64_t v24 = [v23 totalPurgableSize];
          v26 = objc_msgSend(v22, "stringFromFileSize:", v24, v25);
          int v38 = 138412290;
          v39 = v26;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "    Total purgable size: %@", (uint8_t *)&v38, 0xCu);
        }
      }
      int64_t v27 = v10 - v14;
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = objc_msgSend(MEMORY[0x1E4F28EE0], "stringFromFileSize:", v8 - v12, v27);
          int v38 = 138412290;
          v39 = v29;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Total non-purgable size: %@", (uint8_t *)&v38, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)MEMORY[0x1E4F28EE0];
          v32 = [NSNumber numberWithUnsignedLongLong:v27];
          v33 = [v31 stringFromHugeNumber:v32];
          int v38 = 138412290;
          v39 = v33;
          _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Returning non-purgable size for display: %@", (uint8_t *)&v38, 0xCu);
        }
LABEL_23:
      }
    }
    else
    {
      int64_t v27 = [(CKStoragePlugin *)self messageDatabaseSize];
      if (IMOSLoggingEnabled())
      {
        v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v34 = (void *)MEMORY[0x1E4F28EE0];
          v35 = [NSNumber numberWithLongLong:v27];
          v36 = [v34 stringFromHugeNumber:v35];
          int v38 = 138412290;
          v39 = v36;
          _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "Returning database size for non MiC display: %@", (uint8_t *)&v38, 0xCu);
        }
        goto LABEL_23;
      }
    }
  }
  else
  {
    int64_t v27 = 0;
  }

  return v27;
}

- (void)_refreshMessageIniCloudTipIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_cachedMessagesIniCloudTip)
  {
    v3 = [(CKStoragePlugin *)self cloudKitHooks];
    id v4 = [v3 lastSyncDate];

    if (v4) {
      float v5 = 1.0;
    }
    else {
      float v5 = -1.0;
    }
    int v6 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
    *(float *)&double v7 = v5;
    [v6 setActivationPercent:v7];

    uint64_t v8 = [(CKStoragePlugin *)self cloudKitHooks];
    int v9 = [v8 isEnabled];
    int v10 = [v8 eligibleForTruthZone];
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = @"NO";
        if (v9) {
          uint64_t v13 = @"YES";
        }
        else {
          uint64_t v13 = @"NO";
        }
        if (v10) {
          uint64_t v14 = @"YES";
        }
        else {
          uint64_t v14 = @"NO";
        }
        int v18 = 138412802;
        uint64_t v19 = v13;
        __int16 v20 = 2112;
        v21 = v14;
        if (v4) {
          uint64_t v12 = @"YES";
        }
        __int16 v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "_refreshMessageOniCloudTipIfNeeded enabled: %@, eligible: %@, completedSync: %@", (uint8_t *)&v18, 0x20u);
      }
    }
    if (!v4)
    {
      v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v16 = [v15 localizedStringForKey:@"MESSAGES_ON_ICLOUD_TIP_INFO" value:&stru_1EDE4CA38 table:@"General"];
      v17 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
      [v17 setInfoText:v16];
    }
  }
}

- (void)calculateDirectorySizesIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([(IMMessageDirectoryContents *)self->_messageDirectoryContents gatherIfNeeded] & 1) != 0
    || !self->_messageDirectorySizes)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v3 startTimingForKey:@"sizes"];
    id v4 = objc_alloc(MEMORY[0x1E4F6E748]);
    float v5 = [(IMMessageDirectoryContents *)self->_messageDirectoryContents allDirectoryContents];
    int v6 = (IMDirectoryContentsSizes *)[v4 initWithDirectoryContents:v5];
    messageDirectorySizes = self->_messageDirectorySizes;
    self->_messageDirectorySizes = v6;

    [v3 stopTimingForKey:@"sizes"];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        [v3 totalTimeForKey:@"sizes"];
        int v14 = 134217984;
        v15 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Calculated directory sizes in %f seconds", (uint8_t *)&v14, 0xCu);
      }
    }
    int v10 = [(IMMessageDirectoryContents *)self->_messageDirectoryContents allDirectoryContents];
    uint64_t v11 = [v10 spaceSavedFromIgnoreLivePhotoBundles];

    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [MEMORY[0x1E4F28B68] stringFromByteCount:v11 countStyle:0];
        int v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Saved %@ by ignoring live photo bundle contents.", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)_displayICloudErrorMessage
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = [v3 localizedStringForKey:@"MESSAGES_ON_ICLOUD_ERROR_TITLE" value:&stru_1EDE4CA38 table:@"General"];

  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  float v5 = [v4 localizedStringForKey:@"MESSAGES_ON_ICLOUD_ERROR_MESSAGE" value:&stru_1EDE4CA38 table:@"General"];

  int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v7 = [v6 localizedStringForKey:@"MESSAGES_ON_ICLOUDR_CONFIRM" value:&stru_1EDE4CA38 table:@"General"];

  uint64_t v8 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v14 message:v5 preferredStyle:1];
  int v9 = [MEMORY[0x1E4F42720] actionWithTitle:v7 style:0 handler:0];
  [v8 addAction:v9];

  int v10 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v11 = [v10 keyWindow];
  uint64_t v12 = [v11 rootViewController];
  [v12 presentViewController:v8 animated:1 completion:0];

  if (self->_cachedMessagesIniCloudTip)
  {
    uint64_t v13 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
    [v13 setActivationPercent:0.0];
  }
}

- (void)_loadAttachmentSizes
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];

  if (v2) {
    return;
  }
  if ([(CKStoragePlugin *)self _cloudKitEnabled])
  {
    [(CKStoragePlugin *)self calculateDirectorySizesIfNeeded];
    id v34 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v34 startTimingForKey:@"sizes"];
    id v3 = [(CKStoragePlugin *)self messageDirectoryContents];
    id v49 = [v3 allDirectoryContents];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [v49 fileInfoMap];
    uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (!v4)
    {
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v35 = 0;
      uint64_t v46 = 0;
      uint64_t v44 = 0;
      goto LABEL_49;
    }
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v35 = 0;
    uint64_t v46 = 0;
    uint64_t v44 = 0;
    uint64_t v5 = *(void *)v54;
    uint64_t v47 = *MEMORY[0x1E4F1C538];
    uint64_t v45 = *MEMORY[0x1E4F443D0];
    uint64_t v41 = *MEMORY[0x1E4F44400];
    uint64_t v39 = *MEMORY[0x1E4F44520];
    uint64_t v36 = *MEMORY[0x1E4F44448];
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v53 + 1) + 8 * v6);
        uint64_t v8 = [v49 fileInfoMap];
        int v9 = [v8 objectForKeyedSubscript:v7];

        if (v9)
        {
          if ([v9 isPurgableOnDisk]) {
            goto LABEL_28;
          }
          int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
          uint64_t v11 = v10;
          if (v10)
          {
            id v51 = 0;
            id v52 = 0;
            char v12 = [v10 getResourceValue:&v52 forKey:v47 error:&v51];
            id v13 = v52;
            id v14 = v51;
            if (v14) {
              char v15 = 0;
            }
            else {
              char v15 = v12;
            }
            if (v15)
            {
              [v9 fileSize];
              uint64_t v17 = v16;
              if (([v13 conformsToType:v45] & 1) != 0 || objc_msgSend(v9, "isSticker"))
              {
                v46 += v17;
              }
              else if ([v13 conformsToType:v41])
              {
                v44 += v17;
              }
              else if (([v13 conformsToType:v39] & 1) != 0 {
                     || [v13 conformsToType:v36])
              }
              {
                v42 = [v49 fileInfoMap];
                uint64_t v19 = [v9 path];
                __int16 v20 = objc_msgSend(v19, "im_livePhotoImagePath");
                v43 = [v42 objectForKeyedSubscript:v20];

                v21 = [v9 path];
                int v22 = objc_msgSend(v21, "im_isLivePhoto");
                if (v43) {
                  int v23 = v22;
                }
                else {
                  int v23 = 0;
                }

                if (v23)
                {
                  if (([v43 isPurgableOnDisk] & 1) == 0)
                  {
                    v35 += v17;
                    v44 += v17;
                  }
                }
                else
                {
                  v38 += v17;
                }
              }
              else
              {
                v37 += v17;
              }
            }
            else
            {
              int v18 = IMLogHandleForCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = [v14 localizedDescription];
                *(_DWORD *)buf = 138412546;
                uint64_t v60 = v7;
                __int16 v61 = 2112;
                v62 = v24;
                _os_log_error_impl(&dword_18EF18000, v18, OS_LOG_TYPE_ERROR, "Failed to get utiType for file at path: %@, with error: %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v14 = IMLogHandleForCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v60 = v7;
              _os_log_error_impl(&dword_18EF18000, v14, OS_LOG_TYPE_ERROR, "Failed to create URL for path: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v11 = IMLogHandleForCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v60 = v7;
            _os_log_error_impl(&dword_18EF18000, v11, OS_LOG_TYPE_ERROR, "Failed to find file info for path: %@", buf, 0xCu);
          }
        }

LABEL_28:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v25 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      uint64_t v4 = v25;
      if (!v25)
      {
LABEL_49:

        if (IMOSLoggingEnabled())
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v60 = v35;
            _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Total size of live photo videos attributed to photos section: %llu", buf, 0xCu);
          }
        }
        v57[0] = *MEMORY[0x1E4F6BEE8];
        int64_t v27 = [NSNumber numberWithUnsignedLongLong:v44];
        v58[0] = v27;
        v57[1] = *MEMORY[0x1E4F6BEF0];
        v28 = [NSNumber numberWithUnsignedLongLong:v38];
        v58[1] = v28;
        v57[2] = *MEMORY[0x1E4F6BED8];
        v29 = [NSNumber numberWithUnsignedLongLong:v46];
        v58[2] = v29;
        v57[3] = *MEMORY[0x1E4F6BEE0];
        v30 = [NSNumber numberWithUnsignedLongLong:v37];
        v58[3] = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:4];
        [(CKStoragePlugin *)self setSpaceTakenByAttachmentClass:v31];

        [v34 stopTimingForKey:@"sizes"];
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            [v34 totalTimeForKey:@"sizes"];
            *(_DWORD *)buf = 134217984;
            uint64_t v60 = v33;
            _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Calculated attachment sizes in %f seconds", buf, 0xCu);
          }
        }
        return;
      }
    }
  }
  IMDAttachmentSpaceTakenByAttachmentClass();
  id v50 = (id)objc_claimAutoreleasedReturnValue();
  [(CKStoragePlugin *)self setSpaceTakenByAttachmentClass:v50];
}

- (CKStoragePlugin)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKStoragePlugin;
  v2 = [(CKStoragePlugin *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    [(CKStoragePlugin *)v2 _configureCloudTipController];
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__iCloudHooksSetEnabledReturned_ name:*MEMORY[0x1E4F6BAB8] object:0];

    uint64_t v5 = (IMMessageDirectoryContents *)objc_alloc_init(MEMORY[0x1E4F6E838]);
    messageDirectoryContents = v3->_messageDirectoryContents;
    v3->_messageDirectoryContents = v5;

    uint64_t v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1EDE4CA38 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    initialAppSpecifier = v3->_initialAppSpecifier;
    v3->_initialAppSpecifier = (PSSpecifier *)v7;

    int v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v10 = dispatch_queue_create("_loadAppSpecifiers", v9);
    privateWorkQueue = v3->_privateWorkQueue;
    v3->_privateWorkQueue = (OS_dispatch_queue *)v10;
  }
  return v3;
}

+ (id)_representedApp
{
  return @"com.apple.MobileSMS";
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(STStorageOptionTip *)self->_cachedAutoDeleteMessagesTip setDelegate:0];
  [(STStorageOptionTip *)self->_cachedMessagesIniCloudTip setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)CKStoragePlugin;
  [(CKStoragePlugin *)&v4 dealloc];
}

- (id)documentAppIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _representedApp];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)documentSpecifiersForApp:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _representedApp];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(CKStoragePlugin *)self appSpecifiers];

    if (v7)
    {
      uint64_t v8 = [(CKStoragePlugin *)self appSpecifiers];
    }
    else
    {
      privateWorkQueue = self->_privateWorkQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__CKStoragePlugin_documentSpecifiersForApp___block_invoke;
      block[3] = &unk_1E5620C40;
      block[4] = self;
      dispatch_async(privateWorkQueue, block);
      v12[0] = self->_initialAppSpecifier;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

uint64_t __44__CKStoragePlugin_documentSpecifiersForApp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAppSpecifiers];
}

- (id)cloudDocumentSpecifiers
{
  [(CKStoragePlugin *)self _loadiCloudAppSpecifiers];

  return [(CKStoragePlugin *)self cloudAppSpecifiers];
}

- (id)externDataSizeAppIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _representedApp];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)_purgeableDiskSpace
{
  return MEMORY[0x1F4123158](self, a2);
}

- (BOOL)_cloudKitEnabled
{
  v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)enableOptionForTip:(id)a3
{
  id v7 = a3;
  id v4 = [(CKStoragePlugin *)self cachedAutoDeleteMessagesTip];

  if (v4 == v7)
  {
    [(CKStoragePlugin *)self _enableAutoDeleteMessages];
  }
  else
  {
    id v5 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];

    int v6 = v7;
    if (v5 != v7) {
      goto LABEL_6;
    }
    [(CKStoragePlugin *)self _enableMessagesIniCloud];
  }
  int v6 = v7;
LABEL_6:
}

- (void)_loadAppSpecifiers
{
  char v3 = [(CKStoragePlugin *)self appSpecifiers];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    if ([(CKStoragePlugin *)self _spaceSavedByReviewingLargeConversations])
    {
      id v5 = (void *)MEMORY[0x1E4F92E70];
      int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v7 = [v6 localizedStringForKey:@"CONVERSATIONS" value:&stru_1EDE4CA38 table:@"General"];
      uint64_t v8 = [v5 preferenceSpecifierNamed:v7 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [v4 addObject:v8];
    }
    [(CKStoragePlugin *)self _loadAttachmentSizes];
    int v9 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
    dispatch_queue_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F6BEE8]];
    uint64_t v11 = [v10 longLongValue];

    if (v11)
    {
      char v12 = (void *)MEMORY[0x1E4F92E70];
      objc_super v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"PHOTOS" value:&stru_1EDE4CA38 table:@"General"];
      char v15 = [v12 preferenceSpecifierNamed:v14 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [v4 addObject:v15];
    }
    uint64_t v16 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
    uint64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F6BEF0]];
    uint64_t v18 = [v17 longLongValue];

    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F92E70];
      __int16 v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"VIDEOS" value:&stru_1EDE4CA38 table:@"General"];
      int v22 = [v19 preferenceSpecifierNamed:v21 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [v4 addObject:v22];
    }
    int v23 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
    uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F6BED8]];
    uint64_t v25 = [v24 longLongValue];

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E4F92E70];
      int64_t v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"GIFSANDSTICKERS" value:&stru_1EDE4CA38 table:@"General"];
      v29 = [v26 preferenceSpecifierNamed:v28 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [v4 addObject:v29];
    }
    v30 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F6BEE0]];
    uint64_t v32 = [v31 longLongValue];

    if (v32)
    {
      uint64_t v33 = (void *)MEMORY[0x1E4F92E70];
      id v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v35 = [v34 localizedStringForKey:@"OTHER" value:&stru_1EDE4CA38 table:@"General"];
      uint64_t v36 = [v33 preferenceSpecifierNamed:v35 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
      [v4 addObject:v36];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CKStoragePlugin__loadAppSpecifiers__block_invoke;
    block[3] = &unk_1E5620AF8;
    block[4] = self;
    id v40 = v4;
    id v37 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    uint64_t v38 = [(id)objc_opt_class() _representedApp];
    [(STStoragePlugin *)self reloadSpecifiersForApp:v38];
  }
}

void __37__CKStoragePlugin__loadAppSpecifiers__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setAppSpecifiers:v2];
}

- (void)_loadiCloudAppSpecifiers
{
  char v3 = [(CKStoragePlugin *)self cloudAppSpecifiers];

  if (!v3)
  {
    id v9 = [MEMORY[0x1E4F1CA48] array];
    id v4 = (void *)MEMORY[0x1E4F92E70];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v6 = [v5 localizedStringForKey:@"CONVERSATIONS" value:&stru_1EDE4CA38 table:@"General"];
    id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:sel__spaceTakenForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
    [v9 addObject:v7];

    uint64_t v8 = (void *)[v9 copy];
    [(CKStoragePlugin *)self setCloudAppSpecifiers:v8];
  }
}

- (id)_spaceTakenForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 detailControllerClass];
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = [v4 detailControllerClass];
    if (v6 != objc_opt_class())
    {
      [(CKStoragePlugin *)self _loadAttachmentSizes];
      uint64_t v7 = [v4 detailControllerClass];
      if (v7 == objc_opt_class()) {
        id v8 = (id)*MEMORY[0x1E4F6BEE8];
      }
      else {
        id v8 = 0;
      }
      uint64_t v12 = [v4 detailControllerClass];
      if (v12 == objc_opt_class())
      {
        id v13 = (id)*MEMORY[0x1E4F6BEF0];

        id v8 = v13;
      }
      uint64_t v14 = [v4 detailControllerClass];
      if (v14 == objc_opt_class())
      {
        id v15 = (id)*MEMORY[0x1E4F6BED8];

        id v8 = v15;
      }
      uint64_t v16 = [v4 detailControllerClass];
      if (v16 == objc_opt_class())
      {
        id v20 = (id)*MEMORY[0x1E4F6BEE0];

        id v8 = v20;
        if (v20) {
          goto LABEL_17;
        }
      }
      else if (v8)
      {
LABEL_17:
        uint64_t v17 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
        uint64_t v18 = [v17 objectForKeyedSubscript:v8];
        uint64_t v19 = [v18 longLongValue];

        uint64_t v11 = [MEMORY[0x1E4F28B68] stringFromByteCount:v19 countStyle:0];
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v11 = &stru_1EDE4CA38;
      goto LABEL_20;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v22 = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Querying for space saved by conversations", v22, 2u);
    }
  }
  unint64_t v10 = [(CKStoragePlugin *)self _spaceSavedByReviewingLargeConversations];
  uint64_t v11 = [MEMORY[0x1E4F28B68] stringFromByteCount:v10 countStyle:0];
LABEL_21:

  return v11;
}

- (id)tips
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(CKStoragePlugin *)self _autoDeleteMessagesTip];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(CKStoragePlugin *)self _reviewLargeAttachmentsTip];
  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(CKStoragePlugin *)self _messagesIniCloudTip];
  if (v6) {
    [v3 addObject:v6];
  }
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)_attachmentsTakeUpMoreSpaceThanBytes:(unint64_t)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if ([(CKStoragePlugin *)self _cloudKitEnabled])
  {
    [(CKStoragePlugin *)self calculateDirectorySizesIfNeeded];
    id v5 = [(CKStoragePlugin *)self messageDirectorySizes];
    [v5 totalAttachmentSize];
    BOOL v7 = v6 > a3;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = CKAttachmentsDirectoryURL();
    v29[0] = *MEMORY[0x1E4F28390];
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    uint64_t v11 = [v8 enumeratorAtURL:v9 includingPropertiesForKeys:v10 options:0 errorHandler:0];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v11;
    uint64_t v12 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v14 = 0;
      uint64_t v15 = *(void *)v25;
      uint64_t v16 = *MEMORY[0x1E4F1C5F8];
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v5);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v23 = 0;
          int v19 = [v18 getResourceValue:&v23 forKey:v16 error:0];
          id v20 = v23;
          v21 = v20;
          if (v19)
          {
            v14 += [v20 unsignedLongLongValue];
            if (v14 > a3)
            {

              BOOL v7 = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v13 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v7 = 0;
LABEL_14:
  }
  return v7;
}

- (BOOL)_attachmentsTakeUpSignificantSpace
{
  uint64_t v3 = [(CKStoragePlugin *)self cachedAttachmentsTakeUpSignificantSpaceDate];
  if (!v3
    || (id v4 = (void *)v3,
        -[CKStoragePlugin cachedAttachmentsTakeUpSignificantSpaceDate](self, "cachedAttachmentsTakeUpSignificantSpaceDate"), id v5 = objc_claimAutoreleasedReturnValue(), [v5 timeIntervalSinceNow], v7 = v6, v5, v4, v7 < -10.0))
  {
    [(CKStoragePlugin *)self setCachedAttachmentsTakeUpSignificantSpace:[(CKStoragePlugin *)self _attachmentsTakeUpMoreSpaceThanBytes:104857600]];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [(CKStoragePlugin *)self setCachedAttachmentsTakeUpSignificantSpaceDate:v8];
  }

  return [(CKStoragePlugin *)self cachedAttachmentsTakeUpSignificantSpace];
}

- (IMCloudKitHooks)cloudKitHooks
{
  cloudKitHooks = self->_cloudKitHooks;
  if (!cloudKitHooks)
  {
    id v4 = [MEMORY[0x1E4F6BC68] sharedInstance];
    id v5 = self->_cloudKitHooks;
    self->_cloudKitHooks = v4;

    [(IMCloudKitHooks *)self->_cloudKitHooks setupIMCloudKitHooks];
    cloudKitHooks = self->_cloudKitHooks;
  }

  return cloudKitHooks;
}

- (unint64_t)_spaceSavedByAutoDeleteMessages
{
  [(CKStoragePlugin *)self lastQuerySpaceSavedByAutoDeletingMessagesTime];
  if (v3 == 0.0
    || ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
        double v5 = v4,
        [(CKStoragePlugin *)self lastQuerySpaceSavedByAutoDeletingMessagesTime], v5 - v6 > 10.0))
  {
    [(CKStoragePlugin *)self setCachedSpaceSavedByAutoDeletingMessages:IMDAttachmentRecordEstimateSpaceTakenByAttachmentsOlderThanDays()];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[CKStoragePlugin setLastQuerySpaceSavedByAutoDeletingMessagesTime:](self, "setLastQuerySpaceSavedByAutoDeletingMessagesTime:");
  }

  return [(CKStoragePlugin *)self cachedSpaceSavedByAutoDeletingMessages];
}

- (BOOL)_forceShowingAutoDeleteMessagesTip
{
  return CFPreferencesGetAppBooleanValue(@"ForceShowAutoDeleteMessages", @"com.apple.MobileSMS", 0) != 0;
}

- (BOOL)_shouldDisplayAutoDeleteMessagesTip
{
  double v3 = [(CKStoragePlugin *)self cloudKitHooks];
  if ([v3 isEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Not showing Auto Delete Messages tip, MoC is on.", buf, 2u);
      }
    }
    BOOL v5 = 0;
  }
  else
  {
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"KeepMessageForDays", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
    if (!keyExistsAndHasValidFormat || !AppIntegerValue || (BOOL v5 = 0, AppIntegerValue >= 366)) {
      BOOL v5 = [(CKStoragePlugin *)self _forceShowingAutoDeleteMessagesTip]
    }
        || [(CKStoragePlugin *)self _spaceSavedByAutoDeleteMessages] > 0x6400000;
  }

  return v5;
}

- (id)_autoDeleteMessagesTip
{
  if ([(CKStoragePlugin *)self _shouldDisplayAutoDeleteMessagesTip])
  {
    double v3 = [(CKStoragePlugin *)self cachedAutoDeleteMessagesTip];

    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FA80D0]);
      BOOL v5 = [(id)objc_opt_class() _representedApp];
      [v4 setRepresentedApp:v5];

      double v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v7 = [v6 localizedStringForKey:@"AUTO_DELETE_MESSAGES_TITLE" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setTitle:v7];

      id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"AUTO_DELETE_MESSAGES_INFO" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setInfoText:v9];

      unint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v10 localizedStringForKey:@"TURN_ON" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setEnableButtonTitle:v11];

      uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"AUTO_DELETE_MESSAGES_CONFIRM_TEXT" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setConfirmationText:v13];

      unint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v14 localizedStringForKey:@"AUTO_DELETE_MESSAGES_CONFIRM_BUTTON" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setConfirmationButtonTitle:v15];

      if (objc_opt_respondsToSelector()) {
        [v4 setMayCauseDataLoss:1];
      }
      objc_msgSend(v4, "setEventualGain:", -[CKStoragePlugin _spaceSavedByAutoDeleteMessages](self, "_spaceSavedByAutoDeleteMessages"));
      [v4 setDelegate:self];
      [(CKStoragePlugin *)self setCachedAutoDeleteMessagesTip:v4];
    }
    uint64_t v16 = [(CKStoragePlugin *)self cachedAutoDeleteMessagesTip];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v19 = 0;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Should not display Auto Delete Messages tip.", v19, 2u);
      }
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)_enableAutoDeleteMessages
{
  CFPreferencesSetAppValue(@"KeepMessageForDays", &unk_1EDF16BF8, @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.KeepMessages.changed", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.imautomatichistorydeletionagent.prefchange", 0, 0, 1u);
  id v4 = [(CKStoragePlugin *)self cachedAutoDeleteMessagesTip];
  LODWORD(v5) = 1.0;
  [v4 setActivationPercent:v5];

  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Enable Auto Delete Messages complete.", v7, 2u);
    }
  }
}

- (unint64_t)_spaceSavedByReviewingLargeConversations
{
  [(CKStoragePlugin *)self lastQuerySpaceSavedByReviewingLargeConversationsTime];
  if (v3 == 0.0
    || ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
        double v5 = v4,
        [(CKStoragePlugin *)self lastQuerySpaceSavedByReviewingLargeConversationsTime], v5 - v6 > 10.0))
  {
    [(CKStoragePlugin *)self setCachedSpaceSavedByReviewingLargeConversations:[(CKStoragePlugin *)self _totalSpaceOfLargeConversations]];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[CKStoragePlugin setLastQuerySpaceSavedByReviewingLargeConversationsTime:](self, "setLastQuerySpaceSavedByReviewingLargeConversationsTime:");
  }

  return [(CKStoragePlugin *)self cachedSpaceSavedByReviewingLargeConversations];
}

- (unint64_t)_totalSpaceOfLargeConversations
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Requesting size of large conversations", buf, 2u);
    }
  }
  double v4 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v4 connectToDaemon];

  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "large conversations - BlockUntilConnected finished", buf, 2u);
    }
  }
  *(void *)buf = 0;
  uint64_t v18 = buf;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if ([(CKStoragePlugin *)self _cloudKitEnabled])
  {
    double v6 = [(CKStoragePlugin *)self cloudAppSpecifiers];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Loading synced conversations", v21, 2u);
        }
      }
    }
  }
  id v9 = IMDAttachmentFindLargestConversations();
  if (IMOSLoggingEnabled())
  {
    unint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v21 = 138412290;
      int v22 = v9;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Found dbLargestConversations: %@", v21, 0xCu);
    }
  }
  uint64_t v11 = (void *)MEMORY[0x192FBB780]();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__CKStoragePlugin__totalSpaceOfLargeConversations__block_invoke;
  v16[3] = &unk_1E562B3D8;
  v16[4] = buf;
  [v9 enumerateObjectsUsingBlock:v16];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (void *)*((void *)v18 + 3);
      *(_DWORD *)v21 = 134217984;
      int v22 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Done enumerating, total space: %llu", v21, 0xCu);
    }
  }
  unint64_t v14 = *((void *)v18 + 3);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __50__CKStoragePlugin__totalSpaceOfLargeConversations__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  BOOL v7 = [a2 objectForKeyedSubscript:@"size"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v8;
  if (a3 >= 0x14) {
    *a4 = 1;
  }
}

- (int64_t)_totalSpaceOfAttachments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CKStoragePlugin *)self _cloudKitEnabled])
  {
    [(CKStoragePlugin *)self calculateDirectorySizesIfNeeded];
    double v3 = [(CKStoragePlugin *)self messageDirectorySizes];
    [v3 totalAttachmentSize];
    int64_t v5 = v4;

    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL v7 = (void *)MEMORY[0x1E4F28EE0];
        uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v5];
        id v9 = [v7 stringFromHugeNumber:v8];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Reporting attachment size as %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    [(CKStoragePlugin *)self _loadAttachmentSizes];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    unint64_t v10 = [(CKStoragePlugin *)self spaceTakenByAttachmentClass];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__CKStoragePlugin__totalSpaceOfAttachments__block_invoke;
    v12[3] = &unk_1E562B400;
    v12[4] = &buf;
    [v10 enumerateKeysAndObjectsUsingBlock:v12];

    int64_t v5 = *(void *)(*((void *)&buf + 1) + 24);
    _Block_object_dispose(&buf, 8);
  }
  return v5;
}

uint64_t __43__CKStoragePlugin__totalSpaceOfAttachments__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 longLongValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)messageDatabaseSize
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = IMSharedHelperMessagesRootFolderPath();
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      BOOL v7 = v2;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Get file size on path: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  unint64_t v4 = IMLegacyCalculateFileSizeForPath();

  return v4;
}

- (BOOL)_forceShowingReviewLargeAttachmentsTip
{
  return CFPreferencesGetAppBooleanValue(@"ForceShowReviewLargeAttachments", @"com.apple.MobileSMS", 0) != 0;
}

- (BOOL)_shouldDisplayReviewLargeAttachmentsTip
{
  if ([(CKStoragePlugin *)self _forceShowingReviewLargeAttachmentsTip]) {
    return 1;
  }

  return [(CKStoragePlugin *)self _attachmentsTakeUpSignificantSpace];
}

- (id)_reviewLargeAttachmentsTip
{
  if ([(CKStoragePlugin *)self _shouldDisplayReviewLargeAttachmentsTip])
  {
    double v3 = [(CKStoragePlugin *)self cachedReviewLargeAttachmentsTip];

    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FA80C0]);
      int64_t v5 = [(id)objc_opt_class() _representedApp];
      [v4 setRepresentedApp:v5];

      int v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v7 = [v6 localizedStringForKey:@"REVIEW_LARGE_ATTACHMENTS_TITLE" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setTitle:v7];

      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v9 = [v8 localizedStringForKey:@"REVIEW_LARGE_ATTACHMENTS_INFO" value:&stru_1EDE4CA38 table:@"General"];
      [v4 setInfoText:v9];

      objc_msgSend(v4, "setSize:", -[CKStoragePlugin _totalSpaceOfAttachments](self, "_totalSpaceOfAttachments"));
      [v4 setDetailControllerClass:objc_opt_class()];
      [(CKStoragePlugin *)self setCachedReviewLargeAttachmentsTip:v4];
    }
    unint64_t v10 = [(CKStoragePlugin *)self cachedReviewLargeAttachmentsTip];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)_configureCloudTipController
{
  id location = 0;
  objc_initWeak(&location, self);
  id v2 = +[CKCloudTipViewModel sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CKStoragePlugin__configureCloudTipController__block_invoke;
  v8[3] = &unk_1E5629F38;
  objc_copyWeak(&v9, &location);
  [v2 setOnCloudTipChanged:v8];

  double v3 = +[CKCloudTipViewModel sharedInstance];
  [v3 setDisplayContext:1];

  if ([MEMORY[0x1E4F6E790] summarizationModelsAvailable]) {
    int v4 = 1;
  }
  else {
    int v4 = [MEMORY[0x1E4F6E790] generativePlaygroundModelsAvailable];
  }
  if (CFPreferencesGetAppBooleanValue(@"ForceModelCriteriaToShowMiCTip", @"com.apple.MobileSMS", 0)) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  if (v5 == 1)
  {
    int v6 = dispatch_get_global_queue(0, 0);
    dispatch_async(v6, &__block_literal_global_224);
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "This device does NOT have generative models available, so we won't bother doing any further work to detect cloud tip eligibility. No tip.", v7, 2u);
    }
  }

LABEL_13:
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__CKStoragePlugin__configureCloudTipController__block_invoke(uint64_t a1, void *a2)
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__65;
  v9[4] = __Block_byref_object_dispose__65;
  id v10 = 0;
  id v3 = a2;
  id v10 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CKStoragePlugin__configureCloudTipController__block_invoke_180;
  block[3] = &unk_1E562B428;
  BOOL v7 = v9;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  _Block_object_dispose(v9, 8);
}

void __47__CKStoragePlugin__configureCloudTipController__block_invoke_180(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tipType];
      int v8 = 134217984;
      uint64_t v9 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Storage plugin needs to update for tip %ld", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained setCloudTipDescriptor:v4];

  id v7 = objc_loadWeakRetained(v5);
  [v7 reloadTips];
}

void __47__CKStoragePlugin__configureCloudTipController__block_invoke_187()
{
  id v0 = +[CKCloudTipViewModel sharedInstance];
  [v0 configureCloudTipManagerWithCompletionHandler:&__block_literal_global_189_1];
}

void __47__CKStoragePlugin__configureCloudTipController__block_invoke_2()
{
  if (IMOSLoggingEnabled())
  {
    id v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18EF18000, v0, OS_LOG_TYPE_INFO, "Completed cloud tip configuration", v1, 2u);
    }
  }
}

- (unint64_t)_spaceSavedByDeletingNonSyncedAttachments
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(CKStoragePlugin *)self lastQuerySpaceSavedByNonSyncedDeletingAttachments];
  if (v3 == 0.0
    || ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
        double v5 = v4,
        [(CKStoragePlugin *)self lastQuerySpaceSavedByNonSyncedDeletingAttachments], v5 - v6 > 10.0))
  {
    if ([(CKStoragePlugin *)self _cloudKitEnabled])
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = [(CKStoragePlugin *)self messageDirectoryContents];
      int v8 = [v7 messagesDirectoryContents];
      uint64_t v9 = [v8 fileInfoMap];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = 0;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ([v15 isAttachment] && objc_msgSend(v15, "isPurgableOnDisk"))
            {
              [v15 fileSize];
              v12 += v16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }
      else
      {
        uint64_t v12 = 0;
      }

      uint64_t v18 = self;
      uint64_t NonSyncedAttachmentDiskSpace = v12;
    }
    else
    {
      uint64_t NonSyncedAttachmentDiskSpace = IMDAttachmentRecordGetNonSyncedAttachmentDiskSpace();
      uint64_t v18 = self;
    }
    [(CKStoragePlugin *)v18 setCachedSpaceSavedByDeletingNonSyncedAttachments:NonSyncedAttachmentDiskSpace];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[CKStoragePlugin setLastQuerySpaceSavedByNonSyncedDeletingAttachments:](self, "setLastQuerySpaceSavedByNonSyncedDeletingAttachments:");
  }
  return [(CKStoragePlugin *)self cachedSpaceSavedByDeletingNonSyncedAttachments];
}

- (id)_messagesIniCloudTip
{
  double v3 = [(CKStoragePlugin *)self cloudKitHooks];
  if ([v3 isEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Messages in iCloud is already enabled. No need for a tip.", buf, 2u);
      }
    }
    double v5 = 0;
  }
  else
  {
    double v6 = [(CKStoragePlugin *)self cloudTipDescriptor];
    if (v6)
    {
      id v7 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];

      if (v7)
      {
        double v5 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
      }
      else
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4FA80D0]);
        uint64_t v10 = [(id)objc_opt_class() _representedApp];
        [v9 setRepresentedApp:v10];

        uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v12 = [v11 localizedStringForKey:@"MESSAGES_ON_ICLOUD_TIP_TITLE" value:&stru_1EDE4CA38 table:@"General"];
        [v9 setTitle:v12];

        objc_msgSend(v9, "setEventualGain:", -[CKStoragePlugin _spaceSavedByDeletingNonSyncedAttachments](self, "_spaceSavedByDeletingNonSyncedAttachments"));
        [v9 setDelegate:self];
        [v9 setActivationPercent:0.0];
        uint64_t v13 = CKFrameworkBundle();
        uint64_t v14 = [v13 localizedStringForKey:@"SECURELY_STORE_MESSAGES_IN_CASE_YOU_RESTORE_THIS_DEVICE" value:&stru_1EDE4CA38 table:@"ChatKit"];
        [v9 setInfoText:v14];

        uint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v16 = [v15 localizedStringForKey:@"TURN_ON" value:&stru_1EDE4CA38 table:@"General"];
        [v9 setEnableButtonTitle:v16];

        uint64_t v17 = CKFrameworkBundle();
        uint64_t v18 = [v17 localizedStringForKey:@"SECURELY_STORE_MESSAGES_IN_CASE_YOU_RESTORE_THIS_DEVICE" value:&stru_1EDE4CA38 table:@"ChatKit"];
        [v9 setConfirmationText:v18];

        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v20 = [v19 localizedStringForKey:@"TURN_ON" value:&stru_1EDE4CA38 table:@"General"];
        [v9 setConfirmationButtonTitle:v20];

        [(CKStoragePlugin *)self setCachedMessagesIniCloudTip:v9];
        double v5 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v22 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "No prepared CKCloudTipDescriptor from the eligibility checks ==> we are ineligible for this tip and will not show it.", v22, 2u);
        }
      }
      double v5 = 0;
    }
  }

  return v5;
}

- (void)_enableMessagesIniCloud
{
  id v2 = [(CKStoragePlugin *)self cloudKitHooks];
  [v2 setEnabled:1];
}

- (void)_iCloudHooksSetEnabledReturned:(id)a3
{
  id v4 = a3;
  double v5 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];

  if (v5)
  {
    double v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6BAB0]];
    char v8 = [v7 BOOLValue];

    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "MiC enabled successfully; marking tip as activated.",
            v14,
            2u);
        }
      }
      uint64_t v11 = [(CKStoragePlugin *)self cachedMessagesIniCloudTip];
      LODWORD(v12) = 1.0;
      [v11 setActivationPercent:v12];
    }
    else
    {
      if (v9)
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "MiC failed to enable; tip will display error.",
            buf,
            2u);
        }
      }
      [(CKStoragePlugin *)self _displayICloudErrorMessage];
    }
  }
}

- (STStorageOptionTip)cachedAutoDeleteMessagesTip
{
  return self->_cachedAutoDeleteMessagesTip;
}

- (void)setCachedAutoDeleteMessagesTip:(id)a3
{
}

- (unint64_t)cachedSpaceSavedByAutoDeletingMessages
{
  return self->_cachedSpaceSavedByAutoDeletingMessages;
}

- (void)setCachedSpaceSavedByAutoDeletingMessages:(unint64_t)a3
{
  self->_cachedSpaceSavedByAutoDeletingMessages = a3;
}

- (double)lastQuerySpaceSavedByAutoDeletingMessagesTime
{
  return self->_lastQuerySpaceSavedByAutoDeletingMessagesTime;
}

- (void)setLastQuerySpaceSavedByAutoDeletingMessagesTime:(double)a3
{
  self->_lastQuerySpaceSavedByAutoDeletingMessagesTime = a3;
}

- (STStorageActionTip)cachedReviewLargeConversationsTip
{
  return self->_cachedReviewLargeConversationsTip;
}

- (void)setCachedReviewLargeConversationsTip:(id)a3
{
}

- (unint64_t)cachedSpaceSavedByReviewingLargeConversations
{
  return self->_cachedSpaceSavedByReviewingLargeConversations;
}

- (void)setCachedSpaceSavedByReviewingLargeConversations:(unint64_t)a3
{
  self->_cachedSpaceSavedByReviewingLargeConversations = a3;
}

- (double)lastQuerySpaceSavedByReviewingLargeConversationsTime
{
  return self->_lastQuerySpaceSavedByReviewingLargeConversationsTime;
}

- (void)setLastQuerySpaceSavedByReviewingLargeConversationsTime:(double)a3
{
  self->_lastQuerySpaceSavedByReviewingLargeConversationsTime = a3;
}

- (STStorageActionTip)cachedReviewLargeAttachmentsTip
{
  return self->_cachedReviewLargeAttachmentsTip;
}

- (void)setCachedReviewLargeAttachmentsTip:(id)a3
{
}

- (BOOL)cachedAttachmentsTakeUpSignificantSpace
{
  return self->_cachedAttachmentsTakeUpSignificantSpace;
}

- (void)setCachedAttachmentsTakeUpSignificantSpace:(BOOL)a3
{
  self->_cachedAttachmentsTakeUpSignificantSpace = a3;
}

- (NSDate)cachedAttachmentsTakeUpSignificantSpaceDate
{
  return self->_cachedAttachmentsTakeUpSignificantSpaceDate;
}

- (void)setCachedAttachmentsTakeUpSignificantSpaceDate:(id)a3
{
}

- (STStorageOptionTip)cachedMessagesIniCloudTip
{
  return self->_cachedMessagesIniCloudTip;
}

- (void)setCachedMessagesIniCloudTip:(id)a3
{
}

- (_TtC7ChatKit20CKCloudTipDescriptor)cloudTipDescriptor
{
  return self->_cloudTipDescriptor;
}

- (void)setCloudTipDescriptor:(id)a3
{
}

- (unint64_t)cachedSpaceSavedByDeletingNonSyncedAttachments
{
  return self->_cachedSpaceSavedByDeletingNonSyncedAttachments;
}

- (void)setCachedSpaceSavedByDeletingNonSyncedAttachments:(unint64_t)a3
{
  self->_cachedSpaceSavedByDeletingNonSyncedAttachments = a3;
}

- (double)lastQuerySpaceSavedByNonSyncedDeletingAttachments
{
  return self->_lastQuerySpaceSavedByNonSyncedDeletingAttachments;
}

- (void)setLastQuerySpaceSavedByNonSyncedDeletingAttachments:(double)a3
{
  self->_lastQuerySpaceSavedByNonSyncedDeletingAttachments = a3;
}

- (NSArray)appSpecifiers
{
  return self->_appSpecifiers;
}

- (void)setAppSpecifiers:(id)a3
{
}

- (NSArray)cloudAppSpecifiers
{
  return self->_cloudAppSpecifiers;
}

- (void)setCloudAppSpecifiers:(id)a3
{
}

- (NSDictionary)spaceTakenByAttachmentClass
{
  return self->_spaceTakenByAttachmentClass;
}

- (void)setSpaceTakenByAttachmentClass:(id)a3
{
}

- (void)setCloudKitHooks:(id)a3
{
}

- (IMMessageDirectoryContents)messageDirectoryContents
{
  return self->_messageDirectoryContents;
}

- (IMDirectoryContentsSizes)messageDirectorySizes
{
  return self->_messageDirectorySizes;
}

- (PSSpecifier)initialAppSpecifier
{
  return self->_initialAppSpecifier;
}

- (OS_dispatch_queue)privateWorkQueue
{
  return self->_privateWorkQueue;
}

- (void)setPrivateWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateWorkQueue, 0);
  objc_storeStrong((id *)&self->_initialAppSpecifier, 0);
  objc_storeStrong((id *)&self->_messageDirectorySizes, 0);
  objc_storeStrong((id *)&self->_messageDirectoryContents, 0);
  objc_storeStrong((id *)&self->_cloudKitHooks, 0);
  objc_storeStrong((id *)&self->_spaceTakenByAttachmentClass, 0);
  objc_storeStrong((id *)&self->_cloudAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_cloudTipDescriptor, 0);
  objc_storeStrong((id *)&self->_cachedMessagesIniCloudTip, 0);
  objc_storeStrong((id *)&self->_cachedAttachmentsTakeUpSignificantSpaceDate, 0);
  objc_storeStrong((id *)&self->_cachedReviewLargeAttachmentsTip, 0);
  objc_storeStrong((id *)&self->_cachedReviewLargeConversationsTip, 0);

  objc_storeStrong((id *)&self->_cachedAutoDeleteMessagesTip, 0);
}

@end