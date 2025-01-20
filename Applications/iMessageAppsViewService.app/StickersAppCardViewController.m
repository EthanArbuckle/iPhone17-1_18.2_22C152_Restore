@interface StickersAppCardViewController
+ (BOOL)nextPresentationIsFullscreenModal;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (IMAAppPresenter)appPresenter;
- (id)stickersHostViewController;
- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)addSticker:(id)a3;
- (void)addSticker:(id)a3 atDropTarget:(id)a4;
- (void)addStickerAnimationDidFinishWithCompletion:(id)a3;
- (void)addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4;
- (void)addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4;
- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)animateCardHiddenWithCompletion:(id)a3;
- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4;
- (void)appPresenterCardDidDismiss:(id)a3;
- (void)appPresenterDidDismissFullscreenModal:(id)a3;
- (void)didRemoveStickerPreview;
- (void)didSelectAppWithBundleIdentifier:(id)a3;
- (void)dismiss;
- (void)overrideDropPointWithCompletion:(id)a3;
- (void)presentPopoverAtWindowLocation:(CGRect)a3 completion:(id)a4;
- (void)requestStageSticker:(id)a3;
- (void)setAppPresenter:(id)a3;
- (void)updateCompactCardHeight:(double)a3;
- (void)updatePopoverWindowLocation:(CGRect)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation StickersAppCardViewController

+ (BOOL)nextPresentationIsFullscreenModal
{
  return byte_100016750;
}

+ (void)setNextPresentationIsFullscreenModal:(BOOL)a3
{
  byte_100016750 = a3;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)StickersAppCardViewController;
  [(StickersAppCardViewController *)&v7 viewDidLoad];
  v3 = IMStickersExtensionIdentifier();
  v4 = IMBalloonExtensionIDWithSuffix();
  +[IMAAppPresenter loadAppWithIdentifierIfNeeded:v4];

  v5 = (IMAAppPresenter *)objc_alloc_init((Class)IMAAppPresenter);
  appPresenter = self->_appPresenter;
  self->_appPresenter = v5;

  [(IMAAppPresenter *)self->_appPresenter setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)StickersAppCardViewController;
  [(StickersAppCardViewController *)&v14 viewDidAppear:a3];
  v4 = IMStickersExtensionIdentifier();
  v5 = IMBalloonExtensionIDWithSuffix();

  if (byte_100016750)
  {
    [(IMAAppPresenter *)self->_appPresenter presentFullScreenModalAppWithBundleIdentifier:v5 completion:0];
    self->_isPresentingStandaloneFullscreenModal = 1;
    byte_100016750 = 0;
  }
  else
  {
    v6 = [(StickersAppCardViewController *)self _remoteViewControllerProxy];
    objc_super v7 = [(StickersAppCardViewController *)self traitCollection];
    id v8 = [v7 horizontalSizeClass];

    v9 = +[UIDevice currentDevice];
    id v10 = [v9 userInterfaceIdiom];

    if (v10 != (id)1 || v8 == (id)1)
    {
      appPresenter = self->_appPresenter;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100006768;
      v12[3] = &unk_1000105F0;
      id v13 = v6;
      [(IMAAppPresenter *)appPresenter presentAppWithBundleIdentifier:v5 completion:v12];
    }
    else
    {
      [v6 stickerPickerCardDidLoad];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)StickersAppCardViewController;
  id v7 = a4;
  -[StickersAppCardViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006840;
  v8[3] = &unk_100010618;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)dismiss
{
  self->_isPresentingStandaloneFullscreenModal = 0;
  id v2 = [(StickersAppCardViewController *)self _remoteViewControllerProxy];
  [v2 dismissCard];
}

- (void)requestStageSticker:(id)a3
{
  id v4 = a3;
  v5 = sub_10000A660();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 stickerIdentifier];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Staging sticker with identifier %@", (uint8_t *)&buf, 0xCu);
  }
  id v7 = [(StickersAppCardViewController *)self _remoteViewControllerProxy];
  id v8 = [v4 representations];
  if (!v8)
  {
    objc_super v9 = [v4 fileURL];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      id v8 = 0;
    }
    else
    {
      v11 = [v4 fileURL];
      id v8 = +[MSSticker _stickerRepresentationsForImageFileURL:v11];
    }
  }
  id v12 = [v4 stickerIdentifier];
  if (!v12)
  {
    id v13 = [v4 fileURL];
    objc_super v14 = [v13 lastPathComponent];
    v15 = v14;
    if (v14)
    {
      id v12 = v14;
    }
    else
    {
      v16 = +[NSUUID UUID];
      id v12 = [v16 UUIDString];
    }
  }
  v17 = objc_opt_new();
  [v17 setIdentifier:v12];
  [v17 setRepresentations:v8];
  v18 = [v4 stickerName];
  [v17 setName:v18];

  v19 = [v4 stickerEffectType];
  v20 = v19;
  if (!v19) {
    v19 = &off_100010A70;
  }
  [v17 setEffectType:[v19 intValue]];

  v21 = [v4 externalURI];
  [v17 setExternalURI:v21];

  v22 = [v4 accessibilityLabel];
  [v17 setAccessibilityLabel:v22];

  v23 = [v4 metadata];
  [v17 setMetadata:v23];

  v24 = [v4 ckAttributionInfo];
  [v17 setAttributionInfo:v24];

  [v7 stageSticker:v17];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100006D18;
  v31[3] = &unk_100010640;
  id v25 = v4;
  id v32 = v25;
  id v26 = v12;
  id v33 = v26;
  id v27 = v8;
  id v34 = v27;
  [v7 remoteHandlesRecentsStickerDonationWithCompletionHandler:v31];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v28 = (void *)qword_100016788;
  uint64_t v38 = qword_100016788;
  if (!qword_100016788)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v40 = sub_100008698;
    v41 = &unk_100010560;
    v42 = &v35;
    sub_100008698((uint64_t)&buf);
    v28 = (void *)v36[3];
  }
  id v29 = v28;
  _Block_object_dispose(&v35, 8);
  if (objc_opt_respondsToSelector())
  {
    v30 = [(StickersAppCardViewController *)self _hostApplicationBundleIdentifier];
    [v29 trackStickerSentFromHostBundleIdentifier:v30];
  }
}

- (void)updateCompactCardHeight:(double)a3
{
  if (self->_compactHeight != a3)
  {
    id v5 = [(StickersAppCardViewController *)self appPresenter];
    [v5 setCompactHeight:a3];
    if (self->_compactHeight < a3) {
      [v5 updateAppFrameForRotation];
    }
    self->_compactHeight = a3;
  }
}

- (void)animateCardHiddenWithCompletion:(id)a3
{
}

- (void)presentPopoverAtWindowLocation:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  BOOL v10 = IMStickersExtensionIdentifier();
  IMBalloonExtensionIDWithSuffix();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  appPresenter = self->_appPresenter;
  id v12 = [(StickersAppCardViewController *)self view];
  -[IMAAppPresenter presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:](appPresenter, "presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:", v13, v12, v9, x, y, width, height);
}

- (void)updatePopoverWindowLocation:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  appPresenter = self->_appPresenter;
  id v10 = a4;
  id v11 = [(StickersAppCardViewController *)self view];
  -[IMAAppPresenter updatePopoverWindowLocation:inView:completion:](appPresenter, "updatePopoverWindowLocation:inView:completion:", v11, v10, x, y, width, height);
}

- (void)animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  id v6 = a3;
  id v7 = [(StickersAppCardViewController *)self stickersHostViewController];
  [v7 _animatedStickerCreationProgressChanged:v6 progress:a4];
}

- (void)addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id location = 0;
    objc_initWeak(&location, v8);
    id v9 = sub_10000A660();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v6 count];
      *(_DWORD *)long long buf = 134217984;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Adding sticker to store with %lu representations", buf, 0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100007448;
    v13[3] = &unk_100010668;
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    id v14 = v7;
    [v8 _addStickerToStoreWithRepresentations:v6 completionHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    id v11 = sub_10000A660();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000A910();
    }

    id v12 = +[NSError errorWithDomain:IMAErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void *, CGFloat, CGFloat, CGFloat, CGFloat))v7 + 2))(v7, v12, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id location = 0;
    objc_initWeak(&location, v8);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000077DC;
    v11[3] = &unk_100010690;
    objc_copyWeak(&v13, &location);
    v11[4] = self;
    id v12 = v7;
    [v8 _addStickerToStoreWithRepresentations:v6 completionWithStickerIDs:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    id v9 = sub_10000A660();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000A910();
    }

    id v10 = +[NSError errorWithDomain:IMAErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *, CGFloat, CGFloat, CGFloat, CGFloat))v7 + 2))(v7, 0, v10, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  }
}

- (void)addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007AAC;
    v16[3] = &unk_1000106B8;
    id v17 = v12;
    [v13 _addStickerToStoreWithRepresentations:v11 sourceRect:v16 x:x y:y width:width height:height];
    id v14 = v17;
LABEL_8:

    goto LABEL_9;
  }
  if (v12)
  {
    id v15 = sub_10000A660();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000A910();
    }

    id v14 = +[NSError errorWithDomain:IMAErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  id v13 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (objc_opt_respondsToSelector())
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007CAC;
    v16[3] = &unk_1000106B8;
    id v17 = v12;
    [v13 _addStickerToStoreWithUISticker:v11 sourceRect:v16 x:x y:y width:width height:height];
    id v14 = v17;
LABEL_7:

    goto LABEL_8;
  }
  if (v12)
  {
    id v15 = sub_10000A660();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000A910();
    }

    id v14 = +[NSError errorWithDomain:IMAErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v14);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)addStickerAnimationDidFinishWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v4 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 _addStickerAnimationDidFinishWithCompletion:v5];
  }
  else {
    v5[2]();
  }
}

- (void)didRemoveStickerPreview
{
  uint64_t v2 = [(StickersAppCardViewController *)self stickersHostViewController];
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v3 _didRemoveStickerPreview];
    }
  }

  _objc_release_x2();
}

- (void)addSticker:(id)a3
{
}

- (void)addSticker:(id)a3 atDropTarget:(id)a4
{
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  if (a3) {
    [(ImmediatePanGestureRecognizer *)self->_dismissalGestureTracker setEnabled:1];
  }
  else {
    [(StickersAppCardViewController *)self dismiss];
  }
}

- (void)overrideDropPointWithCompletion:(id)a3
{
}

- (void)appPresenterDidDismissFullscreenModal:(id)a3
{
  if (self->_isPresentingStandaloneFullscreenModal) {
    [(StickersAppCardViewController *)self dismiss];
  }
}

- (void)appPresenterCardDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2050000000;
  id v5 = (void *)qword_100016798;
  uint64_t v12 = qword_100016798;
  if (!qword_100016798)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008850;
    v8[3] = &unk_100010560;
    v8[4] = &v9;
    sub_100008850((uint64_t)v8);
    id v5 = (void *)v10[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v9, 8);
  id v7 = [v6 sharedInstance];
  if (([v7 stickerDragActiveInCurrentProcess] & 1) == 0) {
    [(StickersAppCardViewController *)self dismiss];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  if (qword_100016760 != -1) {
    dispatch_once(&qword_100016760, &stru_1000106D8);
  }
  uint64_t v2 = (void *)qword_100016758;

  return v2;
}

+ (id)_exportedInterface
{
  if (qword_100016770 != -1) {
    dispatch_once(&qword_100016770, &stru_1000106F8);
  }
  uint64_t v2 = (void *)qword_100016768;

  return v2;
}

- (id)stickersHostViewController
{
  int v3 = IMIsStickersStripInCling();
  appPresenter = self->_appPresenter;
  if (v3)
  {
    id v5 = [(IMAAppPresenter *)appPresenter currentStickerViewController];
  }
  else
  {
    id v6 = [(IMAAppPresenter *)appPresenter currentAppViewController];
    if ([v6 conformsToProtocol:&OBJC_PROTOCOL___IMAStickerViewController]) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (IMAAppPresenter)appPresenter
{
  return self->_appPresenter;
}

- (void)setAppPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPresenter, 0);
  objc_storeStrong((id *)&self->_dismissalView, 0);

  objc_storeStrong((id *)&self->_dismissalGestureTracker, 0);
}

@end