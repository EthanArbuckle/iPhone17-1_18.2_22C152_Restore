@interface PHRecentsController
+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4;
- (BOOL)isInitializationBlockQueued;
- (BOOL)isLocalizedSubtitleUnknown:(id)a3;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNContactStore)suggestedContactStore;
- (NSArray)recentCalls;
- (NSCache)callProviderCache;
- (NSMapTable)delegateToQueue;
- (NSMutableDictionary)contactCache;
- (NSMutableDictionary)itemCache;
- (NSNumberFormatter)numberFormatter;
- (NSPredicate)preFetchingPredicate;
- (OS_dispatch_queue)completionDispatchQueue;
- (OS_dispatch_queue)serialQueue;
- (PHRecentsController)init;
- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7;
- (TUCallHistoryController)callHistoryController;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (TUMetadataCache)metadataCache;
- (TUSubtitleProvider)subtitleProvider;
- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4;
- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactForHandle:(id)a3;
- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)contactHandlesForHandle:(id)a3;
- (id)contactHandlesForRecentCalls:(id)a3;
- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4;
- (id)dialRequestForRecentCall:(id)a3;
- (id)fetchCallProviderForRecentCall:(id)a3;
- (id)fetchContactForContactCardDisplay:(id)a3;
- (id)fetchContactFormatter;
- (id)fetchImageForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3;
- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)fetchNumberFormatter;
- (id)fetchRecentCalls;
- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)itemForRecentCall:(id)a3;
- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4;
- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4;
- (id)localizedSubtitleForRecentCall:(id)a3;
- (id)localizedSubtitleForRecentEmergencyCall:(id)a3;
- (id)metadataItemsForRecentCall:(id)a3;
- (id)presentScreenTimeShield;
- (id)subtitleForRecentEmergencyCall:(id)a3;
- (id)unknownLabel;
- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken;
- (os_unfair_lock_s)accessorLock;
- (unint64_t)unreadCallCount;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)deleteAllRecentCalls;
- (void)deleteRecentCalls:(id)a3;
- (void)fetchContactsForHandles:(id)a3;
- (void)fetchContactsForRecentCalls:(id)a3;
- (void)fetchMetadataForRecentCalls:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3;
- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3;
- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3;
- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3;
- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3;
- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3;
- (void)markRecentAudioCallsAsRead;
- (void)markRecentCallsAsRead;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4;
- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3;
- (void)performDialRequest:(id)a3;
- (void)performDialRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3;
- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4;
- (void)performSynchronousBlock:(id)a3;
- (void)populateCachesForRecentCalls:(id)a3;
- (void)populateItemCacheForRecentCalls:(id)a3;
- (void)providersChangedForProviderManager:(id)a3;
- (void)recentCallsWillShow;
- (void)removeDelegate:(id)a3;
- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3;
- (void)setContactFormatter:(id)a3;
- (void)setInitializationBlockQueued:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setPresentScreenTimeShield:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setUnreadCallCount:(unint64_t)a3;
- (void)updateRecentCalls;
@end

@implementation PHRecentsController

+ (id)indexPathsToInsertIntoCachedRecentCalls:(id)a3 fromBackingRecentCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSMutableArray array];
  v8 = 0;
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v6 objectAtIndexedSubscript:v9];
      if (v8 >= [v5 count])
      {
        v11 = 0;
      }
      else
      {
        v11 = [v5 objectAtIndexedSubscript:v8];
      }
      if ([v11 isEqual:v10])
      {
        ++v8;
      }
      else
      {
        v12 = +[NSIndexPath indexPathForRow:v9 inSection:0];
        [v7 addObject:v12];
      }
      ++v9;
    }
    while (v9 < (unint64_t)[v6 count]);
  }
  if (v8 == [v5 count]) {
    v13 = v7;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  return v14;
}

- (PHRecentsController)init
{
  return 0;
}

- (PHRecentsController)initWithCallHistoryController:(id)a3 callProviderManager:(id)a4 contactStore:(id)a5 suggestedContactStore:(id)a6 metadataCache:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v39 = a5;
  id v38 = a6;
  id v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)PHRecentsController;
  v16 = [(PHRecentsController *)&v42 init];
  v17 = v16;
  if (v16)
  {
    v16->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = +[NSMapTable weakToStrongObjectsMapTable];
    delegateToQueue = v17->_delegateToQueue;
    v17->_delegateToQueue = (NSMapTable *)v18;

    v17->_initializationBlockQueued = 1;
    v20 = +[NSString stringWithFormat:@"com.apple.calls.queue.%@.%p", objc_opt_class(), v17];
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v21 = id v37 = v13;
    id v22 = v20;
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], v21);
    serialQueue = v17->_serialQueue;
    v17->_serialQueue = (OS_dispatch_queue *)v23;

    dispatch_queue_set_specific((dispatch_queue_t)v17->_serialQueue, off_1000A0990, v17, 0);
    objc_storeStrong((id *)&v17->_completionDispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v17->_callHistoryController, a3);
    v25 = (NSCache *)objc_alloc_init((Class)NSCache);
    callProviderCache = v17->_callProviderCache;
    v17->_callProviderCache = v25;

    objc_storeStrong((id *)&v17->_callProviderManager, a4);
    callProviderManager = v17->_callProviderManager;
    v28 = [(PHRecentsController *)v17 serialQueue];
    [(TUCallProviderManager *)callProviderManager addDelegate:v17 queue:v28];

    v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v17->_contactCache;
    v17->_contactCache = v29;

    objc_storeStrong((id *)&v17->_contactStore, a5);
    objc_storeStrong((id *)&v17->_suggestedContactStore, a6);
    objc_storeStrong((id *)&v17->_metadataCache, a7);
    v31 = (TUSubtitleProvider *)[objc_alloc((Class)TUSubtitleProvider) initWithMetadataCache:v15 callProviderManager:v14];
    subtitleProvider = v17->_subtitleProvider;
    v17->_subtitleProvider = v31;

    v33 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v17->_featureFlags;
    v17->_featureFlags = v33;

    v35 = v17->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013F18;
    block[3] = &unk_10008D758;
    v41 = v17;
    dispatch_async(v35, block);

    id v13 = v37;
  }

  return v17;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  notify_cancel([(PHRecentsController *)self callDirectoryManagerIdentificationEntriesChangedNotificationToken]);
  v4.receiver = self;
  v4.super_class = (Class)PHRecentsController;
  [(PHRecentsController *)&v4 dealloc];
}

- (TUCallProviderManager)callProviderManager
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_callProviderManager;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (CNContactStore)contactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_contactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (CNContactStore)suggestedContactStore
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_suggestedContactStore;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (TUMetadataCache)metadataCache
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_metadataCache;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (NSArray)recentCalls
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000146F8;
  v15[3] = &unk_10008DAC8;
  v15[4] = self;
  v3 = objc_retainBlock(v15);
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100014754;
  id v13 = sub_100014764;
  ((void (*)(void))v3[2])();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10[5] && [(PHRecentsController *)self isInitializationBlockQueued])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001476C;
    v6[3] = &unk_10008D7A8;
    v8 = &v9;
    v7 = v3;
    [(PHRecentsController *)self performSynchronousBlock:v6];
  }
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSArray *)v4;
}

- (unint64_t)unreadCallCount
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  unint64_t unreadCallCount = self->_unreadCallCount;
  os_unfair_lock_unlock(p_accessorLock);
  return unreadCallCount;
}

- (id)itemForRecentCall:(id)a3
{
  return [(PHRecentsController *)self itemForRecentCall:a3 presentationStyle:1];
}

- (id)itemForRecentCall:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = -[PHRecentsController itemForRecentCall:numberOfOccurences:](self, "itemForRecentCall:numberOfOccurences:", v6, [v6 numberOfOccurrences]);
  v8 = [v6 serviceProvider];
  if ([v8 isEqualToString:kCHServiceProviderTelephony])
  {
    uint64_t v9 = [v6 remoteParticipantHandles];
    id v10 = [v9 count];
    BOOL v11 = v10 != (id)1;

    if (!a4)
    {
      if (v10 == (id)1) {
        goto LABEL_11;
      }
LABEL_10:
      self = v7;
      goto LABEL_19;
    }
  }
  else
  {

    if (!a4) {
      goto LABEL_10;
    }
    BOOL v11 = 1;
  }
  v12 = [v6 imageURL];
  if (v12)
  {

    goto LABEL_10;
  }
  if (v11) {
    goto LABEL_10;
  }
LABEL_11:
  id v13 = [v6 remoteParticipantHandles];
  id v14 = [v13 anyObject];

  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = [v6 name];
  if (!v15) {
    goto LABEL_17;
  }
  v16 = (void *)v15;
  v17 = [v6 name];
  id v18 = [v17 length];

  if (!v18) {
    goto LABEL_17;
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100014754;
  v30 = sub_100014764;
  id v31 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100014AA0;
  v23[3] = &unk_10008DAF0;
  v25 = &v26;
  v23[4] = self;
  id v24 = v14;
  [(PHRecentsController *)self performSynchronousBlock:v23];
  uint64_t v19 = v27[5];
  if (!v19)
  {
    id v20 = [v7 mutableCopy];
    v21 = [v6 name];
    [v20 setLocalizedSubtitle:v21];

    self = (PHRecentsController *)[v20 copy];
  }

  _Block_object_dispose(&v26, 8);
  if (v19) {
LABEL_17:
  }
    self = v7;

LABEL_19:

  return self;
}

- (id)itemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100014754;
  uint64_t v15 = sub_100014764;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014C18;
  v7[3] = &unk_10008DAF0;
  id v10 = &v11;
  v8 = self;
  id v4 = a3;
  id v9 = v4;
  [(PHRecentsController *)v8 performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (id)coalesceRecentCall:(id)a3 withRecentCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100014754;
  v21 = sub_100014764;
  id v22 = 0;
  v8 = [(PHRecentsController *)self serialQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100014E08;
  v13[3] = &unk_10008DB18;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)deleteAllRecentCalls
{
  v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F60;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)deleteRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015058;
  v7[3] = &unk_10008DA78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)markRecentCallsAsRead
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Mark recent calls as read", buf, 2u);
  }

  id v4 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001517C;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)markRecentAudioCallsAsRead
{
  v3 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015248;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)contactForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100014754;
  v25 = sub_100014764;
  id v26 = 0;
  id v8 = [v6 validRemoteParticipantHandles];
  id v9 = [v8 count];

  if (v9 == (id)1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100015460;
    v17[3] = &unk_10008DB40;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v20 = &v21;
    [(PHRecentsController *)self performSynchronousBlock:v17];
  }
  id v10 = (void *)v22[5];
  if (!v10)
  {
    id v11 = [(PHRecentsController *)self metadataCache];
    v12 = +[CNMutableContact contactForRecentCall:v6 metadataCache:v11];
    id v13 = [v12 copy];
    id v14 = (void *)v22[5];
    v22[5] = (uint64_t)v13;

    id v10 = (void *)v22[5];
  }
  id v15 = v10;
  _Block_object_dispose(&v21, 8);

  return v15;
}

- (id)contactByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_100014754;
  id v24 = sub_100014764;
  id v25 = 0;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100015650;
  id v15 = &unk_10008DB40;
  id v16 = self;
  id v8 = v6;
  id v17 = v8;
  id v9 = v7;
  id v18 = v9;
  id v19 = &v20;
  [(PHRecentsController *)self performSynchronousBlock:&v12];
  id v10 = [v21[5] copy:v12, v13, v14, v15, v16];

  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)dialRequestForRecentCall:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100014754;
  id v15 = sub_100014764;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000158FC;
  v7[3] = &unk_10008DB68;
  id v4 = a3;
  id v9 = self;
  id v10 = &v11;
  id v8 = v4;
  [(PHRecentsController *)self performSynchronousBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)performDialRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHRecentsController *)self presentScreenTimeShield];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 callFilterController];
  unsigned int v9 = [v8 shouldRestrictDialRequest:v4 performSynchronously:1];

  if (v9)
  {
    id v10 = [(PHRecentsController *)self presentScreenTimeShield];
    ((void (**)(void, id))v10)[2](v10, v4);
  }
  else
  {
LABEL_4:
    uint64_t v11 = +[TUCallCenter sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015BD8;
    v12[3] = &unk_10008DB90;
    id v13 = v4;
    [v11 launchAppForDialRequest:v13 completion:v12];
  }
}

- (void)performDialRequestForRecentCall:(id)a3
{
  id v4 = [(PHRecentsController *)self dialRequestForRecentCall:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    id v4 = [(PHRecentsController *)self performDialRequest:v4];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)performJoinRequestForRecentCall:(id)a3
{
}

- (void)performJoinRequestForRecentCall:(id)a3 overrideProvider:(id)a4
{
  id v5 = a3;
  id v33 = a4;
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHRecentsController -performJoinRequestForRecentCall", buf, 2u);
  }

  id v7 = [v5 validRemoteParticipantHandles];
  id v8 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v34 = v5;
  unsigned int v9 = [v5 validRemoteParticipantHandles];
  id v10 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v36 + 1) + 8 * i) tuHandle];
        if (v14)
        {
          id v15 = objc_alloc((Class)TUConversationMember);
          id v16 = +[NSSet setWithObject:v14];
          id v17 = [v15 initWithHandles:v16];

          [v8 addObject:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v18 = [objc_alloc((Class)TUJoinConversationRequest) initWithRemoteMembers:v8];
    id v19 = v34;
    -[NSObject setVideo:](v18, "setVideo:", [v34 mediaType] == (id)2);
    -[NSObject setVideoEnabled:](v18, "setVideoEnabled:", [v34 mediaType] == (id)2);
    [v18 setOriginatingUIType:8];
    uint64_t v20 = v33;
    if (v33) {
      [v18 setProvider:v33];
    }
    uint64_t v21 = [(PHRecentsController *)self callProviderManager];
    uint64_t v22 = [v21 faceTimeProvider];
    uint64_t v23 = [v34 outgoingLocalParticipantUUID];
    id v24 = [v22 senderIdentityForAccountUUID:v23];

    if (v24)
    {
      id v25 = [v24 handle];
      [v18 setCallerID:v25];
    }
    id v26 = +[TUCallProviderManager invitationPreferencesForRecentCall];
    [v18 setInvitationPreferences:v26];

    uint64_t v27 = [(PHRecentsController *)self presentScreenTimeShield];
    if (!v27) {
      goto LABEL_20;
    }
    uint64_t v28 = (void *)v27;
    v29 = +[TUCallCenter sharedInstance];
    v30 = [v29 callFilterController];
    unsigned int v31 = [v30 shouldRestrictJoinConversationRequest:v18 performSynchronously:1];

    uint64_t v20 = v33;
    id v19 = v34;

    if (v31)
    {
      v32 = [(PHRecentsController *)self presentScreenTimeShield];
      ((void (**)(void, NSObject *))v32)[2](v32, v18);
    }
    else
    {
LABEL_20:
      v32 = +[TUCallCenter sharedInstance];
      [v32 launchAppForJoinRequest:v18];
    }
  }
  else
  {
    id v18 = PHDefaultLog();
    uint64_t v20 = v33;
    id v19 = v34;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v34;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not create join request for recent call: %@", buf, 0xCu);
    }
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v10 = a4;
  p_accessorLock = &self->_accessorLock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  id v8 = [(PHRecentsController *)self delegateToQueue];
  if (v10) {
    unsigned int v9 = v10;
  }
  else {
    unsigned int v9 = &_dispatch_main_q;
  }
  [v8 setObject:v9 forKey:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeDelegate:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  id v6 = [(PHRecentsController *)self delegateToQueue];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)notifyDelegatesRecentsController:(id)a3 didUpdateCalls:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [(PHRecentsController *)self featureFlags];
  unsigned int v8 = [v7 phoneRecentsAvatarsEnabled];

  if (v8)
  {
    os_unfair_lock_assert_owner(&self->_accessorLock);
    id v17 = self;
    unsigned int v9 = [(PHRecentsController *)self delegateToQueue];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v10) {
      goto LABEL_14;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v15 = [v9 objectForKey:v14];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100016460;
          block[3] = &unk_10008DBB8;
          void block[4] = v14;
          id v22 = v6;
          id v23 = v18;
          dispatch_async(v15, block);

          id v16 = &v22;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
          id v15 = [v9 objectForKey:v14];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100016470;
          v19[3] = &unk_10008DBB8;
          v19[4] = v14;
          v20[0] = v6;
          v20[1] = v17;
          dispatch_async(v15, v19);
          id v16 = (id *)v20;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v11)
      {
LABEL_14:

        break;
      }
    }
  }
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeCalls:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  unsigned int v8 = [(PHRecentsController *)self delegateToQueue];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = [v8 objectForKey:v13];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001665C;
          block[3] = &unk_10008DBB8;
          void block[4] = v13;
          id v16 = v6;
          id v17 = v7;
          dispatch_async(v14, block);
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)notifyDelegatesRecentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v7 = [(PHRecentsController *)self delegateToQueue];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = [v7 objectForKey:v12];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100016824;
          block[3] = &unk_10008DBE0;
          void block[4] = v12;
          id v15 = v6;
          unint64_t v16 = a4;
          dispatch_async(v13, block);
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)notifyDelegatesRecentsControllerDidChangeMessages:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_accessorLock);
  id v5 = [(PHRecentsController *)self delegateToQueue];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v5 objectForKey:v10];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1000169E8;
          v12[3] = &unk_10008DA78;
          void v12[4] = v10;
          id v13 = v4;
          dispatch_async(v11, v12);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (NSCache)callProviderCache
{
  v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  callProviderCache = self->_callProviderCache;

  return callProviderCache;
}

- (NSMutableDictionary)contactCache
{
  v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactCache = self->_contactCache;

  return contactCache;
}

- (CNContactFormatter)contactFormatter
{
  v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;

  return contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  uint64_t v8 = (CNContactFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  contactFormatter = self->_contactFormatter;
  p_contactFormatter = &self->_contactFormatter;
  if (contactFormatter != v8) {
    objc_storeStrong((id *)p_contactFormatter, a3);
  }
}

- (BOOL)isInitializationBlockQueued
{
  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_initializationBlockQueued;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setInitializationBlockQueued:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_initializationBlockQueued != v3) {
    self->_initializationBlockQueued = v3;
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSMutableDictionary)itemCache
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  itemCache = self->_itemCache;

  return itemCache;
}

- (NSNumberFormatter)numberFormatter
{
  BOOL v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  numberFormatter = self->_numberFormatter;

  return numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  uint64_t v8 = (NSNumberFormatter *)a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  numberFormatter = self->_numberFormatter;
  p_numberFormatter = &self->_numberFormatter;
  if (numberFormatter != v8) {
    objc_storeStrong((id *)p_numberFormatter, a3);
  }
}

- (void)setRecentCalls:(id)a3
{
  id v7 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  recentCalls = self->_recentCalls;
  if (recentCalls != v7 && ![(NSArray *)recentCalls isEqualToArray:v7])
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    id v6 = self->_recentCalls;
    self->_recentCalls = v5;

    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:self->_recentCalls];
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_unreadCallCount != a3)
  {
    self->_unint64_t unreadCallCount = a3;
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeUnreadCallCount:a3];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)setPreFetchingPredicate:(id)a3
{
  id v7 = (NSPredicate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_preFetchingPredicate != v7)
  {
    objc_storeStrong((id *)&self->_preFetchingPredicate, a3);
    id v6 = [(PHRecentsController *)self callHistoryController];
    [v6 setPreFetchingPredicate:v7];
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (id)contactForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  [(PHRecentsController *)self contactHandlesForHandle:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(PHRecentsController *)self contactCache];
        id v13 = [v12 objectForKeyedSubscript:v11];
        long long v14 = [v13 value];

        if (v14)
        {
          long long v15 = v6;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v15 = PHDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Handle not found in cache: %@", buf, 0xCu);
  }
  long long v14 = 0;
LABEL_13:

  return v14;
}

- (id)contactsByHandleForRecentCall:(id)a3 keyDescriptors:(id)a4
{
  id v6 = a3;
  id v54 = a4;
  id v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v53 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v48 = objc_alloc_init((Class)NSMutableDictionary);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v44 = v6;
  id obj = [v6 validRemoteParticipantHandles];
  v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v47)
  {
    v55 = 0;
    uint64_t v46 = *(void *)v69;
    id v8 = v53;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v69 != v46) {
          objc_enumerationMutation(obj);
        }
        v49 = v9;
        uint64_t v51 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v9);
        uint64_t v10 = -[PHRecentsController contactHandlesForHandle:](self, "contactHandlesForHandle:");
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v11 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v65;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v65 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              long long v16 = [(PHRecentsController *)self contactCache];
              long long v17 = [v16 objectForKeyedSubscript:v15];

              if (!v17) {
                goto LABEL_21;
              }
              uint64_t v18 = [v17 value];
              if (!v18
                || (long long v19 = (void *)v18,
                    [v17 value],
                    long long v20 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v21 = [v20 areKeysAvailable:v54],
                    v20,
                    id v8 = v53,
                    v19,
                    v21))
              {
                id v22 = [v17 value];
                if (v22)
                {
                  id v23 = v55;
                  if (!v55) {
                    id v23 = objc_alloc_init((Class)NSMutableDictionary);
                  }
                  v55 = v23;
                  long long v24 = [v23 objectForKeyedSubscript:v51];
                  if (!v24)
                  {
                    long long v24 = +[NSMutableArray array];
                    [v55 setObject:v24 forKeyedSubscript:v51];
                  }
                  [v24 addObject:v22];
                }
              }
              else
              {
LABEL_21:
                [v8 addObject:v15];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v64 objects:v74 count:16];
          }
          while (v12);
        }
        [v48 setObject:v10 forKeyedSubscript:v51];

        uint64_t v9 = v49 + 1;
      }
      while (v49 + 1 != v47);
      v47 = (char *)[obj countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v47);
  }
  else
  {
    v55 = 0;
    id v8 = v53;
  }

  if ([v8 count])
  {
    long long v25 = [(PHRecentsController *)self contactStore];
    long long v26 = [v8 array];
    long long v27 = [v25 contactsForHandles:v26 keyDescriptors:v54];

    if (v27)
    {
      id v28 = v55;
      if (!v55) {
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
      }
      v55 = v28;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v50 = [v48 allKeys];
      id v29 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v52 = *(void *)v61;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v61 != v52) {
              objc_enumerationMutation(v50);
            }
            uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
            id v33 = objc_alloc_init((Class)NSMutableOrderedSet);
            v34 = [v48 objectForKeyedSubscript:v32];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            id v35 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v57;
              do
              {
                for (k = 0; k != v36; k = (char *)k + 1)
                {
                  if (*(void *)v57 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  long long v39 = [v27 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
                  if ([v39 count]) {
                    [v33 addObjectsFromArray:v39];
                  }
                }
                id v36 = [v34 countByEnumeratingWithState:&v56 objects:v72 count:16];
              }
              while (v36);
            }
            v40 = [v55 objectForKeyedSubscript:v32];
            if (!v40)
            {
              v40 = +[NSMutableArray array];
              [v55 setObject:v40 forKeyedSubscript:v32];
            }
            v41 = [v33 array];
            [v40 addObjectsFromArray:v41];
          }
          id v30 = [v50 countByEnumeratingWithState:&v60 objects:v73 count:16];
        }
        while (v30);
      }
    }
    id v8 = v53;
  }
  id v42 = [v55 copy];

  return v42;
}

- (id)contactHandlesForHandle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  id v5 = [v3 value];
  if ([v5 length])
  {
    [v4 addObject:v5];
    id v6 = [v3 normalizedValue];
    if ([v6 length])
    {
      id v7 = [v3 value];
      unsigned __int8 v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0) {
        [v4 addObject:v6];
      }
    }
  }
  id v9 = [v4 copy];

  return v9;
}

- (id)contactHandlesForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = [v10 validRemoteParticipantHandles];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [(PHRecentsController *)self contactHandlesForHandle:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
              [v5 addObjectsFromArray:v16];
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v17 = [v5 array];

  return v17;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 type];
  uint64_t v8 = PHDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v9)
    {
      uint64_t v10 = [v5 value];
      int v16 = 138412546;
      long long v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v16, 0x16u);
    }
    id v11 = [v5 value];
    id v12 = TUFormattedPhoneNumber();

    if (!v12)
    {
LABEL_9:
      uint64_t v14 = +[NSBundle mainBundle];
      id v12 = [v14 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_10008F308 table:@"PHRecents"];
    }
  }
  else
  {
    if (v9)
    {
      id v13 = [v5 value];
      int v16 = 138412290;
      long long v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v16, 0xCu);
    }
    id v12 = [v5 value];
    if (!v12) {
      goto LABEL_9;
    }
  }

  return v12;
}

- (id)fetchCallProviderForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 serviceProvider];
  id v7 = [(PHRecentsController *)self callProviderManager];
  if (v6)
  {
    uint64_t v8 = [(PHRecentsController *)self callProviderCache];
    BOOL v9 = [v8 objectForKey:v6];

    if (v9) {
      goto LABEL_7;
    }
    uint64_t v10 = [v7 providerForRecentCall:v4];
    if (v10)
    {
      BOOL v9 = (void *)v10;
      id v11 = [(PHRecentsController *)self callProviderCache];
      [v11 setObject:v9 forKey:v6];

      goto LABEL_7;
    }
    uint64_t v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not retrieve a call provider for the specified recent call: %@", buf, 0xCu);
    }
  }
  else
  {
    id v12 = +[NSString stringWithFormat:@"Service provider is nil for the specified recent call: %@", v4];
    NSLog(@"** TUAssertion failure: %@", v12);

    _TUAssertShouldCrashApplication();
  }
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (void)fetchContactsForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self contactHandlesForRecentCalls:v4];
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = [v4 count];
    __int16 v10 = 2048;
    id v11 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu calls using %lu handles", (uint8_t *)&v8, 0x16u);
  }

  [(PHRecentsController *)self fetchContactsForHandles:v6];
}

- (id)fetchContactForContactCardDisplay:(id)a3
{
  id v4 = a3;
  if ([v4 canExceedUnifyingThreshold])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_100014754;
    id v16 = sub_100014764;
    id v17 = 0;
    id v5 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017ECC;
    block[3] = &unk_10008DAF0;
    id v10 = v4;
    id v11 = &v12;
    void block[4] = self;
    id v6 = v4;
    dispatch_sync(v5, block);

    id v7 = (void *)v13[5];
    if (!v7) {
      id v7 = v6;
    }
    id v4 = v7;

    _Block_object_dispose(&v12, 8);
  }

  return v4;
}

- (id)fetchUnifiedContactForID:(id)a3 withDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(PHRecentsController *)self contactStore];
  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching unified contact for handle %@ using contact store %@", buf, 0x16u);
  }

  id v11 = v7;
  if (!v7)
  {
    if (qword_1000A21A8 != -1) {
      dispatch_once(&qword_1000A21A8, &stru_10008DC68);
    }
    id v11 = (id)qword_1000A21A0;
  }
  id v23 = 0;
  uint64_t v12 = [v9 unifiedContactWithIdentifier:v6 keysToFetch:v11 error:&v23];
  id v13 = v23;
  if (!v7) {

  }
  id v14 = objc_alloc((Class)TUOptionalObject);
  if (v13)
  {
    id v15 = [v14 initWithValue:0];
    id v16 = [(PHRecentsController *)self contactCache];
    [v16 setObject:v15 forKeyedSubscript:v6];

    id v17 = PHDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100061980((uint64_t)v6, v17);
    }

    id v18 = 0;
  }
  else
  {
    id v19 = [v14 initWithValue:v12];
    long long v20 = [(PHRecentsController *)self contactCache];
    [v20 setObject:v19 forKeyedSubscript:v6];

    long long v21 = PHDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found unified contact %@ for contact handle %@", buf, 0x16u);
    }

    id v18 = v12;
  }

  return v18;
}

- (void)fetchContactsForHandles:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [(PHRecentsController *)self contactCache];
        id v14 = [v13 objectForKeyedSubscript:v12];

        if (!v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v39 objects:v50 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v15 = [(PHRecentsController *)self contactStore];
    id v16 = PHDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v6 count];
      *(_DWORD *)buf = 134218242;
      id v44 = v17;
      __int16 v45 = 2112;
      uint64_t v46 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    id v18 = [v6 allObjects];
    id v32 = v7;
    if (qword_1000A21A8 != -1) {
      dispatch_once(&qword_1000A21A8, &stru_10008DC68);
    }
    unsigned int v31 = v15;
    id v19 = [v15 contactsForHandles:v18 keyDescriptors:qword_1000A21A0 alwaysUnifyLabeledValues:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v33 = v6;
    id obj = v6;
    id v20 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obj);
          }
          long long v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          id v25 = [v19 objectForKeyedSubscript:v24];
          __int16 v26 = [v25 firstObject];
          if ((unint64_t)[v25 count] >= 2)
          {
            id v27 = PHDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v25 count];
              *(_DWORD *)buf = 134218498;
              id v44 = v28;
              __int16 v45 = 2112;
              uint64_t v46 = v24;
              __int16 v47 = 2112;
              id v48 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Found %lu contacts for contact handle %@; caching the first contact %@",
                buf,
                0x20u);
            }
          }
          id v29 = [objc_alloc((Class)TUOptionalObject) initWithValue:v26];
          id v30 = [(PHRecentsController *)self contactCache];
          [v30 setObject:v29 forKeyedSubscript:v24];
        }
        id v21 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
      }
      while (v21);
    }

    id v7 = v32;
    id v6 = v33;
  }
}

- (id)fetchContactFormatter
{
  v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)CNContactFormatter);
  [v3 setStyle:0];

  return v3;
}

- (id)fetchImageForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 ttyType];
  if (v6 == (id)2)
  {
    uint64_t v7 = +[UIImage recentsTTYRelayGlyphImage];
LABEL_5:
    id v8 = (void *)v7;
    if (v7) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    uint64_t v7 = +[UIImage recentsTTYDirectGlyphImage];
    goto LABEL_5;
  }
LABEL_6:
  unsigned int v9 = [v4 callStatus];
  if (v9 != kCHCallStatusConnectedOutgoing)
  {
    unsigned int v10 = [v4 callStatus];
    if (v10 != kCHCallStatusCancelled) {
      goto LABEL_11;
    }
  }
  id v11 = [v4 mediaType];
  if (v11 == (id)2)
  {
    uint64_t v12 = +[UIImage recentsOutgoingVideoCallGlyphImage];
    goto LABEL_13;
  }
  if (v11 != (id)1)
  {
LABEL_11:
    id v8 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = +[UIImage recentsOutgoingAudioCallGlyphImage];
LABEL_13:
  id v8 = (void *)v12;
LABEL_14:

  return v8;
}

- (id)fetchMutableItemForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = -[PHRecentsController fetchMutableItemForRecentCall:numberOfOccurences:](self, "fetchMutableItemForRecentCall:numberOfOccurences:", v4, [v4 numberOfOccurrences]);

  return v6;
}

- (id)fetchMutableItemForRecentCall:(id)a3 numberOfOccurences:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_alloc_init(PHMutableRecentsItem);
  unsigned int v9 = [v6 validRemoteParticipantHandles];
  uint64_t v10 = (uint64_t)[v9 count];
  uint64_t v11 = (uint64_t)[v6 countOfExcludedHandles];
  uint64_t v12 = v11;
  if (!v10 && v11 >= 1)
  {
    if (v11 == 1)
    {
      id v13 = TUBundle();
      id v47 = [v13 localizedStringForKey:@"ONE_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
    }
    else
    {
      long long v39 = TUBundle();
      [v39 localizedStringForKey:@"%@_OTHERS" value:&stru_10008F308 table:@"TelephonyUtilities"];
      long long v40 = v169 = v6;
      [(PHRecentsController *)self numberFormatter];
      long long v42 = v41 = v8;
      v43 = +[NSNumber numberWithInteger:v12];
      [v42 stringFromNumber:v43];
      unint64_t v44 = a4;
      uint64_t v46 = v45 = v9;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, v46);
      id v47 = (id)objc_claimAutoreleasedReturnValue();

      unsigned int v9 = v45;
      a4 = v44;

      id v8 = v41;
      id v6 = v169;
    }
    id v17 = 0;
    goto LABEL_81;
  }
  v165 = v8;
  v166 = v9;
  if (v10 <= 1)
  {
    id v14 = [v9 anyObject];
    v179[0] = _NSConcreteStackBlock;
    v179[1] = 3221225472;
    v179[2] = sub_100019B6C;
    v179[3] = &unk_10008DC08;
    v179[4] = self;
    v179[5] = v12;
    id v15 = objc_retainBlock(v179);
    if (v14)
    {
      [(PHRecentsController *)self contactHandlesForHandle:v14];
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
      if (v17)
      {
        v167 = v14;
        unint64_t v163 = a4;
        uint64_t v18 = *(void *)v176;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v176 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v175 + 1) + 8 * i);
            id v21 = [(PHRecentsController *)self contactCache];
            uint64_t v22 = [v21 objectForKeyedSubscript:v20];
            id v23 = [v22 value];

            if (v23)
            {
              id v48 = [(PHRecentsController *)self contactFormatter];
              v49 = [v48 stringFromContact:v23];
              ((void (*)(void *, void *))v15[2])(v15, v49);
              id v47 = (id)objc_claimAutoreleasedReturnValue();

              id v50 = [(PHRecentsController *)self contactFormatter];
              id v17 = [v50 stringFromContact:v23];

              goto LABEL_38;
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v175 objects:v181 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        id v47 = 0;
LABEL_38:
        a4 = v163;
        id v14 = v167;
      }
      else
      {
        id v47 = 0;
      }
    }
    else
    {
      id v17 = 0;
      id v47 = 0;
    }
    v79 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (![v47 length] && (objc_msgSend(v79, "isTelephonyProvider") & 1) == 0)
    {
      v80 = [v6 name];
      uint64_t v81 = ((void (*)(void *, void *))v15[2])(v15, v80);

      uint64_t v82 = [v6 name];

      id v17 = (id)v82;
      id v47 = (id)v81;
    }
    if (![v47 length])
    {
      v83 = [v6 callerIdForDisplay];
      uint64_t v84 = ((void (*)(void *, void *))v15[2])(v15, v83);

      uint64_t v85 = [v6 callerIdForDisplay];

      id v17 = (id)v85;
      id v47 = (id)v84;
    }
    if (![v47 length])
    {
      unsigned int v86 = [v6 callerIdIsBlocked];
      v87 = +[NSBundle mainBundle];
      v88 = v87;
      v170 = v14;
      unint64_t v89 = a4;
      v90 = v6;
      if (v86) {
        CFStringRef v91 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v91 = @"UNKNOWN_CALLER";
      }
      v92 = [v87 localizedStringForKey:v91 value:&stru_10008F308 table:@"PHRecents"];
      uint64_t v93 = ((void (*)(void *, void *))v15[2])(v15, v92);

      LODWORD(v92) = [v90 callerIdIsBlocked];
      v94 = +[NSBundle mainBundle];
      v95 = v94;
      if (v92) {
        CFStringRef v96 = @"NO_CALLER_ID";
      }
      else {
        CFStringRef v96 = @"UNKNOWN_CALLER";
      }
      uint64_t v97 = [v94 localizedStringForKey:v96 value:&stru_10008F308 table:@"PHRecents"];

      id v17 = (id)v97;
      id v47 = (id)v93;
      id v6 = v90;
      a4 = v89;
      id v14 = v170;
    }

    id v8 = v165;
    unsigned int v9 = v166;
    goto LABEL_81;
  }
  uint64_t v160 = v11;
  unint64_t v164 = a4;
  v168 = v6;
  long long v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v25 = v9;
  id v26 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  if (!v26) {
    goto LABEL_30;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v172;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v172 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v30 = *(void *)(*((void *)&v171 + 1) + 8 * (void)j);
      unsigned int v31 = [(PHRecentsController *)self contactForHandle:v30];
      if (v31)
      {
        id v32 = [(PHRecentsController *)self contactFormatter];
        id v33 = [v32 stringFromContact:v31];

        if (v33)
        {
          [v24 addObject:v33];
          goto LABEL_28;
        }
        v34 = [v168 isoCountryCode];
        long long v35 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v34];
        [v24 addObject:v35];
      }
      else
      {
        id v33 = [v168 isoCountryCode];
        v34 = [(PHRecentsController *)self formattedNameForHandle:v30 countryCode:v33];
        [v24 addObject:v34];
      }

LABEL_28:
    }
    id v27 = [v25 countByEnumeratingWithState:&v171 objects:v180 count:16];
  }
  while (v27);
LABEL_30:

  long long v36 = +[NSMutableString string];
  uint64_t v37 = (uint64_t)[v24 count];
  if (v37 == 3)
  {
    v156 = v36;
    if (v160 == 1)
    {
      v108 = TUBundle();
      [v108 localizedStringForKey:@"%@_%@_%@_AND_ONE_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
      v110 = v109 = v36;
      v111 = [v24 objectAtIndexedSubscript:0];
      v112 = [v24 objectAtIndexedSubscript:1];
      v113 = [v24 objectAtIndexedSubscript:2];
      uint64_t v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v110, v111, v112, v113);

      v114 = v109;
    }
    else
    {
      if (!v160)
      {
        uint64_t v51 = TUBundle();
        uint64_t v52 = [v51 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_10008F308 table:@"TelephonyUtilities"];
        id v53 = [v24 objectAtIndexedSubscript:0];
        id v54 = [v24 objectAtIndexedSubscript:1];
        v55 = [v24 objectAtIndexedSubscript:2];
        long long v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v52, v53, v54, v55);
        [v156 appendString:v56];

LABEL_73:
        a4 = v164;

        v123 = TUBundle();
        v124 = [v123 localizedStringForKey:@"%@_%@_AND_%@" value:&stru_10008F308 table:@"TelephonyUtilities"];
        v125 = [v24 objectAtIndexedSubscript:0];
        v126 = [v24 objectAtIndexedSubscript:1];
        v127 = [v24 objectAtIndexedSubscript:2];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v124, v125, v126, v127);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        id v8 = v165;
        unsigned int v9 = v166;
        long long v36 = v156;
        goto LABEL_77;
      }
      v154 = TUBundle();
      uint64_t v115 = [v154 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHERS" value:&stru_10008F308 table:@"TelephonyUtilities"];
      v116 = [v24 objectAtIndexedSubscript:0];
      v117 = [v24 objectAtIndexedSubscript:1];
      v118 = [v24 objectAtIndexedSubscript:2];
      v119 = [(PHRecentsController *)self numberFormatter];
      v120 = +[NSNumber numberWithInteger:v160];
      v121 = [v119 stringFromNumber:v120];
      v122 = (void *)v115;
      uint64_t v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v115, v116, v117, v118, v121);

      v114 = v156;
    }
    [v114 appendString:v51];
    goto LABEL_73;
  }
  unsigned int v9 = v166;
  if (v37 == 2)
  {
    if (v160 == 1)
    {
      long long v57 = TUBundle();
      long long v58 = [v57 localizedStringForKey:@"%@_%@_AND_ONE_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
      long long v59 = [v24 objectAtIndexedSubscript:0];
      long long v60 = [v24 objectAtIndexedSubscript:1];
      long long v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      a4 = v164;
    }
    else
    {
      a4 = v164;
      TUBundle();
      if (v160) {
        v155 = {;
      }
        long long v58 = [v155 localizedStringForKey:@"%@_%@_AND_%@_OTHERS" value:&stru_10008F308 table:@"TelephonyUtilities"];
        long long v59 = [v24 objectAtIndexedSubscript:0];
        long long v60 = [v24 objectAtIndexedSubscript:1];
        v128 = [(PHRecentsController *)self numberFormatter];
        +[NSNumber numberWithInteger:v160];
        v129 = v159 = v36;
        v130 = [v128 stringFromNumber:v129];
        long long v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60, v130);

        long long v57 = v155;
        long long v36 = v159;
      }
      else {
        long long v57 = {;
      }
        long long v58 = [v57 localizedStringForKey:@"%@_AND_%@" value:&stru_10008F308 table:@"TelephonyUtilities"];
        long long v59 = [v24 objectAtIndexedSubscript:0];
        long long v60 = [v24 objectAtIndexedSubscript:1];
        long long v61 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59, v60);
      }
    }

    [v36 appendString:v61];
    TUBundle();
    v132 = v131 = v36;
    v133 = [v132 localizedStringForKey:@"%@_AND_%@" value:&stru_10008F308 table:@"TelephonyUtilities"];
    v134 = [v24 objectAtIndexedSubscript:0];
    v135 = [v24 objectAtIndexedSubscript:1];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v133, v134, v135);
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    long long v36 = v131;
    id v8 = v165;
    unsigned int v9 = v166;
  }
  else if (v37 == 1)
  {
    a4 = v164;
    if (v160 == 1)
    {
      long long v38 = TUBundle();
      [v38 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
      v99 = v98 = v36;
      v100 = [v24 objectAtIndexedSubscript:0];
      v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v99, v100);
      [v98 appendString:v101];

      long long v36 = v98;
    }
    else
    {
      if (v160)
      {
        v102 = TUBundle();
        v103 = [v102 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_10008F308 table:@"TelephonyUtilities"];
        [v24 objectAtIndexedSubscript:0];
        v104 = v158 = v36;
        v105 = [(PHRecentsController *)self numberFormatter];
        v106 = +[NSNumber numberWithInteger:v160];
        v107 = [v105 stringFromNumber:v106];
        long long v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v103, v104, v107);

        unsigned int v9 = v166;
        long long v36 = v158;
      }
      else
      {
        long long v38 = [v24 objectAtIndexedSubscript:0];
      }
      [v36 appendString:v38];
    }

    id v17 = [v24 objectAtIndexedSubscript:0];
    id v8 = v165;
  }
  else
  {
    if (v37 < 4)
    {
      id v17 = 0;
    }
    else
    {
      long long v62 = (char *)[v24 count] + v160 - 3;
      v161 = TUBundle();
      uint64_t v63 = [v161 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
      long long v64 = [v24 objectAtIndexedSubscript:0];
      long long v65 = [v24 objectAtIndexedSubscript:1];
      long long v66 = [v24 objectAtIndexedSubscript:2];
      [(PHRecentsController *)self numberFormatter];
      long long v67 = v157 = v36;
      long long v68 = +[NSNumber numberWithUnsignedInteger:v62];
      long long v69 = [v67 stringFromNumber:v68];
      long long v70 = (void *)v63;
      long long v71 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v64, v65, v66, v69);
      [v157 appendString:v71];

      v162 = TUBundle();
      v72 = [v162 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
      v73 = [v24 objectAtIndexedSubscript:0];
      v74 = [v24 objectAtIndexedSubscript:1];
      v75 = [v24 objectAtIndexedSubscript:2];
      v76 = [(PHRecentsController *)self numberFormatter];
      v77 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v24 count] - 3);
      v78 = [v76 stringFromNumber:v77];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v72, v73, v74, v75, v78);
      id v17 = (id)objc_claimAutoreleasedReturnValue();

      long long v36 = v157;
      unsigned int v9 = v166;
    }
    a4 = v164;
    id v8 = v165;
  }
LABEL_77:
  if ([v36 length]) {
    id v47 = [v36 copy];
  }
  else {
    id v47 = 0;
  }

  id v6 = v168;
LABEL_81:
  v136 = [v6 date];
  [(PHRecentsItem *)v8 setDate:v136];

  v137 = [(PHRecentsItem *)v8 image];

  if (!v137)
  {
    v138 = [(PHRecentsController *)self fetchImageForRecentCall:v6];
    [(PHRecentsItem *)v8 setImage:v138];
  }
  if (a4 <= 1)
  {
    [(PHRecentsItem *)v8 setLocalizedCount:0];
  }
  else
  {
    v139 = [(PHRecentsController *)self numberFormatter];
    v140 = +[NSNumber numberWithUnsignedInteger:a4];
    [v139 stringFromNumber:v140];
    v142 = id v141 = v6;
    v143 = +[NSString stringWithFormat:@"(%@)", v142];
    [(PHRecentsItem *)v8 setLocalizedCount:v143];

    id v6 = v141;
  }
  [(PHRecentsItem *)v8 setLocalizedTitle:v47];
  [(PHRecentsItem *)v8 setLocalizedValidHandlesTitle:v17];
  -[PHRecentsItem setVerified:](v8, "setVerified:", [v6 verificationStatus] == (id)1);
  if (+[PHDevice isGeminiCapable])
  {
    v144 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v6];
    if (objc_msgSend(v6, "ph_supportsLocalParticipantBadge"))
    {
      v145 = [v144 prioritizedSenderIdentities];
      id v146 = [v145 count];

      if ((unint64_t)v146 >= 2)
      {
        v147 = [(PHRecentsController *)self callProviderManager];
        v148 = [v147 telephonyProvider];
        v149 = [v6 localParticipantUUID];
        [v148 senderIdentityForAccountUUID:v149];
        v151 = id v150 = v6;

        v152 = [v151 localizedShortName];
        [(PHRecentsItem *)v8 setLocalizedSenderIdentityTitle:v152];

        id v6 = v150;
      }
    }
  }

  return v8;
}

- (void)fetchMetadataForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self metadataCache];

  if (v6)
  {
    uint64_t v7 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCalls:v4];
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v16 = [v4 count];
      __int16 v17 = 2048;
      id v18 = [v7 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu recent calls using %lu handles", buf, 0x16u);
    }

    unsigned int v9 = [(PHRecentsController *)self featureFlags];
    unsigned int v10 = [v9 phoneRecentsAvatarsEnabled];

    uint64_t v11 = [(PHRecentsController *)self metadataCache];
    uint64_t v12 = v11;
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100019ECC;
      v13[3] = &unk_10008DA78;
      v13[4] = self;
      id v14 = v4;
      [v12 updateCacheWithDestinationIDs:v7 completion:v13];
    }
    else
    {
      [v11 updateCacheWithDestinationIDs:v7];
    }
  }
}

- (id)fetchNumberFormatter
{
  v2 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_alloc_init((Class)NSNumberFormatter);

  return v3;
}

- (id)fetchRecentCalls
{
  id v3 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(PHRecentsController *)self recentCalls];
  id v5 = [(PHRecentsController *)self callHistoryController];
  id v6 = [v5 recentCalls];

  if ([v4 isEqualToArray:v6])
  {
    uint64_t v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recent calls array has not changed. Ignoring", v12, 2u);
    }

    id v8 = v4;
  }
  else
  {
    unsigned int v9 = [(PHRecentsController *)self itemCache];
    [v9 removeAllObjects];

    [(PHRecentsController *)self populateCachesForRecentCalls:v6];
    id v8 = v6;
  }
  id v10 = v8;

  return v10;
}

- (void)populateCachesForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    id v12 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting contacts for %lu calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchContactsForRecentCalls:v4];
  uint64_t v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v4 count];
    int v11 = 134217984;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting metadata for %lu recent calls.", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self fetchMetadataForRecentCalls:v4];
  unsigned int v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 count];
    int v11 = 134217984;
    id v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Populating item cache with %lu recent calls", (uint8_t *)&v11, 0xCu);
  }

  [(PHRecentsController *)self populateItemCacheForRecentCalls:v4];
}

- (void)populateItemCacheForRecentCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(PHRecentsController *)self itemCache];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = -[PHRecentsController fetchMutableItemForRecentCall:](self, "fetchMutableItemForRecentCall:", v12, (void)v17);
        id v14 = [(PHRecentsController *)self localizedSubtitleForRecentCall:v12];
        [v13 setLocalizedSubtitle:v14];

        id v15 = [v13 copy];
        id v16 = [v12 uniqueId];
        [v6 setObject:v15 forKeyedSubscript:v16];
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)updateRecentCalls
{
  id v3 = [(PHRecentsController *)self fetchRecentCalls];
  [(PHRecentsController *)self setRecentCalls:v3];
}

- (void)recentCallsWillShow
{
  id v2 = [(PHRecentsController *)self callHistoryController];
  [v2 boostQualityOfService];
}

- (id)metadataItemsForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
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
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(PHRecentsController *)self metadataCache];
        id v13 = [v12 metadataForDestinationID:v11];

        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v14 = [v5 copy];

  return v14;
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A97C;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleIDSServiceAvailabilityDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ABC8;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    long long v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  uint64_t v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD38;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleTUCallHistoryControllerRecentCallsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(PHRecentsController *)self callHistoryController];
  unsigned __int8 v7 = [v5 isEqual:v6];

  id v8 = PHDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      id v12 = [v4 name];
      *(_DWORD *)buf = 138412802;
      __int16 v15 = v10;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2112;
      long long v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    id v8 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B01C;
    block[3] = &unk_10008D758;
    void block[4] = self;
    dispatch_async(v8, block);
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring calls change notification from different callHistoryController", buf, 2u);
  }
}

- (void)handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(PHRecentsController *)self callHistoryController];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = objc_opt_class();
      id v10 = v9;
      id v11 = [v4 name];
      int v14 = 138412802;
      __int16 v15 = v9;
      __int16 v16 = 2048;
      long long v17 = self;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", (uint8_t *)&v14, 0x20u);
    }
    id v12 = [v4 object];
    __int16 v13 = v12;
    if (v12) {
      -[PHRecentsController setUnreadCallCount:](self, "setUnreadCallCount:", [v12 unreadCallCount]);
    }
  }
}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self featureFlags];
  unsigned __int8 v6 = [v5 phoneRecentsAvatarsEnabled];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 name];
      *(_DWORD *)buf = 138412802;
      int v14 = v8;
      __int16 v15 = 2048;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
    }
    id v11 = [(PHRecentsController *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B314;
    block[3] = &unk_10008D758;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    int v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  id v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B660;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)handleUIApplicationDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    *(_DWORD *)buf = 138412802;
    id v12 = v6;
    __int16 v13 = 2048;
    int v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling <%@>", buf, 0x20u);
  }
  id v9 = [(PHRecentsController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B868;
  block[3] = &unk_10008D758;
  void block[4] = self;
  dispatch_async(v9, block);
}

- (void)performSynchronousBlock:(id)a3
{
  if (dispatch_get_specific(off_1000A0990) == self)
  {
    unsigned __int8 v6 = (void (*)(void))*((void *)a3 + 2);
    id v7 = a3;
    v6();
  }
  else
  {
    id v5 = a3;
    id v7 = [(PHRecentsController *)self serialQueue];
    dispatch_sync(v7, v5);
  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  unsigned __int8 v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412802;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2048;
    __int16 v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    id v7 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ <%p> is handling providersChangedForProviderManager %@", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [(PHRecentsController *)self recentCalls];
  if ([v8 count])
  {
    id v9 = [(PHRecentsController *)self itemCache];
    [v9 removeAllObjects];

    [(PHRecentsController *)self populateItemCacheForRecentCalls:v8];
    os_unfair_lock_lock(&self->_accessorLock);
    [(PHRecentsController *)self notifyDelegatesRecentsController:self didChangeCalls:v8];
    os_unfair_lock_unlock(&self->_accessorLock);
  }
}

- (id)subtitleForRecentEmergencyCall:(id)a3
{
  id v4 = [a3 callOccurrences];
  id v5 = [(PHRecentsController *)self localizedSubtitleForRecentEmergencyCall:v4];

  return v5;
}

- (id)localizedSubtitleForRecentEmergencyCall:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v3)
  {
LABEL_33:
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v19 = @"Emergency call";
    goto LABEL_34;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v25;
  uint64_t v8 = kCHCallOccurrenceEmergencyVideosCountKey;
  uint64_t v9 = kCHCallOccurrenceEmergencyImagesCountKey;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v25 != v7) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      __int16 v12 = [v11 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 += (unint64_t)[v12 integerValue];
      }
      __int16 v13 = [v11 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v5 += (unint64_t)[v13 integerValue];
      }
    }
    id v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v4);
  if (v6 && !v5)
  {
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    CFStringRef v16 = @"Shared videos coalesced";
    CFStringRef v17 = @"Shared video coalesced";
    BOOL v18 = v6 == 1;
    goto LABEL_18;
  }
  if (v6 || !v5)
  {
    if (v6 == 1 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photo coalesced";
      goto LABEL_34;
    }
    if (v6 == 1 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared video and photos coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 == 1)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photo coalesced";
      goto LABEL_34;
    }
    if (v6 >= 2 && v5 >= 2)
    {
      __int16 v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v19 = @"Shared videos and photos coalesced";
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  __int16 v14 = +[NSBundle mainBundle];
  id v15 = v14;
  CFStringRef v16 = @"Shared photos coalesced";
  CFStringRef v17 = @"Shared photo coalesced";
  BOOL v18 = v5 == 1;
LABEL_18:
  if (v18) {
    CFStringRef v19 = v17;
  }
  else {
    CFStringRef v19 = v16;
  }
LABEL_34:
  long long v20 = [v14 localizedStringForKey:v19 value:&stru_10008F308 table:0];
  id v21 = +[NSString stringWithFormat:v20];

  return v21;
}

- (id)localizedSubtitleForRecentCall:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PHRecentsController *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 wasEmergencyCall])
  {
    id v6 = [(PHRecentsController *)self subtitleForRecentEmergencyCall:v4];
    goto LABEL_30;
  }
  uint64_t v7 = [v4 blockedByExtension];

  if (v7)
  {
    uint64_t v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"%@_BLOCKED_BY" value:&stru_10008F308 table:@"PHRecents"];
    int v10 = [v4 localizedBlockedByExtensionName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  id v11 = [(PHRecentsController *)self fetchCallProviderForRecentCall:v4];
  __int16 v12 = v11;
  if (!v11) {
    goto LABEL_26;
  }
  if ([v11 isFaceTimeProvider])
  {
    id v13 = [v4 mediaType];
    __int16 v14 = +[NSBundle mainBundle];
    id v15 = v14;
    if (v13 == (id)2) {
      CFStringRef v16 = @"RECENTS_FACETIME_VIDEO";
    }
    else {
      CFStringRef v16 = @"RECENTS_FACETIME_AUDIO";
    }
    id v18 = [v14 localizedStringForKey:v16 value:&stru_10008F308 table:@"PHRecents"];
    goto LABEL_22;
  }
  if (![v12 isTelephonyProvider])
  {
    id v25 = [v4 mediaType];
    if (v25 == (id)1)
    {
      CFStringRef v26 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_AUDIO";
      goto LABEL_39;
    }
    if (v25 == (id)2)
    {
      CFStringRef v26 = @"RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_VIDEO";
LABEL_39:
      id v33 = +[NSBundle mainBundle];
      v34 = [v33 localizedStringForKey:v26 value:&stru_10008F308 table:@"PHRecents"];
      long long v35 = [v12 localizedName];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v34, v35);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    }
LABEL_26:
    id v18 = 0;
    goto LABEL_27;
  }
  CFStringRef v17 = [v4 remoteParticipantHandles];
  id v15 = [v17 anyObject];

  if (!v15)
  {
    id v18 = 0;
    goto LABEL_50;
  }
  [(PHRecentsController *)self contactHandlesForHandle:v15];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v18 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v18) {
    goto LABEL_49;
  }
  id v50 = v15;
  uint64_t v19 = *(void *)v53;
  while (2)
  {
    for (i = 0; i != v18; i = (char *)i + 1)
    {
      if (*(void *)v53 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void *)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v22 = [(PHRecentsController *)self contactCache];
      id v23 = [v22 objectForKeyedSubscript:v21];
      long long v24 = [v23 value];

      if (v24)
      {
        id v15 = v50;
        id v29 = [v50 type];
        if (v29 == (id)3)
        {
          uint64_t v30 = [v24 labeledValueForEmailAddress:v21];
          unsigned int v31 = [v30 label];
          id v32 = &CNContactEmailAddressesKey;
        }
        else
        {
          if (v29 == (id)2)
          {
            long long v36 = [v4 isoCountryCode];
            unsigned int v31 = +[CNPhoneNumber phoneNumberWithDigits:v21 countryCode:v36];

            if (v31)
            {
              uint64_t v30 = [v24 labeledValueForPhoneNumber:v31];
            }
            else
            {
              uint64_t v30 = 0;
            }
            uint64_t v37 = [v30 label];
            id v18 = +[CNLabeledValue localizedDisplayStringForLabel:v37 propertyName:CNContactPhoneNumbersKey];

            goto LABEL_47;
          }
          if (v29 != (id)1)
          {
            id v18 = 0;
LABEL_48:

            goto LABEL_49;
          }
          uint64_t v30 = [v24 labeledValueForSocialProfileWithUsername:v21];
          unsigned int v31 = [v30 label];
          id v32 = &CNContactSocialProfilesKey;
        }
        id v18 = +[CNLabeledValue localizedDisplayStringForLabel:v31 propertyName:*v32];
LABEL_47:

        goto LABEL_48;
      }
    }
    id v18 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v18) {
      continue;
    }
    break;
  }
  id v15 = v50;
LABEL_49:

LABEL_50:
  if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18]
    && [v4 isJunk])
  {
    long long v38 = [v4 junkIdentificationCategory];
    if (v38)
    {
      long long v39 = [v4 junkIdentificationCategory];
    }
    else
    {
      long long v39 = @"MAYBE_JUNK";
    }

    long long v40 = +[NSBundle mainBundle];
    uint64_t v41 = [v40 localizedStringForKey:v39 value:&stru_10008F308 table:@"PHRecents"];

    id v18 = (id)v41;
  }
  if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18])
  {
    long long v42 = +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:v4];
    v43 = [v42 firstObject];

    if (v43)
    {
      unint64_t v44 = [(PHRecentsController *)self metadataCache];
      __int16 v45 = [v44 metadataForDestinationID:v43];

      if (v45)
      {
        if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18]
          && ([v4 callerIdIsBlocked] & 1) == 0)
        {
          uint64_t v46 = [v45 metadataForProvider:objc_opt_class()];

          id v18 = (id)v46;
        }
        if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18]
          && ([v4 callerIdIsBlocked] & 1) == 0)
        {
          uint64_t v47 = [v45 metadataForProvider:objc_opt_class()];

          id v18 = (id)v47;
        }
        if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18])
        {
          uint64_t v48 = [v45 metadataForProvider:objc_opt_class()];

          id v18 = (id)v48;
        }
        if ([(PHRecentsController *)self isLocalizedSubtitleUnknown:v18])
        {
          uint64_t v49 = [v45 metadataForProvider:objc_opt_class()];

          id v18 = (id)v49;
        }
      }
    }
    else
    {
      __int16 v45 = 0;
    }
  }
LABEL_22:

LABEL_27:
  if (![v18 length])
  {
    uint64_t v27 = [(PHRecentsController *)self unknownLabel];

    id v18 = (id)v27;
  }
  id v6 = v18;

LABEL_30:

  return v6;
}

- (BOOL)isLocalizedSubtitleUnknown:(id)a3
{
  return [a3 length] == 0;
}

- (id)unknownLabel
{
  if (qword_1000A2188 != -1) {
    dispatch_once(&qword_1000A2188, &stru_10008DC28);
  }
  id v2 = (void *)qword_1000A2180;

  return v2;
}

- (TUCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (id)presentScreenTimeShield
{
  return self->_presentScreenTimeShield;
}

- (void)setPresentScreenTimeShield:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (int)callDirectoryManagerIdentificationEntriesChangedNotificationToken
{
  return self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken;
}

- (void)setCallDirectoryManagerIdentificationEntriesChangedNotificationToken:(int)a3
{
  self->_callDirectoryManagerIdentificationEntriesChangedNotificationToken = a3;
}

- (TUSubtitleProvider)subtitleProvider
{
  return self->_subtitleProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleProvider, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_presentScreenTimeShield, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callProviderCache, 0);

  objc_storeStrong((id *)&self->_callHistoryController, 0);
}

@end