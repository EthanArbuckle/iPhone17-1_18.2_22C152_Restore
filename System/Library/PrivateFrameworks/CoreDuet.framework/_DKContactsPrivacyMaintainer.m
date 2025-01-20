@interface _DKContactsPrivacyMaintainer
- (_DKContactsPrivacyMaintainer)initWithKnowledgeStore:(id)a3 spotlightRecorder:(id)a4;
- (void)_deleteIntentsRelatedToContactIdentifiers:(id)a3;
- (void)_unregisterContactDeletionNotifications;
- (void)cleanupPendingDeletedContacts;
- (void)dealloc;
- (void)handleContactDeletionNotification;
- (void)handleRecentlyDeletedContactsWithLimit:(unint64_t)a3;
- (void)registerContactDeletionNotifications;
- (void)scheduleIntentsPruningXPCActivity;
@end

@implementation _DKContactsPrivacyMaintainer

- (_DKContactsPrivacyMaintainer)initWithKnowledgeStore:(id)a3 spotlightRecorder:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DKContactsPrivacyMaintainer;
  v9 = [(_DKContactsPrivacyMaintainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knowledgeStore, a3);
    objc_storeStrong((id *)&v10->_spotlightRecorder, a4);
    v10->_notifyToken = -1;
    uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v10->_userDefaults;
    v10->_userDefaults = (NSUserDefaults *)v11;
  }
  return v10;
}

- (void)dealloc
{
  [(_DKContactsPrivacyMaintainer *)self _unregisterContactDeletionNotifications];
  v3.receiver = self;
  v3.super_class = (Class)_DKContactsPrivacyMaintainer;
  [(_DKContactsPrivacyMaintainer *)&v3 dealloc];
}

- (void)registerContactDeletionNotifications
{
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)5u, 0);

  v5 = dispatch_queue_create("contactChangeIntentDeletionQueue", v4);
  id v6 = objc_alloc(MEMORY[0x1E4F93B98]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke;
  v18[3] = &unk_1E560D578;
  v18[4] = self;
  id v7 = (_PASSimpleCoalescingTimer *)[v6 initWithQueue:v5 operation:v18];
  coalescingContactChangeTimer = self->_coalescingContactChangeTimer;
  self->_coalescingContactChangeTimer = v7;

  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_2;
  handler[3] = &unk_1E560E5A8;
  objc_copyWeak(&v16, &location);
  handler[4] = self;
  notify_register_dispatch("__ABDataBaseChangedByOtherProcessNotification", &self->_notifyToken, v5, handler);
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10 = getCNContactStoreDidChangeNotification();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68___DKContactsPrivacyMaintainer_registerContactDeletionNotifications__block_invoke_499;
  v13[3] = &unk_1E560E5D0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  uint64_t v11 = [v9 addObserverForName:v10 object:0 queue:0 usingBlock:v13];
  notificationCenterToken = self->_notificationCenterToken;
  self->_notificationCenterToken = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_unregisterContactDeletionNotifications
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  if (self->_notificationCenterToken)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_notificationCenterToken];
  }
}

- (void)handleContactDeletionNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"kCDIntentDeletionPendingDeletesQueued"];
  id v4 = +[_CDLogging spotlightReceiverChannel];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification pendingDeletesQueued = YES, skipping", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification pendingDeletesQueued = NO, proceeding", (uint8_t *)&v10, 0xCu);
    }
    [(_DKContactsPrivacyMaintainer *)self handleRecentlyDeletedContactsWithLimit:300];
  }
}

- (void)handleRecentlyDeletedContactsWithLimit:(unint64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(NSUserDefaults *)self->_userDefaults dataForKey:@"kCDIntentDeletionContactStoreChangeHistoryToken"];
  id v6 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification using startingToken: %@", buf, 0x16u);
  }
  getCNChangeHistoryFetchRequestClass();
  v9 = objc_opt_new();
  [v9 setStartingToken:v5];
  getCNContactStoreClass();
  int v10 = objc_opt_new();
  id v27 = 0;
  uint64_t v11 = [v10 enumeratorForChangeHistoryFetchRequest:v9 error:&v27];
  id v12 = v27;
  v13 = v12;
  if (!v11 || v12)
  {
    id v16 = +[_CDLogging spotlightReceiverChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(_DKContactsPrivacyMaintainer *)(uint64_t)self handleRecentlyDeletedContactsWithLimit:v16];
    }
  }
  else
  {
    id v14 = [_CDContactChangeHistoryEventVisitor alloc];
    v15 = [v11 value];
    id v16 = [(_CDContactChangeHistoryEventVisitor *)v14 initWithChangeEnumerator:v15];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v33 = 1;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71___DKContactsPrivacyMaintainer_handleRecentlyDeletedContactsWithLimit___block_invoke;
    v25[3] = &unk_1E560E5F8;
    v25[4] = self;
    v25[5] = v26;
    v25[6] = buf;
    v25[7] = a3;
    [v16 visitEventsWithBatchSize:100 batchCallback:v25];
    userDefaults = self->_userDefaults;
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v18 = [v11 currentHistoryToken];
      [(NSUserDefaults *)userDefaults setValue:v18 forKey:@"kCDIntentDeletionContactStoreChangeHistoryToken"];

      v19 = +[_CDLogging spotlightReceiverChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = [v11 currentHistoryToken];
        *(_DWORD *)v28 = 138412546;
        id v29 = v21;
        __int16 v30 = 2112;
        v31 = v22;
        _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification saved new currentHistoryToken: %@", v28, 0x16u);
      }
    }
    else
    {
      [(NSUserDefaults *)self->_userDefaults setBool:1 forKey:@"kCDIntentDeletionPendingDeletesQueued"];
      v19 = +[_CDLogging spotlightReceiverChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        *(_DWORD *)v28 = 138412290;
        id v29 = v24;
        _os_log_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_DEFAULT, "%@ - handleContactDeletionNotification NOT saving currentHistoryToken, set pendingDeletesQueued = YES", v28, 0xCu);
      }
    }

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)_deleteIntentsRelatedToContactIdentifiers:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v72 = objc_opt_new();
  id BMLibraryStreamsPrunerClass = getBMLibraryStreamsPrunerClass();
  BOOL v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  [BMLibraryStreamsPrunerClass pruneWithDeletedContactIdentifiers:v5];

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v6 = v3;
  uint64_t v69 = [v6 countByEnumeratingWithState:&v89 objects:v104 count:16];
  if (v69)
  {
    uint64_t v7 = *(void *)v90;
    uint64_t v78 = *MEMORY[0x1E4F28348];
    unint64_t v8 = 0x1E4F28000uLL;
    v71 = v6;
    uint64_t v68 = *(void *)v90;
    do
    {
      uint64_t v9 = 0;
      while (2)
      {
        if (*(void *)v90 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v70 = v9;
        uint64_t v10 = *(void *)(*((void *)&v89 + 1) + 8 * v9);
        uint64_t v11 = +[_DKIntentMetadataKey relatedContactIdentifiers];
        uint64_t v12 = +[_DKQuery structuredMetadataKeyPathForMetadataKey:v11];

        v13 = *(void **)(v8 + 2976);
        id v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", v12);
        v103[0] = v14;
        v73 = v12;
        v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K CONTAINS[n] %@", v12, v10];
        v103[1] = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:2];
        v74 = [v13 andPredicateWithSubpredicates:v16];

        v17 = 0;
        v18 = 0;
        uint64_t v19 = 0;
        do
        {
          context = (void *)MEMORY[0x192FB2F20]();
          v20 = +[_DKSystemEventStreams appIntentsStream];
          v102 = v20;
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
          v22 = +[_DKQuery startDateSortDescriptorAscending:1];
          v101 = v22;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
          v24 = +[_DKEventQuery eventQueryWithPredicate:v74 eventStreams:v21 offset:v19 limit:100 sortDescriptors:v23];

          knowledgeStore = self->_knowledgeStore;
          id v88 = 0;
          v26 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v24 error:&v88];
          id v27 = v88;

          v28 = +[_CDLogging spotlightReceiverChannel];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            v58 = (objc_class *)objc_opt_class();
            v59 = NSStringFromClass(v58);
            uint64_t v60 = [v26 count];
            *(_DWORD *)buf = 138412802;
            v96 = v59;
            __int16 v97 = 2048;
            uint64_t v98 = v60;
            __int16 v99 = 2112;
            id v100 = v27;
            _os_log_debug_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_DEBUG, "%@ _deleteIntentsRelatedToContactIdentifiers fetched %lu intent events, with err: %@", buf, 0x20u);
          }
          if (v27)
          {

            id v6 = v71;
            v66 = (void *)v72;
            v61 = v71;
            v62 = v73;
            goto LABEL_40;
          }
          v75 = v24;
          uint64_t v76 = v19;
          id v29 = objc_opt_new();
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v30 = v26;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v84 objects:v94 count:16];
          v17 = v30;
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v85;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v85 != v33) {
                  objc_enumerationMutation(v17);
                }
                v35 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                v36 = (void *)MEMORY[0x192FB2F20]();
                v37 = [v35 metadata];
                v38 = +[_DKIntentMetadataKey interactionIdentifier];
                v39 = [v37 objectForKeyedSubscript:v38];

                v40 = [v35 source];
                v41 = [v40 bundleID];

                if (v39) {
                  BOOL v42 = v41 == 0;
                }
                else {
                  BOOL v42 = 1;
                }
                if (!v42)
                {
                  v43 = [v29 objectForKeyedSubscript:v41];

                  if (!v43)
                  {
                    v44 = objc_opt_new();
                    [v29 setObject:v44 forKeyedSubscript:v41];
                  }
                  v45 = [v29 objectForKeyedSubscript:v41];
                  [v45 addObject:v39];
                }
              }
              id v30 = v17;
              uint64_t v32 = [v17 countByEnumeratingWithState:&v84 objects:v94 count:16];
            }
            while (v32);
          }

          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          v46 = [v29 allKeys];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v81;
            do
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v81 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void *)(*((void *)&v80 + 1) + 8 * j);
                v52 = [v29 objectForKeyedSubscript:v51];
                v53 = +[_CDLogging spotlightReceiverChannel];
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  v56 = (objc_class *)objc_opt_class();
                  v57 = NSStringFromClass(v56);
                  *(_DWORD *)buf = 138412802;
                  v96 = v57;
                  __int16 v97 = 2112;
                  uint64_t v98 = v51;
                  __int16 v99 = 2112;
                  id v100 = v52;
                  _os_log_debug_impl(&dword_18ECEB000, v53, OS_LOG_TYPE_DEBUG, "%@ _deleteIntentsRelatedToContactIdentifiers deleting for bundleId: %@ following identifiers: %@", buf, 0x20u);
                }
                spotlightRecorder = self->_spotlightRecorder;
                v55 = [v52 allObjects];
                [(_CDSpotlightItemRecorder *)spotlightRecorder deleteInteractionsWithIdentifiers:v55 bundleID:v51 protectionClass:v78];
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v80 objects:v93 count:16];
            }
            while (v48);
          }

          uint64_t v19 = v76 + 100;
          v18 = v75;
        }
        while ([v17 count] == 100);

        uint64_t v9 = v70 + 1;
        id v6 = v71;
        uint64_t v7 = v68;
        unint64_t v8 = 0x1E4F28000;
        if (v70 + 1 != v69) {
          continue;
        }
        break;
      }
      uint64_t v69 = [v71 countByEnumeratingWithState:&v89 objects:v104 count:16];
    }
    while (v69);
  }

  v61 = objc_opt_new();
  v62 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = (objc_class *)objc_opt_class();
    v64 = NSStringFromClass(v63);
    uint64_t v65 = [v6 count];
    v66 = (void *)v72;
    [v61 timeIntervalSinceDate:v72];
    *(_DWORD *)buf = 138412802;
    v96 = v64;
    __int16 v97 = 2048;
    uint64_t v98 = v65;
    __int16 v99 = 2048;
    id v100 = v67;
    _os_log_impl(&dword_18ECEB000, v62, OS_LOG_TYPE_DEFAULT, "%@ _deleteIntentsRelatedToContactIdentifiers for %lu contact identifiers took %f seconds", buf, 0x20u);
  }
  else
  {
    v66 = (void *)v72;
  }
LABEL_40:
}

- (void)scheduleIntentsPruningXPCActivity
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v2, v3, "%@ scheduleIntentsPruningXPCActivity scheduled XPC activity", v4, v5, v6, v7, v8);
}

- (void)cleanupPendingDeletedContacts
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(_DKContactsPrivacyMaintainer *)self handleRecentlyDeletedContactsWithLimit:-1];
  [(NSUserDefaults *)self->_userDefaults setBool:0 forKey:@"kCDIntentDeletionPendingDeletesQueued"];
  uint64_t v3 = +[_CDLogging spotlightReceiverChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_DEFAULT, "%@ - cleanupPendingDeletedContacts setting pendingDeletesQueued = NO", (uint8_t *)&v6, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingContactChangeTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenterToken, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_spotlightRecorder, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)handleRecentlyDeletedContactsWithLimit:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_ERROR, "%@ - handleContactDeletionNotification failed to fetch contacts enumerator with error: %@", v7, 0x16u);
}

@end