@interface CKDetailsSearchResultsTitleHeaderCell
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (CALayer)bottomHairline;
- (CKDetailsSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3;
- (CKDetailsSearchResultsTitleHeaderCellDelegate)detailsViewDelegate;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_showAllButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5;
- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5;
- (void)setBottomHairline:(id)a3;
- (void)setDetailsViewDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CKDetailsSearchResultsTitleHeaderCell

+ (id)supplementaryViewType
{
  return @"SearchDetailsHeaderSupplementryType";
}

+ (id)reuseIdentifier
{
  return @"SearchDetailsResultsTitle";
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v5 setText:v4];
}

- (CKDetailsSearchResultsTitleHeaderCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  v3 = -[CKSearchResultsTitleHeaderCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[CKUIBehavior sharedBehaviors];
    char v5 = [v4 isAccessibilityPreferredContentSizeCategory];

    if ((v5 & 1) == 0)
    {
      v6 = +[CKUIBehavior sharedBehaviors];
      [v6 searchResultsTitleHeaderDetailsTopPadding];
      -[CKSearchResultsTitleHeaderCell setTitleTopPadding:](v3, "setTitleTopPadding:");

      [(CKSearchResultsTitleHeaderCell *)v3 setTitleBottomPadding:0.0];
    }
    v7 = [(CKSearchResultsTitleHeaderCell *)v3 sectionTitle];
    v8 = +[CKUIBehavior sharedBehaviors];
    v9 = [v8 searchDetailsHeaderFontIdentity];
    [v7 setFont:v9];
  }
  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  [(CKSearchResultsTitleHeaderCell *)&v23 layoutSubviews];
  v3 = [(CKSearchResultsTitleHeaderCell *)self topHairline];
  [v3 setHidden:1];

  [(CKDetailsSearchResultsTitleHeaderCell *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CKSearchResultsTitleHeaderCell *)self marginInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [(CKDetailsSearchResultsTitleHeaderCell *)self _shouldReverseLayoutDirection] ^ 1;
  v21 = +[CKUIBehavior sharedBehaviors];
  int v22 = [v21 isAccessibilityPreferredContentSizeCategory];

  if (v22) {
    -[CKSearchResultsTitleHeaderCell layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsAXFontSizeWithBounds:layoutMargins:isLTR:", v20, v5, v7, v9, v11, v13, v15, v17, v19);
  }
  else {
    -[CKDetailsSearchResultsTitleHeaderCell layoutSubviewsWithBounds:layoutMargins:isLTR:](self, "layoutSubviewsWithBounds:layoutMargins:isLTR:", v20, v5, v7, v9, v11, v13, v15, v17, v19);
  }
}

- (void)layoutSubviewsWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  double right = a4.right;
  double left = a4.left;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  *(void *)&rect.size.CGFloat width = self;
  *(void *)&rect.size.CGFloat height = CKDetailsSearchResultsTitleHeaderCell;
  -[CGSize layoutSubviewsWithBounds:layoutMargins:isLTR:]((objc_super *)&rect.size, sel_layoutSubviewsWithBounds_layoutMargins_isLTR_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  double v11 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v11 frame];
  rect.origin.CGFloat x = v12;
  CGFloat v49 = v13;
  CGFloat v50 = v14;

  double v15 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v15 frame];
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  CGFloat v48 = x;
  v55.origin.CGFloat x = x;
  CGFloat v47 = height;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  CGFloat v24 = CGRectGetWidth(v55) - left;
  v25 = +[CKUIBehavior sharedBehaviors];
  [v25 searchResultsTitleHeaderInterItemSpacing];
  CGFloat v27 = v24 - v26;
  v56.origin.CGFloat x = v17;
  CGFloat v51 = v21;
  v56.origin.CGFloat y = v19;
  v56.size.CGFloat width = v21;
  rect.origin.CGFloat y = v23;
  v56.size.CGFloat height = v23;
  double v28 = v27 - CGRectGetWidth(v56) - right;

  if (CKIsRunningInMacCatalyst())
  {
    double v30 = v50;
    double v29 = v19;
    double v31 = v51;
    double v32 = v49;
    double v33 = rect.origin.x;
  }
  else
  {
    double v33 = left;
    v57.origin.CGFloat x = x;
    v57.size.CGFloat width = width;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat height = v47;
    double MaxY = CGRectGetMaxY(v57);
    v58.origin.CGFloat x = rect.origin.x;
    v58.origin.CGFloat y = v49;
    double v30 = v50;
    v58.size.CGFloat width = v28;
    v58.size.CGFloat height = v50;
    double v35 = MaxY - CGRectGetHeight(v58);
    [(CKSearchResultsTitleHeaderCell *)self titleBottomPadding];
    double v32 = v35 - v36;
    if (!a5)
    {
      v59.origin.CGFloat x = v48;
      v59.size.CGFloat width = width;
      v59.origin.CGFloat y = y;
      v59.size.CGFloat height = v47;
      CGFloat v37 = v32;
      double v38 = CGRectGetWidth(v59);
      v60.origin.CGFloat x = rect.origin.x;
      v60.origin.CGFloat y = v37;
      v60.size.CGFloat width = v28;
      v60.size.CGFloat height = v50;
      double v39 = v38 - CGRectGetWidth(v60);
      double v32 = v37;
      double v33 = v39 - right;
    }
    v61.origin.CGFloat x = v48;
    v61.size.CGFloat width = width;
    v61.origin.CGFloat y = y;
    v61.size.CGFloat height = v47;
    double v40 = CGRectGetMaxY(v61);
    v62.origin.CGFloat x = v17;
    v62.origin.CGFloat y = v19;
    double v31 = v51;
    v62.size.CGFloat width = v51;
    v62.size.CGFloat height = rect.origin.y;
    double v29 = v40 - CGRectGetHeight(v62);
  }
  v41 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  objc_msgSend(v41, "setFrame:", v33, v32, v28, v30);

  v42 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  v43 = [v42 titleLabel];
  [v43 _baselineOffsetFromBottom];
  double v45 = v44;

  v46 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v46, "setFrame:", v17, v29 + v45, v31, rect.origin.y);
}

- (void)layoutSubviewsForWolfWithBounds:(CGRect)a3 layoutMargins:(UIEdgeInsets)a4 isLTR:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat right = a4.right;
  double left = a4.left;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v58.receiver = self;
  v58.super_class = (Class)CKDetailsSearchResultsTitleHeaderCell;
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  -[CKSearchResultsTitleHeaderCell layoutSubviewsForWolfWithBounds:layoutMargins:isLTR:](&v58, sel_layoutSubviewsForWolfWithBounds_layoutMargins_isLTR_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom);
  double v11 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  [v11 frame];
  CGFloat v52 = v12;
  CGFloat v53 = v13;
  CGFloat v54 = v14;

  double v15 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  [v15 frame];
  CGFloat v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v55 = left;
  if (v5)
  {
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    double v24 = right;
    double MaxX = CGRectGetMaxX(v59);
    v60.origin.CGFloat x = v17;
    v60.origin.CGFloat y = v19;
    v60.size.CGFloat width = v21;
    v60.size.CGFloat height = v23;
    double v26 = MaxX - CGRectGetWidth(v60) - v24;
    CGFloat v27 = +[CKUIBehavior sharedBehaviors];
    [v27 searchDetailsSeeAllButtonTrailingMargin];
    double v29 = v26 - v28;
  }
  else
  {
    CGFloat v27 = +[CKUIBehavior sharedBehaviors];
    [v27 searchDetailsSeeAllButtonTrailingMargin];
    double v29 = left + v30;
    double v24 = right;
  }

  double v31 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v31, "setFrame:", v29, v19, v21, v23);

  v61.origin.CGFloat x = x;
  v61.origin.CGFloat y = y;
  v61.size.CGFloat width = width;
  v61.size.CGFloat height = height;
  CGFloat v32 = CGRectGetWidth(v61) - v55;
  v62.origin.CGFloat x = v29;
  v62.origin.CGFloat y = v19;
  v62.size.CGFloat width = v21;
  v62.size.CGFloat height = v23;
  CGFloat v33 = v32 - CGRectGetWidth(v62) - v24;
  v34 = +[CKUIBehavior sharedBehaviors];
  [v34 searchResultsDetailsTitleHeaderTextLeadingMargin];
  CGFloat v36 = v33 - v35;
  CGFloat v37 = +[CKUIBehavior sharedBehaviors];
  [v37 searchDetailsSeeAllButtonTrailingMargin];
  CGFloat v39 = v36 - v38;
  double v40 = +[CKUIBehavior sharedBehaviors];
  [v40 searchResultsTitleHeaderInterItemSpacing];
  double v42 = v39 - v41;

  if (v5)
  {
    v43 = +[CKUIBehavior sharedBehaviors];
    [v43 searchResultsDetailsTitleHeaderTextLeadingMargin];
    double v44 = v54;
    double v46 = v55 + v45;
    double v47 = v53;
  }
  else
  {
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    double v48 = CGRectGetWidth(v63);
    v64.origin.CGFloat x = v52;
    double v47 = v53;
    v64.origin.CGFloat y = v53;
    v64.size.CGFloat width = v42;
    double v44 = v54;
    v64.size.CGFloat height = v54;
    double v49 = v48 - CGRectGetWidth(v64) - v24;
    v43 = +[CKUIBehavior sharedBehaviors];
    [v43 searchResultsDetailsTitleHeaderTextLeadingMargin];
    double v46 = v49 - v50;
  }

  CGFloat v51 = [(CKSearchResultsTitleHeaderCell *)self sectionTitle];
  objc_msgSend(v51, "setFrame:", v46, v47, v42, v44);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = +[CKUIBehavior sharedBehaviors];
  double v14 = [v13 searchDetailsHeaderFont];
  [v14 capHeight];
  double v16 = v15;

  CGFloat v17 = [(CKSearchResultsTitleHeaderCell *)self showAllButton];
  objc_msgSend(v17, "sizeThatFits:", v10, v12);
  double v19 = v18;

  double v20 = +[CKUIBehavior sharedBehaviors];
  LODWORD(v14) = [v20 isAccessibilityPreferredContentSizeCategory];

  [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
  if (v14)
  {
    double v22 = v19 + v16 + v21;
    [(CKSearchResultsTitleHeaderCell *)self titleBottomPadding];
    double v24 = v23 + v22;
  }
  else
  {
    double v25 = v16 + v21;
    [(CKSearchResultsTitleHeaderCell *)self titleTopPadding];
    double v24 = v25 + v26;
  }
  objc_msgSend(v4, "setFrame:", v6, v8, v10, v24);

  return v4;
}

- (void)_showAllButtonTapped:(id)a3
{
  if (CKIsRunningInMacCatalyst())
  {
    id v4 = [(CKSearchResultsTitleHeaderCell *)self delegate];
    [v4 searchResultsTitleCellShowAllButtonTapped:self];
  }
  else
  {
    id v4 = [(CKDetailsSearchResultsTitleHeaderCell *)self detailsViewDelegate];
    [v4 searchDetailsShowAllButtonTapped:self];
  }
}

- (CKDetailsSearchResultsTitleHeaderCellDelegate)detailsViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailsViewDelegate);

  return (CKDetailsSearchResultsTitleHeaderCellDelegate *)WeakRetained;
}

- (void)setDetailsViewDelegate:(id)a3
{
}

- (CALayer)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairline, 0);

  objc_destroyWeak((id *)&self->_detailsViewDelegate);
}

@end