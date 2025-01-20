@interface PhotosStorageManagementController
- (BOOL)_hasCompletedCPLEnablement;
- (BOOL)_isExpungeRecentlyDeletedItemsOptionTip:(id)a3;
- (BOOL)_isOptimizePhotosOptionTip:(id)a3;
- (PhotosStorageManagementController)init;
- (STStorageOptionTip)enableCPLOptionTip;
- (id)_significantTipItemsFromAssets:(id)a3 recoverable:(BOOL)a4;
- (id)_tipForEnableCPLOption;
- (id)_tipForExpungeRecentlyDeletedItemsOption;
- (id)_tipForOptimizePhotosOption;
- (id)_tipForPhotosAction;
- (id)_tipForReviewDuplicatesAction;
- (id)_tipForReviewLargeVideoAction;
- (id)_tipForReviewScreenshotsAction;
- (id)_tipOperationQueue;
- (id)identifier;
- (id)tips;
- (void)_handleFailureToEnableCPLWithError:(id)a3;
- (void)_performTipOperation:(id)a3;
- (void)_presentAlertController:(id)a3;
- (void)_refreshSizeGainForICPLEnableTip;
- (void)_updateStateForEnableCPLOptionTip;
- (void)enableOptionForTip:(id)a3;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)setEnableCPLOptionTip:(id)a3;
@end

@implementation PhotosStorageManagementController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableCPLOptionTip, 0);
  objc_storeStrong((id *)&self->_storageManagementUtility, 0);
  objc_storeStrong((id *)&self->_cplStatus, 0);
  objc_storeStrong((id *)&self->_offersManager, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setEnableCPLOptionTip:(id)a3
{
}

- (STStorageOptionTip)enableCPLOptionTip
{
  return self->_enableCPLOptionTip;
}

- (void)managerDidCancel:(id)a3
{
  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543618;
    uint64_t v6 = objc_opt_class();
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Up-sell offer was cancelled by the user.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543874;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2048;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Loading of Up-sell workflow failed with an error: %@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  id v4 = a4;
  PULocalizedString();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTitle:v5];
}

- (void)_presentAlertController:(id)a3
{
  id v12 = a3;
  if (!+[NSThread isMainThread])
  {
    __int16 v11 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PhotosStorageManagementController.m", 563, @"%s must be called on the main thread", "-[PhotosStorageManagementController _presentAlertController:]");
  }
  id v5 = +[UIApplication sharedApplication];
  uint64_t v6 = [v5 keyWindow];
  int v7 = [v6 rootViewController];

  uint64_t v8 = [v7 presentedViewController];

  if (v8)
  {
    do
    {
      __int16 v9 = [v7 presentedViewController];

      v10 = [v9 presentedViewController];

      int v7 = v9;
    }
    while (v10);
  }
  else
  {
    __int16 v9 = v7;
  }
  [v9 presentViewController:v12 animated:1 completion:0];
}

- (void)_handleFailureToEnableCPLWithError:(id)a3
{
  id v4 = a3;
  if ([v4 code] == (char *)&dword_4 + 3)
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will present insufficient iCloud storage alert", buf, 0x16u);
    }

    uint64_t v6 = +[UIApplication sharedApplication];
    int v7 = objc_msgSend(v6, "px_firstKeyWindow");
    uint64_t v8 = [v7 rootViewController];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_28A8;
    v20[3] = &unk_8320;
    v20[4] = self;
    id v21 = v8;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_29A4;
    v19[3] = &unk_8438;
    v19[4] = self;
    id v9 = v8;
    v10 = +[UIAlertController px_alertForCPLEnableError:v4 actionHandler:v20 cancelHandler:v19];
    [(PhotosStorageManagementController *)self _presentAlertController:v10];
  }
  else
  {
    __int16 v11 = +[CPNetworkObserver sharedNetworkObserver];
    unsigned int v12 = [v11 isNetworkReachable];

    v13 = PLUIGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = objc_opt_class();
        __int16 v24 = 2048;
        v25 = self;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will present generic failure alert", buf, 0x16u);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will present network failure alert", buf, 0x16u);
    }

    PULocalizedString();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v15 = PULocalizedString();
    v16 = PULocalizedString();
    v17 = +[UIAlertController alertControllerWithTitle:v9 message:v15 preferredStyle:1];
    v18 = +[UIAlertAction actionWithTitle:v16 style:0 handler:0];
    [v17 addAction:v18];

    [(PhotosStorageManagementController *)self _presentAlertController:v17];
  }
}

- (void)enableOptionForTip:(id)a3
{
  id v4 = (STStorageOptionTip *)a3;
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = [(STStorageOptionTip *)v4 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v42 = v6;
    __int16 v43 = 2048;
    v44 = self;
    __int16 v45 = 2114;
    v46 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Enable option for storage tip: %{public}@", buf, 0x20u);
  }
  if (self->_enableCPLOptionTip == v4)
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v11;
      __int16 v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Attempting to enable iCloud Photos", buf, 0x16u);
    }

    self->_isEnablingCPL = 1;
    [(PhotosStorageManagementController *)self _updateStateForEnableCPLOptionTip];
    storageManagementUtility = self->_storageManagementUtility;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_311C;
    v40[3] = &unk_8348;
    v40[4] = self;
    [(PUStorageManagementUtility *)storageManagementUtility enableCPLWithCompletionBlock:v40];
  }
  else if ([(PhotosStorageManagementController *)self _isOptimizePhotosOptionTip:v4])
  {
    uint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v9;
      __int16 v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Will enable iCloud Photos optimized mode", buf, 0x16u);
    }

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_32E4;
    v37[3] = &unk_8370;
    v38 = v4;
    v39 = self;
    [(PhotosStorageManagementController *)self _performTipOperation:v37];
  }
  else if ([(PhotosStorageManagementController *)self _isExpungeRecentlyDeletedItemsOptionTip:v4])
  {
    v28 = PULocalizedString();
    v13 = +[UIApplication sharedApplication];
    BOOL v14 = [v13 keyWindow];
    v29 = [v14 rootViewController];

    v15 = [v29 traitCollection];
    if (+[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:v15])
    {
      v16 = +[UIAlertController alertControllerWithTitle:v28 message:0 preferredStyle:0];
    }
    else
    {
      v20 = PULocalizedString();
      v16 = +[UIAlertController alertControllerWithTitle:v20 message:v28 preferredStyle:1];
    }
    id v21 = PULocalizedString();
    objc_initWeak(&location, self);
    v22 = PULocalizedString();
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_33FC;
    v35[3] = &unk_8398;
    v35[4] = self;
    uint64_t v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v35];

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_3504;
    v32[3] = &unk_8410;
    v32[4] = self;
    v33 = v4;
    objc_copyWeak(&v34, &location);
    __int16 v24 = +[UIAlertAction actionWithTitle:v21 style:2 handler:v32];
    v25 = PLUIGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v26;
      __int16 v43 = 2048;
      v44 = self;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Present confirmation to empty recently deleted items", buf, 0x16u);
    }

    [v16 addAction:v23];
    [v16 addAction:v24];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3670;
    block[3] = &unk_8320;
    block[4] = self;
    id v31 = v16;
    id v27 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_opt_class();
      v19 = [(STStorageOptionTip *)v4 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v18;
      __int16 v43 = 2048;
      v44 = self;
      __int16 v45 = 2114;
      v46 = v19;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Unknown storage tip: %{public}@", buf, 0x20u);
    }
  }
}

- (BOOL)_isExpungeRecentlyDeletedItemsOptionTip:(id)a3
{
  v3 = [a3 identifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"ExpungeRecentlyDeletedItemsOptionTip"];

  return v4;
}

- (BOOL)_isOptimizePhotosOptionTip:(id)a3
{
  v3 = [a3 identifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"OptimizePhotosOptionTip"];

  return v4;
}

- (void)_performTipOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(PhotosStorageManagementController *)self _tipOperationQueue];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3A90;
  v7[3] = &unk_82F8;
  id v8 = v4;
  uint64_t v9 = v10;
  id v6 = v4;
  dispatch_async(v5, v7);

  _Block_object_dispose(v10, 8);
}

- (id)_tipOperationQueue
{
  opQueue = self->_opQueue;
  if (!opQueue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("tipQueue", 0);
    id v5 = self->_opQueue;
    self->_opQueue = v4;

    opQueue = self->_opQueue;
  }

  return opQueue;
}

- (id)_significantTipItemsFromAssets:(id)a3 recoverable:(BOOL)a4
{
  id v5 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_3C1C;
  v8[3] = &unk_82D0;
  BOOL v10 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

- (void)_updateStateForEnableCPLOptionTip
{
  if ([(PUStorageManagementUtility *)self->_storageManagementUtility isCPLEnabled])
  {
    if ([(PhotosStorageManagementController *)self _hasCompletedCPLEnablement])
    {
      v3 = PULocalizedString();
      int v4 = 0;
      id v5 = 0;
      float v6 = 1.0;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (self->_isEnablingCPL)
  {
LABEL_5:
    MGGetBoolAnswer();
    v3 = PULocalizedString();
    id v5 = PULocalizedString();
    int v4 = 0;
    float v6 = -1.0;
    goto LABEL_7;
  }
  v3 = PULocalizedString();
  id v5 = 0;
  float v6 = 0.0;
  int v4 = 1;
LABEL_7:
  int v7 = [(PhotosStorageManagementController *)self enableCPLOptionTip];
  [v7 setInfoText:v3];
  *(float *)&double v8 = v6;
  [v7 setActivationPercent:v8];
  [v7 setActivatingString:v5];
  if (v4)
  {
    storageManagementUtility = self->_storageManagementUtility;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3EF0;
    void v10[3] = &unk_8268;
    id v11 = v7;
    [(PUStorageManagementUtility *)storageManagementUtility purgeableSizeAndOriginalsInLibrary:v10];
  }
  else
  {
    [v7 setImmediateGain:0];
  }
}

- (id)tips
{
  v3 = +[NSMutableArray array];
  unsigned int v4 = [(PUStorageManagementUtility *)self->_storageManagementUtility isCPLEnabled];
  if (v4)
  {
    unsigned __int8 v5 = [(PhotosStorageManagementController *)self _hasCompletedCPLEnablement];
    unsigned int v6 = [(PUStorageManagementUtility *)self->_storageManagementUtility isOptimizedModeOn];
    unsigned int v7 = v6 | [(PUStorageManagementUtility *)self->_storageManagementUtility isCPLInExitMode];
    if (v5)
    {
      if (v7)
      {
LABEL_15:
        v16 = +[NSUserDefaults standardUserDefaults];
        unsigned int v17 = [v16 BOOLForKey:@"PUShowLocalStorageTips"];

        if (!v17) {
          goto LABEL_39;
        }
        goto LABEL_16;
      }
      goto LABEL_11;
    }
    char v8 = v7 ^ 1;
  }
  else
  {
    if ([(PUStorageManagementUtility *)self->_storageManagementUtility shouldHideCPL]) {
      goto LABEL_16;
    }
    char v8 = 0;
  }
  id v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v46 = objc_opt_class();
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 1024;
    unsigned int v50 = v4;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show enable iCloud Photos storage tip (already enabled: %d)", buf, 0x1Cu);
  }

  BOOL v10 = [(PhotosStorageManagementController *)self _tipForEnableCPLOption];
  [(PhotosStorageManagementController *)self _updateStateForEnableCPLOptionTip];
  [v3 addObject:v10];

  if (v8)
  {
LABEL_11:
    id v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v12;
      __int16 v47 = 2048;
      v48 = self;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show optimize iCloud Photos storage tip", buf, 0x16u);
    }

    v13 = [(PhotosStorageManagementController *)self _tipForOptimizePhotosOption];
    [v3 addObject:v13];
    storageManagementUtility = self->_storageManagementUtility;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_455C;
    v43[3] = &unk_8268;
    id v44 = v13;
    id v15 = v13;
    [(PUStorageManagementUtility *)storageManagementUtility purgeableSizeAndOriginalsInLibrary:v43];
  }
  if (v4) {
    goto LABEL_15;
  }
LABEL_16:
  id v18 = [(PUStorageManagementUtility *)self->_storageManagementUtility totalReclaimableSizeFromPurgingVideoClips];
  if (v18)
  {
    id v19 = v18;
    v20 = PLUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v21;
      __int16 v47 = 2048;
      v48 = self;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show delete large videos storage tip", buf, 0x16u);
    }

    v22 = [(PhotosStorageManagementController *)self _tipForReviewLargeVideoAction];
    [v22 setSize:v19];
    uint64_t v23 = [(PUStorageManagementUtility *)self->_storageManagementUtility significantItems];
    if ([v23 count])
    {
      __int16 v24 = [(PhotosStorageManagementController *)self _significantTipItemsFromAssets:v23 recoverable:1];
      [v22 setSignificantItems:v24];
    }
    [v3 addObject:v22];
  }
  if ([(PUStorageManagementUtility *)self->_storageManagementUtility isDeletableItemsInTrash])
  {
    v25 = [(PhotosStorageManagementController *)self _tipForExpungeRecentlyDeletedItemsOption];
    if (v25)
    {
      uint64_t v26 = PLUIGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v27;
        __int16 v47 = 2048;
        v48 = self;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show empty recently deleted storage tip", buf, 0x16u);
      }

      [v3 addObject:v25];
    }
  }
  if ((v4 & 1) == 0)
  {
    v28 = +[NSUserDefaults standardUserDefaults];
    unsigned int v29 = [v28 BOOLForKey:@"PUShowLocalStorageTips"];

    if (v29)
    {
      v30 = [(PhotosStorageManagementController *)self _tipForPhotosAction];
      [v3 addObject:v30];

      id v31 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      [v31 setIncludeDuplicatesAlbums:1];
      v32 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:1000000601 options:v31];
      if ([v32 count])
      {
        v33 = PLUIGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v34;
          __int16 v47 = 2048;
          v48 = self;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show duplicates storage tip", buf, 0x16u);
        }

        v35 = [(PhotosStorageManagementController *)self _tipForReviewDuplicatesAction];
        [v3 addObject:v35];
      }
      v36 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:211 options:v31];
      v37 = [v36 firstObject];
      v38 = +[PHAsset fetchAssetsInAssetCollection:v37 options:v31];

      if ([v38 count])
      {
        v39 = PLUIGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v40 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v40;
          __int16 v47 = 2048;
          v48 = self;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Show screenshots storage tip", buf, 0x16u);
        }

        v41 = [(PhotosStorageManagementController *)self _tipForReviewScreenshotsAction];
        [v3 addObject:v41];
      }
    }
  }
LABEL_39:

  return v3;
}

- (BOOL)_hasCompletedCPLEnablement
{
  cplStatus = self->_cplStatus;
  if (cplStatus) {
    goto LABEL_8;
  }
  unsigned int v4 = [(PHPhotoLibrary *)self->_photoLibrary cplStatus];
  unsigned __int8 v5 = self->_cplStatus;
  self->_cplStatus = v4;

  [(CPLStatus *)self->_cplStatus setDelegate:self];
  unsigned int v6 = self->_cplStatus;
  unsigned int v7 = PLUIGetLog();
  char v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      BOOL v10 = self->_cplStatus;
      int v19 = 138543874;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      v22 = self;
      __int16 v23 = 2112;
      __int16 v24 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> [CPLStatus] Created: %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    photoLibrary = self->_photoLibrary;
    v13 = [(PHPhotoLibrary *)photoLibrary photoLibraryURL];
    int v19 = 138544130;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 2112;
    __int16 v24 = photoLibrary;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "<%{public}@:%p> [CPLStatus] Failed to acquire for library: %@, URL: \"%@\"", (uint8_t *)&v19, 0x2Au);
  }
  cplStatus = self->_cplStatus;
  if (cplStatus)
  {
LABEL_8:
    BOOL v14 = [(CPLStatus *)cplStatus initialSyncDate];
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  v16 = PLUIGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_opt_class();
    int v19 = 138543874;
    uint64_t v20 = v17;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    LODWORD(v24) = v15;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> [CPLStatus] hasCompletedCPLEnablement: %d", (uint8_t *)&v19, 0x1Cu);
  }

  return v15;
}

- (id)_tipForPhotosAction
{
  id v2 = objc_alloc_init((Class)STStorageActionTip);
  v3 = PULocalizedString();
  [v2 setTitle:v3];

  unsigned int v4 = PULocalizedString();
  [v2 setInfoText:v4];

  [v2 setRepresentedApp:@"com.apple.mobileslideshow"];
  [v2 setIdentifier:@"PhotosActionTip"];
  [v2 setDetailControllerClass:objc_opt_class()];

  return v2;
}

- (id)_tipForReviewScreenshotsAction
{
  id v2 = objc_alloc_init((Class)STStorageActionTip);
  v3 = PULocalizedString();
  [v2 setTitle:v3];

  unsigned int v4 = PULocalizedString();
  [v2 setInfoText:v4];

  [v2 setRepresentedApp:@"com.apple.mobileslideshow"];
  [v2 setIdentifier:@"ReviewScreenshotsActionTip"];
  [v2 setDetailControllerClass:objc_opt_class()];

  return v2;
}

- (id)_tipForReviewDuplicatesAction
{
  id v2 = objc_alloc_init((Class)STStorageActionTip);
  v3 = PULocalizedString();
  [v2 setTitle:v3];

  unsigned int v4 = PULocalizedString();
  [v2 setInfoText:v4];

  [v2 setRepresentedApp:@"com.apple.mobileslideshow"];
  [v2 setIdentifier:@"ReviewDuplicatesActionTip"];
  [v2 setDetailControllerClass:objc_opt_class()];

  return v2;
}

- (id)_tipForReviewLargeVideoAction
{
  id v2 = objc_alloc_init((Class)STStorageActionTip);
  v3 = PULocalizedString();
  [v2 setTitle:v3];

  unsigned int v4 = PULocalizedString();
  [v2 setInfoText:v4];

  [v2 setRepresentedApp:@"com.apple.mobileslideshow"];
  [v2 setIdentifier:@"ReviewLargeVideoActionTip"];
  [v2 setDetailControllerClass:objc_opt_class()];

  return v2;
}

- (id)_tipForExpungeRecentlyDeletedItemsOption
{
  v3 = [(PUStorageManagementUtility *)self->_storageManagementUtility sizeForRecentlyDeletedItems];
  id v4 = [v3 unsignedLongLongValue];
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)STStorageOptionTip);
    unsigned int v7 = PULocalizedString();
    [v6 setInfoText:v7];

    char v8 = PULocalizedString();
    [v6 setTitle:v8];

    uint64_t v9 = PULocalizedString();
    [v6 setEnableButtonTitle:v9];

    [v6 setDelegate:self];
    [v6 setRepresentedApp:@"com.apple.mobileslideshow"];
    [v6 setImmediateGain:v5];
    [v6 setIdentifier:@"ExpungeRecentlyDeletedItemsOptionTip"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_tipForEnableCPLOption
{
  enableCPLOptionTip = self->_enableCPLOptionTip;
  if (!enableCPLOptionTip)
  {
    id v4 = objc_alloc_init((Class)STStorageOptionTip);
    id v5 = PULocalizedString();
    [v4 setTitle:v5];

    id v6 = PULocalizedString();
    [v4 setConfirmationText:v6];

    unsigned int v7 = PULocalizedString();
    [v4 setConfirmationButtonTitle:v7];

    [v4 setDelegate:self];
    [v4 setRepresentedApp:@"com.apple.mobileslideshow"];
    [v4 setIdentifier:@"EnableCPLOptionOptionTip"];
    char v8 = self->_enableCPLOptionTip;
    self->_enableCPLOptionTip = (STStorageOptionTip *)v4;
    id v9 = v4;

    BOOL v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_refreshSizeGainForICPLEnableTip" name:PUStorageManagementICPLEnableTipSizeRefreshRequired object:0];

    enableCPLOptionTip = self->_enableCPLOptionTip;
  }

  return enableCPLOptionTip;
}

- (id)_tipForOptimizePhotosOption
{
  id v3 = objc_alloc_init((Class)STStorageOptionTip);
  id v4 = PULocalizedString();
  [v3 setTitle:v4];

  id v5 = +[UIDevice currentDevice];
  id v6 = [v5 model];

  if (([v6 isEqualToString:@"iPhone"] & 1) == 0) {
    [v6 isEqualToString:@"iPad"];
  }
  unsigned int v7 = PULocalizedString();
  [v3 setInfoText:v7];
  [v3 setDelegate:self];
  [v3 setRepresentedApp:@"com.apple.mobileslideshow"];
  [v3 setIdentifier:@"OptimizePhotosOptionTip"];

  return v3;
}

- (id)identifier
{
  if (qword_CB68 != -1) {
    dispatch_once(&qword_CB68, &stru_82A8);
  }
  id v2 = (void *)qword_CB60;

  return v2;
}

- (void)_refreshSizeGainForICPLEnableTip
{
  enableCPLOptionTip = self->_enableCPLOptionTip;
  if (enableCPLOptionTip)
  {
    id v4 = enableCPLOptionTip;
    storageManagementUtility = self->_storageManagementUtility;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4FB8;
    v7[3] = &unk_8268;
    char v8 = v4;
    id v6 = v4;
    [(PUStorageManagementUtility *)storageManagementUtility purgeableSizeAndOriginalsInLibrary:v7];
  }
}

- (PhotosStorageManagementController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PhotosStorageManagementController;
  id v2 = [(PhotosStorageManagementController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[PHPhotoLibrary px_systemPhotoLibrary];
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;

    id v5 = (PUStorageManagementUtility *)[objc_alloc((Class)PUStorageManagementUtility) initWithPhotoLibrary:v2->_photoLibrary];
    storageManagementUtility = v2->_storageManagementUtility;
    v2->_storageManagementUtility = v5;
  }
  return v2;
}

@end