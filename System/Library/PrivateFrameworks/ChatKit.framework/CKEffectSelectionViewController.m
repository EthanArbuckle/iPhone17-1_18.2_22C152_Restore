@interface CKEffectSelectionViewController
+ (id)orderedEffectIdentifiers;
- (BOOL)becomeFirstResponder;
- (BOOL)labelUsesDarkVibrancy;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CKEffectSelectionViewControllerDelegate)delegate;
- (CKFullScreenEffectManager)fsem;
- (NSArray)sendEffects;
- (NSString)selectedEffectIdentifier;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIColor)labelColor;
- (double)maxCellHeight;
- (id)effectImageForIndexPath:(id)a3;
- (id)effectTitleForIndexPath:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFsem:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLabelUsesDarkVibrancy:(BOOL)a3;
- (void)setSelectedEffectIdentifier:(id)a3;
- (void)setSendEffects:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKEffectSelectionViewController

- (void)viewDidLoad
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)CKEffectSelectionViewController;
  [(CKEffectSelectionViewController *)&v32 viewDidLoad];
  v3 = objc_alloc_init(CKFullScreenEffectManager);
  [(CKEffectSelectionViewController *)self setFsem:v3];
  v34[0] = @"com.apple.MobileSMS.expressivesend.invisibleink";
  v34[1] = @"com.apple.MobileSMS.expressivesend.gentle";
  v34[2] = @"com.apple.MobileSMS.expressivesend.loud";
  v34[3] = @"com.apple.MobileSMS.expressivesend.impact";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  [(CKEffectSelectionViewController *)self setSendEffects:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [v5 setMinimumInteritemSpacing:0.0];
  [v5 setMinimumLineSpacing:0.0];
  [v5 setScrollDirection:1];
  objc_msgSend(v5, "setSectionInset:", 0.0, 8.0, 15.0, 8.0);
  id v6 = objc_alloc(MEMORY[0x1E4F42858]);
  v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKEffectSelectionViewController *)self setCollectionView:v7];

  v8 = [(CKEffectSelectionViewController *)self collectionView];
  [v8 setDelegate:self];

  v9 = [(CKEffectSelectionViewController *)self collectionView];
  v10 = [MEMORY[0x1E4F428B8] clearColor];
  [v9 setBackgroundColor:v10];

  v11 = [(CKEffectSelectionViewController *)self collectionView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(CKEffectSelectionViewController *)self collectionView];
  [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kEffectSelectionCellReuseIdentifier"];

  v13 = [(CKEffectSelectionViewController *)self collectionView];
  [v13 setShowsHorizontalScrollIndicator:1];

  v14 = [(CKEffectSelectionViewController *)self collectionView];
  [v14 setSelectionFollowsFocus:1];

  v15 = [(CKEffectSelectionViewController *)self view];
  v16 = [(CKEffectSelectionViewController *)self collectionView];
  [v15 addSubview:v16];

  v17 = [(CKEffectSelectionViewController *)self collectionView];
  v18 = [(CKEffectSelectionViewController *)self view];
  objc_msgSend(v17, "__ck_makeEdgesEqualTo:", v18);

  id location = 0;
  objc_initWeak(&location, self);
  id v19 = objc_alloc(MEMORY[0x1E4F42880]);
  v20 = [(CKEffectSelectionViewController *)self collectionView];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __46__CKEffectSelectionViewController_viewDidLoad__block_invoke;
  v29 = &unk_1E5625CD0;
  objc_copyWeak(&v30, &location);
  v21 = (void *)[v19 initWithCollectionView:v20 cellProvider:&v26];
  -[CKEffectSelectionViewController setDataSource:](self, "setDataSource:", v21, v26, v27, v28, v29);

  id v22 = objc_alloc_init(MEMORY[0x1E4F42650]);
  v33 = @"MainSectionIdentifier";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [v22 appendSectionsWithIdentifiers:v23];

  v24 = +[CKEffectSelectionViewController orderedEffectIdentifiers];
  [v22 appendItemsWithIdentifiers:v24 intoSectionWithIdentifier:@"MainSectionIdentifier"];

  v25 = [(CKEffectSelectionViewController *)self dataSource];
  [v25 applySnapshot:v22 animatingDifferences:0];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

id __46__CKEffectSelectionViewController_viewDidLoad__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 dequeueReusableCellWithReuseIdentifier:@"kEffectSelectionCellReuseIdentifier" forIndexPath:v5];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  v8 = [WeakRetained effectImageForIndexPath:v5];
  [v6 setImage:v8];

  id v9 = objc_loadWeakRetained(a1);
  v10 = [v9 effectTitleForIndexPath:v5];

  [v6 setTitle:v10];
  id v11 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "configureForEffectIsDark:", objc_msgSend(v11, "labelUsesDarkVibrancy"));

  [v6 setNeedsLayout];
  [v6 layoutIfNeeded];

  return v6;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(CKEffectSelectionViewController *)self collectionView];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (double)maxCellHeight
{
  if (*(double *)&maxCellHeight_maxHeight == 0.0)
  {
    char v3 = [(CKEffectSelectionViewController *)self dataSource];
    v4 = [(CKEffectSelectionViewController *)self collectionView];
    uint64_t v5 = [v3 numberOfSectionsInCollectionView:v4];

    if (v5)
    {
      unint64_t v6 = 0;
      do
      {
        for (unint64_t i = 0; ; ++i)
        {
          v8 = [(CKEffectSelectionViewController *)self dataSource];
          id v9 = [(CKEffectSelectionViewController *)self collectionView];
          unint64_t v10 = [v8 collectionView:v9 numberOfItemsInSection:v6];

          if (i >= v10) {
            break;
          }
          id v11 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:v6];
          v12 = [(CKEffectSelectionViewController *)self collectionView];
          v13 = [v12 dequeueReusableCellWithReuseIdentifier:@"kEffectSelectionCellReuseIdentifier" forIndexPath:v11];

          v14 = [(CKEffectSelectionViewController *)self effectTitleForIndexPath:v11];
          [v13 setTitle:v14];

          v15 = [v13 contentView];
          [v15 layoutIfNeeded];

          v16 = [v13 contentView];
          [v16 frame];
          double v18 = v17;

          uint64_t v19 = maxCellHeight_maxHeight;
          if (v18 >= *(double *)&maxCellHeight_maxHeight) {
            *(double *)&uint64_t v19 = v18;
          }
          maxCellHeight_maxHeight = v19;
        }
        ++v6;
        v20 = [(CKEffectSelectionViewController *)self dataSource];
        v21 = [(CKEffectSelectionViewController *)self collectionView];
        unint64_t v22 = [v20 numberOfSectionsInCollectionView:v21];
      }
      while (v6 < v22);
    }
  }
  return *(double *)&maxCellHeight_maxHeight;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(CKEffectSelectionViewController *)self dataSource];
  v7 = [v6 itemIdentifierForIndexPath:v5];

  v8 = [(CKEffectSelectionViewController *)self delegate];
  [v8 effectSelectionViewController:self didSelectEffectWithIdentifier:v7];

  id v9 = [(CKEffectSelectionViewController *)self fsem];
  unint64_t v10 = [v9 effectForIdentifier:v7];

  if (v10 && [v10 effectIsDark])
  {
    id v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 theme];
    v13 = [v12 fsmPickerPrimaryColorDarkEffect];
    [(CKEffectSelectionViewController *)self setLabelColor:v13];
  }
  else
  {
    id v11 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(CKEffectSelectionViewController *)self setLabelColor:v11];
  }

  double v19 = 0.0;
  double v20 = 0.0;
  v14 = [v10 backgroundColor];
  [v14 getHue:0 saturation:0 brightness:&v20 alpha:&v19];

  BOOL v15 = v19 > 0.5 && v20 < 0.5;
  -[CKEffectSelectionViewController setLabelUsesDarkVibrancy:](self, "setLabelUsesDarkVibrancy:", v15, v19);
  v16 = [(CKEffectSelectionViewController *)self collectionView];
  double v17 = [v16 visibleCells];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__CKEffectSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v18[3] = &unk_1E562C3C8;
  v18[4] = self;
  [v17 enumerateObjectsUsingBlock:v18];
}

void __75__CKEffectSelectionViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "configureForEffectIsDark:", objc_msgSend(v2, "labelUsesDarkVibrancy"));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [(CKEffectSelectionViewController *)self maxCellHeight];
  double v6 = v5;
  double v7 = 88.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)effectTitleForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKEffectSelectionViewController *)self dataSource];
  double v6 = [v5 itemIdentifierForIndexPath:v4];

  double v7 = [(CKEffectSelectionViewController *)self fsem];
  v8 = [v7 effectIdentifiers];
  int v9 = [v8 containsObject:v6];

  if (v9)
  {
    unint64_t v10 = [(CKEffectSelectionViewController *)self fsem];
    id v11 = [v10 localizedDisplayNameForEffectWithIdentifier:v6];
  }
  else
  {
    v12 = +[CKImpactEffectManager effectIdentifiers];
    int v13 = [v12 containsObject:v6];

    if (v13)
    {
      id v11 = +[CKImpactEffectManager localizedEffectNameForEffectWithIdentifier:v6];
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)effectImageForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CKEffectSelectionViewController *)self dataSource];
  double v6 = [v5 itemIdentifierForIndexPath:v4];

  double v7 = [MEMORY[0x1E4F42A80] ckImageNamed:v6];

  return v7;
}

- (NSString)selectedEffectIdentifier
{
  id v3 = [(CKEffectSelectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  double v5 = [v4 firstObject];

  double v6 = [(CKEffectSelectionViewController *)self dataSource];
  double v7 = [v6 itemIdentifierForIndexPath:v5];

  return (NSString *)v7;
}

- (void)setSelectedEffectIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(CKEffectSelectionViewController *)self collectionView];
  [v5 frame];
  BOOL v6 = CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28]);

  if (v6)
  {
    double v7 = [(CKEffectSelectionViewController *)self view];
    [v7 setNeedsLayout];

    v8 = [(CKEffectSelectionViewController *)self view];
    [v8 layoutIfNeeded];
  }
  int v9 = [(CKEffectSelectionViewController *)self dataSource];
  id v16 = [v9 indexPathForItemIdentifier:v4];

  unint64_t v10 = [(CKEffectSelectionViewController *)self collectionView];
  [v10 selectItemAtIndexPath:v16 animated:0 scrollPosition:0];

  id v11 = [(CKEffectSelectionViewController *)self collectionView];
  v12 = [v11 delegate];
  int v13 = [(CKEffectSelectionViewController *)self collectionView];
  [v12 collectionView:v13 didSelectItemAtIndexPath:v16];

  v14 = [(CKEffectSelectionViewController *)self collectionView];
  BOOL v15 = [v14 cellForItemAtIndexPath:v16];

  [v15 becomeFirstResponder];
}

+ (id)orderedEffectIdentifiers
{
  if (orderedEffectIdentifiers_onceToken != -1) {
    dispatch_once(&orderedEffectIdentifiers_onceToken, &__block_literal_global_257);
  }
  v2 = (void *)orderedEffectIdentifiers_effectIdentifiers;

  return v2;
}

void __59__CKEffectSelectionViewController_orderedEffectIdentifiers__block_invoke()
{
  v2[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.messages.effect.CKHeartEffect";
  v2[1] = @"com.apple.messages.effect.CKHappyBirthdayEffect";
  v2[2] = @"com.apple.MobileSMS.expressivesend.invisibleink";
  v2[3] = @"com.apple.messages.effect.CKConfettiEffect";
  v2[4] = @"com.apple.MobileSMS.expressivesend.impact";
  v2[5] = @"com.apple.messages.effect.CKLasersEffect";
  v2[6] = @"com.apple.MobileSMS.expressivesend.loud";
  v2[7] = @"com.apple.messages.effect.CKSparklesEffect";
  v2[8] = @"com.apple.messages.effect.CKEchoEffect";
  v2[9] = @"com.apple.messages.effect.CKSpotlightEffect";
  v2[10] = @"com.apple.messages.effect.CKFireworksEffect";
  v2[11] = @"com.apple.MobileSMS.expressivesend.gentle";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:12];
  v1 = (void *)orderedEffectIdentifiers_effectIdentifiers;
  orderedEffectIdentifiers_effectIdentifiers = v0;
}

- (CKEffectSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKEffectSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CKFullScreenEffectManager)fsem
{
  return self->_fsem;
}

- (void)setFsem:(id)a3
{
}

- (NSArray)sendEffects
{
  return self->_sendEffects;
}

- (void)setSendEffects:(id)a3
{
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
}

- (BOOL)labelUsesDarkVibrancy
{
  return self->_labelUsesDarkVibrancy;
}

- (void)setLabelUsesDarkVibrancy:(BOOL)a3
{
  self->_labelUsesDarkVibrancy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_sendEffects, 0);
  objc_storeStrong((id *)&self->_fsem, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end