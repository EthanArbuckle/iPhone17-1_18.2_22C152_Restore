@interface HLPHelpTableOfContentCell
- (BOOL)RTL;
- (BOOL)closed;
- (BOOL)ignoreLevels;
- (BOOL)isSearchResult;
- (BOOL)showFirstLevelIcon;
- (BOOL)updateSeparatorInsetAutomatically;
- (CGAffineTransform)arrowTransform;
- (HLPHelpItem)helpItem;
- (HLPHelpTableOfContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HLPURLSessionItem)sectionImageURLSessionItem;
- (UIImageView)accessoryImageView;
- (UIImageView)sectionImageView;
- (UILabel)nameLabel;
- (id)accessibilityLabel;
- (int64_t)itemLevel;
- (void)cancelIconRequest;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryImageView:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setHelpItem:(id)a3;
- (void)setIgnoreLevels:(BOOL)a3;
- (void)setNameLabel:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSearchResult:(BOOL)a3;
- (void)setSectionImageURLSessionItem:(id)a3;
- (void)setSectionImageView:(id)a3;
- (void)setShowFirstLevelIcon:(BOOL)a3;
- (void)setUpdateSeparatorInsetAutomatically:(BOOL)a3;
- (void)toggle;
- (void)updateConstraints;
- (void)updateFont;
- (void)updateToggleImageAnimated:(BOOL)a3;
@end

@implementation HLPHelpTableOfContentCell

- (void)dealloc
{
  [(HLPHelpTableOfContentCell *)self cancelIconRequest];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D158] object:0];

  v4.receiver = self;
  v4.super_class = (Class)HLPHelpTableOfContentCell;
  [(HLPHelpTableOfContentCell *)&v4 dealloc];
}

- (HLPHelpTableOfContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v111.receiver = self;
  v111.super_class = (Class)HLPHelpTableOfContentCell;
  objc_super v4 = [(HLPHelpTableOfContentCell *)&v111 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];

    v4->_closed = 1;
    v6 = [MEMORY[0x263F1C408] sharedApplication];
    v4->_RTL = [v6 userInterfaceLayoutDirection] == 1;

    BOOL v7 = +[HLPCommonDefines isVisionOS];
    if (v7)
    {
      v8 = [MEMORY[0x263F1C6C8] configurationWithScale:1];
      v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.right" withConfiguration:v8];
      v10 = [MEMORY[0x263F1C550] secondaryLabelColor];
      uint64_t v11 = [v9 imageWithTintColor:v10 renderingMode:1];
    }
    else
    {
      v12 = (void *)MEMORY[0x263F1C6B0];
      v8 = [MEMORY[0x263F086E0] HLPBundle];
      v9 = [(HLPHelpTableOfContentCell *)v4 traitCollection];
      uint64_t v11 = [v12 imageNamed:@"HLPHelpTOCToggle" inBundle:v8 compatibleWithTraitCollection:v9];
    }

    v109 = (void *)v11;
    uint64_t v13 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v11];
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v13;

    [(UIImageView *)v4->_accessoryImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(HLPHelpTableOfContentCell *)v4 arrowTransform];
    v15 = v4->_accessoryImageView;
    *(_OWORD *)v110 = *(_OWORD *)&v110[7];
    *(_OWORD *)&v110[2] = *(_OWORD *)&v110[9];
    *(_OWORD *)&v110[4] = *(_OWORD *)&v110[11];
    [(UIImageView *)v15 setTransform:v110];
    v16 = [(HLPHelpTableOfContentCell *)v4 contentView];
    [v16 addSubview:v4->_accessoryImageView];

    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    sectionImageView = v4->_sectionImageView;
    v4->_sectionImageView = v17;

    [(UIImageView *)v4->_sectionImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_sectionImageView setHidden:1];
    v19 = [(HLPHelpTableOfContentCell *)v4 contentView];
    [v19 addSubview:v4->_sectionImageView];

    id v20 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (UILabel *)v21;

    [(UILabel *)v4->_nameLabel setLineBreakMode:4];
    [(UILabel *)v4->_nameLabel setLineBreakStrategy:0];
    [(UILabel *)v4->_nameLabel setNumberOfLines:0];
    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    if (v7)
    {
      v23 = [MEMORY[0x263F1C550] secondaryLabelColor];
      [(UILabel *)v4->_nameLabel setTextColor:v23];
    }
    [(HLPHelpTableOfContentCell *)v4 updateFont];
    v24 = [(HLPHelpTableOfContentCell *)v4 contentView];
    [v24 addSubview:v4->_nameLabel];

    v25 = [(UIImageView *)v4->_accessoryImageView leadingAnchor];
    v26 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v27 = [v26 leadingAnchor];
    uint64_t v28 = [v25 constraintEqualToAnchor:v27 constant:8.0];
    accessoryImageViewLeadingConstraint = v4->_accessoryImageViewLeadingConstraint;
    v4->_accessoryImageViewLeadingConstraint = (NSLayoutConstraint *)v28;

    v30 = [(UIImageView *)v4->_accessoryImageView centerYAnchor];
    v31 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v32 = [v31 centerYAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    [v33 setActive:1];

    LODWORD(v34) = 1148846080;
    [(UIImageView *)v4->_accessoryImageView setContentCompressionResistancePriority:0 forAxis:v34];
    v35 = [(UIImageView *)v4->_sectionImageView widthAnchor];
    uint64_t v36 = [v35 constraintEqualToConstant:0.0];
    sectionImageWidthConstraint = v4->_sectionImageWidthConstraint;
    v4->_sectionImageWidthConstraint = (NSLayoutConstraint *)v36;

    [(NSLayoutConstraint *)v4->_sectionImageWidthConstraint setActive:1];
    v38 = [(UIImageView *)v4->_sectionImageView heightAnchor];
    v39 = [(UIImageView *)v4->_sectionImageView widthAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(UIImageView *)v4->_sectionImageView centerYAnchor];
    v42 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v43 = [v42 centerYAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    LODWORD(v45) = 1148846080;
    [(UIImageView *)v4->_sectionImageView setContentCompressionResistancePriority:0 forAxis:v45];
    id v46 = objc_alloc_init(MEMORY[0x263F1C778]);
    v47 = [(HLPHelpTableOfContentCell *)v4 contentView];
    [v47 addLayoutGuide:v46];

    v48 = [v46 leadingAnchor];
    v49 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v50 = [v49 leadingAnchor];
    v51 = [v48 constraintEqualToAnchor:v50];
    [v51 setActive:1];

    v52 = [v46 trailingAnchor];
    v53 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v54 = [v53 trailingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    [v55 setActive:1];

    if (v7)
    {
      v56 = [(UILabel *)v4->_nameLabel trailingAnchor];
      v57 = [(UIImageView *)v4->_accessoryImageView leadingAnchor];
      v58 = [v56 constraintEqualToAnchor:v57 constant:-16.0];
      [v58 setActive:1];

      v59 = [(UILabel *)v4->_nameLabel leadingAnchor];
      v60 = [(HLPHelpTableOfContentCell *)v4 contentView];
      v61 = [v60 leadingAnchor];
      uint64_t v62 = [v59 constraintEqualToAnchor:v61 constant:0.0];
      labelLeadingConstraint = v4->_labelLeadingConstraint;
      v4->_labelLeadingConstraint = (NSLayoutConstraint *)v62;

      v64 = [(UIImageView *)v4->_sectionImageView leadingAnchor];
      v65 = [(HLPHelpTableOfContentCell *)v4 contentView];
      v66 = [v65 leadingAnchor];
      uint64_t v67 = [v64 constraintEqualToAnchor:v66];
      sectionImageLeadingConstraint = v4->_sectionImageLeadingConstraint;
      v4->_sectionImageLeadingConstraint = (NSLayoutConstraint *)v67;

      v69 = [(UIImageView *)v4->_accessoryImageView trailingAnchor];
      v70 = [(HLPHelpTableOfContentCell *)v4 contentView];
      v71 = [v70 trailingAnchor];
      uint64_t v72 = [v69 constraintEqualToAnchor:v71 constant:-8.0];
      p_accessoryImageViewTrailingConstraint = (id *)&v4->_accessoryImageViewTrailingConstraint;
      accessoryImageViewTrailingConstraint = v4->_accessoryImageViewTrailingConstraint;
      v4->_accessoryImageViewTrailingConstraint = (NSLayoutConstraint *)v72;

      double v75 = 40.0;
      v76 = v109;
    }
    else
    {
      v77 = [(UIImageView *)v4->_accessoryImageView widthAnchor];
      [v109 size];
      v78 = objc_msgSend(v77, "constraintEqualToConstant:");
      [v78 setActive:1];

      v79 = [(UILabel *)v4->_nameLabel trailingAnchor];
      v80 = [(HLPHelpTableOfContentCell *)v4 contentView];
      v81 = [v80 trailingAnchor];
      v82 = [v79 constraintEqualToAnchor:v81 constant:-8.0];
      [v82 setActive:1];

      v83 = [(UILabel *)v4->_nameLabel leadingAnchor];
      v84 = [(UIImageView *)v4->_accessoryImageView trailingAnchor];
      uint64_t v85 = [v83 constraintEqualToAnchor:v84 constant:0.0];
      v86 = v4->_labelLeadingConstraint;
      v4->_labelLeadingConstraint = (NSLayoutConstraint *)v85;

      v69 = [(UIImageView *)v4->_sectionImageView leadingAnchor];
      v76 = v109;
      v70 = [(UIImageView *)v4->_accessoryImageView trailingAnchor];
      uint64_t v87 = [v69 constraintEqualToAnchor:v70];
      v71 = v4->_sectionImageLeadingConstraint;
      v4->_sectionImageLeadingConstraint = (NSLayoutConstraint *)v87;
      double v75 = 44.0;
      p_accessoryImageViewTrailingConstraint = (id *)&v4->_accessoryImageViewLeadingConstraint;
    }

    [*p_accessoryImageViewTrailingConstraint setActive:1];
    v88 = [v46 heightAnchor];
    v89 = [v88 constraintGreaterThanOrEqualToConstant:v75];

    LODWORD(v90) = 1147207680;
    [v89 setPriority:v90];
    [v89 setActive:1];
    v91 = [v46 topAnchor];
    v92 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v93 = [v92 topAnchor];
    v94 = [v91 constraintEqualToAnchor:v93];
    [v94 setActive:1];

    v95 = [v46 bottomAnchor];
    v96 = [(HLPHelpTableOfContentCell *)v4 contentView];
    v97 = [v96 bottomAnchor];
    v98 = [v95 constraintEqualToAnchor:v97];
    [v98 setActive:1];

    v99 = [(UILabel *)v4->_nameLabel centerYAnchor];
    v100 = [v46 centerYAnchor];
    v101 = [v99 constraintEqualToAnchor:v100];
    [v101 setActive:1];

    v102 = [(UILabel *)v4->_nameLabel topAnchor];
    v103 = [v46 topAnchor];
    v104 = [v102 constraintEqualToAnchor:v103 constant:12.0];
    [v104 setActive:1];

    v105 = [(UILabel *)v4->_nameLabel bottomAnchor];
    v106 = [v46 bottomAnchor];
    v107 = [v105 constraintEqualToAnchor:v106 constant:-12.0];
    [v107 setActive:1];

    [(NSLayoutConstraint *)v4->_labelLeadingConstraint setActive:1];
    [(NSLayoutConstraint *)v4->_sectionImageLeadingConstraint setActive:1];
  }
  return v4;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)HLPHelpTableOfContentCell;
  [(HLPHelpTableOfContentCell *)&v5 prepareForReuse];
  self->_closed = 1;
  [(HLPHelpTableOfContentCell *)self arrowTransform];
  v3 = [(HLPHelpTableOfContentCell *)self accessoryImageView];
  v4[0] = v4[3];
  v4[1] = v4[4];
  v4[2] = v4[5];
  [v3 setTransform:v4];

  if (self->_updateSeparatorInsetAutomatically) {
    -[HLPHelpTableOfContentCell setSeparatorInset:](self, "setSeparatorInset:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
  [(HLPHelpTableOfContentCell *)self cancelIconRequest];
}

- (void)updateFont
{
  id v5 = (id)*MEMORY[0x263F1D260];
  if (+[HLPCommonDefines isVisionOS]
    && ![(HLPHelpItem *)self->_helpItem level])
  {
    id v3 = (id)*MEMORY[0x263F1D308];

    id v5 = v3;
  }
  objc_super v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:v5];
  [(UILabel *)self->_nameLabel setFont:v4];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);
  category = [v4 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  LODWORD(v6) = 1053609165;
  if (!IsAccessibilityCategory) {
    *(float *)&double v6 = 0.0;
  }
  [(UILabel *)self->_nameLabel _setHyphenationFactor:v6];
  [(HLPHelpTableOfContentCell *)self setNeedsLayout];
  [(HLPHelpTableOfContentCell *)self setNeedsUpdateConstraints];
  [(HLPHelpTableOfContentCell *)self setNeedsDisplay];
}

- (void)cancelIconRequest
{
  id v3 = +[HLPURLSessionManager defaultManager];
  [v3 cancelSessionItem:self->_sectionImageURLSessionItem];

  sectionImageURLSessionItem = self->_sectionImageURLSessionItem;
  self->_sectionImageURLSessionItem = 0;
}

- (void)setHelpItem:(id)a3
{
  id v5 = (HLPHelpItem *)a3;
  p_helpItem = &self->_helpItem;
  if (self->_helpItem != v5)
  {
    objc_storeStrong((id *)&self->_helpItem, a3);
    BOOL v7 = [(HLPHelpItem *)v5 decodedName];
    [(UILabel *)self->_nameLabel setText:v7];

    objc_opt_class();
    BOOL v8 = 1;
    [(UIImageView *)self->_accessoryImageView setHidden:(objc_opt_isKindOfClass() & 1) == 0];
    if (![(HLPHelpTableOfContentCell *)self itemLevel]) {
      BOOL v8 = !self->_showFirstLevelIcon;
    }
    [(UIImageView *)self->_sectionImageView setHidden:v8];
    [(HLPHelpTableOfContentCell *)self updateFont];
    uint64_t v9 = [(HLPHelpItem *)*p_helpItem iconURL];
    if (v9
      && (v10 = (void *)v9,
          char v11 = [(UIImageView *)self->_sectionImageView isHidden],
          v10,
          (v11 & 1) == 0))
    {
      [(UIImageView *)self->_sectionImageView setImage:0];
      [(UIImageView *)self->_sectionImageView setHidden:0];
      v12 = +[HLPURLSessionManager defaultManager];
      uint64_t v13 = [(HLPHelpItem *)*p_helpItem iconURL];
      v14 = [v13 absoluteString];

      if (v14)
      {
        v15 = (void *)MEMORY[0x263F089E0];
        v16 = [NSURL URLWithString:v14];
        v17 = [v15 requestWithURL:v16];

        v18 = +[HLPCommonDefines assetRequestHeaderFields];
        if (v18) {
          [v17 setAllHTTPHeaderFields:v18];
        }
        v19 = [v14 lastPathComponent];
        objc_initWeak(&location, self);
        id v20 = +[HLPImageCacheController sharedInstance];
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        v25 = __41__HLPHelpTableOfContentCell_setHelpItem___block_invoke;
        v26 = &unk_264579680;
        objc_copyWeak(&v27, &location);
        uint64_t v21 = [v20 formattedDataForRequest:v17 identifier:v19 completionHandler:&v23];
        sectionImageURLSessionItem = self->_sectionImageURLSessionItem;
        self->_sectionImageURLSessionItem = v21;

        if (self->_sectionImageURLSessionItem) {
          objc_msgSend(v12, "resumeSessionItem:", v23, v24, v25, v26);
        }
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [(UIImageView *)self->_sectionImageView setImage:0];
      [(UIImageView *)self->_sectionImageView setHidden:1];
    }
  }
  [(HLPHelpTableOfContentCell *)self setNeedsLayout];
  [(HLPHelpTableOfContentCell *)self setNeedsUpdateConstraints];
}

void __41__HLPHelpTableOfContentCell_setHelpItem___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = [WeakRetained sectionImageURLSessionItem];
  char v5 = [v4 isCancelled];

  if ((v5 & 1) == 0)
  {
    double v6 = [WeakRetained sectionImageView];
    [v6 setImage:v7];
  }
  [WeakRetained setSectionImageURLSessionItem:0];
}

- (void)setClosed:(BOOL)a3
{
  if (self->_closed != a3)
  {
    self->_closed = a3;
    [(HLPHelpTableOfContentCell *)self updateToggleImageAnimated:0];
  }
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)HLPHelpTableOfContentCell;
  [(HLPHelpTableOfContentCell *)&v2 layoutSubviews];
}

- (void)updateConstraints
{
  double v3 = 8.0;
  if ([(UIImageView *)self->_sectionImageView isHidden]) {
    double v4 = 0.0;
  }
  else {
    double v4 = 8.0;
  }
  [(NSLayoutConstraint *)self->_sectionImageLeadingConstraint setConstant:v4];
  int v5 = [(UIImageView *)self->_sectionImageView isHidden];
  double v6 = 26.0;
  if (v5) {
    double v6 = 0.0;
  }
  [(NSLayoutConstraint *)self->_sectionImageWidthConstraint setConstant:v6];
  uint64_t v7 = [(HLPHelpTableOfContentCell *)self itemLevel];
  BOOL v8 = +[HLPCommonDefines isVisionOS];
  double v9 = (double)v7 + -1.0;
  if (!v8 || v7 <= 0) {
    double v9 = (double)v7;
  }
  if (self->_showFirstLevelIcon) {
    double v10 = 42.0;
  }
  else {
    double v10 = 8.0;
  }
  double v11 = v9 * v10 + 8.0;
  if (!self->_ignoreLevels && v7 == 0)
  {
    if ([(UIImageView *)self->_sectionImageView isHidden]) {
      double v3 = 8.0;
    }
    else {
      double v3 = v10;
    }
  }
  double v13 = v11 + v3;
  if (v8)
  {
    [(NSLayoutConstraint *)self->_labelLeadingConstraint setConstant:v11];
  }
  else
  {
    [(NSLayoutConstraint *)self->_accessoryImageViewLeadingConstraint setConstant:v11];
    [(NSLayoutConstraint *)self->_labelLeadingConstraint setConstant:v3];
    [(UIImageView *)self->_accessoryImageView frame];
    double v13 = v13 + CGRectGetWidth(v15);
  }
  if (self->_updateSeparatorInsetAutomatically) {
    -[HLPHelpTableOfContentCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v13, 0.0, 0.0);
  }
  v14.receiver = self;
  v14.super_class = (Class)HLPHelpTableOfContentCell;
  [(HLPHelpTableOfContentCell *)&v14 updateConstraints];
}

- (int64_t)itemLevel
{
  if (self->_ignoreLevels) {
    return 0;
  }
  else {
    return [(HLPHelpItem *)self->_helpItem level];
  }
}

- (void)toggle
{
  self->_closed ^= 1u;
  [(HLPHelpTableOfContentCell *)self updateToggleImageAnimated:1];
}

- (CGAffineTransform)arrowTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  if (BYTE3(self[22].a))
  {
    uint64_t v3 = MEMORY[0x263F000D0];
    long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
    if (!BYTE5(self[22].a)) {
      return self;
    }
    CGFloat v5 = 3.14159265;
  }
  else
  {
    CGFloat v5 = 1.57079633;
  }
  return CGAffineTransformMakeRotation(retstr, v5);
}

- (void)updateToggleImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CGFloat v5 = [(HLPHelpTableOfContentCell *)self accessoryImageView];
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
    [(HLPHelpTableOfContentCell *)self arrowTransform];
    if (v3)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      long long v13 = v16;
      v12[2] = __55__HLPHelpTableOfContentCell_updateToggleImageAnimated___block_invoke;
      v12[3] = &unk_2645796A8;
      v12[4] = self;
      long long v14 = v17;
      long long v15 = v18;
      [MEMORY[0x263F1CB60] animateWithDuration:v12 animations:0 completion:0.3];
    }
    else
    {
      long long v9 = v16;
      long long v10 = v17;
      long long v11 = v18;
      uint64_t v7 = [(HLPHelpTableOfContentCell *)self accessoryImageView];
      v8[0] = v9;
      v8[1] = v10;
      v8[2] = v11;
      [v7 setTransform:v8];
    }
  }
}

void __55__HLPHelpTableOfContentCell_updateToggleImageAnimated___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "accessoryImageView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v4 = [MEMORY[0x263F086E0] HLPBundle];
  CGFloat v5 = v4;
  if (isKindOfClass) {
    char v6 = @"Section:";
  }
  else {
    char v6 = @"Topic:";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26D29FC58 table:0];

  BOOL v8 = NSString;
  long long v9 = [(HLPHelpItem *)self->_helpItem name];
  long long v10 = [v8 stringWithFormat:@"%@. %@", v9, v7];

  return v10;
}

- (BOOL)isSearchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(BOOL)a3
{
  self->_searchResult = a3;
}

- (BOOL)showFirstLevelIcon
{
  return self->_showFirstLevelIcon;
}

- (void)setShowFirstLevelIcon:(BOOL)a3
{
  self->_showFirstLevelIcon = a3;
}

- (BOOL)ignoreLevels
{
  return self->_ignoreLevels;
}

- (void)setIgnoreLevels:(BOOL)a3
{
  self->_ignoreLevels = a3;
}

- (BOOL)closed
{
  return self->_closed;
}

- (BOOL)updateSeparatorInsetAutomatically
{
  return self->_updateSeparatorInsetAutomatically;
}

- (void)setUpdateSeparatorInsetAutomatically:(BOOL)a3
{
  self->_updateSeparatorInsetAutomatically = a3;
}

- (HLPHelpItem)helpItem
{
  return self->_helpItem;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UIImageView)sectionImageView
{
  return self->_sectionImageView;
}

- (void)setSectionImageView:(id)a3
{
}

- (HLPURLSessionItem)sectionImageURLSessionItem
{
  return self->_sectionImageURLSessionItem;
}

- (void)setSectionImageURLSessionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionImageURLSessionItem, 0);
  objc_storeStrong((id *)&self->_sectionImageView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_helpItem, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionImageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionImageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryImageViewLeadingConstraint, 0);
}

@end