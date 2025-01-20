@interface CARSettingsCollectionPanel
- (BOOL)needsScrollBar;
- (CARCollectionViewFlowLayout)collectionViewLayout;
- (NSArray)cellSpecifiers;
- (NSArray)specifierSections;
- (SettingsPanelCollectionSource)collectionSource;
- (UICollectionView)collectionView;
- (UIColor)backgroundColor;
- (UIEdgeInsets)effectiveSectionInset;
- (UIEdgeInsets)sectionInset;
- (double)calculatedCellHeight;
- (double)calculatedCellWidth;
- (double)minimumInteritemSpacing;
- (double)minimumLineSpacing;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)_reloadData;
- (void)reloadSpecifiers;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionSource:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewLayout:(id)a3;
- (void)setNeedsScrollBar:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CARSettingsCollectionPanel

- (void)viewDidLoad
{
  v71.receiver = self;
  v71.super_class = (Class)CARSettingsCollectionPanel;
  [(CARSettingsPanel *)&v71 viewDidLoad];
  v3 = [(CARSettingsCollectionPanel *)self specifierSections];

  v4 = [SettingsPanelCollectionSource alloc];
  if (v3)
  {
    v5 = [(CARSettingsCollectionPanel *)self specifierSections];
    v6 = [(SettingsPanelCollectionSource *)v4 initWithPanel:self sections:v5];
  }
  else
  {
    v5 = [(CARSettingsCollectionPanel *)self cellSpecifiers];
    v6 = [(SettingsPanelCollectionSource *)v4 initWithPanel:self specifiers:v5];
  }
  v7 = v6;
  [(CARSettingsCollectionPanel *)self setCollectionSource:v6];

  v8 = objc_alloc_init(CARCollectionViewFlowLayout);
  [(CARSettingsCollectionPanel *)self setCollectionViewLayout:v8];

  v9 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
  [v9 setItemSize:40.0, 40.0];

  [(CARSettingsCollectionPanel *)self effectiveSectionInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
  [v18 setSectionInset:v11, v13, v15, v17];

  [(CARSettingsCollectionPanel *)self minimumLineSpacing];
  double v20 = v19;
  v21 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
  [v21 setMinimumLineSpacing:v20];

  [(CARSettingsCollectionPanel *)self minimumInteritemSpacing];
  double v23 = v22;
  v24 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
  [v24 setMinimumInteritemSpacing:v23];

  id v25 = objc_alloc((Class)UICollectionView);
  v26 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
  id v27 = [v25 initWithFrame:v26 origin:CGRectZero.origin size:CGRectZero.size];
  [(CARSettingsCollectionPanel *)self setCollectionView:v27];

  v28 = [(CARSettingsCollectionPanel *)self collectionView];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(CARSettingsCollectionPanel *)self collectionSource];
  v30 = [(CARSettingsCollectionPanel *)self collectionView];
  [v30 setDataSource:v29];

  v31 = [(CARSettingsCollectionPanel *)self collectionSource];
  v32 = [(CARSettingsCollectionPanel *)self collectionView];
  [v32 setDelegate:v31];

  v33 = [(CARSettingsCollectionPanel *)self collectionView];
  uint64_t v34 = objc_opt_class();
  v35 = +[CARSettingsCollectionViewCell reuseIdentifier];
  [v33 registerClass:v34 forCellWithReuseIdentifier:v35];

  v36 = [(CARSettingsCollectionPanel *)self collectionView];
  uint64_t v37 = objc_opt_class();
  v38 = +[CARSettingsCollectionViewHeader reuseIdentifier];
  [v36 registerClass:v37 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v38];

  v39 = +[UIColor tableBackgroundColor];
  v40 = [(CARSettingsCollectionPanel *)self collectionView];
  [v40 setBackgroundColor:v39];

  v41 = [(CARSettingsCollectionPanel *)self view];
  v42 = [(CARSettingsCollectionPanel *)self collectionView];
  [v41 addSubview:v42];

  v70 = [(CARSettingsCollectionPanel *)self collectionView];
  v68 = [v70 topAnchor];
  v69 = [(CARSettingsCollectionPanel *)self view];
  v67 = [v69 safeAreaLayoutGuide];
  v66 = [v67 topAnchor];
  v65 = [v68 constraintEqualToAnchor:v66];
  v72[0] = v65;
  v64 = [(CARSettingsCollectionPanel *)self collectionView];
  v62 = [v64 leftAnchor];
  v63 = [(CARSettingsCollectionPanel *)self view];
  v61 = [v63 safeAreaLayoutGuide];
  v60 = [v61 leftAnchor];
  v59 = [v62 constraintEqualToAnchor:v60];
  v72[1] = v59;
  v58 = [(CARSettingsCollectionPanel *)self collectionView];
  v56 = [v58 rightAnchor];
  v57 = [(CARSettingsCollectionPanel *)self view];
  v55 = [v57 safeAreaLayoutGuide];
  v43 = [v55 rightAnchor];
  v44 = [v56 constraintEqualToAnchor:v43];
  v72[2] = v44;
  v45 = [(CARSettingsCollectionPanel *)self collectionView];
  v46 = [v45 bottomAnchor];
  v47 = [(CARSettingsCollectionPanel *)self view];
  v48 = [v47 safeAreaLayoutGuide];
  v49 = [v48 bottomAnchor];
  v50 = [v46 constraintEqualToAnchor:v49];
  v72[3] = v50;
  v51 = +[NSArray arrayWithObjects:v72 count:4];
  +[NSLayoutConstraint activateConstraints:v51];

  v52 = [(CARSettingsCollectionPanel *)self collectionView];
  [v52 reloadData];

  v53 = [(CARSettingsCollectionPanel *)self collectionView];
  [v53 setNeedsLayout];

  v54 = [(CARSettingsCollectionPanel *)self collectionView];
  [v54 layoutIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CARSettingsCollectionPanel;
  id v7 = a4;
  -[CARSettingsCollectionPanel viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025C1C;
  v8[3] = &unk_1000926E8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_100092728];
}

- (void)setBackgroundColor:(id)a3
{
  id v9 = a3;
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor || ([(UIColor *)backgroundColor isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    v6 = [(CARSettingsCollectionPanel *)self view];
    [v6 setBackgroundColor:v9];

    id v7 = +[UIColor clearColor];
    v8 = [(CARSettingsCollectionPanel *)self collectionView];
    [v8 setBackgroundColor:v7];
  }
}

- (void)reloadSpecifiers
{
  v3 = [(CARSettingsCollectionPanel *)self cellSpecifiers];
  v4 = [(CARSettingsCollectionPanel *)self collectionSource];
  [v4 setSpecifiers:v3];

  [(CARSettingsCollectionPanel *)self _reloadData];
}

- (double)calculatedCellWidth
{
  v3 = [(CARSettingsCollectionPanel *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  v6 = [(CARSettingsCollectionPanel *)self collectionView];
  [v6 safeAreaInsets];
  double v9 = v5 - (v7 + v8);

  [(CARSettingsCollectionPanel *)self effectiveSectionInset];
  double v12 = v9 - (v10 + v11);
  [(CARSettingsCollectionPanel *)self minimumInteritemSpacing];
  double v14 = v12 - v13 * (double)([(CARSettingsCollectionPanel *)self numberOfColumns] - 1);
  return v14 / (float)[(CARSettingsCollectionPanel *)self numberOfColumns];
}

- (double)calculatedCellHeight
{
  v3 = [(CARSettingsCollectionPanel *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  v6 = [(CARSettingsCollectionPanel *)self collectionView];
  [v6 safeAreaInsets];
  double v9 = v5 - (v7 + v8);

  [(CARSettingsCollectionPanel *)self effectiveSectionInset];
  double v12 = v9 - (v10 + v11);
  [(CARSettingsCollectionPanel *)self minimumLineSpacing];
  double v14 = v12 - v13 * (double)([(CARSettingsCollectionPanel *)self numberOfRows] - 1);
  return v14 / (float)[(CARSettingsCollectionPanel *)self numberOfRows];
}

- (unint64_t)numberOfColumns
{
  return 3;
}

- (unint64_t)numberOfRows
{
  return 3;
}

- (UIEdgeInsets)sectionInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (double)minimumInteritemSpacing
{
  return 0.0;
}

- (void)setNeedsScrollBar:(BOOL)a3
{
  if (self->_needsScrollBar != a3)
  {
    self->_needsScrollBar = a3;
    [(CARSettingsCollectionPanel *)self effectiveSectionInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(CARSettingsCollectionPanel *)self collectionViewLayout];
    [v12 setSectionInset:v5, v7, v9, v11];

    double v13 = [(CARSettingsCollectionPanel *)self collectionView];
    double v14 = [v13 collectionViewLayout];
    [v14 invalidateLayout];

    double v15 = [(CARSettingsCollectionPanel *)self collectionView];
    [v15 setNeedsLayout];

    id v16 = [(CARSettingsCollectionPanel *)self collectionView];
    [v16 layoutIfNeeded];
  }
}

- (UIEdgeInsets)effectiveSectionInset
{
  double v3 = [(CARSettingsPanel *)self panelController];
  double v4 = [v3 carSession];
  double v5 = [v4 configuration];
  unsigned int v6 = [v5 rightHandDrive];

  if (([(CARSettingsCollectionPanel *)self needsScrollBar] & v6) != 0) {
    double v7 = 45.0;
  }
  else {
    double v7 = 0.0;
  }
  if (([(CARSettingsCollectionPanel *)self needsScrollBar] & (v6 ^ 1)) != 0) {
    double v8 = 45.0;
  }
  else {
    double v8 = 0.0;
  }
  [(CARSettingsCollectionPanel *)self sectionInset];
  double v10 = v9;
  [(CARSettingsCollectionPanel *)self sectionInset];
  double v12 = v7 + v11;
  [(CARSettingsCollectionPanel *)self sectionInset];
  double v14 = v13;
  [(CARSettingsCollectionPanel *)self sectionInset];
  double v16 = v8 + v15;
  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  result.right = v16;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)_reloadData
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002615C;
  block[3] = &unk_100091F38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSArray)cellSpecifiers
{
  return self->_cellSpecifiers;
}

- (NSArray)specifierSections
{
  return self->_specifierSections;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CARCollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
}

- (SettingsPanelCollectionSource)collectionSource
{
  return self->_collectionSource;
}

- (void)setCollectionSource:(id)a3
{
}

- (BOOL)needsScrollBar
{
  return self->_needsScrollBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionSource, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_specifierSections, 0);

  objc_storeStrong((id *)&self->_cellSpecifiers, 0);
}

@end