@interface NTKCCFacesViewController
+ (void)setDisplayDevice:(id)a3;
- (BOOL)_canTouchCollectionView;
- (BOOL)_complicationsAreLoaded;
- (BOOL)libraryDetail:(id)a3 canRemoveFace:(id)a4;
- (BOOL)visible;
- (CGSize)faceSize;
- (NSLayoutConstraint)collectionViewHeightConstraint;
- (NSMutableArray)faceVCs;
- (NTKCCFacesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NTKCCLibraryListViewController)presentedListVC;
- (NTKCFaceDetailViewController)presentedDetailVC;
- (NTKFaceCollection)library;
- (UIButton)editButton;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)layout;
- (UILabel)titleLabel;
- (UIStackView)headerView;
- (UIView)topSeparatorView;
- (id)_detailViewControllerForIndexPath:(id)a3;
- (id)_viewControllerForFace:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_activeDeviceChanged;
- (void)_clearFaceViewControllers;
- (void)_clearSelectionsAnimated:(BOOL)a3;
- (void)_complicationsDidLoad;
- (void)_configureLayout;
- (void)_editDoneTapped;
- (void)_editTapped;
- (void)_faceAddedFromGallery:(id)a3;
- (void)_faceAddedFromGreenfield:(id)a3;
- (void)_fontSizeDidChange;
- (void)_loadLibrary;
- (void)_popDetailViewControllerAnimated:(BOOL)a3;
- (void)_popLibraryDetailViewControllerForFace:(id)a3;
- (void)_pushDetailViewController:(id)a3 animated:(BOOL)a4;
- (void)_reloadAllFacesForCollectionView;
- (void)_reloadFaces;
- (void)_removeViewControllerForFace:(id)a3;
- (void)_resetCollectionView;
- (void)_scrollToFace:(id)a3;
- (void)_showBearTrap;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)faceCollectionDidReorderFaces:(id)a3;
- (void)faceCollectionDidReset:(id)a3;
- (void)faceConfigurationDidChange:(id)a3;
- (void)libraryDetail:(id)a3 didRemoveFace:(id)a4;
- (void)libraryDetail:(id)a3 didSelectFace:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewHeightConstraint:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setFaceSize:(CGSize)a3;
- (void)setFaceVCs:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setPresentedDetailVC:(id)a3;
- (void)setPresentedListVC:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopSeparatorView:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)upgradeManager:(id)a3 didCompleteWithFace:(id)a4 error:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKCCFacesViewController

- (void)setLibrary:(id)a3
{
  v5 = (NTKFaceCollection *)a3;
  p_library = (id *)&self->_library;
  if (self->_library != v5)
  {
    v7 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if ([(NTKFaceCollection *)v5 hasLoaded]) {
        CFStringRef v8 = @"HAS";
      }
      else {
        CFStringRef v8 = @"HAS NOT";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v20 = v8;
      __int16 v21 = 2048;
      id v22 = [(NTKFaceCollection *)v5 numberOfFaces];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "new library. %@ been loaded with %lu faces", buf, 0x16u);
    }

    id v9 = *p_library;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_741C;
    v18[3] = &unk_247C0;
    v18[4] = self;
    [v9 enumerateFacesUsingBlock:v18];
    [*p_library removeObserver:self];
    objc_storeStrong((id *)&self->_library, a3);
    [*p_library addObserver:self];
    [(NTKCCFacesViewController *)self _reloadFaces];
    [(NTKCCFacesViewController *)self _resetCollectionView];
    -[UICollectionView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    uint64_t v10 = [(NTKCCFacesViewController *)self presentedViewController];
    if (!v10) {
      goto LABEL_13;
    }
    v11 = (void *)v10;
    v12 = [(NTKCCFacesViewController *)self presentedViewController];
    v13 = v12;
    if (v12 == self->_presentedDetailVC)
    {
    }
    else
    {
      v14 = [(NTKCCFacesViewController *)self presentedViewController];
      v15 = [v14 childViewControllers];
      v16 = [v15 firstObject];
      presentedListVC = self->_presentedListVC;

      if (v16 != presentedListVC)
      {
LABEL_13:
        [(NTKCCFacesViewController *)self _popDetailViewControllerAnimated:1];
        goto LABEL_14;
      }
    }
    [(NTKCCFacesViewController *)self _editDoneTapped];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCFacesViewController;
  [(NTKCCFacesViewController *)&v4 viewDidAppear:a3];
  [(NTKCCFacesViewController *)self setVisible:1];
  [(NTKCCFacesViewController *)self _popDetailViewControllerAnimated:0];
}

- (void)_clearSelectionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) animated:v3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unsigned __int8 v5 = [(NTKCCFacesViewController *)self _complicationsAreLoaded];
  id v6 = _NTKLoggingObjectForDomain();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = [(NTKFaceCollection *)self->_library numberOfFaces];
      int v10 = 134217984;
      id v11 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[_library numberOfFaces] = %lu", (uint8_t *)&v10, 0xCu);
    }

    return (int64_t)[(NTKFaceCollection *)self->_library numberOfFaces];
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Collection view datasource returning zero items for section because complications are not loaded yet.", (uint8_t *)&v10, 2u);
    }

    return 0;
  }
}

- (void)_loadLibrary
{
  id v5 = +[NTKCompanionFaceCollectionsManager sharedInstance];
  BOOL v3 = +[CLKDevice currentDevice];
  objc_super v4 = [v5 sharedFaceCollectionForDevice:v3 forCollectionIdentifier:NTKCollectionIdentifierLibraryFaces];
  [(NTKCCFacesViewController *)self setLibrary:v4];
}

- (BOOL)_complicationsAreLoaded
{
  v2 = +[NTKCompanionRemoteComplicationManager sharedInstance];
  unsigned __int8 v3 = [v2 loaded];

  objc_super v4 = +[NTKCompanionBundleComplicationSyncCoordinator sharedInstance];
  unsigned __int8 v5 = [v4 loaded];

  id v6 = +[CLKDevice currentDevice];
  BOOL v7 = +[NTKCompanionWidgetComplicationManager instanceForDevice:v6];
  unsigned __int8 v8 = [v7 loaded];

  return v3 & v5 & v8;
}

- (void)_configureLayout
{
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1, sub_5D90((uint64_t)&v32).n128_f64[0]);
  if (_os_feature_enabled_impl())
  {
    unsigned __int8 v3 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
    objc_super v4 = [v3 textProperties];
    unsigned __int8 v5 = [v4 font];
    [(UILabel *)self->_titleLabel setFont:v5];

    id v6 = [v3 textProperties];
    BOOL v7 = [v6 color];
    [(UILabel *)self->_titleLabel setTextColor:v7];
  }
  else
  {
    unsigned __int8 v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)self->_titleLabel setFont:v3];
  }

  unsigned __int8 v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v9 = [(UIButton *)self->_editButton titleLabel];
  [v9 setFont:v8];

  [(UIStackView *)self->_headerView setAxis:0];
  [(UIStackView *)self->_headerView setAlignment:2];
  [(UIStackView *)self->_headerView setDistribution:3];
  [(UIStackView *)self->_headerView setSpacing:8.0];
  -[UIStackView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v11 = v10;
  long long v12 = [(NTKCCFacesViewController *)self view];
  [v12 bounds];
  CGFloat v13 = CGRectGetWidth(v42) + *((double *)&v32 + 1) * -2.0;

  if (v11 > v13)
  {
    [(UIStackView *)self->_headerView setAxis:1];
    [(UIStackView *)self->_headerView setAlignment:1];
    [(UIStackView *)self->_headerView setDistribution:0];
    [(UIStackView *)self->_headerView setSpacing:0.0];
    [(UILabel *)self->_titleLabel setNumberOfLines:0];
  }
  double v14 = *((double *)&v35 + 1);
  double v15 = *(double *)&v36;
  +[NTKCFaceContainerView faceSizeForSize:style:](NTKCFaceContainerView, "faceSizeForSize:style:", 1, *((double *)&v35 + 1), *(double *)&v36);
  -[NTKCCFacesViewController setFaceSize:](self, "setFaceSize:");
  v16 = [(NTKCCFacesViewController *)self traitCollection];
  v17 = [v16 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

  double v19 = v14 * 0.5;
  if (!IsAccessibilityCategory) {
    double v19 = -0.0;
  }
  double v20 = v14 + v19;
  double v21 = *(double *)&v33;
  double v22 = v15 + *(double *)&v33;
  id v31 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v31 _scaledValueForValue:*(double *)&v37];
  double v24 = v23;
  [v31 _scaledValueForValue:v21];
  double v26 = v25;
  v27 = objc_opt_new();
  HIDWORD(v28) = HIDWORD(v40);
  *(float *)&double v28 = *((double *)&v40 + 1);
  [v27 setHyphenationFactor:v28];
  NTKMaxLineHeightDeltaForEnumeratableFaceCollection();
  double v30 = v22 + v24 + v26 + v29;
  [(NSLayoutConstraint *)self->_collectionViewHeightConstraint setConstant:v30];
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v20, v30);
}

- (NTKCCFacesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKCCFacesViewController;
  objc_super v4 = [(NTKCCFacesViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_activeDeviceChanged" name:CLKActiveDeviceChangedNotification object:0];
    [v5 addObserver:v4 selector:"_faceAddedFromGallery:" name:NTKCFaceDetailViewControllerDidAddFace object:0];
    [v5 addObserver:v4 selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
    [v5 addObserver:v4 selector:"_complicationsDidLoad" name:NTKCompanionRemoteComplicationManagerDidLoadNotification object:0];
    [v5 addObserver:v4 selector:"_complicationsDidLoad" name:NTKCompanionWidgetComplicationManagerDidLoadNotification object:0];
    [v5 addObserver:v4 selector:"_complicationsDidLoad" name:NTKCompanionBundleComplicationManagerDidLoadNotification object:0];
    [v5 addObserver:v4 selector:"_faceAddedFromGreenfield:" name:NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification object:0];
    [(NTKCCFacesViewController *)v4 _loadLibrary];
  }
  return v4;
}

- (void)viewDidLoad
{
  v76.receiver = self;
  v76.super_class = (Class)NTKCCFacesViewController;
  [(NTKCCFacesViewController *)&v76 viewDidLoad];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  memset(v71, 0, sizeof(v71));
  sub_5D90((uint64_t)v71);
  if (_os_feature_enabled_impl()) {
    BPSBackgroundColor();
  }
  else {
  unsigned __int8 v3 = BPSForegroundColor();
  }
  objc_super v4 = [(NTKCCFacesViewController *)self view];
  [v4 setBackgroundColor:v3];

  unsigned __int8 v5 = objc_opt_new();
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v6 = BPSBackgroundColor();
    [v5 setBackgroundColor:v6];
  }
  objc_super v7 = [(NTKCCFacesViewController *)self view];
  [v7 addSubview:v5];

  unsigned __int8 v8 = objc_opt_new();
  [(NTKCCFacesViewController *)self setHeaderView:v8];

  [v5 addSubview:self->_headerView];
  id v9 = objc_opt_new();
  [(NTKCCFacesViewController *)self setTitleLabel:v9];

  double v10 = NTKCCustomizationLocalizedString();
  if (_os_feature_enabled_impl())
  {
    [(UILabel *)self->_titleLabel setText:v10];
  }
  else
  {
    double v11 = +[UIColor systemGrayColor];
    [(UILabel *)self->_titleLabel setTextColor:v11];

    long long v12 = [v10 localizedUppercaseString];
    [(UILabel *)self->_titleLabel setText:v12];
  }
  [(UILabel *)self->_titleLabel setLineBreakMode:0];
  LODWORD(v13) = 1045220557;
  [(UILabel *)self->_titleLabel _setHyphenationFactor:v13];
  [(UIStackView *)self->_headerView addArrangedSubview:self->_titleLabel];
  double v14 = objc_opt_new();
  [(NTKCCFacesViewController *)self setLayout:v14];

  [(UICollectionViewFlowLayout *)self->_layout _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
  [(UICollectionViewFlowLayout *)self->_layout setScrollDirection:1];
  [(UICollectionViewFlowLayout *)self->_layout setMinimumLineSpacing:15.0];
  id v15 = objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_layout, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(NTKCCFacesViewController *)self setCollectionView:v15];

  collectionView = self->_collectionView;
  uint64_t v17 = objc_opt_class();
  v18 = +[_NTKCCFacesCollectionCell classicReuseIdentifier];
  [(UICollectionView *)collectionView registerClass:v17 forCellWithReuseIdentifier:v18];

  double v19 = self->_collectionView;
  uint64_t v20 = objc_opt_class();
  double v21 = +[_NTKCCFacesCollectionCell luxoReuseIdentifier];
  [(UICollectionView *)v19 registerClass:v20 forCellWithReuseIdentifier:v21];

  double v22 = self->_collectionView;
  uint64_t v23 = objc_opt_class();
  double v24 = +[_NTKCCFacesCollectionCell aloeReuseIdentifier];
  [(UICollectionView *)v22 registerClass:v23 forCellWithReuseIdentifier:v24];

  double v25 = self->_collectionView;
  uint64_t v26 = objc_opt_class();
  v27 = +[_NTKCCFacesCollectionCell agaveReuseIdentifier];
  [(UICollectionView *)v25 registerClass:v26 forCellWithReuseIdentifier:v27];

  double v28 = self->_collectionView;
  uint64_t v29 = objc_opt_class();
  double v30 = +[_NTKCCFacesCollectionCell avoniaReuseIdentifier];
  [(UICollectionView *)v28 registerClass:v29 forCellWithReuseIdentifier:v30];

  id v31 = [(NTKCCFacesViewController *)self view];
  long long v32 = [v31 backgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v32];

  [(UICollectionView *)self->_collectionView setIndicatorStyle:2];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  long long v33 = self->_collectionView;
  id v34 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(UICollectionView *)v33 addInteraction:v34];

  [(UICollectionView *)self->_collectionView contentInset];
  double v35 = *((double *)v71 + 1);
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:");
  long long v36 = [(NTKCCFacesViewController *)self view];
  [v36 addSubview:self->_collectionView];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    long long v37 = objc_opt_new();
    [(NTKCCFacesViewController *)self setTopSeparatorView:v37];

    long long v38 = BPSSeparatorColor();
    [(UIView *)self->_topSeparatorView setBackgroundColor:v38];

    long long v39 = [(NTKCCFacesViewController *)self view];
    [v39 addSubview:self->_topSeparatorView];
  }
  long long v40 = +[UIButton buttonWithType:1];
  [(NTKCCFacesViewController *)self setEditButton:v40];

  v41 = BPSBridgeTintColor();
  [(UIButton *)self->_editButton setTintColor:v41];

  editButton = self->_editButton;
  v43 = NTKCCustomizationLocalizedString();
  [(UIButton *)editButton setTitle:v43 forState:0];

  [(UIButton *)self->_editButton addTarget:self action:"_editTapped" forControlEvents:64];
  v44 = [(UIButton *)self->_editButton titleLabel];
  LODWORD(v45) = 1144750080;
  [v44 setContentCompressionResistancePriority:0 forAxis:v45];

  [(UIButton *)self->_editButton setContentHorizontalAlignment:4];
  [(UIStackView *)self->_headerView addArrangedSubview:self->_editButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(UIView *)self->_topSeparatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v46 = +[NSMutableArray array];
  char v47 = _os_feature_enabled_impl();
  headerView = self->_headerView;
  if (v47) {
    _NSDictionaryOfVariableBindings(@"backgroundView, _headerView, _collectionView", v5, headerView, self->_collectionView, 0);
  }
  else {
  uint64_t v49 = _NSDictionaryOfVariableBindings(@"backgroundView, _headerView, _collectionView, _topSeparatorView", v5, headerView, self->_collectionView, self->_topSeparatorView, 0);
  }
  v50 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[backgroundView]|" options:0 metrics:0 views:v49];
  [v46 addObjectsFromArray:v50];

  v70 = v5;
  v69 = (void *)v49;
  if (_os_feature_enabled_impl())
  {
    v51 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backgroundView][_collectionView]" options:96 metrics:0 views:v49];
    [v46 addObjectsFromArray:v51];
  }
  else
  {
    CFStringRef v81 = @"SeparatorHeight";
    [(UIView *)self->_topSeparatorView intrinsicContentSize];
    v51 = +[NSNumber numberWithDouble:-v52];
    v82 = v51;
    v53 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    v54 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[backgroundView][_topSeparatorView]-(SeparatorHeight)-[_collectionView]", 96, v53, v49);
    [v46 addObjectsFromArray:v54];
  }
  v55 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v56 = [(NTKCCFacesViewController *)self view];
  v57 = [v56 bottomAnchor];
  v58 = [v55 constraintEqualToAnchor:v57];

  LODWORD(v59) = 1132068864;
  [v58 setPriority:v59];
  [v46 addObject:v58];
  v79[0] = @"MarginLeading";
  v60 = +[NSNumber numberWithDouble:v35];
  v79[1] = @"MarginTrailing";
  v80[0] = v60;
  v61 = +[NSNumber numberWithDouble:v35 - *(double *)&v73];
  v80[1] = v61;
  v62 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
  v63 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-MarginLeading-[_headerView]-MarginTrailing-|", 0, v62, v69);
  [v46 addObjectsFromArray:v63];

  CFStringRef v77 = @"HeaderVerticalMargin";
  v64 = +[NSNumber numberWithDouble:*((double *)&v72 + 1)];
  v78 = v64;
  v65 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v66 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(HeaderVerticalMargin)-[_headerView]|", 0, v65, v69);
  [v46 addObjectsFromArray:v66];

  v67 = [(UICollectionView *)self->_collectionView heightAnchor];
  v68 = [v67 constraintEqualToConstant:0.0];
  [(NTKCCFacesViewController *)self setCollectionViewHeightConstraint:v68];

  [v46 addObject:self->_collectionViewHeightConstraint];
  [(NTKCCFacesViewController *)self _configureLayout];
  +[NSLayoutConstraint activateConstraints:v46];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKCCFacesViewController;
  -[NTKCCFacesViewController viewWillAppear:](&v5, "viewWillAppear:");
  [(NTKCCFacesViewController *)self _clearSelectionsAnimated:v3];
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setPresentedDetailVC:(id)a3
{
}

- (void)setLayout:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (void)setFaceSize:(CGSize)a3
{
  self->_faceSize = a3;
}

- (void)setEditButton:(id)a3
{
}

- (void)setCollectionViewHeightConstraint:(id)a3
{
}

- (void)setCollectionView:(id)a3
{
}

- (void)_popDetailViewControllerAnimated:(BOOL)a3
{
  if (self->_presentedDetailVC)
  {
    BOOL v4 = a3;
    objc_super v5 = [(NTKCCFacesViewController *)self parentViewController];
    id v6 = [v5 navigationController];
    objc_super v7 = [v6 viewControllers];
    unsigned int v8 = [v7 containsObject:self->_presentedDetailVC];

    if (v8)
    {
      id v9 = [(NTKCCFacesViewController *)self parentViewController];
      double v10 = [v9 navigationController];
      id v11 = [v10 popToViewController:self->_presentedDetailVC animated:0];

      long long v12 = [(NTKCCFacesViewController *)self parentViewController];
      double v13 = [v12 navigationController];
      id v14 = [v13 popViewControllerAnimated:v4];
    }
  }

  [(NTKCCFacesViewController *)self setPresentedDetailVC:0];
}

+ (void)setDisplayDevice:(id)a3
{
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CLKActiveDeviceChangedNotification object:0];
  [v3 removeObserver:self name:NTKCFaceDetailViewControllerDidAddFace object:0];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
  [v3 removeObserver:self name:NTKCompanionRemoteComplicationManagerDidLoadNotification object:0];
  [v3 removeObserver:self name:NTKCompanionWidgetComplicationManagerDidLoadNotification object:0];
  [v3 removeObserver:self name:NTKGreenfieldAddWatchFaceManagerDidAddFaceNotification object:0];
  [(NTKCCFacesViewController *)self setLibrary:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCCFacesViewController;
  [(NTKCCFacesViewController *)&v4 dealloc];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCCFacesViewController;
  [(NTKCCFacesViewController *)&v4 viewDidDisappear:a3];
  [(NTKCCFacesViewController *)self setVisible:0];
}

- (void)_activeDeviceChanged
{
  [(NTKCCFacesViewController *)self _clearFaceViewControllers];

  [(NTKCCFacesViewController *)self _loadLibrary];
}

- (BOOL)_canTouchCollectionView
{
  [(UICollectionView *)self->_collectionView bounds];
  BOOL IsEmpty = CGRectIsEmpty(v10);
  unsigned __int8 v4 = [(NTKCCFacesViewController *)self _complicationsAreLoaded];
  if (IsEmpty)
  {
    objc_super v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "collectionView not yet laid out - suppressing modifications", buf, 2u);
    }
  }
  if ((v4 & 1) == 0)
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "complications are not loaded yet - suppressing modifications", v8, 2u);
    }
  }
  return v4 & ~IsEmpty;
}

- (void)_resetCollectionView
{
  BOOL v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "resetting the collectionView", v4, 2u);
  }

  [(UICollectionView *)self->_collectionView reloadData];
}

- (void)_faceAddedFromGallery:(id)a3
{
  id v4 = [a3 object];
  [(NTKCCFacesViewController *)self _scrollToFace:v4];
}

- (void)_faceAddedFromGreenfield:(id)a3
{
  id v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(NTKFaceCollection *)self->_library facesByUUID];
    objc_super v5 = [v4 objectForKey:v6];
    [(NTKCCFacesViewController *)self _scrollToFace:v5];
  }
}

- (void)_scrollToFace:(id)a3
{
  id v8 = a3;
  if ([(NTKCCFacesViewController *)self _canTouchCollectionView])
  {
    id v4 = [(NTKFaceCollection *)self->_library indexOfFace:v8];
    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = v4;
      if (v4 < (id)[(UICollectionView *)self->_collectionView numberOfItemsInSection:0])
      {
        collectionView = self->_collectionView;
        objc_super v7 = +[NSIndexPath indexPathForItem:v5 inSection:0];
        [(UICollectionView *)collectionView scrollToItemAtIndexPath:v7 atScrollPosition:16 animated:self->_visible];
      }
    }
  }
}

- (void)_editTapped
{
  id v6 = (id)objc_opt_new();
  id v3 = [objc_alloc((Class)NTKCNavigationController) initWithRootViewController:v6];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_editDoneTapped"];
  id v5 = [v6 navigationItem];
  [v5 setRightBarButtonItem:v4];

  [v6 setEditing:1 animated:0];
  [(NTKCCFacesViewController *)self setPresentedListVC:v6];
  [(NTKCCFacesViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)_editDoneTapped
{
  [(NTKCCFacesViewController *)self setPresentedListVC:0];

  [(NTKCCFacesViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_reloadFaces
{
  library = self->_library;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7968;
  v3[3] = &unk_247C0;
  v3[4] = self;
  [(NTKFaceCollection *)library enumerateFacesUsingBlock:v3];
}

- (void)_popLibraryDetailViewControllerForFace:(id)a3
{
  id v4 = a3;
  presentedDetailVC = self->_presentedDetailVC;
  if (presentedDetailVC)
  {
    id v7 = v4;
    id v6 = [(NTKCFaceDetailViewController *)presentedDetailVC face];

    if (v6 == v7) {
      [(NTKCCFacesViewController *)self _popDetailViewControllerAnimated:1];
    }
  }

  _objc_release_x1();
}

- (void)_clearFaceViewControllers
{
}

- (id)_viewControllerForFace:(id)a3
{
  id v4 = a3;
  faceVCs = self->_faceVCs;
  if (!faceVCs)
  {
    id v6 = objc_opt_new();
    [(NTKCCFacesViewController *)self setFaceVCs:v6];

    faceVCs = self->_faceVCs;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = faceVCs;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      objc_msgSend(v12, "face", (void)v16);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v4) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v14 = v12;

    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  id v14 = [objc_alloc((Class)NTKCompanionFaceViewController) initWithFace:v4];
  [(NSMutableArray *)self->_faceVCs addObject:v14];
LABEL_14:

  return v14;
}

- (void)_removeViewControllerForFace:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_faceVCs;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "face", (void)v13);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    long long v12 = v10;

    if (!v12) {
      goto LABEL_13;
    }
    [(NSMutableArray *)self->_faceVCs removeObject:v12];
    id v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (id)_detailViewControllerForIndexPath:(id)a3
{
  id v4 = -[NTKFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", [a3 item]);
  id v5 = [v4 libraryDetailViewController];
  [v5 setDelegate:self];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  collectionView = self->_collectionView;
  id v6 = a4;
  id v7 = +[_NTKCCFacesCollectionCell reuseIdentifier];
  uint64_t v8 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v6];

  objc_msgSend(v8, "setFaceSize:", self->_faceSize.width, self->_faceSize.height);
  [v8 setSelected:0];
  library = self->_library;
  id v10 = [v6 item];

  id v11 = [(NTKFaceCollection *)library faceAtIndex:v10];
  long long v12 = [(NTKCCFacesViewController *)self _viewControllerForFace:v11];
  long long v13 = [v12 faceView];
  [v8 setFaceView:v13];

  long long v14 = [v11 name];
  [v8 setName:v14];

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = -[NTKFaceCollection faceAtIndex:](self->_library, "faceAtIndex:", [v6 item]);
  uint64_t v8 = [v7 bundleIdentifierForUpgrade];

  if (v8)
  {
    uint64_t v9 = +[NTKFaceBundleManager sharedManager];
    id v10 = [v7 bundleIdentifierForUpgrade];
    id v11 = +[CLKDevice currentDevice];
    long long v12 = [v9 faceBundleForBundleIdentifier:v10 onDevice:v11];

    id v13 = [v12 faceClass];
    long long v14 = +[CLKDevice currentDevice];
    long long v15 = [v13 upgradeManagerWithFace:v7 forDevice:v14];

    if ([v15 canUpgradeFace])
    {
      uint64_t v16 = [v15 upgradeFlowViewControllerWithDelegate:self];
      if (v16)
      {
        long long v17 = (void *)v16;
        objc_msgSend(v15, "setUpgradingFaceIndex:", objc_msgSend(v6, "item"));
        [(NTKCCFacesViewController *)self presentViewController:v17 animated:1 completion:0];
        [v18 deselectItemAtIndexPath:v6 animated:1];

        goto LABEL_7;
      }
    }
  }
  long long v12 = [(NTKCCFacesViewController *)self _detailViewControllerForIndexPath:v6];
  [(NTKCCFacesViewController *)self _pushDetailViewController:v12 animated:1];
LABEL_7:
}

- (void)_pushDetailViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(NTKCCFacesViewController *)self setPresentedDetailVC:v5];
  id v7 = [(NTKCCFacesViewController *)self parentViewController];
  id v6 = [v7 navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (BOOL)libraryDetail:(id)a3 canRemoveFace:(id)a4
{
  return (unint64_t)[(NTKFaceCollection *)self->_library numberOfFaces] > 1;
}

- (void)libraryDetail:(id)a3 didRemoveFace:(id)a4
{
  id v5 = a4;
  if ([(NTKFaceCollection *)self->_library containsFace:v5])
  {
    id v6 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "user removing face %@ from library", (uint8_t *)&v7, 0xCu);
    }

    [(NTKFaceCollection *)self->_library removeFace:v5 suppressingCallbackToObserver:0];
    [(NTKCCFacesViewController *)self _popLibraryDetailViewControllerForFace:v5];
  }
}

- (void)libraryDetail:(id)a3 didSelectFace:(id)a4
{
  id v6 = a4;
  if (-[NTKFaceCollection containsFace:](self->_library, "containsFace:"))
  {
    id v5 = [(NTKFaceCollection *)self->_library selectedFace];

    if (v5 != v6) {
      [(NTKFaceCollection *)self->_library setSelectedFace:v6 suppressingCallbackToObserver:0];
    }
  }
}

- (void)faceConfigurationDidChange:(id)a3
{
  library = self->_library;
  id v5 = a3;
  id v6 = [(NTKFaceCollection *)library indexOfFace:v5];
  collectionView = self->_collectionView;
  id v8 = +[NSIndexPath indexPathForItem:v6 inSection:0];
  id v10 = [(UICollectionView *)collectionView cellForItemAtIndexPath:v8];

  uint64_t v9 = [v5 name];

  [v10 setName:v9];
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ([v4 hasLoaded]) {
      CFStringRef v6 = @"HAS";
    }
    else {
      CFStringRef v6 = @"HAS NOT";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2048;
    id v10 = [v4 numberOfFaces];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "library %@ loaded with %lu faces", (uint8_t *)&v7, 0x16u);
  }

  [(NTKCCFacesViewController *)self _reloadAllFacesForCollectionView];
}

- (void)faceCollectionDidReset:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ([v4 hasLoaded]) {
      CFStringRef v6 = @"HAS";
    }
    else {
      CFStringRef v6 = @"HAS NOT";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2048;
    id v10 = [v4 numberOfFaces];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "library %@ reloaded with %lu faces", (uint8_t *)&v7, 0x16u);
  }

  [(NTKCCFacesViewController *)self _reloadAllFacesForCollectionView];
}

- (void)_reloadAllFacesForCollectionView
{
  [(NTKCCFacesViewController *)self _reloadFaces];
  if ([(NTKCCFacesViewController *)self isViewLoaded])
  {
    [(NTKCCFacesViewController *)self _configureLayout];
    [(NTKCCFacesViewController *)self _resetCollectionView];
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:BPSNTKFacesViewControllerDidUpdateContentNotification object:0];
  }
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  CFStringRef v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)long long v19 = v7;
    *(_WORD *)&v19[8] = 1024;
    *(_DWORD *)uint64_t v20 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "adding face %@ at index %d", buf, 0x12u);
  }

  [v7 addObserver:self];
  if ([(NTKCCFacesViewController *)self _canTouchCollectionView])
  {
    NSInteger v9 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:0];
    if ([(NTKFaceCollection *)self->_library numberOfFaces] == (id)(v9 + 1))
    {
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)long long v19 = a5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[_collectionView insert:%d];", buf, 8u);
      }

      collectionView = self->_collectionView;
      long long v12 = +[NSIndexPath indexPathForItem:a5 inSection:0];
      long long v17 = v12;
      id v13 = +[NSArray arrayWithObjects:&v17 count:1];
      [(UICollectionView *)collectionView insertItemsAtIndexPaths:v13];
    }
    else
    {
      [(NTKCCFacesViewController *)self _showBearTrap];
      long long v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [(NTKFaceCollection *)self->_library numberOfFaces];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)long long v19 = v9;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = v15;
        *(_WORD *)uint64_t v20 = 1024;
        *(_DWORD *)&v20[2] = a5;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "UICollectionView has %d faces, NTKFaceCollection has %d faces and added the #%d face (%@).", buf, 0x1Eu);
      }

      [(NTKCCFacesViewController *)self _resetCollectionView];
    }
    [(NTKCCFacesViewController *)self _configureLayout];
    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:BPSNTKFacesViewControllerDidUpdateContentNotification object:0];
  }
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  CFStringRef v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)long long v19 = v7;
    *(_WORD *)&v19[8] = 1024;
    *(_DWORD *)uint64_t v20 = a5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "removing face %@ at index %d", buf, 0x12u);
  }

  [v7 removeObserver:self];
  [(NTKCCFacesViewController *)self _removeViewControllerForFace:v7];
  if ([(NTKCCFacesViewController *)self _canTouchCollectionView])
  {
    unint64_t v9 = [(UICollectionView *)self->_collectionView numberOfItemsInSection:0];
    if (v9 > a5 && [(NTKFaceCollection *)self->_library numberOfFaces] == (id)(v9 - 1))
    {
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)long long v19 = a5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[_collectionView delete:%d];", buf, 8u);
      }

      collectionView = self->_collectionView;
      long long v12 = +[NSIndexPath indexPathForItem:a5 inSection:0];
      long long v17 = v12;
      id v13 = +[NSArray arrayWithObjects:&v17 count:1];
      [(UICollectionView *)collectionView deleteItemsAtIndexPaths:v13];
    }
    else
    {
      [(NTKCCFacesViewController *)self _showBearTrap];
      long long v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [(NTKFaceCollection *)self->_library numberOfFaces];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)long long v19 = v9;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = v15;
        *(_WORD *)uint64_t v20 = 1024;
        *(_DWORD *)&v20[2] = a5;
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "UICollectionView has %d faces, NTKFaceCollection has %d faces and deleted the #%d face (%@).", buf, 0x1Eu);
      }

      [(NTKCCFacesViewController *)self _resetCollectionView];
    }
    [(NTKCCFacesViewController *)self _configureLayout];
    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    [v16 postNotificationName:BPSNTKFacesViewControllerDidUpdateContentNotification object:0];
  }
  [(NTKCCFacesViewController *)self _popLibraryDetailViewControllerForFace:v7];
}

- (void)faceCollectionDidReorderFaces:(id)a3
{
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "reordering faces so reload section", buf, 2u);
  }

  if ([(NTKCCFacesViewController *)self _canTouchCollectionView])
  {
    id v5 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];",
        v8,
        2u);
    }

    collectionView = self->_collectionView;
    id v7 = +[NSIndexSet indexSetWithIndex:0];
    [(UICollectionView *)collectionView reloadSections:v7];
  }
}

- (void)_showBearTrap
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "BEAR TRAP", buf, 2u);
  }

  if (NTKInternalBuild())
  {
    +[UIAlertController alertControllerWithTitle:@"[Internal Only]" message:@"We detected an inconsistency between the UI and the daemon! Please file a radar on Watch Faces with a sysdiagnose and the /var/mobile/Library/NanoTimeKit/ from both watch and phone." preferredStyle:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8DDC;
    v6[3] = &unk_247E8;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = v7;
    id v5 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:v6];
    [v4 addAction:v5];

    [(NTKCCFacesViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", a3, a4.x, a4.y);
  if (v5)
  {
    [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
    CFStringRef v6 = self->_library;
    id v7 = -[NTKFaceCollection faceAtIndex:](v6, "faceAtIndex:", [v5 item]);
    CFStringRef v8 = [v7 bundleIdentifierForUpgrade];

    unint64_t v9 = 0;
    if (!v8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_8FA8;
      v15[3] = &unk_24810;
      v15[4] = self;
      id v16 = v5;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_8FB4;
      v11[3] = &unk_24888;
      long long v12 = v6;
      id v13 = v7;
      long long v14 = self;
      unint64_t v9 = +[UIContextMenuConfiguration configurationWithIdentifier:v16 previewProvider:v15 actionProvider:v11];
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  CFStringRef v6 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];
  if (v6)
  {
    id v7 = objc_alloc((Class)UITargetedPreview);
    CFStringRef v8 = [v6 faceContainerView];
    id v9 = [v7 initWithView:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  [v6 previewViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9540;
  v8[3] = &unk_248B0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = self;
  id v7 = v9;
  [v6 addCompletion:v8];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9610;
  v5[3] = &unk_248D8;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

- (void)_complicationsDidLoad
{
}

- (void)_fontSizeDidChange
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "font size changed", v4, 2u);
  }

  if ([(NTKCCFacesViewController *)self isViewLoaded])
  {
    [(NTKCCFacesViewController *)self _configureLayout];
    [(NTKCCFacesViewController *)self _resetCollectionView];
  }
}

- (void)upgradeManager:(id)a3 didCompleteWithFace:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_149F0((uint64_t)v8, (uint64_t)v10, v11);
    }
LABEL_4:

    goto LABEL_14;
  }
  if (!v9)
  {
    id v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_14978((uint64_t)v8, v11);
    }
    goto LABEL_4;
  }
  if ([v8 upgradingFaceIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
    long long v12 = (char *)[(NTKFaceCollection *)self->_library numberOfFaces];
  }
  else {
    long long v12 = (char *)[v8 upgradingFaceIndex] + 1;
  }
  id v13 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v9;
    __int16 v16 = 2048;
    long long v17 = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Adding new, upgraded face %@ to %lu", (uint8_t *)&v14, 0x16u);
  }

  [(NTKFaceCollection *)self->_library addFace:v9 atIndex:v12 suppressingCallbackToObserver:0];
  [(NTKFaceCollection *)self->_library setSelectedFaceIndex:v12 suppressingCallbackToObserver:0];
LABEL_14:
}

- (NTKFaceCollection)library
{
  return self->_library;
}

- (UIStackView)headerView
{
  return self->_headerView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (UIView)topSeparatorView
{
  return self->_topSeparatorView;
}

- (void)setTopSeparatorView:(id)a3
{
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)layout
{
  return self->_layout;
}

- (CGSize)faceSize
{
  double width = self->_faceSize.width;
  double height = self->_faceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSMutableArray)faceVCs
{
  return self->_faceVCs;
}

- (void)setFaceVCs:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (NTKCFaceDetailViewController)presentedDetailVC
{
  return self->_presentedDetailVC;
}

- (NTKCCLibraryListViewController)presentedListVC
{
  return self->_presentedListVC;
}

- (void)setPresentedListVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedListVC, 0);
  objc_storeStrong((id *)&self->_presentedDetailVC, 0);
  objc_storeStrong((id *)&self->_faceVCs, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

@end