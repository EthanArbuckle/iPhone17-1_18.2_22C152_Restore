@interface CKSyndicationSharedWithYouViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)maxContentSize;
- (NSArray)constraints;
- (NSArray)defaultAppBundleIDs;
- (UICollectionView)collectionView;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_appIconNameForBundleID:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)loadView;
- (void)setCollectionView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDefaultAppBundleIDs:(id)a3;
- (void)setMaxContentSize:(CGSize)a3;
- (void)updateViewConstraints;
@end

@implementation CKSyndicationSharedWithYouViewController

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)CKSyndicationSharedWithYouViewController;
  [(CKSyndicationSharedWithYouViewController *)&v15 loadView];
  v3 = [MEMORY[0x1E4F6EA28] onboardingAppBundleIDs];
  [(CKSyndicationSharedWithYouViewController *)self setDefaultAppBundleIDs:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  [(CKSyndicationSharedWithYouViewController *)self setView:v9];

  v10 = [(CKSyndicationSharedWithYouViewController *)self view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = objc_alloc_init(MEMORY[0x1E4F42890]);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42858]), "initWithFrame:collectionViewLayout:", v11, v5, v6, v7, v8);
  [(CKSyndicationSharedWithYouViewController *)self setCollectionView:v12];
  [v12 setDelegate:self];
  [v12 setDataSource:self];
  v13 = [MEMORY[0x1E4F428B8] clearColor];
  [v12 setBackgroundColor:v13];

  [v12 setClipsToBounds:0];
  [v12 setSemanticContentAttribute:3];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [(CKSyndicationSharedWithYouViewController *)self view];
  [v14 addSubview:v12];
}

- (void)setMaxContentSize:(CGSize)a3
{
  if (a3.width != self->_maxContentSize.width || a3.height != self->_maxContentSize.height)
  {
    self->_maxContentSize = a3;
    double v5 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
    double v6 = [v5 collectionViewLayout];
    [v6 invalidateLayout];

    id v7 = [(CKSyndicationSharedWithYouViewController *)self view];
    [v7 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v3 = [(CKSyndicationSharedWithYouViewController *)self constraints];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F28DC8];
    double v6 = [(CKSyndicationSharedWithYouViewController *)self constraints];
    [v5 deactivateConstraints:v6];
  }
  [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
  double v8 = v7;
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    double v9 = 0.45;
  }
  else
  {
    double v9 = 0.75;
    if (!CKIsRunningInMacCatalyst())
    {
      double v10 = v8 * 0.8;
      goto LABEL_9;
    }
  }
  [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
  double v10 = v11 * v9;
LABEL_9:
  v33 = [(CKSyndicationSharedWithYouViewController *)self view];
  v32 = [v33 widthAnchor];
  v31 = [v32 constraintEqualToConstant:v10];
  v35[0] = v31;
  v30 = [(CKSyndicationSharedWithYouViewController *)self view];
  v29 = [v30 heightAnchor];
  v28 = [v29 constraintEqualToConstant:v10];
  v35[1] = v28;
  v27 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
  v26 = [v27 widthAnchor];
  v25 = [v26 constraintEqualToConstant:v10];
  v35[2] = v25;
  v12 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
  v13 = [v12 heightAnchor];
  v14 = [v13 constraintEqualToConstant:v10];
  v35[3] = v14;
  objc_super v15 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
  v16 = [v15 centerXAnchor];
  v17 = [(CKSyndicationSharedWithYouViewController *)self view];
  v18 = [v17 centerXAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v35[4] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  [(CKSyndicationSharedWithYouViewController *)self setConstraints:v20];

  v21 = [(CKSyndicationSharedWithYouViewController *)self constraints];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(CKSyndicationSharedWithYouViewController *)self constraints];
    [v23 activateConstraints:v24];
  }
  v34.receiver = self;
  v34.super_class = (Class)CKSyndicationSharedWithYouViewController;
  [(CKSyndicationSharedWithYouViewController *)&v34 updateViewConstraints];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(CKSyndicationSharedWithYouViewController *)self defaultAppBundleIDs];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
  uint64_t v7 = objc_opt_class();
  double v8 = +[CKAppIconCollectionViewCell reuseIdentifier];
  [v6 registerClass:v7 forCellWithReuseIdentifier:v8];

  double v9 = [(CKSyndicationSharedWithYouViewController *)self collectionView];
  double v10 = +[CKAppIconCollectionViewCell reuseIdentifier];
  double v11 = [v9 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v5];

  v12 = [(CKSyndicationSharedWithYouViewController *)self defaultAppBundleIDs];
  uint64_t v13 = [v5 item];

  v14 = [v12 objectAtIndex:v13];

  int64_t v15 = [(CKSyndicationSharedWithYouViewController *)self _appIconNameForBundleID:v14];
  if (v15 != -1) {
    [v11 configureWithAppName:v15];
  }

  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v11 = v13 / 15.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v12 = v14 / 15.0;
  }
  else
  {
    int v6 = CKIsRunningInMacCatalyst();
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v8 = v7;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    if (v6) {
      double v10 = 8.5;
    }
    else {
      double v10 = 7.0;
    }
    double v11 = v8 / v10;
    double v12 = v9 / v10;
  }
  double v15 = v11;
  result.height = v12;
  result.width = v15;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    return v10 / 25.0;
  }
  else
  {
    int v6 = CKIsRunningInMacCatalyst();
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    if (v6) {
      double v8 = 35.0;
    }
    else {
      double v8 = 14.5;
    }
    return v7 / v8;
  }
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    return v10 / 25.0;
  }
  else
  {
    int v6 = CKIsRunningInMacCatalyst();
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double result = v7 / 14.5;
    double v9 = v7 / 10.0;
    if (v6) {
      return v9;
    }
  }
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v8 = v17 / 15.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v15 = v18 / 20.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v12 = v19 / 15.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v16 = v20 / 20.0;
  }
  else
  {
    int v6 = CKIsRunningInMacCatalyst();
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v8 = v7 / 7.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v10 = v9;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    double v12 = v11 / 7.0;
    [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
    if (v6) {
      double v14 = 10.0;
    }
    else {
      double v14 = 15.0;
    }
    double v15 = v10 / v14;
    double v16 = v13 / v14;
  }
  double v21 = v8;
  double v22 = v15;
  double v23 = v12;
  result.right = v16;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = a3;
  if (!IMSharedHelperDeviceIsiPad() || CKIsRunningInMacCatalyst()) {
    CKIsRunningInMacCatalyst();
  }
  [v6 frame];
  double v8 = v7;
  [(CKSyndicationSharedWithYouViewController *)self maxContentSize];
  double v10 = v9 / 40.0;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)_appIconNameForBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([v3 isEqualToString:@"com.apple.podcasts"])
    {
      int64_t v4 = 3;
    }
    else if ([v3 isEqualToString:@"com.apple.news"])
    {
      int64_t v4 = 5;
    }
    else if ([v3 isEqualToString:@"com.apple.mobileslideshow"])
    {
      int64_t v4 = 2;
    }
    else if ([v3 isEqualToString:@"com.apple.tv"])
    {
      int64_t v4 = 4;
    }
    else if ([v3 isEqualToString:@"com.apple.mobilesafari"])
    {
      int64_t v4 = 0;
    }
    else if ([v3 isEqualToString:@"com.apple.Music"])
    {
      int64_t v4 = 1;
    }
    else
    {
      int64_t v4 = -1;
    }
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (CGSize)maxContentSize
{
  double width = self->_maxContentSize.width;
  double height = self->_maxContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)defaultAppBundleIDs
{
  return self->_defaultAppBundleIDs;
}

- (void)setDefaultAppBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end