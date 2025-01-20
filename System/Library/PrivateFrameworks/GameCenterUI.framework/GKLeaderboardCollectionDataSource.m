@interface GKLeaderboardCollectionDataSource
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)cellSpacing;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)headerSpacing;
- (double)preferredCollectionHeight;
- (double)topMargin;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)allowedColumnCount:(int64_t)a3;
- (void)collectionView:(id)a3 updateLayoutForSectionHeader:(id)a4;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKLeaderboardCollectionDataSource

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[NSObject _gkNib];
  }
  v5 = +[NSObject _gkNib];
  [v4 registerNib:v10 forCellWithReuseIdentifier:@"leaderboardCollectionCell"];
  uint64_t v6 = *MEMORY[0x1E4FB2770];
  [v4 registerNib:v5 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"leaderboardListMetadataView"];
  v7 = (void *)MEMORY[0x1E4FB19F8];
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v7 nibWithNibName:@"GKLeaderboardCellAX_iOS" bundle:v8];
  [v4 registerNib:v9 forCellWithReuseIdentifier:@"leaderboardCollectionCellAX"];

  [v4 registerNib:v5 forSupplementaryViewOfKind:v6 withReuseIdentifier:@"leaderboardListMetadataViewAX"];
  [v4 setDataSource:self];
  [v4 setDelegate:self];
}

- (int64_t)allowedColumnCount:(int64_t)a3
{
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    if (a3 >= 4) {
      int64_t v5 = 4;
    }
    else {
      int64_t v5 = a3;
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    int64_t v8 = 6;
    if (a3 < 6) {
      int64_t v8 = a3;
    }
    uint64_t v9 = 4;
    uint64_t v10 = 2;
    if (v8 != 3) {
      uint64_t v10 = v8;
    }
    if (v8 != 5) {
      uint64_t v9 = v10;
    }
    if (v7 == 1) {
      int64_t v5 = v8;
    }
    else {
      int64_t v5 = v9;
    }
  }
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  v13 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  v14 = [v13 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);
  if (v12 == 1 || IsAccessibilityCategory) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = 2;
  }
  int64_t v18 = [(GKGameLayerCollectionDataSource *)self itemCount];
  if (v18 >= v5) {
    uint64_t v19 = v5;
  }
  else {
    uint64_t v19 = v18;
  }
  if (v17 <= v19) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = v17;
  }

  return v20;
}

- (double)preferredCollectionHeight
{
  return 95.0;
}

- (double)cellSpacing
{
  double v2 = 16.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 != 1)
    {
      int64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      unint64_t v6 = [v5 statusBarOrientation] - 1;

      if (v6 <= 1)
      {
        uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v7 bounds];
        if (v8 > 320.0) {
          double v2 = 16.0;
        }
        else {
          double v2 = 10.0;
        }
      }
    }
  }
  return v2;
}

- (double)headerSpacing
{
  if (GKIsXRUIIdiomShouldUsePadUI()) {
    return 32.0;
  }
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double result = 32.0;
  if (v4 != 1) {
    return 16.0;
  }
  return result;
}

- (double)topMargin
{
  double v2 = 8.0;
  if ((GKIsXRUIIdiomShouldUsePadUI() & 1) == 0)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 1) {
      return 42.0;
    }
    else {
      return 26.0;
    }
  }
  return v2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4FB2770];
  if ([a4 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    v11 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    uint64_t v12 = [v11 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory) {
      v14 = @"leaderboardListMetadataViewAX";
    }
    else {
      v14 = @"leaderboardListMetadataView";
    }
    id v15 = [v8 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v14 forIndexPath:v9];
    [(GKLeaderboardCollectionDataSource *)self updateHighlightsInSectionHeader:v15];
    [(GKLeaderboardCollectionDataSource *)self collectionView:v8 updateLayoutForSectionHeader:v15];
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1560]);
  }

  return v15;
}

- (void)collectionView:(id)a3 updateLayoutForSectionHeader:(id)a4
{
  id v5 = a4;
  [(GKLeaderboardCollectionDataSource *)self cellSpacing];
  double v7 = v6;
  id v8 = [v5 container];

  [v8 setSpacing:v7];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4FB1E20];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 currentTraitCollection];
  uint64_t v10 = [v9 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (IsAccessibilityCategory) {
    uint64_t v12 = @"leaderboardCollectionCellAX";
  }
  else {
    uint64_t v12 = @"leaderboardCollectionCell";
  }
  v13 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];

  [(GKGameLayerCollectionDataSource *)self prepareCell:v13 forItemAtIndexPath:v7];

  return v13;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = a3;
  id v7 = [v6 collectionViewLayout];
  id v8 = [GameLayerPageGrid alloc];
  [v6 bounds];
  double v10 = v9;
  double v12 = v11;
  v13 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  v14 = -[GameLayerPageGrid initWithSize:traitCollection:](v8, "initWithSize:traitCollection:", v13, v10, v12);

  [(GKGameLayerCollectionDataSource *)self standardCellSizeForCollectionView:v6];
  double v16 = v15;
  double v18 = v17;
  [(GKLeaderboardCollectionDataSource *)self cellSpacing];
  double v20 = v19;
  if ([v7 scrollDirection] == 1)
  {
    [v6 frame];
    double v22 = v21;
    v23 = [v6 superview];
    [v23 safeAreaInsets];
    double v25 = v22 - v24;
    v26 = [v6 superview];
    [v26 safeAreaInsets];
    double v28 = v25 - v27;

    double v29 = (v28 - v18) * 0.5;
    v30 = [v6 superview];
    [v30 safeAreaInsets];
    double v32 = v29 + v31;

    v33 = [v6 superview];
    [v33 safeAreaInsets];
    double v35 = v29 + v34;

    [(GKLeaderboardCollectionDataSource *)self headerSpacing];
    double v37 = v36;
    v38 = [v6 superview];
    [v38 safeAreaInsets];
    double v40 = v39 + 24.0;

    v41 = [v6 superview];
    [v41 safeAreaInsets];
    double v43 = v20 + v42;

    double v44 = 0.0;
  }
  else
  {
    [v6 bounds];
    double v46 = v45 / (v16 + v20);
    unint64_t v47 = vcvtmd_s64_f64(v46);
    if (v16 * (double)(uint64_t)(v47 + 1) + (double)(uint64_t)floor(v46) * v20 >= v45) {
      unint64_t v48 = v47;
    }
    else {
      unint64_t v48 = v47 + 1;
    }
    [(GKLeaderboardCollectionDataSource *)self allowedColumnCount:v48];
    v49 = [v6 superview];
    [v49 safeAreaInsets];
    double v51 = v50;
    [(GKLeaderboardCollectionDataSource *)self topMargin];
    double v32 = v51 + v52;

    [(GKLeaderboardCollectionDataSource *)self headerSpacing];
    double v44 = v53 - v20;
    v54 = [v6 superview];
    [v54 safeAreaInsets];
    double v35 = v20 + v55;

    [(GameLayerPageGrid *)v14 centeringInsets];
    double v40 = v56;
    [(GameLayerPageGrid *)v14 centeringInsets];
    double v43 = v57;
    double v37 = 0.0;
  }
  objc_msgSend(v6, "setContentInset:", v32, v40, v35, v43);

  double v58 = 0.0;
  double v59 = 0.0;
  double v60 = v44;
  double v61 = v37;
  result.right = v59;
  result.bottom = v58;
  result.left = v61;
  result.top = v60;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(GKLeaderboardCollectionDataSource *)self headerSpacing];
  double v11 = v10;
  [(GKLeaderboardCollectionDataSource *)self collectionView:v8 layout:v9 insetForSectionAtIndex:a5];
  double v13 = v12;
  double v15 = v14;

  double v16 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  double v17 = [v16 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v17))
  {
    double v18 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    if ([v18 horizontalSizeClass] == 1)
    {
      double v19 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
      BOOL v20 = [v19 verticalSizeClass] == 2;
    }
    else
    {
      BOOL v20 = 0;
    }

    [v8 bounds];
    double v22 = v24 - v13 - v15;
    if ([v17 isEqualToString:*MEMORY[0x1E4FB2778]])
    {
      double v25 = 504.0;
LABEL_14:
      double v30 = v11 + v25;
      goto LABEL_15;
    }
    if (![v17 isEqualToString:*MEMORY[0x1E4FB2780]])
    {
      if ([v17 isEqualToString:*MEMORY[0x1E4FB2788]])
      {
        double v25 = 424.0;
      }
      else
      {
        if ([v17 isEqualToString:*MEMORY[0x1E4FB2790]])
        {
          double v25 = 182.0;
          double v35 = 364.0;
        }
        else
        {
          double v25 = 162.0;
          double v35 = 324.0;
        }
        if (v20) {
          double v25 = v35;
        }
      }
      goto LABEL_14;
    }
    *(double *)&uint64_t v23 = 464.0;
LABEL_13:
    double v25 = *(double *)&v23;
    goto LABEL_14;
  }
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    [v8 bounds];
    double v22 = v21 - v13 - v15;
    *(double *)&uint64_t v23 = 50.0;
    goto LABEL_13;
  }
  v26 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v27 = [v26 userInterfaceIdiom];

  [v8 bounds];
  double v29 = v28;
  if (v27 == 1)
  {
    double v22 = v28 - v13 - v15;
    *(double *)&uint64_t v23 = 60.0;
    goto LABEL_13;
  }
  [v8 bounds];
  if (v29 < v33)
  {
    [v8 bounds];
    double v22 = v34 - v13 - v15;
    double v25 = 125.0;
    goto LABEL_14;
  }
  double v30 = 262.0;
  if ([v17 isEqualToString:*MEMORY[0x1E4FB27B8]])
  {
    double v22 = 210.0;
  }
  else if ([v17 isEqualToString:*MEMORY[0x1E4FB27B0]])
  {
    double v22 = 210.0;
  }
  else
  {
    double v22 = 162.0;
  }
LABEL_15:

  double v31 = v22;
  double v32 = v30;
  result.height = v32;
  result.width = v31;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v5 = a3;
  id v6 = [GameLayerPageGrid alloc];
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  double v12 = -[GameLayerPageGrid initWithSize:traitCollection:](v6, "initWithSize:traitCollection:", v11, v8, v10);

  [(GameLayerPageGrid *)v12 interColumnSpacing];
  double v14 = v13;

  return v14;
}

@end