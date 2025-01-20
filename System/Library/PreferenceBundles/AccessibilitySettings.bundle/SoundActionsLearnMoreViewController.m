@interface SoundActionsLearnMoreViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)sounds;
- (double)_minCardHeight;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_didActivatePageControl:(id)a3;
- (void)_playCurrentSound;
- (void)_setupCardsView;
- (void)_setupPagingControl;
- (void)_setupPlayButton;
- (void)_setupVisualizer;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)scrollToCardIndex:(int)a3 animated:(BOOL)a4;
- (void)setSounds:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SoundActionsLearnMoreViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SoundActionsLearnMoreViewController;
  [(SoundActionsLearnMoreViewController *)&v4 viewDidLoad];
  v3 = [(SoundActionsLearnMoreViewController *)self scrollView];
  [v3 _addScrollViewScrollObserver:self];

  [(SoundActionsLearnMoreViewController *)self _setupVisualizer];
  [(SoundActionsLearnMoreViewController *)self _setupPlayButton];
  [(SoundActionsLearnMoreViewController *)self _setupCardsView];
  [(SoundActionsLearnMoreViewController *)self _setupPagingControl];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SoundActionsLearnMoreViewController;
  [(SoundActionsLearnMoreViewController *)&v11 viewDidAppear:a3];
  objc_initWeak(&location, self);
  objc_super v4 = +[SoundActionsPracticeAudioManager sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__SoundActionsLearnMoreViewController_viewDidAppear___block_invoke;
  v8[3] = &unk_2099A8;
  objc_copyWeak(&v9, &location);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __53__SoundActionsLearnMoreViewController_viewDidAppear___block_invoke_2;
  v6[3] = &unk_20B400;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "registerListener:forAudioLevelUpdates:forDetection:withBucketCount:", self, v8, v6, -[SoundActionsPracticeVisualizerView pipCount](self->_visualizerView, "pipCount", _NSConcreteStackBlock, 3221225472, __53__SoundActionsLearnMoreViewController_viewDidAppear___block_invoke_2, &unk_20B400, self));

  v5 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v5 start];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__SoundActionsLearnMoreViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[1] updateWithMagnitudes:v5];
  }
}

void __53__SoundActionsLearnMoreViewController_viewDidAppear___block_invoke_2(uint64_t a1, id a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained[3] currentPage];
  if (v4 < [WeakRetained[5] count])
  {
    id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "currentPage"));
    id v6 = [v5 usage];

    if (v6 == a2)
    {
      id v7 = WeakRetained[1];
      v8 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_GREAT", @"Accessibility");
      [v7 showCorrectWithString:v8];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SoundActionsLearnMoreViewController;
  [(SoundActionsLearnMoreViewController *)&v6 viewWillDisappear:a3];
  id v4 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v4 deregisterListener:self];

  id v5 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v5 stop];
}

- (void)viewDidLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SoundActionsLearnMoreViewController;
  [(SoundActionsLearnMoreViewController *)&v21 viewDidLayoutSubviews];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_sounds;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(SoundActionsLearnMoreViewController *)self view];
        [v10 bounds];
        +[SoundActionsPracticeCardCollectionViewCell desiredHeightForData:v9 givenWidth:v11];
        double v13 = v12;

        if (v13 > v7) {
          double v7 = v13;
        }
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  [(SoundActionsLearnMoreViewController *)self _minCardHeight];
  if (v7 < v14)
  {
    [(SoundActionsLearnMoreViewController *)self _minCardHeight];
    double v7 = v15;
  }
  -[NSLayoutConstraint setConstant:](self->_cardHeightConstraint, "setConstant:", v7, (void)v17);
  v16 = [(UICollectionView *)self->_cardsView collectionViewLayout];
  [v16 invalidateLayout];
}

- (void)setSounds:(id)a3
{
  p_sounds = &self->_sounds;
  objc_storeStrong((id *)&self->_sounds, a3);
  id v6 = a3;
  [(UIPageControl *)self->_pageControl setNumberOfPages:[(NSArray *)*p_sounds count]];
  [(UICollectionView *)self->_cardsView reloadData];
}

- (void)scrollToCardIndex:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSArray *)self->_sounds count] > a3)
  {
    cardsView = self->_cardsView;
    id v8 = +[NSIndexPath indexPathForItem:a3 inSection:0];
    [(UICollectionView *)cardsView scrollToItemAtIndexPath:v8 atScrollPosition:0 animated:v4];
  }
}

- (void)_setupVisualizer
{
  if (!self->_visualizerView)
  {
    v3 = objc_alloc_init(SoundActionsPracticeVisualizerView);
    visualizerView = self->_visualizerView;
    self->_visualizerView = v3;

    [(SoundActionsPracticeVisualizerView *)self->_visualizerView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [(SoundActionsLearnMoreViewController *)self contentView];
    [v5 addSubview:self->_visualizerView];

    id v6 = self->_visualizerView;
    long long v18 = [(SoundActionsLearnMoreViewController *)self contentView];
    double v7 = +[NSLayoutConstraint constraintWithItem:v6 attribute:3 relatedBy:0 toItem:v18 attribute:3 multiplier:1.0 constant:20.0];
    v19[0] = v7;
    id v8 = self->_visualizerView;
    uint64_t v9 = [(SoundActionsLearnMoreViewController *)self contentView];
    v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:5 relatedBy:0 toItem:v9 attribute:5 multiplier:1.0 constant:20.0];
    v19[1] = v10;
    double v11 = self->_visualizerView;
    double v12 = [(SoundActionsLearnMoreViewController *)self contentView];
    double v13 = +[NSLayoutConstraint constraintWithItem:v11 attribute:6 relatedBy:0 toItem:v12 attribute:6 multiplier:1.0 constant:-20.0];
    v19[2] = v13;
    double v14 = self->_visualizerView;
    +[SoundActionsPracticeVisualizerView desiredHeight];
    v16 = +[NSLayoutConstraint constraintWithItem:v14 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v15];
    v19[3] = v16;
    long long v17 = +[NSArray arrayWithObjects:v19 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
}

- (void)_setupPlayButton
{
  v3 = [(SoundActionsLearnMoreViewController *)self buttonTray];
  [v3 removeAllButtons];

  id v6 = +[OBBoldTrayButton boldButton];
  BOOL v4 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_PLAY", @"Accessibility");
  [v6 setTitle:v4 forState:0];

  [v6 addTarget:self action:"_playCurrentSound" forControlEvents:64];
  id v5 = [(SoundActionsLearnMoreViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)_setupCardsView
{
  if (!self->_cardsView)
  {
    long long v18 = objc_opt_new();
    [v18 setScrollDirection:1];
    v3 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v18, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    cardsView = self->_cardsView;
    self->_cardsView = v3;

    [(UICollectionView *)self->_cardsView setDataSource:self];
    [(UICollectionView *)self->_cardsView setDelegate:self];
    [(UICollectionView *)self->_cardsView setPagingEnabled:1];
    [(UICollectionView *)self->_cardsView setScrollEnabled:1];
    [(UICollectionView *)self->_cardsView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_cardsView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SAP_CARD_CELL_REUSE_ID"];
    [(UICollectionView *)self->_cardsView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = self->_cardsView;
    id v6 = +[UIColor clearColor];
    [(UICollectionView *)v5 setBackgroundColor:v6];

    double v7 = [(SoundActionsLearnMoreViewController *)self contentView];
    [v7 addSubview:self->_cardsView];

    id v8 = +[NSLayoutConstraint constraintWithItem:self->_cardsView attribute:3 relatedBy:0 toItem:self->_visualizerView attribute:4 multiplier:1.0 constant:36.0];
    v19[0] = v8;
    uint64_t v9 = self->_cardsView;
    v10 = [(SoundActionsLearnMoreViewController *)self view];
    double v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
    v19[1] = v11;
    double v12 = self->_cardsView;
    double v13 = [(SoundActionsLearnMoreViewController *)self view];
    double v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:6 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:0.0];
    v19[2] = v14;
    double v15 = +[NSArray arrayWithObjects:v19 count:3];
    +[NSLayoutConstraint activateConstraints:v15];

    v16 = +[NSLayoutConstraint constraintWithItem:self->_cardsView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:200.0];
    cardHeightConstraint = self->_cardHeightConstraint;
    self->_cardHeightConstraint = v16;

    [(NSLayoutConstraint *)self->_cardHeightConstraint setActive:1];
  }
}

- (void)_setupPagingControl
{
  if (!self->_pageControl)
  {
    v3 = (UIPageControl *)objc_alloc_init((Class)UIPageControl);
    pageControl = self->_pageControl;
    self->_pageControl = v3;

    [(UIPageControl *)self->_pageControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPageControl *)self->_pageControl setNumberOfPages:[(NSArray *)self->_sounds count]];
    id v5 = +[UIColor secondarySystemFillColor];
    [(UIPageControl *)self->_pageControl setPageIndicatorTintColor:v5];

    id v6 = +[UIColor systemFillColor];
    [(UIPageControl *)self->_pageControl setCurrentPageIndicatorTintColor:v6];

    [(UIPageControl *)self->_pageControl setHidesForSinglePage:1];
    [(UIPageControl *)self->_pageControl addTarget:self action:"_didActivatePageControl:" forControlEvents:4096];
    double v7 = [(SoundActionsLearnMoreViewController *)self contentView];
    [v7 addSubview:self->_pageControl];

    id v8 = self->_pageControl;
    uint64_t v9 = [(SoundActionsLearnMoreViewController *)self contentView];
    v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:9 relatedBy:0 toItem:v9 attribute:9 multiplier:1.0 constant:0.0];
    double v11 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_pageControl, 3, 0, self->_cardsView, 4, 1.0, 0.0, v10);
    v16[1] = v11;
    double v12 = self->_pageControl;
    double v13 = [(SoundActionsLearnMoreViewController *)self contentView];
    double v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:4 relatedBy:0 toItem:v13 attribute:4 multiplier:1.0 constant:0.0];
    v16[2] = v14;
    double v15 = +[NSArray arrayWithObjects:v16 count:3];
    +[NSLayoutConstraint activateConstraints:v15];
  }
}

- (void)_didActivatePageControl:(id)a3
{
  signed int v4 = [a3 currentPage];
  cardsView = self->_cardsView;
  id v6 = +[NSIndexPath indexPathForItem:v4 inSection:0];
  [(UICollectionView *)cardsView scrollToItemAtIndexPath:v6 atScrollPosition:0 animated:1];
}

- (void)_playCurrentSound
{
  unint64_t v3 = [(UIPageControl *)self->_pageControl currentPage];
  signed int v4 = [(SoundActionsLearnMoreViewController *)self sounds];
  id v5 = [v4 count];

  if (v3 < (unint64_t)v5)
  {
    id v6 = [(SoundActionsLearnMoreViewController *)self sounds];
    objc_msgSend(v6, "objectAtIndexedSubscript:", -[UIPageControl currentPage](self->_pageControl, "currentPage"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    double v7 = +[SoundActionsPracticeAudioManager sharedInstance];
    id v8 = [v9 soundURL];
    [v7 playURL:v8];
  }
}

- (double)_minCardHeight
{
  [(SoundActionsLearnMoreViewController *)self availableContentViewHeight];
  double v4 = v3;
  [(SoundActionsPracticeVisualizerView *)self->_visualizerView bounds];
  double v6 = v4 - v5 + -72.0 + -20.0;
  [(UIPageControl *)self->_pageControl bounds];
  float v8 = (v6 - v7) * 0.9;
  return floorf(v8);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"SAP_CARD_CELL_REUSE_ID" forIndexPath:v6];
  sounds = self->_sounds;
  id v9 = [v6 item];

  v10 = [(NSArray *)sounds objectAtIndexedSubscript:v9];
  [v7 setSoundActionData:v10];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sounds count];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 bounds];
  double v7 = v6;
  [(NSLayoutConstraint *)self->_cardHeightConstraint constant];
  double v9 = v8;
  double v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = objc_msgSend(a5, "row", a3, a4);
  pageControl = self->_pageControl;

  [(UIPageControl *)pageControl setCurrentPage:v6];
}

- (NSArray)sounds
{
  return self->_sounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sounds, 0);
  objc_storeStrong((id *)&self->_cardHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_cardsView, 0);

  objc_storeStrong((id *)&self->_visualizerView, 0);
}

@end