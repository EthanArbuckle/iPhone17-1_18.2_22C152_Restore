@interface CHSpotlightIndexManager
+ (CHSpotlightIndexManager)sharedInstance;
+ (CSPerson)mePerson;
+ (NSArray)keyDescriptors;
+ (id)contactStore;
- (BOOL)isTelephonyCall:(id)a3;
- (CHContactChangeManager)contactChangeManager;
- (CHFeatureFlags)featureFlags;
- (CHSpotlightIndexManager)initWithIndex:(id)a3 metadataCache:(id)a4 contactStore:(id)a5 featureFlags:(id)a6;
- (CHSpotlightReindexManager)reindexManager;
- (CNContactStore)contactStore;
- (CSSearchableIndex)csIndex;
- (TUCallProviderManager)callProviderManager;
- (TUMetadataCache)metadataCache;
- (TUSubtitleProvider)subtitleProvider;
- (id)callsForItems:(id)a3;
- (id)contactHandleForHandle:(id)a3;
- (id)contactsByHandleForCalls:(id)a3;
- (id)contactsByHandleForHandles:(id)a3;
- (id)dialRequestURLForRecentCall:(id)a3;
- (id)fetchAttributesForCall:(id)a3;
- (id)fetchCallMediaTypeForCall:(id)a3;
- (id)fetchCallProviderForCall:(id)a3;
- (id)fetchCallStatusForCall:(id)a3;
- (id)fetchLocalisedCallStatusForCall:(id)a3;
- (id)formattedHandle:(id)a3 isoCountryCode:(id)a4;
- (id)formattedHandleForComponentSearch:(id)a3 isoCountryCode:(id)a4;
- (id)handleIdentifierForHandle:(id)a3;
- (id)joinConversationRequestURLForRecentCall:(id)a3;
- (id)personForHandle:(id)a3 isoCountryCode:(id)a4 contact:(id)a5;
- (id)urlForCall:(id)a3;
- (void)indexInsertedCalls:(id)a3;
- (void)indexInsertedCallsSync:(id)a3 completion:(id)a4;
- (void)indexTransactions:(id)a3;
- (void)indexTransactionsSync:(id)a3;
- (void)indexedFacetimeAudioCallsWithCompletion:(id)a3;
- (void)indexedFacetimeVideoCallsWithCompletion:(id)a3;
- (void)querySpotlightCountWithSearchString:(id)a3 completion:(id)a4;
- (void)querySpotlightWithSearchString:(id)a3 completion:(id)a4;
- (void)reindexItemsForContactsUpdate:(id)a3;
- (void)removeDeletedCalls:(id)a3;
- (void)removeDeletedCallsSync:(id)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setContactChangeManager:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setCsIndex:(id)a3;
- (void)setMetadataCache:(id)a3;
- (void)updateCallsHavingHandles:(id)a3 orContactIdentifier:(id)a4;
- (void)updateCurrentHistoryToken;
- (void)updateFacetimeCallsSearchableStatus;
- (void)updateSearchableStatusFor:(id)a3 newStatus:(BOOL)a4;
@end

@implementation CHSpotlightIndexManager

+ (NSArray)keyDescriptors
{
  if (qword_100053E50 != -1) {
    dispatch_once(&qword_100053E50, &stru_100049530);
  }
  v2 = (void *)qword_100053E48;
  return (NSArray *)v2;
}

+ (id)contactStore
{
  if (qword_100053E60 != -1) {
    dispatch_once(&qword_100053E60, &stru_100049550);
  }
  v2 = (void *)qword_100053E58;
  return v2;
}

+ (CHSpotlightIndexManager)sharedInstance
{
  if (qword_100053E70 != -1) {
    dispatch_once(&qword_100053E70, &stru_100049570);
  }
  v2 = (void *)qword_100053E68;
  return (CHSpotlightIndexManager *)v2;
}

- (CHSpotlightIndexManager)initWithIndex:(id)a3 metadataCache:(id)a4 contactStore:(id)a5 featureFlags:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)CHSpotlightIndexManager;
  v14 = [(CHSpotlightIndexManager *)&v28 initWithName:"CallHistorySpotlightIndexManager"];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_featureFlags, a6);
    id v16 = objc_alloc_init((Class)TUCallProviderManager);
    [(CHSpotlightIndexManager *)v15 setCallProviderManager:v16];

    [(CHSpotlightIndexManager *)v15 setCsIndex:v10];
    [(CHSpotlightIndexManager *)v15 setContactStore:v12];
    [(CHSpotlightIndexManager *)v15 setMetadataCache:v11];
    v17 = [CHContactChangeManager alloc];
    v18 = [(CHSpotlightIndexManager *)v15 featureFlags];
    v19 = [(CHContactChangeManager *)v17 initWithSpotlightIndexManager:v15 featureFlags:v18];
    [(CHSpotlightIndexManager *)v15 setContactChangeManager:v19];

    id v20 = objc_alloc((Class)TUSubtitleProvider);
    v21 = [(CHSpotlightIndexManager *)v15 metadataCache];
    v22 = [(CHSpotlightIndexManager *)v15 callProviderManager];
    v23 = (TUSubtitleProvider *)[v20 initWithMetadataCache:v21 callProviderManager:v22];
    subtitleProvider = v15->_subtitleProvider;
    v15->_subtitleProvider = v23;

    v25 = [[CHSpotlightReindexManager alloc] initWithSpotlightIndexManager:v15];
    reindexManager = v15->_reindexManager;
    v15->_reindexManager = v25;
  }
  return v15;
}

- (void)indexTransactions:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100017894;
    v5[3] = &unk_1000490D8;
    v5[4] = self;
    id v6 = v4;
    [(CHSpotlightIndexManager *)self executeSync:v5];
  }
}

- (void)indexTransactionsSync:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v26 = self;
    v5 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v34 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Need to index calls for %lu transactions", buf, 0xCu);
    }

    v25 = +[NSMutableArray array];
    v24 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v4;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v10);
          id v12 = [v11 transactionType];
          if (v12 == (id)2)
          {
            id v16 = [v11 record];
            id v27 = 0;
            v14 = +[CHRecentCall unarchivedObjectFromData:v16 error:&v27];
            id v15 = v27;

            if (v14)
            {
              v17 = [v14 uniqueId];
              [v24 addObject:v17];
            }
            else
            {
              v17 = [(CHSpotlightIndexManager *)v26 logHandle];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                goto LABEL_22;
              }
            }
LABEL_18:

            goto LABEL_19;
          }
          if (v12) {
            goto LABEL_20;
          }
          id v13 = [v11 record];
          id v28 = 0;
          v14 = +[CHRecentCall unarchivedObjectFromData:v13 error:&v28];
          id v15 = v28;

          if (!v14)
          {
            v17 = [(CHSpotlightIndexManager *)v26 logHandle];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
LABEL_22:
              *(_DWORD *)buf = 138412546;
              id v34 = v11;
              __int16 v35 = 2114;
              id v36 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Attempt to unarchive call from transaction %@ failed with error %{public}@", buf, 0x16u);
            }
            goto LABEL_18;
          }
          [v25 addObject:v14];
LABEL_19:

LABEL_20:
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v18 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
        id v8 = v18;
      }
      while (v18);
    }

    v19 = [(CHSpotlightIndexManager *)v26 logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v25 count];
      *(_DWORD *)buf = 134217984;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Inserted calls count: %lu", buf, 0xCu);
    }

    v21 = [(CHSpotlightIndexManager *)v26 logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [v24 count];
      *(_DWORD *)buf = 134217984;
      id v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Deleted calls count: %lu", buf, 0xCu);
    }

    [(CHSpotlightIndexManager *)v26 indexInsertedCallsSync:v25 completion:0];
    [(CHSpotlightIndexManager *)v26 removeDeletedCallsSync:v24];

    id v4 = v23;
  }
}

- (void)indexInsertedCalls:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100017D70;
    v5[3] = &unk_1000490D8;
    v5[4] = self;
    id v6 = v4;
    [(CHSpotlightIndexManager *)self executeSync:v5];
  }
}

- (void)removeDeletedCalls:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100017E2C;
    v5[3] = &unk_1000490D8;
    v5[4] = self;
    id v6 = v4;
    [(CHSpotlightIndexManager *)self executeSync:v5];
  }
}

- (void)indexInsertedCallsSync:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && [v6 count])
  {
    long long v31 = v7;
    id v8 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v51 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Indexing %lu inserted calls to spotlight", buf, 0xCu);
    }

    id v29 = objc_alloc_init((Class)NSMutableArray);
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = [(CHSpotlightIndexManager *)self contactsByHandleForCalls:v6];
    id v11 = [(id)objc_opt_class() mePerson];
    unsigned __int8 v12 = +[TUCallCapabilities supportsFaceTimeAudioCalls];
    unsigned __int8 v13 = +[TUCallCapabilities supportsFaceTimeVideoCalls];
    v14 = dispatch_group_create();
    id v15 = [(CHSpotlightIndexManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000181D4;
    block[3] = &unk_100049598;
    id v16 = v6;
    id v41 = v16;
    v42 = self;
    id v17 = v10;
    unsigned __int8 v48 = v12;
    unsigned __int8 v49 = v13;
    id v43 = v17;
    id v44 = v11;
    id v18 = v29;
    id v45 = v18;
    id v19 = v27;
    id v46 = v19;
    id v20 = v9;
    id v47 = v20;
    id v30 = v11;
    dispatch_group_async(v14, v15, block);

    id v28 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:v16];
    v21 = [(CHSpotlightIndexManager *)self metadataCache];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100018940;
    v32[3] = &unk_100049610;
    v32[4] = self;
    id v33 = v16;
    id v34 = v14;
    id v35 = v20;
    id v36 = v19;
    id v37 = v17;
    id v38 = v18;
    id v7 = v31;
    id v39 = v31;
    id v22 = v18;
    id v23 = v17;
    id v24 = v19;
    id v25 = v20;
    v26 = v14;
    [v21 updateCacheWithDestinationIDs:v28 completion:v32];
  }
}

- (void)removeDeletedCallsSync:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && [v4 count])
  {
    v5 = [(CHSpotlightIndexManager *)self csIndex];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100019018;
    v6[3] = &unk_100049638;
    v6[4] = self;
    [v5 deleteSearchableItemsWithIdentifiers:v4 completionHandler:v6];
  }
}

- (void)reindexItemsForContactsUpdate:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && [v4 count])
  {
    v5 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v45 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reindexing %lu items to spotlight", buf, 0xCu);
    }

    id v6 = [(CHSpotlightIndexManager *)self callsForItems:v4];
    if ([v6 count])
    {
      id v7 = objc_alloc_init((Class)NSMutableArray);
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      id v9 = objc_alloc_init((Class)NSMutableArray);
      id v10 = [(CHSpotlightIndexManager *)self contactsByHandleForCalls:v6];
      id v11 = [(id)objc_opt_class() mePerson];
      unsigned __int8 v12 = dispatch_group_create();
      unsigned __int8 v13 = [(CHSpotlightIndexManager *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100019414;
      block[3] = &unk_100049660;
      id v28 = v6;
      id v14 = v6;
      id v37 = v14;
      id v38 = self;
      id v15 = v10;
      id v39 = v15;
      id v40 = v11;
      id v16 = v7;
      id v41 = v16;
      id v17 = v8;
      id v42 = v17;
      id v18 = v9;
      id v43 = v18;
      id v27 = v11;
      dispatch_group_async(v12, v13, block);

      id v19 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:v14];
      id v20 = [(CHSpotlightIndexManager *)self metadataCache];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000199A8;
      v29[3] = &unk_100049660;
      v29[4] = self;
      id v30 = v14;
      long long v31 = v12;
      id v32 = v18;
      id v33 = v17;
      id v34 = v15;
      id v35 = v16;
      id v21 = v16;
      id v22 = v15;
      id v23 = v17;
      id v24 = v18;
      id v25 = v12;
      [v20 updateCacheWithDestinationIDs:v19 completion:v29];

      v26 = v27;
      id v6 = v28;
    }
    else
    {
      v26 = [(CHSpotlightIndexManager *)self logHandle];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002EDB8(v4);
      }
    }
  }
}

- (void)updateSearchableStatusFor:(id)a3 newStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && [v6 count])
  {
    id v7 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v29 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reindexing %lu items to spotlight", buf, 0xCu);
    }

    id v8 = [(CHSpotlightIndexManager *)self callsForItems:v6];
    if ([v8 count])
    {
      id v20 = v8;
      id v21 = self;
      id v9 = objc_alloc_init((Class)NSMutableArray);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v24;
        BOOL v14 = !v4;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14, v20);
            id v18 = [v16 attributeSet];
            [v18 setDisableSearchInSpotlight:v17];

            [v16 setIsUpdate:1];
            [v9 addObject:v16];
          }
          id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }

      id v19 = [(CHSpotlightIndexManager *)v21 csIndex];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10001A23C;
      v22[3] = &unk_100049638;
      v22[4] = v21;
      [v19 indexSearchableItems:v9 completionHandler:v22];

      id v8 = v20;
    }
    else
    {
      id v9 = [(CHSpotlightIndexManager *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002EDB8(v6);
      }
    }
  }
}

- (id)fetchAttributesForCall:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = objc_alloc_init((Class)CSSearchableItemAttributeSet);
    [v5 setContentType:@"kSpotlightItemTypeCall"];
    id v6 = [v4 date];
    [v5 setContentCreationDate:v6];

    id v7 = [v4 date];
    [v5 setLastUsedDate:v7];

    id v8 = [(CHSpotlightIndexManager *)self fetchCallStatusForCall:v4];
    if (v8) {
      [v5 setPhoneCallStatus:v8];
    }
    id v9 = [(CHSpotlightIndexManager *)self fetchLocalisedCallStatusForCall:v4];

    if (v9)
    {
      id v10 = [objc_alloc((Class)CSCustomAttributeKey) initWithKeyName:@"com_apple_mobilephone_localisedCallStatus" searchable:1 searchableByDefault:1 unique:0 multiValued:0];
      [v5 setValue:v9 forCustomKey:v10];
    }
    id v11 = [v4 localParticipantUUID];
    id v12 = [v11 UUIDString];
    [v5 setPhoneSIM:v12];

    uint64_t v13 = [(CHSpotlightIndexManager *)self urlForCall:v4];
    [v5 setPhoneCallBackURL:v13];

    BOOL v14 = [(CHSpotlightIndexManager *)self fetchCallMediaTypeForCall:v4];
    [v5 setPhoneCallType:v14];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)fetchCallMediaTypeForCall:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [v4 mediaType];
    CFStringRef v6 = @"Video";
    if (v5 != (id)2) {
      CFStringRef v6 = 0;
    }
    if (v5 == (id)1) {
      CFStringRef v7 = @"Audio";
    }
    else {
      CFStringRef v7 = v6;
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return (id)v7;
}

- (id)contactsByHandleForCalls:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = objc_alloc_init((Class)NSMutableSet);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v24 = v4;
    id obj = v4;
    id v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v10 = [v9 remoteParticipantHandles];
          id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v28;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v28 != v13) {
                  objc_enumerationMutation(v10);
                }
                id v15 = [(CHSpotlightIndexManager *)self contactHandleForHandle:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)];
                [v5 addObject:v15];
              }
              id v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v12);
          }

          id v16 = [(CHSpotlightIndexManager *)self fetchCallProviderForCall:v9];
          id v17 = [v9 localParticipantUUID];
          id v18 = [v16 senderIdentityForAccountUUID:v17];
          id v19 = [v18 handle];
          id v20 = [v19 normalizedValue];

          if (v20) {
            [v5 addObject:v20];
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v7);
    }

    id v21 = [v5 allObjects];
    id v22 = [(CHSpotlightIndexManager *)self contactsByHandleForHandles:v21];

    id v4 = v24;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)contactsByHandleForHandles:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [(CHSpotlightIndexManager *)self contactStore];
    id v6 = [(id)objc_opt_class() keyDescriptors];
    id v7 = [v5 contactsByContactHandleForContactHandles:v4 keyDescriptors:v6 error:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)personForHandle:(id)a3 isoCountryCode:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v11 = [(CHSpotlightIndexManager *)self formattedHandle:v8 isoCountryCode:v9];
    if (v10)
    {
      uint64_t v12 = +[CNContactFormatter stringFromContact:v10 style:0];

      id v11 = (void *)v12;
    }
    id v13 = objc_alloc((Class)CSPerson);
    id v19 = v8;
    BOOL v14 = +[NSArray arrayWithObjects:&v19 count:1];
    id v15 = [(CHSpotlightIndexManager *)self handleIdentifierForHandle:v8];
    id v16 = [v13 initWithDisplayName:v11 handles:v14 handleIdentifier:v15];

    if (v10)
    {
      id v17 = [v10 identifier];
      [v16 setContactIdentifier:v17];
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (CSPerson)mePerson
{
  v2 = [(id)objc_opt_class() contactStore];
  id v3 = objc_alloc((Class)CNContactFetchRequest);
  id v4 = [(id)objc_opt_class() keyDescriptors];
  id v5 = [v3 initWithKeysToFetch:v4];

  id v6 = +[CNContact predicateForMeContact];
  [v5 setPredicate:v6];

  id v7 = +[CHLogServer sharedInstance];
  id v8 = [v7 logHandleForDomain:"CallHistorySpotlightIndexManager"];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request for me contact %@", buf, 0xCu);
  }

  id v25 = 0;
  id v9 = [v2 executeFetchRequest:v5 error:&v25];
  id v10 = v25;
  id v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v9 value];
    id v13 = [v12 firstObject];

    if (v13)
    {
      BOOL v14 = +[CNContactFormatter stringFromContact:v13 style:0];
      id v15 = objc_alloc((Class)CSPerson);
      id v16 = objc_retainBlock(ch_allPhoneNumbers);
      id v26 = v16;
      id v17 = +[NSArray arrayWithObjects:&v26 count:1];
      id v18 = [v13 handlesIncluding:v17];
      id v19 = [v15 initWithDisplayName:v14 handles:v18 handleIdentifier:CNContactPhoneNumbersKey];

      id v20 = [v13 identifier];
      [v19 setContactIdentifier:v20];

      goto LABEL_14;
    }
  }
  else if (v10 && [v10 code] != (id)200)
  {
    id v21 = +[CHLogServer sharedInstance];
    id v22 = [v21 logHandleForDomain:"CallHistorySpotlightIndexManager"];

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002EE30();
    }
  }
  long long v23 = +[CHLogServer sharedInstance];
  id v13 = [v23 logHandleForDomain:"CallHistorySpotlightIndexManager"];

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Contact fetch request for me contact returned no contact", buf, 2u);
  }
  id v19 = 0;
LABEL_14:

  return (CSPerson *)v19;
}

- (id)fetchCallProviderForCall:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled]
    && ([v4 serviceProvider], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    id v6 = [(CHSpotlightIndexManager *)self callProviderManager];
    id v7 = [v6 providerForRecentCall:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fetchLocalisedCallStatusForCall:(id)a3
{
  id v4 = a3;
  if (![(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v6 = 0;
    goto LABEL_12;
  }
  if (([v4 callStatus] & 0xD) != 0)
  {
    CFStringRef v5 = @"INCOMING_CALL";
  }
  else
  {
    if (([v4 callStatus] & 0x12) == 0)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    CFStringRef v5 = @"OUTGOING_CALL";
  }
  id v6 = +[CHLocalization localizedStringForKey:v5];
LABEL_8:
  if ([v4 callStatus] == 8)
  {
    id v7 = +[CHLocalization localizedStringForKey:@"MISSED_CALL"];
    uint64_t v8 = [v6 stringByAppendingFormat:@" %@", v7];

    id v6 = (void *)v8;
  }
  if ([v4 callStatus] == 16)
  {
    id v9 = +[CHLocalization localizedStringForKey:@"CANCELLED_CALL"];
    uint64_t v10 = [v6 stringByAppendingFormat:@" %@", v9];

    id v6 = (void *)v10;
  }
LABEL_12:

  return v6;
}

- (id)fetchCallStatusForCall:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    if (([v4 callStatus] & 0xD) != 0)
    {
      CFStringRef v5 = @"Incoming";
    }
    else if (([v4 callStatus] & 0x12) != 0)
    {
      CFStringRef v5 = @"Outgoing";
    }
    else
    {
      CFStringRef v5 = 0;
    }
    if ([v4 callStatus] == 8)
    {
      CFStringRef v5 = [(__CFString *)v5 stringByAppendingFormat:@" %@", @"Missed"];
    }
    if ([v4 callStatus] == 16)
    {
      uint64_t v6 = [(__CFString *)v5 stringByAppendingFormat:@" %@", @"Canceled"];

      CFStringRef v5 = (__CFString *)v6;
    }
  }
  else
  {
    CFStringRef v5 = 0;
  }

  return v5;
}

- (id)urlForCall:(id)a3
{
  id v4 = a3;
  if (![(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  id v5 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v6 = [v5 groupConversations];
  id v7 = [v4 validRemoteParticipantHandles];
  id v8 = [v7 count];
  unint64_t v9 = (unint64_t)v8;
  if (!v6)
  {

    if (v9 >= 2) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v13 = [(CHSpotlightIndexManager *)self dialRequestURLForRecentCall:v4];
    goto LABEL_11;
  }
  if ((unint64_t)v8 <= 1)
  {

    goto LABEL_10;
  }
  uint64_t v10 = [v4 serviceProvider];
  unsigned int v11 = [v10 isEqualToString:@"com.apple.FaceTime"];

  if (!v11) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v13 = [(CHSpotlightIndexManager *)self joinConversationRequestURLForRecentCall:v4];
LABEL_11:
  uint64_t v12 = (void *)v13;

LABEL_12:
  return v12;
}

- (id)dialRequestURLForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSpotlightIndexManager *)self callProviderManager];
  unsigned int v6 = [v5 dialRequestForRecentCall:v4];

  if (v6)
  {
    [v6 setOriginatingUIType:22];
    id v7 = [v6 URL];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)joinConversationRequestURLForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CHSpotlightIndexManager *)self callProviderManager];
  unsigned int v6 = [v5 joinConversationRequestForRecentCall:v4];

  if (v6)
  {
    [v6 setOriginatingUIType:22];
    id v7 = [v6 URL];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)handleIdentifierForHandle:(id)a3
{
  id v3 = +[CHHandle handleTypeForValue:a3];
  id v4 = &CNContactPhoneNumbersKey;
  if (v3 != (id)2) {
    id v4 = &CNContactEmailAddressesKey;
  }
  id v5 = *v4;
  return v5;
}

- (id)formattedHandle:(id)a3 isoCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (+[CHHandle handleTypeForValue:v7] == (id)2)
  {
    id v9 = [objc_alloc((Class)CHPhoneNumber) initWithDigits:v7 isoCountryCode:v6];
    uint64_t v10 = v9;
    id v8 = v7;
    if (v9)
    {
      id v8 = [v9 formattedRepresentation];
    }
  }

  return v8;
}

- (id)formattedHandleForComponentSearch:(id)a3 isoCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CHPhoneNumber) initWithDigits:v5 isoCountryCode:v6];

  id v8 = [v7 formattedRepresentation];
  if (v8)
  {
    id v9 = +[NSCharacterSet characterSetWithCharactersInString:@"() "];
    uint64_t v10 = [v8 componentsSeparatedByCharactersInSet:v9];

    +[NSMutableArray array];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001B5D4;
    v14[3] = &unk_1000496B0;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v15;
    [v10 enumerateObjectsUsingBlock:v14];
    id v12 = [v11 componentsJoinedByString:@"-"];
  }
  else
  {
    id v12 = v5;
  }

  return v12;
}

- (BOOL)isTelephonyCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 serviceProvider];
  if ([v4 isEqualToString:@"com.apple.Telephony"])
  {
    id v5 = [v3 remoteParticipantHandles];
    BOOL v6 = [v5 count] == (id)1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)updateCallsHavingHandles:(id)a3 orContactIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001B77C;
    v8[3] = &unk_100049728;
    id v9 = v6;
    id v10 = v7;
    id v11 = self;
    [(CHSpotlightIndexManager *)self executeSync:v8];
  }
}

- (void)updateFacetimeCallsSearchableStatus
{
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001BA2C;
    v3[3] = &unk_100048BC8;
    v3[4] = self;
    [(CHSpotlightIndexManager *)self executeSync:v3];
  }
}

- (void)indexedFacetimeAudioCallsWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v4 = +[CHSpotlightSearchQueryUtilities searchStringForFacetimeAudioCalls];
    [(CHSpotlightIndexManager *)self querySpotlightWithSearchString:v4 completion:v5];
  }
}

- (void)indexedFacetimeVideoCallsWithCompletion:(id)a3
{
  id v5 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v4 = +[CHSpotlightSearchQueryUtilities searchStringForFacetimeVideoCalls];
    [(CHSpotlightIndexManager *)self querySpotlightWithSearchString:v4 completion:v5];
  }
}

- (void)querySpotlightCountWithSearchString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching count for searchString: %@", (uint8_t *)&buf, 0xCu);
    }

    id v9 = +[CHSpotlightSearchQueryUtilities searchQueryWithSearchString:v6];
    id v10 = [v9 queryContext];
    [v10 setCounting:1];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001BF34;
    v16[3] = &unk_100049750;
    v16[4] = &buf;
    [v9 setCountChangedHandler:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001BF4C;
    v13[3] = &unk_100049778;
    v13[4] = self;
    p_long long buf = &buf;
    id v14 = v7;
    [v9 setCompletionHandler:v13];
    id v11 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning search query", v12, 2u);
    }

    [v9 start];
    _Block_object_dispose(&buf, 8);
  }
}

- (void)querySpotlightWithSearchString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching items for searchString: %@", buf, 0xCu);
    }

    id v9 = +[CHSpotlightSearchQueryUtilities searchQueryWithSearchString:v6];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001C298;
    v20[3] = &unk_1000496D8;
    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v21 = v10;
    [v9 setFoundItemsHandler:v20];
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_10001C2A4;
    id v16 = &unk_1000497A0;
    id v17 = self;
    id v18 = v10;
    id v19 = v7;
    id v11 = v10;
    [v9 setCompletionHandler:&v13];
    id v12 = [(CHSpotlightIndexManager *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Beginning search query", buf, 2u);
    }

    [v9 start];
  }
}

- (id)callsForItems:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "uniqueIdentifier", (void)v16);
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v12 = objc_alloc_init((Class)CHManager);
    uint64_t v13 = +[CHRecentCall predicateForCallsWithAnyUniqueIDs:v5];
    uint64_t v14 = [v12 callsWithPredicate:v13 limit:0 offset:0 batchSize:0];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)contactHandleForHandle:(id)a3
{
  id v4 = a3;
  if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
  {
    id v5 = [v4 normalizedValue];
    if (![v5 length])
    {
      uint64_t v6 = [v4 value];

      id v5 = (void *)v6;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)updateCurrentHistoryToken
{
  id v2 = [(CHSpotlightIndexManager *)self contactChangeManager];
  [v2 updateCurrentHistoryToken];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void)setCallProviderManager:(id)a3
{
}

- (CSSearchableIndex)csIndex
{
  return self->_csIndex;
}

- (void)setCsIndex:(id)a3
{
}

- (CHContactChangeManager)contactChangeManager
{
  return self->_contactChangeManager;
}

- (void)setContactChangeManager:(id)a3
{
}

- (TUSubtitleProvider)subtitleProvider
{
  return self->_subtitleProvider;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (void)setMetadataCache:(id)a3
{
}

- (CHSpotlightReindexManager)reindexManager
{
  return self->_reindexManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexManager, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_subtitleProvider, 0);
  objc_storeStrong((id *)&self->_contactChangeManager, 0);
  objc_storeStrong((id *)&self->_csIndex, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end