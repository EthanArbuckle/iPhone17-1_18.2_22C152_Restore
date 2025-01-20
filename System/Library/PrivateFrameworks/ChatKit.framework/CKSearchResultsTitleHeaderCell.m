@interface CKSearchResultsTitleHeaderCell
+ (double)desiredZPosition;
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (BOOL)isPinnedEffectVisible;
- (CALayer)topHairline;
- (CKSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3;
- (CKSearchResultsTitleHeaderCellDelegate)delegate;
- (UIButton)showAllButton;
- (UIEdgeInsets)marginInsets;
- (UILabel)sectionTitle;
- (UIView)separatorView;
- (UIVisualEffectView)backgroundVisualEffectView;
- (double)leadingSeparatorInsets;
- (double)titleBottomPadding;
- (double)titleTopPadding;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (unint64_t)sectionIndex;
- (void)_showAllButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsAXFontSizeWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5;
- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5;
- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5;
- (void)prepareForReuse;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingSeparatorInsets:(double)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setPinnedEffectVisible:(BOOL)a3;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setShowAllButton:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleBottomPadding:(double)a3;
- (void)setTitleTopPadding:(double)a3;
- (void)setTopHairline:(id)a3;
@end

@implementation CKSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return @"SearchHeaderSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"SearchResultsTitle";
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (BOOL)isPinnedEffectVisible
{
  return self->_pinnedEffectVisible;
}

- (void)setPinnedEffectVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_pinnedEffectVisible = a3;
  BOOL v5 = !a3;
  [(UIVisualEffectView *)self->_backgroundVisualEffectView setHidden:!a3];
  if (CKIsRunningInMacCatalyst() || v3)
  {
    [(CKSearchResultsTitleHeaderCell *)self setBackgroundColor:0];
  }
  else
  {
    v6 = [MEMORY[0x1E4F428B8] whiteColor];
    [(CKSearchResultsTitleHeaderCell *)self setBackgroundColor:v6];
  }
  if (CKIsRunningInMacCatalyst()) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v5;
  }
  separatorView = self->_separatorView;

  [(UIView *)separatorView setHidden:v7];
}

- (CKSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)CKSearchResultsTitleHeaderCell;
  BOOL v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_pinnedEffectVisible = 0;
    if (CKIsRunningInMacCatalyst())
    {
      BOOL v5 = +[CKUIBehavior sharedBehaviors];
      v6 = [v5 theme];
      uint64_t v7 = [v6 spotlightSearchSegmentedControlBackgroundColor];
      [(CKSearchResultsTitleHeaderCell *)v4 setBackgroundColor:v7];
    }
    else
    {
      [(CKSearchResultsTitleHeaderCell *)v4 setBackgroundColor:0];
    }
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    [(UIView *)v4->_separatorView setHidden:1];
    v10 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v10];

    [(CKSearchResultsTitleHeaderCell *)v4 addSubview:v4->_separatorView];
    v11 = [MEMORY[0x1E4F427D8] effectWithStyle:1100];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v11];
    [v12 setHidden:1];
    [(CKSearchResultsTitleHeaderCell *)v4 addSubview:v12];
    objc_storeStrong((id *)&v4->_backgroundVisualEffectView, v12);
    v13 = +[CKUIBehavior sharedBehaviors];
    int v14 = [v13 isAccessibilityPreferredContentSizeCategory];

    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = v15;
    if (v14)
    {
      [v15 searchResultsTitleHeaderAXTopPadding];
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v4, "setTitleTopPadding:");

      v17 = +[CKUIBehavior sharedBehaviors];
      [v17 searchResultsTitleHeaderAXBottomPadding];
    }
    else
    {
      [v15 searchResultsTitleHeaderTopPadding];
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v4, "setTitleTopPadding:");

      v17 = +[CKUIBehavior sharedBehaviors];
      [v17 searchResultsTitleHeaderBottomPadding];
    }
    -[CKSearchResultsTitleHeaderCell setTitleBottomPadding:](v4, "setTitleBottomPadding:");

    id v18 = objc_alloc(MEMORY[0x1E4F42B38]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v19 setAdjustsFontForContentSizeCategory:1];
    v20 = +[CKUIBehavior sharedBehaviors];
    v21 = [v20 searchHeaderFont];
    [v19 setFont:v21];

    [(CKSearchResultsTitleHeaderCell *)v4 setSectionTitle:v19];
    [(CKSearchResultsTitleHeaderCell *)v4 addSubview:v19];
    v22 = objc_alloc_init(CKStandardButton);
    [(CKStandardButton *)v22 addTarget:v4 action:sel__showAllButtonTapped_ forControlEvents:64];
    v23 = [(CKStandardButton *)v22 titleLabel];
    v24 = +[CKUIBehavior sharedBehaviors];
    v25 = [v24 searchHeaderButtonFont];
    [v23 setFont:v25];

    v26 = +[CKUIBehavior sharedBehaviors];
    v27 = [v26 theme];
    v28 = [v27 detailsSeeAllButtonBackgroundColor];
    [(CKStandardButton *)v22 setBackgroundColor:v28];

    v29 = +[CKUIBehavior sharedBehaviors];
    v30 = [v29 theme];
    v31 = [v30 detailsSeeAllButtonTextColor];
    [(CKStandardButton *)v22 setTintColor:v31];

    v32 = [(CKStandardButton *)v22 titleLabel];
    [v32 setAdjustsFontForContentSizeCategory:1];

    [(CKSearchResultsTitleHeaderCell *)v4 setShowAllButton:v22];
    [(CKSearchResultsTitleHeaderCell *)v4 addSubview:v22];
    v33 = [MEMORY[0x1E4F39BE8] layer];
    [(CKSearchResultsTitleHeaderCell *)v4 setTopHairline:v33];
    v34 = [(CKSearchResultsTitleHeaderCell *)v4 layer];
    [v34 addSublayer:v33];
  }
  return v4;
}

- (void)layoutSubviews
{
  v56.receiver = self;
  v56.super_class = (Class)CKSearchResultsTitleHeaderCell;
  [(CKSearchResultsTitleHeaderCell *)&v56 layoutSubviews];
  if (!CKIsRunningInMacCatalyst())
  {
    BOOL v3 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
    v4 = CKFrameworkBundle();
    BOOL v5 = [v4 localizedStringForKey:@"SEARCH_SHOW_MORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v3 setTitle:v5 forState:0];
  }
  int v6 = [(CKSearchResultsTitleHeaderCell *)self _shouldReverseLayoutDirection];
  [(CKSearchResultsTitleHeaderCell *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(CKSearchResultsTitleHeaderCell *)self marginInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(CKSearchResultsTitleHeaderCell *)self safeAreaInsets];
  double v51 = v23;
  [(CKSearchResultsTitleHeaderCell *)self safeAreaInsets];
  double v50 = v24;
  v25 = +[CKUIBehavior sharedBehaviors];
  int v26 = [v25 isAccessibilityPreferredContentSizeCategory];

  double v54 = v16;
  double v55 = v20;
  double v52 = v22;
  double v53 = v18;
  if (CKPixelWidth_once_5 != -1) {
    dispatch_once(&CKPixelWidth_once_5, &__block_literal_global_87);
  }
  uint64_t v27 = v6 ^ 1u;
  double v28 = *(double *)&CKPixelWidth_sPixel_5;
  v57.origin.x = v8;
  v57.origin.y = v10;
  v57.size.width = v12;
  v57.size.height = v14;
  double Width = CGRectGetWidth(v57);
  v58.origin.x = v8;
  v58.origin.y = v10;
  v58.size.width = v12;
  v58.size.height = v14;
  double MinX = CGRectGetMinX(v58);
  v59.origin.x = v8;
  v59.origin.y = v10;
  v59.size.width = v12;
  v59.size.height = v14;
  CGFloat v31 = CGRectGetMaxY(v59) - v28;
  v32 = [(CKSearchResultsTitleHeaderCell *)self separatorView];
  objc_msgSend(v32, "setFrame:", MinX, v31, Width, v28);

  int v33 = CKIsRunningInMacCatalyst();
  v34 = [(CKSearchResultsTitleHeaderCell *)self topHairline];
  v35 = v34;
  if (v33)
  {
    [v34 setHidden:1];
  }
  else
  {
    objc_super v36 = +[CKUIBehavior sharedBehaviors];
    v37 = [v36 theme];
    id v38 = [v37 spotlightSearchCellHairlineColor];
    objc_msgSend(v35, "setBackgroundColor:", objc_msgSend(v38, "CGColor"));

    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [(CKSearchResultsTitleHeaderCell *)self leadingSeparatorInsets];
    double v41 = v40;
    [(CKSearchResultsTitleHeaderCell *)self leadingSeparatorInsets];
    double v43 = v12 - v42;
    if (CKPixelWidth_once_5 != -1) {
      dispatch_once(&CKPixelWidth_once_5, &__block_literal_global_87);
    }
    double v44 = *(double *)&CKPixelWidth_sPixel_5;
    v35 = [(CKSearchResultsTitleHeaderCell *)self topHairline];
    objc_msgSend(v35, "setFrame:", v41, v39, v43, v44);
  }
  double v45 = v52 + v50;

  v46 = [(CKSearchResultsTitleHeaderCell *)self backgroundVisualEffectView];
  objc_msgSend(v46, "setFrame:", v8, v10, v12, v14);

  v47 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v47 sizeToFit];

  v48 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v48 sizeToFit];

  double v49 = v53 + v51;
  if (v26) {
    -[CKSearchResultsTitleHeaderCell layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:", v27, v8, v10, v12, v14, v54, v49, v55, v45);
  }
  else {
    -[CKSearchResultsTitleHeaderCell layoutSubviewsWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsWithBounds:layoutMargins:isLTR:", v27, v8, v10, v12, v14, v54, v49, v55, v45);
  }
}

- (void)layoutSubviewsAXFontSizeWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  double right = a4.right;
  double left = a4.left;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  double v10 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v10 frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v41 = left;
  if (!a5)
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v19 = CGRectGetWidth(v43);
    v44.origin.CGFloat x = v12;
    v44.origin.CGFloat y = v14;
    v44.size.CGFloat width = v16;
    v44.size.CGFloat height = v18;
    double left = v19 - CGRectGetWidth(v44) - right;
  }
  [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
  double v21 = v20;
  double v22 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  CGFloat v23 = v16;
  CGFloat v38 = v18;
  objc_msgSend(v22, "setFrame:", left, v21, v16, v18);

  double v24 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v24 frame];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  double v30 = v29;
  double v32 = v31;

  if (!a5)
  {
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = rect;
    v45.size.CGFloat height = height;
    double v33 = CGRectGetWidth(v45);
    v46.origin.CGFloat x = v26;
    v46.origin.CGFloat y = v28;
    v46.size.CGFloat width = v30;
    v46.size.CGFloat height = v32;
    double v41 = v33 - CGRectGetWidth(v46) - right;
  }
  v47.origin.CGFloat x = left;
  v47.origin.CGFloat y = v21;
  v47.size.CGFloat width = v23;
  v47.size.CGFloat height = v38;
  double MaxY = CGRectGetMaxY(v47);
  id v40 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v40, "setFrame:", v41, MaxY, v30, v32);
}

- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  BOOL v5 = a5;
  double right = a4.right;
  double left = a4.left;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v12 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v12 frame];
  CGFloat v14 = v13;
  double v57 = v15;
  double v58 = v16;

  double v17 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v17 bounds];
  double v19 = v18;

  double v20 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  double v21 = [v20 titleLabel];
  double v22 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v22 bounds];
  objc_msgSend(v21, "sizeThatFits:", v23, v24);
  double v26 = v25;

  int v27 = CKIsRunningInMacCatalyst();
  CGFloat rect = width;
  CGFloat v28 = x;
  CGFloat v29 = y;
  CGFloat v30 = width;
  CGFloat v31 = height;
  if (v27)
  {
    CGFloat v32 = CGRectGetMinY(*(CGRect *)&v28) + (v19 - v26) * -0.5;
    [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
    double v34 = v32 + v33;
  }
  else
  {
    double v34 = CGRectGetMidY(*(CGRect *)&v28) + v19 * -0.5;
  }
  double v35 = left;
  if (v5)
  {
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = rect;
    v64.size.CGFloat height = height;
    double v36 = CGRectGetWidth(v64);
    v65.origin.CGFloat x = v14;
    v65.origin.CGFloat y = v34;
    v65.size.CGFloat width = v57;
    v65.size.CGFloat height = v58;
    double v35 = v36 - CGRectGetWidth(v65) - right;
  }
  v37 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v37, "setFrame:", v35, v34, v57, v58);

  CGFloat v38 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v38 frame];
  CGFloat v54 = v40;
  CGFloat v55 = v39;
  double v56 = v41;

  v66.origin.CGFloat x = x;
  CGFloat v59 = y;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = rect;
  CGFloat v42 = height;
  v66.size.CGFloat height = height;
  double v43 = left;
  CGFloat v44 = CGRectGetWidth(v66) - left;
  CGRect v45 = +[CKUIBehavior sharedBehaviors];
  [v45 searchResultsTitleHeaderInterItemSpacing];
  CGFloat v47 = v44 - v46;
  v67.origin.CGFloat x = v35;
  v67.origin.CGFloat y = v34;
  v67.size.CGFloat width = v57;
  v67.size.CGFloat height = v58;
  double v48 = v47 - CGRectGetWidth(v67) - right;

  if (!v5)
  {
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = v59;
    v68.size.CGFloat width = rect;
    v68.size.CGFloat height = v42;
    double v49 = CGRectGetWidth(v68);
    v69.origin.CGFloat y = v54;
    v69.origin.CGFloat x = v55;
    v69.size.CGFloat width = v48;
    v69.size.CGFloat height = v56;
    double v43 = v49 - CGRectGetWidth(v69) - right;
  }
  if (CKIsRunningInMacCatalyst())
  {
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = v59;
    v70.size.CGFloat width = rect;
    v70.size.CGFloat height = v42;
    double MinY = CGRectGetMinY(v70);
    [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
    double v52 = MinY + v51;
    double v53 = v56;
  }
  else
  {
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = v59;
    v71.size.CGFloat width = rect;
    v71.size.CGFloat height = v42;
    double v53 = v56;
    double v52 = CGRectGetMidY(v71) + v56 * -0.5;
  }
  recta = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  objc_msgSend(recta, "setFrame:", v43, v52, v48, v53);
}

- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  BOOL v5 = a5;
  double right = a4.right;
  double left = a4.left;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v11 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v11 frame];
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  CGFloat rect = height;
  if (v5)
  {
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    double v20 = x;
    double v21 = CGRectGetWidth(v63);
    v64.origin.CGFloat x = v13;
    v64.origin.CGFloat y = v15;
    v64.size.CGFloat width = v17;
    v64.size.CGFloat height = v19;
    double v22 = v21 - CGRectGetWidth(v64) - right;
    double v23 = +[CKUIBehavior sharedBehaviors];
    [v23 searchSeeAllButtonTrailingMargin];
    double v25 = v22 - v24;
    CGFloat x = v20;
    CGFloat height = rect;
  }
  else
  {
    double v23 = +[CKUIBehavior sharedBehaviors];
    [v23 searchSeeAllButtonTrailingMargin];
    double v25 = left + v26;
  }

  int v27 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v27, "setFrame:", v25, v15, v17, v19);

  CGFloat v28 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v28 frame];
  CGFloat v56 = v29;
  CGFloat v57 = v30;

  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  CGFloat v31 = x;
  CGFloat v32 = CGRectGetWidth(v65) - left;
  double v33 = +[CKUIBehavior sharedBehaviors];
  [v33 searchResultsTitleHeaderTextLeadingMargin];
  CGFloat v35 = v32 - v34;
  double v36 = +[CKUIBehavior sharedBehaviors];
  [v36 searchResultsTitleHeaderInterItemSpacing];
  CGFloat v38 = v35 - v37;
  v66.origin.CGFloat x = v25;
  v66.origin.CGFloat y = v15;
  v66.size.CGFloat width = v17;
  v66.size.CGFloat height = v19;
  CGFloat v39 = v38 - CGRectGetWidth(v66) - right;
  double v40 = +[CKUIBehavior sharedBehaviors];
  [v40 searchSeeAllButtonTrailingMargin];
  double v42 = v39 - v41;

  double v43 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  CGFloat v44 = [v43 font];
  [v44 _bodyLeading];
  double v46 = v45;

  if (v5)
  {
    CGFloat v47 = +[CKUIBehavior sharedBehaviors];
    [v47 searchResultsTitleHeaderTextLeadingMargin];
    double v49 = left + v48;
    CGFloat v50 = v57;
  }
  else
  {
    v67.origin.CGFloat x = v31;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = rect;
    double v51 = CGRectGetWidth(v67);
    v68.origin.CGFloat x = v56;
    CGFloat v50 = v57;
    v68.origin.CGFloat y = v57;
    v68.size.CGFloat width = v42;
    v68.size.CGFloat height = v46;
    double v52 = v51 - CGRectGetWidth(v68) - right;
    CGFloat v47 = +[CKUIBehavior sharedBehaviors];
    [v47 searchResultsTitleHeaderTextLeadingMargin];
    double v49 = v52 - v53;
  }

  v69.origin.CGFloat x = v31;
  v69.origin.CGFloat y = y;
  v69.size.CGFloat width = width;
  v69.size.CGFloat height = rect;
  double MidY = CGRectGetMidY(v69);
  v70.origin.CGFloat x = v49;
  v70.origin.CGFloat y = v50;
  v70.size.CGFloat width = v42;
  v70.size.CGFloat height = v46;
  double v55 = MidY + CGRectGetHeight(v70) * -0.5;
  recta = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  objc_msgSend(recta, "setFrame:", v49, v55, v42, v46);
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)CKSearchResultsTitleHeaderCell;
  [(CKSearchResultsTitleHeaderCell *)&v7 prepareForReuse];
  BOOL v3 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v3 setText:0];

  [(CKSearchResultsTitleHeaderCell *)self setSectionIndex:0];
  [(CKSearchResultsTitleHeaderCell *)self setPinnedEffectVisible:0];
  if (CKIsRunningInMacCatalyst())
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    BOOL v5 = [v4 theme];
    int v6 = [v5 spotlightSearchSegmentedControlBackgroundColor];
    [(CKSearchResultsTitleHeaderCell *)self setBackgroundColor:v6];
  }
  else
  {
    [(CKSearchResultsTitleHeaderCell *)self setBackgroundColor:0];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v5 setText:v4];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  objc_msgSend(v13, "sizeThatFits:", v10, v12);
  double v15 = v14;

  double v16 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v16, "sizeThatFits:", v10, v12);
  double v18 = v17;

  double v19 = +[CKUIBehavior sharedBehaviors];
  int v20 = [v19 isAccessibilityPreferredContentSizeCategory];

  [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
  if (v20)
  {
    double v22 = v18 + v15 + v21;
    [(CKSearchResultsTitleHeaderCell *)self titleBottomPadding];
    double v24 = v23;
  }
  else
  {
    double v24 = v15 + v21;
    [(CKSearchResultsTitleHeaderCell *)self titleBottomPadding];
    double v22 = v25;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v24 + v22);

  return v4;
}

- (void)_showAllButtonTapped:(id)a3
{
  id v4 = [(CKSearchResultsTitleHeaderCell *)self delegate];
  [v4 searchResultsTitleCellShowAllButtonTapped:self];
}

- (UIEdgeInsets)marginInsets
{
  double top = self->marginInsets.top;
  double left = self->marginInsets.left;
  double bottom = self->marginInsets.bottom;
  double right = self->marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (CKSearchResultsTitleHeaderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKSearchResultsTitleHeaderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndeCGFloat x = a3;
}

- (UIButton)showAllButton
{
  return self->_showAllButton;
}

- (void)setShowAllButton:(id)a3
{
}

- (double)leadingSeparatorInsets
{
  return self->_leadingSeparatorInsets;
}

- (void)setLeadingSeparatorInsets:(double)a3
{
  self->_leadingSeparatorInsets = a3;
}

- (UILabel)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (CALayer)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
}

- (double)titleTopPadding
{
  return self->_titleTopPadding;
}

- (void)setTitleTopPadding:(double)a3
{
  self->_titleTopPadding = a3;
}

- (double)titleBottomPadding
{
  return self->_titleBottomPadding;
}

- (void)setTitleBottomPadding:(double)a3
{
  self->_titleBottomPadding = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_showAllButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end