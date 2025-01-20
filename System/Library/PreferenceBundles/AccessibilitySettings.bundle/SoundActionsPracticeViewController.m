@interface SoundActionsPracticeViewController
- (BOOL)_cellsWillTruncateAtWidth:(double)a3;
- (BOOL)_handleSoundEvent:(int64_t)a3;
- (BOOL)accessibilityPerformMagicTap;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSURL)assetURL;
- (UIButton)learnMoreButton;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)_itemHeight;
- (double)_itemWidth;
- (double)_itemWidthForColumnCount:(unsigned int)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_indexPathForUsage:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int)_setupLocalHeader;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_didFinishAnnouncement:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_pauseVisualizer:(BOOL)a3;
- (void)_setupCollectionView;
- (void)_setupLearnMoreButton;
- (void)_setupSounds;
- (void)_startListening;
- (void)_stopListening;
- (void)_traitCollectionDidChange:(id)a3;
- (void)_updateCollectionViewHeightConstraint;
- (void)_voiceOverStatusDidChange:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAssetURL:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setLearnMoreButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SoundActionsPracticeViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SoundActionsPracticeViewController;
  [(SoundActionsPracticeViewController *)&v11 viewDidLoad];
  self->_itemHeight = 0.0;
  self->_lastRecognizedOrTappedSound = 0;
  self->_cachedColumnCount = 0;
  v3 = [(SoundActionsPracticeViewController *)self scrollView];
  [v3 _addScrollViewScrollObserver:self];

  [(SoundActionsPracticeViewController *)self _setupSounds];
  [(SoundActionsPracticeViewController *)self _setupLearnMoreButton];
  [(SoundActionsPracticeViewController *)self _setupCollectionView];
  [(SoundActionsPracticeViewController *)self _setupLocalHeader];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_voiceOverStatusDidChange:" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_didFinishAnnouncement:" name:UIAccessibilityAnnouncementDidFinishNotification object:0];

  objc_initWeak(&location, self);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v6 = +[NSArray arrayWithObjects:v12 count:2];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__SoundActionsPracticeViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_208A18;
  objc_copyWeak(&v9, &location);
  id v7 = [(SoundActionsPracticeViewController *)self registerForTraitChanges:v6 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__SoundActionsPracticeViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _traitCollectionDidChange:v4];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SoundActionsPracticeViewController;
  [(SoundActionsPracticeViewController *)&v3 viewDidLayoutSubviews];
  [(SoundActionsPracticeViewController *)self _updateCollectionViewHeightConstraint];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SoundActionsPracticeViewController;
  [(SoundActionsPracticeViewController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SoundActionsPracticeViewController;
  [(SoundActionsPracticeViewController *)&v4 viewDidAppear:a3];
  [(SoundActionsPracticeViewController *)self _startListening];
  if (UIAccessibilityIsVoiceOverRunning()) {
    [(SoundActionsPracticeViewController *)self _stopListening];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SoundActionsPracticeViewController;
  [(SoundActionsPracticeViewController *)&v4 viewWillDisappear:a3];
  [(SoundActionsPracticeViewController *)self _stopListening];
}

- (void)_stopListening
{
  objc_super v3 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v3 deregisterListener:self];

  objc_super v4 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v4 stop];

  v5 = [(SoundActionsHeader *)self->_scrollingHeader visualizerView];
  [v5 setStyleDisabled:1];

  id v6 = [(SoundActionsHeader *)self->_staticHeader visualizerView];
  [v6 setStyleDisabled:1];
}

- (void)_startListening
{
  objc_super v3 = [(SoundActionsHeader *)self->_scrollingHeader visualizerView];
  [v3 setStyleDisabled:0];

  objc_super v4 = [(SoundActionsHeader *)self->_staticHeader visualizerView];
  [v4 setStyleDisabled:0];

  objc_initWeak(&location, self);
  v5 = +[SoundActionsPracticeAudioManager sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __53__SoundActionsPracticeViewController__startListening__block_invoke;
  v10[3] = &unk_2099A8;
  objc_copyWeak(&v11, &location);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __53__SoundActionsPracticeViewController__startListening__block_invoke_2;
  v8[3] = &unk_2091E0;
  objc_copyWeak(&v9, &location);
  id v6 = [(SoundActionsHeader *)self->_staticHeader visualizerView];
  objc_msgSend(v5, "registerListener:forAudioLevelUpdates:forDetection:withBucketCount:", self, v10, v8, objc_msgSend(v6, "pipCount"));

  id v7 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v7 start];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __53__SoundActionsPracticeViewController__startListening__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained[6] visualizerView];
    [v5 updateWithMagnitudes:v7];

    if (([v4[7] isHidden] & 1) == 0)
    {
      id v6 = [v4[7] visualizerView];
      [v6 updateWithMagnitudes:v7];
    }
  }
}

void __53__SoundActionsPracticeViewController__startListening__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSoundEvent:a2];
}

- (BOOL)_handleSoundEvent:(int64_t)a3
{
  return 1;
}

void __56__SoundActionsPracticeViewController__handleSoundEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == -1)
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (v2 == -2)
  {
    objc_super v3 = *(void **)(a1 + 32);
    uint64_t v4 = 0;
LABEL_5:
    [v3 _pauseVisualizer:v4];
    return;
  }
  v5 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_GREAT", @"Accessibility");
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) visualizerView];
  [v6 showCorrectWithString:v5];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 48) visualizerView];
  [v7 showCorrectWithString:v5];

  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v5);
  v8 = [*(id *)(a1 + 32) _indexPathForUsage:*(void *)(a1 + 40)];
  if (v8)
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 72) cellForItemAtIndexPath:v8];
    [v9 setDetected:1];
    id v11 = v9;
    id v10 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    *(void *)(*(void *)(a1 + 32) + 32) = [v8 item];
  }
}

id __56__SoundActionsPracticeViewController__handleSoundEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDetected:0];
}

- (void)_pauseVisualizer:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SoundActionsHeader *)self->_staticHeader visualizerView];
  [v5 setStyleDisabled:v3];

  id v6 = [(SoundActionsHeader *)self->_scrollingHeader visualizerView];
  [v6 setStyleDisabled:v3];
}

- (id)_indexPathForUsage:(int64_t)a3
{
  if ([(NSArray *)self->_sounds count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_sounds objectAtIndexedSubscript:v5];
      if ([v6 usage] == (id)a3) {
        break;
      }

      if ([(NSArray *)self->_sounds count] <= ++v5) {
        goto LABEL_5;
      }
    }
    id v7 = +[NSIndexPath indexPathForItem:v5 inSection:0];
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }

  return v7;
}

- (void)_setupSounds
{
  BOOL v3 = [(SoundActionsPracticeViewController *)self assetURL];

  sounds = self->_sounds;
  if (v3)
  {
    if (!sounds)
    {
      uint64_t v5 = +[SoundActionsPracticeUtilities sharedInstance];
      id v6 = [(SoundActionsPracticeViewController *)self assetURL];
      id v7 = [v5 allSoundsForAssetURL:v6];
      v8 = self->_sounds;
      self->_sounds = v7;
    }
    AXPerformBlockOnMainThread();
  }
  else
  {
    self->_sounds = 0;
  }
}

void __50__SoundActionsPracticeViewController__setupSounds__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 reloadData];
}

- (void)_setupLearnMoreButton
{
  BOOL v3 = [(SoundActionsPracticeViewController *)self learnMoreButton];

  if (v3)
  {
    uint64_t v4 = [(SoundActionsPracticeViewController *)self learnMoreButton];
    [v4 removeFromSuperview];
  }
  objc_initWeak(&location, self);
  uint64_t v5 = settingsLocString(@"SOUND_ACTION_PRACTICE_PAGE_LEARN", @"Accessibility");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __59__SoundActionsPracticeViewController__setupLearnMoreButton__block_invoke;
  v22[3] = &unk_20AA08;
  v22[4] = self;
  objc_copyWeak(&v23, &location);
  v21 = +[UIAction actionWithTitle:v5 image:0 identifier:0 handler:v22];

  id v6 = +[UIButtonConfiguration plainButtonConfiguration];
  id v7 = +[UIButton buttonWithConfiguration:v6 primaryAction:v21];
  [(SoundActionsPracticeViewController *)self setLearnMoreButton:v7];

  v8 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(SoundActionsPracticeViewController *)self contentView];
  id v10 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  [v9 addSubview:v10];

  v20 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  id v11 = [(SoundActionsPracticeViewController *)self contentView];
  v12 = +[NSLayoutConstraint constraintWithItem:v20 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
  v25[0] = v12;
  v13 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  v14 = [(SoundActionsPracticeViewController *)self contentView];
  v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:20.0];
  v25[1] = v15;
  v16 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  v17 = [(SoundActionsPracticeViewController *)self contentView];
  v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:6 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:-20.0];
  v25[2] = v18;
  v19 = +[NSArray arrayWithObjects:v25 count:3];
  +[NSLayoutConstraint activateConstraints:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __59__SoundActionsPracticeViewController__setupLearnMoreButton__block_invoke(uint64_t a1)
{
  uint64_t v2 = [SoundActionsLearnMoreViewController alloc];
  BOOL v3 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_TITLE", @"Accessibility");
  uint64_t v4 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_DETAIL", @"Accessibility");
  id v10 = [(SoundActionsLearnMoreViewController *)v2 initWithTitle:v3 detailText:v4 icon:0];

  uint64_t v5 = +[SoundActionsPracticeUtilities sharedInstance];
  id v6 = [*(id *)(a1 + 32) assetURL];
  id v7 = [v5 allSoundsForAssetURL:v6];
  [(SoundActionsLearnMoreViewController *)v10 setSounds:v7];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = [WeakRetained navigationController];
  [v9 pushViewController:v10 animated:1];

  [(SoundActionsLearnMoreViewController *)v10 scrollToCardIndex:*(unsigned int *)(*(void *)(a1 + 32) + 32) animated:0];
}

- (void)_setupCollectionView
{
  v27 = objc_opt_new();
  [v27 setSectionHeadersPinToVisibleBounds:1];
  id v3 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v27, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SoundActionsPracticeViewController *)self setCollectionView:v3];

  uint64_t v4 = [(SoundActionsPracticeViewController *)self collectionView];
  [v4 setDataSource:self];

  uint64_t v5 = [(SoundActionsPracticeViewController *)self collectionView];
  [v5 setDelegate:self];

  id v6 = [(SoundActionsPracticeViewController *)self collectionView];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SoundActionsCellReuseID"];

  id v7 = [(SoundActionsPracticeViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SoundActionsHEADERReuseID"];

  v8 = [(SoundActionsPracticeViewController *)self collectionView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = [(SoundActionsPracticeViewController *)self collectionView];
  id v10 = +[UIColor clearColor];
  [v9 setBackgroundColor:v10];

  id v11 = [(SoundActionsPracticeViewController *)self collectionView];
  [v11 setScrollEnabled:0];

  v12 = [(SoundActionsPracticeViewController *)self contentView];
  v13 = [(SoundActionsPracticeViewController *)self collectionView];
  [v12 addSubview:v13];

  v26 = [(SoundActionsPracticeViewController *)self collectionView];
  v25 = [(SoundActionsPracticeViewController *)self learnMoreButton];
  v24 = +[NSLayoutConstraint constraintWithItem:v26 attribute:3 relatedBy:0 toItem:v25 attribute:4 multiplier:1.0 constant:0.0];
  v28[0] = v24;
  id v23 = [(SoundActionsPracticeViewController *)self collectionView];
  v14 = [(SoundActionsPracticeViewController *)self contentView];
  v15 = +[NSLayoutConstraint constraintWithItem:v23 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
  v28[1] = v15;
  v16 = [(SoundActionsPracticeViewController *)self collectionView];
  v17 = [(SoundActionsPracticeViewController *)self contentView];
  v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:5 relatedBy:0 toItem:v17 attribute:5 multiplier:1.0 constant:0.0];
  v28[2] = v18;
  v19 = [(SoundActionsPracticeViewController *)self collectionView];
  v20 = [(SoundActionsPracticeViewController *)self contentView];
  v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:6 relatedBy:0 toItem:v20 attribute:6 multiplier:1.0 constant:0.0];
  v28[3] = v21;
  v22 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v22];
}

- (int)_setupLocalHeader
{
  id v3 = -[SoundActionsHeader initWithFrame:]([SoundActionsHeader alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  staticHeader = self->_staticHeader;
  self->_staticHeader = v3;

  [(SoundActionsHeader *)self->_staticHeader setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v5 = +[UIColor systemBackgroundColor];
  [(SoundActionsHeader *)self->_staticHeader setBackgroundColor:v5];

  [(SoundActionsHeader *)self->_staticHeader setHidden:1];
  id v6 = [(SoundActionsPracticeViewController *)self view];
  [v6 addSubview:self->_staticHeader];

  id v7 = self->_staticHeader;
  v21 = [(SoundActionsPracticeViewController *)self scrollView];
  v8 = +[NSLayoutConstraint constraintWithItem:v7 attribute:3 relatedBy:0 toItem:v21 attribute:3 multiplier:1.0 constant:0.0];
  v22[0] = v8;
  id v9 = self->_staticHeader;
  id v10 = [(SoundActionsPracticeViewController *)self contentView];
  id v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
  v22[1] = v11;
  v12 = self->_staticHeader;
  v13 = [(SoundActionsPracticeViewController *)self contentView];
  v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:6 relatedBy:0 toItem:v13 attribute:6 multiplier:1.0 constant:0.0];
  v22[2] = v14;
  v15 = self->_staticHeader;
  +[SoundActionsPracticeVisualizerView desiredHeight];
  v17 = +[NSLayoutConstraint constraintWithItem:v15 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v16 + 40.0];
  v22[3] = v17;
  v18 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v18];

  v19 = [(SoundActionsHeader *)self->_staticHeader visualizerView];
  LODWORD(self) = [v19 pipCount];

  return (int)self;
}

- (void)_updateCollectionViewHeightConstraint
{
  if (self->_collectionViewHeightConstraint)
  {
    collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
    id v3 = +[NSArray arrayWithObjects:&collectionViewHeightConstraint count:1];
    +[NSLayoutConstraint deactivateConstraints:v3];
  }
  uint64_t v4 = [(SoundActionsPracticeViewController *)self collectionView];
  uint64_t v5 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v5 collectionViewContentSize];
  +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 8, 0, 0, 0, 1.0);
  id v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  id v7 = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v6;

  id v9 = self->_collectionViewHeightConstraint;
  v8 = +[NSArray arrayWithObjects:&v9 count:1];
  +[NSLayoutConstraint activateConstraints:v8];
}

- (double)_itemWidth
{
  if (self->_cachedColumnCount)
  {
    -[SoundActionsPracticeViewController _itemWidthForColumnCount:](self, "_itemWidthForColumnCount:");
  }
  else
  {
    [(SoundActionsPracticeViewController *)self _itemWidthForColumnCount:3];
    double v5 = v4;
    uint64_t v6 = 2;
    while ([(SoundActionsPracticeViewController *)self _cellsWillTruncateAtWidth:v5])
    {
      [(SoundActionsPracticeViewController *)self _itemWidthForColumnCount:v6];
      double v5 = v7;
      uint64_t v6 = (v6 - 1);
      if (!v6)
      {
        unsigned int v8 = 1;
        goto LABEL_10;
      }
    }
    unsigned int v8 = v6 + 1;
LABEL_10:
    self->_cachedColumnCount = v8;
    return v5;
  }
  return result;
}

- (double)_itemWidthForColumnCount:(unsigned int)a3
{
  if (a3 <= 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = a3;
  }
  double v4 = [(SoundActionsPracticeViewController *)self contentView];
  [v4 bounds];
  float v6 = (v5 + -40.0 + (double)(v3 - 1) * -10.0) / (double)v3;
  double v7 = floorf(v6);

  return v7;
}

- (double)_itemHeight
{
  double result = self->_itemHeight;
  if (result == 0.0)
  {
    uint64_t v16 = 16;
    v17 = self;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unsigned int v3 = self->_sounds;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v19;
      double v7 = 0.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          NSAttributedStringKey v22 = NSFontAttributeName;
          id v10 = +[SoundActionsPracticeCollectionViewCell font];
          id v23 = v10;
          id v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

          v12 = [v9 name];
          [v12 sizeWithAttributes:v11];
          double v14 = v13;

          if (v14 > v7) {
            double v7 = v14;
          }
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }

    +[SoundActionsPracticeCollectionViewCell verticalPadding];
    double result = v7 + v15 * 2.0;
    *(double *)&v17->OBWelcomeController_opaque[v16] = result;
  }
  return result;
}

- (BOOL)_cellsWillTruncateAtWidth:(double)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_sounds;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        unsigned int v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "name", (void)v11);
        unsigned __int8 v9 = +[SoundActionsPracticeCollectionViewCell willTruncateForCellWidth:v8 withText:a3];

        if (v9)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (void)_traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(SoundActionsPracticeViewController *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];
  if (v6 != v7)
  {

LABEL_4:
    AXPerformBlockOnMainThread();
    goto LABEL_5;
  }
  unsigned int v8 = [(SoundActionsPracticeViewController *)self traitCollection];
  id v9 = [v8 legibilityWeight];
  id v10 = [v4 legibilityWeight];

  if (v9 != v10) {
    goto LABEL_4;
  }
LABEL_5:
}

id __64__SoundActionsPracticeViewController__traitCollectionDidChange___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = 0;
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  unsigned int v3 = *(void **)(a1 + 32);

  return [v3 _updateCollectionViewHeightConstraint];
}

- (void)_voiceOverStatusDidChange:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(SoundActionsPracticeViewController *)self _stopListening];
  }
  else
  {
    [(SoundActionsPracticeViewController *)self _startListening];
  }
}

- (void)_didFinishAnnouncement:(id)a3
{
  id v4 = [a3 userInfo];
  id v7 = [v4 objectForKey:UIAccessibilityAnnouncementKeyStringValue];

  id v5 = settingsLocString(@"SOUND_ACTION_PRACTICE_PAGE_ANNOUNCEMENT_ON", @"Accessibility");
  unsigned int v6 = [v7 isEqualToString:v5];

  if (v6) {
    [(SoundActionsPracticeViewController *)self _startListening];
  }
}

- (BOOL)accessibilityPerformMagicTap
{
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    id v4 = +[SoundActionsPracticeAudioManager sharedInstance];
    unsigned int v5 = [v4 isListening];

    if (v5)
    {
      [(SoundActionsPracticeViewController *)self _stopListening];
      UIAccessibilityNotifications v6 = UIAccessibilityAnnouncementNotification;
      id v7 = @"SOUND_ACTION_PRACTICE_PAGE_ANNOUNCEMENT_OFF";
    }
    else
    {
      UIAccessibilityNotifications v6 = UIAccessibilityAnnouncementNotification;
      id v7 = @"SOUND_ACTION_PRACTICE_PAGE_ANNOUNCEMENT_ON";
    }
    unsigned int v8 = settingsLocString(v7, @"Accessibility");
    UIAccessibilityPostNotification(v6, v8);
  }
  return IsVoiceOverRunning;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"SoundActionsCellReuseID" forIndexPath:v6];
  [v7 setCornerRadius:8.0];
  sounds = self->_sounds;
  id v9 = [v6 row];

  id v10 = [(NSArray *)sounds objectAtIndexedSubscript:v9];
  long long v11 = [v10 name];
  [v7 setText:v11];

  objc_msgSend(v7, "setAccessibilityTraits:", UIAccessibilityTraitPlaysSound | UIAccessibilityTraitButton | UIAccessibilityTraitStartsMediaSession | (unint64_t)objc_msgSend(v7, "accessibilityTraits"));
  long long v12 = settingsLocString(@"SOUND_ACTION_PRACTICE_PAGE_HINT", @"Accessibility");
  [v7 setAccessibilityHint:v12];

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sounds count];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  sounds = self->_sounds;
  id v7 = a4;
  id v8 = a3;
  id v9 = -[NSArray objectAtIndexedSubscript:](sounds, "objectAtIndexedSubscript:", [v7 row]);
  id v12 = [v9 soundURL];

  id v10 = +[SoundActionsPracticeAudioManager sharedInstance];
  [v10 playURL:v12];

  [v8 deselectItemAtIndexPath:v7 animated:1];
  id v11 = [v7 item];

  self->_lastRecognizedOrTappedSound = (int64_t)v11;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"SoundActionsHEADERReuseID" forIndexPath:a5];
  objc_storeStrong((id *)&self->_scrollingHeader, v6);

  return v6;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(SoundActionsPracticeViewController *)self _itemWidth];
  double v7 = v6;
  [(SoundActionsPracticeViewController *)self _itemHeight];
  double v9 = v8;
  double v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 20.0;
  double v7 = 0.0;
  double v8 = 20.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 10.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = [(SoundActionsPracticeViewController *)self contentView];
  [v5 bounds];
  double v7 = v6 + -40.0;
  +[SoundActionsPracticeVisualizerView desiredHeight];
  double v9 = v8 + 40.0;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v14 = a3;
  scrollingHeader = self->_scrollingHeader;
  [(SoundActionsHeader *)scrollingHeader bounds];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(SoundActionsPracticeViewController *)self scrollView];
  -[SoundActionsHeader convertPoint:toView:](scrollingHeader, "convertPoint:toView:", v9, v6, v8);
  double v11 = v10;

  [v14 contentOffset];
  if (v12 > 0.0)
  {
    [v14 contentOffset];
    [(SoundActionsHeader *)self->_staticHeader setHidden:v13 <= v11];
  }
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIButton)learnMoreButton
{
  return self->_learnMoreButton;
}

- (void)setLearnMoreButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_staticHeader, 0);
  objc_storeStrong((id *)&self->_scrollingHeader, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_sounds, 0);
}

@end