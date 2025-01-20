@interface PLSyndicationSpotlightReceiver
- (PLSyndicationSpotlightReceiver)init;
- (id)supportedBundleIDs;
- (id)supportedContentTypes;
- (void)_recordSpotlightUpdate;
- (void)_recordSpotlightUpdateWithDate:(id)a3;
- (void)_signalBackgroundProcessingNeededForSPL;
- (void)_signalBackgroundProcessingNeededForSyndication;
- (void)_signalBackgroundProcessingNeededForWellKnownLibraryIdentifier:(int64_t)a3;
- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3;
- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4;
- (void)start;
@end

@implementation PLSyndicationSpotlightReceiver

- (void).cxx_destruct
{
}

- (void)purgeSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = [v6 count];
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] purgeSearchableItemsWithIdentifiers, identifiersCount:%lu, bundleID:%@", (uint8_t *)&v9, 0x16u);
  }

  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSyndication];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSPL];
}

- (void)deleteSearchableItemsSinceDate:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] deleteSearchableItemsSinceDate, date:%@, bundleID:%@", (uint8_t *)&v9, 0x16u);
  }

  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSyndication];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSPL];
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] deleteAllSearchableItemsWithBundleID, bundleID:%@", (uint8_t *)&v6, 0xCu);
  }

  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSyndication];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSPL];
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218242;
    id v10 = [v6 count];
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] deleteSearchableItemsWithDomainIdentifiers, domainIdentifiersCount:%lu, bundleID:%@", (uint8_t *)&v9, 0x16u);
  }

  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSyndication];
  [(PLSyndicationSpotlightReceiver *)self _signalBackgroundProcessingNeededForSPL];
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v18 = [v6 count];
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] deleteSearchableItemsWithIdentifiers, identifiersCount:%lu, bundleID:%@", buf, 0x16u);
  }

  v16 = self;
  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  uint64_t v9 = 0;
  char v10 = 1;
  do
  {
    char v11 = v10;
    v13 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:qword_1000208A0[v9]];
    v14 = +[PLLibraryServicesManager libraryServicesManagerForLibraryURL:v13];
    v15 = [v14 syndicationDeleteManager];
    [v15 processDeletesForBundleID:v7 identifiers:v6 completion:0];

    char v10 = 0;
    uint64_t v9 = 1;
  }
  while ((v11 & 1) != 0);
  [(PLSyndicationSpotlightReceiver *)v16 _signalBackgroundProcessingNeededForSyndication];
  [(PLSyndicationSpotlightReceiver *)v16 _signalBackgroundProcessingNeededForSPL];
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v15 = [v6 count];
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] addOrUpdateSearchableItems, itemCount:%lu, bundleID:%@", buf, 0x16u);
  }

  uint64_t v9 = +[NSDate now];
  if (PLHandleSpotlightAddedOrUpdatedItems())
  {
    [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdateWithDate:v9];
    objc_initWeak((id *)buf, self);
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    delayedBackgroundJobSignalingQueue = self->_delayedBackgroundJobSignalingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F224;
    block[3] = &unk_10002CF00;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_after(v10, delayedBackgroundJobSignalingQueue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (id)supportedBundleIDs
{
  v2 = PLSyndicationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] supported bundle ids", v8, 2u);
  }

  v9[0] = PLMessagesBundleID;
  v9[1] = PLNotesBundleID;
  v9[2] = PLStickersBundleID;
  v3 = +[NSArray arrayWithObjects:v9 count:3];
  id v4 = PLSyndicationAllEquivalentFileProviderLocalAndCloudBundleIDs();
  v5 = [v4 allObjects];
  id v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)supportedContentTypes
{
  v2 = PLSyndicationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] supported content types", v4, 2u);
  }

  return 0;
}

- (void)_recordSpotlightUpdateWithDate:(id)a3
{
  id v3 = a3;
  id v4 = PLSyndicationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] setting most recent update date: %@", (uint8_t *)&v6, 0xCu);
  }

  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v3 forKey:PLSyndicationLastUpdateDateUserDefaultsKey];
}

- (void)_recordSpotlightUpdate
{
  id v3 = +[NSDate now];
  [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdateWithDate:v3];
}

- (void)_signalBackgroundProcessingNeededForWellKnownLibraryIdentifier:(int64_t)a3
{
  id v4 = +[PLPhotoLibraryPathManager wellKnownPhotoLibraryURLForIdentifier:](PLPhotoLibraryPathManager, "wellKnownPhotoLibraryURLForIdentifier:");
  v5 = +[PLLibraryServicesManager libraryServicesManagerForLibraryURL:v4];
  int v6 = [v5 backgroundJobService];

  id v7 = PLSyndicationGetLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] signaling background processing needed due to new spotlight update for library %td", (uint8_t *)&v10, 0xCu);
    }

    v8 = [v5 backgroundJobService];
    uint64_t v9 = [v5 libraryBundle];
    [v8 signalBackgroundProcessingNeededOnBundle:v9];
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v10 = 134217984;
    int64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[sync.spotlightReceiver] unable to signal background processing needed for library %td", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_signalBackgroundProcessingNeededForSPL
{
}

- (void)_signalBackgroundProcessingNeededForSyndication
{
}

- (void)start
{
  if (PLSyndicationRuntimeEnabled())
  {
    SpotlightReceiverRegister();
    id v3 = PLSyndicationGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[sync.spotlightReceiver] registered syndication spotlight receiver: %@", (uint8_t *)&v5, 0xCu);
    }

    [(PLSyndicationSpotlightReceiver *)self _recordSpotlightUpdate];
  }
  else
  {
    id v4 = PLSyndicationGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Syndication runtime is disabled via internal user defaults, not registering for photos spotlight receiver", (uint8_t *)&v5, 2u);
    }
  }
}

- (PLSyndicationSpotlightReceiver)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLSyndicationSpotlightReceiver;
  v2 = [(PLSyndicationSpotlightReceiver *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.photos.plspotlightreceiver.delayedBackgroundJobSignalingQueue", v3);
    delayedBackgroundJobSignalingQueue = v2->_delayedBackgroundJobSignalingQueue;
    v2->_delayedBackgroundJobSignalingQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

@end