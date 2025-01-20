@interface IMDCoreSpotlightManager
+ (Class)__SLCollaborationHandshakeController;
+ (id)chatAutoDonatingCutomKey;
+ (id)chatAutoDonatingServerDateCustomKey;
+ (id)chatStyleCustomKey;
+ (id)handleToIdentityMapKey;
+ (id)localIdentityKey;
+ (id)localIdentityProofKey;
+ (id)resolvedURLCustomKey;
+ (id)sharedInstance;
+ (id)threadIdentifierCustomKey;
- (BOOL)_shouldBypassForTesting;
- (BOOL)_shouldDonateNextBatchForBatchSize:(unint64_t)a3;
- (BOOL)_shouldIndexNextBatchForBatchSize:(unint64_t)a3;
- (BOOL)_shouldSkipMessagePartPrefixingForItemDictionary:(id)a3;
- (IMDCoreSpotlightManager)init;
- (NSMutableOrderedSet)blocklistMessageGUIDs;
- (id)_chatDictionaryForChatAtIndex:(unint64_t)a3 withChats:(id)a4;
- (id)_chatDictionaryForChatGUID:(id)a3;
- (id)_copyCDInteractionsForMessagesWithLastRowID:(unint64_t *)a3 batchSize:(unint64_t)a4 timingCollection:(id)a5 hadResults:(BOOL *)a6;
- (id)_copyNewSearchableIndexesForMessagesWithLastRowID:(unint64_t *)a3 messageRecordCount:(unint64_t *)a4 messagesWithItemsGeneratedCount:(unint64_t *)a5 batchSize:(unint64_t)a6 timingCollection:(id)a7 rejectedItems:(id)a8;
- (id)_donationManager;
- (id)_newSearchableChatItemsForChats:(id)a3;
- (id)_personIdentityQueue;
- (id)_scrutinyMessagesQueue;
- (id)backpressureController;
- (id)newCDContactForURI:(id)a3;
- (id)newCDInteractionForChatDictionary:(id)a3 messageDictionary:(id)a4;
- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4;
- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4 error:(id *)a5;
- (id)newSearchableItemsForMessage:(id)a3 reindexing:(BOOL)a4 rejectedItems:(id)a5;
- (id)newSearchableItemsForMessageGUID:(id)a3 reindexing:(BOOL)a4 rejectedItems:(id)a5;
- (id)newSearchableItemsForMessageItemDictionary:(id)a3 chatDictionary:(id)a4 reindexing:(BOOL)a5 rejectedItems:(id)a6;
- (id)searchableIndex;
- (int64_t)_batchBackpressuredDonationCount;
- (int64_t)_chatCountForChats:(id)a3;
- (int64_t)_maxBackpressureSize;
- (int64_t)totalMessages;
- (unint64_t)_batchSizeForTargetBatchSize:(unint64_t)a3 lastIndexedRowID:(unint64_t)a4 lastBatch:(BOOL *)a5;
- (unint64_t)_lastDonatedRowID;
- (void)_FPProviderIDForItems:(id)a3;
- (void)_donateInteractions:(id)a3;
- (void)_enumerateSearchableChatItemsForAllChatsWithBlock:(id)a3 timingCollection:(id)a4;
- (void)_indexSearchableChatItems:(id)a3 withReason:(int64_t)a4 index:(id)a5 blocking:(BOOL)a6;
- (void)_indexSearchableItems:(id)a3 rejectedItems:(id)a4 clientState:(id)a5 lastIndexedRowID:(unint64_t)a6 messagesInBatch:(unint64_t)a7 messagesWithItemsGeneratedCount:(unint64_t)a8 batchSize:(unint64_t)a9 lastBatch:(BOOL)a10 withIndex:(id)a11 reason:(int64_t)a12;
- (void)_postProcessIndexingForItem:(id)a3 chatDictionary:(id)a4 isReindexing:(BOOL)a5;
- (void)_resolvedURLForItems:(id)a3;
- (void)_sanitizeIndexesForCurrentVersionIfNeeded:(id)a3;
- (void)_setLastDonatedRowID:(unint64_t)a3;
- (void)_setNeedsDeferredIndexing:(BOOL)a3;
- (void)_setNeedsDonation:(BOOL)a3;
- (void)_setNeedsIndexing:(BOOL)a3;
- (void)_suspendReindexingDueToError:(id)a3;
- (void)_updateFilteringForSearchableItem:(id)a3 chatDictionary:(id)a4;
- (void)_updateItem:(id)a3 withFPProviderID:(id)a4;
- (void)_updateItem:(id)a3 withIdentityMap:(id)a4 localIdentity:(id)a5 localIdentityProof:(id)a6;
- (void)_updateItem:(id)a3 withResolvedURL:(id)a4;
- (void)addChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4;
- (void)clearMessageGUIDFromScrutiny:(id)a3;
- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3;
- (void)deleteAllInteractionsForAppDeletionWithCompletion:(id)a3;
- (void)deleteAllSearchableItemsWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)deleteChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4;
- (void)donateChatDictionary:(id)a3 withMessageDictionary:(id)a4;
- (void)donateNextMessageBatchIfNeeded:(unint64_t)a3 completion:(id)a4;
- (void)indexChatsWithReason:(int64_t)a3;
- (void)indexNextMessageBatchIfNeeded:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)reIndexWithLocalProofOfInclusionForItemsAsync:(id)a3;
- (void)setBlocklistMessageGUIDs:(id)a3;
- (void)setMessageGUIDUnderScrutiny:(id)a3;
- (void)setNeedsDonateAllMessagesWithReason:(int64_t)a3 completion:(id)a4;
- (void)setNeedsMessageReindexingWithReason:(int64_t)a3 completion:(id)a4;
@end

@implementation IMDCoreSpotlightManager

- (id)backpressureController
{
  backpressureController = self->_backpressureController;
  if (!backpressureController)
  {
    v4 = [[IMBackpressuredDonationController alloc] initWithDonationCount:[(IMDCoreSpotlightManager *)self _batchBackpressuredDonationCount] maxBackpressureSize:[(IMDCoreSpotlightManager *)self _maxBackpressureSize] donationBlock:&unk_1F084CDC0];
    v5 = self->_backpressureController;
    self->_backpressureController = v4;

    backpressureController = self->_backpressureController;
  }
  return backpressureController;
}

- (int64_t)_batchBackpressuredDonationCount
{
  return MEMORY[0x1F41237A0](@"com.apple.IMCoreSpotlight", @"DuetBackpressureDonationCount", 50);
}

- (int64_t)_maxBackpressureSize
{
  return MEMORY[0x1F41237A0](@"com.apple.IMCoreSpotlight", @"DuetBackpressureMaxSize", 512);
}

- (void)_donateInteractions:(id)a3
{
  id v4 = a3;
  sub_1AFBD526C();
  id v5 = [(IMDCoreSpotlightManager *)self backpressureController];
  [v5 donateItems:v4];
}

- (void)donateChatDictionary:(id)a3 withMessageDictionary:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1B3E8A120]();
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Donate a Chat with a Message to Interaction Store", v14, 2u);
    }
  }
  v10 = +[IMDCoreSpotlightManager sharedInstance];
  v11 = (void *)[v10 newCDInteractionForChatDictionary:v6 messageDictionary:v7];

  if (v11)
  {
    v15[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(IMDCoreSpotlightManager *)self _donateInteractions:v12];
  }
  else if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Cannot create a CDInteraction with the chat and message record", v14, 2u);
    }
  }
}

- (id)newCDInteractionForChatDictionary:(id)a3 messageDictionary:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v9 = [v8 isUnderFirstDataProtectionLock];

  if (!v9)
  {
    IMDPersistenceCheckNotDatabaseThread();
    v12 = [v7 objectForKey:@"guid"];
    v43 = [v6 objectForKey:@"guid"];
    int v13 = [v6 BOOLValueForKey:@"isBlackholed" withDefault:0];
    v14 = [(IMDCoreSpotlightManager *)self blocklistMessageGUIDs];
    int v15 = [v14 containsObject:v12] | v13;

    if (v15 == 1)
    {
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation - Skipping donation %@, denylisted", (uint8_t *)&buf, 0xCu);
        }
LABEL_16:
      }
    }
    else
    {
      if (!+[IMDCoreSpotlightMessageMetadataIndexer cancelIndexingForItem:v7])
      {
        v17 = [v7 objectForKey:@"flags"];
        unint64_t v40 = [v17 unsignedLongLongValue] & 4;

        v18 = [v6 objectForKey:@"lalh"];
        v41 = [v18 _stripFZIDPrefix];

        if (v40)
        {
          id v21 = v41;
        }
        else
        {
          v19 = [v7 objectForKey:@"handle"];
          uint64_t v20 = [v19 _stripFZIDPrefix];

          id v21 = (id)v20;
        }
        v39 = v21;
        id v42 = -[IMDCoreSpotlightManager newCDContactForURI:](self, "newCDContactForURI:");
        v22 = [v6 objectForKey:@"participants"];
        v23 = [MEMORY[0x1E4F1CA48] array];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v52 != v26) {
                objc_enumerationMutation(v24);
              }
              id v28 = [(IMDCoreSpotlightManager *)self newCDContactForURI:*(void *)(*((void *)&v51 + 1) + 8 * i)];
              if (v28) {
                [v23 addObject:v28];
              }
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v25);
        }

        v29 = [v6 objectForKey:@"groupName"];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v60 = 0x3032000000;
        v61 = sub_1AFBB7428;
        v62 = sub_1AFBB7438;
        id v63 = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x3032000000;
        v49[3] = sub_1AFBB7428;
        v49[4] = sub_1AFBB7438;
        id v50 = 0;
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = sub_1AFBB7440;
        v44[3] = &unk_1E5F954F0;
        id v30 = v6;
        id v45 = v30;
        v47 = v49;
        id v31 = v43;
        id v46 = v31;
        p_long long buf = &buf;
        IMDPersistencePerformBlock(v44, 1);
        [(IMDCoreSpotlightManager *)self _postProcessIndexingForItem:v7 chatDictionary:v30 isReindexing:0];
        uint64_t v55 = 0;
        v56 = &v55;
        uint64_t v57 = 0x2050000000;
        v32 = (void *)qword_1E9AF8188;
        uint64_t v58 = qword_1E9AF8188;
        if (!qword_1E9AF8188)
        {
          *(void *)&long long v65 = MEMORY[0x1E4F143A8];
          *((void *)&v65 + 1) = 3221225472;
          v66 = sub_1AFBB86F4;
          v67 = &unk_1E5F8EB38;
          v68 = &v55;
          sub_1AFBB86F4((uint64_t)&v65);
          v32 = (void *)v56[3];
        }
        v33 = v32;
        _Block_object_dispose(&v55, 8);
        id v34 = objc_alloc_init(v33);
        [v34 setBundleId:@"com.apple.MobileSMS"];
        [v34 setMechanism:4];
        v35 = [MEMORY[0x1E4F1C9C8] date];
        [v34 setStartDate:v35];

        v36 = [v34 startDate];
        [v34 setEndDate:v36];

        [v34 setDirection:v40 >> 2];
        [v34 setDomainIdentifier:v31];
        [v34 setUuid:v12];
        [v34 setSender:v42];
        [v34 setRecipients:v23];
        if ([v29 length]) {
          [v34 setGroupName:v29];
        }
        [v34 setContentURL:*(void *)(*((void *)&buf + 1) + 40)];
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            LODWORD(v65) = 138412290;
            *(void *)((char *)&v65 + 4) = v12;
            _os_log_impl(&dword_1AFB53000, v37, OS_LOG_TYPE_INFO, "Created interaction for message %@", (uint8_t *)&v65, 0xCu);
          }
        }
        id v11 = v34;

        _Block_object_dispose(v49, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_39;
      }
      if (IMOSLoggingEnabled())
      {
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v12;
          _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation - Skipping donation %@, bailed out", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_16;
      }
    }
    id v11 = 0;
LABEL_39:

    goto LABEL_40;
  }
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, " => Before first unlock, skipping donation", (uint8_t *)&buf, 2u);
    }
  }
  id v11 = 0;
LABEL_40:

  return v11;
}

- (id)newCDContactForURI:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = _IMDCoreSpotlightCNContactForAddress(v3);
    _IMDCoreSpotlightFullNameForContact(v5, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      id v6 = v4;
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v7 = (void *)qword_1E9AF8190;
    uint64_t v20 = qword_1E9AF8190;
    if (!qword_1E9AF8190)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_1AFBB874C;
      v16[3] = &unk_1E5F8EB38;
      v16[4] = &v17;
      sub_1AFBB874C((uint64_t)v16);
      id v7 = (void *)v18[3];
    }
    v8 = v7;
    _Block_object_dispose(&v17, 8);
    id v9 = [v8 alloc];
    if ([v4 _appearsToBeEmail]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    id v11 = [v5 identifier];
    if (v5) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 0;
    }
    int v13 = (void *)[v9 initWithIdentifier:v4 type:v10 displayName:v6 personId:v11 personIdType:v12];
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
    int v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (void)donateNextMessageBatchIfNeeded:(unint64_t)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&buf[4] = a3;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Donating next batch of messages. Batch size of %lu", buf, 0xCu);
    }
  }
  if ([(IMDCoreSpotlightManager *)self _shouldDonateNextBatchForBatchSize:a3])
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    unint64_t v30 = 0;
    unint64_t v30 = [(IMDCoreSpotlightManager *)self _lastDonatedRowID];
    char v26 = 0;
    unint64_t v8 = [(IMDCoreSpotlightManager *)self _batchSizeForTargetBatchSize:a3 lastIndexedRowID:*(void *)(*(void *)&buf[8] + 24) lastBatch:&v26];
    id v9 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v9 startTimingForKey:@"totalTime"];
    char v25 = 0;
    id v10 = [(IMDCoreSpotlightManager *)self _copyCDInteractionsForMessagesWithLastRowID:*(void *)&buf[8] + 24 batchSize:v8 timingCollection:v9 hadResults:&v25];
    if ([v10 count])
    {
      [v9 startTimingForKey:@"DonationRecording"];
      id v11 = [sub_1AFBB67B4() interactionRecorder];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1AFBB7C3C;
      v20[3] = &unk_1E5F95518;
      v22 = buf;
      unint64_t v23 = v8;
      char v24 = v26;
      v20[4] = self;
      id v21 = v6;
      [v11 recordInteractions:v10 completionHandler:v20];
      [v9 stopTimingForKey:@"DonationRecording"];
    }
    else
    {
      if (v25)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v27 = 136315138;
            id v28 = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
            _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation: %s - Generated no interaction items :(", v27, 0xCu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v27 = 136315138;
            id v28 = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
            _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation %s - Got no records from IMDMessageRecordCopyMessagesFromRowIDDescLimit. Stopping donation", v27, 0xCu);
          }
        }
        [(IMDCoreSpotlightManager *)self _setNeedsDonation:0];
        [(IMDCoreSpotlightManager *)self _setLastDonatedRowID:1];
      }
      if (v6) {
        v6[2](v6);
      }
    }
    [v9 stopTimingForKey:@"totalTime"];
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v27 = 138412290;
        id v28 = (const char *)v9;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Timing %@", v27, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = [MEMORY[0x1E4F6E700] needsDonation];
        int v14 = IMDSystemMigrationOccurred();
        int v15 = @"NO";
        *(void *)&buf[4] = "-[IMDCoreSpotlightManager(CoreDuetDonation) donateNextMessageBatchIfNeeded:completion:]";
        *(_WORD *)&buf[12] = 2048;
        if (v13) {
          v16 = @"YES";
        }
        else {
          v16 = @"NO";
        }
        *(_DWORD *)long long buf = 136315906;
        *(void *)&buf[14] = a3;
        *(_WORD *)&buf[22] = 2112;
        if (v14) {
          int v15 = @"YES";
        }
        unint64_t v30 = (unint64_t)v16;
        __int16 v31 = 2112;
        v32 = v15;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation %s - Not donate. Batch size %lu needsDonation %@ hasMigrated %@", buf, 0x2Au);
      }
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

- (id)_copyCDInteractionsForMessagesWithLastRowID:(unint64_t *)a3 batchSize:(unint64_t)a4 timingCollection:(id)a5 hadResults:(BOOL *)a6
{
  id v10 = a5;
  v15[0] = 0;
  v15[1] = v15;
  void v15[2] = 0x2020000000;
  char v16 = 0;
  v13[5] = v15;
  uint64_t v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFBB7F74;
  v13[3] = &unk_1E5F95540;
  v13[4] = self;
  id v11 = IMDDeriveObjectsForMessagesWithLastRowIDAndBatchSizeUsingBlock(a3, &v14, a4, v10, v13);
  if (a6) {
    *a6 = v14 != 0;
  }
  _Block_object_dispose(v15, 8);

  return v11;
}

- (BOOL)_shouldDonateNextBatchForBatchSize:(unint64_t)a3
{
  if (!a3 || ![MEMORY[0x1E4F6E700] needsDonation]) {
    return 0;
  }
  return IMDSystemMigrationOccurred();
}

- (unint64_t)_lastDonatedRowID
{
  return MEMORY[0x1F4181798](MEMORY[0x1E4F6E700], sel_lastDonatedRowID);
}

- (void)_setNeedsDonation:(BOOL)a3
{
}

- (void)_setLastDonatedRowID:(unint64_t)a3
{
}

- (void)setNeedsDonateAllMessagesWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      char v16 = "-[IMDCoreSpotlightManager(CoreDuetDonation) setNeedsDonateAllMessagesWithReason:completion:]";
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "%s starting batch donation", buf, 0xCu);
    }
  }
  uint64_t v8 = [(IMDCoreSpotlightManager *)self maxRowID];
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      char v16 = "-[IMDCoreSpotlightManager(CoreDuetDonation) setNeedsDonateAllMessagesWithReason:completion:]";
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "%s max cmj rowID %lld", buf, 0x16u);
    }
  }
  if (v8 <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "IMDCoreDuetDonation: Failed to get max cmj row ID for indexing!", buf, 2u);
      }
    }
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBB8318;
    v11[3] = &unk_1E5F95568;
    v11[4] = self;
    uint64_t v13 = v8;
    int64_t v14 = a3;
    uint64_t v12 = v6;
    sub_1AFBD5444(v11);
  }
}

- (void)deleteAllInteractionsForAppDeletionWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(id, id))a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Deleting all interactions because the app is being uninstalled.", buf, 2u);
    }
  }
  id v5 = [sub_1AFBB67B4() interactionRecorder];
  id v8 = 0;
  [v5 deleteInteractionsWithBundleId:@"com.apple.MobileSMS" error:&v8];
  id v6 = v8;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v10 = @"com.apple.MobileSMS";
        __int16 v11 = 2112;
        id v12 = v6;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Failed to delete all interactions for bundle %@ with error %@", buf, 0x16u);
      }
    }
    if (v3) {
      v3[2](v3, v6);
    }
  }
}

+ (id)sharedInstance
{
  if (qword_1EB5ABC08 != -1) {
    dispatch_once(&qword_1EB5ABC08, &unk_1F084C688);
  }
  v2 = (void *)qword_1EB5ABCF0;
  return v2;
}

- (IMDCoreSpotlightManager)init
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)IMDCoreSpotlightManager;
  v2 = [(IMDCoreSpotlightManager *)&v11 init];
  if (v2)
  {
    id v3 = IMGetCachedDomainValueForKey();
    unint64_t v4 = [v3 count];
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        unint64_t v13 = v4;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Current blocklist size is %lu", buf, 0xCu);
      }
    }
    if (v4 >= 0xC9)
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v13) = 200;
          _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Blocklist size > %d on load, truncating", buf, 8u);
        }
      }
      uint64_t v7 = objc_msgSend(v3, "subarrayWithRange:", v4 - 200, 200);

      id v3 = (void *)v7;
    }
    if (v3) {
      id v8 = (NSMutableOrderedSet *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v3];
    }
    else {
      id v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    }
    blocklistMessageGUIDs = v2->_blocklistMessageGUIDs;
    v2->_blocklistMessageGUIDs = v8;
  }
  return v2;
}

- (int64_t)totalMessages
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = +[IMDDatabase synchronousDatabase];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFBDA704;
  v5[3] = &unk_1E5F96448;
  v5[4] = &v6;
  [v2 fetchCountOfRecordType:0 completionHandler:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)searchableIndex
{
  if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
  {
    v2 = 0;
  }
  else
  {
    v2 = IMCoreSpotlightIndex();
  }
  return v2;
}

- (id)_personIdentityQueue
{
  if (qword_1E9AF8200 != -1) {
    dispatch_once(&qword_1E9AF8200, &unk_1F084D4F8);
  }
  v2 = (void *)qword_1E9AF81F8;
  return v2;
}

- (id)_scrutinyMessagesQueue
{
  if (qword_1EB5ABA98 != -1) {
    dispatch_once(&qword_1EB5ABA98, &unk_1F084C120);
  }
  v2 = (void *)qword_1EB5ABAA0;
  return v2;
}

+ (Class)__SLCollaborationHandshakeController
{
  if (qword_1E9AF8210 != -1) {
    dispatch_once(&qword_1E9AF8210, &unk_1F084BF20);
  }
  v2 = (void *)qword_1E9AF8208;
  return (Class)v2;
}

- (NSMutableOrderedSet)blocklistMessageGUIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1AFBD5D3C;
  objc_super v11 = sub_1AFBD5D4C;
  id v12 = 0;
  int64_t v3 = [(IMDCoreSpotlightManager *)self _scrutinyMessagesQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFBDAA80;
  v6[3] = &unk_1E5F96470;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableOrderedSet *)v4;
}

- (void)setMessageGUIDUnderScrutiny:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMDCoreSpotlightManager *)self _scrutinyMessagesQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFBDAB84;
    v14[3] = &unk_1E5F8D508;
    v14[4] = self;
    id v15 = v4;
    dispatch_barrier_sync(v5, v14);
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B234(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)clearMessageGUIDFromScrutiny:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(IMDCoreSpotlightManager *)self _scrutinyMessagesQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFBDACE8;
    v14[3] = &unk_1E5F8D508;
    v14[4] = self;
    id v15 = v4;
    dispatch_barrier_sync(v5, v14);
  }
  else
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B2AC(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (id)newSearchableItemsForMessageGUID:(id)a3 reindexing:(BOOL)a4 rejectedItems:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = sub_1AFBD5D3C;
  char v24 = sub_1AFBD5D4C;
  id v25 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  char v16 = sub_1AFBDAFA4;
  __int16 v17 = &unk_1E5F96470;
  uint64_t v19 = &v20;
  id v10 = v8;
  id v18 = v10;
  IMDPersistencePerformBlock(&v14, 1);
  uint64_t v11 = v21[5];
  if (v11) {
    id v12 = -[IMDCoreSpotlightManager newSearchableItemsForMessage:reindexing:rejectedItems:](self, "newSearchableItemsForMessage:reindexing:rejectedItems:", v11, v6, v9, v14, v15, v16, v17);
  }
  else {
    id v12 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v12;
}

- (id)newSearchableItemsForMessage:(id)a3 reindexing:(BOOL)a4 rejectedItems:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = sub_1AFBD5D3C;
  v27 = sub_1AFBD5D4C;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1AFBD5D3C;
  id v21 = sub_1AFBD5D4C;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFBDB194;
  v13[3] = &unk_1E5F96498;
  uint64_t v15 = &v23;
  id v10 = v8;
  id v14 = v10;
  char v16 = &v17;
  IMDPersistencePerformBlock(v13, 1);
  id v11 = [(IMDCoreSpotlightManager *)self newSearchableItemsForMessageItemDictionary:v24[5] chatDictionary:v18[5] reindexing:v6 rejectedItems:v9];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)newSearchableItemsForMessageItemDictionary:(id)a3 chatDictionary:(id)a4 reindexing:(BOOL)a5 rejectedItems:(id)a6
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v117 = a3;
  id v120 = a4;
  id v116 = a6;
  if ((sub_1AFBD56A0() & 1) == 0)
  {
    IMDPersistenceCheckNotDatabaseThread();
    id v10 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    int v11 = [v10 isUnderFirstDataProtectionLock];

    if (v11)
    {
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, " => Before first unlock, skipping indexing", buf, 2u);
        }
      }
      goto LABEL_2;
    }
    v111 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    v108 = [v117 objectForKey:@"guid"];
    v112 = [v120 objectForKey:@"guid"];
    if (![v112 length] || !objc_msgSend(v108, "length"))
    {
      uint64_t v17 = IMLogHandleForCategory();
      id v18 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        sub_1AFC6B324(v117, v120, v17);
        id v18 = v17;
      }
      goto LABEL_118;
    }
    uint64_t v13 = IMDSpotlightPriorityIndexerClasses();
    v107 = [v120 objectForKey:@"groupName"];
    int v14 = [v120 BOOLValueForKey:@"isBlackholed" withDefault:0];
    uint64_t v15 = [v120 integerValueForKey:@"isFiltered" withDefault:0];
    char v16 = [(IMDCoreSpotlightManager *)self blocklistMessageGUIDs];
    if (([v16 containsObject:v108] | v14))
    {

LABEL_15:
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = @"NO";
          if (v14) {
            uint64_t v20 = @"YES";
          }
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v108;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "IMDCoreSpotlight - Skipping indexing %@, denylisted - isBlackholed: %@", buf, 0x16u);
        }
      }
      id v9 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_119;
    }

    if (v15 == 2) {
      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v108;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Indexing placing %@ under scrutiny", buf, 0xCu);
      }
    }
    [(IMDCoreSpotlightManager *)self setMessageGUIDUnderScrutiny:v108];
    id v22 = objc_alloc(MEMORY[0x1E4F23850]);
    uint64_t v23 = (void *)[v22 initWithItemContentType:*MEMORY[0x1E4F22658]];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v172 = 0;
    uint64_t v161 = 0;
    v162 = &v161;
    uint64_t v163 = 0x2020000000;
    char v164 = 0;
    uint64_t v25 = objc_alloc_init(IMDSpotlightIndexerTimingProfiler);
    -[IMDSpotlightIndexerTimingProfiler startMainTimerWithExpectedTimeoutInterval:](v25, "startMainTimerWithExpectedTimeoutInterval:", (double)[MEMORY[0x1E4F6E700] spotlightTimeoutSeconds]);
    if (qword_1E9AF8220 != -1) {
      dispatch_once(&qword_1E9AF8220, &unk_1F084D518);
    }
    uint64_t v157 = 0;
    v158 = &v157;
    uint64_t v159 = 0x2020000000;
    char v160 = 0;
    char v26 = dispatch_group_create();
    dispatch_group_enter(v26);
    v27 = qword_1E9AF8218;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1AFBDC6C0;
    block[3] = &unk_1E5F964C0;
    id v100 = v13;
    id v143 = v100;
    v102 = v25;
    v144 = v102;
    v153 = &v157;
    id v28 = v117;
    id v145 = v28;
    id v106 = v23;
    id v146 = v106;
    id v118 = v120;
    id v147 = v118;
    BOOL v156 = a5;
    id v148 = v116;
    id v104 = v24;
    id v149 = v104;
    v150 = self;
    v154 = buf;
    v155 = &v161;
    id v123 = v108;
    id v151 = v123;
    dispatch_group_t group = v26;
    dispatch_group_t v152 = group;
    dispatch_async(v27, block);
    dispatch_time_t v29 = dispatch_time(0, 1000000000 * [MEMORY[0x1E4F6E700] spotlightTimeoutSeconds]);
    if (dispatch_group_wait(group, v29))
    {
      [(IMDSpotlightIndexerTimingProfiler *)v102 stopMainTimerAndLogAfterFailure];
      if ([MEMORY[0x1E4F6E700] exitOnIndexingTimeout])
      {
        v98 = IMLogHandleForCategory();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6B3EC();
        }

        exit(1);
      }
      unint64_t v30 = IMLogHandleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6B454();
      }
    }
    if (!*((unsigned char *)v158 + 24)) {
      [(IMDSpotlightIndexerTimingProfiler *)v102 stopMainTimerAndLogAfterSuccess];
    }
    if (*((unsigned char *)v162 + 24))
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_44;
      }
      __int16 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v167 = 138412290;
        *(void *)v168 = v123;
        _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "Indexing NOT removing %@ from scrutiny, exception was thrown", v167, 0xCu);
      }
    }
    else
    {
      [(IMDCoreSpotlightManager *)self clearMessageGUIDFromScrutiny:v123];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_44;
      }
      __int16 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v167 = 138412290;
        *(void *)v168 = v123;
        _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "Indexing removing %@ from scrutiny", v167, 0xCu);
      }
    }

LABEL_44:
    v105 = [v28 objectForKey:@"threadOriginatorFormattedGUID"];
    if (!*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v114 = [v28 objectForKey:@"attributedBody"];
      v121 = [v28 objectForKey:@"time"];
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F6E830]) initWithMessageBody:v114 messageGUID:v123];
      v109 = v36;
      if (-[IMDCoreSpotlightManager _shouldSkipMessagePartPrefixingForItemDictionary:](self, "_shouldSkipMessagePartPrefixingForItemDictionary:", v28)|| ([v36 messageParts], v37 = objc_claimAutoreleasedReturnValue(), BOOL v38 = (unint64_t)objc_msgSend(v37, "count") > 1, v37, !v38))
      {
        uint64_t v55 = [v36 messageBody];
        v56 = [v55 string];
        [v106 associateMessageEntityWithIdentifier:v123 displayTitle:v56 displaySubtitle:v107 date:v121];

        uint64_t v57 = v105;
        if (!v105) {
          uint64_t v57 = v123;
        }
        id v58 = v57;
        v59 = [(id)objc_opt_class() threadIdentifierCustomKey];
        [v106 setValue:v58 forCustomKey:v59];

        id v34 = [objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v123 domainIdentifier:v112 attributeSet:v106];
        uint64_t v60 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v34 setExpirationDate:v60];

        if (v34
          && (-[IMDCoreSpotlightManager _updateFilteringForSearchableItem:chatDictionary:](self, "_updateFilteringForSearchableItem:chatDictionary:", v34, v118), [v111 addObject:v34], !a5)&& (id v101 = -[IMDCoreSpotlightManager newChatSearchableItemForChatDictionary:optionalLastMessageDate:](self, "newChatSearchableItemForChatDictionary:optionalLastMessageDate:", v118, v121)) != 0)
        {
          objc_msgSend(v111, "addObject:");
        }
        else
        {
          id v101 = 0;
        }

        goto LABEL_75;
      }
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      v39 = [v36 messageParts];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v138 objects:v170 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v139;
        uint64_t v42 = *MEMORY[0x1E4F6C110];
        uint64_t v125 = *MEMORY[0x1E4F6C130];
        obuint64_t j = v39;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v139 != v41) {
              objc_enumerationMutation(obj);
            }
            v44 = *(void **)(*((void *)&v138 + 1) + 8 * i);
            id v45 = [v44 messagePartBody];
            id v46 = [v45 string];

            if (([v46 isEqualToString:v42] & 1) == 0
              && ([v46 isEqualToString:v125] & 1) == 0)
            {
              v47 = (void *)[v106 copy];
              v48 = [v44 messagePartGUIDForMessageGUID:v123];
              v49 = [v48 encodedMessagePartGUID];

              [v47 associateMessageEntityWithIdentifier:v49 displayTitle:v46 displaySubtitle:v107 date:v121];
              [v47 setTextContent:v46];
              id v50 = v105;
              if (!v105) {
                id v50 = v49;
              }
              id v51 = v50;
              long long v52 = [(id)objc_opt_class() threadIdentifierCustomKey];
              [v47 setValue:v51 forCustomKey:v52];

              long long v53 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v49 domainIdentifier:v112 attributeSet:v47];
              long long v54 = [MEMORY[0x1E4F1C9C8] distantFuture];
              [v53 setExpirationDate:v54];

              if (v53)
              {
                [(IMDCoreSpotlightManager *)self _updateFilteringForSearchableItem:v53 chatDictionary:v118];
                [v111 addObject:v53];
              }
            }
          }
          v39 = obj;
          uint64_t v40 = [obj countByEnumeratingWithState:&v138 objects:v170 count:16];
        }
        while (v40);
      }
    }
    if ([v104 count])
    {
      v32 = v105;
      if (!v105) {
        v32 = v123;
      }
      id v113 = v32;
      uint64_t v33 = [(id)objc_opt_class() threadIdentifierCustomKey];
      [v106 setValue:v113 forCustomKey:v33];

      [v106 setDisableSearchInSpotlight:MEMORY[0x1E4F1CC38]];
      id v34 = [objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v123 domainIdentifier:v112 attributeSet:v106];
      v35 = [MEMORY[0x1E4F1C9C8] distantFuture];
      [v34 setExpirationDate:v35];

      [(IMDCoreSpotlightManager *)self _updateFilteringForSearchableItem:v34 chatDictionary:v118];
      [v111 addObject:v34];
      id v101 = 0;
    }
    else
    {
      id v101 = 0;
      id v34 = 0;
    }
LABEL_75:
    if ([v104 count]) {
      [v111 addObjectsFromArray:v104];
    }
    id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v99 = v34;
    if ([v111 count])
    {
      id v119 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v136 = 0u;
      long long v137 = 0u;
      long long v134 = 0u;
      long long v135 = 0u;
      id obja = v111;
      uint64_t v124 = [obja countByEnumeratingWithState:&v134 objects:v169 count:16];
      if (!v124) {
        goto LABEL_101;
      }
      uint64_t v122 = *(void *)v135;
      while (1)
      {
        for (uint64_t j = 0; j != v124; ++j)
        {
          if (*(void *)v135 != v122) {
            objc_enumerationMutation(obja);
          }
          v62 = *(void **)(*((void *)&v134 + 1) + 8 * j);
          id v63 = [v62 attributeSet];
          v64 = [v63 messageType];

          if ([v64 isEqualToString:@"lnk"])
          {
            long long v65 = [v62 attributeSet];
            v126 = [v65 contentCreationDate];

            v66 = [MEMORY[0x1E4F1C9A8] currentCalendar];
            v67 = [MEMORY[0x1E4F1C9C8] now];
            v68 = [v66 dateByAddingUnit:16 value:-30 toDate:v67 options:0];

            uint64_t v69 = [MEMORY[0x1E4F1C9A8] currentCalendar];
            v70 = [v69 startOfDayForDate:v68];

            if ([v126 compare:v70] == 1)
            {
              [v119 addObject:v62];
            }
            else if (IMOSLoggingEnabled())
            {
              v71 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                v72 = [v62 attributeSet];
                v73 = [v72 uniqueIdentifier];
                *(_DWORD *)v167 = 67109378;
                *(_DWORD *)v168 = 30;
                *(_WORD *)&v168[4] = 2112;
                *(void *)&v168[6] = v73;
                _os_log_impl(&dword_1AFB53000, v71, OS_LOG_TYPE_INFO, "Skipping adding resolvedURL since link is older than %d days: %@", v167, 0x12u);
              }
            }
            v74 = [v62 attributeSet];
            v75 = [v74 isShared];
            int v76 = [v75 BOOLValue];

            if (v76)
            {
              v77 = [v62 attributeSet];
              v78 = +[IMDSharedWithYouMetadataManager collaborationMetadataKey];
              v79 = [v77 valueForCustomKey:v78];

              v80 = (void *)MEMORY[0x1E4F28DC0];
              v81 = (void *)MEMORY[0x1E4F1CAD0];
              uint64_t v166 = objc_opt_class();
              v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:1];
              v83 = [v81 setWithArray:v82];
              id v133 = 0;
              v84 = [v80 _strictlyUnarchivedObjectOfClasses:v83 fromData:v79 error:&v133];
              id v85 = v133;

              if (v84)
              {
                v86 = [v84 collaborationIdentifier];
                if (v86)
                {
                  if (objc_opt_respondsToSelector())
                  {

                    goto LABEL_96;
                  }
                  v87 = [v84 handleToIdentityMap];
                  BOOL v88 = v87 == 0;

                  if (!v88) {
LABEL_96:
                  }
                    [v110 addObject:v62];
                }
              }
            }
          }
        }
        uint64_t v124 = [obja countByEnumeratingWithState:&v134 objects:v169 count:16];
        if (!v124)
        {
LABEL_101:

          if ([v110 count])
          {
            long long v131 = 0u;
            long long v132 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            id v89 = v110;
            uint64_t v90 = [v89 countByEnumeratingWithState:&v129 objects:v165 count:16];
            if (v90)
            {
              uint64_t v91 = *(void *)v130;
              do
              {
                for (uint64_t k = 0; k != v90; ++k)
                {
                  if (*(void *)v130 != v91) {
                    objc_enumerationMutation(v89);
                  }
                  v93 = objc_msgSend(obja, "objectAtIndex:", objc_msgSend(obja, "indexOfObject:", *(void *)(*((void *)&v129 + 1) + 8 * k)));
                  if (IMOSLoggingEnabled())
                  {
                    v94 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                    {
                      v95 = [v93 attributeSet];
                      v96 = [v95 uniqueIdentifier];
                      *(_DWORD *)v167 = 138412290;
                      *(void *)v168 = v96;
                      _os_log_impl(&dword_1AFB53000, v94, OS_LOG_TYPE_INFO, "Setting CS Item with uniqueidentifier  %@ to be updatable", v167, 0xCu);
                    }
                  }
                  [v93 setIsUpdate:1];
                }
                uint64_t v90 = [v89 countByEnumeratingWithState:&v129 objects:v165 count:16];
              }
              while (v90);
            }
          }
          if ([v119 count])
          {
            [(IMDCoreSpotlightManager *)self _resolvedURLForItems:v119];
            [(IMDCoreSpotlightManager *)self _FPProviderIDForItems:v119];
            [(IMDCoreSpotlightManager *)self reIndexWithLocalProofOfInclusionForItemsAsync:v119];
          }

          break;
        }
      }
    }

    _Block_object_dispose(&v157, 8);
    _Block_object_dispose(&v161, 8);
    _Block_object_dispose(buf, 8);

    id v18 = v99;
LABEL_118:

    id v9 = v111;
LABEL_119:

    goto LABEL_120;
  }
LABEL_2:
  id v9 = 0;
LABEL_120:

  return v9;
}

- (void)_updateFilteringForSearchableItem:(id)a3 chatDictionary:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F6E720] sharedInstance];
  uint64_t v7 = [v6 getValueFromDomain:@"com.apple.MobileSMS" forKey:@"spamFiltrationExtensionID"];
  if ([v7 isEqualToString:@"com.apple.smsFilter.extension"])
  {
    id v8 = [v5 objectForKey:@"properties"];
    id v9 = [v8 objectForKey:@"SMSSubCategory"];
    uint64_t v10 = [v9 integerValue];

    if (v10 == 4)
    {
      int v11 = [v12 attributeSet];
      [v11 setPotentialEventMessage:MEMORY[0x1E4F1CC38]];
    }
  }
}

- (id)_donationManager
{
  return +[IMDDonationManager sharedInstance];
}

- (void)_postProcessIndexingForItem:(id)a3 chatDictionary:(id)a4 isReindexing:(BOOL)a5
{
  id v6 = a4;
  id v10 = [v6 objectForKeyedSubscript:@"guid"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"groupPhotoGUID"];
  id v8 = [v6 objectForKeyedSubscript:@"groupPhotoPath"];

  if ([v7 length] && objc_msgSend(v8, "length"))
  {
    id v9 = [(IMDCoreSpotlightManager *)self _donationManager];
    [v9 copyGroupPhotoToExternalPathIfNecessary:v7 chatGUID:v10 attachmentFilepath:v8];
  }
}

+ (id)resolvedURLCustomKey
{
  if (qword_1E9AF8230 != -1) {
    dispatch_once(&qword_1E9AF8230, &unk_1F084D538);
  }
  v2 = (void *)qword_1E9AF8228;
  return v2;
}

- (void)_updateItem:(id)a3 withResolvedURL:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((sub_1AFBD56A0() & 1) == 0)
  {
    if ([v7 length])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F23850]);
      id v9 = [v8 initWithItemContentType:*MEMORY[0x1E4F22658]];
      id v10 = [(id)objc_opt_class() resolvedURLCustomKey];
      [v9 setValue:v7 forCustomKey:v10];

      int v11 = [v6 attributeSet];
      id v12 = [v11 bundleID];
      [v9 setBundleID:v12];

      uint64_t v13 = [v6 attributeSet];
      int v14 = [v13 identifier];
      [v9 setIdentifier:v14];

      id v15 = objc_alloc(MEMORY[0x1E4F23840]);
      char v16 = [v6 uniqueIdentifier];
      uint64_t v17 = [v6 domainIdentifier];
      id v18 = (void *)[v15 initWithUniqueIdentifier:v16 domainIdentifier:v17 attributeSet:v9];

      [v18 setIsUpdate:1];
      uint64_t v19 = [(IMDCoreSpotlightManager *)self searchableIndex];
      v23[0] = v18;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1AFBDCECC;
      v21[3] = &unk_1E5F8E8E8;
      id v22 = v6;
      [v19 indexSearchableItems:v20 completionHandler:v21];
    }
    else
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6B4BC();
      }
    }
  }
}

- (void)_updateItem:(id)a3 withFPProviderID:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ((sub_1AFBD56A0() & 1) == 0)
  {
    if ([v7 length])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F23850]);
      id v9 = [v8 initWithItemContentType:*MEMORY[0x1E4F22658]];
      [v9 setFileProviderID:v7];
      id v10 = [v6 attributeSet];
      int v11 = [v10 bundleID];
      [v9 setBundleID:v11];

      id v12 = [v6 attributeSet];
      uint64_t v13 = [v12 identifier];
      [v9 setIdentifier:v13];

      int v14 = [v6 attributeSet];
      id v15 = [v14 contentType];
      [v9 setContentType:v15];

      char v16 = [v6 attributeSet];
      uint64_t v17 = [v16 contentTypeTree];
      [v9 setContentTypeTree:v17];

      id v18 = objc_alloc(MEMORY[0x1E4F23840]);
      uint64_t v19 = [v6 uniqueIdentifier];
      uint64_t v20 = [v6 domainIdentifier];
      id v21 = (void *)[v18 initWithUniqueIdentifier:v19 domainIdentifier:v20 attributeSet:v9];

      [v21 setIsUpdate:1];
      id v22 = [(IMDCoreSpotlightManager *)self searchableIndex];
      v26[0] = v21;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1AFBDD29C;
      v24[3] = &unk_1E5F8E8E8;
      id v25 = v6;
      [v22 indexSearchableItems:v23 completionHandler:v24];
    }
    else
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1AFC6B4F4();
      }
    }
  }
}

- (void)_updateItem:(id)a3 withIdentityMap:(id)a4 localIdentity:(id)a5 localIdentityProof:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((sub_1AFBD56A0() & 1) == 0)
  {
    if (v11 && v12 && v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F23850]);
      id v15 = [v14 initWithItemContentType:*MEMORY[0x1E4F22658]];
      id v47 = 0;
      char v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v47];
      id v17 = v47;
      id v46 = 0;
      id v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v46];
      id v42 = v46;
      id v45 = 0;
      uint64_t v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v45];
      id v19 = v45;
      uint64_t v41 = v19;
      if (v17 || v42 || v19)
      {
        id v34 = IMLogHandleForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          id v50 = v17;
          __int16 v51 = 2112;
          id v52 = v42;
          __int16 v53 = 2112;
          id v54 = v41;
          _os_log_error_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_ERROR, "Archive error for localIdentity: %@, localIdentityProof: %@ or identityMap: %@", buf, 0x20u);
        }
        v36 = (void *)v40;
      }
      else
      {
        uint64_t v20 = [v10 attributeSet];
        id v21 = [v20 bundleID];
        [v15 setBundleID:v21];

        id v22 = [v10 attributeSet];
        uint64_t v23 = [v22 identifier];
        [v15 setIdentifier:v23];

        id v24 = [(id)objc_opt_class() localIdentityKey];
        [v15 setValue:v16 forCustomKey:v24];

        id v25 = [(id)objc_opt_class() localIdentityProofKey];
        [v15 setValue:v18 forCustomKey:v25];

        char v26 = [(id)objc_opt_class() handleToIdentityMapKey];
        [v15 setValue:v40 forCustomKey:v26];

        v27 = [v10 attributeSet];
        id v28 = [v27 contentType];
        [v15 setContentType:v28];

        dispatch_time_t v29 = [v10 attributeSet];
        unint64_t v30 = [v29 contentTypeTree];
        [v15 setContentTypeTree:v30];

        id v31 = objc_alloc(MEMORY[0x1E4F23840]);
        v32 = [v10 uniqueIdentifier];
        [v10 domainIdentifier];
        uint64_t v33 = v39 = v18;
        id v34 = [v31 initWithUniqueIdentifier:v32 domainIdentifier:v33 attributeSet:v15];

        [v34 setIsUpdate:1];
        v35 = self;
        v36 = (void *)v40;
        v37 = [(IMDCoreSpotlightManager *)v35 searchableIndex];
        v48 = v34;
        BOOL v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = sub_1AFBDD88C;
        v43[3] = &unk_1E5F8E8E8;
        id v44 = v10;
        [v37 indexSearchableItems:v38 completionHandler:v43];

        id v18 = v39;
        id v17 = 0;
      }
    }
    else
    {
      id v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v50 = v12;
        __int16 v51 = 2112;
        id v52 = v13;
        __int16 v53 = 2112;
        id v54 = v11;
        _os_log_error_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_ERROR, "Invalid localIdentity: %@, localIdentityProof: %@ or identityMap: %@", buf, 0x20u);
      }
    }
  }
}

- (void)_resolvedURLForItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v30 = [v3 count];
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Checking if we need to add \"resolved\" URLs for %lu items", buf, 0xCu);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v26;
    *(void *)&long long v7 = 138412546;
    long long v22 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        id v11 = objc_msgSend(v10, "attributeSet", v22);
        id v12 = [v11 URL];
        if (qword_1E9AF82B0 != -1) {
          dispatch_once(&qword_1E9AF82B0, &unk_1F084D5B8);
        }
        int v13 = objc_msgSend(v12, "nr_isNewsURL");
        int v14 = objc_msgSend(v12, "nr_isWebURL");
        if (IMOSLoggingEnabled())
        {
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            if (v13) {
              char v16 = @"YES";
            }
            else {
              char v16 = @"NO";
            }
            *(_DWORD *)long long buf = v22;
            uint64_t v30 = (uint64_t)v16;
            if (v14) {
              id v17 = @"YES";
            }
            else {
              id v17 = @"NO";
            }
            __int16 v31 = 2112;
            v32 = v17;
            _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "isNewsURL: %@ isWebURL:%@", buf, 0x16u);
          }
        }
        if ((v13 | v14) == 1)
        {
          id v18 = [(id)qword_1E9AF8238 sharedManager];
          id v19 = v18;
          if (v13) {
            [v18 createResolutionOperationForNewsURL:v12];
          }
          else {
          id v21 = [v18 createResolutionOperationForWebURL:v12];
          }

          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = sub_1AFBDDD70;
          v24[3] = &unk_1E5F96510;
          void v24[4] = v10;
          v24[5] = self;
          [v21 setResolutionCompletion:v24];
          [v21 start];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "URL was not classified as either WebURL or a News URL", buf, 2u);
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v6);
  }
}

- (void)_FPProviderIDForItems:(id)a3
{
  id v18 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v31 = [v3 count];
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Checking if we need to add FileProviderID for %lu items", buf, 0xCu);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v8, "attributeSet", v18);
        id v10 = [v9 URL];
        id v11 = [v9 isShared];
        int v12 = [v11 BOOLValue];

        if (v10) {
          int v13 = v12;
        }
        else {
          int v13 = 0;
        }
        if (v13 == 1)
        {
          if (qword_1E9AF8248 != -1) {
            dispatch_once(&qword_1E9AF8248, &unk_1F084C180);
          }
          int v14 = (void (*)(id, void, void *))off_1E9AF8240;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1AFBDE2E0;
          aBlock[3] = &unk_1E5F96560;
          id v15 = v10;
          id v21 = v15;
          id v22 = v9;
          uint64_t v23 = v18;
          id v24 = v8;
          char v16 = _Block_copy(aBlock);
          v14(v15, 0, v16);
        }
        else if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "URL was not classified as a CollaborationURL", buf, 2u);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)reIndexWithLocalProofOfInclusionForItemsAsync:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v3 count];
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Generating and donating local proof of inclusion for %lu items", (uint8_t *)&buf, 0xCu);
    }
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = v3;
  uint64_t v47 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v47)
  {
    uint64_t v44 = *(void *)v67;
    uint64_t v41 = v53;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v67 != v44)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v49 = v5;
        uint64_t v7 = *(void **)(*((void *)&v66 + 1) + 8 * v5);
        __int16 v51 = objc_msgSend(v7, "attributeSet", v41);
        id v50 = [v51 URL];
        uint64_t v8 = [v51 isShared];
        int v9 = [v8 BOOLValue];

        if (v50) {
          int v10 = v9;
        }
        else {
          int v10 = 0;
        }
        if (v10 != 1)
        {
          if (IMOSLoggingEnabled())
          {
            v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "URL was not classified as a CollaborationURL", (uint8_t *)&buf, 2u);
            }
          }
          goto LABEL_48;
        }
        id v11 = [v7 attributeSet];
        id v45 = [v11 accountHandles];

        int v12 = [v7 attributeSet];
        int v13 = +[IMDSharedWithYouMetadataManager collaborationMetadataKey];
        v48 = [v12 valueForCustomKey:v13];

        int v14 = (void *)MEMORY[0x1E4F28DC0];
        id v15 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v78 = objc_opt_class();
        char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
        id v17 = [v15 setWithArray:v16];
        id v65 = 0;
        id v18 = [v14 _strictlyUnarchivedObjectOfClasses:v17 fromData:v48 error:&v65];
        id v46 = v65;

        if (!v18)
        {
          v36 = IMLogHandleForCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1AFC6B5CC(v76, v46, &v77, v36);
          }
LABEL_45:

LABEL_46:
          int v37 = 1;
          goto LABEL_47;
        }
        id v19 = [v18 collaborationIdentifier];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          v36 = IMLogHandleForCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_1AFC6B644(&v63, v64);
          }
          goto LABEL_45;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || ([v18 handleToIdentityMap],
              id v21 = objc_claimAutoreleasedReturnValue(),
              BOOL v22 = v21 == 0,
              v21,
              v22))
        {
          if (IMOSLoggingEnabled())
          {
            v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf) = 0;
              _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "handleToIdentityMap is required for identity proof lookup. Not indexing proof of inclusion this item. This may not be a generic 3rd party collaboration.", (uint8_t *)&buf, 2u);
            }
            goto LABEL_45;
          }
          goto LABEL_46;
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v72 = 0x3032000000;
        v73 = sub_1AFBD5D3C;
        v74 = sub_1AFBD5D4C;
        id v75 = 0;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v23 = v45;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v70 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v60 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              if (objc_opt_respondsToSelector())
              {
                long long v28 = [v18 handleToIdentityMap];
                dispatch_time_t v29 = [v28 objectForKey:v27];

                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v29);
                }
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v70 count:16];
          }
          while (v24);
        }

        id v30 = objc_alloc(+[IMDCoreSpotlightManager __SLCollaborationHandshakeController]);
        uint64_t v31 = [(IMDCoreSpotlightManager *)self _personIdentityQueue];
        uint64_t v32 = (void *)[v30 initWithTargetSerialQueue:v31 synchronous:1];

        if (v32)
        {
          if (objc_opt_respondsToSelector())
          {
            uint64_t v33 = *(void *)(*((void *)&buf + 1) + 40);
            uint64_t v34 = [v18 collaborationIdentifier];
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = sub_1AFBDF160;
            v54[3] = &unk_1E5F96588;
            p_long long buf = &buf;
            v54[4] = self;
            v54[5] = v7;
            id v55 = v18;
            [v32 generateProofForIdentity:v33 collaborationIdentifier:v34 timeout:v54 completion:10.0];
          }
          else
          {
            v39 = IMLogHandleForCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              sub_1AFC6B6A4(&v52, v41);
            }
          }
          int v37 = 0;
        }
        else
        {
          BOOL v38 = IMLogHandleForCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_1AFC6B674(&v57, v58);
          }

          int v37 = 1;
        }

        _Block_object_dispose(&buf, 8);
LABEL_47:

        if (v37)
        {

          goto LABEL_61;
        }
LABEL_48:

        uint64_t v5 = v49 + 1;
      }
      while (v49 + 1 != v47);
      uint64_t v40 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
      uint64_t v47 = v40;
    }
    while (v40);
  }
LABEL_61:
}

- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4
{
  id v6 = a3;
  id v12 = 0;
  id v7 = [(IMDCoreSpotlightManager *)self newChatSearchableItemForChatDictionary:v6 optionalLastMessageDate:a4 error:&v12];
  id v8 = v12;
  if (v8)
  {
    int v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B7D4();
    }

    int v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B76C();
    }
  }
  return v7;
}

- (id)newChatSearchableItemForChatDictionary:(id)a3 optionalLastMessageDate:(id)a4 error:(id *)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    IMDPersistenceCheckNotDatabaseThread();
    int v9 = _IMDCoreSpotlightChatUIDForChatDictionary(v7);
    uint64_t v10 = [v7 objectForKey:@"guid"];
    id v11 = (void *)v10;
    if (!v9 || !v10)
    {
      if (!a5)
      {
        uint64_t v33 = 0;
LABEL_46:

        goto LABEL_47;
      }
      id v67 = v8;
      uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v74 = *MEMORY[0x1E4F28568];
      v35 = NSString;
      id v15 = [v7 objectForKeyedSubscript:@"chatIdentifier"];
      uint64_t v36 = [v7 objectForKeyedSubscript:@"groupID"];
      int v37 = [v7 objectForKeyedSubscript:@"style"];
      BOOL v38 = v35;
      v39 = (void *)v36;
      uint64_t v40 = [v38 stringWithFormat:@"Chat dictionary malformed. unique identifier %@ guid %@ chat identifier %@ group ID %@ style %@", v9, v11, v15, v36, v37];
      id v75 = v40;
      id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      [v34 errorWithDomain:@"com.apple.Messages.IMDCoreSpotlight" code:1 userInfo:v20];
      uint64_t v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

      id v8 = v67;
      goto LABEL_46;
    }
    uint64_t v12 = [v7 objectForKey:@"lastMessageDate"];
    int v13 = (void *)v12;
    if (v12) {
      int v14 = (void *)v12;
    }
    else {
      int v14 = v8;
    }
    id v15 = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F23850]);
    id v17 = (void *)[v16 initWithItemContentType:*MEMORY[0x1E4F22658]];
    char v63 = v11;
    [v17 setAccountIdentifier:v11];
    long long v68 = v17;
    [v17 setLastUsedDate:v15];
    id v18 = [v7 objectForKey:@"participants"];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    obuint64_t j = v18;
    uint64_t v21 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    id v67 = v8;
    if (v21)
    {
      uint64_t v22 = v21;
      id v62 = v15;
      v64 = v9;
      id v65 = v7;
      int v23 = 0;
      uint64_t v24 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v71 != v24) {
            objc_enumerationMutation(obj);
          }
          long long v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          uint64_t v27 = _IMDCoreSpotlightCNContactForAddress(v26);
          long long v28 = v27;
          if (v23) {
            int v29 = v23;
          }
          else {
            int v29 = 1;
          }
          if (v27) {
            int v23 = v29;
          }
          _IMDCoreSpotlightFullNameForContact(v27, 0);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          if (!v30) {
            id v30 = v26;
          }
          uint64_t v31 = _IMDCoreSpotlightPerson(v30, v26, v28, (void *)*MEMORY[0x1E4F6E1B0]);
          if (v31)
          {
            [v19 addObject:v31];
            [v20 addObject:v26];
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v22);
      int v32 = v23 & 1;
      int v9 = v64;
      id v7 = v65;
      id v15 = v62;
    }
    else
    {
      int v32 = 0;
    }

    id v66 = v19;
    [v68 setPrimaryRecipients:v19];
    [v68 setRecipientAddresses:v20];
    uint64_t v41 = [v7 objectForKey:@"groupName"];
    if (v41)
    {
      [v68 setSubject:v41];
      [v68 setDisplayName:v41];
    }
    id v42 = [v7 valueForKey:@"style"];

    unint64_t v43 = 0x1E4F28000;
    if (v42)
    {
      uint64_t v44 = [v7 valueForKey:@"style"];
      int v45 = [v44 charValue];

      id v46 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v45);
      [(id)objc_opt_class() chatStyleCustomKey];
      int v47 = v32;
      uint64_t v49 = v48 = v15;
      [v68 setValue:v46 forCustomKey:v49];

      id v15 = v48;
      int v32 = v47;
      unint64_t v43 = 0x1E4F28000uLL;
      id v50 = [MEMORY[0x1E4F28ED0] numberWithBool:v45 == 43];
      [v68 setIsGroupThread:v50];
    }
    unint64_t v51 = v43;
    char v52 = [v7 objectForKey:@"syndicationType"];

    int v37 = obj;
    if (v52
      && (([v7 objectForKey:@"syndicationType"],
           __int16 v53 = objc_claimAutoreleasedReturnValue(),
           unint64_t v54 = [v53 integerValue],
           v53,
           v54 < 2)
        ? (int v55 = v32)
        : (int v55 = 0),
          v55 == 1))
    {
      v56 = [*(id *)(v51 + 3792) numberWithBool:1];
      char v57 = [(id)objc_opt_class() chatAutoDonatingCutomKey];
      [v68 setValue:v56 forCustomKey:v57];

      id v58 = [v7 objectForKey:@"syndicationDate"];

      id v11 = v63;
      if (!v58)
      {
LABEL_44:
        v39 = v68;
        [v68 associateConversationEntityWithIdentifier:v9 displayTitle:v41];
        uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v9 domainIdentifier:@"chatDomain" attributeSet:v68];

        uint64_t v40 = v66;
        goto LABEL_45;
      }
      long long v59 = [v7 objectForKey:@"syndicationDate"];
      if (!v59)
      {
LABEL_43:

        goto LABEL_44;
      }
      long long v60 = [(id)objc_opt_class() chatAutoDonatingServerDateCustomKey];
      [v68 setValue:v59 forCustomKey:v60];
    }
    else
    {
      long long v59 = [*(id *)(v51 + 3792) numberWithBool:0];
      long long v60 = [(id)objc_opt_class() chatAutoDonatingCutomKey];
      [v68 setValue:v59 forCustomKey:v60];
      id v11 = v63;
    }

    goto LABEL_43;
  }
  uint64_t v33 = 0;
LABEL_47:

  return v33;
}

+ (id)chatAutoDonatingCutomKey
{
  if (qword_1EB5AB9F8 != -1) {
    dispatch_once(&qword_1EB5AB9F8, &unk_1F084C6C8);
  }
  v2 = (void *)qword_1EB5AB9F0;
  return v2;
}

+ (id)chatAutoDonatingServerDateCustomKey
{
  if (qword_1EB5AB9D0 != -1) {
    dispatch_once(&qword_1EB5AB9D0, &unk_1F084C7A8);
  }
  v2 = (void *)qword_1EB5ABAA8;
  return v2;
}

+ (id)chatStyleCustomKey
{
  if (qword_1EB5ABB90 != -1) {
    dispatch_once(&qword_1EB5ABB90, &unk_1F084C6E8);
  }
  v2 = (void *)qword_1EB5ABB88;
  return v2;
}

+ (id)localIdentityProofKey
{
  if (qword_1E9AF8278 != -1) {
    dispatch_once(&qword_1E9AF8278, &unk_1F084C5A8);
  }
  v2 = (void *)qword_1E9AF8270;
  return v2;
}

+ (id)localIdentityKey
{
  if (qword_1E9AF8288 != -1) {
    dispatch_once(&qword_1E9AF8288, &unk_1F084D558);
  }
  v2 = (void *)qword_1E9AF8280;
  return v2;
}

+ (id)handleToIdentityMapKey
{
  if (qword_1E9AF8298 != -1) {
    dispatch_once(&qword_1E9AF8298, &unk_1F084C240);
  }
  v2 = (void *)qword_1E9AF8290;
  return v2;
}

+ (id)threadIdentifierCustomKey
{
  if (qword_1E9AF7FB8 != -1) {
    dispatch_once(&qword_1E9AF7FB8, &unk_1F084C708);
  }
  v2 = (void *)qword_1E9AF7FB0;
  return v2;
}

- (void)addChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDCoreSpotlightManager *)self _chatDictionaryForChatGUID:v6];
  id v14 = 0;
  id v8 = [(IMDCoreSpotlightManager *)self newChatSearchableItemForChatDictionary:v7 optionalLastMessageDate:0 error:&v14];
  id v9 = v14;
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = [(IMDCoreSpotlightManager *)self searchableIndex];
    v15[0] = v8;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    sub_1AFBE0070(v11, 0, v12, 0, a4, 0);

LABEL_8:
    goto LABEL_9;
  }
  if (v9)
  {
    int v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B8A4((uint64_t)v6);
    }

    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6B83C();
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)deleteChatSearchableItemForChatGUID:(id)a3 reason:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(IMDCoreSpotlightManager *)self _chatDictionaryForChatGUID:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = _IMDCoreSpotlightChatUIDForChatDictionary(v6);
    if (v8)
    {
      id v9 = [(IMDCoreSpotlightManager *)self searchableIndex];
      v11[0] = v8;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      sub_1AFBD7560(v9, v10, a4);
    }
  }
}

- (id)_chatDictionaryForChatGUID:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = sub_1AFBD5D3C;
  id v14 = sub_1AFBD5D4C;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFBE0BFC;
  v7[3] = &unk_1E5F965B0;
  id v4 = v3;
  id v8 = v4;
  id v9 = &v10;
  IMDPersistencePerformBlock(v7, 1);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)setNeedsMessageReindexingWithReason:(int64_t)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v26 = "-[IMDCoreSpotlightManager setNeedsMessageReindexingWithReason:completion:]";
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "%s starting reindex", buf, 0xCu);
    }
  }
  id v8 = [(IMDCoreSpotlightManager *)self searchableIndex];
  BOOL v9 = v8 == 0;

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
      }
    }
    if (v6) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v10 = [(IMDCoreSpotlightManager *)self maxRowID];
    int64_t v11 = [(IMDCoreSpotlightManager *)self totalMessages];
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315650;
        long long v26 = "-[IMDCoreSpotlightManager setNeedsMessageReindexingWithReason:completion:]";
        __int16 v27 = 2048;
        uint64_t v28 = v10;
        __int16 v29 = 2048;
        int64_t v30 = v11;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "%s max cmj rowID %lld total messages %lld", buf, 0x20u);
      }
    }
    if (v10 > 0)
    {
      int v13 = +[IMSpotlightEventNotifier sharedNotifier];
      [v13 reindexInitiatedWithTotalMessages:v11 reason:a3];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1AFBE1024;
      aBlock[3] = &unk_1E5F965D8;
      void aBlock[4] = self;
      uint64_t v21 = v6;
      uint64_t v22 = v10;
      int64_t v23 = v11;
      int64_t v24 = a3;
      id v14 = _Block_copy(aBlock);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1AFBE12F4;
      v18[3] = &unk_1E5F8FD28;
      v18[4] = self;
      id v19 = v14;
      id v15 = v14;
      sub_1AFBD5444(v18);

      goto LABEL_24;
    }
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to get max cmj row ID for indexing!", buf, 2u);
      }
    }
    if (v6) {
LABEL_23:
    }
      v6[2](v6);
  }
LABEL_24:
}

- (void)_sanitizeIndexesForCurrentVersionIfNeeded:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1AFBD5D3C;
  uint64_t v34 = sub_1AFBD5D4C;
  id v35 = 0;
  id v5 = +[IMDSpotlightClientStateManager sharedManager];
  id v6 = (id *)(v31 + 5);
  obuint64_t j = (id)v31[5];
  id v7 = [v5 currentClientStateWithError:&obj];
  objc_storeStrong(v6, obj);

  if (!v31[5])
  {
    if (([v7 needsIndexDrop] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Bypassing index version comparisons. **NOT** deleting indexes", buf, 2u);
        }
      }
      goto LABEL_24;
    }
    if ([v7 needsReindex])
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = [v7 indexRevision];
          uint64_t v10 = [MEMORY[0x1E4F6EA40] _latestIndexRevision];
          *(_DWORD *)long long buf = 134218240;
          uint64_t v37 = v9;
          __int16 v38 = 2048;
          uint64_t v39 = v10;
          _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Current idx version is %llu, expected is %llu, deleting prior indexes", buf, 0x16u);
        }
      }
      int64_t v11 = [(IMDCoreSpotlightManager *)self searchableIndex];
      BOOL v12 = v11 == 0;

      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
        [v13 startTimingForKey:@"CSDeleteAllIndexes"];
        id v14 = dispatch_group_create();
        dispatch_group_enter(v14);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1AFBE17E8;
        aBlock[3] = &unk_1E5F96600;
        id v15 = v13;
        id v26 = v15;
        uint64_t v28 = &v30;
        id v16 = v14;
        __int16 v27 = v16;
        id v17 = _Block_copy(aBlock);
        [(IMDCoreSpotlightManager *)self deleteAllSearchableItemsWithReason:4 completionHandler:v17];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = sub_1AFBE1978;
        v22[3] = &unk_1E5F96628;
        id v23 = v4;
        int64_t v24 = &v30;
        id v18 = _Block_copy(v22);
        dispatch_group_notify(v16, MEMORY[0x1E4F14428], v18);

        goto LABEL_25;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_23;
      }
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_23;
      }
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [v7 indexRevision];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v37 = v21;
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Current idx version is %llu, index does not need deletion", buf, 0xCu);
      }
    }

LABEL_23:
    if (!v4) {
      goto LABEL_25;
    }
LABEL_24:
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    goto LABEL_25;
  }
  (*((void (**)(id))v4 + 2))(v4);
LABEL_25:

  _Block_object_dispose(&v30, 8);
}

- (void)_enumerateSearchableChatItemsForAllChatsWithBlock:(id)a3 timingCollection:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, id))a3;
  id v6 = a4;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1AFBD5D3C;
  uint64_t v31 = sub_1AFBD5D4C;
  id v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1AFBE1DB4;
  v24[3] = &unk_1E5F965B0;
  id v7 = v6;
  id v25 = v7;
  id v26 = &v27;
  IMDPersistencePerformBlock(v24, 1);
  unint64_t v23 = [(id)v28[5] count];
  if (v28[5])
  {
    unint64_t v8 = [MEMORY[0x1E4F6E700] chatBatchSize];
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        unint64_t v34 = v23;
        __int16 v35 = 2048;
        unint64_t v36 = v8;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "About to index %lu chats in batches of %lu", buf, 0x16u);
      }
    }
    if (v23)
    {
      unint64_t v11 = 0;
      *(void *)&long long v9 = 134218240;
      long long v21 = v9;
      unint64_t v12 = v23;
      do
      {
        if (v8 >= v12) {
          unint64_t v13 = v12;
        }
        else {
          unint64_t v13 = v8;
        }
        id v14 = (void *)MEMORY[0x1B3E8A120]();
        [v7 startTimingForKey:@"generateItems"];
        if (v8 >= v12) {
          unint64_t v15 = v12;
        }
        else {
          unint64_t v15 = v8;
        }
        id v16 = (void *)v28[5];
        id v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v15, v21);
        id v18 = [v16 objectsAtIndexes:v17];

        id v19 = [(IMDCoreSpotlightManager *)self _newSearchableChatItemsForChats:v18];
        v5[2](v5, v19);

        [v7 stopTimingForKey:@"generateItems"];
        if (IMOSLoggingEnabled())
        {
          id v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v21;
            unint64_t v34 = v13 + v11;
            __int16 v35 = 2048;
            unint64_t v36 = v12;
            _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Finished indexing a batch of chats, indexed %lu, %lu to go", buf, 0x16u);
          }
        }
        v11 += v8;
        v12 -= v8;
      }
      while (v11 < v23);
    }
  }

  _Block_object_dispose(&v27, 8);
}

- (void)indexChatsWithReason:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((sub_1AFBD56A0() & 1) == 0)
  {
    id v5 = [(IMDCoreSpotlightManager *)self searchableIndex];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1B3E8A120]();
      id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      [v7 startTimingForKey:@"totalTime"];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = sub_1AFBE2048;
      v10[3] = &unk_1E5F96650;
      v10[4] = self;
      v10[5] = a3;
      [(IMDCoreSpotlightManager *)self _enumerateSearchableChatItemsForAllChatsWithBlock:v10 timingCollection:v7];
      [v7 stopTimingForKey:@"totalTime"];
      if (IMOSLoggingEnabled())
      {
        unint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          id v12 = v7;
          _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "indexChats timing %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      long long v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", (uint8_t *)&v11, 2u);
      }
    }
  }
}

- (id)_newSearchableChatItemsForChats:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(IMDCoreSpotlightManager *)self _chatCountForChats:v4];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v5];
  if (v5 >= 1)
  {
    uint64_t v8 = 0;
    *(void *)&long long v7 = 138412290;
    long long v19 = v7;
    while (1)
    {
      long long v9 = -[IMDCoreSpotlightManager _chatDictionaryForChatAtIndex:withChats:](self, "_chatDictionaryForChatAtIndex:withChats:", v8, v4, v19);
      uint64_t v10 = _IMDCoreSpotlightChatUIDForChatDictionary(v9);
      if (v10) {
        break;
      }
LABEL_15:

      if (v5 == ++v8) {
        goto LABEL_16;
      }
    }
    int v11 = [v6 objectForKey:v10];
    id v12 = [v11 attributeSet];
    uint64_t v13 = [v12 lastUsedDate];

    id v14 = [v9 objectForKey:@"lastMessageDate"];
    if (v14 && v13 && [v13 compare:v14] == 1)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_14:

        goto LABEL_15;
      }
      unint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = v19;
        long long v21 = v10;
        _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Not indexing UID %@, already indexed newer record", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v15 = [(IMDCoreSpotlightManager *)self newChatSearchableItemForChatDictionary:v9 optionalLastMessageDate:0];
      if (v15) {
        [v6 setObject:v15 forKey:v10];
      }
    }

    goto LABEL_14;
  }
LABEL_16:
  id v16 = [v6 allValues];
  id v17 = (void *)[v16 copy];

  return v17;
}

- (int64_t)_chatCountForChats:(id)a3
{
  return [a3 count];
}

- (id)_chatDictionaryForChatAtIndex:(unint64_t)a3 withChats:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1AFBD5D3C;
  id v17 = sub_1AFBD5D4C;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFBE2558;
  v10[3] = &unk_1E5F96470;
  id v12 = &v13;
  id v7 = v6;
  id v11 = v7;
  IMDPersistencePerformBlock(v10, 1);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (void)_indexSearchableChatItems:(id)a3 withReason:(int64_t)a4 index:(id)a5 blocking:(BOOL)a6
{
  if (a6) {
    sub_1AFBD57A4(a5, 0, a3, 0, a4, 1000000000 * [MEMORY[0x1E4F6E700] extendedSpotlightTimeoutSeconds]);
  }
  else {
    sub_1AFBE0070(a5, 0, a3, 0, a4, 0);
  }
}

- (void)indexNextMessageBatchIfNeeded:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void))a5;
  if (IMOSLoggingEnabled())
  {
    long long v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v34 = (const char *)a3;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Indexing next batch of messages. Batch size of %lu", buf, 0xCu);
    }
  }
  if (sub_1AFBD56A0())
  {
    if (v8) {
LABEL_41:
    }
      v8[2](v8);
  }
  else if ([MEMORY[0x1E4F6E700] skipIndexing])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = [MEMORY[0x1E4F6E700] skipIndexing];
        id v12 = @"NO";
        if (v11) {
          id v12 = @"YES";
        }
        *(_DWORD *)long long buf = 138412290;
        unint64_t v34 = (const char *)v12;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Skipping indexing next batch since skipIndexing is set to %@", buf, 0xCu);
      }
    }
    if (v8) {
      goto LABEL_41;
    }
  }
  else if ([(IMDCoreSpotlightManager *)self _shouldIndexNextBatchForBatchSize:a3])
  {
    uint64_t v13 = [(IMDCoreSpotlightManager *)self searchableIndex];
    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1AFBE2B5C;
      aBlock[3] = &unk_1E5F96678;
      unint64_t v31 = a3;
      void aBlock[4] = self;
      id v15 = v14;
      id v29 = v15;
      id v30 = v13;
      int64_t v32 = a4;
      id v16 = (uint64_t (**)(void *, _DWORD *))_Block_copy(aBlock);
      int v27 = 0;
      if (a3)
      {
        do
        {
          id v17 = (void *)MEMORY[0x1B3E8A120]();
          char v18 = v16[2](v16, &v27);
          if (v27 < a3) {
            char v19 = v18;
          }
          else {
            char v19 = 0;
          }
        }
        while ((v19 & 1) != 0);
      }
      if (v8) {
        v8[2](v8);
      }
      [v15 stopTimingForKey:@"totalTime"];
      if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v34 = (const char *)v15;
          _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Timing %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "IMDCoreSpotlight: Failed to create index!", buf, 2u);
        }
      }
      if (v8) {
        v8[2](v8);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v22 = [MEMORY[0x1E4F6E700] needsIndexing];
        int v23 = IMDSystemMigrationOccurred();
        int64_t v24 = @"NO";
        unint64_t v34 = "-[IMDCoreSpotlightManager indexNextMessageBatchIfNeeded:reason:completion:]";
        __int16 v35 = 2048;
        if (v22) {
          id v25 = @"YES";
        }
        else {
          id v25 = @"NO";
        }
        *(_DWORD *)long long buf = 136315906;
        unint64_t v36 = a3;
        __int16 v37 = 2112;
        if (v23) {
          int64_t v24 = @"YES";
        }
        __int16 v38 = v25;
        __int16 v39 = 2112;
        uint64_t v40 = v24;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "IMDCoreSpotlight %s - Not indexing. Batch size %lu needsIndexing %@ hasMigrated %@", buf, 0x2Au);
      }
    }
    if (v8) {
      goto LABEL_41;
    }
  }
}

- (id)_copyNewSearchableIndexesForMessagesWithLastRowID:(unint64_t *)a3 messageRecordCount:(unint64_t *)a4 messagesWithItemsGeneratedCount:(unint64_t *)a5 batchSize:(unint64_t)a6 timingCollection:(id)a7 rejectedItems:(id)a8
{
  id v14 = a8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1AFBE2F48;
  v18[3] = &unk_1E5F966A0;
  v18[4] = self;
  id v19 = v14;
  id v20 = a5;
  id v15 = v14;
  id v16 = IMDDeriveObjectsForMessagesWithLastRowIDAndBatchSizeUsingBlock(a3, a4, a6, a7, v18);

  return v16;
}

- (void)_indexSearchableItems:(id)a3 rejectedItems:(id)a4 clientState:(id)a5 lastIndexedRowID:(unint64_t)a6 messagesInBatch:(unint64_t)a7 messagesWithItemsGeneratedCount:(unint64_t)a8 batchSize:(unint64_t)a9 lastBatch:(BOOL)a10 withIndex:(id)a11 reason:(int64_t)a12
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v26 = a4;
  id v19 = a5;
  id v20 = a11;
  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      __int16 v38 = "-[IMDCoreSpotlightManager _indexSearchableItems:rejectedItems:clientState:lastIndexedRowID:messagesInBatch:m"
            "essagesWithItemsGeneratedCount:batchSize:lastBatch:withIndex:reason:]";
      __int16 v39 = 2048;
      uint64_t v40 = [v18 count];
      __int16 v41 = 2112;
      id v42 = v20;
      _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "%s Generated %lu items to index!. Using Index %@", buf, 0x20u);
    }
  }
  aBlocuint64_t k = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  id v30 = sub_1AFBE3280;
  unint64_t v31 = &unk_1E5F966C8;
  BOOL v36 = a10;
  int64_t v32 = self;
  id v22 = v19;
  id v33 = v22;
  int64_t v34 = a12;
  unint64_t v35 = a6;
  int v23 = (void (**)(void))_Block_copy(&aBlock);
  if (a10) {
    unint64_t v24 = 1;
  }
  else {
    unint64_t v24 = a6;
  }
  objc_msgSend(v22, "setLastIndexedRowID:", v24, v26, aBlock, v29, v30, v31, v32);
  objc_msgSend(v22, "setInitialIndexedMessages:", objc_msgSend(v22, "initialIndexedMessages") + a8);
  objc_msgSend(v22, "setProcessedMessageRecords:", objc_msgSend(v22, "processedMessageRecords") + a7);
  if (![(IMDCoreSpotlightManager *)self _shouldBypassForTesting]
    && sub_1AFBD57A4(v20, v22, v18, v27, a12, 1000000000 * [MEMORY[0x1E4F6E700] extendedSpotlightTimeoutSeconds])&& IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Timed out waiting for CoreSpotlight to finish indexing message items!", buf, 2u);
    }
  }
  v23[2](v23);
}

- (void)deleteAllSearchableItemsWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(IMDCoreSpotlightManager *)self searchableIndex];
  [v6 deleteAllSearchableItemsWithReason:IMCSIndexReasonFromIMIndexReason() completionHandler:v5];
}

- (void)_suspendReindexingDueToError:(id)a3
{
  id v3 = a3;
  id v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1AFC6BA80();
  }

  id v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = [v5 dateByAddingTimeInterval:1800.0];

  [MEMORY[0x1E4F6E700] setReindexingSuspendedUntilDate:v6];
  id v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v8 = [v7 isInternalInstall];

  if (v8)
  {
    long long v9 = [v3 debugDescription];
    [MEMORY[0x1E4F6E700] setReindexingSuspensionReason:v9];
  }
  uint64_t v10 = +[IMSpotlightEventNotifier sharedNotifier];
  [v10 reindexSuspendedUntilDate:v6 withError:v3];
}

- (BOOL)_shouldBypassForTesting
{
  return 0;
}

- (void)_setNeedsIndexing:(BOOL)a3
{
  IMSetDomainBoolForKey();
  if (!a3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    IMSetDomainValueForKey();
  }
}

- (void)_setNeedsDeferredIndexing:(BOOL)a3
{
}

- (BOOL)_shouldIndexNextBatchForBatchSize:(unint64_t)a3
{
  if (!a3 || ![MEMORY[0x1E4F6E700] needsIndexing]) {
    return 0;
  }
  return IMDSystemMigrationOccurred();
}

- (BOOL)_shouldSkipMessagePartPrefixingForItemDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"associatedMessageType"];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 integerValue] == 2007;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isMessagesAppDeletionEnabled];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Deleting all spotlight data because the app is being uninstalled.", buf, 2u);
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1AFBE3898;
    v8[3] = &unk_1E5F8FD28;
    v8[4] = self;
    id v9 = v4;
    sub_1AFBD5444(v8);
  }
}

- (unint64_t)_batchSizeForTargetBatchSize:(unint64_t)a3 lastIndexedRowID:(unint64_t)a4 lastBatch:(BOOL *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t result = a3;
  if (a4 < a3)
  {
    int v9 = IMOSLoggingEnabled();
    unint64_t result = a4;
    if (v9)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        unint64_t v12 = a4;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Reducing batch size to %lu, last batch?", (uint8_t *)&v11, 0xCu);
      }

      unint64_t result = a4;
    }
  }
  if (a5) {
    *a5 = a4 < a3;
  }
  return result;
}

- (void)setBlocklistMessageGUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocklistMessageGUIDs, 0);
  objc_storeStrong((id *)&self->_backpressureController, 0);
}

@end