@interface VOTImageExplorerViewServiceAdaptorViewController
+ (BOOL)_isSecureForRemoteViewService;
- (AXMVisionResult)visionResult;
- (AXMVoiceOverVisionEngine)visionEngine;
- (AXSBImageExplorerData)elementInfo;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAssetLocallyAvailable;
- (NSMutableArray)detailData;
- (NSString)hostAppName;
- (OS_dispatch_queue)axVisionQueue;
- (VOTImageExplorerViewController)imageExplorerViewController;
- (id)_assetLocalIdentifier;
- (id)_explorerImage;
- (id)_imageURL;
- (id)_photoAssetDataWithNetWorkAccess:(BOOL)a3;
- (id)_photoLibraryURL;
- (id)_screenGrabImage;
- (id)_visionFeatureDescriptionOptions;
- (void)_dismiss;
- (void)_populateCaptionAndMetadata;
- (void)_reloadImageViewIfNeeded;
- (void)_setupRemoteProxy;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setDetailData:(id)a3;
- (void)setElementInfo:(id)a3;
- (void)setHostAppName:(id)a3;
- (void)setImageExplorerViewController:(id)a3;
- (void)setVisionEngine:(id)a3;
- (void)setVisionResult:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation VOTImageExplorerViewServiceAdaptorViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  [(VOTImageExplorerViewServiceAdaptorViewController *)&v10 viewDidLoad];
  v3 = objc_alloc_init(VOTImageExplorerViewController);
  [(VOTImageExplorerViewServiceAdaptorViewController *)self setImageExplorerViewController:v3];

  v4 = [(VOTImageExplorerViewServiceAdaptorViewController *)self imageExplorerViewController];
  [v4 setDelegate:self];

  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v6 = (OS_dispatch_queue *)dispatch_queue_create("VOTImageExplorer-Vision", v5);
  axVisionQueue = self->_axVisionQueue;
  self->_axVisionQueue = v6;

  v8 = +[NSMutableArray array];
  detailData = self->_detailData;
  self->_detailData = v8;
}

- (AXMVoiceOverVisionEngine)visionEngine
{
  visionEngine = self->_visionEngine;
  if (!visionEngine)
  {
    v4 = (AXMVoiceOverVisionEngine *)objc_alloc_init((Class)AXMVoiceOverVisionEngine);
    v5 = self->_visionEngine;
    self->_visionEngine = v4;

    visionEngine = self->_visionEngine;
  }

  return visionEngine;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  [(VOTImageExplorerViewServiceAdaptorViewController *)&v16 viewDidAppear:a3];
  [(VOTImageExplorerViewServiceAdaptorViewController *)self _setupRemoteProxy];
  id v4 = objc_alloc((Class)UINavigationController);
  v5 = [(VOTImageExplorerViewServiceAdaptorViewController *)self imageExplorerViewController];
  id v6 = [v4 initWithRootViewController:v5];

  [v6 setModalPresentationStyle:1];
  v7 = [v6 navigationBar];
  [v7 setTranslucent:0];

  [v6 setModalTransitionStyle:2];
  v8 = [(VOTImageExplorerViewServiceAdaptorViewController *)self imageExplorerViewController];
  v9 = [v6 presentationController];
  [v9 setDelegate:v8];

  objc_super v10 = [v6 navigationBar];
  [v10 _setAccessibilityServesAsFirstElement:1];

  v11 = +[UIColor systemBackgroundColor];
  v12 = [v6 view];
  [v12 setBackgroundColor:v11];

  [(VOTImageExplorerViewServiceAdaptorViewController *)self _explorerImage];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000643C;
  v14[3] = &unk_1000247D0;
  v14[4] = self;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v15;
  [(VOTImageExplorerViewServiceAdaptorViewController *)self presentViewController:v6 animated:1 completion:v14];
  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VOTImageExplorerViewServiceAdaptorViewController;
  [(VOTImageExplorerViewServiceAdaptorViewController *)&v4 viewDidDisappear:a3];
  [(VOTImageExplorerViewServiceAdaptorViewController *)self _dismiss];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  v7 = VOTLogImageExplorer();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000136F8();
  }

  if (v6) {
    v6[2](v6);
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = VOTLogImageExplorer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000139E0();
  }

  v9 = [v6 userInfo];
  objc_super v10 = [v9 objectForKeyedSubscript:AXVoiceOverImageExplorerVisionResultData];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = AXMSecureCodingClasses();
  id v28 = 0;
  id v13 = +[NSKeyedUnarchiver axmSecurelyUnarchiveData:v10 withExpectedClass:v11 otherAllowedClasses:v12 error:&v28];
  id v14 = v28;
  [(VOTImageExplorerViewServiceAdaptorViewController *)self setVisionResult:v13];

  id v15 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if ((v12 & 1) == 0 || v14)
  {
    v18 = VOTLogImageExplorer();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10001393C();
    }
  }
  else
  {
    objc_super v16 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];

    if (v16)
    {
      v17 = [v6 userInfo];
      v18 = [v17 objectForKeyedSubscript:AXVoiceOverImageExplorerElementInfoData];

      id v27 = 0;
      v19 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v18 error:&v27];
      id v20 = v27;
      [(VOTImageExplorerViewServiceAdaptorViewController *)self setElementInfo:v19];

      v21 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0 || v20)
      {
        v26 = VOTLogImageExplorer();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          sub_100013898();
        }
      }
      else
      {
        v23 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];

        if (v23)
        {
          v24 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
          v25 = [v24 hostAppName];
          [(VOTImageExplorerViewServiceAdaptorViewController *)self setHostAppName:v25];

          [(VOTImageExplorerViewServiceAdaptorViewController *)self _populateCaptionAndMetadata];
          if (v7) {
            v7[2](v7);
          }
          goto LABEL_20;
        }
        v26 = VOTLogImageExplorer();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          sub_100013810();
        }
      }

LABEL_20:
      goto LABEL_21;
    }
    v18 = VOTLogImageExplorer();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_100013788();
    }
  }
LABEL_21:
}

- (void)_setupRemoteProxy
{
  id v2 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _remoteViewControllerProxy];
  [v2 setDismissalAnimationStyle:2];
  [v2 setOrientationChangedEventsEnabled:0];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setWallpaperTunnelActive:0];
  [v2 setWallpaperStyle:4 withDuration:0.3];
}

- (void)_dismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100006A1C;
  v2[3] = &unk_100024748;
  v2[4] = self;
  [(VOTImageExplorerViewServiceAdaptorViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

- (BOOL)_isAssetLocallyAvailable
{
  id v2 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  v3 = [v2 assetMetadataFeature];
  objc_super v4 = [v3 assetMetadata];
  unsigned __int8 v5 = [v4 assetLocallyAvailable];

  return v5;
}

- (id)_assetLocalIdentifier
{
  id v2 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  v3 = [v2 assetMetadataFeature];
  objc_super v4 = [v3 assetMetadata];
  unsigned __int8 v5 = [v4 localIdentifier];

  return v5;
}

- (id)_screenGrabImage
{
  id v3 = objc_alloc((Class)UIImage);
  objc_super v4 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  unsigned __int8 v5 = [v4 image];
  id v6 = [v3 initWithCIImage:v5];

  return v6;
}

- (id)_imageURL
{
  id v2 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  id v3 = [v2 assetMetadataFeature];
  objc_super v4 = [v3 assetMetadata];
  unsigned __int8 v5 = [v4 url];

  return v5;
}

- (id)_photoLibraryURL
{
  id v2 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  id v3 = [v2 assetMetadataFeature];
  objc_super v4 = [v3 assetMetadata];
  unsigned __int8 v5 = [v4 photoLibraryURL];

  return v5;
}

- (id)_photoAssetDataWithNetWorkAccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)AXMPhotoAssetData);
  id v6 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _assetLocalIdentifier];
  v7 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _photoLibraryURL];
  id v8 = [v5 initWithImageAssetLocalIdentifier:v6 photoLibraryURL:v7 allowsNetworkAccess:v3 needsImageData:1];

  return v8;
}

- (id)_explorerImage
{
  unsigned int v3 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _isAssetLocallyAvailable];
  objc_super v4 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _assetLocalIdentifier];
  id v5 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _imageURL];
  id v6 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _screenGrabImage];
  id v7 = 0;
  if (v4 && v3)
  {
    id v8 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _photoAssetDataWithNetWorkAccess:0];
    v9 = VOTLogImageExplorer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100013BA4();
    }

    id v10 = objc_alloc((Class)UIImage);
    uint64_t v11 = [v8 imageData];
    id v7 = [v10 initWithData:v11];
  }
  if (!v7 && v6)
  {
    uint64_t v12 = VOTLogImageExplorer();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100013A8C();
    }

    id v7 = v6;
    goto LABEL_21;
  }
  if (v7 || !v5) {
    goto LABEL_17;
  }
  if (+[AXUIViewServiceUtilities axTCCAllowsPhotoLibraryAccess])
  {
    id v13 = VOTLogImageExplorer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      int v20 = 138412802;
      v21 = v19;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ - Using url : %@ localIdentifier : %@", (uint8_t *)&v20, 0x20u);
    }
    id v14 = objc_alloc((Class)UIImage);
    id v15 = [v5 path];
    id v7 = [v14 initWithContentsOfFile:v15];

LABEL_17:
    if (v7) {
      goto LABEL_21;
    }
  }
  objc_super v16 = VOTLogImageExplorer();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    sub_100013B1C();
  }

  id v7 = 0;
LABEL_21:

  return v7;
}

- (void)_reloadImageViewIfNeeded
{
  unsigned int v3 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _assetLocalIdentifier];
  if (![(VOTImageExplorerViewServiceAdaptorViewController *)self _isAssetLocallyAvailable]
    && v3)
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = sub_100007240;
    v18[4] = sub_100007250;
    id v19 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_100007240;
    v16[4] = sub_100007250;
    id v17 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    id v5 = [(VOTImageExplorerViewServiceAdaptorViewController *)self axVisionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007258;
    block[3] = &unk_1000248F8;
    objc_copyWeak(&v14, &location);
    id v9 = v3;
    id v10 = self;
    uint64_t v12 = v18;
    id v13 = v16;
    dispatch_semaphore_t v11 = v4;
    id v6 = v4;
    dispatch_async(v5, block);

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007664;
    v7[3] = &unk_100024920;
    v7[4] = self;
    v7[5] = v16;
    v7[6] = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(v18, 8);
  }
}

- (void)_populateCaptionAndMetadata
{
  unsigned int v3 = +[NSMutableArray array];
  dispatch_semaphore_t v4 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
  id v5 = [v4 axLabel];
  id v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _screenGrabImage];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _assetLocalIdentifier];

      if (!v9)
      {
        id v10 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
        dispatch_semaphore_t v11 = [v10 axLabel];
        [v3 axSafelyAddObject:v11];
      }
    }
  }
  uint64_t v12 = sub_10000CFD0(@"VoiceOverImageExplorer.caption.title");
  id v13 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
  id v14 = [v13 customContent];
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_100007D18;
  v68[3] = &unk_100024948;
  id v62 = v12;
  id v69 = v62;
  id v15 = [v14 ax_filteredArrayUsingBlock:v68];

  if ([v15 count])
  {
    objc_super v16 = [v15 firstObject];
    id v17 = [v16 value];
    [v3 axSafelyAddObject:v17];
  }
  if ([v3 count])
  {
    v18 = [[VOTImageExplorerDetailData alloc] initWithKey:v62 values:v3];
    id v19 = [(VOTImageExplorerViewServiceAdaptorViewController *)self detailData];
    [v19 axSafelyAddObject:v18];
  }
  int v20 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  v21 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _visionFeatureDescriptionOptions];
  __int16 v22 = [v20 detectedCaptionFeatureDescriptionWithOptions:v21];

  if ([v22 length])
  {
    uint64_t v23 = [v22 axCapitalizeFirstLetter];

    __int16 v24 = [VOTImageExplorerDetailData alloc];
    v25 = sub_10000CFD0(@"VoiceOverImageExplorer.imgDesc");
    uint64_t v73 = v23;
    v26 = +[NSArray arrayWithObjects:&v73 count:1];
    id v27 = [(VOTImageExplorerDetailData *)v24 initWithKey:v25 values:v26];

    id v28 = [(VOTImageExplorerViewServiceAdaptorViewController *)self detailData];
    [v28 axSafelyAddObject:v27];

    __int16 v22 = (void *)v23;
  }
  v58 = v22;
  v59 = v15;
  v60 = v3;
  v29 = [(VOTImageExplorerViewServiceAdaptorViewController *)self visionResult];
  v30 = [(VOTImageExplorerViewServiceAdaptorViewController *)self _visionFeatureDescriptionOptions];
  v31 = [v29 detectedSceneClassificationFeatureDescriptionWithOptions:v30];

  if ([v31 length])
  {
    v32 = [VOTImageExplorerDetailData alloc];
    v33 = sub_10000CFD0(@"VoiceOverImageExplorer.scenes");
    v72 = v31;
    v34 = +[NSArray arrayWithObjects:&v72 count:1];
    v35 = [(VOTImageExplorerDetailData *)v32 initWithKey:v33 values:v34];

    v36 = [(VOTImageExplorerViewServiceAdaptorViewController *)self detailData];
    [v36 axSafelyAddObject:v35];
  }
  v57 = v31;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v61 = self;
  v37 = [(VOTImageExplorerViewServiceAdaptorViewController *)self elementInfo];
  v38 = [v37 customContent];

  id obj = v38;
  id v39 = [v38 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v65;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v65 != v41) {
          objc_enumerationMutation(obj);
        }
        v43 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v44 = [v43 label];
        if (v44)
        {
          v45 = (VOTImageExplorerDetailData *)v44;
          uint64_t v46 = [v43 value];
          if (v46)
          {
            v47 = (void *)v46;
            v48 = [v43 label];
            v49 = sub_10000CFD0(@"VoiceOverImageExplorer.faces.title");
            if ([v48 isEqualToString:v49])
            {
            }
            else
            {
              v50 = [v43 label];
              unsigned __int8 v51 = [v50 isEqualToString:v62];

              if (v51) {
                continue;
              }
              v52 = [VOTImageExplorerDetailData alloc];
              v53 = [v43 label];
              v54 = [v43 value];
              v70 = v54;
              v55 = +[NSArray arrayWithObjects:&v70 count:1];
              v45 = [(VOTImageExplorerDetailData *)v52 initWithKey:v53 values:v55];

              v47 = [(VOTImageExplorerViewServiceAdaptorViewController *)v61 detailData];
              [v47 axSafelyAddObject:v45];
            }
          }
        }
      }
      id v40 = [obj countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v40);
  }

  v56 = VOTLogImageExplorer();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
    sub_100013ED0(v61, v56);
  }
}

- (id)_visionFeatureDescriptionOptions
{
  id v2 = +[AXSettings sharedInstance];
  id v3 = [v2 voiceOverDiscoveredSensitiveContentFeedback];

  v8[0] = AXMFeatureDescriptionOptionLocale;
  dispatch_semaphore_t v4 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
  v9[0] = v4;
  v8[1] = AXMFeatureDescriptionOptionModifyForSensitiveContent;
  id v5 = +[NSNumber numberWithInt:v3 == 0];
  v9[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (VOTImageExplorerViewController)imageExplorerViewController
{
  return self->_imageExplorerViewController;
}

- (void)setImageExplorerViewController:(id)a3
{
}

- (AXMVisionResult)visionResult
{
  return self->_visionResult;
}

- (void)setVisionResult:(id)a3
{
}

- (AXSBImageExplorerData)elementInfo
{
  return self->_elementInfo;
}

- (void)setElementInfo:(id)a3
{
}

- (NSString)hostAppName
{
  return self->_hostAppName;
}

- (void)setHostAppName:(id)a3
{
}

- (OS_dispatch_queue)axVisionQueue
{
  return self->_axVisionQueue;
}

- (void)setVisionEngine:(id)a3
{
}

- (NSMutableArray)detailData
{
  return self->_detailData;
}

- (void)setDetailData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailData, 0);
  objc_storeStrong((id *)&self->_visionEngine, 0);
  objc_storeStrong((id *)&self->_axVisionQueue, 0);
  objc_storeStrong((id *)&self->_hostAppName, 0);
  objc_storeStrong((id *)&self->_elementInfo, 0);
  objc_storeStrong((id *)&self->_visionResult, 0);

  objc_storeStrong((id *)&self->_imageExplorerViewController, 0);
}

@end