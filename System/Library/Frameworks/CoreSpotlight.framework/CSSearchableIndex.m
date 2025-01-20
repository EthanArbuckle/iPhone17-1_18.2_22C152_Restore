@interface CSSearchableIndex
+ (BOOL)activityShouldBeIndexed:(id)a3 bundleID:(id)a4;
+ (BOOL)isIndexingAvailable;
+ (CSSearchableIndex)defaultSearchableIndex;
+ (NSArray)allSupportedProtectionClasses;
+ (double)lastUpdateTime;
+ (id)codedIdentifiers:(id)a3;
+ (id)codedNSUAPersistentIdentifiers:(id)a3;
+ (id)codedUniqueIdentifiers:(id)a3;
+ (id)computePartialPathWithOID:(id)a3 pathKeyIdx:(unint64_t)a4 pathDictionary:(id)a5 attributeValues:(id)a6 depth:(int64_t)a7;
+ (id)mainBundleID;
+ (id)mainBundleLocalizedString;
+ (id)partialPathAttributes;
+ (void)_setLastUpdateTime;
+ (void)initialize;
+ (void)notifyIndexDelegates;
+ (void)setConnectionName:(id)a3;
+ (void)volumeMountedAtURL:(id)a3 withOptions:(id)a4;
- (BOOL)batchOpen;
- (BOOL)isEmbeddingVersionCurrent:(id)a3 error:(id *)a4;
- (BOOL)noBatching;
- (CSIndexConnection)connection;
- (CSIndexingQueue)activityQueue;
- (CSSearchableIndex)init;
- (CSSearchableIndex)initWithName:(NSString *)name;
- (CSSearchableIndex)initWithName:(NSString *)name protectionClass:(NSFileProtectionType)protectionClass;
- (CSSearchableIndex)initWithName:(id)a3 bundleIdentifier:(id)a4;
- (CSSearchableIndex)initWithName:(id)a3 options:(int64_t)a4;
- (CSSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5;
- (NSMutableArray)batchedItemIdentifiersToDelete;
- (NSMutableArray)batchedItemsToIndex;
- (NSNumber)indexID;
- (NSString)bundleIdentifier;
- (NSString)name;
- (NSString)protectionClass;
- (OS_dispatch_queue)delegateQueue;
- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6;
- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6 disableBatching:(BOOL)a7;
- (id)_itemsBySanitizingItemsForSpotlight:(id)a3;
- (id)_validateClientState:(id)a3;
- (id)_validateOperation;
- (id)_validateOperationWithIdentifiers:(id)a3;
- (id)_validateOperationWithItems:(id)a3;
- (id)_validateOperationWithItems:(id)a3 identifiers:(id)a4;
- (id)criticalQueue;
- (id)description;
- (id)indexDelegate;
- (id)requestQueue;
- (id)throttleQueue;
- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4;
- (int64_t)_standardizeItems:(id)a3;
- (int64_t)options;
- (void)_bulkFetchPartialPathsForObjects:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 completionHandler:(id)a6;
- (void)_changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forUser:(unsigned int)a5 forBundleID:(id)a6 forUTIType:(id)a7;
- (void)_commonInit;
- (void)_delegateCheckIn:(id)a3;
- (void)_deleleActionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)_deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4;
- (void)_fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)bundleIdentifier items:(id)a6 includeParents:(BOOL)a7 options:(int64_t)a8 completionHandler:(id)a9;
- (void)_fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)bundleIdentifier items:(id)a5 completionHandler:(id)a6;
- (void)_indexActivities:(id)a3 flush:(BOOL)a4;
- (void)_issueCommand:(id)a3 completionHandler:(id)a4;
- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)_issueNonLaunchingCommand:(id)a3;
- (void)_makeActivityQueueIfNecessary;
- (void)_openJournalFile:(id)a3 completionHandler:(id)a4;
- (void)_photosLibraryDeleted:(id)a3 completionHandler:(id)a4;
- (void)_setUser:(unsigned int)a3;
- (void)addInteraction:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6;
- (void)addInteraction:(id)a3 completionHandler:(id)a4;
- (void)beginIndexBatch;
- (void)bulkFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 objects:(id)a6 attributeKeyIndex:(int64_t)a7 includeParents:(BOOL)a8 completionHandler:(id)a9;
- (void)bulkFetchCacheFileDescriptorForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4;
- (void)dealloc;
- (void)deleteAllInteractionsWithBundleID:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5;
- (void)deleteAllInteractionsWithCompletionHandler:(id)a3;
- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4;
- (void)deleteAllSearchableItemsWithCompletionHandler:(void *)completionHandler;
- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteAllSearchableItemsWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)deleteAllUserActivities:(id)bundleIdentifier completionHandler:(id)a4;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6;
- (void)deleteInteractionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsSinceDate:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithDomainIdentifiers:(NSArray *)domainIdentifiers completionHandler:(void *)completionHandler;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 reason:(int64_t)a7 completionHandler:(id)a8;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)deleteSearchableItemsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5;
- (void)donateRelevantActions:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5;
- (void)endIndexBatchWithClientState:(NSData *)clientState completionHandler:(void *)completionHandler;
- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 completionHandler:(id)a5;
- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 reason:(int64_t)a5 completionHandler:(id)a6;
- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 completionHandler:(id)a5;
- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 completionHandler:(id)a6;
- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchDataForBundleIdentifier:(NSString *)bundleIdentifier itemIdentifier:(NSString *)itemIdentifier contentType:(UTType *)contentType completionHandler:(void *)completionHandler;
- (void)fetchLastClientStateWithCompletionHandler:(void *)completionHandler;
- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)finishIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5;
- (void)flushUserActivities;
- (void)indexSearchableItems:(NSArray *)items completionHandler:(void *)completionHandler;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 completionHandler:(id)a6;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 reason:(int64_t)a11 completionHandler:(id)a12;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 reason:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7;
- (void)indexSearchableItems:(id)a3 returningItemsSanitizedForSpotlightTo:(id)a4;
- (void)indexUserActivity:(id)a3;
- (void)issueCacheCommand:(id)a3 completionHandler:(id)a4;
- (void)performDataMigrationWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)prepareIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6;
- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6;
- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 completionHandler:(id)a7;
- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6;
- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 completionHandler:(id)a8;
- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)provideFileURLsForBundle:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)setBatchOpen:(BOOL)a3;
- (void)setBatchedItemIdentifiersToDelete:(id)a3;
- (void)setBatchedItemsToIndex:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIndexDelegate:(id)indexDelegate;
- (void)setName:(id)a3;
- (void)setNoBatching:(BOOL)a3;
- (void)setOptions:(int64_t)a3;
- (void)setProtectionClass:(id)a3;
- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7;
- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)throttle;
- (void)transferDeletionJournalsForProtectionClass:(id)a3 toDirectory:(id)a4 completionHandler:(id)a5;
- (void)unthrottle;
- (void)updateCorrectionsWithFilePath:(id)a3 completionHandler:(id)a4;
- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)willModifySearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
@end

@implementation CSSearchableIndex

- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6
{
  return [(CSSearchableIndex *)self _initWithName:a3 protectionClass:a4 bundleIdentifier:a5 options:a6 disableBatching:0];
}

uint64_t __43__CSSearchableIndex_defaultSearchableIndex__block_invoke()
{
  defaultSearchableIndex_sDefaultInstance = [[CSSearchableIndex alloc] _initWithName:@"CSSearchableIndexShared" protectionClass:0 bundleIdentifier:0 options:0 disableBatching:1];

  return MEMORY[0x1F41817F8]();
}

- (id)_initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5 options:(int64_t)a6 disableBatching:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CSSearchableIndex;
  v15 = [(CSSearchableIndex *)&v24 init];
  v16 = v15;
  if (v15)
  {
    if (v12)
    {
      uint64_t v17 = [v12 copy];
      name = v16->_name;
      v16->_name = (NSString *)v17;
    }
    else
    {
      name = v15->_name;
      v15->_name = (NSString *)&stru_1EDBB3A50;
    }

    uint64_t v19 = [v14 copy];
    bundleIdentifier = v16->_bundleIdentifier;
    v16->_bundleIdentifier = (NSString *)v19;

    if (v13)
    {
      uint64_t v21 = CSSanitizeProtectionClass(v13);
      protectionClass = v16->_protectionClass;
      v16->_protectionClass = (NSString *)v21;
    }
    v16->_options = a6;
    v16->_noBatching = a7;
    [(CSSearchableIndex *)v16 _commonInit];
  }

  return v16;
}

- (void)_commonInit
{
  self->_batchOpen = 0;
  atomic_fetch_add(_commonInit_sCSSearchableIndexID, 1u);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  indexID = self->_indexID;
  self->_indexID = v3;

  id obj = (id)sIndexMap;
  objc_sync_enter(obj);
  [(id)sIndexMap setObject:self forKey:self->_indexID];
  objc_sync_exit(obj);
}

- (CSSearchableIndex)initWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:a3 protectionClass:a4 bundleIdentifier:a5 options:0];
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v38 = v2;
LABEL_4:
    uint64_t v3 = *(void *)(v1 + 112);
    v4 = +[CSPowerLog sharedInstance];
    objc_msgSend(v4, "logWithBundleID:indexOperation:itemCount:code:", v38, 1, objc_msgSend(*(id *)(a1 + 48), "count"), v3);

    v5 = +[CSPowerLog sharedInstance];
    uint64_t v1 = a1;
    objc_msgSend(v5, "logWithBundleID:indexOperation:itemCount:code:", v38, 2, objc_msgSend(*(id *)(a1 + 56), "count"), v3);

    goto LABEL_5;
  }
  id v38 = [(id)objc_opt_class() mainBundleID];
  uint64_t v1 = a1;
  if (v38) {
    goto LABEL_4;
  }
  id v38 = 0;
LABEL_5:
  v43 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:*(void *)(v1 + 56)];
  v6 = [v43 allObjects];
  v37 = +[CSSearchableIndex codedIdentifiers:v6];

  v7 = (CSCoder *)[*(id *)(a1 + 48) count];
  v35 = v7;
  if (v7)
  {
    v40 = objc_alloc_init(CSCoder);
    [(CSCoder *)v40 beginArray];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v9)
    {
      v42 = 0;
      v10 = 0;
      uint64_t v11 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "uniqueIdentifier", v35);
          if (([v43 containsObject:v14] & 1) == 0)
          {
            v15 = [v13 attributeSet];
            v16 = [v15 HTMLContentData];

            if (v16)
            {
              uint64_t v17 = [v13 attributeSet];
              [v17 setAttribute:0 forKey:@"kMDItemHTMLContentData"];

              if ([v16 length])
              {
                v18 = v42;
                if (!v42)
                {
                  uint64_t v19 = objc_alloc_init(CSCoder);
                  [(CSCoder *)v19 beginArray];
                  [(CSCoder *)v19 encodeObject:@"contentHTML"];
                  [(CSCoder *)v19 beginDictionary];
                  v18 = v19;
                }
                v42 = v18;
                [(CSCoder *)v18 encodeObject:v14];
                [(CSCoder *)v42 encodeObject:v16];
              }
            }
            v20 = [v13 attributeSet];
            uint64_t v21 = [v20 textContent];

            if (v21)
            {
              v22 = [v13 attributeSet];
              [v22 setAttribute:0 forKey:@"kMDItemTextContent"];

              if ([v21 length])
              {
                if (!v10)
                {
                  v10 = objc_alloc_init(CSCoder);
                  [(CSCoder *)v10 beginArray];
                  [(CSCoder *)v10 encodeObject:@"contentText"];
                  [(CSCoder *)v10 beginDictionary];
                }
                [(CSCoder *)v10 encodeObject:v14];
                [(CSCoder *)v10 encodeObject:v21];
              }
            }
            v23 = [v13 attributeSet];
            [(CSCoder *)v40 encodeObject:v23];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v65 count:16];
      }
      while (v9);
    }
    else
    {
      v42 = 0;
      v10 = 0;
    }

    [(CSCoder *)v40 endArray];
    [(CSCoder *)v42 endDictionary];
    [(CSCoder *)v42 endArray];
    [(CSCoder *)v10 endDictionary];
    [(CSCoder *)v10 endArray];
    v7 = v40;
  }
  else
  {
    v42 = 0;
    v10 = 0;
  }
  v60 = 0;
  v41 = v7;
  [(CSCoder *)v7 plistContainer];
  objc_super v24 = (void *)_MDPlistContainerCopyDispatchData();
  v59 = 0;
  [(CSCoder *)v10 plistContainer];
  v25 = (void *)_MDPlistContainerCopyDispatchData();
  v58 = 0;
  [(CSCoder *)v42 plistContainer];
  v26 = (void *)_MDPlistContainerCopyDispatchData();
  v57 = 0;
  [v37 plistContainer];
  v27 = (void *)_MDPlistContainerCopyDispatchData();
  v28 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 40) label:@"index-items" critical:(*(void *)(a1 + 120) >> 5) & 1];
  id location = 0;
  objc_initWeak(&location, v28);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  v44[3] = &unk_1E5549BC0;
  v44[4] = *(void *)(a1 + 40);
  id v45 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 72);
  v30 = *(void **)(a1 + 120);
  id v46 = v29;
  v54[1] = v30;
  id v31 = v24;
  id v47 = v31;
  v54[2] = v60;
  id v32 = v25;
  id v48 = v32;
  v54[3] = v59;
  id v33 = v26;
  id v49 = v33;
  v54[4] = v58;
  id v34 = v27;
  id v50 = v34;
  v54[5] = v57;
  id v51 = *(id *)(a1 + 80);
  id v52 = *(id *)(a1 + 88);
  v54[6] = v36;
  char v55 = *(unsigned char *)(a1 + 128);
  id v53 = *(id *)(a1 + 96);
  objc_copyWeak(v54, &location);
  [(CSSearchableIndexRequest *)v28 setPerformBlock:v44];
  [(CSSearchableIndexRequest *)v28 setCompletionBlock:*(void *)(a1 + 104)];
  [(CSSearchableIndexRequest *)v28 start];
  objc_destroyWeak(v54);

  objc_destroyWeak(&location);
}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-domains"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  uint64_t v11 = &unk_1E5549C60;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v4 = *(id *)(a1 + 48);
  v5 = *(void **)(a1 + 72);
  id v14 = v4;
  v16[1] = v5;
  id v6 = *(id *)(a1 + 56);
  v7 = *(void **)(a1 + 80);
  id v15 = v6;
  v16[2] = v7;
  objc_copyWeak(v16, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v8];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 64), v8, v9, v10, v11, v12);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
}

+ (id)codedIdentifiers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(CSCoder);
    [(CSCoder *)v4 beginArray];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          -[CSCoder encodeObject:](v4, "encodeObject:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(CSCoder *)v4 endArray];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7
{
}

- (void)fetchLastClientStateWithCompletionHandler:(void *)completionHandler
{
}

void __39__CSSearchableIndex__standardizeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = v3;
  if ((*(unsigned char *)(*(void *)(v4 + 8) + 25) & 1) == 0)
  {
    int v5 = [v3 isUpdate];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v5)
    {
      *(void *)(*(void *)(v4 + 8) + 24) |= 0x100uLL;
      uint64_t v4 = *(void *)(a1 + 40);
    }
  }
  if ((*(unsigned char *)(*(void *)(v4 + 8) + 25) & 0x80) == 0 && ([v10 isAppEntity] & 1) == 0)
  {
    uint64_t v6 = [v10 attributeSet];
    uint64_t v7 = [v6 appEntityType];

    if (v7)
    {
      [v10 setIsAppEntity:1];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x8000uLL;
    }
  }
  uint64_t v8 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v9 = [*(id *)(a1 + 32) protectionClass];
  [v10 standardizeAttributesForBundle:v8 protectionClass:v9];
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (void)dealloc
{
  id v3 = (id)sIndexMap;
  objc_sync_enter(v3);
  [(id)sIndexMap removeObjectForKey:self->_indexID];
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)CSSearchableIndex;
  [(CSSearchableIndex *)&v4 dealloc];
}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = [v5 data];
    if ([v8 length])
    {
      uint64_t v9 = [v6 data];
      id v10 = (void *)[v9 copy];
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v10, v11);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v11);
    }
  }
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"client-state-key" sizeKey:"client-state-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sCSSearchableIndexAvailableRequestCount = 4;
    sIndexMap = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:5 capacity:0];
    MEMORY[0x1F41817F8]();
  }
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!self->_batchOpen) {
    [MEMORY[0x1E4F1CA00] raise:@"No open batch" format:@"There is no batch open"];
  }
  id v15 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:]();
  }

  uint64_t v16 = self;
  objc_sync_enter(v16);
  uint64_t v17 = v16->_batchedItemsToIndex;
  v18 = v16->_batchedItemIdentifiersToDelete;
  batchedItemsToIndex = v16->_batchedItemsToIndex;
  v16->_batchedItemsToIndex = 0;

  batchedItemIdentifiersToDelete = v16->_batchedItemIdentifiersToDelete;
  v16->_batchedItemIdentifiersToDelete = 0;

  objc_sync_exit(v16);
  self->_batchOpen = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke;
  v26[3] = &unk_1E5549B48;
  v26[4] = v16;
  v27 = v17;
  v28 = v18;
  id v29 = v13;
  BOOL v33 = a5;
  id v31 = v14;
  int64_t v32 = a6;
  id v30 = v12;
  id v21 = v14;
  id v22 = v12;
  id v23 = v13;
  objc_super v24 = v18;
  v25 = v17;
  _os_activity_initiate(&dword_18D0E3000, "end-index-batch", OS_ACTIVITY_FLAG_DEFAULT, v26);
}

void __46__CSSearchableIndex_mainBundleLocalizedString__block_invoke()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleURL];

  if (v1)
  {
    v10[0] = *MEMORY[0x1E4F1CE88];
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v9 = 0;
    id v3 = [v1 resourceValuesForKeys:v2 error:&v9];
    id v4 = v9;
    if (!v4 && [v2 count])
    {
      id v5 = [v2 objectAtIndexedSubscript:0];
      id v6 = [v3 objectForKeyedSubscript:v5];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
      {
        uint64_t v7 = [[CSLocalizedString alloc] initWithLocalizedStrings:v6];
        uint64_t v8 = (void *)mainBundleLocalizedString_sMainBundleLocalizedString;
        mainBundleLocalizedString_sMainBundleLocalizedString = (uint64_t)v7;
      }
    }
  }
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2_204(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if ((*(unsigned char *)(a1 + 48) & 0x20) != 0)
  {
    id v3 = [v2 criticalQueue];
    [v3 async:*(void *)(a1 + 40) critical:1];
  }
  else
  {
    id v3 = [v2 throttleQueue];
    [v3 async:*(void *)(a1 + 40)];
  }
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = (NSString *)a4;
  id v14 = a5;
  id v15 = a7;
  bundleIdentifier = v13;
  if (!v13) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  uint64_t v17 = bundleIdentifier;
  v18 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = v17;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_debug_impl(&dword_18D0E3000, v18, OS_LOG_TYPE_DEBUG, "(%@) fetchLastClientStateWithProtectionClass, clientStateName:%@, protectionClass:%@, options:0x%lx", buf, 0x2Au);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549E90;
  activity_block[4] = self;
  objc_super v24 = v13;
  id v25 = v12;
  id v26 = v14;
  id v27 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v12;
  id v22 = v13;
  _os_activity_initiate(&dword_18D0E3000, "fetch-last-client-state", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 reason:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = (NSString *)a5;
  uint64_t v17 = (void (**)(id, void *))a8;
  [(id)objc_opt_class() _setLastUpdateTime];
  bundleIdentifier = v16;
  if (!v16) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v19 = bundleIdentifier;
  id v20 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v19;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2048;
    uint64_t v41 = [v14 count];
    _os_log_impl(&dword_18D0E3000, v20, OS_LOG_TYPE_DEFAULT, "(%@) deleteSearchableItemsWithDomainIdentifiers, protectionClass:%@, domainIdentifiers number:%ld", buf, 0x20u);
  }

  id v21 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:]();
  }

  id v22 = +[CSPowerLog sharedInstance];
  objc_msgSend(v22, "logWithBundleID:indexOperation:itemCount:code:", v19, 2, objc_msgSend(v14, "count"), a7);

  id v23 = [(CSSearchableIndex *)self _validateOperationWithIdentifiers:v14];
  if (v23 || ![v14 count])
  {
    if (v17) {
      v17[2](v17, v23);
    }
  }
  else
  {
    int64_t v28 = a6;
    id v29 = +[CSSearchableIndex codedUniqueIdentifiers:v14];
    *(void *)buf = 0;
    [v29 plistContainer];
    objc_super v24 = (void *)_MDPlistContainerCopyDispatchData();
    id v25 = +[CSSearchableIndex defaultSearchableIndex];
    id v26 = [v25 activityQueue];
    [v26 flush];

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke;
    activity_block[3] = &unk_1E5549CB0;
    activity_block[4] = self;
    id v31 = v16;
    id v32 = v15;
    id v33 = v24;
    int64_t v35 = v28;
    uint64_t v36 = *(void *)buf;
    __int16 v34 = v17;
    id v27 = v24;
    _os_activity_initiate(&dword_18D0E3000, "delete-domains", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

+ (CSSearchableIndex)defaultSearchableIndex
{
  if (defaultSearchableIndex_onceToken != -1) {
    dispatch_once(&defaultSearchableIndex_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)defaultSearchableIndex_sDefaultInstance;

  return (CSSearchableIndex *)v2;
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 clientStateName:(id)a7 protectionClass:(id)a8 forBundleID:(id)a9 options:(int64_t)a10 reason:(int64_t)a11 completionHandler:(id)a12
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v46 = a8;
  id v23 = (NSString *)a9;
  objc_super v24 = (void (**)(id, void *))a12;
  [(id)objc_opt_class() _setLastUpdateTime];
  bundleIdentifier = v23;
  if (!v23) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v26 = bundleIdentifier;
  id v27 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138414338;
    v65 = v26;
    __int16 v66 = 2112;
    id v67 = v22;
    __int16 v68 = 2048;
    uint64_t v69 = [v20 length];
    __int16 v70 = 2112;
    id v71 = v46;
    __int16 v72 = 2048;
    uint64_t v73 = [v18 count];
    __int16 v74 = 2112;
    id v75 = v18;
    __int16 v76 = 2048;
    uint64_t v77 = [v19 count];
    __int16 v78 = 2112;
    id v79 = v19;
    __int16 v80 = 2048;
    int64_t v81 = a10;
    _os_log_debug_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_DEBUG, "(%@) indexSearchableItems, clientState:%@/%lu, protectionClass:%@, items/%ld:%@, deleteIdentifiers/%ld:%@, options:0x%lx", buf, 0x5Cu);
  }

  int64_t v28 = [(CSSearchableIndex *)self _validateOperationWithItems:v18 identifiers:v19];
  if (v28
    || ([(CSSearchableIndex *)self _validateClientState:v20],
        (int64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v24) {
      v24[2](v24, v28);
    }
  }
  else
  {
    if ([v18 count] || (uint64_t v39 = objc_msgSend(v19, "count"), v20) || v39)
    {
      if ([v19 count])
      {
        id v29 = +[CSSearchableIndex defaultSearchableIndex];
        [v29 activityQueue];
        id v43 = v22;
        id v31 = v30 = v21;
        [v31 flush];

        id v21 = v30;
        id v22 = v43;
      }
      id v32 = CS_simplifyItemArray(v18);

      if ([(id)sConnectionName isEqualToString:@"com.apple.spotlight.IndexAgent"]) {
        [(CSSearchableIndex *)self _setMailMessageAttributes:v32];
      }
      v44 = v21;
      int64_t v33 = a11;
      [(CSSearchableIndex *)self _setFPAttributes:v32];
      objc_opt_class();
      char v42 = objc_opt_isKindOfClass() & 1;
      if (v42)
      {
        uint64_t v41 = 0;
      }
      else
      {
        __int16 v34 = [MEMORY[0x1E4FB36F8] sharedManager];
        [v34 currentPersona];
        v36 = int64_t v35 = v32;
        uint64_t v41 = (void *)[v36 copyCurrentPersonaContextWithError:0];

        id v32 = v35;
        int64_t v33 = a11;
      }
      int64_t v40 = [(CSSearchableIndex *)self _standardizeItems:v32] | a10;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5549BE8;
      id v51 = v26;
      id v52 = self;
      int64_t v61 = v33;
      id v18 = v32;
      id v53 = v18;
      id v54 = v19;
      int64_t v62 = v40;
      char v55 = v23;
      id v56 = v46;
      id v57 = v20;
      char v63 = v42;
      id v58 = v44;
      id v59 = v41;
      v60 = v24;
      id v45 = v41;
      v37 = _Block_copy(aBlock);
      activity_block[0] = MEMORY[0x1E4F143A8];
      activity_block[1] = 3221225472;
      activity_block[2] = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2_204;
      activity_block[3] = &unk_1E5549C10;
      id v48 = v37;
      int64_t v49 = v40;
      activity_block[4] = self;
      id v38 = v37;
      _os_activity_initiate(&dword_18D0E3000, "index-items", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

      id v21 = v44;
    }
    else if (v24)
    {
      v24[2](v24, 0);
    }
    int64_t v28 = 0;
  }
}

void __39__CSSearchableIndex_indexUserActivity___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = +[CSSearchableItem searchableItemFromUserActivity:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40)];
  id v3 = +[CSUserAction actionFromUserActivity:*(void *)(a1 + 32) searchableItem:v2];
  if (v2)
  {
    id v4 = *(void **)(a1 + 48);
    v13[0] = v2;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v6 = [v4 _validateOperationWithItems:v5];

    if (v6) {
      goto LABEL_9;
    }
    uint64_t v7 = *(void **)(a1 + 48);
    id v12 = v2;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v7 _standardizeItems:v8];
  }
  id v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __39__CSSearchableIndex_indexUserActivity___block_invoke_cold_1();
  }

  if (v2 && v3)
  {
    id v10 = [*(id *)(a1 + 48) activityQueue];
    id v11 = [[CSUserActivityTuple alloc] initWithAction:v3 item:v2];
    [v10 queueItem:v11];
  }
LABEL_9:
}

- (id)_validateOperationWithItems:(id)a3 identifiers:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(id)objc_opt_class() isIndexingAvailable] & 1) == 0)
  {
    id v9 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.6();
    }

    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -1005;
    goto LABEL_12;
  }
  if ((unint64_t)[v6 count] >= 0x8000)
  {
    uint64_t v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex _validateOperationWithItems:identifiers:](v6);
    }
LABEL_11:

    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = -1001;
LABEL_12:
    id v12 = [v10 errorWithDomain:@"CSIndexErrorDomain" code:v11 userInfo:0];
    goto LABEL_13;
  }
  if ((unint64_t)[v7 count] >= 0x10000)
  {
    uint64_t v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex _validateOperationWithItems:identifiers:](v7);
    }
    goto LABEL_11;
  }
  id v14 = self->_protectionClass;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
LABEL_18:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v40 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
      id v20 = [v19 protection];
      id v21 = v20;
      BOOL v22 = !v20 || v14 == 0;
      if (!v22 && ([v20 isEqualToString:v14] & 1) == 0) {
        break;
      }
      id v23 = [v19 uniqueIdentifier];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![v23 length]
        || (unint64_t)[v23 length] >= 0x1000)
      {
        id v30 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.4();
        }

        id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1001 userInfo:0];
LABEL_47:

LABEL_48:
        goto LABEL_52;
      }
      objc_super v24 = [v19 domainIdentifier];
      if (v24)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v32 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v24;
            _os_log_error_impl(&dword_18D0E3000, v32, OS_LOG_TYPE_ERROR, "Domain identifier %@ isn't a string", buf, 0xCu);
          }

          id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1001 userInfo:0];

          goto LABEL_47;
        }
      }

      if (v16 == ++v18)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v16) {
          goto LABEL_18;
        }
        goto LABEL_33;
      }
    }
    int64_t v33 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex _validateOperationWithItems:identifiers:].cold.5();
    }

    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1001 userInfo:0];
    goto LABEL_48;
  }
LABEL_33:

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v7;
  uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ![v29 length]
          || (unint64_t)[v29 length] >= 0x1000)
        {
          id v31 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[CSSearchableIndex _validateOperationWithItems:identifiers:]();
          }

          id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1001 userInfo:0];
          goto LABEL_52;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_52:

LABEL_13:

  return v12;
}

+ (BOOL)isIndexingAvailable
{
  return 1;
}

- (int64_t)_standardizeItems:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CSSearchableIndex__standardizeItems___block_invoke;
  v7[3] = &unk_1E5549C88;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateObjectsWithOptions:1 usingBlock:v7];
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (CSIndexingQueue)activityQueue
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activityQueue;
  objc_sync_exit(v2);

  return v3;
}

- (id)_validateOperationWithItems:(id)a3
{
  return [(CSSearchableIndex *)self _validateOperationWithItems:a3 identifiers:0];
}

- (void)indexUserActivity:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 count];

  id v7 = [(id)objc_opt_class() mainBundleID];
  int v8 = [v4 isEligibleForSearch];
  id v9 = [v4 contentAttributeSet];
  uint64_t v10 = [v9 bundleID];

  if (![v10 length] || (objc_msgSend(v7, "isEqualToString:", v10) & 1) != 0) {
    goto LABEL_5;
  }
  if (hasInternalCSEntitlement())
  {
    id v11 = v10;

    id v7 = v11;
LABEL_5:
    int v12 = [(id)objc_opt_class() activityShouldBeIndexed:v4 bundleID:v7];
    id v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = @"YES";
      if (v6) {
        uint64_t v15 = @"YES";
      }
      else {
        uint64_t v15 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      objc_super v24 = v15;
      if (v8) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      if (!v12) {
        id v14 = @"NO";
      }
      int64_t v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_INFO, "Indexing UA, hasUserInfo:%@, eligibleForSearch:%@, shouldBeIndexed:%@, bundleID:%@,", buf, 0x2Au);
    }

    [(CSSearchableIndex *)self _makeActivityQueueIfNecessary];
    uint64_t v17 = [(CSSearchableIndex *)self throttleQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __39__CSSearchableIndex_indexUserActivity___block_invoke;
    v19[3] = &unk_1E5549900;
    id v20 = v4;
    id v7 = v7;
    id v21 = v7;
    BOOL v22 = self;
    [v17 async:v19];

    uint64_t v18 = v20;
    goto LABEL_16;
  }
  uint64_t v18 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[CSSearchableIndex indexUserActivity:]();
  }
LABEL_16:
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"fetch-last-client-state"];
  id location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5549E68;
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  objc_copyWeak(&v10, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_4;
  v4[3] = &unk_1E5549DC8;
  id v5 = *(id *)(a1 + 64);
  [(CSSearchableIndexRequest *)v2 setCompletionDataBlock:v4];
  [(CSSearchableIndexRequest *)v2 start];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)throttleQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__CSSearchableIndex_throttleQueue__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  if (throttleQueue_onceToken != -1) {
    dispatch_once(&throttleQueue_onceToken, block);
  }
  return (id)throttleQueue_sCSSearchableIndexThrottleQueue;
}

+ (id)mainBundleID
{
  if (mainBundleID_onceToken != -1) {
    dispatch_once(&mainBundleID_onceToken, &__block_literal_global_172);
  }
  v2 = (void *)mainBundleID_sMainBundleID;

  return v2;
}

+ (BOOL)activityShouldBeIndexed:(id)a3 bundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 _suggestedActionType] == 1)
  {
    if ([v5 isEligibleForSearch]) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEligibleForPrediction];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_makeActivityQueueIfNecessary
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activityQueue)
  {
    id location = 0;
    objc_initWeak(&location, v2);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __50__CSSearchableIndex__makeActivityQueueIfNecessary__block_invoke;
    int v12 = &unk_1E5549AD0;
    objc_copyWeak(&v13, &location);
    id v3 = (void *)[&v9 copy];
    BOOL v4 = +[CoreSpotlightUtils fastUserActivites];
    id v5 = [CSIndexingQueue alloc];
    double v6 = 30.0;
    if (v4) {
      double v6 = 1.0;
    }
    uint64_t v7 = -[CSIndexingQueue initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:](v5, "initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:", 60, 2, v3, v6);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (CSIndexingQueue *)v7;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

+ (id)mainBundleLocalizedString
{
  if (mainBundleLocalizedString_onceToken != -1) {
    dispatch_once(&mainBundleLocalizedString_onceToken, &__block_literal_global_175);
  }
  v2 = (void *)mainBundleLocalizedString_sMainBundleLocalizedString;

  return v2;
}

+ (void)_setLastUpdateTime
{
  id obj = a1;
  objc_sync_enter(obj);
  sCSSearchableIndexLastUpdateTime = CFAbsoluteTimeGetCurrent();
  objc_sync_exit(obj);
}

- (id)_validateClientState:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && (unint64_t)[v3 length] >= 0x401)
  {
    id v5 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex _validateClientState:](v4, v5);
    }

    double v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1002 userInfo:0];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_validateOperationWithIdentifiers:(id)a3
{
  return [(CSSearchableIndex *)self _validateOperationWithItems:0 identifiers:a3];
}

+ (id)codedUniqueIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
    id v5 = objc_alloc_init(CSCoder);
    [(CSCoder *)v5 beginArray];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[CSCoder encodeObject:](v5, "encodeObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(CSCoder *)v5 endArray];
  }
  else
  {
    id v6 = 0;
    id v5 = 0;
  }

  return v5;
}

- (void)_issueNonLaunchingCommand:(id)a3
{
  id v7 = a3;
  BOOL v4 = +[CSIndexDelegateConnection sharedConnectionForUser:self->_user];
  id v5 = v4;
  if (v4)
  {
    id v6 = -[CSSearchableIndex xpc_dictionary_for_command:requiresInitialization:](self, "xpc_dictionary_for_command:requiresInitialization:", "issue", [v4 previouslyInitialized] ^ 1);
    xpc_dictionary_set_string(v6, "request", (const char *)[v7 UTF8String]);
    [v5 sendMessageAsync:v6];
  }
}

void __33__CSSearchableIndex_mainBundleID__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  v2 = (void *)mainBundleID_sMainBundleID;
  mainBundleID_sMainBundleID = v1;

  id v3 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __33__CSSearchableIndex_mainBundleID__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void __34__CSSearchableIndex_throttleQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 _throttleIfNecessary];
  [v2 _perform];
}

- (void)unthrottle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 throttleQueue];
  [v3 label];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_18D0E3000, a2, v4, "Resumed \"%s\"", v5);
}

- (void)throttle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 throttleQueue];
  [v3 label];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_18D0E3000, a2, v4, "Suspended \"%s\"", v5);
}

- (id)requestQueue
{
  if (requestQueue_onceToken != -1) {
    dispatch_once(&requestQueue_onceToken, &__block_literal_global_89);
  }
  id v2 = (void *)requestQueue_sCSSearchableIndexRequestQueue;

  return v2;
}

void __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-domains", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_uint64(v3, "opt", *(void *)(a1 + 72));
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 56), "ids-size", *(void *)(a1 + 80));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __125__CSSearchableIndex_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) connection];
  uint64_t v4 = objc_msgSend(*v2, "xpc_dictionary_for_command:requiresInitialization:", "process-index-data", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  uint64_t v5 = *(void **)(a1 + 40);
  if (v5) {
    xpc_dictionary_set_string(v4, "b", (const char *)[v5 UTF8String]);
  }
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6) {
    xpc_dictionary_set_string(v4, "pc", (const char *)[v6 UTF8String]);
  }
  xpc_dictionary_set_uint64(v4, "opt", *(void *)(a1 + 120));
  add_dispatch_data_to_xpc_dict(v4, "items", *(NSObject **)(a1 + 56), "items-size", *(void *)(a1 + 128));
  add_dispatch_data_to_xpc_dict(v4, "textdata", *(NSObject **)(a1 + 64), "text-data-size", *(void *)(a1 + 136));
  add_dispatch_data_to_xpc_dict(v4, "htmldata", *(NSObject **)(a1 + 72), "html-data-size", *(void *)(a1 + 144));
  add_dispatch_data_to_xpc_dict(v4, "ids", *(NSObject **)(a1 + 80), "ids-size", *(void *)(a1 + 152));
  id v7 = *(void **)(a1 + 88);
  if (v7) {
    xpc_dictionary_set_data(v4, "client-state-key", (const void *)[v7 bytes], objc_msgSend(*(id *)(a1 + 88), "length"));
  }
  uint64_t v8 = *(void **)(a1 + 96);
  if (v8) {
    xpc_dictionary_set_data(v4, "expected-client-state-key", (const void *)[v8 bytes], objc_msgSend(*(id *)(a1 + 96), "length"));
  }
  uint64_t v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = *(void *)(a1 + 160);
    uint64_t v21 = *(void *)(a1 + 136) + *(void *)(a1 + 128) + *(void *)(a1 + 144);
    *(_DWORD *)buf = 134218240;
    uint64_t v29 = v20;
    __int16 v30 = 2048;
    uint64_t v31 = v21;
    _os_log_debug_impl(&dword_18D0E3000, v9, OS_LOG_TYPE_DEBUG, "index items: %ld, bytes: %ld", buf, 0x16u);
  }

  if (*(unsigned char *)(a1 + 168))
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB36F8] sharedManager];
    long long v12 = [v11 currentPersona];
    uint64_t v10 = (void *)[v12 copyCurrentPersonaContextWithError:0];

    long long v13 = [MEMORY[0x1E4FB36F8] sharedManager];
    long long v14 = [v13 currentPersona];
    id v15 = (id)[v14 restorePersonaWithSavedPersonaContext:*(void *)(a1 + 104)];
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  objc_super v24 = __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_203;
  __int16 v25 = &unk_1E5549B98;
  id v16 = v4;
  id v26 = v16;
  objc_copyWeak(&v27, (id *)(a1 + 112));
  [v3 sendMessageAsync:v16 completion:&v22];
  if (!*(unsigned char *)(a1 + 168))
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB36F8], "sharedManager", v22, v23, v24, v25, v26);
    uint64_t v18 = [v17 currentPersona];
    id v19 = (id)[v18 restorePersonaWithSavedPersonaContext:v10];
  }
  objc_destroyWeak(&v27);
}

void __38__CSSearchableIndex__delegateCheckIn___block_invoke(uint64_t a1)
{
  id v2 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __38__CSSearchableIndex__delegateCheckIn___block_invoke_cold_1(a1, v2);
  }

  id v3 = +[CSIndexDelegateConnection sharedConnectionForUser:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "xpc_dictionary_for_command:requiresInitialization:", "check-in", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    xpc_dictionary_set_string(v4, "r", (const char *)[v5 UTF8String]);
  }
  [v3 sendMessageAsync:v4];
}

void __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "fetch-client-state", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  uint64_t v6 = *(void **)(a1 + 56);
  if (v6) {
    xpc_dictionary_set_string(v3, "client-state-name", (const char *)[v6 UTF8String]);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __115__CSSearchableIndex_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke_3;
  v7[3] = &unk_1E5549C38;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v7];
  objc_destroyWeak(&v8);
}

- (id)xpc_dictionary_for_command:(const char *)a3 requiresInitialization:(BOOL)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "command-type", "index-type");
  xpc_dictionary_set_string(v6, "command", a3);
  xpc_dictionary_set_uint64(v6, "id", [(NSNumber *)self->_indexID integerValue]);
  name = self->_name;
  if (name) {
    xpc_dictionary_set_string(v6, "n", [(NSString *)name UTF8String]);
  }
  protectionClass = self->_protectionClass;
  if (protectionClass) {
    xpc_dictionary_set_string(v6, "ipc", [(NSString *)protectionClass UTF8String]);
  }
  xpc_dictionary_set_uint64(v6, "iopt", self->_options);

  return v6;
}

- (CSIndexConnection)connection
{
  return (CSIndexConnection *)+[CSIndexConnection sharedConnectionForUser:self->_user];
}

- (CSSearchableIndex)initWithName:(NSString *)name protectionClass:(NSFileProtectionType)protectionClass
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:name protectionClass:protectionClass bundleIdentifier:0 options:0];
}

void __34__CSSearchableIndex_throttleQueue__block_invoke(uint64_t a1)
{
  id v2 = [CSRequestQueue alloc];
  id v3 = [*(id *)(a1 + 32) requestQueue];
  uint64_t v4 = [(CSRequestQueue *)v2 initWithLabel:"com.apple.spotlight.CoreSpotlight.throttle" target:v3 startBlock:&__block_literal_global_95];
  uint64_t v5 = (void *)throttleQueue_sCSSearchableIndexThrottleQueue;
  throttleQueue_sCSSearchableIndexThrottleQueue = v4;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CSSearchableIndex_throttleQueue__block_invoke_3;
  v6[3] = &unk_1E5549AA8;
  void v6[4] = v7;
  registerForGameModeChange(v6);
  _Block_object_dispose(v7, 8);
}

uint64_t __33__CSSearchableIndex_requestQueue__block_invoke()
{
  requestQueue_sCSSearchableIndexRequestQueue = [[CSRequestQueue alloc] initWithLabel:"com.apple.spotlight.CoreSpotlight.request" target:0 startBlock:&__block_literal_global_92];

  return MEMORY[0x1F41817F8]();
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(NSArray *)domainIdentifiers completionHandler:(void *)completionHandler
{
}

- (void)setIndexDelegate:(id)indexDelegate
{
  id obj = indexDelegate;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_indexDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&v4->_indexDelegate, obj);
    if (obj)
    {
      if (!v4->_delegateQueue)
      {
        xpc_object_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v7 = dispatch_queue_create("com.apple.spotlight.CoreSpotlight.delegate", v6);
        delegateQueue = v4->_delegateQueue;
        v4->_delegateQueue = (OS_dispatch_queue *)v7;
      }
      [(CSSearchableIndex *)v4 _delegateCheckIn:@"set-index-delegate"];
    }
  }
  objc_sync_exit(v4);
}

- (void)_delegateCheckIn:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indexDelegate);

  if (WeakRetained)
  {
    unsigned int user = self->_user;
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CSSearchableIndex__delegateCheckIn___block_invoke;
    block[3] = &unk_1E5549AF8;
    id v9 = v4;
    uint64_t v10 = self;
    unsigned int v11 = user;
    dispatch_async(delegateQueue, block);
  }
}

- (CSSearchableIndex)initWithName:(id)a3 bundleIdentifier:(id)a4
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:a3 protectionClass:0 bundleIdentifier:a4 options:0];
}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v15 count];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __104__CSSearchableIndex_slowFetchAttributes_protectionClass_bundleID_identifiers_options_completionHandler___block_invoke;
  v21[3] = &unk_1E554A130;
  id v22 = v14;
  uint64_t v23 = v19;
  id v20 = v14;
  [(CSSearchableIndex *)self _fetchAttributes:v18 protectionClass:v17 bundleID:v16 items:v15 includeParents:0 options:a7 completionHandler:v21];
}

- (void)_fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)bundleIdentifier items:(id)a6 includeParents:(BOOL)a7 options:(int64_t)a8 completionHandler:(id)a9
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a9;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v16 = bundleIdentifier;
  id v17 = (NSString *)a4;
  protectionClass = v17;
  if (!v17) {
    protectionClass = self->_protectionClass;
  }
  uint64_t v19 = protectionClass;

  int64_t options = self->_options;
  uint64_t v21 = [v13 count];
  id v22 = [v14 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v21
    && ((char v24 = isKindOfClass & 1, (isKindOfClass & 1) != 0)
     || v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    int64_t v25 = options | a8;
    qos_class_t v28 = qos_class_self();
    id v26 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v41 = v16;
      __int16 v42 = 2112;
      id v43 = v19;
      __int16 v44 = 1024;
      qos_class_t v45 = v28;
      _os_log_debug_impl(&dword_18D0E3000, v26, OS_LOG_TYPE_DEBUG, "(%@) fetchAttributes, protectionClass:%@, QOS:%d", buf, 0x1Cu);
    }

    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke;
    activity_block[3] = &unk_1E554A068;
    activity_void block[4] = self;
    int64_t v36 = v25;
    id v31 = v16;
    uint64_t v32 = v19;
    BOOL v38 = a7;
    qos_class_t v37 = v28;
    id v33 = v13;
    char v39 = v24;
    id v34 = v14;
    id v35 = v15;
    _os_activity_initiate(&dword_18D0E3000, "fetch-attributes", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

void __104__CSSearchableIndex_slowFetchAttributes_protectionClass_bundleID_identifiers_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = 0;
    if (isKindOfClass)
    {
      uint64_t v6 = [v3 count];
      if (v6 && v6 == *(void *)(a1 + 40) + 1)
      {
        uint64_t v5 = [v3 subarrayWithRange:1];
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    id v7 = (id)v5;
  }
  else
  {
    id v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexID, 0);
  objc_storeStrong((id *)&self->_batchedItemIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_batchedItemsToIndex, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_indexDelegate);

  objc_storeStrong((id *)&self->_activityQueue, 0);
}

- (void)endIndexBatchWithClientState:(NSData *)clientState completionHandler:(void *)completionHandler
{
}

uint64_t __34__CSSearchableIndex_throttleQueue__block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (a2)
  {
    if (!*(unsigned char *)(v2 + 24))
    {
      *(unsigned char *)(v2 + 24) = 1;
      return [(id)throttleQueue_sCSSearchableIndexThrottleQueue suspend];
    }
  }
  else if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 0;
    return [(id)throttleQueue_sCSSearchableIndexThrottleQueue resume];
  }
  return result;
}

void __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = v1[6];
  uint64_t v6 = v1[7];
  uint64_t v7 = v1[10] | (32 * *(unsigned __int8 *)(a1 + 88));
  uint64_t v8 = *(void *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke_2;
  v10[3] = &unk_1E5549B20;
  uint64_t v9 = *(void *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  [v1 indexSearchableItems:v2 deleteSearchableItemsWithIdentifiers:v3 clientState:v4 expectedClientState:v9 protectionClass:v5 forBundleID:v6 options:v7 reason:v8 completionHandler:v10];
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11
{
}

- (void)indexSearchableItems:(NSArray *)items completionHandler:(void *)completionHandler
{
  uint64_t v6 = items;
  uint64_t v7 = completionHandler;
  if (self->_batchOpen)
  {
    uint64_t v8 = [(CSSearchableIndex *)self _validateOperationWithItems:v6];
    uint64_t v9 = logForCSLogCategoryIndex();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CSSearchableIndex indexSearchableItems:completionHandler:](v6);
      }

      if (v7) {
        v7[2](v7, v8);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchableIndex indexSearchableItems:completionHandler:](v6, v10);
      }

      id v11 = self;
      objc_sync_enter(v11);
      long long v12 = v11->_batchedItemsToIndex;
      if (!v12)
      {
        long long v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_storeStrong((id *)&v11->_batchedItemsToIndex, v12);
      }
      objc_sync_exit(v11);

      [(NSMutableArray *)v12 addObjectsFromArray:v6];
      if (v7) {
        v7[2](v7, 0);
      }
    }
  }
  else
  {
    [(CSSearchableIndex *)self indexSearchableItems:v6 deleteSearchableItemsWithIdentifiers:MEMORY[0x1E4F1CBF0] clientState:0 reason:0 completionHandler:v7];
  }
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 reason:(int64_t)a9 completionHandler:(id)a10
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 reason:(int64_t)a10 completionHandler:(id)a11
{
}

- (void)beginIndexBatch
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "Opening an index batch for index:%@", v2, v3, v4, v5, v6);
}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

void __188__CSSearchableIndex_indexSearchableItems_deleteSearchableItemsWithIdentifiers_clientState_expectedClientState_clientStateName_protectionClass_forBundleID_options_reason_completionHandler___block_invoke_203(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v5];
}

uint64_t __107__CSSearchableIndex_endIndexBatchWithExpectedClientState_newClientState_critical_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)setConnectionName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stringByAppendingString:@".index"];
  uint64_t v5 = (void *)sConnectionName;
  sConnectionName = v4;

  uint64_t v6 = [v3 stringByAppendingString:@".delegate"];

  uint64_t v7 = (void *)sDelegateConnectionName;
  sDelegateConnectionName = v6;

  sPrivateDaemon = 1;
}

- (void)_setUser:(unsigned int)a3
{
  self->_unsigned int user = a3;
}

+ (id)codedNSUAPersistentIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = objc_alloc_init(CSCoder);
    [(CSCoder *)v4 beginArray];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v10, "length", (void)v13))
          {
            id v11 = [@"NSUA:" stringByAppendingString:v10];
            [(CSCoder *)v4 encodeObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [(CSCoder *)v4 endArray];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)criticalQueue
{
  if (criticalQueue_onceToken != -1) {
    dispatch_once(&criticalQueue_onceToken, &__block_literal_global_81);
  }
  uint64_t v2 = (void *)criticalQueue_sCSSearchableIndexCriticalQueue;

  return v2;
}

void __34__CSSearchableIndex_criticalQueue__block_invoke()
{
  v0 = [[CSRequestQueue alloc] initWithLabel:"com.apple.spotlight.CoreSpotlight.critical" target:0 critical:1 startBlock:&__block_literal_global_86];
  uint64_t v1 = (void *)criticalQueue_sCSSearchableIndexCriticalQueue;
  criticalQueue_sCSSearchableIndexCriticalQueue = (uint64_t)v0;

  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __34__CSSearchableIndex_criticalQueue__block_invoke_3;
  v2[3] = &unk_1E5549AA8;
  v2[4] = v3;
  registerForGameModeChange(v2);
  _Block_object_dispose(v3, 8);
}

uint64_t __34__CSSearchableIndex_criticalQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _perform];
}

uint64_t __34__CSSearchableIndex_criticalQueue__block_invoke_3(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (a2)
  {
    if (!*(unsigned char *)(v2 + 24))
    {
      *(unsigned char *)(v2 + 24) = 1;
      return [(id)criticalQueue_sCSSearchableIndexCriticalQueue suspend];
    }
  }
  else if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 0;
    return [(id)criticalQueue_sCSSearchableIndexCriticalQueue resume];
  }
  return result;
}

uint64_t __33__CSSearchableIndex_requestQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _perform];
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:5];
  if (self->_name)
  {
    char v4 = (void *)[[NSString alloc] initWithFormat:@"name=\"%@\"", self->_name];
    [v3 addObject:v4];
  }
  if (self->_bundleIdentifier)
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:@"bundleID=%@", self->_bundleIdentifier];
    [v3 addObject:v5];
  }
  if (self->_options)
  {
    uint64_t v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"options=0x%lx", self->_options);
    [v3 addObject:v6];
  }
  uint64_t v7 = [(CSSearchableIndex *)self indexDelegate];
  if (v7)
  {
    uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"delegate=%p", v7);
    [v3 addObject:v8];
  }
  if ([(NSString *)self->_protectionClass isEqualToString:@"Priority"])
  {
    [v3 addObject:@"priority=1"];
  }
  else
  {
    protectionClass = self->_protectionClass;
    if (protectionClass && ![(NSString *)protectionClass isEqualToString:*MEMORY[0x1E4F28358]])
    {
      uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"dataclass=%@", self->_protectionClass];
      [v3 addObject:v10];
    }
  }
  id v11 = [NSString alloc];
  uint64_t v12 = objc_opt_class();
  long long v13 = [v3 componentsJoinedByString:@", "];
  long long v14 = (void *)[v11 initWithFormat:@"<%@:%p; %@>", v12, self, v13];

  return v14;
}

- (CSSearchableIndex)initWithName:(NSString *)name
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:name protectionClass:0 bundleIdentifier:0 options:0];
}

- (CSSearchableIndex)initWithName:(id)a3 options:(int64_t)a4
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:a3 protectionClass:0 bundleIdentifier:0 options:a4];
}

- (CSSearchableIndex)init
{
  return (CSSearchableIndex *)[(CSSearchableIndex *)self _initWithName:&stru_1EDBB3A50 protectionClass:0 bundleIdentifier:0 options:0];
}

void __50__CSSearchableIndex__makeActivityQueueIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x192F99810]();
  uint64_t v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = @"NO";
    if (a3) {
      uint64_t v9 = @"YES";
    }
    int v11 = 134218242;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    long long v14 = v9;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_INFO, "Flushing UA queue, count:%lu, flush:%@", (uint8_t *)&v11, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _indexActivities:v5 flush:a3];
}

+ (void)notifyIndexDelegates
{
}

+ (double)lastUpdateTime
{
  id v2 = a1;
  objc_sync_enter(v2);
  double v3 = *(double *)&sCSSearchableIndexLastUpdateTime;
  objc_sync_exit(v2);

  return v3;
}

+ (void)volumeMountedAtURL:(id)a3 withOptions:(id)a4
{
}

- (id)indexDelegate
{
  id v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_indexDelegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)endIndexBatchWithClientState:(id)a3 critical:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 critical:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)endIndexBatchWithExpectedClientState:(id)a3 newClientState:(id)a4 completionHandler:(id)a5
{
}

- (void)indexSearchableItems:(id)a3 returningItemsSanitizedForSpotlightTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSSearchableIndex *)self _itemsBySanitizingItemsForSpotlight:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__CSSearchableIndex_indexSearchableItems_returningItemsSanitizedForSpotlightTo___block_invoke;
  v11[3] = &unk_1E5549B70;
  id v12 = v8;
  id v13 = v6;
  id v9 = v8;
  id v10 = v6;
  [(CSSearchableIndex *)self indexSearchableItems:v7 completionHandler:v11];
}

uint64_t __80__CSSearchableIndex_indexSearchableItems_returningItemsSanitizedForSpotlightTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2);
  }
  return result;
}

- (id)_itemsBySanitizingItemsForSpotlight:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "copy", (void)v16);
        id v12 = [CSSearchableItemAttributeSet alloc];
        id v13 = [v10 filteredSpotlightAttributes];
        long long v14 = [(CSSearchableItemAttributeSet *)v12 initWithAttributes:v13];
        [v11 setAttributeSet:v14];

        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 completionHandler:(id)a6
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 expectedClientState:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
}

- (id)_validateOperation
{
  return [(CSSearchableIndex *)self _validateOperationWithItems:0];
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v14 = (NSString *)a5;
  uint64_t v15 = (void (**)(id, void *))a7;
  bundleIdentifier = v14;
  if (!v14) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  long long v17 = bundleIdentifier;
  long long v18 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v31 = 2048;
    uint64_t v32 = [v12 count];
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2048;
    int64_t v36 = a6;
    _os_log_debug_impl(&dword_18D0E3000, v18, OS_LOG_TYPE_DEBUG, "(%@) willModifySearchableItemsWithIdentifiers, identifiers/%ld:%@, options:0x%lx", buf, 0x2Au);
  }

  long long v19 = [(CSSearchableIndex *)self _validateOperationWithIdentifiers:v12];
  if (v19 || ![v12 count])
  {
    if (v15) {
      v15[2](v15, v19);
    }
  }
  else
  {
    id v20 = +[CSSearchableIndex codedUniqueIdentifiers:v12];
    *(void *)buf = 0;
    [v20 plistContainer];
    uint64_t v23 = (void *)_MDPlistContainerCopyDispatchData();
    uint64_t v21 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"will-modify-items"];
    id location = 0;
    objc_initWeak(&location, v21);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke;
    v24[3] = &unk_1E5549C60;
    v24[4] = self;
    int64_t v25 = v14;
    id v26 = v13;
    v28[1] = (id)a6;
    id v22 = v23;
    id v27 = v22;
    v28[2] = *(id *)buf;
    objc_copyWeak(v28, &location);
    [(CSSearchableIndexRequest *)v21 setPerformBlock:v24];
    [(CSSearchableIndexRequest *)v21 setCompletionBlock:v15];
    [(CSSearchableIndexRequest *)v21 start];
    objc_destroyWeak(v28);

    objc_destroyWeak(&location);
  }
}

void __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "will-modify", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  char v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_uint64(v3, "opt", *(void *)(a1 + 72));
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 56), "ids-size", *(void *)(a1 + 80));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __116__CSSearchableIndex_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  char v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (self->_batchOpen)
  {
    id v10 = [(CSSearchableIndex *)self _validateOperationWithIdentifiers:v8];
    int v11 = logForCSLogCategoryIndex();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CSSearchableIndex deleteSearchableItemsWithIdentifiers:reason:completionHandler:](v8, (uint64_t)v10, v12);
      }

      if (v9) {
        v9[2](v9, v10);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CSSearchableIndex deleteSearchableItemsWithIdentifiers:reason:completionHandler:](v8, v12);
      }

      id v13 = self;
      objc_sync_enter(v13);
      long long v14 = v13->_batchedItemIdentifiersToDelete;
      if (!v14)
      {
        long long v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_storeStrong((id *)&v13->_batchedItemIdentifiersToDelete, v14);
      }
      objc_sync_exit(v13);

      [(NSMutableArray *)v14 addObjectsFromArray:v8];
      if (v9) {
        v9[2](v9, 0);
      }
    }
  }
  else
  {
    [(CSSearchableIndex *)self indexSearchableItems:MEMORY[0x1E4F1CBF0] deleteSearchableItemsWithIdentifiers:v8 clientState:0 reason:a4 completionHandler:v9];
  }
}

- (void)deleteSearchableItemsWithIdentifiers:(NSArray *)identifiers completionHandler:(void *)completionHandler
{
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
}

- (void)deleteAllSearchableItemsWithReason:(int64_t)a3 completionHandler:(id)a4
{
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(void *)completionHandler
{
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = (NSString *)a4;
  long long v14 = (void (**)(id, void *))a7;
  [(id)objc_opt_class() _setLastUpdateTime];
  bundleIdentifier = v13;
  if (!v13) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  long long v16 = bundleIdentifier;
  long long v17 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v16;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2048;
    int64_t v33 = a5;
    __int16 v34 = 2048;
    uint64_t v35 = qos_class_self();
    _os_log_debug_impl(&dword_18D0E3000, v17, OS_LOG_TYPE_DEBUG, "(%@) deleteAllSearchableItemsWithProtectionClass, protectionClass:%@, options:0x%lx, qos:0x%lx", buf, 0x2Au);
  }

  if (v16)
  {
    long long v18 = +[CSPowerLog sharedInstance];
    [v18 logWithBundleID:v16 indexOperation:9 itemCount:1 code:a6];
  }
  long long v19 = [(CSSearchableIndex *)self _validateOperation];
  if (v19)
  {
    if (v14) {
      v14[2](v14, v19);
    }
  }
  else
  {
    id v20 = +[CSSearchableIndex defaultSearchableIndex];
    uint64_t v21 = [v20 activityQueue];
    [v21 flush];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5549D00;
    void aBlock[4] = self;
    char v24 = v13;
    id v25 = v12;
    int64_t v27 = a5;
    id v26 = v14;
    id v22 = _Block_copy(aBlock);
    _os_activity_initiate(&dword_18D0E3000, "delete-all-items", OS_ACTIVITY_FLAG_DEFAULT, v22);
  }
}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-all-items"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_2;
  id v9 = &unk_1E5549CD8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v4 = *(id *)(a1 + 48);
  id v5 = *(void **)(a1 + 64);
  id v12 = v4;
  v13[1] = v5;
  objc_copyWeak(v13, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v6];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 56), v6, v7, v8, v9, v10);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v13);

  objc_destroyWeak(&location);
}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-bundle", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_uint64(v3, "opt", *(void *)(a1 + 64));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __110__CSSearchableIndex_deleteAllSearchableItemsWithProtectionClass_forBundleID_options_reason_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteSearchableItemsSinceDate:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v14 = (NSString *)a5;
  uint64_t v15 = (void (**)(id, void *))a7;
  [(id)objc_opt_class() _setLastUpdateTime];
  bundleIdentifier = v14;
  if (!v14) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  long long v17 = bundleIdentifier;
  long long v18 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v29 = v17;
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_debug_impl(&dword_18D0E3000, v18, OS_LOG_TYPE_DEBUG, "(%@) deleteSearchableItemsSinceDate, bundleID:%@, startDate:%@, options:0x%lx", buf, 0x2Au);
  }

  long long v19 = [(CSSearchableIndex *)self _validateOperation];
  if (v19)
  {
    if (v15) {
      v15[2](v15, v19);
    }
  }
  else
  {
    id v20 = +[CSSearchableIndex defaultSearchableIndex];
    uint64_t v21 = [v20 activityQueue];
    [v21 flush];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke;
    v22[3] = &unk_1E5549D50;
    v22[4] = self;
    uint64_t v23 = v14;
    id v24 = v13;
    int64_t v27 = a6;
    id v25 = v12;
    id v26 = v15;
    _os_activity_initiate(&dword_18D0E3000, "delete-all-items-since-date", OS_ACTIVITY_FLAG_DEFAULT, v22);
  }
}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-all-items-since-date"];
  id location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5549D28;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = *(id *)(a1 + 48);
  id v5 = *(void **)(a1 + 72);
  id v8 = v4;
  v10[1] = v5;
  id v9 = *(id *)(a1 + 56);
  objc_copyWeak(v10, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v6];
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:*(void *)(a1 + 64)];
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v10);

  objc_destroyWeak(&location);
}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-from-date", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_uint64(v3, "opt", *(void *)(a1 + 72));
  [*(id *)(a1 + 56) timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v3, "time", v6);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_3;
  void v7[3] = &unk_1E5549C38;
  objc_copyWeak(&v8, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v7];
  objc_destroyWeak(&v8);
}

void __106__CSSearchableIndex_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)fetchDataForBundleIdentifier:(NSString *)bundleIdentifier itemIdentifier:(NSString *)itemIdentifier contentType:(UTType *)contentType completionHandler:(void *)completionHandler
{
  uint64_t v10 = completionHandler;
  id v11 = itemIdentifier;
  id v12 = bundleIdentifier;
  id v13 = [(UTType *)contentType identifier];
  [(CSSearchableIndex *)self provideDataForBundle:v12 identifier:v11 type:v13 completionHandler:v10];
}

- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
}

- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
}

- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 allowDownload:(BOOL)a6 completionHandler:(id)a7
{
}

- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 inPlace:(BOOL)a6 allowDownload:(BOOL)a7 completionHandler:(id)a8
{
  uint64_t v8 = 2;
  if (!a6) {
    uint64_t v8 = 0;
  }
  [(CSSearchableIndex *)self provideFileURLForBundle:a3 itemIdentifier:a4 typeIdentifier:a5 options:v8 | a7 completionHandler:a8];
}

- (void)provideDataForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  if (a6) {
    [NSString stringWithFormat:@"provide:data1:%ld:%@:%@:%@", a6, a5, a3, a4];
  }
  else {
  id v13 = [NSString stringWithFormat:@"provide:data:%@:%@:%@", a5, a3, a4, v15];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__CSSearchableIndex_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  id v16[3] = &unk_1E5549D78;
  id v17 = v12;
  id v14 = v12;
  [(CSSearchableIndex *)self _issueCommand:v13 completionHandler:v16];
}

uint64_t __98__CSSearchableIndex_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provideFileURLForBundle:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a7;
  if (a6) {
    [NSString stringWithFormat:@"provide:url1:%ld:%@:%@:%@", a6, a5, a3, a4];
  }
  else {
  id v13 = [NSString stringWithFormat:@"provide:url:%@:%@:%@", a5, a3, a4, v15];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __101__CSSearchableIndex_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  id v16[3] = &unk_1E5549D78;
  id v17 = v12;
  id v14 = v12;
  [(CSSearchableIndex *)self _issueCommand:v13 completionHandler:v16];
}

void __101__CSSearchableIndex_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[CSDecoder decodeURLPreservingSecurityScope:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provideFileURLsForBundle:(id)a3 itemIdentifiers:(id)a4 typeIdentifier:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([v13 count])
  {
    long long v16 = [v13 componentsJoinedByString:@";"];
    id v17 = [NSString stringWithFormat:@"provide:urls:%ld:%@:%@:%@", a6, v14, v12, v16];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
    v22[3] = &unk_1E5549260;
    id v23 = v13;
    id v24 = v15;
    [(CSSearchableIndex *)self _issueCommand:v17 completionHandler:v22];
  }
  else
  {
    long long v18 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex provideFileURLsForBundle:itemIdentifiers:typeIdentifier:options:completionHandler:]();
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F28798];
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"itemIdentifiers may not be nil." forKey:*MEMORY[0x1E4F28568]];
    long long v16 = (void *)[v19 initWithDomain:v20 code:22 userInfo:v21];

    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v16);
  }
}

void __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    id v18 = v6;
    id v14 = [v7 unarchivedObjectOfClasses:v13 fromData:v5 error:&v18];
    id v15 = v18;

    if (v14)
    {
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:*(void *)(a1 + 32)];
    }
    else
    {
      id v17 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_cold_1();
      }

      long long v16 = 0;
    }
  }
  else
  {
    long long v16 = 0;
    id v15 = v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_photosLibraryDeleted:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"command"];
  id location = 0;
  objc_initWeak(&location, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke;
  v13[3] = &unk_1E5549DA0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  [(CSSearchableIndexRequest *)v8 setPerformBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5549DC8;
  id v10 = v7;
  id v12 = v10;
  [(CSSearchableIndexRequest *)v8 setCompletionDataBlock:v11];
  [(CSSearchableIndexRequest *)v8 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] connection];
  id v3 = objc_msgSend(a1[4], "xpc_dictionary_for_command:requiresInitialization:", "photoslibrary-deleted", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_string(v3, "path", (const char *)[a1[5] UTF8String]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, a1 + 6);
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

void __61__CSSearchableIndex__photosLibraryDeleted_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = [a3 data];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)_openJournalFile:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"command"];
  id location = 0;
  objc_initWeak(&location, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke;
  v13[3] = &unk_1E5549DA0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  [(CSSearchableIndexRequest *)v8 setPerformBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5549DC8;
  id v10 = v7;
  id v12 = v10;
  [(CSSearchableIndexRequest *)v8 setCompletionDataBlock:v11];
  [(CSSearchableIndexRequest *)v8 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "open-journal", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "journal-name", (const char *)[v4 UTF8String]);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5549C38;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v2 sendMessageAsync:v3 completion:v5];
  objc_destroyWeak(&v6);
}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = csindex_xpc_dictionary_decode_status_with_error(v3);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v4];
  }
  else
  {
    uint64_t v9 = xpc_dictionary_dup_fd(v3, "journal-fd");
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v9 length:8];
    id v7 = [[CSDataWrapper alloc] initWithData:v6];
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    [v8 retryIfNecessaryWithError:0 dataWrapper:v7];
  }
}

void __56__CSSearchableIndex__openJournalFile_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v8 = 0;
  id v6 = [a3 data];
  [v6 getBytes:&v8 length:8];

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)_issueCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"command"];
  id location = 0;
  objc_initWeak(&location, v8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke;
  v13[3] = &unk_1E5549DA0;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  objc_copyWeak(&v15, &location);
  [(CSSearchableIndexRequest *)v8 setPerformBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5549DC8;
  id v10 = v7;
  id v12 = v10;
  [(CSSearchableIndexRequest *)v8 setCompletionDataBlock:v11];
  [(CSSearchableIndexRequest *)v8 start];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] connection];
  id v3 = objc_msgSend(a1[4], "xpc_dictionary_for_command:requiresInitialization:", "issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_string(v3, "request", (const char *)[a1[5] UTF8String]);
  xpc_dictionary_set_fd(v3, "fd", 1);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, a1 + 6);
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

void __53__CSSearchableIndex__issueCommand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = [a3 data];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"command"];
  id location = 0;
  objc_initWeak(&location, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke;
  v13[3] = &unk_1E5549DF0;
  v13[4] = self;
  BOOL v16 = a4;
  int v15 = a3;
  objc_copyWeak(&v14, &location);
  [(CSSearchableIndexRequest *)v9 setPerformBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5549DC8;
  id v10 = v8;
  id v12 = v10;
  [(CSSearchableIndexRequest *)v9 setCompletionDataBlock:v11];
  [(CSSearchableIndexRequest *)v9 start];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = v3;
  if (*(unsigned char *)(a1 + 52)) {
    id v5 = "diagnosemd_q";
  }
  else {
    id v5 = "diagnosemd";
  }
  xpc_dictionary_set_string(v3, "request", v5);
  int v6 = *(_DWORD *)(a1 + 48);
  if ((v6 & 0x80000000) == 0) {
    xpc_dictionary_set_fd(v4, "fd", v6);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_2;
  void v7[3] = &unk_1E5549C38;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [v2 sendMessageAsync:v4 completion:v7];
  objc_destroyWeak(&v8);
}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

void __63__CSSearchableIndex__issueDiagnose_logQuery_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = [a3 data];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)prepareIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v11 = bundleIdentifier;
  id v12 = (NSString *)a4;
  protectionClass = v12;
  if (!v12) {
    protectionClass = self->_protectionClass;
  }
  id v14 = protectionClass;

  int v15 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v11;
    __int16 v26 = 2112;
    int64_t v27 = v14;
    __int16 v28 = 2048;
    unint64_t v29 = (unint64_t)a5;
    _os_log_debug_impl(&dword_18D0E3000, v15, OS_LOG_TYPE_DEBUG, "(%@) prepareIndexingWhileLocked: %@, %lu", buf, 0x20u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549D00;
  activity_void block[4] = self;
  id v20 = v11;
  double v23 = a5;
  uint64_t v21 = v14;
  id v22 = v10;
  id v16 = v10;
  id v17 = v14;
  id v18 = v11;
  _os_activity_initiate(&dword_18D0E3000, "prepare-indexing-while-locked", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"prepare-indexing-while-locked"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_2;
  id v7 = &unk_1E5549CD8;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  v11[1] = *(id *)(a1 + 64);
  objc_copyWeak(v11, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v4];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 56), v4, v5, v6, v7, v8);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "prepare-indexing-locked", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_double(v3, "time", *(double *)(a1 + 64));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __99__CSSearchableIndex_prepareIndexingWhileLocked_protectionClass_holdAssertionFor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)finishIndexingWhileLocked:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v9 = bundleIdentifier;
  id v10 = (NSString *)a4;
  protectionClass = v10;
  if (!v10) {
    protectionClass = self->_protectionClass;
  }
  id v12 = protectionClass;

  id v13 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex finishIndexingWhileLocked:protectionClass:completionHandler:]();
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke;
  v17[3] = &unk_1E5549E40;
  v17[4] = self;
  id v18 = v9;
  id v19 = v12;
  id v20 = v8;
  id v14 = v8;
  int v15 = v12;
  id v16 = v9;
  _os_activity_initiate(&dword_18D0E3000, "finish-indexing-while-locked", OS_ACTIVITY_FLAG_DEFAULT, v17);
}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"finish-indexing-while-locked"];
  id location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549E18;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v4];
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:*(void *)(a1 + 56)];
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "finish-indexing-locked", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __81__CSSearchableIndex_finishIndexingWhileLocked_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = bundleIdentifier;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2048;
    uint64_t v21 = [v6 count];
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEBUG, "(%@) changeStateOfSearchableItemsWithUIDs, state:%ld, identifiers/%lu:%@", buf, 0x2Au);
  }

  if ([v6 count])
  {
    [(id)objc_opt_class() _setLastUpdateTime];
    id v8 = +[CSSearchableIndex codedUniqueIdentifiers:v6];
    *(void *)buf = 0;
    [v8 plistContainer];
    id v9 = (void *)_MDPlistContainerCopyDispatchData();
    id v10 = [(CSSearchableIndex *)self throttleQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __66__CSSearchableIndex_changeStateOfSearchableItemsWithUIDs_toState___block_invoke;
    v13[3] = &unk_1E5549ED8;
    v13[4] = self;
    id v14 = v9;
    int64_t v15 = a4;
    uint64_t v16 = *(void *)buf;
    id v11 = v9;
    [v10 async:v13];
  }
}

void __66__CSSearchableIndex_changeStateOfSearchableItemsWithUIDs_toState___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "change-state", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_uint64(v2, "modify-state", *(void *)(a1 + 48));
  add_dispatch_data_to_xpc_dict(v2, "ids", *(NSObject **)(a1 + 40), "ids-size", *(void *)(a1 + 56));
  [v3 sendMessageAsync:v2 completion:&__block_literal_global_284];
}

- (void)_changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 forUser:(unsigned int)a5 forBundleID:(id)a6 forUTIType:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  id v13 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = bundleIdentifier;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    __int16 v28 = 2048;
    uint64_t v29 = [v11 count];
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_debug_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_DEBUG, "(%@) changeStateOfSearchableItemsWithUIDs, state:%ld, identifiers/%lu:%@", buf, 0x2Au);
  }

  if ([v11 count])
  {
    [(id)objc_opt_class() _setLastUpdateTime];
    id v14 = +[CSSearchableIndex codedUniqueIdentifiers:v11];
    *(void *)buf = 0;
    [v14 plistContainer];
    int64_t v15 = (void *)_MDPlistContainerCopyDispatchData();
    uint64_t v16 = [(CSSearchableIndex *)self throttleQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__CSSearchableIndex__changeStateOfSearchableItemsWithUIDs_toState_forUser_forBundleID_forUTIType___block_invoke;
    v19[3] = &unk_1E5549F00;
    void v19[4] = self;
    id v20 = v15;
    int64_t v22 = a4;
    uint64_t v23 = *(void *)buf;
    unsigned int v24 = a5;
    id v21 = v12;
    id v17 = v15;
    [v16 async:v19];
  }
}

void __98__CSSearchableIndex__changeStateOfSearchableItemsWithUIDs_toState_forUser_forBundleID_forUTIType___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) connection];
  id v2 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "change-state", objc_msgSend(v3, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_uint64(v2, "modify-state", *(void *)(a1 + 56));
  add_dispatch_data_to_xpc_dict(v2, "ids", *(NSObject **)(a1 + 40), "ids-size", *(void *)(a1 + 64));
  xpc_dictionary_set_uint64(v2, "user-id", *(unsigned int *)(a1 + 72));
  xpc_dictionary_set_string(v2, "ct", (const char *)[*(id *)(a1 + 48) UTF8String]);
  [v3 sendMessageAsync:v2 completion:&__block_literal_global_288_0];
}

- (void)_indexActivities:(id)a3 flush:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CSSearchableIndex *)self throttleQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CSSearchableIndex__indexActivities_flush___block_invoke;
  v9[3] = &unk_1E5549F28;
  BOOL v12 = a4;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 async:v9];
}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v18 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [v8 action];
        id v10 = [v8 item];
        if (v10) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          BOOL v12 = objc_opt_new();
          [v12 setObject:v9 forKeyedSubscript:@"action"];
          [v12 setObject:v10 forKeyedSubscript:@"item"];
          [v2 addObject:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v13 encodeObject:v2 forKey:*MEMORY[0x1E4F284E8]];
    id v14 = [v13 encodedData];
  }
  else
  {
    id v14 = 0;
  }
  if ([v14 length] || *(unsigned char *)(v18 + 48))
  {
    int64_t v15 = [*(id *)(v18 + 40) connection];
    uint64_t v16 = objc_msgSend(*(id *)(v18 + 40), "xpc_dictionary_for_command:requiresInitialization:", "activities", objc_msgSend(v15, "previouslyInitialized") ^ 1);
    if ([v14 length])
    {
      id v17 = v14;
      xpc_dictionary_set_data(v16, "data", (const void *)[v17 bytes], objc_msgSend(v17, "length"));
    }
    xpc_dictionary_set_BOOL(v16, "flush", *(unsigned char *)(v18 + 48));
    [v15 sendMessageAsync:v16 completion:&__block_literal_global_303];
  }
}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = csindex_xpc_dictionary_decode_status_with_error(a2);

  if (v2)
  {
    id v3 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__CSSearchableIndex__indexActivities_flush___block_invoke_2_cold_1();
    }
  }
}

- (void)deleteAllUserActivities:(id)bundleIdentifier completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v7 = bundleIdentifier;
  id v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_INFO, "(%@) deleteAllUserActivities", buf, 0xCu);
  }

  id v9 = +[CSSearchableIndex defaultSearchableIndex];
  id v10 = [v9 activityQueue];
  [v10 flush];

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549288;
  activity_void block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  _os_activity_initiate(&dword_18D0E3000, "delete-all-activities", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke(void *a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:a1[4] label:@"delete-all-activities"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_2;
  id v7 = &unk_1E5549DA0;
  id v3 = (void *)a1[5];
  uint64_t v8 = a1[4];
  id v9 = v3;
  objc_copyWeak(&v10, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v4];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", a1[6], v4, v5, v6, v7, v8);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_all_activities", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5549C38;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v2 sendMessageAsync:v3 completion:v5];
  objc_destroyWeak(&v6);
}

void __63__CSSearchableIndex_deleteAllUserActivities_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v10 = bundleIdentifier;
  id v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    __int16 v23 = 1024;
    int v24 = [v8 count];
    _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "(%@) deleteActivities, count:%d", buf, 0x12u);
  }

  if ([v8 count])
  {
    id v12 = +[CSSearchableIndex defaultSearchableIndex];
    id v13 = [v12 activityQueue];
    [v13 flush];

    id v14 = +[CSSearchableIndex codedNSUAPersistentIdentifiers:v8];
    *(void *)buf = 0;
    [v14 plistContainer];
    id v15 = (void *)_MDPlistContainerCopyDispatchData();
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke;
    activity_block[3] = &unk_1E5549D00;
    activity_void block[4] = self;
    id v18 = v10;
    id v19 = v15;
    uint64_t v21 = *(void *)buf;
    id v20 = v9;
    id v16 = v15;
    _os_activity_initiate(&dword_18D0E3000, "delete-activities", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-activities"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_2;
  id v9 = &unk_1E5549CD8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 64);
  id v12 = v4;
  v13[1] = v5;
  objc_copyWeak(v13, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v6];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 56), v6, v7, v8, v9, v10);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v13);

  objc_destroyWeak(&location);
}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_activities", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  add_dispatch_data_to_xpc_dict(v3, "ids", *(NSObject **)(a1 + 48), "ids-size", *(void *)(a1 + 64));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549B98;
  id v5 = v3;
  id v7 = v5;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  [v2 sendMessageAsync:v5 completion:v6];
  objc_destroyWeak(&v8);
}

void __94__CSSearchableIndex_deleteUserActivitiesWithPersistentIdentifiers_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v5];
}

- (void)flushUserActivities
{
  id v3 = [(CSSearchableIndex *)self throttleQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CSSearchableIndex_flushUserActivities__block_invoke;
  v4[3] = &unk_1E5548F00;
  void v4[4] = self;
  [v3 sync:v4];
}

void __40__CSSearchableIndex_flushUserActivities__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activityQueue];
  [v1 flush];
}

- (void)performDataMigrationWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549C10;
  double v10 = a3;
  activity_void block[4] = self;
  id v9 = v6;
  id v7 = v6;
  _os_activity_initiate(&dword_18D0E3000, "data-migration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"data-migration"];
  id location = 0;
  objc_initWeak(&location, v2);
  [(CSSearchableIndexRequest *)v2 setShouldThrottle:0];
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_2;
  id v6 = &unk_1E5549F50;
  uint64_t v7 = *(void *)(a1 + 32);
  v8[1] = *(id *)(a1 + 48);
  objc_copyWeak(v8, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v3];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 40), v3, v4, v5, v6, v7);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "data-migration", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_double(v3, "timeout", *(double *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __71__CSSearchableIndex_performDataMigrationWithTimeout_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (NSString *)a4;
  id v10 = a5;
  if (!v9) {
    id v9 = self->_protectionClass;
  }
  id v11 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    __int16 v23 = self;
    _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_DEFAULT, "### [SpotlightClient] CSSearchableIndex#performIndexJob Received job:%@, index:%@", buf, 0x16u);
  }

  id v12 = [(CSSearchableIndex *)self delegateQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
  id v16[3] = &unk_1E5549E40;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) delegateQueue];
  dispatch_suspend(v2);

  if ([*(id *)(a1 + 40) jobOptions]) {
    id v3 = -[CSSearchableIndex _initWithName:protectionClass:bundleIdentifier:options:]([CSSearchableIndex alloc], "_initWithName:protectionClass:bundleIdentifier:options:", *(void *)(*(void *)(a1 + 32) + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 56), [*(id *)(a1 + 40) jobOptions]);
  }
  else {
    id v3 = *(id *)(a1 + 32);
  }
  uint64_t v4 = v3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = [*(id *)(a1 + 32) indexDelegate];
  uint64_t v7 = *(void **)(a1 + 40);
  if (v7 && v6)
  {
    switch([v7 jobType])
    {
      case 1:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_14;
        }
        id v8 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v9;
          __int16 v29 = 2112;
          __int16 v30 = v4;
          _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_DEFAULT, "reindexSearchableItemsWithIdentifiers, job:%@, index:%@", buf, 0x16u);
        }

        id v10 = [*(id *)(a1 + 40) identifiersToReindex];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_319;
        v25[3] = &unk_1E5548F00;
        __int16 v26 = v5;
        [v6 searchableIndex:v4 reindexSearchableItemsWithIdentifiers:v10 acknowledgementHandler:v25];

        id v11 = v26;
        goto LABEL_13;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_14;
        }
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2;
        v23[3] = &unk_1E5548F00;
        uint64_t v24 = v5;
        [v6 searchableIndex:v4 reindexAllSearchableItemsWithAcknowledgementHandler:v23];
        id v11 = v24;
LABEL_13:

        goto LABEL_20;
      case 4:
        if (objc_opt_respondsToSelector()) {
          [v6 searchableIndexDidThrottle:v4];
        }
        break;
      case 5:
        if (objc_opt_respondsToSelector()) {
          [v6 searchableIndexDidFinishThrottle:v4];
        }
        break;
      default:
LABEL_14:
        id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-1 userInfo:0];
        dispatch_group_leave(v5);
        goto LABEL_21;
    }
  }
  dispatch_group_leave(v5);
LABEL_20:
  id v12 = 0;
LABEL_21:
  id v13 = dispatch_get_global_queue(9, 2uLL);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3;
  block[3] = &unk_1E5549E90;
  id v18 = *(id *)(a1 + 40);
  id v19 = v4;
  uint64_t v14 = *(void *)(a1 + 32);
  id v20 = v12;
  uint64_t v21 = v14;
  id v22 = *(id *)(a1 + 56);
  id v15 = v12;
  id v16 = v4;
  dispatch_group_notify(v5, v13, block);
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_319(uint64_t a1)
{
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192F99810]();
  id v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3_cold_1((void *)a1, v3);
  }

  uint64_t v4 = [*(id *)(a1 + 56) delegateQueue];
  dispatch_resume(v4);

  uint64_t v5 = *(void *)(a1 + 64);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 48));
  }
}

- (void)transferDeletionJournalsForProtectionClass:(id)a3 toDirectory:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = open((const char *)[a4 fileSystemRepresentation], 1081600);
  if ((v10 & 0x80000000) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke;
    v11[3] = &unk_1E5549FC8;
    void v11[4] = self;
    int v14 = v10;
    id v12 = v8;
    id v13 = v9;
    _os_activity_initiate(&dword_18D0E3000, "delete-journal-transfer", OS_ACTIVITY_FLAG_DEFAULT, v11);
  }
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"journal-transfer"];
  id location = 0;
  objc_initWeak(&location, v2);
  [(CSSearchableIndexRequest *)v2 setShouldThrottle:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_2;
  void v7[3] = &unk_1E5549F78;
  id v3 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  int v10 = *(_DWORD *)(a1 + 56);
  id v8 = v3;
  objc_copyWeak(&v9, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v7];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_4;
  v4[3] = &unk_1E5549FA0;
  int v6 = *(_DWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:v4];
  [(CSSearchableIndexRequest *)v2 start];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-journal-transfer", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_fd(v3, "fd", *(_DWORD *)(a1 + 56));
  xpc_dictionary_set_string(v3, "pc", (const char *)[*(id *)(a1 + 40) UTF8String]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

void __94__CSSearchableIndex_transferDeletionJournalsForProtectionClass_toDirectory_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  id v4 = a2;
  close(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addInteraction:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v12 = bundleIdentifier;
  id v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13) {
    protectionClass = self->_protectionClass;
  }
  id v15 = protectionClass;

  id v16 = v10;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v16 performSelector:sel_intent];
    if (v17)
    {
      id v18 = (void *)v17;
      id v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);

      if (v20)
      {
        uint64_t v21 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          id v30 = v12;
          __int16 v31 = 2048;
          id v32 = v16;
          __int16 v33 = 2112;
          __int16 v34 = v15;
          __int16 v35 = 2112;
          uint64_t v36 = v20;
          _os_log_debug_impl(&dword_18D0E3000, v21, OS_LOG_TYPE_DEBUG, "(%@) addInteraction, interaction:%p, protectionClass:%@ intent:%@", buf, 0x2Au);
        }

        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke;
        v23[3] = &unk_1E554A018;
        void v23[4] = self;
        id v24 = v12;
        uint64_t v25 = v15;
        id v26 = v20;
        id v27 = v16;
        id v28 = v11;
        id v22 = v20;
        _os_activity_initiate(&dword_18D0E3000, "add-interaction", OS_ACTIVITY_FLAG_DEFAULT, v23);
      }
    }
  }
}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"add-interaction"];
  id location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549FF0;
  int v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  objc_copyWeak(&v9, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v4];
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:*(void *)(a1 + 72)];
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  int v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "add_interaction", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_string(v3, "icn", (const char *)[*(id *)(a1 + 56) UTF8String]);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 encodeObject:*(void *)(a1 + 64) forKey:*MEMORY[0x1E4F284E8]];
  id v7 = [v6 encodedData];
  xpc_dictionary_set_data(v3, "data", (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __79__CSSearchableIndex_addInteraction_bundleID_protectionClass_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5549C38;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  [v2 sendMessageAsync:v3 completion:v8];
  objc_destroyWeak(&v9);
}

- (void)addInteraction:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void *))a6;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v12 = bundleIdentifier;
  id v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13) {
    protectionClass = self->_protectionClass;
  }
  id v15 = protectionClass;

  id v16 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2048;
    uint64_t v29 = [v10 count];
    _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithIdentifiers, protectionClass:%@, identifiers number:%lu", buf, 0x20u);
  }

  uint64_t v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:]();
  }

  if ([v10 count])
  {
    id v18 = [(CSSearchableIndex *)self _validateOperationWithIdentifiers:v10];
    if (v18)
    {
      if (v11) {
        v11[2](v11, v18);
      }
    }
    else
    {
      activity_block[0] = MEMORY[0x1E4F143A8];
      activity_block[1] = 3221225472;
      activity_block[2] = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
      activity_block[3] = &unk_1E5549E90;
      activity_void block[4] = self;
      id v20 = v12;
      uint64_t v21 = v15;
      id v22 = v10;
      __int16 v23 = v11;
      _os_activity_initiate(&dword_18D0E3000, "delete-interactions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }
}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-interactions"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2;
  id v7 = &unk_1E5549E68;
  int v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v4];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 64), v4, v5, v6, v7, v8);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  int v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 56) forKey:"identifiers"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __98__CSSearchableIndex_deleteInteractionsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)bundleIdentifier protectionClass:(id)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void *))a6;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v12 = bundleIdentifier;
  id v13 = (NSString *)a5;
  protectionClass = v13;
  if (!v13) {
    protectionClass = self->_protectionClass;
  }
  id v15 = protectionClass;

  id v16 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2048;
    uint64_t v29 = [v10 count];
    _os_log_impl(&dword_18D0E3000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithGroupIdentifiers, protectionClass:%@, identifiers number:%lu", buf, 0x20u);
  }

  uint64_t v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:]();
  }

  if ([v10 count])
  {
    id v18 = [(CSSearchableIndex *)self _validateOperationWithIdentifiers:v10];
    if (v18)
    {
      if (v11) {
        v11[2](v11, v18);
      }
    }
    else
    {
      activity_block[0] = MEMORY[0x1E4F143A8];
      activity_block[1] = 3221225472;
      activity_block[2] = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
      activity_block[3] = &unk_1E5549E90;
      activity_void block[4] = self;
      id v20 = v12;
      uint64_t v21 = v15;
      id v22 = v10;
      __int16 v23 = v11;
      _os_activity_initiate(&dword_18D0E3000, "delete-interactions-with-group-identifiers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }
}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-interactions-with-group-identifiers"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2;
  id v7 = &unk_1E5549E68;
  id v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  objc_copyWeak(&v12, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v4];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 64), v4, v5, v6, v7, v8);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_group_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 56) forKey:"identifiers"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __103__CSSearchableIndex_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteAllInteractionsWithBundleID:(id)bundleIdentifier protectionClass:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v9 = bundleIdentifier;
  id v10 = (NSString *)a4;
  protectionClass = v10;
  if (!v10) {
    protectionClass = self->_protectionClass;
  }
  id v12 = protectionClass;

  id v13 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllInteractionsWithBundleID, protectionClass:%@", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke;
  v17[3] = &unk_1E5549E40;
  v17[4] = self;
  id v18 = v9;
  id v19 = v12;
  id v20 = v8;
  id v14 = v8;
  id v15 = v12;
  id v16 = v9;
  _os_activity_initiate(&dword_18D0E3000, "delete-all-interactions", OS_ACTIVITY_FLAG_DEFAULT, v17);
}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-all-interactions"];
  id location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549E18;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v4];
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:*(void *)(a1 + 56)];
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete_all_interactions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __89__CSSearchableIndex_deleteAllInteractionsWithBundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)deleteAllInteractionsWithCompletionHandler:(id)a3
{
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)bundleIdentifier completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v10 = bundleIdentifier;
  id v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2048;
    id v22 = v8;
    _os_log_impl(&dword_18D0E3000, v11, OS_LOG_TYPE_INFO, "(%@) donateRelevantActions: %p, ", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke;
  v15[3] = &unk_1E5549E40;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  _os_activity_initiate(&dword_18D0E3000, "donate-relevant-actions", OS_ACTIVITY_FLAG_DEFAULT, v15);
}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"donate-relevant-actions"];
  id location = 0;
  objc_initWeak(&location, v2);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5549E18;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v4];
  [(CSSearchableIndexRequest *)v2 setCompletionBlock:*(void *)(a1 + 56)];
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "donate_relevant_actions", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v5 encodeObject:*(void *)(a1 + 48) forKey:*MEMORY[0x1E4F284E8]];
  id v6 = [v5 encodedData];
  xpc_object_t v7 = xpc_data_create((const void *)[v6 bytes], objc_msgSend(v6, "length"));
  xpc_dictionary_set_value(v3, "data", v7);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_3;
  v8[3] = &unk_1E5549C38;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  [v2 sendMessageAsync:v3 completion:v8];
  objc_destroyWeak(&v9);
}

void __70__CSSearchableIndex_donateRelevantActions_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)_deleteActionsBeforeTime:(double)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  xpc_object_t v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = (unint64_t)a3;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_INFO, "_deleteActionsBeforeTime: %lu, ", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549C10;
  double v11 = a3;
  activity_void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  _os_activity_initiate(&dword_18D0E3000, "delete-actions-before-time", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"delete-actions-before-time"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_2;
  id v6 = &unk_1E5549F50;
  uint64_t v7 = *(void *)(a1 + 32);
  v8[1] = *(id *)(a1 + 48);
  objc_copyWeak(v8, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v3];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", *(void *)(a1 + 40), v3, v4, v5, v6, v7);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-actions-before-time", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_double(v3, "time", *(double *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __64__CSSearchableIndex__deleteActionsBeforeTime_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

- (void)_deleleActionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v6 count];
    _os_log_impl(&dword_18D0E3000, v8, OS_LOG_TYPE_INFO, "_deleleActionsWithIdentifiers count: %lu, ", buf, 0xCu);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549288;
  activity_void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_18D0E3000, "delete-actions-with-identifiers", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke(void *a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:a1[4] label:@"delete-actions-with-identifiers"];
  id location = 0;
  objc_initWeak(&location, v2);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_2;
  id v7 = &unk_1E5549DA0;
  id v3 = (void *)a1[5];
  uint64_t v8 = a1[4];
  id v9 = v3;
  objc_copyWeak(&v10, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:&v4];
  -[CSSearchableIndexRequest setCompletionBlock:](v2, "setCompletionBlock:", a1[6], v4, v5, v6, v7, v8);
  [(CSSearchableIndexRequest *)v2 start];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "delete-actions-with-identifiers", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 40) forKey:"identifiers"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_3;
  v4[3] = &unk_1E5549C38;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __69__CSSearchableIndex__deleleActionsWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = csindex_xpc_dictionary_decode_status_with_error(v3);

  [WeakRetained retryIfNecessaryWithError:v4];
}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"fetch-attributes" critical:1];
  id location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E554A040;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 48);
  char v13 = *(unsigned char *)(a1 + 92);
  int v12 = *(_DWORD *)(a1 + 88);
  id v9 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 93);
  id v10 = *(id *)(a1 + 64);
  objc_copyWeak(&v11, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_4;
  v4[3] = &unk_1E5549DC8;
  id v5 = *(id *)(a1 + 72);
  [(CSSearchableIndexRequest *)v2 setCompletionDataBlock:v4];
  [(CSSearchableIndexRequest *)v2 start];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "fetch_attributes", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  if (*(unsigned char *)(a1 + 84)) {
    xpc_dictionary_set_BOOL(v3, "fpa", 1);
  }
  xpc_dictionary_set_int64(v3, "qos", *(unsigned int *)(a1 + 80));
  +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 56) forKey:"fa"];
  if (*(unsigned char *)(a1 + 85))
  {
    uint64_t v6 = [*(id *)(a1 + 64) count];
    id v7 = malloc_type_malloc(8 * v6 + 8, 0xD0230DAAuLL);
    void *v7 = 0;
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v9 = [*(id *)(a1 + 64) objectAtIndexedSubscript:i];
        v7[i + 1] = [v9 longLongValue];
      }
    }
    xpc_dictionary_set_data(v3, "data", v7, 8 * v6 + 8);
    free(v7);
  }
  else
  {
    +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 64) forKey:"identifiers"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5549C38;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  [v2 sendMessageAsync:v3 completion:v10];
  objc_destroyWeak(&v11);
}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"fetch-data-key" sizeKey:"fetch-data-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

void __110__CSSearchableIndex__fetchAttributes_protectionClass_bundleID_items_includeParents_options_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (void *)[v5 dataSize];
    if (v6)
    {
      [v7 dataPtr];
      id v6 = (void *)_MDPlistBytesCreate();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)bundleIdentifier items:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (!bundleIdentifier) {
    bundleIdentifier = self->_bundleIdentifier;
  }
  id v12 = bundleIdentifier;
  char v13 = (NSString *)a3;
  protectionClass = v13;
  if (!v13) {
    protectionClass = self->_protectionClass;
  }
  uint64_t v15 = protectionClass;

  uint64_t v16 = [v10 firstObject];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    qos_class_t v17 = qos_class_self();
    id v18 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v12;
      __int16 v27 = 2112;
      __int16 v28 = v15;
      __int16 v29 = 1024;
      qos_class_t v30 = v17;
      _os_log_debug_impl(&dword_18D0E3000, v18, OS_LOG_TYPE_DEBUG, "(%@) fetchCacheFileDescriptors, protectionClass:%@, QOS:%d", buf, 0x1Cu);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke;
    v19[3] = &unk_1E554A108;
    void v19[4] = self;
    id v20 = v12;
    __int16 v21 = v15;
    qos_class_t v24 = v17;
    id v22 = v10;
    id v23 = v11;
    _os_activity_initiate(&dword_18D0E3000, "fetch-cache-file-descriptors", OS_ACTIVITY_FLAG_DEFAULT, v19);
  }
  else
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

void __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"fetch-cache-file-descriptors" critical:0];
  id location = 0;
  objc_initWeak(&location, v2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_2;
  v9[3] = &unk_1E554A090;
  id v3 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  int v14 = *(_DWORD *)(a1 + 72);
  id v12 = *(id *)(a1 + 56);
  objc_copyWeak(&v13, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v9];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_4;
  id v7 = &unk_1E554A0E0;
  id v8 = *(id *)(a1 + 64);
  [(CSSearchableIndexRequest *)v2 setCompletionXPCValueBlock:&v4];
  [(CSSearchableIndexRequest *)v2 start];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "fetch_cache_file_descriptors", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "b", (const char *)[v4 UTF8String]);
  }
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5) {
    xpc_dictionary_set_string(v3, "pc", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_int64(v3, "qos", *(unsigned int *)(a1 + 72));
  +[CSXPCConnection dictionary:v3 setStringArray:*(void *)(a1 + 56) forKey:"identifiers"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5549C38;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  [v2 sendMessageAsync:v3 completion:v6];
  objc_destroyWeak(&v7);
}

void __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(xdict);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = xpc_dictionary_get_value(xdict, "file-descriptors");
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:0 xpcValue:WeakRetained];
  }
}

void __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__6;
  uint64_t v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  if (!v5 && v6 && MEMORY[0x192F9A3C0](v6) == MEMORY[0x1E4F14568] && xpc_array_get_count(v7))
  {
    uint64_t v8 = objc_opt_new();
    id v9 = (void *)v12[5];
    v12[5] = v8;

    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_376;
    applier[3] = &unk_1E554A0B8;
    applier[4] = &v11;
    xpc_array_apply(v7, applier);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_object_dispose(&v11, 8);
}

uint64_t __99__CSSearchableIndex__fetchCacheFileDescriptorsForProtectionClass_bundleID_items_completionHandler___block_invoke_376(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x192F9A3C0](v4);
    if (v6 == MEMORY[0x1E4F145B0])
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v8 = v5;
      goto LABEL_6;
    }
    if (v6 == MEMORY[0x1E4F145D8])
    {
      id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v8 = (void *)*MEMORY[0x1E4F1D260];
LABEL_6:
      [v7 addObject:v8];
    }
  }

  return 1;
}

- (void)bulkFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 objects:(id)a6 attributeKeyIndex:(int64_t)a7 includeParents:(BOOL)a8 completionHandler:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  unint64_t v19 = [v14 count];
  __int16 v35 = v17;
  uint64_t v36 = self;
  __int16 v34 = v18;
  if (!v19)
  {
    id v26 = (void *)[v14 mutableCopy];
    uint64_t v22 = -1;
    int64_t v27 = a7;
LABEL_23:
    [v26 addObject:@"_kMDItemOID"];
    uint64_t v23 = v19++;
    if (!v9) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  id v32 = v16;
  uint64_t v20 = 0;
  if (v9) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 1;
  }
  uint64_t v22 = -1;
  uint64_t v23 = -1;
  while (1)
  {
    qos_class_t v24 = [v14 objectAtIndexedSubscript:v20];
    uint64_t v25 = v24;
    if (v23 == -1 && [v24 isEqualToString:@"_kMDItemOID"])
    {
      --v21;
      if (!v9 || v22 != -1)
      {
        uint64_t v23 = v20;
        goto LABEL_29;
      }
      uint64_t v23 = v20;
      goto LABEL_17;
    }
    if (v9 && v22 == -1) {
      break;
    }
LABEL_17:

    if (v19 == ++v20)
    {
      if (v21) {
        goto LABEL_19;
      }
LABEL_30:
      id v26 = v14;
      id v16 = v32;
      __int16 v28 = v36;
      int64_t v27 = a7;
      goto LABEL_31;
    }
  }
  if (![v25 isEqualToString:@"_kMDItemOIDParent"])
  {
    uint64_t v22 = -1;
    goto LABEL_17;
  }
  --v21;
  if (v23 == -1)
  {
    uint64_t v22 = v20;
    goto LABEL_17;
  }
  uint64_t v22 = v20;
LABEL_29:

  if (!v21) {
    goto LABEL_30;
  }
LABEL_19:
  id v26 = (void *)[v14 mutableCopy];
  id v16 = v32;
  int64_t v27 = a7;
  if (v23 == -1) {
    goto LABEL_23;
  }
  if (v9)
  {
LABEL_24:
    if (v22 == -1)
    {
      [v26 addObject:@"_kMDItemOIDParent"];
      ++v19;
    }
  }
LABEL_26:
  __int16 v28 = v36;

LABEL_31:
  BOOL v29 = v19 <= v27 || v27 <= -1;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __125__CSSearchableIndex_bulkFetchAttributes_protectionClass_bundleID_objects_attributeKeyIndex_includeParents_completionHandler___block_invoke;
  v37[3] = &unk_1E554A158;
  if (v29) {
    uint64_t v30 = v23;
  }
  else {
    uint64_t v30 = v27;
  }
  unint64_t v39 = v19;
  uint64_t v40 = v30;
  id v38 = v34;
  id v31 = v34;
  [(CSSearchableIndex *)v28 _fetchAttributes:v26 protectionClass:v15 bundleID:v16 items:v35 includeParents:v9 options:0 completionHandler:v37];
}

void __125__CSSearchableIndex_bulkFetchAttributes_protectionClass_bundleID_objects_attributeKeyIndex_includeParents_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)_MDPlistBytesCopyPlistAtIndex();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v5 = 0;
    if (isKindOfClass)
    {
      unint64_t v6 = [v3 count];
      if (v6 < 2)
      {
        id v5 = 0;
      }
      else
      {
        unint64_t v7 = v6;
        id v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v6 - 1];
        uint64_t v8 = (void *)*MEMORY[0x1E4F1D260];
        for (uint64_t i = 1; i != v7; ++i)
        {
          id v10 = [v3 objectAtIndexedSubscript:i];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count] == a1[5])
          {
            uint64_t v11 = [v10 objectAtIndexedSubscript:a1[6]];
            id v12 = v8;
            if (v8 != (void *)v11)
            {
              uint64_t v13 = (void *)v11;
              [v14 setObject:v10 forKeyedSubscript:v11];
              id v12 = v13;
            }
          }
        }
        id v5 = v14;
      }
    }
    id v15 = v5;
  }
  else
  {
    id v15 = 0;
  }
  (*(void (**)(void))(a1[4] + 16))();
}

+ (id)partialPathAttributes
{
  return &unk_1EDBD61A8;
}

+ (id)computePartialPathWithOID:(id)a3 pathKeyIdx:(unint64_t)a4 pathDictionary:(id)a5 attributeValues:(id)a6 depth:(int64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a7 <= 511 && ([v12 integerValue] & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    id v15 = [v14 objectForKeyedSubscript:v12];
    uint64_t v16 = [v15 objectAtIndexedSubscript:3];
    id v17 = (void *)v16;
    id v18 = 0;
    if (v16)
    {
      unint64_t v19 = (void *)*MEMORY[0x1E4F1D260];
      if (v16 != *MEMORY[0x1E4F1D260])
      {
        uint64_t v20 = [v15 objectAtIndexedSubscript:1];
        if (v20 == v19)
        {
          id v18 = 0;
        }
        else
        {
          id v30 = v20;
          if (([v20 integerValue] & 0xFFFFFFFFFFFFFFFDLL) != 0)
          {
            uint64_t v21 = [v15 objectAtIndexedSubscript:2];
            BOOL v22 = v21 == v19;
            uint64_t v23 = v21;
            if (v22
              || ![v21 isEqualToString:@"NSFileProviderRootContainerItemIdentifier"])
            {
              uint64_t v25 = [a1 computePartialPathWithOID:v30 pathKeyIdx:a4 pathDictionary:v13 attributeValues:v14 depth:a7 + 1];
              id v26 = v25;
              if (v25)
              {
                id v18 = [v25 stringByAppendingPathComponent:v17];
                int64_t v27 = [v15 objectAtIndexedSubscript:a4];
                [v13 setObject:v18 forKeyedSubscript:v27];
              }
              else
              {
                id v18 = 0;
              }
            }
            else
            {
              qos_class_t v24 = [v15 objectAtIndexedSubscript:a4];
              [v13 setObject:v17 forKeyedSubscript:v24];

              id v18 = v17;
            }
          }
          else
          {
            __int16 v28 = [v15 objectAtIndexedSubscript:a4];
            [v13 setObject:v17 forKeyedSubscript:v28];

            id v18 = v17;
          }
          uint64_t v20 = v30;
        }
      }
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_bulkFetchPartialPathsForObjects:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 4;
  }

  uint64_t v16 = +[CSSearchableIndex partialPathAttributes];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__CSSearchableIndex__bulkFetchPartialPathsForObjects_protectionClass_bundleID_completionHandler___block_invoke;
  v18[3] = &unk_1E554A180;
  id v19 = v10;
  uint64_t v20 = v15;
  id v17 = v10;
  [(CSSearchableIndex *)self bulkFetchAttributes:v16 protectionClass:v12 bundleID:v11 objects:v13 attributeKeyIndex:0 includeParents:1 completionHandler:v18];
}

void __97__CSSearchableIndex__bulkFetchPartialPathsForObjects_protectionClass_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  if ([v3 count])
  {
    id v5 = objc_opt_new();

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = +[CSSearchableIndex computePartialPathWithOID:pathKeyIdx:pathDictionary:attributeValues:depth:](CSSearchableIndex, "computePartialPathWithOID:pathKeyIdx:pathDictionary:attributeValues:depth:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), *(void *)(a1 + 40), v5, v6, 0, (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = v4;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)bulkFetchCacheFileDescriptorForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  unint64_t v15 = [v13 count];
  if (v15 < 0xB)
  {
    id v19 = v13;
  }
  else
  {
    uint64_t v16 = v15;
    uint64_t v17 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableIndex bulkFetchCacheFileDescriptorForProtectionClass:bundleID:identifiers:reason:completionHandler:](v16, v17, v18);
    }

    objc_msgSend(v13, "subarrayWithRange:", 0, 10);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v20 = v19;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __114__CSSearchableIndex_bulkFetchCacheFileDescriptorForProtectionClass_bundleID_identifiers_reason_completionHandler___block_invoke;
  v22[3] = &unk_1E554A1A8;
  id v23 = v14;
  id v21 = v14;
  [(CSSearchableIndex *)self _fetchCacheFileDescriptorsForProtectionClass:v11 bundleID:v12 items:v20 completionHandler:v22];
}

uint64_t __114__CSSearchableIndex_bulkFetchCacheFileDescriptorForProtectionClass_bundleID_identifiers_reason_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateCorrectionsWithFilePath:(id)a3 completionHandler:(id)a4
{
}

- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CSSearchableIndex updateCorrectionsWithFilePath:options:completionHandler:]();
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke;
  activity_block[3] = &unk_1E5549288;
  activity_void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  _os_activity_initiate(&dword_18D0E3000, "update-corrections", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:*(void *)(a1 + 32) label:@"update-corrections"];
  id location = 0;
  objc_initWeak(&location, v2);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5549DA0;
  id v3 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  objc_copyWeak(&v8, &location);
  [(CSSearchableIndexRequest *)v2 setPerformBlock:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_4;
  v4[3] = &unk_1E5549DC8;
  id v5 = *(id *)(a1 + 48);
  [(CSSearchableIndexRequest *)v2 setCompletionDataBlock:v4];
  [(CSSearchableIndexRequest *)v2 start];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "update-corrections", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    xpc_dictionary_set_string(v3, "filepath", (const char *)[v4 UTF8String]);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_3;
  v5[3] = &unk_1E5549C38;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  [v2 sendMessageAsync:v3 completion:v5];
  objc_destroyWeak(&v6);
}

void __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = csindex_xpc_dictionary_decode_status_with_error(v6);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained retryIfNecessaryWithError:v3];
  }
  else
  {
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"filepath" sizeKey:"filepath-size" fromXPCDictionary:v6];
    id v5 = objc_loadWeakRetained((id *)(a1 + 32));
    [v5 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

uint64_t __77__CSSearchableIndex_updateCorrectionsWithFilePath_options_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isEmbeddingVersionCurrent:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v6 = (void *)getSKGEmbeddingVersionManagerClass_softClass;
  uint64_t v20 = getSKGEmbeddingVersionManagerClass_softClass;
  if (!getSKGEmbeddingVersionManagerClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getSKGEmbeddingVersionManagerClass_block_invoke;
    id v16[3] = &unk_1E5548E88;
    void v16[4] = &v17;
    __getSKGEmbeddingVersionManagerClass_block_invoke((uint64_t)v16);
    id v6 = (void *)v18[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v17, 8);
  if (v7)
  {
    id v15 = 0;
    id v8 = [v7 currentEmbeddingVersionDataReturningError:&v15];
    id v9 = v15;
    id v10 = v9;
    if (a4 && v9)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      v22[0] = v9;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a4 = [v11 errorWithDomain:@"CSIndexErrorDomain" code:-2003 userInfo:v12];
    }
    if (v8)
    {
      int v13 = [v8 isEqual:v5];
      if (((a4 != 0) & (v13 ^ 1)) == 1)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CSIndexErrorDomain" code:-2004 userInfo:MEMORY[0x1E4F1CC08]];
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void)setProtectionClass:(id)a3
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSMutableArray)batchedItemsToIndex
{
  return self->_batchedItemsToIndex;
}

- (void)setBatchedItemsToIndex:(id)a3
{
}

- (NSMutableArray)batchedItemIdentifiersToDelete
{
  return self->_batchedItemIdentifiersToDelete;
}

- (void)setBatchedItemIdentifiersToDelete:(id)a3
{
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_int64_t options = a3;
}

- (BOOL)batchOpen
{
  return self->_batchOpen;
}

- (void)setBatchOpen:(BOOL)a3
{
  self->_batchOpen = a3;
}

- (BOOL)noBatching
{
  return self->_noBatching;
}

- (void)setNoBatching:(BOOL)a3
{
  self->_noBatching = a3;
}

- (NSNumber)indexID
{
  return self->_indexID;
}

+ (NSArray)allSupportedProtectionClasses
{
  if (allSupportedProtectionClasses_once != -1) {
    dispatch_once(&allSupportedProtectionClasses_once, &__block_literal_global_658);
  }
  id v2 = (void *)allSupportedProtectionClasses_allProtectionClasses;

  return (NSArray *)v2;
}

void __63__CSSearchableIndex_InternalSPI__allSupportedProtectionClasses__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x192F99810]();
  uint64_t v1 = *MEMORY[0x1E4F28348];
  v5[0] = *MEMORY[0x1E4F28340];
  v5[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F28358];
  v5[2] = *MEMORY[0x1E4F28368];
  v5[3] = v2;
  void v5[4] = priorityIndexName;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  id v4 = (void *)allSupportedProtectionClasses_allProtectionClasses;
  allSupportedProtectionClasses_allProtectionClasses = v3;
}

- (void)issueCacheCommand:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[CSSearchableIndexRequest alloc] initWithSearchableIndex:self label:@"command"];
  id location = 0;
  objc_initWeak(&location, v8);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__6;
  void v18[4] = __Block_byref_object_dispose__6;
  id v19 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke;
  v14[3] = &unk_1E554A1F8;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  objc_copyWeak(&v17, &location);
  uint64_t v16 = v18;
  [(CSSearchableIndexRequest *)v8 setPerformBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_3;
  v11[3] = &unk_1E554A220;
  id v10 = v7;
  id v12 = v10;
  int v13 = v18;
  [(CSSearchableIndexRequest *)v8 setCompletionDataBlock:v11];
  [(CSSearchableIndexRequest *)v8 start];

  objc_destroyWeak(&v17);
  _Block_object_dispose(v18, 8);

  objc_destroyWeak(&location);
}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "xpc_dictionary_for_command:requiresInitialization:", "cache-command-issue", objc_msgSend(v2, "previouslyInitialized") ^ 1);
  xpc_dictionary_set_string(v3, "cache-request", (const char *)[*(id *)(a1 + 40) UTF8String]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_2;
  v4[3] = &unk_1E554A1D0;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  void v4[4] = *(void *)(a1 + 48);
  [v2 sendMessageAsync:v3 completion:v4];
  objc_destroyWeak(&v5);
}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v4 = csindex_xpc_dictionary_decode_status_with_error(v7);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained retryIfNecessaryWithError:v4];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id WeakRetained = +[CSXPCConnection dataWrapperForKey:"cache-data-key" sizeKey:"cache-data-size" fromXPCDictionary:v7];
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    [v6 retryIfNecessaryWithError:0 dataWrapper:WeakRetained];
  }
}

void __73__CSSearchableIndex_SpotlightCache__issueCacheCommand_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v6 = a2;
    id v7 = [a3 data];
    (*(void (**)(uint64_t, id, void, id))(v3 + 16))(v3, v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
  }
}

void __38__CSSearchableIndex__delegateCheckIn___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  id v10 = WeakRetained;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "Checking in with the index agent for reason:\"%@\", delegate:%@, index:%@", (uint8_t *)&v7, 0x20u);
}

- (void)endIndexBatchWithExpectedClientState:newClientState:critical:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "Finishing index batch", v2, v3, v4, v5, v6);
}

- (void)indexSearchableItems:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_18D0E3000, a2, v3, "Batching %ld items", v4);
}

- (void)indexSearchableItems:(void *)a1 completionHandler:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18D0E3000, v1, v2, "Failed to batch indexing for %ld items", v3, v4, v5, v6, v7);
}

void __33__CSSearchableIndex_mainBundleID__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_validateClientState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = 1024;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 length];
  OUTLINED_FUNCTION_10(&dword_18D0E3000, a2, v3, "Provided clientState was larger than %lu bytes (was %lu bytes)", (uint8_t *)&v4);
}

- (void)_validateOperationWithItems:(void *)a1 identifiers:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_18D0E3000, v1, v2, "Item count %lu exceeded limit %u", v3, v4, v5, v6, v7);
}

- (void)_validateOperationWithItems:(void *)a1 identifiers:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_18D0E3000, v1, v2, "delete identifiers count %lu exceeded limit %u", v3, v4, v5, v6, v7);
}

- (void)_validateOperationWithItems:identifiers:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Invalid identifier %@", v2, v3, v4, v5, v6);
}

- (void)_validateOperationWithItems:identifiers:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Invalid item identifier %@", v2, v3, v4, v5, v6);
}

- (void)_validateOperationWithItems:identifiers:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10(&dword_18D0E3000, v0, (uint64_t)v0, "Item's protection class (%@) doesn't match %@", v1);
}

- (void)_validateOperationWithItems:identifiers:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_18D0E3000, v0, v1, "Indexing is not available on this device", v2, v3, v4, v5, v6);
}

- (void)deleteSearchableItemsWithIdentifiers:(void *)a1 reason:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_18D0E3000, a2, v3, "Batching deletes for %ld identifiers", v4);
}

- (void)deleteSearchableItemsWithIdentifiers:(void *)a1 reason:(uint64_t)a2 completionHandler:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 134218242;
  uint64_t v7 = [a1 count];
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  OUTLINED_FUNCTION_10(&dword_18D0E3000, a3, v5, "Failed to batch deletes for %ld identifiers, error:%@", (uint8_t *)&v6);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:options:reason:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "domainIdentifiers:%@, options:0x%lx");
}

- (void)provideFileURLsForBundle:itemIdentifiers:typeIdentifier:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "itemIdentifiers may not be nil.", v2, v3, v4, v5, v6);
}

void __103__CSSearchableIndex_provideFileURLsForBundle_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "error unarchiving data: %@", v2, v3, v4, v5, v6);
}

- (void)finishIndexingWhileLocked:protectionClass:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "(%@) finishIndexingWhileLocked: %@");
}

- (void)indexUserActivity:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "Missing entitlement.", v2, v3, v4, v5, v6);
}

void __39__CSSearchableIndex_indexUserActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "Serialized UA, action:%@, item:%@");
}

void __44__CSSearchableIndex__indexActivities_flush___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18D0E3000, v0, v1, "activities not processed", v2, v3, v4, v5, v6);
}

void __76__CSSearchableIndex_performIndexJob_protectionClass_acknowledgementHandler___block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  int v5 = 138412802;
  uint64_t v6 = v2;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "Completed index job:%@, index:%@, error:%@", (uint8_t *)&v5, 0x20u);
}

- (void)deleteInteractionsWithIdentifiers:bundleID:protectionClass:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_3(&dword_18D0E3000, v0, v1, "identifiers:%@", v2, v3, v4, v5, v6);
}

- (void)bulkFetchCacheFileDescriptorForProtectionClass:(uint64_t)a3 bundleID:identifiers:reason:completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 10;
  OUTLINED_FUNCTION_10(&dword_18D0E3000, a2, a3, "bulkFetchCacheFileDescriptorForProtectionClass, number of identifiers: %lu exceeds maximum of %lu, truncated", (uint8_t *)&v3);
}

- (void)updateCorrectionsWithFilePath:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_2(&dword_18D0E3000, v0, v1, "updateCorrectionsFileWithFilePath, filePath:%@, options:0x%lx");
}

@end