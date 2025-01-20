@interface HWFavoritesPickerView
- (BOOL)isEditing;
- (BOOL)isEmpty;
- (BOOL)shouldShowShadows;
- (CGSize)cellSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (HWFavoritesPickerDelegate)delegate;
- (HWFavoritesPickerView)initWithCoder:(id)a3;
- (HWFavoritesPickerView)initWithFrame:(CGRect)a3;
- (NSArray)items;
- (NSLayoutConstraint)emptyLabelLeft;
- (NSLayoutConstraint)emptyLabelRight;
- (NSLayoutConstraint)emptyLabelVerticalBaseline;
- (NSLayoutConstraint)emptyLabelVerticalCenter;
- (NSMutableDictionary)itemCache;
- (NSOperationQueue)thumbnailQueue;
- (UICollectionView)collectionView;
- (UIImageView)leftShadow;
- (UIImageView)rightShadow;
- (UILabel)emptyLabel;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)homeButtonGestureRecognizer;
- (double)interitemSpacing;
- (double)lineSpacing;
- (id)_cellViewForUUID:(id)a3;
- (id)_indexPathForIndex:(int64_t)a3;
- (id)cachedThumbnailForItem:(id)a3 inCell:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)selectionHandler;
- (int64_t)_indexForIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)layoutMode;
- (void)_adjustLayoutForLandscapeEditingMode:(BOOL)a3 animate:(BOOL)a4;
- (void)_cellButtonDown:(id)a3;
- (void)_cellButtonUp:(id)a3;
- (void)_commonInit;
- (void)_deleteItem:(id)a3;
- (void)_homeButtonClicked:(id)a3;
- (void)_longPress:(id)a3;
- (void)cancelEditing:(BOOL)a3;
- (void)clearThumbnailCache;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadData;
- (void)resetScrollPosition;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEmpty:(BOOL)a3;
- (void)setEmptyLabel:(id)a3;
- (void)setEmptyLabelLeft:(id)a3;
- (void)setEmptyLabelRight:(id)a3;
- (void)setEmptyLabelVerticalBaseline:(id)a3;
- (void)setEmptyLabelVerticalCenter:(id)a3;
- (void)setHomeButtonGestureRecognizer:(id)a3;
- (void)setItemCache:(id)a3;
- (void)setItems:(id)a3;
- (void)setLayoutMode:(unint64_t)a3;
- (void)setLeftShadow:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setRightShadow:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setThumbnailQueue:(id)a3;
- (void)showShadows;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateShadowVisiblity;
@end

@implementation HWFavoritesPickerView

- (HWFavoritesPickerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWFavoritesPickerView;
  v3 = -[HWFavoritesPickerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HWFavoritesPickerView *)v3 _commonInit];
  }
  return v4;
}

- (HWFavoritesPickerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HWFavoritesPickerView;
  v3 = [(HWFavoritesPickerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HWFavoritesPickerView *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView removeObserver:self forKeyPath:@"contentSize"];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HWFavoritesPickerView;
  [(HWFavoritesPickerView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HWFavoritesPickerView;
  [(HWFavoritesPickerView *)&v3 layoutSubviews];
  [(HWFavoritesPickerView *)self updateShadowVisiblity];
}

- (void)_commonInit
{
  if (qword_33630 != -1) {
    dispatch_once(&qword_33630, &stru_28928);
  }
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];

  self->_emptdouble y = 1;
  objc_super v4 = +[NSMutableDictionary dictionary];
  itemCache = self->_itemCache;
  self->_itemCache = v4;

  objc_super v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  thumbnailQueue = self->_thumbnailQueue;
  self->_thumbnailQueue = v6;

  [(NSOperationQueue *)self->_thumbnailQueue setName:@"Handwriting_Thumbnail_Render_Queue"];
  [(NSOperationQueue *)self->_thumbnailQueue setMaxConcurrentOperationCount:-1];
  id v37 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v37 setScrollDirection:1];
  objc_msgSend(v37, "setSectionInset:", 0.0, 0.0, 0.0, 0.0);
  [v37 setMinimumInteritemSpacing:*(double *)&qword_336F8];
  [v37 setMinimumLineSpacing:*(double *)&qword_336F0];
  id v8 = objc_alloc((Class)UICollectionView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = (UICollectionView *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v37, CGRectZero.origin.x, y, width, height);
  collectionView = self->_collectionView;
  self->_collectionView = v12;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = +[UIColor clearColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v14];

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"reuseIdentifier"];
  [(UICollectionView *)self->_collectionView addObserver:self forKeyPath:@"contentSize" options:0 context:0];
  v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  emptyLabel = self->_emptyLabel;
  self->_emptyLabel = v15;

  [(UILabel *)self->_emptyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v17) = 1132068864;
  [(UILabel *)self->_emptyLabel setContentHuggingPriority:0 forAxis:v17];
  LODWORD(v18) = 1132068864;
  [(UILabel *)self->_emptyLabel setContentCompressionResistancePriority:0 forAxis:v18];
  v19 = +[NSBundle hw_handwritingPluginBundle];
  v20 = [v19 localizedStringForKey:@"Your last %@ handwritten messages appear here in Recents." value:&stru_28B68 table:@"HWFavoritesPickerView"];
  v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, &off_29BA8);
  [(UILabel *)self->_emptyLabel setText:v21];

  v22 = +[UIColor favoritesLabelColor];
  [(UILabel *)self->_emptyLabel setTextColor:v22];

  [(UILabel *)self->_emptyLabel setTextAlignment:1];
  v23 = +[UIFont systemFontOfSize:*((double *)&xmmword_33700 + 1) weight:UIFontWeightLight];
  [(UILabel *)self->_emptyLabel setFont:v23];

  [(UILabel *)self->_emptyLabel setNumberOfLines:0];
  [(UILabel *)self->_emptyLabel setHidden:1];
  [(HWFavoritesPickerView *)self addSubview:self->_collectionView];
  [(HWFavoritesPickerView *)self addSubview:self->_emptyLabel];
  v24 = (UILongPressGestureRecognizer *)[objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_longPress:"];
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v24;

  [(UICollectionView *)self->_collectionView addGestureRecognizer:self->_longPressRecognizer];
  v26 = _NSDictionaryOfVariableBindings(@"_collectionView, _emptyLabel", self->_collectionView, self->_emptyLabel, 0);
  v27 = +[NSLayoutConstraint constraintWithItem:self->_emptyLabel attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:*(double *)&qword_33730];
  emptyLabelRight = self->_emptyLabelRight;
  self->_emptyLabelRight = v27;

  v29 = +[NSLayoutConstraint constraintWithItem:self->_emptyLabel attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:*(double *)&qword_33720];
  emptyLabelLeft = self->_emptyLabelLeft;
  self->_emptyLabelLeft = v29;

  v31 = +[NSLayoutConstraint constraintWithItem:self->_emptyLabel attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:*(double *)&qword_33718];
  emptyLabelVerticalBaseline = self->_emptyLabelVerticalBaseline;
  self->_emptyLabelVerticalBaseline = v31;

  v33 = +[NSLayoutConstraint constraintWithItem:self->_emptyLabel attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  emptyLabelVerticalCenter = self->_emptyLabelVerticalCenter;
  self->_emptyLabelVerticalCenter = v33;

  [(NSLayoutConstraint *)self->_emptyLabelRight setActive:1];
  [(NSLayoutConstraint *)self->_emptyLabelLeft setActive:1];
  [(NSLayoutConstraint *)self->_emptyLabelVerticalBaseline setActive:1];
  [(NSLayoutConstraint *)self->_emptyLabelVerticalCenter setActive:0];
  v35 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:0 views:v26];
  +[NSLayoutConstraint activateConstraints:v35];

  v36 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:0 views:v26];
  +[NSLayoutConstraint activateConstraints:v36];
}

- (void)reloadData
{
  objc_super v3 = [(HWFavoritesPickerView *)self collectionView];
  [v3 reloadData];

  [(HWFavoritesPickerView *)self updateShadowVisiblity];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HWFavoritesPickerView;
  id v4 = a3;
  [(HWFavoritesPickerView *)&v8 traitCollectionDidChange:v4];
  v5 = [(HWFavoritesPickerView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(HWFavoritesPickerView *)self clearThumbnailCache];
  }
}

- (void)resetScrollPosition
{
  if ([(NSArray *)self->_items count])
  {
    if ([(HWFavoritesPickerView *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1) {
      uint64_t v3 = 32;
    }
    else {
      uint64_t v3 = 8;
    }
    collectionView = self->_collectionView;
    id v5 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [(UICollectionView *)collectionView scrollToItemAtIndexPath:v5 atScrollPosition:v3 animated:0];
  }
}

- (void)setItems:(id)a3
{
  id v5 = a3;
  emptdouble y = self->_empty;
  id v7 = v5;
  if (self->_empty) {
    self->_emptdouble y = [v5 count] == 0;
  }
  objc_storeStrong((id *)&self->_items, a3);
  [(UICollectionView *)self->_collectionView reloadData];
  if (empty
    && [(NSArray *)self->_items count]
    && [(HWFavoritesPickerView *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    [(HWFavoritesPickerView *)self resetScrollPosition];
  }
}

- (void)_longPress:(id)a3
{
  if ([a3 state] == (char *)&dword_0 + 1)
  {
    [(HWFavoritesPickerView *)self setEditing:1 animated:1];
  }
}

- (void)setLayoutMode:(unint64_t)a3
{
  if (self->_layoutMode == a3) {
    return;
  }
  self->_layoutMode = a3;
  id v25 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (a3 == 1)
  {
    uint64_t v5 = qword_33750;
    uint64_t v6 = qword_33738;
    double v7 = unk_33740;
    double top = *(double *)&qword_336D0;
    double left = *(double *)algn_336D8;
    double right = *((double *)&xmmword_336E0 + 1);
    double bottom = *(double *)&xmmword_336E0;
    if (!HWDeviceIsiPhone())
    {
      double v21 = *(double *)&xmmword_33700;
LABEL_13:
      [v25 setMinimumInteritemSpacing:v21];
      goto LABEL_14;
    }
    [(HWFavoritesPickerView *)self showShadows];
    [(HWFavoritesPickerView *)self updateShadowVisiblity];
  }
  else
  {
    if (a3 == 2)
    {
      uint64_t v5 = qword_33730;
      uint64_t v6 = qword_33718;
      double v7 = *(double *)&qword_33720;
      if (HWDeviceIsiPhone())
      {
        objc_super v8 = +[UIScreen mainScreen];
        [v8 bounds];
        double v10 = v9;

        v11 = +[UIScreen mainScreen];
        [v11 bounds];
        double v13 = v12;

        if (v10 < v13) {
          double v13 = v10;
        }
        [(HWFavoritesPickerView *)self cellSize];
        double v15 = v14;
        [(HWFavoritesPickerView *)self lineSpacing];
        double right = (v13 - (v16 + v16 + v15 * 3.0)) * 0.5;
        double top = *(double *)&qword_336B0;
        double bottom = *(double *)&xmmword_336C0;
        double left = right;
        goto LABEL_14;
      }
      double top = *(double *)&qword_336B0;
      double left = *(double *)algn_336B8;
      double right = *((double *)&xmmword_336C0 + 1);
      double bottom = *(double *)&xmmword_336C0;
      double v21 = *(double *)&qword_336F8;
      goto LABEL_13;
    }
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    uint64_t v6 = 0;
    double v7 = 0.0;
    uint64_t v5 = 0;
  }
LABEL_14:
  [(NSLayoutConstraint *)self->_emptyLabelRight setConstant:*(double *)&v5];
  [(NSLayoutConstraint *)self->_emptyLabelLeft setConstant:v7];
  [(NSLayoutConstraint *)self->_emptyLabelVerticalBaseline setConstant:*(double *)&v6];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", top, left, bottom, right);
  BOOL v22 = a3 == 2;
  BOOL v23 = a3 == 2;
  uint64_t v24 = !v22;
  [(NSLayoutConstraint *)self->_emptyLabelVerticalCenter setActive:v24];
  [(NSLayoutConstraint *)self->_emptyLabelVerticalBaseline setActive:v23];
  [(HWFavoritesPickerView *)self layoutIfNeeded];
}

- (void)cancelEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL editing = self->_editing;
  -[HWFavoritesPickerView setEditing:](self, "setEditing:");
  if (v5)
  {
    if (HWDeviceIsiPhone())
    {
      objc_super v8 = +[UIApplication sharedApplication];
      double v9 = [v8 keyWindow];
    }
    else
    {
      double v9 = 0;
    }
    v11 = +[UIApplication sharedApplication];
    double v12 = [v11 keyWindow];
    double v13 = [v12 firstResponder];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;

      double v9 = v14;
    }
    if (!v9)
    {
      double v15 = [(HWFavoritesPickerView *)self window];

      if (v15)
      {
        double v9 = [(HWFavoritesPickerView *)self window];
      }
      else
      {
        double v16 = +[UIApplication sharedApplication];
        double v9 = [v16 keyWindow];
      }
    }
    SBSSetInterceptsMenuButton();
    if (!self->_homeButtonGestureRecognizer
      || ([v9 gestureRecognizers],
          double v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 containsObject:self->_homeButtonGestureRecognizer],
          v17,
          (v18 & 1) == 0))
    {
      v19 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_homeButtonClicked:"];
      homeButtonGestureRecognizer = self->_homeButtonGestureRecognizer;
      self->_homeButtonGestureRecognizer = v19;

      [(UITapGestureRecognizer *)self->_homeButtonGestureRecognizer setAllowedPressTypes:&off_29BE0];
      [v9 addGestureRecognizer:self->_homeButtonGestureRecognizer];
    }
  }
  else
  {
    double v10 = self->_homeButtonGestureRecognizer;
    if (!v10) {
      goto LABEL_18;
    }
    double v9 = [(UITapGestureRecognizer *)v10 view];
    [v9 removeGestureRecognizer:self->_homeButtonGestureRecognizer];
    SBSSetInterceptsMenuButton();
  }

LABEL_18:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  double v21 = [(UICollectionView *)self->_collectionView visibleCells];
  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      id v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v25) setEditing:v5 animated:v4];
        id v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v23);
  }

  if (editing != v5 && self->_layoutMode == 1 && HWDeviceIsiPhone()) {
    [(HWFavoritesPickerView *)self _adjustLayoutForLandscapeEditingMode:v5 animate:v4];
  }
  [(HWFavoritesPickerView *)self updateShadowVisiblity];
}

- (void)_deleteItem:(id)a3
{
  id v4 = [a3 tag];
  BOOL v5 = [(HWFavoritesPickerView *)self items];
  id v6 = [v5 count];

  if (v4 < v6)
  {
    double v7 = [(HWFavoritesPickerView *)self items];
    objc_super v8 = [v7 objectAtIndex:v4];

    double v9 = self->_collectionView;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_DE28;
    v13[3] = &unk_287C8;
    id v14 = v8;
    double v15 = self;
    double v16 = v9;
    id v17 = v4;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_DF10;
    v12[3] = &unk_287F0;
    v12[4] = self;
    double v10 = v9;
    id v11 = v8;
    [(UICollectionView *)v10 performBatchUpdates:v13 completion:v12];
  }
}

- (void)_cellButtonDown:(id)a3
{
  id v4 = [a3 tag];
  BOOL v5 = [(HWFavoritesPickerView *)self items];
  id v6 = [v5 count];

  if (v4 < v6)
  {
    id v8 = [(HWFavoritesPickerView *)self _indexPathForIndex:v4];
    double v7 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v8];
    [v7 setHighlighted:1];
    [(UILongPressGestureRecognizer *)self->_longPressRecognizer setEnabled:0];
  }
}

- (void)_cellButtonUp:(id)a3
{
  id v4 = [a3 tag];
  BOOL v5 = [(HWFavoritesPickerView *)self items];
  id v6 = [v5 count];

  if (v4 < v6)
  {
    id v8 = [(HWFavoritesPickerView *)self _indexPathForIndex:v4];
    double v7 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v8];
    [v7 setHighlighted:0];
    [(UILongPressGestureRecognizer *)self->_longPressRecognizer setEnabled:1];
  }
}

- (void)_homeButtonClicked:(id)a3
{
}

- (CGSize)cellSize
{
  double v3 = *((double *)&_PlatformSpec + 1);
  double v2 = *(double *)&_PlatformSpec;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)lineSpacing
{
  return *(double *)&qword_336F0;
}

- (double)interitemSpacing
{
  return *(double *)&qword_336F8;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"contentSize", a4, a5, a6))
  {
    [(HWFavoritesPickerView *)self updateShadowVisiblity];
  }
}

- (BOOL)shouldShowShadows
{
  if (HWDeviceIsiPhone() && self->_layoutMode == 1)
  {
    double v3 = [(HWFavoritesPickerView *)self items];
    if ([v3 count]) {
      unsigned int v4 = ![(HWFavoritesPickerView *)self isEditing];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)showShadows
{
  if (!self->_leftShadow && !self->_rightShadow)
  {
    double v3 = +[UIImage hw_pluginImageNamed:@"shadow"];
    objc_msgSend(v3, "resizableImageWithCapInsets:resizingMode:", 0, 1.0, 0.0, 0.0, 0.0);
    id v26 = (id)objc_claimAutoreleasedReturnValue();

    unsigned int v4 = +[UIImage hw_pluginImageNamed:@"shadow"];
    id v25 = objc_msgSend(v4, "hw_flippedImage");

    BOOL v5 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v25];
    leftShadow = self->_leftShadow;
    self->_leftShadow = v5;

    [(UIImageView *)self->_leftShadow setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_leftShadow setContentMode:0];
    double v7 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v26];
    rightShadow = self->_rightShadow;
    self->_rightShadow = v7;

    [(UIImageView *)self->_rightShadow setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_rightShadow setContentMode:0];
    [(HWFavoritesPickerView *)self insertSubview:self->_rightShadow above:self->_collectionView];
    [(HWFavoritesPickerView *)self insertSubview:self->_leftShadow above:self->_collectionView];
    double v9 = [(UIImageView *)self->_rightShadow image];
    [v9 size];
    double v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    id v11 = _NSDictionaryOfVariableBindings(@"_rightShadow, _leftShadow", self->_rightShadow, self->_leftShadow, 0);
    double v12 = _NSDictionaryOfVariableBindings(@"width", v10, 0);
    double v13 = [(UIImageView *)self->_leftShadow heightAnchor];
    id v14 = [v13 constraintEqualToConstant:*((double *)&_PlatformSpec + 1)];
    [v14 setActive:1];

    double v15 = [(UIImageView *)self->_leftShadow centerYAnchor];
    double v16 = [(UICollectionView *)self->_collectionView centerYAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    unsigned __int8 v18 = [(UIImageView *)self->_rightShadow heightAnchor];
    v19 = [v18 constraintEqualToConstant:*((double *)&_PlatformSpec + 1)];
    [v19 setActive:1];

    v20 = [(UIImageView *)self->_rightShadow centerYAnchor];
    double v21 = [(UICollectionView *)self->_collectionView centerYAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    id v23 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_rightShadow(width)]|" options:0x10000 metrics:v12 views:v11];
    +[NSLayoutConstraint activateConstraints:v23];

    uint64_t v24 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_leftShadow(width)]" options:0x10000 metrics:v12 views:v11];
    +[NSLayoutConstraint activateConstraints:v24];
  }
}

- (void)updateShadowVisiblity
{
  if (self->_leftShadow && self->_rightShadow)
  {
    unsigned __int8 v3 = [(HWFavoritesPickerView *)self shouldShowShadows];
    [(UICollectionView *)self->_collectionView contentOffset];
    double v5 = v4;
    [(UICollectionView *)self->_collectionView contentSize];
    double v7 = v6;
    [(UICollectionView *)self->_collectionView frame];
    if (v7 > v8 && v5 + 1.0 + v8 <= v7) {
      unsigned __int8 v9 = v3;
    }
    else {
      unsigned __int8 v9 = 0;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_E678;
    v11[3] = &unk_28818;
    if (v5 > 0.0) {
      unsigned __int8 v10 = v3;
    }
    else {
      unsigned __int8 v10 = 0;
    }
    v11[4] = self;
    unsigned __int8 v12 = v10;
    unsigned __int8 v13 = v9;
    +[UIView animateWithDuration:v11 animations:0.18];
  }
}

- (void)_adjustLayoutForLandscapeEditingMode:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(HWFavoritesPickerView *)self delegate];
  [v7 pickerOffsetForEditMode:self];
  double v9 = v8;
  [(UICollectionView *)self->_collectionView contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v30 = v16;
  [(UICollectionView *)self->_collectionView contentOffset];
  double v31 = v18;
  double v19 = v9 + v13;
  double v20 = v17 - v9;
  double v21 = v13 - v9;
  double v22 = v9 + v17;
  if (v5) {
    double v23 = v17 - v9;
  }
  else {
    double v23 = v9 + v17;
  }
  if (v5) {
    double v24 = v19;
  }
  else {
    double v24 = v21;
  }
  if (!v4)
  {
    if (v5) {
      [v7 pickerDidEnterEditMode:self];
    }
    else {
      [v7 pickerDidExitEditMode:self];
    }
    long long v29 = [(HWFavoritesPickerView *)self collectionView];
    objc_msgSend(v29, "setContentInset:", v11, v24, v15, v30);

    id v26 = [(HWFavoritesPickerView *)self collectionView];
    long long v27 = v26;
    double v28 = v23;
    goto LABEL_15;
  }
  if (v5)
  {
    [v7 pickerDidEnterEditMode:self];
    id v25 = [(HWFavoritesPickerView *)self collectionView];
    objc_msgSend(v25, "setContentInset:", v11, v19, v15, v30);

    id v26 = [(HWFavoritesPickerView *)self collectionView];
    long long v27 = v26;
    double v28 = v20;
LABEL_15:
    objc_msgSend(v26, "setContentOffset:", v28, v31);

    goto LABEL_16;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_E900;
  v32[3] = &unk_28840;
  id v33 = v7;
  v34 = self;
  double v35 = v11;
  double v36 = v21;
  double v37 = v15;
  double v38 = v30;
  double v39 = v22;
  double v40 = v31;
  +[UIView animateWithDuration:v32 animations:0.09];

LABEL_16:
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HWFavoritesPickerView *)self isEditing])
  {
    [(HWFavoritesPickerView *)self setEditing:0 animated:1];
  }
  else
  {
    double v8 = [(HWFavoritesPickerView *)self selectionHandler];

    if (v8)
    {
      double v9 = [(HWFavoritesPickerView *)self items];

      if (v9)
      {
        double v10 = [(HWFavoritesPickerView *)self items];
        double v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));

        double v12 = [(HWFavoritesPickerView *)self selectionHandler];
        ((void (**)(void, void *))v12)[2](v12, v11);
      }
    }
  }
  dispatch_time_t v13 = dispatch_time(0, 50000000);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_EB38;
  v16[3] = &unk_28868;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v16);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6 = *((double *)&_PlatformSpec + 1);
  double v5 = *(double *)&_PlatformSpec;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  [(UILabel *)self->_emptyLabel setHidden:[(NSArray *)self->_items count] != 0];
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  BOOL v4 = [(HWFavoritesPickerView *)self items];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:v6];
  double v8 = [(HWFavoritesPickerView *)self items];

  if (v8)
  {
    int64_t v9 = [(HWFavoritesPickerView *)self _indexForIndexPath:v6];
    double v10 = [(HWFavoritesPickerView *)self items];
    double v11 = [v10 objectAtIndex:v9];

    double v12 = [v11 uuid];
    dispatch_time_t v13 = [v12 UUIDString];
    [v7 setUuidString:v13];

    id v14 = [(HWFavoritesPickerView *)self cachedThumbnailForItem:v11 inCell:v7];
    id v15 = [v7 imageView];
    [v15 setImage:v14];

    double v16 = [v7 deleteButton];
    [v16 setTag:v9];

    id v17 = [v7 deleteButton];
    [v17 addTarget:self action:"_cellButtonDown:" forControlEvents:1];

    id v18 = [v7 deleteButton];
    [v18 addTarget:self action:"_cellButtonUp:" forControlEvents:192];

    double v19 = [v7 deleteButton];
    [v19 addTarget:self action:"_deleteItem:" forControlEvents:64];

    objc_msgSend(v7, "setEditing:", -[HWFavoritesPickerView isEditing](self, "isEditing"));
  }

  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_msgSend(v6, "setEditing:", -[HWFavoritesPickerView isEditing](self, "isEditing"));
}

- (id)cachedThumbnailForItem:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 uuid];
  int64_t v9 = [v8 UUIDString];

  if (!v9)
  {
    id v12 = 0;
    goto LABEL_9;
  }
  double v10 = [(NSMutableDictionary *)self->_itemCache objectForKey:v9];
  double v11 = +[NSNull null];

  if (v10 == v11) {
    goto LABEL_7;
  }
  if (!v10)
  {
    itemCache = self->_itemCache;
    id v14 = +[NSNull null];
    [(NSMutableDictionary *)itemCache setObject:v14 forKey:v9];

    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_itemCache);
    objc_initWeak(&v25, v7);
    id v15 = [(HWFavoritesPickerView *)self traitCollection];
    id v16 = [v15 userInterfaceStyle];

    thumbnailQueue = self->_thumbnailQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_F08C;
    v19[3] = &unk_288B8;
    id v20 = v6;
    v24[1] = v16;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &v25);
    id v21 = v9;
    objc_copyWeak(v24, &location);
    [(NSOperationQueue *)thumbnailQueue addOperationWithBlock:v19];
    objc_destroyWeak(v24);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  id v12 = v10;
LABEL_8:

LABEL_9:

  return v12;
}

- (id)_cellViewForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(UICollectionView *)self->_collectionView visibleCells];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          int64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          double v10 = [v9 uuidString];
          unsigned int v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)_indexForIndexPath:(id)a3
{
  return (int64_t)[a3 row];
}

- (id)_indexPathForIndex:(int64_t)a3
{
  return +[NSIndexPath indexPathForItem:a3 inSection:0];
}

- (void)clearThumbnailCache
{
  [(NSMutableDictionary *)self->_itemCache removeAllObjects];

  [(HWFavoritesPickerView *)self reloadData];
}

- (NSArray)items
{
  return self->_items;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (HWFavoritesPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HWFavoritesPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_BOOL editing = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)homeButtonGestureRecognizer
{
  return self->_homeButtonGestureRecognizer;
}

- (void)setHomeButtonGestureRecognizer:(id)a3
{
}

- (UIImageView)leftShadow
{
  return self->_leftShadow;
}

- (void)setLeftShadow:(id)a3
{
}

- (UIImageView)rightShadow
{
  return self->_rightShadow;
}

- (void)setRightShadow:(id)a3
{
}

- (UILabel)emptyLabel
{
  return self->_emptyLabel;
}

- (void)setEmptyLabel:(id)a3
{
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setEmpty:(BOOL)a3
{
  self->_emptdouble y = a3;
}

- (NSMutableDictionary)itemCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setItemCache:(id)a3
{
}

- (NSOperationQueue)thumbnailQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setThumbnailQueue:(id)a3
{
}

- (NSLayoutConstraint)emptyLabelRight
{
  return self->_emptyLabelRight;
}

- (void)setEmptyLabelRight:(id)a3
{
}

- (NSLayoutConstraint)emptyLabelLeft
{
  return self->_emptyLabelLeft;
}

- (void)setEmptyLabelLeft:(id)a3
{
}

- (NSLayoutConstraint)emptyLabelVerticalCenter
{
  return self->_emptyLabelVerticalCenter;
}

- (void)setEmptyLabelVerticalCenter:(id)a3
{
}

- (NSLayoutConstraint)emptyLabelVerticalBaseline
{
  return self->_emptyLabelVerticalBaseline;
}

- (void)setEmptyLabelVerticalBaseline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyLabelVerticalBaseline, 0);
  objc_storeStrong((id *)&self->_emptyLabelVerticalCenter, 0);
  objc_storeStrong((id *)&self->_emptyLabelLeft, 0);
  objc_storeStrong((id *)&self->_emptyLabelRight, 0);
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_emptyLabel, 0);
  objc_storeStrong((id *)&self->_rightShadow, 0);
  objc_storeStrong((id *)&self->_leftShadow, 0);
  objc_storeStrong((id *)&self->_homeButtonGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end