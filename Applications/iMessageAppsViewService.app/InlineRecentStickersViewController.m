@interface InlineRecentStickersViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)isExpanded;
- (id)_remoteProxy;
- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7;
- (void)applyEffect:(int64_t)a3 toSticker:(id)a4 completion:(id)a5;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6;
- (void)requestStageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 ckAttributionInfo:(id)a10;
- (void)setHostBundleID:(id)a3;
- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4;
- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5;
- (void)stickerCollectionViewController:(id)a3 isDonePresentingViewController:(id)a4;
- (void)stickerCollectionViewController:(id)a3 isPresentingViewController:(id)a4;
- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5;
- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4;
- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3;
- (void)stickerDragCanceled;
- (void)stickerDruidDragEndedWithIMSticker:(id)a3;
- (void)stickerDruidDragEndedWithMSSticker:(id)a3;
- (void)stickerDruidDragStarted;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation InlineRecentStickersViewController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)InlineRecentStickersViewController;
  [(InlineRecentStickersViewController *)&v12 viewDidLoad];
  v3 = [(InlineRecentStickersViewController *)self view];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  if (IMIsStickersStripInCling())
  {
    v5 = +[_MSStickerSendManager sharedInstance];
    [v5 setDelegate:self];

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v6 = (void *)qword_100016720;
    uint64_t v17 = qword_100016720;
    if (!qword_100016720)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005FC4;
      v13[3] = &unk_100010560;
      v13[4] = &v14;
      sub_100005FC4((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v8 = objc_alloc_init(v7);
    [v8 setDelegate:self];
    [(InlineRecentStickersViewController *)self addChildViewController:v8];
    v9 = [v8 view];
    v10 = [(InlineRecentStickersViewController *)self view];
    [v10 bounds];
    [v9 setFrame:];

    [v9 setAutoresizingMask:18];
    v11 = [(InlineRecentStickersViewController *)self view];
    [v11 addSubview:v9];

    [v8 didMoveToParentViewController:self];
  }
}

- (void)setHostBundleID:(id)a3
{
  v4 = (__CFString *)a3;
  [(InlineRecentStickersViewController *)self _hostAuditToken];
  v5 = SecTaskCreateWithAuditToken(0, &v12);
  if (v5)
  {
    v6 = v5;
    v7 = (__CFString *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", 0);
    CFRelease(v6);
  }
  else
  {
    v7 = &stru_1000108B0;
  }
  unsigned int v8 = [(__CFString *)v7 isEqualToString:@"com.apple.InputUI"];
  v9 = +[_MSStickerSendManager sharedInstance];
  v10 = v9;
  if (v8) {
    v11 = v4;
  }
  else {
    v11 = v7;
  }
  [v9 setHostBundleID:v11];
}

- (id)_remoteProxy
{
  return [(InlineRecentStickersViewController *)self _remoteViewControllerProxyWithErrorHandler:&stru_1000103B8];
}

- (void)applyEffect:(int64_t)a3 toSticker:(id)a4 completion:(id)a5
{
  id v7 = a4;
  unsigned int v8 = (void (**)(id, id))a5;
  if (a3 < 1
    || ([v7 representations],
        v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 indexOfObjectPassingTest:&stru_1000103F8],
        v9,
        v10 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v8[2](v8, v7);
  }
  else
  {
    v11 = +[VKCStickerEffect effectWithType:a3];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_100004BB0;
    v24 = sub_100004BC0;
    id v25 = 0;
    audit_token_t v12 = [v7 representations];
    id v25 = [v12 objectAtIndexedSubscript:v10];

    id v13 = objc_alloc((Class)UIImage);
    uint64_t v14 = [(id)v21[5] data];
    id v15 = [v13 initWithData:v14];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004BC8;
    v16[3] = &unk_100010420;
    v19 = &v20;
    v18 = v8;
    id v17 = v7;
    [v11 applyToImage:v15 completion:v16];

    _Block_object_dispose(&v20, 8);
  }
}

- (void)requestStageStickerWithIdentifier:(id)a3 representations:(id)a4 name:(id)a5 effectType:(int64_t)a6 externalURI:(id)a7 accessibilityLabel:(id)a8 metadata:(id)a9 ckAttributionInfo:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = sub_10000A660();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Staging sticker with identifier %@", (uint8_t *)&buf, 0xCu);
  }

  v23 = objc_opt_new();
  [v23 setIdentifier:v15];
  [v23 setRepresentations:v16];
  [v23 setName:v17];
  [v23 setEffectType:a6];
  [v23 setExternalURI:v18];
  [v23 setAccessibilityLabel:v19];
  [v23 setMetadata:v20];
  [v23 setAttributionInfo:v21];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100004FFC;
  v45[3] = &unk_100010448;
  v45[4] = self;
  [(InlineRecentStickersViewController *)self applyEffect:a6 toSticker:v23 completion:v45];
  v24 = [(InlineRecentStickersViewController *)self _remoteProxy];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000505C;
  v36[3] = &unk_100010470;
  id v25 = v15;
  id v37 = v25;
  id v26 = v16;
  id v38 = v26;
  int64_t v44 = a6;
  id v27 = v18;
  id v39 = v27;
  id v28 = v17;
  id v40 = v28;
  id v29 = v19;
  id v41 = v29;
  id v30 = v20;
  id v42 = v30;
  id v31 = v21;
  id v43 = v31;
  [v24 remoteHandlesRecentsStickerDonationWithCompletionHandler:v36];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2050000000;
  v32 = (void *)qword_100016740;
  uint64_t v49 = qword_100016740;
  if (!qword_100016740)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v51 = sub_100006334;
    v52 = &unk_100010560;
    v53 = &v46;
    sub_100006334((uint64_t)&buf);
    v32 = (void *)v47[3];
  }
  id v33 = v32;
  _Block_object_dispose(&v46, 8);
  if (objc_opt_respondsToSelector())
  {
    v34 = [(InlineRecentStickersViewController *)self _hostApplicationBundleIdentifier];
    [v33 trackStickerSentFromHostBundleIdentifier:v34];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)InlineRecentStickersViewController;
  [(InlineRecentStickersViewController *)&v5 viewDidDisappear:a3];
  v4 = [(InlineRecentStickersViewController *)self _remoteProxy];
  [v4 dismissCard];
}

+ (id)_remoteViewControllerInterface
{
  if (qword_1000166F8 != -1) {
    dispatch_once(&qword_1000166F8, &stru_1000104B0);
  }
  v2 = (void *)qword_1000166F0;

  return v2;
}

+ (id)_exportedInterface
{
  if (qword_100016708 != -1) {
    dispatch_once(&qword_100016708, &stru_1000104D0);
  }
  v2 = (void *)qword_100016700;

  return v2;
}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4
{
  v4 = sub_10000A660();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000A7C8();
  }
}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5
{
  objc_super v5 = sub_10000A660();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000A7C8();
  }
}

- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4
{
  v4 = sub_10000A660();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000A7FC();
  }
}

- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3
{
  id v3 = [(InlineRecentStickersViewController *)self _remoteViewControllerProxy];
  [v3 presentCard];
}

- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v39 = (void (**)(id, id, void))a5;
  id v7 = [v6 representations];
  unsigned int v8 = [v7 sortedArrayUsingComparator:&stru_100010510];

  id v40 = v6;
  v9 = [v6 representations];
  id v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v17 = objc_opt_new();
        id v18 = [v16 data];
        [v17 setData:v18];

        id v19 = [v16 uti];
        id v20 = [v19 identifier];
        [v17 setType:v20];

        [v16 size];
        [v17 setSize:];
        id v21 = [v16 role];
        [v17 setRole:v21];

        [v10 addObject:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v13);
  }

  uint64_t v22 = +[NSMutableDictionary dictionaryWithCapacity:3];
  if (objc_opt_respondsToSelector())
  {
    v23 = [v40 attributionInfo];

    if (v23)
    {
      v24 = [v40 attributionInfo];
      id v25 = [v24 adamID];
      [v22 setObject:v25 forKeyedSubscript:IMFileTransferAttributionInfoAdamIDKey];

      id v26 = [v40 attributionInfo];
      id v27 = [v26 bundleIdentifier];
      [v22 setObject:v27 forKeyedSubscript:IMFileTransferAttributionInfoBundleIDKey];

      id v28 = [v40 attributionInfo];
      id v29 = [v28 name];
      [v22 setObject:v29 forKeyedSubscript:IMFileTransferAttributionInfoAppNameKey];
    }
  }
  id v30 = v22;
  if (objc_opt_respondsToSelector())
  {
    id v38 = [v40 accessibilityName];
  }
  else
  {
    id v38 = 0;
  }
  id v31 = objc_alloc((Class)MSSticker);
  v32 = [v40 identifier];
  id v33 = [v40 name];
  id v34 = [v40 effect];
  v35 = [v40 externalURI];
  v36 = [v40 metadata];
  id v37 = [v31 initWithStickerIdentifier:v32 representations:v10 stickerName:v33 effectType:v34 externalURI:v35 localizedDescription:v38 metadata:v36 attributionInfo:v30];

  v39[2](v39, v37, 0);
}

- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [objc_alloc((Class)MSSticker) initWithContentsOfURL:v12 externalURI:v11 localizedDescription:v10 error:a7];

  return v13;
}

- (BOOL)isExpanded
{
  return 0;
}

- (void)stickerCollectionViewController:(id)a3 isPresentingViewController:(id)a4
{
  v4 = sub_10000A660();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000A830();
  }
}

- (void)stickerCollectionViewController:(id)a3 isDonePresentingViewController:(id)a4
{
  v4 = sub_10000A660();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000A830();
  }
}

- (void)insertSticker:(id)a3 forceStage:(BOOL)a4 frameInRemoteView:(CGRect)a5 completionHandler:(id)a6
{
  id v20 = a3;
  id v7 = [v20 stickerIdentifier];
  id v8 = [v7 UUIDString];

  if (!v8)
  {
    v9 = [v20 imageFileURL];
    id v10 = [v9 lastPathComponent];
    id v11 = v10;
    if (v10)
    {
      id v8 = v10;
    }
    else
    {
      id v12 = +[NSUUID UUID];
      id v8 = [v12 UUIDString];
    }
  }
  id v13 = [v20 stickerEffectType];
  uint64_t v14 = [v20 representations];
  id v15 = [v20 stickerName];
  id v16 = [v20 externalURI];
  id v17 = [v20 localizedDescription];
  id v18 = [v20 metadata];
  id v19 = [v20 attributionInfo];
  [(InlineRecentStickersViewController *)self requestStageStickerWithIdentifier:v8 representations:v14 name:v15 effectType:v13 externalURI:v16 accessibilityLabel:v17 metadata:v18 ckAttributionInfo:v19];
}

- (void)stickerDragCanceled
{
  v2 = (void *)qword_100016710;
  qword_100016710 = 0;

  id v3 = (void *)qword_100016718;
  qword_100016718 = 0;
}

- (void)stickerDruidDragStarted
{
  objc_storeStrong((id *)&qword_100016710, self);
  qword_100016718 = +[NSUUID UUID];

  _objc_release_x1();
}

- (void)stickerDruidDragEndedWithIMSticker:(id)a3
{
  id v4 = a3;
  id v5 = (id)qword_100016718;
  id v6 = [(InlineRecentStickersViewController *)self _remoteProxy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005DB4;
  v9[3] = &unk_100010538;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 remoteHandlesRecentsStickerDonationWithCompletionHandler:v9];
}

- (void)stickerDruidDragEndedWithMSSticker:(id)a3
{
  id v3 = a3;
  id v4 = sub_100005124();
  id v5 = [v3 stickerPackGUID];
  id v6 = [v3 representations];
  id v7 = [v3 stickerEffectType];
  id v8 = [v3 externalURI];
  v9 = [v3 stickerName];
  id v10 = [v3 localizedDescription];
  id v11 = [v3 metadata];
  id v12 = [v3 attributionInfo];

  [v4 donateStickerToRecentsWithIdentifier:v5 representations:v6 stickerEffectType:v7 externalURI:v8 name:v9 accessibilityLabel:v10 metadata:v11 ckAttributionInfo:v12];
  id v13 = (void *)qword_100016710;
  qword_100016710 = 0;

  uint64_t v14 = (void *)qword_100016718;
  qword_100016718 = 0;
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v5 = sub_10000A660();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000A864();
  }
}

@end