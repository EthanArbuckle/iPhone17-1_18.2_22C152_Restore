@interface BDSNBPinningManager
+ (BDSNBPinningManager)sharedManager;
- (BDSNBPinningManager)init;
- (BLHLSAudiobookFetcher)audiobookFetcher;
- (BOOL)_isExplicitMaterialAllowed;
- (BOOL)_shouldPinJaliscoItem:(id)a3 allowsExplicit:(BOOL)a4;
- (BOOL)_shouldPinMediaItem:(id)a3 allowsExplicit:(BOOL)a4;
- (OS_dispatch_queue)notifyQueue;
- (id)_jaliscoAudiobookWithAssetId:(id)a3;
- (id)updateReadingNowWithCompletion:(id)a3;
- (id)updateWantToRead:(BOOL)a3 updateReadingNow:(BOOL)a4 updateManuallyPinned:(BOOL)a5 jaliscoUpdateSuccessful:(BOOL)a6 withCompletion:(id)a7;
- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4;
- (id)updateWantToReadWithCompletion:(id)a3;
- (void)_prepareMediaItemForPinning:(id)a3 parentProgress:(id)a4 completion:(id)a5;
- (void)_prepareMediaItemForPinningIfNeeded:(id)a3 parentProgress:(id)a4 completion:(id)a5;
- (void)audiobookStoreEnabledWithCompletion:(id)a3;
- (void)fetchMostRecentAudiobookWithCompletion:(id)a3;
- (void)setAudiobookFetcher:(id)a3;
- (void)setNotifyQueue:(id)a3;
- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4;
@end

@implementation BDSNBPinningManager

+ (BDSNBPinningManager)sharedManager
{
  if (qword_100297588 != -1) {
    dispatch_once(&qword_100297588, &stru_100261508);
  }
  v2 = (void *)qword_100297590;
  return (BDSNBPinningManager *)v2;
}

- (BDSNBPinningManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)BDSNBPinningManager;
  v2 = [(BDSNBPinningManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BDSNBPinningManager notify queue", v3);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)BLHLSAudiobookFetcher);
    v7 = +[BDSAppBundleIdentifier bdsAppBundleIdentifier];
    v8 = (BLHLSAudiobookFetcher *)[v6 initCanUseCellularData:1 powerRequired:0 bundleID:v7];
    audiobookFetcher = v2->_audiobookFetcher;
    v2->_audiobookFetcher = v8;
  }
  return v2;
}

- (void)_prepareMediaItemForPinningIfNeeded:(id)a3 parentProgress:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v13 && !+[BLMediaItemUtils bitrateForItem:v13])
  {
    [(BDSNBPinningManager *)self _prepareMediaItemForPinning:v13 parentProgress:v8 completion:v9];
  }
  else
  {
    if (v8)
    {
      v10 = +[NSProgress progressWithTotalUnitCount:1];
      [v8 addChild:v10 withPendingUnitCount:1];
      [v10 setCompletedUnitCount:1];
    }
    id v11 = objc_retainBlock(v9);
    v12 = v11;
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

- (void)_prepareMediaItemForPinning:(id)a3 parentProgress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10000CEB0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "We want to update the bitrate so fetching master playlist for mediaItem: %@", buf, 0xCu);
  }

  v12 = [v8 valueForProperty:MPMediaItemPropertyHLSPlaylistURL];
  if ([v12 length])
  {
    id v13 = +[NSURL URLWithString:v12];
    v14 = [(BDSNBPinningManager *)self audiobookFetcher];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100051A20;
    v22 = &unk_100261530;
    id v23 = v8;
    id v24 = v10;
    v15 = [v14 setupDownloadTaskForFetchingMasterPlaylistAndSelectingStreamFromMasterPlaylistURL:v13 completion:&v19];

    v16 = objc_msgSend(v15, "progress", v19, v20, v21, v22);
    [v9 addChild:v16 withPendingUnitCount:1];

    [v15 resume];
    v17 = v23;
LABEL_9:

    goto LABEL_10;
  }
  v18 = sub_10000CEB0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1001E79F4();
  }

  id v13 = (void (**)(void, void))objc_retainBlock(v10);
  if (v13)
  {
    v17 = +[NSError errorWithDomain:@"BDSErrorDomain" code:1003 userInfo:0];
    ((void (**)(void, void *))v13)[2](v13, v17);
    goto LABEL_9;
  }
LABEL_10:
}

- (id)updateWantToReadWithCompletion:(id)a3
{
  return [(BDSNBPinningManager *)self updateWantToRead:1 updateReadingNow:0 updateManuallyPinned:0 jaliscoUpdateSuccessful:1 withCompletion:a3];
}

- (id)updateReadingNowWithCompletion:(id)a3
{
  return [(BDSNBPinningManager *)self updateWantToRead:0 updateReadingNow:1 updateManuallyPinned:0 jaliscoUpdateSuccessful:1 withCompletion:a3];
}

- (id)updateWantToReadAndReadingNowWithJaliscoUpdateSuccessful:(BOOL)a3 completion:(id)a4
{
  return [(BDSNBPinningManager *)self updateWantToRead:1 updateReadingNow:1 updateManuallyPinned:1 jaliscoUpdateSuccessful:a3 withCompletion:a4];
}

- (BOOL)_shouldPinMediaItem:(id)a3 allowsExplicit:(BOOL)a4
{
  id v5 = a3;
  id v6 = v5;
  BOOL v7 = v5 && (a4 || ([v5 isExplicitItem] & 1) == 0);

  return v7;
}

- (BOOL)_shouldPinJaliscoItem:(id)a3 allowsExplicit:(BOOL)a4
{
  unsigned __int8 v4 = a3 == 0;
  if (a3 && !a4)
  {
    id v5 = [a3 isExplicit];
    unsigned __int8 v4 = [v5 BOOLValue];
  }
  return v4 ^ 1;
}

- (BOOL)_isExplicitMaterialAllowed
{
  v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 effectiveBoolValueForSetting:MCFeatureBookstoreEroticaAllowed];

  return v3 != 2;
}

- (id)_jaliscoAudiobookWithAssetId:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unsigned __int8 v4 = +[NSSet setWithObject:v3];
    id v5 = +[BLJaliscoDAAPClient sharedClient];
    id v6 = [v5 fetchItemsForStoreIDs:v4];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "isAudiobook", (void)v15);
          unsigned int v13 = [v12 BOOLValue];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)updateWantToRead:(BOOL)a3 updateReadingNow:(BOOL)a4 updateManuallyPinned:(BOOL)a5 jaliscoUpdateSuccessful:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  LODWORD(v9) = a4;
  LODWORD(v10) = a3;
  id v54 = a7;
  id v11 = sub_10000CEB0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v107 = v10;
    *(_WORD *)&v107[4] = 1024;
    *(_DWORD *)&v107[6] = v9;
    LOWORD(v108) = 1024;
    *(_DWORD *)((char *)&v108 + 2) = v8;
    HIWORD(v108) = 1024;
    BOOL v109 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating wantToRead:%d, readingNow:%d, manuallyPinned:%d jaliscoUpdateSuccessful:%d", buf, 0x1Au);
  }
  BOOL v62 = v7;

  v12 = +[NSProgress progressWithTotalUnitCount:100];
  unsigned int v64 = [(BDSNBPinningManager *)self _isExplicitMaterialAllowed];
  unsigned int v13 = [sub_100072178() sharedManager];
  group = dispatch_group_create();
  v57 = +[NSMutableOrderedSet orderedSet];
  v58 = +[NSMutableOrderedSet orderedSet];
  v56 = +[NSProgress progressWithTotalUnitCount:3];
  objc_msgSend(v12, "addChild:withPendingUnitCount:");
  v55 = +[NSProgress progressWithTotalUnitCount:3];
  objc_msgSend(v12, "addChild:withPendingUnitCount:");
  int v60 = (int)v9;
  if (v10)
  {
    dispatch_group_enter(group);
    uint64_t v9 = +[BCCloudCollectionsManager sharedManager];
    v14 = [v9 collectionMemberManagerInstance];
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1000528A4;
    v98[3] = &unk_100261558;
    id v99 = v12;
    v100 = group;
    id v101 = v58;
    v102 = self;
    id v103 = v56;
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_100052B3C;
    v96[3] = &unk_100261580;
    v97 = v100;
    [v14 fetchCollectionMembersInCollectionID:@"Want_To_Read_Collection_ID" maximumResultCount:3 filter:v98 completion:v96];

    LODWORD(v9) = v60;
  }
  if (v9)
  {
    dispatch_group_enter(group);
    uint64_t v9 = +[BCCloudAssetManager sharedManager];
    long long v15 = [v9 readingNowDetailManagerInstance];
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_100052B44;
    v90[3] = &unk_1002615A8;
    id v91 = v12;
    v92 = group;
    id v93 = v57;
    v94 = self;
    id v95 = v55;
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_100052E0C;
    v88[3] = &unk_100261580;
    v89 = v92;
    [v15 trackedRreadingNowDetailsInDescendingOrderMaximumResultCount:3 filter:v90 completion:v88];

    LOBYTE(v9) = v60;
  }
  id v59 = v12;
  v65 = +[NSMutableSet set];
  if (v8)
  {
    v61 = +[NSMutableSet set];
    long long v16 = sub_10000CEB0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = [v13 pinnedAudiobooks];
      *(_DWORD *)buf = 138412290;
      *(void *)v107 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Checking for pinned audiobooks that need their bitrate set. Pinned books: %@", buf, 0xCu);
    }
    char v53 = (char)v10;

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v52 = v13;
    long long v18 = [v13 pinnedAudiobooks];
    id v19 = [v18 countByEnumeratingWithState:&v84 objects:v105 count:16];
    uint64_t v20 = v64;
    if (v19)
    {
      id v21 = v19;
      uint64_t v22 = *(void *)v85;
      int v63 = !v62;
      do
      {
        id v23 = 0;
        do
        {
          if (*(void *)v85 != v22) {
            objc_enumerationMutation(v18);
          }
          id v24 = *(void **)(*((void *)&v84 + 1) + 8 * (void)v23);
          v25 = sub_10000CEB0();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v107 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Checking %@", buf, 0xCu);
          }

          id v26 = [v24 stringValue];
          v27 = +[BDSMediaLibraryUtils representativeDAAPMediaItemsWithAssetId:v26];

          if (v27)
          {
            v28 = sub_10000CEB0();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              id v34 = +[BLMediaItemUtils bitrateForItem:v27];
              *(_DWORD *)buf = 138412546;
              *(void *)v107 = v27;
              *(_WORD *)&v107[8] = 2048;
              id v108 = v34;
              _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Checking item %@ with bitrate %lu", buf, 0x16u);
            }

            if ([(BDSNBPinningManager *)self _shouldPinMediaItem:v27 allowsExplicit:v20])
            {
              if (+[BLMediaItemUtils bitrateForItem:v27]) {
                goto LABEL_30;
              }
              v29 = sub_10000CEB0();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v107 = v24;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found pinned item that did not have a bitrate set. Will update for assetID: %@", buf, 0xCu);
              }

              v30 = v61;
              v31 = v27;
            }
            else
            {
              v30 = v65;
              v31 = v24;
            }
            [v30 addObject:v31];
          }
          else
          {
            v32 = [v24 stringValue];
            v33 = [(BDSNBPinningManager *)self _jaliscoAudiobookWithAssetId:v32];

            uint64_t v20 = v64;
            if (((-[BDSNBPinningManager _shouldPinJaliscoItem:allowsExplicit:](self, "_shouldPinJaliscoItem:allowsExplicit:", v33, v64) | v63) & 1) == 0)[v65 addObject:v24]; {
          }
            }
LABEL_30:

          id v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v18 countByEnumeratingWithState:&v84 objects:v105 count:16];
      }
      while (v21);
    }

    id v10 = +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", [v61 count]);
    [v59 addChild:v10 withPendingUnitCount:34];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v35 = v61;
    id v36 = [v35 countByEnumeratingWithState:&v80 objects:v104 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v81;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v81 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          dispatch_group_enter(group);
          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_100052E14;
          v78[3] = &unk_1002615D0;
          v78[4] = v40;
          v79 = group;
          [(BDSNBPinningManager *)self _prepareMediaItemForPinning:v40 parentProgress:v10 completion:v78];
        }
        id v37 = [v35 countByEnumeratingWithState:&v80 objects:v104 count:16];
      }
      while (v37);
    }

    LOBYTE(v9) = v60;
    LOBYTE(v10) = v53;
    unsigned int v13 = v52;
  }
  v41 = [(BDSNBPinningManager *)self notifyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052EF0;
  block[3] = &unk_1002615F8;
  id v69 = v58;
  id v70 = v56;
  id v71 = v57;
  id v72 = v55;
  char v76 = (char)v10;
  char v77 = (char)v9;
  id v73 = v13;
  id v74 = v65;
  id v75 = v54;
  id v42 = v54;
  id v43 = v65;
  id v44 = v13;
  id v45 = v55;
  id v46 = v57;
  id v47 = v56;
  id v48 = v58;
  dispatch_group_notify(group, v41, block);

  v49 = v75;
  id v50 = v59;

  return v50;
}

- (void)fetchMostRecentAudiobookWithCompletion:(id)a3
{
  id v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1000533E0;
  v11[4] = sub_1000533F0;
  id v12 = 0;
  unsigned __int8 v4 = +[BCCloudAssetManager sharedManager];
  id v5 = [v4 readingNowDetailManagerInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000533F8;
  v10[3] = &unk_100261620;
  v10[4] = v11;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005354C;
  v7[3] = &unk_100261648;
  uint64_t v9 = v11;
  id v6 = v3;
  id v8 = v6;
  [v5 trackedRreadingNowDetailsInDescendingOrderMaximumResultCount:1 filter:v10 completion:v7];

  _Block_object_dispose(v11, 8);
}

- (void)updateBitrateForItemWithAdamID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000CEB0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "updating bitrate for item with adamID %@", buf, 0xCu);
  }

  uint64_t v9 = [v6 stringValue];
  id v10 = +[BDSMediaLibraryUtils representativeDAAPMediaItemsWithAssetId:v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000537AC;
  v13[3] = &unk_100260488;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(BDSNBPinningManager *)self _prepareMediaItemForPinning:v10 parentProgress:0 completion:v13];
}

- (void)audiobookStoreEnabledWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100053948;
  v4[3] = &unk_100261670;
  id v5 = a3;
  id v3 = v5;
  +[BUBag audiobookStoreIsAvailable:v4];
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
}

- (BLHLSAudiobookFetcher)audiobookFetcher
{
  return self->_audiobookFetcher;
}

- (void)setAudiobookFetcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiobookFetcher, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
}

@end