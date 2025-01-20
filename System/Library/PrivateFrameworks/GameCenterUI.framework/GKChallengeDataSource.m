@interface GKChallengeDataSource
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKChallengeDataSource

- (void)setupCollectionView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKChallengeDataSource;
  id v4 = a3;
  [(GKDashboardChallengeDataSource *)&v6 setupCollectionView:v4];
  v5 = +[NSObject _gkNib];
  [v4 registerNib:v5 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"GKCollectionDataSourceHeader"];
  [v4 setDataSource:self];
  [v4 setDelegate:self];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)GKChallengeDataSource;
  id v6 = a4;
  v7 = [(GKDashboardChallengeDataSource *)&v21 collectionView:a3 cellForItemAtIndexPath:v6];
  objc_msgSend(v7, "setClipsToBounds:", 1, v21.receiver, v21.super_class);
  uint64_t v8 = *MEMORY[0x1E4F39EA8];
  v9 = [v7 layer];
  [v9 setCornerCurve:v8];

  v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0700000003];
  v11 = [v7 contentView];
  [v11 setBackgroundColor:v10];

  [v7 setDefaultContentBackgroundColor:v10];
  if ([v6 item]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 3;
  }
  uint64_t v13 = [v6 item];
  if (v13 == [(GKDashboardChallengeDataSource *)self itemCount] - 1) {
    uint64_t v14 = v12 | 0xC;
  }
  else {
    uint64_t v14 = v12;
  }
  v15 = [v7 layer];
  [v15 setMaskedCorners:v14];

  if (v14) {
    double v16 = 10.0;
  }
  else {
    double v16 = 0.0;
  }
  v17 = [v7 layer];
  [v17 setCornerRadius:v16];

  uint64_t v18 = [v6 row];
  if (v18 == [(GKDashboardChallengeDataSource *)self itemCount] - 1)
  {
    v19 = [v7 seperatorLine];
    [v19 setHidden:1];
  }

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4FB2770];
  if ([a4 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    v11 = [v8 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:@"GKCollectionDataSourceHeader" forIndexPath:v9];
    uint64_t v12 = -[GKCollectionDataSource headerTextForSection:](self, "headerTextForSection:", [v9 section]);
    uint64_t v13 = [v11 titleLabel];
    [v13 setText:v12];

    uint64_t v14 = [v11 secondaryLabel];
    [v14 setHidden:1];

    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [v11 setBackgroundColor:v15];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v5 = a3;
  +[GKDashboardPlayerCell defaultSize];
  double v7 = v6;
  id v8 = [v5 traitCollection];

  id v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory) {
    double v11 = v7 + v7;
  }
  else {
    double v11 = v7;
  }
  double v12 = 0.0;
  result.height = v11;
  result.width = v12;
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

@end