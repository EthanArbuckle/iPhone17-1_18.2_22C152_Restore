@interface CPUIImageRowCell
+ (double)minimumHeight;
+ (double)rowHeight;
- (BOOL)_showsImageTitles;
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)artworkCatalogs;
- (NSArray)imageTitles;
- (NSLayoutConstraint)stackViewHeightConstraint;
- (NSLayoutConstraint)stackViewWidthConstraint;
- (NSMutableArray)reusableMediaViews;
- (UIActivityIndicatorView)activityIndicator;
- (UIImage)fallbackImage;
- (UIImageView)chevronView;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (UIView)trailingView;
- (_CPUIImageRowHighlightButton)focusIndicator;
- (double)_artworkContentWidth;
- (id)selectGridItemBlock;
- (id)selectTitleBlock;
- (int64_t)_maxArtworkCountFittingSize;
- (void)_layoutArtworkImagesIfNeeded;
- (void)_removeArtworkTitleItem:(id)a3;
- (void)_setNeedsArtworkImagesLayout;
- (void)_updateTintColors;
- (void)applyConfiguration:(id)a3;
- (void)configureCell;
- (void)coreCellItemTapped:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)gridCellItemTapped:(id)a3;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setArtworkCatalogs:(id)a3;
- (void)setChevronView:(id)a3;
- (void)setFallbackImage:(id)a3;
- (void)setFocusIndicator:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageTitles:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setReusableMediaViews:(id)a3;
- (void)setSelectGridItemBlock:(id)a3;
- (void)setSelectTitleBlock:(id)a3;
- (void)setStackView:(id)a3;
- (void)setStackViewHeightConstraint:(id)a3;
- (void)setStackViewWidthConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingView:(id)a3;
@end

@implementation CPUIImageRowCell

+ (double)minimumHeight
{
  return 123.0;
}

+ (double)rowHeight
{
  return 123.0;
}

- (void)_updateTintColors
{
  v7.receiver = self;
  v7.super_class = (Class)CPUIImageRowCell;
  [(_CPUIBaseTableCell *)&v7 _updateTintColors];
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  }
  else {
  v3 = +[_CPUIBaseTableCell disabledColor];
  }
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  }
  else {
  v4 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  v5 = [(CPUIImageRowCell *)self chevronView];
  if ([(CPUIImageRowCell *)self isHighlighted]) {
    v6 = v4;
  }
  else {
    v6 = v3;
  }
  [v5 setTintColor:v6];
}

- (void)configureCell
{
  v67[9] = *MEMORY[0x263EF8340];
  v66.receiver = self;
  v66.super_class = (Class)CPUIImageRowCell;
  [(_CPUIBaseTableCell *)&v66 configureCell];
  id v3 = objc_alloc(MEMORY[0x263F82BF8]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id selectTitleBlock = self->_selectTitleBlock;
  self->_id selectTitleBlock = v4;

  [self->_selectTitleBlock setAxis:0];
  [self->_selectTitleBlock setAlignment:3];
  [self->_selectTitleBlock setDistribution:3];
  [self->_selectTitleBlock setTranslatesAutoresizingMaskIntoConstraints:0];
  [self->_selectTitleBlock setClipsToBounds:0];
  v6 = [(CPUIImageRowCell *)self contentView];
  objc_super v7 = [(CPUIImageRowCell *)self stackView];
  [v6 addSubview:v7];

  v8 = (UIView *)objc_opt_new();
  trailingView = self->_trailingView;
  self->_trailingView = v8;

  [(UIView *)self->_trailingView setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
  [(UIView *)self->_trailingView setFont:v10];

  v11 = [(CPUIImageRowCell *)self contentView];
  v12 = [(CPUIImageRowCell *)self titleLabel];
  [v11 addSubview:v12];

  v13 = (UIImage *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:21];
  fallbackImage = self->_fallbackImage;
  self->_fallbackImage = v13;

  [(UIImage *)self->_fallbackImage setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = objc_opt_new();
  CGFloat height = self->_lastKnownBoundingSize.height;
  *(void *)&self->_lastKnownBoundingSize.CGFloat height = v15;

  v17 = (NSArray *)objc_opt_new();
  imageTitles = self->_imageTitles;
  self->_imageTitles = v17;

  [(NSArray *)self->_imageTitles addTarget:self action:sel_coreCellItemTapped_ forControlEvents:0x2000];
  [(NSArray *)self->_imageTitles setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPUIImageRowCell *)self addSubview:self->_imageTitles];
  [(CPUIImageRowCell *)self sendSubviewToBack:self->_imageTitles];
  id v19 = objc_alloc(MEMORY[0x263F82828]);
  v20 = [(CPUIImageRowCell *)self traitCollection];
  v21 = CPUIChevronRightGlyph();
  v22 = [v21 imageWithRenderingMode:2];
  v23 = (_CPUIImageRowHighlightButton *)[v19 initWithImage:v22];
  focusIndicator = self->_focusIndicator;
  self->_focusIndicator = v23;

  [(_CPUIImageRowHighlightButton *)self->_focusIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPUIImageRowCell *)self setTrailingView:self->_focusIndicator];
  v25 = (void *)MEMORY[0x263F827E8];
  v26 = CPUIFrameworkBundle();
  v27 = [(CPUIImageRowCell *)self traitCollection];
  v28 = [v25 imageNamed:@"PlaceholderMusic" inBundle:v26 compatibleWithTraitCollection:v27];
  chevronView = self->_chevronView;
  self->_chevronView = v28;

  [(CPUIImageRowCell *)self setSelectionStyle:0];
  v52 = (void *)MEMORY[0x263F08938];
  v64 = [(UIView *)self->_trailingView leadingAnchor];
  v65 = [(CPUIImageRowCell *)self contentView];
  v63 = [v65 leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:12.0];
  v67[0] = v62;
  v60 = [(UIView *)self->_trailingView topAnchor];
  v61 = [(CPUIImageRowCell *)self contentView];
  v59 = [v61 topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v67[1] = v58;
  v57 = [(UIView *)self->_trailingView heightAnchor];
  v56 = [v57 constraintEqualToConstant:44.0];
  v67[2] = v56;
  v54 = [(NSArray *)self->_imageTitles leadingAnchor];
  v55 = [(CPUIImageRowCell *)self contentView];
  v53 = [v55 leadingAnchor];
  v51 = [v54 constraintEqualToAnchor:v53 constant:4.0];
  v67[3] = v51;
  v49 = [(NSArray *)self->_imageTitles trailingAnchor];
  v50 = [(CPUIImageRowCell *)self contentView];
  v48 = [v50 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:-4.0];
  v67[4] = v47;
  v45 = [(NSArray *)self->_imageTitles topAnchor];
  v46 = [(CPUIImageRowCell *)self contentView];
  v44 = [v46 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:4.0];
  v67[5] = v43;
  v41 = [(NSArray *)self->_imageTitles bottomAnchor];
  v42 = [(CPUIImageRowCell *)self titleLabel];
  v40 = [v42 bottomAnchor];
  v30 = [v41 constraintEqualToAnchor:v40 constant:-4.0];
  v67[6] = v30;
  v31 = [self->_selectTitleBlock leadingAnchor];
  v32 = [(CPUIImageRowCell *)self leadingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:12.0];
  v67[7] = v33;
  v34 = [self->_selectTitleBlock topAnchor];
  v35 = [(CPUIImageRowCell *)self titleLabel];
  v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v67[8] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:9];
  [v52 activateConstraints:v38];

  [(CPUIImageRowCell *)self setAccessibilityIdentifier:@"CPListImageRowItem"];
  v39 = [(CPUIImageRowCell *)self titleLabel];
  [v39 setAccessibilityIdentifier:@"CPListItemTitle"];
}

- (void)applyConfiguration:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", [v4 enabled]);
  v5 = [v4 title];
  v6 = [(CPUIImageRowCell *)self titleLabel];
  [v6 setText:v5];

  [(CPUIImageRowCell *)self _updateTintColors];
  objc_super v7 = [v4 selectGridItemBlock];
  [(CPUIImageRowCell *)self setSelectGridItemBlock:v7];

  v8 = [v4 selectTitleBlock];
  [(CPUIImageRowCell *)self setSelectTitleBlock:v8];

  v9 = [v4 artworkCatalogs];
  [(CPUIImageRowCell *)self setArtworkCatalogs:v9];

  v10 = [v4 imageTitles];
  [(CPUIImageRowCell *)self setImageTitles:v10];

  v11 = [(CPUIImageRowCell *)self titleLabel];
  v12 = [v11 text];

  if (v12)
  {
    v13 = [(CPUIImageRowCell *)self titleLabel];
    v14 = [v13 text];
    v20[0] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(CPUIImageRowCell *)self setAccessibilityUserInputLabels:v15];
  }
  else
  {
    [(CPUIImageRowCell *)self setAccessibilityUserInputLabels:MEMORY[0x263EFFA68]];
  }
  v16 = [v4 bundleIdentifier];
  uint64_t v17 = CPUIPlaceholderTypeForBundleIdentifier(v16);

  v18 = [(CPUIImageRowCell *)self traitCollection];
  id v19 = CPUIImageForPlaceholderTypeWithTraitCollection(v17, v18);
  [(CPUIImageRowCell *)self setFallbackImage:v19];

  -[CPUIImageRowCell setLoading:](self, "setLoading:", [v4 showActivityIndicator]);
  [(CPUIImageRowCell *)self setNeedsLayout];
  [(CPUIImageRowCell *)self _setNeedsArtworkImagesLayout];
}

- (double)_artworkContentWidth
{
  v2 = [(CPUIImageRowCell *)self contentView];
  [v2 bounds];
  double v3 = CGRectGetWidth(v5) + -24.0;

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  CGRect v5 = [(CPUIImageRowCell *)self artworkCatalogs];
  unint64_t v6 = [v5 count];

  unint64_t v7 = [(CPUIImageRowCell *)self _maxArtworkCountFittingSize];
  [(CPUIImageRowCell *)self _artworkContentWidth];
  double v9 = 0.0;
  if (v8 >= 61.0)
  {
    if (v6 >= v7) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = v6;
    }
    float v11 = (v8 + 8.0) / (double)v10;
    double v9 = (double)(uint64_t)vcvtms_s32_f32(v11) + -8.0;
  }
  if (v9 <= 95.0) {
    double v12 = v9 + 44.0;
  }
  else {
    double v12 = 139.0;
  }
  BOOL v13 = [(CPUIImageRowCell *)self _showsImageTitles];
  double v14 = 32.0;
  if (!v13) {
    double v14 = 0.0;
  }
  double v15 = v12 + v14 + 12.0;
  double v16 = width;
  result.CGFloat height = v15;
  result.CGFloat width = v16;
  return result;
}

- (int64_t)_maxArtworkCountFittingSize
{
  [(CPUIImageRowCell *)self _artworkContentWidth];
  if (v3 < 61.0)
  {
    int64_t v4 = 0;
LABEL_10:
    if (v4 <= 4) {
      return 4;
    }
    else {
      return v4;
    }
  }
  double v5 = v3 + 8.0;
  float v6 = (v3 + 8.0) / 103.0;
  int64_t v4 = vcvtms_s32_f32(v6);
  unint64_t v7 = [(CPUIImageRowCell *)self artworkCatalogs];
  unint64_t v8 = [v7 count];

  if (v8 <= v4) {
    goto LABEL_10;
  }
  float v9 = v5 / (double)(v4 + 1);
  double v10 = (double)(uint64_t)vcvtms_s32_f32(v9) + -8.0;
  if (v10 > 95.0) {
    double v10 = 95.0;
  }
  int64_t result = v4 + 1 > 4 ? v4 + 1 : 4;
  if (v10 < 61.0) {
    goto LABEL_10;
  }
  return result;
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    [(CPUIImageRowCell *)self setTrailingView:self->_fallbackImage];
    id v4 = [(CPUIImageRowCell *)self activityIndicator];
    [v4 startAnimating];
  }
  else
  {
    [(CPUIImageRowCell *)self setTrailingView:self->_focusIndicator];
    id v4 = [(CPUIImageRowCell *)self activityIndicator];
    [v4 stopAnimating];
  }
}

- (void)setTrailingView:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = (NSLayoutConstraint *)a3;
  [(NSLayoutConstraint *)self->_stackViewHeightConstraint removeFromSuperview];
  stackViewHeightConstraint = self->_stackViewHeightConstraint;
  self->_stackViewHeightConstraint = v4;
  float v6 = v4;

  unint64_t v7 = [(CPUIImageRowCell *)self contentView];
  [v7 addSubview:v6];

  uint64_t v17 = (void *)MEMORY[0x263F08938];
  unint64_t v8 = [(NSLayoutConstraint *)self->_stackViewHeightConstraint trailingAnchor];
  float v9 = [(CPUIImageRowCell *)self contentView];
  double v10 = [v9 trailingAnchor];
  float v11 = [v8 constraintEqualToAnchor:v10 constant:-12.0];
  v18[0] = v11;
  double v12 = [(NSLayoutConstraint *)self->_stackViewHeightConstraint centerYAnchor];
  BOOL v13 = [(CPUIImageRowCell *)self titleLabel];
  double v14 = [v13 centerYAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14];
  v18[1] = v15;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  [v17 activateConstraints:v16];
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  id v7 = [(CPUIImageRowCell *)self focusIndicator];
  id v6 = [v5 nextFocusedItem];

  [(CPUIImageRowCell *)self setHighlighted:v7 == v6];
}

- (BOOL)_showsImageTitles
{
  v2 = [(CPUIImageRowCell *)self imageTitles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPUIImageRowCell;
  [(CPUIImageRowCell *)&v12 setHighlighted:a3 animated:a4];
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  id v6 = +[_CPUIBaseTableCell disabledColor];
  }
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else {
  id v7 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  [(CPUIImageRowCell *)self _updateTintColors];
  unint64_t v8 = [(CPUIImageRowCell *)self titleLabel];
  float v9 = v8;
  if (v4) {
    double v10 = v7;
  }
  else {
    double v10 = v6;
  }
  [v8 setTextColor:v10];

  float v11 = [(CPUIImageRowCell *)self focusIndicator];
  [v11 setShowHighlight:v4];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CPUIImageRowCell;
  [(CPUIImageRowCell *)&v9 layoutSubviews];
  [(CPUIImageRowCell *)self bounds];
  double width = self->_lastKnownBoundingSize.width;
  if (*(double *)&self->_needsArtworkImagesLayout != v5 || width != v3)
  {
    [(CPUIImageRowCell *)self _setNeedsArtworkImagesLayout];
    [(CPUIImageRowCell *)self _layoutArtworkImagesIfNeeded];
  }
  [(CPUIImageRowCell *)self bounds];
  *(void *)&self->_needsArtworkImagesLayout = v7;
  self->_lastKnownBoundingSize.double width = v8;
}

- (void)_setNeedsArtworkImagesLayout
{
  if (!*(&self->super._itemEnabled + 1))
  {
    *(&self->super._itemEnabled + 1) = 1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__CPUIImageRowCell__setNeedsArtworkImagesLayout__block_invoke;
    block[3] = &unk_26482D398;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __48__CPUIImageRowCell__setNeedsArtworkImagesLayout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutArtworkImagesIfNeeded];
}

- (void)_layoutArtworkImagesIfNeeded
{
  if (*(&self->super._itemEnabled + 1))
  {
    *(&self->super._itemEnabled + 1) = 0;
    double v3 = [(CPUIImageRowCell *)self artworkCatalogs];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      double v5 = [(CPUIImageRowCell *)self artworkCatalogs];
      uint64_t v6 = [v5 count];

      unint64_t v7 = [(CPUIImageRowCell *)self _maxArtworkCountFittingSize];
      if (v6 >= v7) {
        uint64_t v6 = v7;
      }
      CGFloat v8 = [(CPUIImageRowCell *)self artworkCatalogs];
      objc_super v9 = objc_msgSend(v8, "subarrayWithRange:", 0, v6);

      [(CPUIImageRowCell *)self _artworkContentWidth];
      float v11 = (v10 + 8.0) / (double)v6;
      double v12 = (double)(uint64_t)vcvtms_s32_f32(v11) + -8.0;
      if (v10 < 61.0) {
        double v12 = 0.0;
      }
      if (v12 <= 95.0) {
        double v13 = v12;
      }
      else {
        double v13 = 95.0;
      }
      uint64_t v14 = 8 * v6 - 8;
      if ((double)v14 + (double)v6 * v13 <= v10 + -12.0 - v13) {
        double v15 = (double)v14 + (double)v6 * v13;
      }
      else {
        double v15 = v10;
      }
      double v16 = [(CPUIImageRowCell *)self stackViewWidthConstraint];

      if (v16)
      {
        uint64_t v17 = [(CPUIImageRowCell *)self stackViewWidthConstraint];
        [v17 setConstant:v15];
      }
      else
      {
        v18 = [(CPUIImageRowCell *)self stackView];
        id v19 = [v18 widthAnchor];
        v20 = [v19 constraintEqualToConstant:v15];
        [(CPUIImageRowCell *)self setStackViewWidthConstraint:v20];

        uint64_t v17 = [(CPUIImageRowCell *)self stackViewWidthConstraint];
        [v17 setActive:1];
      }

      BOOL v21 = [(CPUIImageRowCell *)self _showsImageTitles];
      double v22 = 32.0;
      if (!v21) {
        double v22 = 0.0;
      }
      double v23 = v13 + v22;
      v24 = [(CPUIImageRowCell *)self stackViewHeightConstraint];

      if (v24)
      {
        v25 = [(CPUIImageRowCell *)self stackViewHeightConstraint];
        [v25 setConstant:v23];
      }
      else
      {
        v26 = [(CPUIImageRowCell *)self stackView];
        v27 = [v26 heightAnchor];
        v28 = [v27 constraintEqualToConstant:v23];
        [(CPUIImageRowCell *)self setStackViewHeightConstraint:v28];

        v25 = [(CPUIImageRowCell *)self stackViewHeightConstraint];
        [v25 setActive:1];
      }

      v29 = [(CPUIImageRowCell *)self reusableMediaViews];
      unint64_t v30 = [v29 count];

      if (v30 > v6)
      {
        while (--v30 >= v6)
        {
          v31 = [(CPUIImageRowCell *)self reusableMediaViews];
          v32 = [v31 objectAtIndexedSubscript:v30];

          [(CPUIImageRowCell *)self _removeArtworkTitleItem:v32];
        }
      }
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __48__CPUIImageRowCell__layoutArtworkImagesIfNeeded__block_invoke;
      v33[3] = &unk_26482D530;
      v33[4] = self;
      *(double *)&v33[5] = v13;
      [v9 enumerateObjectsUsingBlock:v33];
    }
  }
}

void __48__CPUIImageRowCell__layoutArtworkImagesIfNeeded__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 reusableMediaViews];
  if ([v7 count] <= a3)
  {
  }
  else
  {
    CGFloat v8 = [*(id *)(a1 + 32) reusableMediaViews];
    double v23 = [v8 objectAtIndex:a3];

    objc_super v9 = v23;
    if (v23) {
      goto LABEL_6;
    }
  }
  double v10 = [_CPUIImageRowCellImageTitleItem alloc];
  v24 = -[_CPUIImageRowCellImageTitleItem initWithFrame:](v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_CPUIImageRowCellImageTitleItem *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  float v11 = [(_CPUIImageRowCellImageTitleItem *)v24 button];
  [v11 addTarget:*(void *)(a1 + 32) action:sel_gridCellItemTapped_ forControlEvents:0x2000];

  double v12 = [*(id *)(a1 + 32) reusableMediaViews];
  [v12 addObject:v24];

  double v13 = [*(id *)(a1 + 32) stackView];
  [v13 addArrangedSubview:v24];

  objc_super v9 = v24;
LABEL_6:
  v25 = v9;
  uint64_t v14 = [(_CPUIImageRowCellImageTitleItem *)v9 button];
  [v14 setTag:a3];

  double v15 = [*(id *)(a1 + 32) imageTitles];
  if ([v15 count] <= a3)
  {
    uint64_t v17 = &stru_26DC16290;
  }
  else
  {
    double v16 = [*(id *)(a1 + 32) imageTitles];
    uint64_t v17 = [v16 objectAtIndexedSubscript:a3];
  }
  double v18 = *(double *)(a1 + 40);
  int v19 = [*(id *)(a1 + 32) _showsImageTitles];
  double v20 = 32.0;
  if (!v19) {
    double v20 = 0.0;
  }
  -[_CPUIImageRowCellImageTitleItem setPreferredSize:](v25, "setPreferredSize:", v18, v18 + v20);
  double v21 = *(double *)(a1 + 40);
  double v22 = [*(id *)(a1 + 32) fallbackImage];
  [(_CPUIImageRowCellImageTitleItem *)v25 configureWithArtwork:v6 title:v17 imageSize:v22 fallbackImage:v21];
}

- (void)gridCellItemTapped:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
    double v5 = [(CPUIImageRowCell *)self selectGridItemBlock];

    if (v5)
    {
      id v6 = [(CPUIImageRowCell *)self selectGridItemBlock];
      v6[2](v6, [v4 tag]);
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)coreCellItemTapped:(id)a3
{
  id v4 = [(CPUIImageRowCell *)self selectTitleBlock];

  if (v4)
  {
    double v5 = [(CPUIImageRowCell *)self selectTitleBlock];
    v5[2]();
  }
}

- (void)_removeArtworkTitleItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 button];
  [v4 clearArtworkCatalogs];

  double v5 = [(CPUIImageRowCell *)self stackView];
  [v5 removeArrangedSubview:v7];

  id v6 = [(CPUIImageRowCell *)self reusableMediaViews];
  [v6 removeObject:v7];

  [v7 removeFromSuperview];
}

- (NSMutableArray)reusableMediaViews
{
  return *(NSMutableArray **)&self->_lastKnownBoundingSize.height;
}

- (void)setReusableMediaViews:(id)a3
{
}

- (NSArray)artworkCatalogs
{
  return &self->_reusableMediaViews->super;
}

- (void)setArtworkCatalogs:(id)a3
{
}

- (NSArray)imageTitles
{
  return self->_artworkCatalogs;
}

- (void)setImageTitles:(id)a3
{
}

- (_CPUIImageRowHighlightButton)focusIndicator
{
  return (_CPUIImageRowHighlightButton *)self->_imageTitles;
}

- (void)setFocusIndicator:(id)a3
{
}

- (UIImageView)chevronView
{
  return (UIImageView *)self->_focusIndicator;
}

- (void)setChevronView:(id)a3
{
}

- (UIImage)fallbackImage
{
  return (UIImage *)self->_chevronView;
}

- (void)setFallbackImage:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)self->_fallbackImage;
}

- (void)setActivityIndicator:(id)a3
{
}

- (id)selectGridItemBlock
{
  return self->_activityIndicator;
}

- (void)setSelectGridItemBlock:(id)a3
{
}

- (id)selectTitleBlock
{
  return self->_selectGridItemBlock;
}

- (void)setSelectTitleBlock:(id)a3
{
}

- (UIStackView)stackView
{
  return (UIStackView *)self->_selectTitleBlock;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewWidthConstraint
{
  return (NSLayoutConstraint *)self->_stackView;
}

- (void)setStackViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewHeightConstraint
{
  return self->_stackViewWidthConstraint;
}

- (void)setStackViewHeightConstraint:(id)a3
{
}

- (UIView)trailingView
{
  return (UIView *)self->_stackViewHeightConstraint;
}

- (UILabel)titleLabel
{
  return (UILabel *)self->_trailingView;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_stackViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong(&self->_selectTitleBlock, 0);
  objc_storeStrong(&self->_selectGridItemBlock, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_imageTitles, 0);
  objc_storeStrong((id *)&self->_artworkCatalogs, 0);
  objc_storeStrong((id *)&self->_reusableMediaViews, 0);
  objc_storeStrong((id *)&self->_lastKnownBoundingSize.height, 0);
}

@end