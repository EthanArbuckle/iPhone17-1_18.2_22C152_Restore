@interface FunCameraShapesViewController
- (FunCameraStickerBrowserViewController)stickerBrowserViewController;
- (id)funCamStickerBrowser:(id)a3 stickerForIndex:(int64_t)a4 forEffectTypeIdentifier:(id)a5;
- (int64_t)funCamStickerBrowser:(id)a3 numberOfStickersForEffectTypeIdentifier:(id)a4;
- (void)setStickerBrowserViewController:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidLoad;
@end

@implementation FunCameraShapesViewController

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)FunCameraShapesViewController;
  [(FunCameraShapesViewController *)&v29 viewDidLoad];
  +[CFXEffect initEffectRegistry];
  uint64_t v3 = CFXEffectTypeIdentifierShapes;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100002750;
  v28[3] = &unk_100004190;
  v28[4] = self;
  +[CFXEffectMessagesStickerUtilities cacheAnimatedStickerPreviewsForOverlayTypeId:CFXEffectTypeIdentifierShapes atStickerSize:1 previewDuration:24 previewFrameRate:v28 previewCompletedBlock:1.0];
  v4 = [[FunCameraStickerBrowserViewController alloc] initWithEffectTypeIdentifier:v3];
  [(FunCameraShapesViewController *)self setStickerBrowserViewController:v4];

  v5 = [(FunCameraShapesViewController *)self stickerBrowserViewController];
  [v5 setDataSource:self];

  v6 = [(FunCameraShapesViewController *)self stickerBrowserViewController];
  v7 = [v6 view];

  v8 = [(FunCameraShapesViewController *)self stickerBrowserViewController];
  [(FunCameraShapesViewController *)self addChildViewController:v8];

  v9 = [(FunCameraShapesViewController *)self view];
  [v9 addSubview:v7];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [v7 leadingAnchor];
  v27 = [(FunCameraShapesViewController *)self view];
  v25 = [v27 leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v30[0] = v24;
  v22 = [v7 trailingAnchor];
  v23 = [(FunCameraShapesViewController *)self view];
  v21 = [v23 trailingAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v30[1] = v20;
  v19 = [v7 topAnchor];
  v10 = [(FunCameraShapesViewController *)self view];
  v11 = [v10 topAnchor];
  v12 = [v19 constraintEqualToAnchor:v11];
  v30[2] = v12;
  v13 = [v7 bottomAnchor];
  v14 = [(FunCameraShapesViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v30[3] = v16;
  v17 = +[NSArray arrayWithObjects:v30 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  v18 = [(FunCameraShapesViewController *)self stickerBrowserViewController];
  [v18 didMoveToParentViewController:self];
}

- (int64_t)funCamStickerBrowser:(id)a3 numberOfStickersForEffectTypeIdentifier:(id)a4
{
  return (int64_t)+[CFXEffectMessagesStickerUtilities numberOfStickersForEffectTypeId:a4];
}

- (id)funCamStickerBrowser:(id)a3 stickerForIndex:(int64_t)a4 forEffectTypeIdentifier:(id)a5
{
  return +[CFXEffectMessagesStickerUtilities stickerPropertiesForIndex:a4 forEffectTypeId:a5];
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FunCameraShapesViewController *)self stickerBrowserViewController];
  [v5 updateSnapshotWithCompletionBlock:v4];
}

- (FunCameraStickerBrowserViewController)stickerBrowserViewController
{
  return self->_stickerBrowserViewController;
}

- (void)setStickerBrowserViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end