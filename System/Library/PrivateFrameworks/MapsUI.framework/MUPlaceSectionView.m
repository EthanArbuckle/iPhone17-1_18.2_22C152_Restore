@interface MUPlaceSectionView
+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4;
+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5 alwaysInsetContentView:(BOOL)a6;
- (MUPlaceSectionFooterViewModel)footerViewModel;
- (MUPlaceSectionHeaderViewModel)headerViewModel;
- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4;
- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4 sectionHeaderViewModel:(id)a5 sectionFooterViewModel:(id)a6;
- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4;
- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5;
- (int64_t)style;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateForContentSizeChange;
- (void)attachViewToContentView:(id)a3;
- (void)beginAnimatingActivityIndicator;
- (void)configureWithSectionController:(id)a3;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)hideBottomSeperator;
- (void)setHeaderAXIdentifierWithBaseString:(id)a3;
@end

@implementation MUPlaceSectionView

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4
{
  return [(MUPlaceSectionView *)self initWithStyle:a3 alwaysHideSeparators:a4 sectionHeaderViewModel:0 sectionFooterViewModel:0];
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5
{
  return [(MUPlaceSectionView *)self initWithStyle:a3 alwaysHideSeparators:0 sectionHeaderViewModel:a4 sectionFooterViewModel:a5];
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 alwaysHideSeparators:(BOOL)a4 sectionHeaderViewModel:(id)a5 sectionFooterViewModel:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceSectionView;
  v13 = -[MUPlaceSectionView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v14 = v13;
  if (v13)
  {
    v13->_alwaysHideSeparators = a4;
    objc_storeStrong((id *)&v13->_headerViewModel, a5);
    objc_storeStrong((id *)&v14->_footerViewModel, a6);
    v14->_style = a3;
    [(MUPlaceSectionView *)v14 _setupSubviews];
    [(MUPlaceSectionView *)v14 _setupConstraints];
    v15 = self;
    v20[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v17 = (id)[(MUPlaceSectionView *)v14 registerForTraitChanges:v16 withTarget:v14 action:sel__updateForContentSizeChange];
  }
  return v14;
}

- (MUPlaceSectionView)initWithStyle:(int64_t)a3 sectionHeaderViewModel:(id)a4
{
  return [(MUPlaceSectionView *)self initWithStyle:a3 sectionHeaderViewModel:a4 sectionFooterViewModel:0];
}

- (void)_setupSubviews
{
  if (self->_headerViewModel)
  {
    v3 = [[MUPlaceSectionHeaderView alloc] initWithViewModel:self->_headerViewModel];
    headerView = self->_headerView;
    self->_headerView = v3;

    [(MUPlaceSectionHeaderView *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUPlaceSectionView *)self addSubview:self->_headerView];
  }
  v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v5;

  [(MUPlaceSectionView *)self addLayoutGuide:self->_contentLayoutGuide];
  if (self->_footerViewModel)
  {
    v7 = [MULinkView alloc];
    v8 = -[MULinkView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    footerView = self->_footerView;
    self->_footerView = v8;

    [(MULinkView *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (self->_style == 1) {
      -[MULinkView setDirectionalLayoutMargins:](self->_footerView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
    }
    v10 = [(MUPlaceSectionFooterViewModel *)self->_footerViewModel attributedText];
    [(MULinkView *)self->_footerView setAttributedText:v10];

    id v11 = [(MUPlaceSectionFooterViewModel *)self->_footerViewModel actionBlock];

    if (v11)
    {
      objc_initWeak(&location, self);
      id v12 = self->_footerView;
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __36__MUPlaceSectionView__setupSubviews__block_invoke;
      v16 = &unk_1E574FC68;
      objc_copyWeak(&v17, &location);
      [(MULinkView *)v12 setSelectionBlock:&v13];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    -[MUPlaceSectionView addSubview:](self, "addSubview:", self->_footerView, v13, v14, v15, v16);
  }
}

void __36__MUPlaceSectionView__setupSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = [WeakRetained[57] actionBlock];
    v2[2]();

    WeakRetained = v3;
  }
}

- (void)_setupConstraints
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v49 = !self->_alwaysHideSeparators
     && +[MUInfoCardStyle containerStyle] == 1;
  v48 = v3;
  if (self->_headerViewModel)
  {
    v46 = [(MUPlaceSectionHeaderView *)self->_headerView leadingAnchor];
    v44 = [(MUPlaceSectionView *)self leadingAnchor];
    v42 = [v46 constraintEqualToAnchor:v44 constant:19.0];
    v53[0] = v42;
    v40 = [(MUPlaceSectionHeaderView *)self->_headerView topAnchor];
    v38 = [(MUPlaceSectionView *)self topAnchor];
    v37 = [v40 constraintEqualToAnchor:v38];
    v53[1] = v37;
    v4 = [(MUPlaceSectionHeaderView *)self->_headerView trailingAnchor];
    v5 = [(MUPlaceSectionView *)self trailingAnchor];
    v6 = [v4 constraintEqualToAnchor:v5 constant:-16.0];
    v53[2] = v6;
    v7 = [(MUPlaceSectionHeaderView *)self->_headerView bottomAnchor];
    v8 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:-10.0];
    v53[3] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];
    [v3 addObjectsFromArray:v10];
  }
  else
  {
    id v11 = [(MUPlaceSectionView *)self topAnchor];
    id v12 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12];
    [v3 addObject:v13];
  }
  if (self->_style == 1) {
    double v14 = 16.0;
  }
  else {
    double v14 = 0.0;
  }
  v15 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v16 = [(MUPlaceSectionView *)self leadingAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:v14];
  v52[0] = v17;
  v18 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  objc_super v19 = [(MUPlaceSectionView *)self trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:-v14];
  v52[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  [v48 addObjectsFromArray:v21];

  if (v49) {
    double v22 = -16.0;
  }
  else {
    double v22 = 0.0;
  }
  footerView = self->_footerView;
  v24 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  if (footerView)
  {
    uint64_t v47 = [(MULinkView *)self->_footerView topAnchor];
    uint64_t v45 = [v24 constraintEqualToAnchor:v47 constant:-8.0];
    v50[0] = v45;
    v25 = [(MULinkView *)self->_footerView leadingAnchor];
    v43 = [(MUPlaceSectionView *)self leadingAnchor];
    v41 = [v25 constraintEqualToAnchor:v43 constant:16.0];
    v50[1] = v41;
    v39 = [(MULinkView *)self->_footerView trailingAnchor];
    v26 = [(MUPlaceSectionView *)self trailingAnchor];
    v27 = [v39 constraintEqualToAnchor:v26 constant:-16.0];
    v50[2] = v27;
    v28 = [(MULinkView *)self->_footerView bottomAnchor];
    v29 = [(MUPlaceSectionView *)self bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:v22];
    v50[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    v32 = v48;
    [v48 addObjectsFromArray:v31];

    v33 = (void *)v47;
    v34 = (void *)v45;
  }
  else
  {
    v33 = [(MUPlaceSectionView *)self bottomAnchor];
    v34 = [v24 constraintEqualToAnchor:v33 constant:v22];
    v51 = v34;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    v32 = v48;
    [v48 addObjectsFromArray:v25];
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v32];
  if (v49)
  {
    v35 = [(UIView *)self _mapsui_addHairlineAtBottomWithLeadingMargin:16.0 trailingMargin:0.0];
    hairlineView = self->_hairlineView;
    self->_hairlineView = v35;
  }
}

- (void)attachViewToContentView:(id)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MUPlaceSectionView *)self addSubview:v4];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 setAccessibilityIdentifier:v6];

  id v17 = (void *)MEMORY[0x1E4F28DC8];
  v20 = [v4 leadingAnchor];
  objc_super v19 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v7 = [v4 trailingAnchor];
  v8 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  v10 = [v4 topAnchor];
  id v11 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  uint64_t v13 = [v4 bottomAnchor];

  double v14 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  [v17 activateConstraints:v16];
}

- (void)_updateForContentSizeChange
{
  id v3 = [(MUPlaceSectionFooterViewModel *)self->_footerViewModel attributedText];
  [(MULinkView *)self->_footerView setAttributedText:v3];
}

- (void)hideBottomSeperator
{
}

- (void)setHeaderAXIdentifierWithBaseString:(id)a3
{
  id v4 = [a3 stringByAppendingString:@"Header"];
  [(MUPlaceSectionHeaderView *)self->_headerView setAccessibilityIdentifier:v4];
}

- (void)beginAnimatingActivityIndicator
{
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
}

- (MUPlaceSectionHeaderViewModel)headerViewModel
{
  return self->_headerViewModel;
}

- (MUPlaceSectionFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_headerViewModel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4
{
  return (id)[a1 cardShadowSectionViewForContentView:a3 sectionHeaderViewModel:a4 sectionFooterViewModel:0 alwaysInsetContentView:0];
}

+ (id)cardShadowSectionViewForContentView:(id)a3 sectionHeaderViewModel:(id)a4 sectionFooterViewModel:(id)a5 alwaysInsetContentView:(BOOL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = (MUPlatterView *)a3;
  int64_t v12 = +[MUInfoCardStyle containerStyle];
  uint64_t v13 = [MUPlaceSectionView alloc];
  if (v12 != 1 || a6)
  {
    double v14 = [(MUPlaceSectionView *)v13 initWithStyle:1 sectionHeaderViewModel:v10 sectionFooterViewModel:v9];

    v15 = [[MUPlatterView alloc] initWithContentView:v11];
    [(MUPlaceSectionView *)v14 attachViewToContentView:v15];
    id v11 = v15;
  }
  else
  {
    double v14 = [(MUPlaceSectionView *)v13 initWithStyle:0 sectionHeaderViewModel:v10 sectionFooterViewModel:v9];

    [(MUPlaceSectionView *)v14 attachViewToContentView:v11];
  }

  return v14;
}

- (void)configureWithSectionController:(id)a3
{
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v5 stringByReplacingOccurrencesOfString:@"Controller" withString:&stru_1EE3BF360];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"MU" withString:&stru_1EE3BF360];

  [(MUPlaceSectionView *)self setAccessibilityIdentifier:v7];
  if (self->_headerViewModel) {
    [(MUPlaceSectionView *)self setHeaderAXIdentifierWithBaseString:v7];
  }
}

@end