@interface WADetailedSnippetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (WADetailedSnippetViewController)initWithAnswerSnippet:(id)a3;
- (double)desiredHeightForWidth:(double)a3;
- (id)_blendedImageFromImage:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sashItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)attributionViewTapped:(id)a3;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)wasAddedToTranscript;
@end

@implementation WADetailedSnippetViewController

- (WADetailedSnippetViewController)initWithAnswerSnippet:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WADetailedSnippetViewController;
  v5 = [(WADetailedSnippetViewController *)&v10 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(WADetailedSnippetViewController *)v5 setSnippet:v4];
    -[WADetailedSnippetViewController setDefaultViewInsets:](v6, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    uint64_t v7 = +[NSMutableArray array];
    answerViews = v6->_answerViews;
    v6->_answerViews = (NSMutableArray *)v7;

    [(WADetailedSnippetViewController *)v6 setLoading:1];
  }

  return v6;
}

- (void)wasAddedToTranscript
{
  v56.receiver = self;
  v56.super_class = (Class)WADetailedSnippetViewController;
  [(WADetailedSnippetViewController *)&v56 wasAddedToTranscript];
  v3 = [(WADetailedSnippetViewController *)self delegate];
  id v4 = [v3 persistentDataStoreForSiriViewController:self];

  group = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v5 = [(WADetailedSnippetViewController *)self snippet];
  v6 = [v5 answers];

  id obj = v6;
  id v32 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v53;
    uint64_t v7 = &stru_D000;
    v40 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v8;
        v9 = *(void **)(*((void *)&v52 + 1) + 8 * v8);
        objc_super v10 = objc_alloc_init(WATextHeaderView);
        v11 = [v9 title];
        [(WATextHeaderView *)v10 setText:v11];

        v33 = v10;
        [(NSMutableArray *)self->_answerViews addObject:v10];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v37 = [v9 lines];
        id v39 = [v37 countByEnumeratingWithState:&v48 objects:v57 count:16];
        if (v39)
        {
          uint64_t v38 = *(void *)v49;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v49 != v38) {
                objc_enumerationMutation(v37);
              }
              v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              id v14 = objc_alloc_init((Class)&v7[120]);
              [(NSMutableArray *)self->_answerViews addObject:v14];
              v15 = [v13 imageInverted];
              if (v15)
              {
                v16 = [v13 imageInverted];
                objc_msgSend(v14, "setShouldInvert:", objc_msgSend(v16, "BOOLValue") ^ 1);
              }
              else
              {
                [v14 setShouldInvert:0];
              }

              v17 = [v13 imageResource];
              v18 = [v17 imageData];
              v19 = +[NSData dataWithData:v18];
              v20 = +[UIImage imageWithData:v19];

              v21 = [v13 imageResource];
              v22 = [v21 resourceUrl];

              if (v20)
              {
                [v14 setImage:v20];
                v23 = [(WADetailedSnippetViewController *)self traitCollection];
                if ([v23 userInterfaceStyle] == (char *)&dword_0 + 2)
                {
                  unsigned int v24 = [v14 shouldInvert];

                  if (v24) {
                    [v14 invertImage];
                  }
                }
                else
                {
                }
              }
              else if (v22)
              {
                v25 = [v22 absoluteString];
                v26 = [v40 imageForKey:v25];
                if (v26)
                {
                  [v14 setImage:v26];
                }
                else
                {
                  dispatch_group_enter(group);
                  v36 = +[SiriUIURLSession sharedURLSession];
                  v42[0] = _NSConcreteStackBlock;
                  v42[1] = 3221225472;
                  v42[2] = sub_2DE8;
                  v42[3] = &unk_82E0;
                  v42[4] = v13;
                  v42[5] = self;
                  id v27 = v22;
                  id v43 = v27;
                  id v44 = v40;
                  v45 = v25;
                  id v46 = v14;
                  v47 = group;
                  id v28 = [v36 imageTaskWithHTTPGetRequest:v27 client:self completionHandler:v42];
                }
                uint64_t v7 = &stru_D000;
              }

              id v4 = v40;
            }
            id v39 = [v37 countByEnumeratingWithState:&v48 objects:v57 count:16];
          }
          while (v39);
        }

        uint64_t v8 = v34 + 1;
      }
      while ((id)(v34 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v32);
  }

  v29 = -[WAAttributionView initWithFrame:]([WAAttributionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NSMutableArray *)self->_answerViews addObject:v29];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_302C;
  block[3] = &unk_8308;
  block[4] = self;
  dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)loadView
{
  v10.receiver = self;
  v10.super_class = (Class)WADetailedSnippetViewController;
  [(WADetailedSnippetViewController *)&v10 loadView];
  v3 = [(WADetailedSnippetViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[WATextHeaderView reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  uint64_t v7 = +[WAImageView reuseIdentifier];
  [v3 registerClass:v6 forCellWithReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[WAAttributionView reuseIdentifier];
  [v3 registerClass:v8 forCellWithReuseIdentifier:v9];
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(WADetailedSnippetViewController *)self isViewLoaded] & 1) == 0) {
    [(WADetailedSnippetViewController *)self loadView];
  }
  uint64_t v4 = [(WADetailedSnippetViewController *)self collectionView];
  v5 = [v4 collectionViewLayout];
  [v5 collectionViewContentSize];
  double v7 = v6;

  return v7;
}

- (id)sashItem
{
  id v2 = [objc_alloc((Class)SiriUISashItem) initWithApplicationBundleIdentifier:@"com.wolframalpha.wolframalpha"];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = [objc_alloc((Class)SiriUISashItem) initWithApplicationBundleIdentifier:@"com.apple.mobilesafari"];
  }
  v5 = v4;

  [v5 setTitle:@"Wolfram Alpha"];

  return v5;
}

- (void)attributionViewTapped:(id)a3
{
  id v4 = [(WADetailedSnippetViewController *)self delegate];
  v5 = [(WADetailedSnippetViewController *)self snippet];
  double v6 = [v5 answerPunchOut];
  uint64_t v8 = v6;
  double v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [v4 siriViewController:self performAceCommands:v7];
}

- (id)_blendedImageFromImage:(id)a3
{
  id v3 = a3;
  [v3 size];
  CGFloat v5 = v4;
  [v3 size];
  CGFloat v7 = v6;
  [v3 size];
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v3 size];
  CGContextTranslateCTM(CurrentContext, 0.0, v9);
  objc_super v10 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v10, 1.0, -1.0);
  v11 = UIGraphicsGetCurrentContext();
  id v12 = +[UIColor colorWithWhite:1.0 alpha:0.5];
  CGContextSetFillColorWithColor(v11, (CGColorRef)[v12 CGColor]);

  v13 = UIGraphicsGetCurrentContext();
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v5;
  v22.size.height = v7;
  CGContextFillRect(v13, v22);
  id v14 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v14, kCGBlendModeScreen);
  v15 = UIGraphicsGetCurrentContext();
  id v16 = v3;
  v17 = (CGImage *)[v16 CGImage];

  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v5;
  v23.size.height = v7;
  CGContextDrawImage(v15, v23, v17);
  v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  answerViews = self->_answerViews;
  id v6 = a4;
  CGFloat v7 = -[NSMutableArray objectAtIndex:](answerViews, "objectAtIndex:", [v6 item]);
  uint64_t v8 = [(WADetailedSnippetViewController *)self collectionView];
  CGFloat v9 = [(id)objc_opt_class() reuseIdentifier];
  objc_super v10 = [v8 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v7 text];
    [v10 setText:v11];
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v7 image];
    [v10 setImage:v11];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setDelegate:self];
  }
LABEL_6:

  return v10;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_answerViews count];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(NSMutableArray *)self->_answerViews count];
  if (v7 <= [v6 item])
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    uint64_t v8 = -[NSMutableArray objectAtIndex:](self->_answerViews, "objectAtIndex:", [v6 item]);
    CGFloat v9 = [(WADetailedSnippetViewController *)self delegate];
    [v9 siriViewControllerExpectedWidth:self];
    double v11 = v10;

    objc_msgSend(v8, "sizeThatFits:", v11, 1.79769313e308);
    CGFloat width = v12;
    CGFloat height = v14;
  }
  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WADetailedSnippetViewController;
  [(WADetailedSnippetViewController *)&v19 traitCollectionDidChange:v4];
  CGFloat v5 = [(WADetailedSnippetViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  if (v6 != [v4 userInterfaceStyle])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = self->_answerViews;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        double v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            if (objc_msgSend(v13, "shouldInvert", (void)v15)) {
              [v13 invertImage];
            }
          }
          double v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    double v14 = [(WADetailedSnippetViewController *)self view];
    [v14 reloadData];
  }
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void).cxx_destruct
{
}

@end