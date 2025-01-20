@interface BMDaemon
+ (BMDSLGraphValidator)DSLValidator;
+ (BOOL)isAgent;
+ (BOOL)isAgentOrEmbedded;
+ (id)BiomeAgentLaunchNotification;
+ (id)biomedLaunchNotification;
+ (id)loadDKStreamNameToTTL;
+ (id)systemComputePublisherServiceName;
+ (id)systemComputePublisherStreamName;
+ (id)systemComputeSourceServiceName;
+ (id)userComputePublisherServiceName;
+ (id)userComputePublisherStreamName;
+ (id)userComputeSourceServiceName;
+ (void)_donateDeviceBootSessionEventsWithBootDate:(id)a3 queue:(id)a4;
+ (void)_donateDeviceMetadataWithBootDate:(id)a3;
+ (void)_registerWithSpaceAttributionWithActivity:(id)a3 domain:(unint64_t)a4 completion:(id)a5;
+ (void)donateLaunchEventsWithQueue:(id)a3;
+ (void)pruneFeatureStoreWithActivity:(id)a3;
+ (void)prunePrivateStreamDirectory:(id)a3 maxAge:(double)a4 maxStreamSize:(unint64_t)a5 activity:(id)a6;
+ (void)prunePublicStreamsWithActivity:(id)a3;
+ (void)pruneRestrictedStreamsInDomain:(unint64_t)a3 account:(id)a4 activity:(id)a5;
+ (void)pruneRestrictedStreamsWithActivity:(id)a3;
+ (void)pruneTemporaryFiles;
+ (void)pruneTemporaryFilesInDirectory:(id)a3;
+ (void)registerWithSpaceAttributionWithActivity:(id)a3 completion:(id)a4;
+ (void)registerXPCActivities;
+ (void)runLaunchTasks;
- (BMComputeSourceServer)systemSourceServer;
- (BMComputeSourceServer)userSourceServer;
- (BMComputeSubscriptionSubstreamManager)subscriptionSubstreamManager;
- (BMComputeXPCPublisherClient)systemStreamsPublisherClient;
- (BMComputeXPCPublisherServer)systemPublisherServer;
- (BMComputeXPCPublisherServer)userPublisherServer;
- (BMComputeXPCPublisherStorage)systemBookmarkStorage;
- (BMComputeXPCPublisherStorage)userBookmarkStorage;
- (BMDaemon)initWithQueue:(id)a3 eventReporter:(id)a4;
- (BMViewEventReporter)eventReporter;
- (NSMutableDictionary)activeSystemSubscriptionIdentifiers;
- (NSMutableDictionary)subscribedSystemStreams;
- (OS_dispatch_queue)queue;
- (id)_bookmarkStorage;
- (id)_publisherServer;
- (void)_publisherServer;
- (void)_subscribeStreamsForViews;
- (void)_subscribeSystemStream:(id)a3 subscriptionIdentifier:(id)a4 useCase:(id)a5;
- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6;
- (void)publisherServer:(id)a3 didAddSubscription:(id)a4;
- (void)publisherServer:(id)a3 didClaimSubscription:(id)a4;
- (void)publisherServer:(id)a3 didRemoveSubscription:(id)a4;
- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 account:(id)a5 remoteName:(id)a6 storeEvent:(id)a7;
- (void)setActiveSystemSubscriptionIdentifiers:(id)a3;
- (void)setSubscribedSystemStreams:(id)a3;
- (void)setSystemStreamsPublisherClient:(id)a3;
- (void)setUpNotificationHandler;
@end

@implementation BMDaemon

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v13 = 138413058;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_INFO, "Completed sink for subscription %@ based on new %@ event, completion: %@. Bookmark: %@", (uint8_t *)&v13, 0x2Au);
  }

  if (![v5 state])
  {
    v10 = [*(id *)(a1 + 48) _bookmarkStorage];
    v11 = [*(id *)(a1 + 32) identifier];
    v12 = [*(id *)(a1 + 32) client];
    [v10 writeBookmark:v6 forSubscriptionWithIdentifier:v11 client:v12];
  }
}

uint64_t __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_47(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __36__BMDaemon_setUpNotificationHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MEMORY[0x192FB1AF0]() == MEMORY[0x1E4F14590])
  {
    v3 = (void *)MEMORY[0x192FB0D60]();
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14560]);
    id v5 = [NSString stringWithUTF8String:string];
    id v6 = (void *)os_transaction_create();
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_18E67D000, v7, OS_LOG_TYPE_INFO, "Received notifyd notification: %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v8 = [NSString stringWithUTF8String:"com.apple.Preferences.ResetPrivacyWarningsNotification"];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      +[BMLibraryStreamsPruner pruneForResetPrivacyAndLocationWarnings];
    }
    else
    {
      v10 = [NSString stringWithUTF8String:"com.apple.siri.history.deletion.requested"];
      int v11 = [v5 isEqualToString:v10];

      if (v11)
      {
        +[BMLibraryStreamsPruner pruneSiriAndDictationHistory];
      }
      else
      {
        v12 = [NSString stringWithUTF8String:"AFAssistantEnablementDidChangeDarwinNotification"];
        int v13 = [v5 isEqualToString:v12];

        if (v13)
        {
          if (!CFPreferencesGetAppBooleanValue(@"Assistant Enabled", @"com.apple.assistant.support", 0)) {
            +[BMLibraryStreamsPruner pruneSiriDisabled];
          }
        }
        else if ([v5 isEqualToString:@"com.apple.suggestions.settingsChanged"])
        {
          if (+[BMDaemon isAgentOrEmbedded])
          {
            uint64_t v14 = (void *)CFPreferencesCopyAppValue(@"SiriCanLearnFromAppBlacklist", @"com.apple.suggestions");
            __int16 v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
            +[BMLibraryStreamsPruner pruneLearnFromThisAppDisabled:v15];
          }
        }
        else
        {
          uint64_t v16 = [NSString stringWithUTF8String:"com.apple.TextInput.RemoveAllDynamicDictionariesNotification"];
          int v17 = [v5 isEqualToString:v16];

          if (v17) {
            +[BMLibraryStreamsPruner pruneForResetKeyboardDictionary];
          }
        }
      }
    }
    id v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      id v20 = string;
      _os_log_impl(&dword_18E67D000, v18, OS_LOG_TYPE_INFO, "--- handled event %s ---", (uint8_t *)&v19, 0xCu);
    }
  }
}

+ (BOOL)isAgentOrEmbedded
{
  return 1;
}

- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v11);

  v12 = __biome_log_for_category();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a6;
    _os_log_impl(&dword_18E67D000, v12, OS_LOG_TYPE_INFO, "Received events pruned notification for stream %@ with reason: %lu", buf, 0x16u);
  }

  eventReporter = self->_eventReporter;
  if (a6 == 1)
  {
    int v19 = 0;
    char v14 = [(BMViewEventReporter *)eventReporter streamPrunedWithStreamIdentifier:v9 remoteName:v10 error:&v19];
    __int16 v15 = v19;
  }
  else
  {
    id v18 = 0;
    char v14 = [(BMViewEventReporter *)eventReporter streamDeletionWithStreamIdentifier:v9 remoteName:v10 error:&v18];
    __int16 v15 = v18;
  }
  id v16 = v15;
  if ((v14 & 1) == 0)
  {
    int v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[BMDaemon eventsPrunedWithStreamIdentifier:account:remoteName:reason:]();
    }
  }
}

- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 account:(id)a5 remoteName:(id)a6 storeEvent:(id)a7
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v66 = a4;
  id v63 = a5;
  id v64 = a6;
  id v71 = a7;
  v68 = self;
  int v13 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v13);

  char v14 = [(BMDaemon *)self _publisherServer];
  __int16 v15 = [v14 subscriptionsForStream:v67];

  id v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [(BMDaemon *)self _publisherServer];
    [v17 domain];
    id v18 = BMStringForServiceDomain();
    int v19 = [(BMDaemon *)v68 _bookmarkStorage];
    [v19 domain];
    id v20 = BMStringForServiceDomain();
    id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v98 = (uint64_t)v67;
    __int16 v99 = 2112;
    v100 = v21;
    __int16 v101 = 2112;
    id v102 = v71;
    _os_log_impl(&dword_18E67D000, v16, OS_LOG_TYPE_INFO, "Using publisher server for domain: %@, bookmark storage domain: %@ when processing new event write for stream %@ subscription count: %@, event: %@", buf, 0x34u);
  }
  if (v63)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, v68, @"BMDaemon.m", 457, @"Invalid parameter not satisfying: %@", @"account == nil" object file lineNumber description];
  }
  eventReporter = v68->_eventReporter;
  id v91 = 0;
  char v23 = [(BMViewEventReporter *)eventReporter streamUpdatedWithStreamIdentifier:v67 remoteName:v64 error:&v91];
  id v24 = v91;
  if ((v23 & 1) == 0)
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[BMDaemon sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:]();
    }
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v15;
  uint64_t v26 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v26)
  {
    uint64_t v70 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v88 != v70) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v29 = (void *)MEMORY[0x192FB0D60]();
        v30 = [v28 subscriber];
        if (v30)
        {
          v31 = __biome_log_for_category();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_fault_impl(&dword_18E67D000, v31, OS_LOG_TYPE_FAULT, "Biome compute subscriptions with subscribers are no longer supported, subscription %@", buf, 0xCu);
          }
        }
        else if (v71)
        {
          v32 = __biome_log_for_category();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            v33 = [v28 identifier];
            *(_DWORD *)buf = 138413058;
            *(void *)&uint8_t buf[4] = v71;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v66;
            *(_WORD *)&buf[22] = 2112;
            uint64_t v98 = (uint64_t)v67;
            __int16 v99 = 2112;
            v100 = v33;
            _os_log_impl(&dword_18E67D000, v32, OS_LOG_TYPE_INFO, "Processing local store event %@ at time %@ for %@ instead of reading from BiomeStorage for subscription %@", buf, 0x2Au);
          }
          v34 = (void *)MEMORY[0x1E4F1C9C8];
          [v71 timestamp];
          v35 = objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:");
          [v28 setInitialBookmarkTimestamp:v35];

          v36 = __biome_log_for_category();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v71;
            _os_log_impl(&dword_18E67D000, v36, OS_LOG_TYPE_INFO, "Publishing local store events, event: %@", buf, 0xCu);
          }

          v37 = [v28 graph];
          v31 = BMDSLGetPublisherForEvent((uint64_t)v37, v71);

          uint64_t v38 = MEMORY[0x1E4F143A8];
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke;
          v84[3] = &unk_1E55D6B88;
          v84[4] = v28;
          id v39 = v67;
          id v85 = v39;
          id v86 = v71;
          v78[0] = v38;
          v78[1] = 3221225472;
          v78[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_43;
          v78[3] = &unk_1E55D6BB0;
          id v79 = v86;
          id v80 = v66;
          v81 = v28;
          id v82 = v39;
          v83 = v68;
          id v40 = (id)[v31 sinkWithCompletion:v84 receiveInput:v78];
        }
        else
        {
          v41 = [(BMDaemon *)v68 _bookmarkStorage];
          id v77 = v24;
          v31 = [v28 fetchBookmarkFromStorage:v41 error:&v77];
          id v42 = v77;

          if (v42)
          {
            v43 = __biome_log_for_category();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v67;
              _os_log_error_impl(&dword_18E67D000, v43, OS_LOG_TYPE_ERROR, "Failed to fetch bookmark for subscription %@ when processing event write for %@", buf, 0x16u);
            }
          }
          else
          {
            if (!v31)
            {
              v44 = __biome_log_for_category();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                v45 = [v28 identifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v67;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v45;
                _os_log_impl(&dword_18E67D000, v44, OS_LOG_TYPE_DEFAULT, "No bookmark found for stream: %@ identifier: %@", buf, 0x16u);
              }
            }
            v46 = [v28 graph];
            v43 = [v46 bpsPublisher];

            if (BPSPipelineSupportsPullBasedPublishers())
            {
              uint64_t v65 = [v43 validateBookmarkNode:v31];
              if (v65)
              {
                v47 = __biome_log_for_category();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v28;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v67;
                  *(_WORD *)&buf[22] = 2112;
                  uint64_t v98 = v65;
                  _os_log_error_impl(&dword_18E67D000, v47, OS_LOG_TYPE_ERROR, "Bookmark failed validation %@ when processing event write for %@ %@", buf, 0x20u);
                }

                v48 = [(BMDaemon *)v68 _bookmarkStorage];
                v49 = [v28 identifier];
                v50 = [v28 client];
                [v48 removeBookmarkFileForSubscriptionWithIdentifier:v49 client:v50];

                v51 = [(BMDaemon *)v68 _bookmarkStorage];
                id v76 = 0;
                uint64_t v52 = [v28 fetchBookmarkFromStorage:v51 error:&v76];
                id v42 = v76;

                v31 = v52;
              }
              else
              {
                id v42 = 0;
              }
              [v43 applyBookmarkNode:v31];
              v54 = (void *)v65;
            }
            else
            {
              uint64_t v53 = [v43 withBookmark:v31];
              id v42 = 0;
              v54 = v43;
              v43 = v53;
            }

            uint64_t v55 = v26;
            uint64_t v56 = MEMORY[0x1E4F143A8];
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            LOBYTE(v98) = 0;
            v73[0] = MEMORY[0x1E4F143A8];
            v73[1] = 3221225472;
            v73[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_45;
            v73[3] = &unk_1E55D6BD8;
            v73[4] = v28;
            id v57 = v67;
            uint64_t v58 = v56;
            uint64_t v26 = v55;
            id v74 = v57;
            v75 = v68;
            v72[0] = v58;
            v72[1] = 3221225472;
            v72[2] = __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_47;
            v72[3] = &unk_1E55D6C00;
            v72[4] = buf;
            id v59 = (id)[v43 sinkWithBookmark:v31 completion:v73 receiveInput:v72];
            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              v60 = __biome_log_for_category();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v92 = 138412546;
                v93 = v28;
                __int16 v94 = 2112;
                id v95 = v67;
                _os_log_impl(&dword_18E67D000, v60, OS_LOG_TYPE_INFO, "Publishing downstream for subscription %@ based on new %@ event", v92, 0x16u);
              }

              v61 = [(BMDaemon *)v68 _publisherServer];
              [v61 receiveInputForSubscription:v28 streamIdentifier:v57 storeEvent:0];
            }
            _Block_object_dispose(buf, 8);
          }

          id v24 = v42;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v87 objects:v96 count:16];
    }
    while (v26);
  }
}

- (id)_publisherServer
{
  v3 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [MEMORY[0x1E4F29268] currentConnection];
  id v5 = [v4 serviceName];

  if (!v5)
  {
    int v15 = [(id)objc_opt_class() isAgent];
    id v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      [(BMDaemon *)v15 _publisherServer];
    }

    if (!v15) {
      goto LABEL_13;
    }
LABEL_12:
    userPublisherServer = self->_userPublisherServer;
LABEL_14:
    char v14 = userPublisherServer;
    goto LABEL_15;
  }
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(BMDaemon *)v4 _publisherServer];
  }

  v7 = [v4 serviceName];
  uint64_t v8 = +[BMDaemon userComputeSourceServiceName];
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    goto LABEL_12;
  }
  id v10 = [v4 serviceName];
  int v11 = +[BMDaemon systemComputeSourceServiceName];
  int v12 = [v10 isEqualToString:v11];

  if (v12)
  {
LABEL_13:
    userPublisherServer = self->_systemPublisherServer;
    goto LABEL_14;
  }
  int v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    [(BMDaemon *)(uint64_t)v4 _publisherServer];
  }

  char v14 = 0;
LABEL_15:

  return v14;
}

- (id)_bookmarkStorage
{
  v3 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v3);

  userBookmarkStorage = self->_userBookmarkStorage;

  return userBookmarkStorage;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)systemComputeSourceServiceName
{
  return @"com.apple.biome.compute.source";
}

+ (id)userComputeSourceServiceName
{
  return @"com.apple.biome.compute.source.user";
}

+ (BMDSLGraphValidator)DSLValidator
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = BiomeLibraryAndInternalLibraryNode();
  v3 = [v2 allValidKeyPaths];
  v4 = [MEMORY[0x1E4F4FA38] legacyValidKeyPaths];
  id v5 = [v3 setByAddingObjectsFromSet:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v7 = +[BMDSLStreamPublisher name];
  uint64_t v8 = [MEMORY[0x1E4F4FA30] name];
  int v9 = [MEMORY[0x1E4F4FA60] name];
  id v10 = [MEMORY[0x1E4F4FA58] name];
  int v11 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, 0);

  int v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EDDD7678, &unk_1EDDD7690, 0);
  id v13 = objc_alloc(MEMORY[0x1E4F1CA60]);
  char v14 = [MEMORY[0x1E4F4FA38] legacyStreamClassMapping];
  int v15 = (void *)[v13 initWithDictionary:v14];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = BiomeLibraryAndInternalLibraryNode();
  int v17 = [v16 allValidEventClasses];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        __int16 v22 = *(objc_class **)(*((void *)&v34 + 1) + 8 * i);
        char v23 = NSStringFromClass(v22);
        [v15 setObject:v22 forKeyedSubscript:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v19);
  }

  uint64_t v24 = objc_opt_class();
  v25 = (objc_class *)objc_opt_class();
  uint64_t v26 = NSStringFromClass(v25);
  [v15 setObject:v24 forKeyedSubscript:v26];

  uint64_t v27 = objc_opt_class();
  v28 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v28);
  [v15 setObject:v27 forKeyedSubscript:v29];

  id v30 = objc_alloc(MEMORY[0x1E4F4FA38]);
  v31 = (void *)[v15 copy];
  v32 = (void *)[v30 initWithValidKeyPaths:v5 allowedOperations:v11 allowedStreamTypes:v12 eventStreamClassMapping:v31];

  return (BMDSLGraphValidator *)v32;
}

- (BMDaemon)initWithQueue:(id)a3 eventReporter:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(v7);
  v68.receiver = self;
  v68.super_class = (Class)BMDaemon;
  int v9 = [(BMDaemon *)&v68 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_eventReporter, a4);
    int v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.biomed.background", v11);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v12;

    char v14 = (void *)MEMORY[0x1E4F4FA38];
    int v15 = +[BMDaemon DSLValidator];
    [v14 setCurrentProcessValidator:v15];

    id v16 = [BMComputeXPCPublisherStorage alloc];
    uint64_t v17 = *MEMORY[0x1E4F4FB08];
    uint64_t v18 = [(BMComputeXPCPublisherStorage *)v16 initWithUseCase:*MEMORY[0x1E4F4FB08] domain:0 isClient:0];
    userBookmarkStorage = v10->_userBookmarkStorage;
    v10->_userBookmarkStorage = (BMComputeXPCPublisherStorage *)v18;

    [(BMComputeXPCPublisherStorage *)v10->_userBookmarkStorage initializeBiomeDSLDirectoryForBootSession];
    uint64_t v20 = [[BMComputeXPCPublisherStorage alloc] initWithUseCase:v17 domain:1 isClient:0];
    systemBookmarkStorage = v10->_systemBookmarkStorage;
    v10->_systemBookmarkStorage = v20;

    [(BMComputeXPCPublisherStorage *)v10->_systemBookmarkStorage initializeBiomeDSLDirectoryForBootSession];
    __int16 v22 = [[BMComputeSubscriptionSubstreamManager alloc] initWithQueue:v10->_queue];
    subscriptionSubstreamManager = v10->_subscriptionSubstreamManager;
    v10->_subscriptionSubstreamManager = v22;

    uint64_t v24 = [BMComputeSourceServer alloc];
    v25 = +[BMDaemon userComputeSourceServiceName];
    uint64_t v26 = [(BMComputeSourceServer *)v24 initWithQueue:v7 machServiceName:v25 source:v10];
    userSourceServer = v10->_userSourceServer;
    v10->_userSourceServer = (BMComputeSourceServer *)v26;

    v28 = [[BMComputeXPCPublisherServer alloc] initWithQueue:v7 domain:0 delegate:v10];
    p_userPublisherServer = &v10->_userPublisherServer;
    userPublisherServer = v10->_userPublisherServer;
    v10->_userPublisherServer = v28;

    v31 = [BMComputeSourceServer alloc];
    v32 = +[BMDaemon systemComputeSourceServiceName];
    uint64_t v33 = [(BMComputeSourceServer *)v31 initWithQueue:v7 machServiceName:v32 source:v10];
    systemSourceServer = v10->_systemSourceServer;
    v10->_systemSourceServer = (BMComputeSourceServer *)v33;

    long long v35 = [[BMComputeXPCPublisherServer alloc] initWithQueue:v7 domain:1 delegate:v10];
    systemPublisherServer = v10->_systemPublisherServer;
    v10->_systemPublisherServer = v35;

    uint64_t v37 = objc_opt_new();
    activeSystemSubscriptionIdentifiers = v10->_activeSystemSubscriptionIdentifiers;
    v10->_activeSystemSubscriptionIdentifiers = (NSMutableDictionary *)v37;

    uint64_t v39 = objc_opt_new();
    subscribedSystemStreams = v10->_subscribedSystemStreams;
    v10->_subscribedSystemStreams = (NSMutableDictionary *)v39;

    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    if (v10->_systemPublisherServer) {
      uint64_t v41 = (*p_userPublisherServer != 0) + 1;
    }
    else {
      uint64_t v41 = *p_userPublisherServer != 0;
    }
    v67[3] = v41;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__BMDaemon_initWithQueue_eventReporter___block_invoke;
    aBlock[3] = &unk_1E55D6B10;
    id v66 = v67;
    id v42 = v10;
    uint64_t v65 = v42;
    v43 = _Block_copy(aBlock);
    v44 = v10->_systemPublisherServer;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2;
    v61[3] = &unk_1E55D6B38;
    v45 = v42;
    v62 = v45;
    id v46 = v43;
    id v63 = v46;
    [(BMComputeXPCPublisherServer *)v44 activateWithCompletion:v61];
    v47 = v10->_userPublisherServer;
    uint64_t v55 = MEMORY[0x1E4F143A8];
    uint64_t v56 = 3221225472;
    id v57 = __40__BMDaemon_initWithQueue_eventReporter___block_invoke_18;
    uint64_t v58 = &unk_1E55D6B38;
    v48 = v45;
    id v59 = v48;
    id v49 = v46;
    id v60 = v49;
    [(BMComputeXPCPublisherServer *)v47 activateWithCompletion:&v55];
    if (+[BMDaemon isAgent]) {
      +[BMDaemon BiomeAgentLaunchNotification];
    }
    else {
    id v50 = +[BMDaemon biomedLaunchNotification];
    }
    uint64_t v51 = notify_post((const char *)[v50 UTF8String]);
    if (v51)
    {
      uint64_t v52 = __biome_log_for_category();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        uint64_t v53 = [NSNumber numberWithUnsignedInt:v51];
        [(BMDaemon *)(uint64_t)v50 initWithQueue:buf eventReporter:v52];
      }
    }
    [(BMDaemon *)v48 _subscribeStreamsForViews];

    _Block_object_dispose(v67, 8);
  }

  return v10;
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  uint64_t v2 = *(void *)(v1 + 24) - 1;
  *(void *)(v1 + 24) = v2;
  if (!v2) {
    return [*(id *)(*(void *)(result + 32) + 80) initialCheckinsComplete];
  }
  return result;
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2_cold_1(v2);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) activate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __40__BMDaemon_initWithQueue_eventReporter___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__BMDaemon_initWithQueue_eventReporter___block_invoke_18_cold_1(v2);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) activate];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_subscribeStreamsForViews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = +[BMDaemon isAgent];
  uint64_t v5 = 48;
  if (v4) {
    uint64_t v5 = 40;
  }
  id v6 = [*(id *)((char *)&self->super.isa + v5) subscriptionMarkerManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = +[BMDatabaseInitializer viewSubscribedStreams];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = __biome_log_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v12;
          _os_log_impl(&dword_18E67D000, v13, OS_LOG_TYPE_INFO, "Adding subscription marker for view subscribed stream: %@", buf, 0xCu);
        }

        [v6 addSubscriptionWithStreamIdentifier:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)_subscribeSystemStream:(id)a3 subscriptionIdentifier:(id)a4 useCase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [v7 identifier];
  int v11 = [(BMDaemon *)self subscribedSystemStreams];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    id v13 = objc_opt_new();
    long long v14 = [(BMDaemon *)self subscribedSystemStreams];
    [v14 setObject:v13 forKeyedSubscript:v10];
  }
  long long v15 = [(BMDaemon *)self subscribedSystemStreams];
  long long v16 = [v15 objectForKeyedSubscript:v10];
  [v16 addObject:v8];

  long long v17 = [(BMDaemon *)self activeSystemSubscriptionIdentifiers];
  uint64_t v18 = [v17 objectForKeyedSubscript:v10];

  if (!v18)
  {
    uint64_t v19 = [v7 DSLPublisherWithUseCase:*MEMORY[0x1E4F4FAE0]];
    uint64_t v20 = [BMComputeXPCSubscription alloc];
    uint64_t v21 = [MEMORY[0x1E4F4FB80] current];
    __int16 v22 = [v21 identifier];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __66__BMDaemon__subscribeSystemStream_subscriptionIdentifier_useCase___block_invoke;
    v30[3] = &unk_1E55D6B60;
    v30[4] = self;
    char v23 = [(BMComputeXPCSubscription *)v20 initWithIdentifier:v10 client:v22 waking:1 DSLGraph:v19 block:v30];

    uint64_t v24 = [(BMDaemon *)self systemStreamsPublisherClient];

    if (!v24)
    {
      v25 = [(BMDaemon *)self queue];
      uint64_t v26 = +[BMComputeXPCPublisherClient sharedWithQueue:v25 domain:1];
      [(BMDaemon *)self setSystemStreamsPublisherClient:v26];
    }
    uint64_t v27 = [(BMDaemon *)self systemStreamsPublisherClient];
    [v27 subscribe:v23];

    v28 = [(BMComputeXPCSubscription *)v23 identifier];
    v29 = [(BMDaemon *)self activeSystemSubscriptionIdentifiers];
    [v29 setObject:v28 forKeyedSubscript:v10];
  }
}

void __66__BMDaemon__subscribeSystemStream_subscriptionIdentifier_useCase___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 queue];
  dispatch_assert_queue_V2(v5);

  id v6 = *(void **)(a1 + 32);
  id v8 = [v4 identifier];

  id v7 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  [v6 sendEventWithStreamIdentifier:v8 timestamp:v7 account:0 remoteName:0 storeEvent:0];
}

- (void)publisherServer:(id)a3 didAddSubscription:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v5);

  [(BMComputeSubscriptionSubstreamManager *)self->_subscriptionSubstreamManager addSubscription:v6];
}

- (void)publisherServer:(id)a3 didClaimSubscription:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v5);

  [(BMComputeSubscriptionSubstreamManager *)self->_subscriptionSubstreamManager addSubscription:v6];
}

- (void)publisherServer:(id)a3 didRemoveSubscription:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(BMDaemon *)self queue];
  dispatch_assert_queue_V2(v5);

  [(BMComputeSubscriptionSubstreamManager *)self->_subscriptionSubstreamManager removeSubscription:v6];
}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v10 = 138413058;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_impl(&dword_18E67D000, v4, OS_LOG_TYPE_INFO, "Publishing event %@ with timestamp %@ downstream for subscription %@ based on write to %@", (uint8_t *)&v10, 0x2Au);
  }

  uint64_t v9 = [*(id *)(a1 + 64) _publisherServer];
  [v9 receiveInputForSubscription:*(void *)(a1 + 48) streamIdentifier:*(void *)(a1 + 56) storeEvent:v3];
}

+ (BOOL)isAgent
{
  return 0;
}

+ (id)userComputePublisherStreamName
{
  return @"com.apple.biome.compute.publisher.user";
}

+ (id)systemComputePublisherStreamName
{
  return @"com.apple.biome.compute.publisher";
}

+ (id)userComputePublisherServiceName
{
  return @"com.apple.biome.compute.publisher.service.user";
}

+ (id)systemComputePublisherServiceName
{
  return @"com.apple.biome.compute.publisher.service";
}

+ (id)biomedLaunchNotification
{
  return @"com.apple.biome.biomed.launched";
}

+ (id)BiomeAgentLaunchNotification
{
  return @"com.apple.biome.BiomeAgent.launched";
}

+ (void)registerXPCActivities
{
}

void __33__BMDaemon_registerXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v2) == 2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.biome.prune-expired-events", v3);

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__BMDaemon_registerXPCActivities__block_invoke_2;
    v6[3] = &unk_1E55D68C8;
    id v7 = v2;
    dispatch_queue_t v8 = v4;
    uint64_t v5 = v4;
    dispatch_sync(v5, v6);
  }
}

void __33__BMDaemon_registerXPCActivities__block_invoke_2(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_18E67D000, "com.apple.biome.prune-expired-events", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_INFO, "running activity \"com.apple.biome.prune-expired-events\"", buf, 2u);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F4FBB8]);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = (void *)[[NSString alloc] initWithUTF8String:"com.apple.biome.prune-expired-events"];
  id v7 = (void *)[v4 initWithActivity:v5 activityName:v6];

  +[BMDaemon prunePublicStreamsWithActivity:v7];
  if (([v7 didDefer] & 1) == 0)
  {
    +[BMDaemon pruneRestrictedStreamsWithActivity:v7];
    if (([v7 didDefer] & 1) == 0)
    {
      +[BMDaemon pruneTemporaryFiles];
      if (([v7 didDefer] & 1) == 0)
      {
        +[BMDaemon pruneFeatureStoreWithActivity:v7];
        [v7 setContinue];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __33__BMDaemon_registerXPCActivities__block_invoke_77;
        v8[3] = &unk_1E55D68C8;
        id v9 = *(id *)(a1 + 40);
        id v10 = v7;
        +[BMDaemon registerWithSpaceAttributionWithActivity:v10 completion:v8];
      }
    }
  }

  os_activity_scope_leave(&state);
}

void __33__BMDaemon_registerXPCActivities__block_invoke_77(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__BMDaemon_registerXPCActivities__block_invoke_2_78;
  block[3] = &unk_1E55D6C48;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __33__BMDaemon_registerXPCActivities__block_invoke_2_78(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) didDefer];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 setDone];
  }
  return result;
}

+ (void)runLaunchTasks
{
  if (!+[BMDaemon isAgent])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F4FBA8]);
    [v2 migrate];
  }
}

- (void)setUpNotificationHandler
{
}

- (BMComputeSourceServer)userSourceServer
{
  return self->_userSourceServer;
}

- (BMComputeSourceServer)systemSourceServer
{
  return self->_systemSourceServer;
}

- (BMComputeXPCPublisherServer)userPublisherServer
{
  return self->_userPublisherServer;
}

- (BMComputeXPCPublisherServer)systemPublisherServer
{
  return self->_systemPublisherServer;
}

- (BMViewEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (BMComputeXPCPublisherStorage)systemBookmarkStorage
{
  return self->_systemBookmarkStorage;
}

- (BMComputeXPCPublisherStorage)userBookmarkStorage
{
  return self->_userBookmarkStorage;
}

- (BMComputeSubscriptionSubstreamManager)subscriptionSubstreamManager
{
  return self->_subscriptionSubstreamManager;
}

- (NSMutableDictionary)activeSystemSubscriptionIdentifiers
{
  return self->_activeSystemSubscriptionIdentifiers;
}

- (void)setActiveSystemSubscriptionIdentifiers:(id)a3
{
}

- (NSMutableDictionary)subscribedSystemStreams
{
  return self->_subscribedSystemStreams;
}

- (void)setSubscribedSystemStreams:(id)a3
{
}

- (BMComputeXPCPublisherClient)systemStreamsPublisherClient
{
  return self->_systemStreamsPublisherClient;
}

- (void)setSystemStreamsPublisherClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemStreamsPublisherClient, 0);
  objc_storeStrong((id *)&self->_subscribedSystemStreams, 0);
  objc_storeStrong((id *)&self->_activeSystemSubscriptionIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionSubstreamManager, 0);
  objc_storeStrong((id *)&self->_userBookmarkStorage, 0);
  objc_storeStrong((id *)&self->_systemBookmarkStorage, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_systemPublisherServer, 0);
  objc_storeStrong((id *)&self->_userPublisherServer, 0);
  objc_storeStrong((id *)&self->_systemSourceServer, 0);
  objc_storeStrong((id *)&self->_userSourceServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

+ (void)donateLaunchEventsWithQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(v4);
  uint64_t v5 = (void *)MEMORY[0x1E4F93B10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke;
  v7[3] = &unk_1E55D7940;
  dispatch_queue_t v8 = v4;
  id v9 = a1;
  uint64_t v6 = v4;
  [v5 runBlockWhenDeviceIsClassCUnlocked:v7];
}

void __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  *(void *)dispatch_queue_t v8 = 0x1500000001;
  size_t v5 = 16;
  uint64_t v6 = 0;
  if (sysctl(v8, 2u, &v6, &v5, 0, 0) == -1 || v6 == 0)
  {
    id v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke_cold_1();
    }
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)(int)v7 / 1000000.0 + (double)v6];
    [*(id *)(a1 + 40) _donateDeviceMetadataWithBootDate:v4];
    [*(id *)(a1 + 40) _donateDeviceBootSessionEventsWithBootDate:v4 queue:*(void *)(a1 + 32)];
  }
}

+ (void)_donateDeviceMetadataWithBootDate:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18E67D000, v4, OS_LOG_TYPE_DEFAULT, "Starting _donateDeviceMetadataWithBootDate, with bootDate: %@", (uint8_t *)&buf, 0xCu);
  }

  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;
  uint64_t v7 = _BiomeLibrary();
  dispatch_queue_t v8 = [v7 Device];
  uint64_t v9 = [v8 Metadata];

  id v10 = [MEMORY[0x1E4F4FB60] osBuildVersion];
  uint64_t v11 = [MEMORY[0x1E4F4FB60] osBuildSupplementalVersion];
  id v12 = [NSString alloc];
  uint64_t v13 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  __int16 v14 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v13];
  uint64_t v15 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  __int16 v16 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v15];
  uint64_t v17 = (void *)[v12 initWithFormat:@"%@-%@", v14, v16];

  uint64_t v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v19 = [v18 stringForKey:@"LastCombinedBuild"];

  if (!v19 || ([v17 isEqualToString:v19] & 1) == 0)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    uint64_t v20 = (void *)getBMDeviceMetadataClass_softClass;
    uint64_t v31 = getBMDeviceMetadataClass_softClass;
    if (!getBMDeviceMetadataClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v33 = __getBMDeviceMetadataClass_block_invoke;
      long long v34 = &unk_1E55D6DA8;
      long long v35 = &v28;
      __getBMDeviceMetadataClass_block_invoke((uint64_t)&buf);
      uint64_t v20 = (void *)v29[3];
    }
    uint64_t v21 = v20;
    _Block_object_dispose(&v28, 8);
    id v22 = [v21 alloc];
    unint64_t v23 = [MEMORY[0x1E4F4FB60] platform];
    if (v23 >= 9)
    {
      uint64_t v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[BMDaemon(LaunchDonations) _donateDeviceMetadataWithBootDate:](v23, v24);
      }

      unint64_t v23 = 0;
    }
    v25 = (void *)[v22 initWithName:0 build:v10 platform:v23 supplementalBuild:v11 rapidSecurityResponsePreReboot:0];
    uint64_t v26 = [v9 source];
    [v26 sendEvent:v25 timestamp:v6];

    uint64_t v27 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v27 setObject:v17 forKey:@"LastCombinedBuild"];
  }
}

+ (void)_donateDeviceBootSessionEventsWithBootDate:(id)a3 queue:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  target = a4;
  double v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18E67D000, v6, OS_LOG_TYPE_DEFAULT, "Starting _donateDeviceBootSessionEventsWithBootDate, with bootDate: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29128], "bm_bootSessionUUID");
  dispatch_queue_t v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_DEFAULT, "Current boot session UUID found: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = _BiomeLibrary();
  id v10 = [v9 Device];
  uint64_t v11 = [v10 BootSession];

  id v12 = [[BMPublisherOptions alloc] initWithStartDate:0 endDate:0 maxEvents:1 lastN:1 reversed:0];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v87 = 0x3032000000;
  long long v88 = __Block_byref_object_copy__3;
  long long v89 = __Block_byref_object_dispose__3;
  id v90 = 0;
  uint64_t v79 = 0;
  v80[0] = &v79;
  v80[1] = 0x3032000000;
  v80[2] = __Block_byref_object_copy__3;
  v80[3] = __Block_byref_object_dispose__3;
  id v81 = 0;
  uint64_t v13 = [v11 publisherWithUseCase:*MEMORY[0x1E4F4FAF8] options:v12];
  __int16 v14 = [v13 last];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke;
  v78[3] = &unk_1E55D7968;
  void v78[4] = &v79;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_2;
  v77[3] = &unk_1E55D7990;
  v77[4] = &buf;
  id v15 = (id)[v14 sinkWithCompletion:v78 receiveInput:v77];

  if (!*(void *)(v80[0] + 40))
  {
    __int16 v16 = [v11 source];
    uint64_t v17 = (void *)[objc_alloc((Class)getBMDeviceBootSessionClass()) initWithBootUUID:v7 starting:&unk_1EDDD76C0];
    if (!*(void *)(*((void *)&buf + 1) + 40))
    {
      [v5 timeIntervalSinceReferenceDate];
      -[NSObject sendEvent:timestamp:](v16, "sendEvent:timestamp:", v17);
      goto LABEL_31;
    }
    uint64_t v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [*(id *)(*((void *)&buf + 1) + 40) eventBody];
      uint64_t v20 = [v19 bootUUID];
      [*(id *)(*((void *)&buf + 1) + 40) timestamp];
      *(_DWORD *)id v82 = 138412546;
      *(void *)&v82[4] = v20;
      *(_WORD *)&v82[12] = 2048;
      *(void *)&v82[14] = v21;
      _os_log_impl(&dword_18E67D000, v18, OS_LOG_TYPE_DEFAULT, "Previously stored device boot session: %@ at time: %f, in the biome daemon launch donation", v82, 0x16u);
    }
    id v22 = [*(id *)(*((void *)&buf + 1) + 40) eventBody];
    unint64_t v23 = [v22 bootUUID];
    int v24 = [v23 isEqual:v7];

    if (v24)
    {
      v25 = [*(id *)(*((void *)&buf + 1) + 40) eventBody];
      char v26 = [v25 starting];

      if ((v26 & 1) == 0)
      {
        uint64_t v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:]();
        }
        goto LABEL_30;
      }
LABEL_31:

      goto LABEL_32;
    }
    id v28 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [*(id *)(*((void *)&buf + 1) + 40) timestamp];
    uint64_t v27 = objc_msgSend(v28, "initWithTimeIntervalSinceReferenceDate:");
    if ([v5 compare:v27] == -1)
    {
      uint64_t v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:]((uint64_t)v5, (uint64_t)v27, v31);
      }
    }
    else
    {
      v29 = [*(id *)(*((void *)&buf + 1) + 40) eventBody];
      char v30 = [v29 starting];

      if ((v30 & 1) == 0)
      {
        [v5 timeIntervalSinceReferenceDate];
        -[NSObject sendEvent:timestamp:](v16, "sendEvent:timestamp:", v17);
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v31 = [MEMORY[0x1E4F730C0] localStore];
      *(void *)id v82 = 0;
      *(void *)&v82[8] = v82;
      *(void *)&v82[16] = 0x3032000000;
      v83 = __Block_byref_object_copy__3;
      v84 = __Block_byref_object_dispose__3;
      id v85 = 0;
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_16;
      v76[3] = &unk_1E55D79B8;
      v76[4] = v82;
      [v31 prepareWithCompletionHandler:v76];
      if (*(void *)(*(void *)&v82[8] + 40))
      {
        id v32 = objc_alloc(MEMORY[0x1E4F730C8]);
        uint64_t v33 = [v32 initWithSource:*(void *)(*(void *)&v82[8] + 40)];
        [v33 setFlags:56];
        val = v33;
        long long v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        long long v35 = dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_BACKGROUND, 1);
        dispatch_queue_t v42 = dispatch_queue_create_with_target_V2("com.apple.BMDaemon+LaunchDonations.DeviceBootSession", v35, target);

        [val _setQueue:v42];
        v74[0] = 0;
        v74[1] = v74;
        v74[2] = 0x3032000000;
        v74[3] = __Block_byref_object_copy__3;
        v74[4] = __Block_byref_object_dispose__3;
        id v75 = 0;
        v72[0] = 0;
        v72[1] = v72;
        v72[2] = 0x3032000000;
        v72[3] = __Block_byref_object_copy__3;
        v72[4] = __Block_byref_object_dispose__3;
        id v73 = 0;
        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x2020000000;
        int v71 = 0;
        v68[0] = 0;
        v68[1] = v68;
        v68[2] = 0x2020000000;
        char v69 = 0;
        v66[0] = 0;
        v66[1] = v66;
        v66[2] = 0x3032000000;
        v66[3] = __Block_byref_object_copy__3;
        v66[4] = __Block_byref_object_dispose__3;
        id v67 = (id)os_transaction_create();
        objc_initWeak(&location, val);
        uint64_t v36 = __biome_log_for_category();
        os_signpost_id_t v37 = os_signpost_id_generate(v36);

        uint64_t v38 = __biome_log_for_category();
        uint64_t v39 = v38;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)id v64 = 0;
          _os_signpost_emit_with_name_impl(&dword_18E67D000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "BootSessionLogReading", "", v64, 2u);
        }

        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21;
        v57[3] = &unk_1E55D79E0;
        id v59 = v68;
        id v60 = v70;
        objc_copyWeak(&v63, &location);
        id v40 = v7;
        id v58 = v40;
        v61 = v74;
        v62 = v72;
        [val setEventHandler:v57];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23;
        v45[3] = &unk_1E55D7A08;
        os_signpost_id_t v56 = v37;
        uint64_t v51 = v70;
        uint64_t v52 = v74;
        p_long long buf = &buf;
        v54 = v72;
        id v46 = v16;
        id v41 = v5;
        id v47 = v41;
        id v48 = v17;
        id v49 = v27;
        id v50 = v40;
        uint64_t v55 = v66;
        [val setInvalidationHandler:v45];
        [val activateStreamFromDate:v41];

        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
        _Block_object_dispose(v66, 8);

        _Block_object_dispose(v68, 8);
        _Block_object_dispose(v70, 8);
        _Block_object_dispose(v72, 8);

        _Block_object_dispose(v74, 8);
      }
      else
      {
        val = __biome_log_for_category();
        if (os_log_type_enabled(val, OS_LOG_TYPE_ERROR)) {
          +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:]();
        }
      }

      _Block_object_dispose(v82, 8);
    }

    goto LABEL_30;
  }
  __int16 v16 = __biome_log_for_category();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    +[BMDaemon(LaunchDonations) _donateDeviceBootSessionEventsWithBootDate:queue:].cold.4((uint64_t)v80, v16);
  }
LABEL_32:

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&buf, 8);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 error];

  if (v3)
  {
    uint64_t v4 = [v7 error];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    double v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_2(uint64_t a1, void *a2)
{
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_16_cold_1((uint64_t)v6, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x192FB0D60]();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    int v6 = *(_DWORD *)(v5 + 24);
    if (v6 < 500)
    {
      *(_DWORD *)(v5 + 24) = v6 + 1;
      uint64_t v9 = [v3 bootUUID];
      id v10 = [v3 date];
      uint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412546;
        __int16 v14 = v9;
        __int16 v15 = 2112;
        __int16 v16 = v10;
        _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_DEFAULT, "Found log with eventBootUUID: %@, at eventDate: %@", (uint8_t *)&v13, 0x16u);
      }

      if (([v9 isEqual:*(void *)(a1 + 32)] & 1) == 0)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v10);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        [WeakRetained invalidate];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
      id v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_1(a1 + 48, v7);
      }

      id v8 = objc_loadWeakRetained((id *)(a1 + 72));
      [v8 invalidate];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = __biome_log_for_category();
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 112);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v33[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_18E67D000, v7, OS_SIGNPOST_INTERVAL_END, v8, "BootSessionLogReading", "", (uint8_t *)v33, 2u);
  }

  if ((unint64_t)(a2 - 6) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_5((uint64_t)v5, a2, v9);
    }
  }
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v33[0] = 67109378;
    v33[1] = v11;
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_DEFAULT, "Found the previous boot session after viewing %d past logs in biome daemon launch donation, previous boot session: %@", (uint8_t *)v33, 0x12u);
  }

  id v13 = objc_alloc((Class)getBMDeviceBootSessionClass());
  __int16 v14 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) eventBody];
  __int16 v15 = [v14 bootUUID];
  __int16 v16 = (void *)[v13 initWithBootUUID:v15 starting:&unk_1EDDD76D8];

  uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (v17 && *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) eventBody];
    uint64_t v19 = [v18 bootUUID];
    char v20 = [v17 isEqual:v19];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_4();
      }
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) compare:*(void *)(a1 + 56)] == -1)
    {
      v29 = __biome_log_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_2();
      }

      char v30 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      objc_msgSend(v30, "sendEvent:timestamp:", v16);
      uint64_t v23 = *(void *)(a1 + 48);
      int v24 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    }
    else if ([*(id *)(a1 + 40) compare:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)] == -1)
    {
      uint64_t v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_3();
      }

      id v32 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
      objc_msgSend(v32, "sendEvent:timestamp:", v16);
      uint64_t v23 = *(void *)(a1 + 48);
      int v24 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    }
    else
    {
      id v22 = *(void **)(a1 + 32);
      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) timeIntervalSinceReferenceDate];
      objc_msgSend(v22, "sendEvent:timestamp:", v16);
      uint64_t v23 = *(void *)(a1 + 48);
      int v24 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    }
  }
  else
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_1();
    }

    char v26 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    objc_msgSend(v26, "sendEvent:timestamp:", v16);
    uint64_t v23 = *(void *)(a1 + 48);
    int v24 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  }
  objc_msgSend(v24, "sendEvent:timestamp:", v23);

  uint64_t v27 = *(void *)(*(void *)(a1 + 104) + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = 0;
}

+ (void)prunePublicStreamsWithActivity:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3);
  uint64_t v4 = [MEMORY[0x1E4F4FB78] pathForStreamType:1 domain:0];
  [v3 removeItemAtPath:v4 error:0];

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [MEMORY[0x1E4F4FB78] pathForStreamType:1 domain:1];
  [v6 removeItemAtPath:v5 error:0];
}

+ (void)pruneRestrictedStreamsWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18E67D000, "Pruning restricted streams", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  [a1 pruneRestrictedStreamsInDomain:0 account:0 activity:v4];
  [a1 pruneRestrictedStreamsInDomain:1 account:0 activity:v4];
  os_activity_scope_leave(&v6);
}

+ (id)loadDKStreamNameToTTL
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2050000000;
  id v2 = (void *)get_CDEventStreamsClass_softClass_0;
  uint64_t v33 = get_CDEventStreamsClass_softClass_0;
  if (!get_CDEventStreamsClass_softClass_0)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    os_signpost_id_t v37 = __get_CDEventStreamsClass_block_invoke_0;
    uint64_t v38 = &unk_1E55D6DA8;
    uint64_t v39 = &v30;
    __get_CDEventStreamsClass_block_invoke_0((uint64_t)&buf);
    id v2 = (void *)v31[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v30, 8);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 ephemeralitySchedule];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v27 != v18)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v21 = v6;
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v6);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = objc_msgSend(obj, "objectForKeyedSubscript:", v8, v18);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              __int16 v14 = +[BMDKEventStream streamNameFromDKStreamName:v13];
              __int16 v15 = v14;
              if (v14 && [v14 length])
              {
                [v5 setObject:v8 forKeyedSubscript:v15];
              }
              else
              {
                __int16 v16 = __biome_log_for_category();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v13;
                  _os_log_error_impl(&dword_18E67D000, v16, OS_LOG_TYPE_ERROR, "Unable to convert DK stream identifier to Biome stream identifier: %{public}@", (uint8_t *)&buf, 0xCu);
                }
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v21 + 1;
      }
      while (v21 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v19);
  }

  return v5;
}

+ (void)pruneRestrictedStreamsInDomain:(unint64_t)a3 account:(id)a4 activity:(id)a5
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v65 = a5;
  v61 = +[BMDaemon loadDKStreamNameToTTL];
  if (v7) {
    [MEMORY[0x1E4F4FB78] pathForSharedSyncWithAccount:v7 streamType:2 domain:a3];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4F4FB78] pathForStreamType:2 domain:a3];
  }
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    *(_DWORD *)long long buf = 138543362;
    unint64_t v80 = (unint64_t)v10;
    _os_log_impl(&dword_18E67D000, v9, OS_LOG_TYPE_DEFAULT, "Started pruning restricted streams in directory: %{public}@", buf, 0xCu);
  }
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = [v11 contentsOfDirectoryAtPath:v8 error:0];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v60 = (void *)v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "bm_shuffledArrayWithArray:", v12);
  uint64_t v71 = [v13 countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v71)
  {
    uint64_t v70 = *(void *)v76;
    uint64_t v62 = *MEMORY[0x1E4F502B8];
    id v63 = v8;
    id v64 = v7;
    id obj = v13;
    unint64_t v67 = a3;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v76 != v70) {
        objc_enumerationMutation(obj);
      }
      __int16 v15 = *(void **)(*((void *)&v75 + 1) + 8 * v14);
      __int16 v16 = (void *)MEMORY[0x192FB0D60]();
      unsigned __int8 v74 = 0;
      uint64_t v17 = [v8 stringByAppendingPathComponent:v15];
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v19 = [v18 fileExistsAtPath:v17 isDirectory:&v74];

      int v20 = v74;
      uint64_t v21 = __biome_log_for_category();
      long long v22 = v21;
      if (v19) {
        BOOL v23 = v20 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          +[BMDaemon(Pruning) pruneRestrictedStreamsInDomain:account:activity:]();
        }

        goto LABEL_50;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        unint64_t v80 = (unint64_t)v15;
        _os_log_impl(&dword_18E67D000, v22, OS_LOG_TYPE_INFO, "Pruning stream: %{public}@", buf, 0xCu);
      }

      long long v25 = BiomeLibraryNodeBridge();
      id v73 = 0;
      char v69 = v25;
      long long v26 = [v25 streamWithIdentifier:v15 error:&v73];
      id v27 = v73;
      objc_super v68 = v27;
      if (([v15 hasPrefix:@"_DKEvent."] & 1) != 0 || !v26 || v27) {
        break;
      }
      long long v28 = [v26 configuration];
      long long v29 = [v28 storeConfig];
      uint64_t v30 = [v29 domain];

      BOOL v23 = v30 == v67;
      a3 = v67;
      if (v23)
      {
        [v26 executePruningPolicyForAccount:v7];
        goto LABEL_48;
      }
      uint64_t v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v72 = 0;
      [v38 removeItemAtPath:v17 error:&v72];
      id v39 = v72;

      uint64_t v40 = __biome_log_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v59 = [v26 configuration];
        uint64_t v52 = [v59 storeConfig];
        [v52 domain];
        uint64_t v53 = BMStringForServiceDomain();
        v54 = BMStringForServiceDomain();
        *(_DWORD *)long long buf = 138413058;
        unint64_t v80 = (unint64_t)v15;
        __int16 v81 = 2112;
        double v82 = *(double *)&v53;
        __int16 v83 = 2112;
        v84 = v54;
        __int16 v85 = 2112;
        id v86 = v39;
        _os_log_error_impl(&dword_18E67D000, v40, OS_LOG_TYPE_ERROR, "Removing directory for stream %@ with library domain %@ found in %@ domain stream folder, remove error: %@", buf, 0x2Au);

        a3 = v67;
        uint64_t v8 = v63;
        id v7 = v64;
      }

      v43 = v68;
      dispatch_queue_t v42 = v69;
LABEL_49:

LABEL_50:
      if (v71 == ++v14)
      {
        uint64_t v13 = obj;
        uint64_t v71 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
        if (v71) {
          goto LABEL_8;
        }
        goto LABEL_52;
      }
    }
    uint64_t v31 = (void *)[MEMORY[0x1E4F50278] newRestrictedStreamWithSegmentSize:v62 protectionClass:3 domain:a3];
    if ([v15 hasPrefix:@"_DKEvent."])
    {
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = [v61 objectForKeyedSubscript:v15];
      __int16 v34 = v33;
      if (!v33 || ![v33 unsignedLongValue])
      {
        double v35 = 2419200.0;
        uint64_t v37 = 52428800;
        goto LABEL_45;
      }
      double v35 = (double)(unint64_t)[v34 unsignedLongValue];
      uint64_t v36 = __biome_log_for_category();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543618;
        unint64_t v80 = (unint64_t)v15;
        __int16 v81 = 2048;
        double v82 = v35;
        _os_log_debug_impl(&dword_18E67D000, v36, OS_LOG_TYPE_DEBUG, "Custom setting for shimmed stream %{public}@ ttl %f", buf, 0x16u);
      }
      uint64_t v37 = 52428800;
    }
    else
    {
      __int16 v34 = (void *)[objc_alloc(MEMORY[0x1E4F50288]) initWithStream:v15 permission:2 config:v31 includeTombstones:0];
      uint64_t v36 = [v34 metadata];
      v44 = [v36 pruningPolicy];
      uint64_t v45 = [v44 maxStreamSize];
      if (v45) {
        uint64_t v37 = v45;
      }
      else {
        uint64_t v37 = 52428800;
      }

      id v46 = [v36 pruningPolicy];
      [v46 maxAge];
      if (v47 == 0.0) {
        double v35 = 2419200.0;
      }
      else {
        double v35 = v47;
      }

      uint64_t v32 = 0;
    }

LABEL_45:
    id v48 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:v37 maxStreamSize:v35];
    [v31 setPruningPolicy:v48];
    id v49 = __biome_log_for_category();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v80 = (unint64_t)v35;
      __int16 v81 = 2048;
      double v82 = *(double *)&v37;
      _os_log_impl(&dword_18E67D000, v49, OS_LOG_TYPE_INFO, "Pruning policy: maxAge, %llu, maxStreamSize, %llu", buf, 0x16u);
    }

    id v50 = [[BMStreamConfiguration alloc] initWithStreamIdentifier:v15 eventClass:v32 storeConfig:v31];
    uint64_t v51 = [(BMStreamBase *)[BMStream alloc] initWithIdentifier:v15 schema:0 configuration:v50];
    id v7 = v64;
    [(BMStreamBase *)v51 executePruningPolicyForAccount:v64];

    uint64_t v8 = v63;
    a3 = v67;
LABEL_48:
    v43 = v68;
    dispatch_queue_t v42 = v69;
    if ([v65 didDefer])
    {
      id v58 = __biome_log_for_category();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18E67D000, v58, OS_LOG_TYPE_DEFAULT, "Pausing pruning of restricted streams due to xpc activity deferral", buf, 2u);
      }

      id v57 = v60;
      uint64_t v55 = obj;
      goto LABEL_58;
    }
    goto LABEL_49;
  }
LABEL_52:

  uint64_t v55 = __biome_log_for_category();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v56 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    *(_DWORD *)long long buf = 138543362;
    unint64_t v80 = (unint64_t)v56;
    _os_log_impl(&dword_18E67D000, v55, OS_LOG_TYPE_DEFAULT, "Done pruning restricted streams in directory: %{public}@", buf, 0xCu);
  }
  id v57 = v60;
LABEL_58:
}

+ (void)prunePrivateStreamDirectory:(id)a3 maxAge:(double)a4 maxStreamSize:(unint64_t)a5 activity:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a6;
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    int buf = 138543362;
    id v46 = v10;
    _os_log_impl(&dword_18E67D000, v9, OS_LOG_TYPE_DEFAULT, "Started pruning private streams in directory: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v12 = [v11 contentsOfDirectoryAtPath:v8 error:0];

  __int16 v34 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:a5 maxStreamSize:a4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    id obj = v13;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        int v19 = (void *)MEMORY[0x192FB0D60]();
        unsigned __int8 v37 = 0;
        int v20 = [v8 stringByAppendingPathComponent:v18];
        uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v22 = [v21 fileExistsAtPath:v20 isDirectory:&v37];

        int v23 = v37;
        long long v24 = __biome_log_for_category();
        long long v25 = v24;
        if (v22) {
          BOOL v26 = v23 == 0;
        }
        else {
          BOOL v26 = 1;
        }
        if (v26)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            +[BMDaemon(Pruning) pruneRestrictedStreamsInDomain:account:activity:]();
          }
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)dispatch_queue_t v42 = 138543362;
            v43 = v18;
            _os_log_impl(&dword_18E67D000, v25, OS_LOG_TYPE_INFO, "Pruning stream: %{public}@", v42, 0xCu);
          }

          long long v25 = [MEMORY[0x1E4F50278] newPrivateStreamDefaultConfigurationWithStoreBasePath:v8];
          [v25 setPruningPolicy:v34];
          long long v28 = [[BMStoreStream alloc] initWithPrivateStreamIdentifier:v18 storeConfig:v25 eventDataClass:0];
          [(BMStoreStream *)v28 pruneStreamBySize:a5];
          [(BMStoreStream *)v28 pruneExpiredEventsWithBlock:&__block_literal_global_17];
          if ([v35 didDefer])
          {
            uint64_t v31 = __biome_log_for_category();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
              *(_DWORD *)dispatch_queue_t v42 = 138543362;
              v43 = v32;
              _os_log_impl(&dword_18E67D000, v31, OS_LOG_TYPE_DEFAULT, "Pausing pruning of private streams in directory: %{public}@ due to xpc activity deferral", v42, 0xCu);
            }
            uint64_t v13 = obj;
            long long v29 = obj;
            goto LABEL_26;
          }
        }
      }
      uint64_t v13 = obj;
      uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v29 = __biome_log_for_category();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [MEMORY[0x1E4F4FB78] privacyPathname:v8];
    *(_DWORD *)dispatch_queue_t v42 = 138543362;
    v43 = v30;
    _os_log_impl(&dword_18E67D000, v29, OS_LOG_TYPE_DEFAULT, "Done pruning private streams in directory: %{public}@", v42, 0xCu);
  }
LABEL_26:
}

+ (void)pruneFeatureStoreWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_18E67D000, "Pruning FeatureStore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v5, &v16);
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_18E67D000, v6, OS_LOG_TYPE_DEFAULT, "Started pruning FeatureStore", buf, 2u);
  }

  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v7 = (void *)getFSFUtilsClass_softClass;
  uint64_t v25 = getFSFUtilsClass_softClass;
  if (!getFSFUtilsClass_softClass)
  {
    *(void *)int buf = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    int v19 = __getFSFUtilsClass_block_invoke;
    int v20 = &unk_1E55D6DA8;
    uint64_t v21 = &v22;
    __getFSFUtilsClass_block_invoke((uint64_t)buf);
    id v7 = (void *)v23[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v22, 8);
  char v9 = objc_opt_respondsToSelector();
  if (v9)
  {
    uint64_t v10 = [v8 getStreamPath];
    uint64_t v11 = 0;
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = [v8 getBaseLocalPath];
    uint64_t v11 = @"biomeStream";
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    char v9 = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 path];

    uint64_t v10 = (void *)v12;
  }
  if ((v9 & 1) == 0)
  {
    uint64_t v13 = [v10 stringByAppendingPathComponent:v11];

    uint64_t v10 = (void *)v13;
  }
  if (v10)
  {
    [a1 prunePrivateStreamDirectory:v10 maxAge:52428800 maxStreamSize:v4 activity:1209600.0];
  }
  else
  {
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[BMDaemon(Pruning) pruneFeatureStoreWithActivity:](v14);
    }
  }
  uint64_t v15 = __biome_log_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_18E67D000, v15, OS_LOG_TYPE_DEFAULT, "Done pruning FeatureStore", buf, 2u);
  }

  os_activity_scope_leave(&v16);
}

+ (void)pruneTemporaryFiles
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = _os_activity_create(&dword_18E67D000, "Pruning temporary files", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_18E67D000, v4, OS_LOG_TYPE_DEFAULT, "Started pruning temporary files", buf, 2u);
  }

  id v5 = [MEMORY[0x1E4F4FB78] biomeDirectoryForDomain:0];
  v23[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F4FB78] biomeDirectoryForDomain:1];
  v23[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        uint64_t v14 = (void *)MEMORY[0x192FB0D60](v9);
        objc_msgSend(a1, "pruneTemporaryFilesInDirectory:", v13, (void)v16);
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  uint64_t v15 = __biome_log_for_category();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_18E67D000, v15, OS_LOG_TYPE_DEFAULT, "Done pruning temporary files", buf, 2u);
  }

  os_activity_scope_leave(&state);
}

+ (void)pruneTemporaryFilesInDirectory:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v43 = objc_opt_new();
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  uint64_t v45 = v4;
  uint64_t v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_46];
  id v7 = v6;
  if (v6)
  {
    long long v41 = v5;
    id v42 = v3;
    long long v57 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v54 = 0u;
    long long v40 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x192FB0D60]();
          uint64_t v15 = [v13 lastPathComponent];
          int v16 = [v15 hasPrefix:@".tmp."];

          if (v16) {
            [v43 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v10);
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v43;
    uint64_t v17 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v46 = *(void *)v51;
      uint64_t v19 = *MEMORY[0x1E4F1C540];
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v51 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          uint64_t v22 = (void *)MEMORY[0x192FB0D60]();
          id v48 = 0;
          id v49 = 0;
          char v23 = [v21 getResourceValue:&v49 forKey:v19 error:&v48];
          id v24 = v49;
          uint64_t v25 = v48;
          if ((v23 & 1) == 0)
          {
            BOOL v26 = __biome_log_for_category();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              __int16 v34 = (void *)MEMORY[0x1E4F4FB78];
              id v35 = [v21 path];
              uint64_t v36 = [v34 privacyPathname:v35];
              *(_DWORD *)int buf = 138543618;
              id v59 = v36;
              __int16 v60 = 2112;
              v61 = v25;
              _os_log_error_impl(&dword_18E67D000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch attributes of file: %{public}@, error: %@", buf, 0x16u);
            }
          }
          if (v24
            && (id v27 = objc_opt_new(),
                [v27 timeIntervalSinceDate:v24],
                double v29 = v28,
                v27,
                v29 < 60.0))
          {
            uint64_t v30 = __biome_log_for_category();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 138412290;
              id v59 = v24;
              _os_log_debug_impl(&dword_18E67D000, v30, OS_LOG_TYPE_DEBUG, "Skipping pruning of temporary file with creation date: %@, not old enough", buf, 0xCu);
            }
          }
          else
          {
            id v47 = 0;
            int v31 = [v45 removeItemAtURL:v21 error:&v47];
            uint64_t v30 = v47;
            uint64_t v32 = __biome_log_for_category();
            uint64_t v33 = v32;
            if (v31)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                +[BMDaemon(Pruning) pruneTemporaryFilesInDirectory:]();
              }
            }
            else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              unsigned __int8 v37 = (void *)MEMORY[0x1E4F4FB78];
              long long v38 = [v21 path];
              long long v39 = [v37 privacyPathname:v38];
              *(_DWORD *)int buf = 138543618;
              id v59 = v39;
              __int16 v60 = 2112;
              v61 = v30;
              _os_log_error_impl(&dword_18E67D000, v33, OS_LOG_TYPE_ERROR, "Failed to prune temporary file: %{public}@, error: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v18);
    }
    id v5 = v41;
    id v3 = v42;
    id v7 = v40;
  }
  else
  {
    id obj = __biome_log_for_category();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      +[BMDaemon(Pruning) pruneTemporaryFilesInDirectory:]((uint64_t)v3, obj);
    }
  }
}

uint64_t __52__BMDaemon_Pruning__pruneTemporaryFilesInDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __52__BMDaemon_Pruning__pruneTemporaryFilesInDirectory___block_invoke_cold_1(v4, (uint64_t)v5, v6);
  }

  return 1;
}

+ (void)registerWithSpaceAttributionWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_18E67D000, "Register with SpaceAttribution", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__BMDaemon_Pruning__registerWithSpaceAttributionWithActivity_completion___block_invoke;
  v11[3] = &unk_1E55D8300;
  id v14 = a1;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [a1 _registerWithSpaceAttributionWithActivity:v9 domain:0 completion:v11];

  os_activity_scope_leave(&state);
}

uint64_t __73__BMDaemon_Pruning__registerWithSpaceAttributionWithActivity_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 48) _registerWithSpaceAttributionWithActivity:*(void *)(a1 + 32) domain:1 completion:*(void *)(a1 + 40)];
}

+ (void)_registerWithSpaceAttributionWithActivity:(id)a3 domain:(unint64_t)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  int v31 = (void (**)(void))a5;
  uint64_t v32 = objc_opt_new();
  id v35 = [MEMORY[0x1E4F4FB78] pathForStreamType:2 domain:a4];
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v7 contentsOfDirectoryAtPath:v35 error:0];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v34 = *(void *)v40;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x192FB0D60](v9);
        id v14 = objc_msgSend(v35, "stringByAppendingPathComponent:", v12, v30);
        char v38 = 0;
        uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v15 fileExistsAtPath:v14 isDirectory:&v38];

        if (v38)
        {
          int v16 = BiomeLibraryNodeBridge();
          uint64_t v17 = [v16 streamWithIdentifier:v12 error:0];
          uint64_t v18 = v17;
          if (v17)
          {
            uint64_t v19 = [v17 configuration];
            int v20 = [v19 spaceAttribution];

            if (v20)
            {
              uint64_t v21 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
              uint64_t v43 = 0;
              v44 = &v43;
              uint64_t v45 = 0x2050000000;
              uint64_t v22 = (void *)getSAPathInfoClass_softClass;
              uint64_t v46 = getSAPathInfoClass_softClass;
              if (!getSAPathInfoClass_softClass)
              {
                *(void *)int buf = MEMORY[0x1E4F143A8];
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = __getSAPathInfoClass_block_invoke;
                id v49 = &unk_1E55D6DA8;
                long long v50 = &v43;
                __getSAPathInfoClass_block_invoke((uint64_t)buf);
                uint64_t v22 = (void *)v44[3];
              }
              char v23 = v22;
              _Block_object_dispose(&v43, 8);
              id v24 = (void *)[[v23 alloc] initWithURL:v21];
              [v24 setBundleID:v20];
              uint64_t v25 = __biome_log_for_category();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 138478083;
                *(void *)&uint8_t buf[4] = v14;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v20;
                _os_log_debug_impl(&dword_18E67D000, v25, OS_LOG_TYPE_DEBUG, "Attributing path: %{private}@ to %@", buf, 0x16u);
              }

              [v32 addObject:v24];
            }
          }
        }

        ++v11;
      }
      while (v10 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }

  if ([v32 count])
  {
    BOOL v26 = (void *)MEMORY[0x192FB0D60]();
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2050000000;
    id v27 = (void *)getSAPathManagerClass_softClass;
    uint64_t v46 = getSAPathManagerClass_softClass;
    if (!getSAPathManagerClass_softClass)
    {
      *(void *)int buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getSAPathManagerClass_block_invoke;
      id v49 = &unk_1E55D6DA8;
      long long v50 = &v43;
      __getSAPathManagerClass_block_invoke((uint64_t)buf);
      id v27 = (void *)v44[3];
    }
    id v28 = v27;
    _Block_object_dispose(&v43, 8);
    double v29 = [v28 defaultManager];
    if (v29)
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke;
      v36[3] = &unk_1E55D8328;
      unsigned __int8 v37 = v31;
      [v29 registerPaths:v32 completionHandler:v36];
    }
    else
    {
      v31[2]();
    }
  }
  else
  {
    v31[2]();
  }
}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __biome_log_for_category();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_2((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_1(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)initWithQueue:(uint8_t *)buf eventReporter:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)int buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Notify post of %@ failed with status %@", buf, 0x16u);
}

void __40__BMDaemon_initWithQueue_eventReporter___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "System publisher server finished activating, now activating system source server", v1, 2u);
}

void __40__BMDaemon_initWithQueue_eventReporter___block_invoke_18_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "User publisher server finished activating, now activating user source server", v1, 2u);
}

- (void)_publisherServer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 serviceName];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Found current connection, resolving publisher server based on service name: %@", (uint8_t *)&v4, 0xCu);
}

- (void)sendEventWithStreamIdentifier:timestamp:account:remoteName:storeEvent:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to report event donation to view orchestration system: %@ %@");
}

void __82__BMDaemon_sendEventWithStreamIdentifier_timestamp_account_remoteName_storeEvent___block_invoke_cold_1(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  int v6 = 138413058;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Completed sink for subscription %@ based on new %@ event %@, completion: %@", (uint8_t *)&v6, 0x2Au);
}

- (void)eventsPrunedWithStreamIdentifier:account:remoteName:reason:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to report prune event to view orchestration system: %@ %@");
}

void __57__BMDaemon_LaunchDonations__donateLaunchEventsWithQueue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "Failure to retrieve boot time on biome daemon launch donation", v2, v3, v4, v5, v6);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Failure to create OSLogEventSource on biome daemon launch donation with error: %@", (uint8_t *)&v2, 0xCu);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_21_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)(*(void *)a1 + 8) + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "Failure to find the previous boot session within %d iterations.", (uint8_t *)v3, 8u);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "No previous boot session or boot session date found. This may have resulted in missing multiple boot sessions in biome daemon launch donation. prevBootSessionUUID: %@, prevBootSessionEndDate: %@");
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_2()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "The previously stored boot start boot session occurred after the its proposed end time. This should not be possible. Previously found boot session date: %@, previously stored device boot session date %@");
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_3()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "The previously found boot session occurred after the current boot session's start date in biome daemon launch donation. This should not be possible. Current boot session date: %@, previously found boot session date: %@");
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_18E67D000, v0, v1, "The previous boot session was not the same as the previously stored boot session. This may have resulted in missing multiple boot sessions in biome daemon launch donation", v2, v3, v4, v5, v6);
}

void __78__BMDaemon_LaunchDonations___donateDeviceBootSessionEventsWithBootDate_queue___block_invoke_23_cold_5(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_18E67D000, a2, a3, "Failure to finish reading from OSLogEventStream due to %lu at position: %@ on biome daemon launch donation", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __52__BMDaemon_Pruning__pruneTemporaryFilesInDirectory___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F4FB78];
  uint8_t v6 = [a1 path];
  uint64_t v7 = [v5 privacyPathname:v6];
  int v8 = 138543618;
  uint64_t v9 = v7;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_18E67D000, a3, OS_LOG_TYPE_ERROR, "Error during enumeration for temporary file pruning: %{public}@, error: %@", (uint8_t *)&v8, 0x16u);
}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "SpaceAttribution: Paths registered successfully", v1, 2u);
}

void __81__BMDaemon_Pruning___registerWithSpaceAttributionWithActivity_domain_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "SpaceAttribution: Failed to register paths with error %{private}@", (uint8_t *)&v2, 0xCu);
}

@end