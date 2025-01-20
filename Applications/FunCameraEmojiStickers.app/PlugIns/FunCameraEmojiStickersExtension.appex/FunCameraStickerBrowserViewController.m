@interface FunCameraStickerBrowserViewController
- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3;
- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3 stickerSize:(int64_t)a4;
- (FunCameraStickerBrowserViewControllerDataSource)dataSource;
- (MSStickerBrowserView)stickerBrowser;
- (NSMutableDictionary)stickerCache;
- (NSString)effectTypeIdentifier;
- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4;
- (int64_t)numberOfStickersInStickerBrowserView:(id)a3;
- (int64_t)stickerSize;
- (void)reloadStickerAtIndex:(int64_t)a3;
- (void)reloadStickers;
- (void)setDataSource:(id)a3;
- (void)setStickerBrowser:(id)a3;
- (void)setStickerCache:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FunCameraStickerBrowserViewController

- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3 stickerSize:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FunCameraStickerBrowserViewController;
  v8 = [(FunCameraStickerBrowserViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_effectTypeIdentifier, a3);
    v9->_stickerSize = a4;
  }

  return v9;
}

- (FunCameraStickerBrowserViewController)initWithEffectTypeIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(FunCameraStickerBrowserViewController *)self initWithEffectTypeIdentifier:v5 stickerSize:1];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_effectTypeIdentifier, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)FunCameraStickerBrowserViewController;
  [(FunCameraStickerBrowserViewController *)&v37 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(FunCameraStickerBrowserViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc((Class)MSStickerBrowserView);
  v6 = [(FunCameraStickerBrowserViewController *)self view];
  [v6 bounds];
  id v11 = [v5 initWithFrame:v7 stickerSize:[self stickerSize] v8, v9, v10];
  [(FunCameraStickerBrowserViewController *)self setStickerBrowser:v11];

  v12 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v12 setDataSource:self];

  v13 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(FunCameraStickerBrowserViewController *)self view];
  v15 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v14 addSubview:v15];

  v36 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  v34 = [v36 leadingAnchor];
  v35 = [(FunCameraStickerBrowserViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v38[0] = v32;
  v31 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  v29 = [v31 trailingAnchor];
  v30 = [(FunCameraStickerBrowserViewController *)self view];
  v28 = [v30 trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v38[1] = v27;
  v26 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  v16 = [v26 topAnchor];
  v17 = [(FunCameraStickerBrowserViewController *)self view];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v38[2] = v19;
  v20 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  v21 = [v20 bottomAnchor];
  v22 = [(FunCameraStickerBrowserViewController *)self view];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  v38[3] = v24;
  v25 = +[NSArray arrayWithObjects:v38 count:4];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FunCameraStickerBrowserViewController;
  [(FunCameraStickerBrowserViewController *)&v5 viewDidAppear:a3];
  v4 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v4 _startAnimating];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FunCameraStickerBrowserViewController;
  [(FunCameraStickerBrowserViewController *)&v5 viewDidDisappear:a3];
  v4 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v4 _stopAnimating];
}

- (NSMutableDictionary)stickerCache
{
  stickerCache = self->_stickerCache;
  if (!stickerCache)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objc_super v5 = self->_stickerCache;
    self->_stickerCache = v4;

    stickerCache = self->_stickerCache;
  }

  return stickerCache;
}

- (int64_t)numberOfStickersInStickerBrowserView:(id)a3
{
  v4 = [(FunCameraStickerBrowserViewController *)self dataSource];
  objc_super v5 = [(FunCameraStickerBrowserViewController *)self effectTypeIdentifier];
  id v6 = [v4 funCamStickerBrowser:self numberOfStickersForEffectTypeIdentifier:v5];

  return (int64_t)v6;
}

- (id)stickerBrowserView:(id)a3 stickerAtIndex:(int64_t)a4
{
  id v6 = [(FunCameraStickerBrowserViewController *)self stickerCache];
  double v7 = +[NSNumber numberWithInteger:a4];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    double v9 = [(FunCameraStickerBrowserViewController *)self dataSource];
    double v10 = [(FunCameraStickerBrowserViewController *)self effectTypeIdentifier];
    id v11 = [v9 funCamStickerBrowser:self stickerForIndex:a4 forEffectTypeIdentifier:v10];

    id v12 = objc_alloc((Class)MSSticker);
    v13 = [v11 previewUrl];
    v14 = [v11 localizedDescription];
    id v8 = [v12 initWithContentsOfFileURL:v13 localizedDescription:v14 error:0];

    if (v8)
    {
      v15 = [(FunCameraStickerBrowserViewController *)self stickerCache];
      v16 = +[NSNumber numberWithInteger:a4];
      [v15 setObject:v8 forKeyedSubscript:v16];
    }
  }

  return v8;
}

- (void)reloadStickers
{
  [(FunCameraStickerBrowserViewController *)self setStickerCache:0];
  id v3 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v3 reloadData];
}

- (void)reloadStickerAtIndex:(int64_t)a3
{
  objc_super v5 = [(FunCameraStickerBrowserViewController *)self stickerCache];
  id v6 = +[NSNumber numberWithInteger:a3];
  [v5 removeObjectForKey:v6];

  id v8 = +[NSIndexSet indexSetWithIndex:a3];
  double v7 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
  [v7 _reloadStickersAtIndexes:v8];
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    objc_super v5 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
    [v10 prepareForSnapshotting];

    double y = CGPointZero.y;
    id v12 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
    [v12 setContentOffset:CGPointZero.x, y];

    v13 = [(FunCameraStickerBrowserViewController *)self view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;

    id v18 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v15, v17];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000026C0;
    v24[3] = &unk_100004190;
    v24[4] = self;
    v19 = [v18 imageWithActions:v24];
    v20 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
    [v20 setContentOffset:v7, v9];

    v4[2](v4, v19);
    v21 = [(FunCameraStickerBrowserViewController *)self view];
    v22 = [v21 window];

    if (v22)
    {
      v23 = [(FunCameraStickerBrowserViewController *)self stickerBrowser];
      [v23 _startAnimating];
    }
  }
}

- (NSString)effectTypeIdentifier
{
  return self->_effectTypeIdentifier;
}

- (FunCameraStickerBrowserViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (FunCameraStickerBrowserViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (MSStickerBrowserView)stickerBrowser
{
  return self->_stickerBrowser;
}

- (void)setStickerBrowser:(id)a3
{
}

- (void)setStickerCache:(id)a3
{
}

- (int64_t)stickerSize
{
  return self->_stickerSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerCache, 0);
  objc_storeStrong((id *)&self->_stickerBrowser, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_effectTypeIdentifier, 0);
}

@end