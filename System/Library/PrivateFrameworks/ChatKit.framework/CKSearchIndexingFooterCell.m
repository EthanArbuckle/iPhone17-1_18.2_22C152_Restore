@interface CKSearchIndexingFooterCell
+ (double)desiredZPosition;
+ (id)reuseIdentifier;
+ (id)supplementaryViewType;
- (BOOL)titleLabelHidden;
- (CKSearchIndexingFooterCell)initWithFrame:(CGRect)a3;
- (NSString)subtitleString;
- (NSString)titleString;
- (UIEdgeInsets)marginInsets;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleString:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelHidden:(BOOL)a3;
- (void)setTitleString:(id)a3;
@end

@implementation CKSearchIndexingFooterCell

+ (id)supplementaryViewType
{
  return @"CKSearchIndexingFooterCellType";
}

+ (id)reuseIdentifier
{
  return @"CKSearchIndexingFooterCell";
}

+ (double)desiredZPosition
{
  return 0.0;
}

- (CKSearchIndexingFooterCell)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CKSearchIndexingFooterCell;
  v3 = -[CKSearchIndexingFooterCell initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    v10 = +[CKUIBehavior sharedBehaviors];
    v11 = [v10 searchIndexingTitleFont];
    [v9 setFont:v11];

    [v9 setTextAlignment:1];
    v12 = [MEMORY[0x1E4F428B8] labelColor];
    [v9 setTextColor:v12];

    [v9 setNumberOfLines:0];
    [(CKSearchIndexingFooterCell *)v3 addSubview:v9];
    [(CKSearchIndexingFooterCell *)v3 setTitleLabel:v9];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    v14 = +[CKUIBehavior sharedBehaviors];
    v15 = [v14 searchIndexingSubtitleFont];
    [v13 setFont:v15];

    [v13 setTextAlignment:1];
    v16 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v13 setTextColor:v16];

    [v13 setNumberOfLines:0];
    [(CKSearchIndexingFooterCell *)v3 addSubview:v13];
    [(CKSearchIndexingFooterCell *)v3 setSubtitleLabel:v13];
  }
  return v3;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)CKSearchIndexingFooterCell;
  [(CKSearchIndexingFooterCell *)&v49 layoutSubviews];
  [(CKSearchIndexingFooterCell *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  int v7 = [(CKSearchIndexingFooterCell *)self _shouldReverseLayoutDirection];
  [(CKSearchIndexingFooterCell *)self safeAreaInsets];
  if (v7) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  double v11 = v4 - v10;
  double v12 = 0.0;
  if (([(CKSearchIndexingFooterCell *)self _shouldReverseLayoutDirection] & 1) == 0)
  {
    [(CKSearchIndexingFooterCell *)self safeAreaInsets];
    double v12 = v13;
  }
  [(CKSearchIndexingFooterCell *)self bounds];
  v50.origin.x = v12;
  v50.size.width = v11;
  v50.size.height = v6;
  double Width = CGRectGetWidth(v50);
  [(CKSearchIndexingFooterCell *)self marginInsets];
  double v17 = Width - (v15 + v16);
  objc_super v18 = [(CKSearchIndexingFooterCell *)self titleLabel];
  objc_msgSend(v18, "sizeThatFits:", v17, 1.79769313e308);
  double v20 = v19;
  double v22 = v21;

  if (CKMainScreenScale_once_26 != -1) {
    dispatch_once(&CKMainScreenScale_once_26, &__block_literal_global_60);
  }
  double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_26;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_26 == 0.0) {
    double v23 = 1.0;
  }
  double v24 = v20 * v23;
  double v25 = v22 * v23;
  double v26 = v12 * v23 + floor((v11 * v23 - v20 * v23) * 0.5);
  double v27 = 1.0 / v23;
  double v28 = v27 * v26;
  double v29 = v24 * v27;
  double v30 = v25 * v27;
  v31 = [(CKSearchIndexingFooterCell *)self titleLabel];
  objc_msgSend(v31, "setFrame:", v28, 20.0, v29, v30);

  v32 = [(CKSearchIndexingFooterCell *)self subtitleLabel];
  objc_msgSend(v32, "sizeThatFits:", v17, 1.79769313e308);
  double v34 = v33;
  double v48 = v35;

  double v36 = v11;
  if (CKMainScreenScale_once_26 != -1) {
    dispatch_once(&CKMainScreenScale_once_26, &__block_literal_global_60);
  }
  double v37 = *(double *)&CKMainScreenScale_sMainScreenScale_26;
  double v38 = 20.0;
  if (![(CKSearchIndexingFooterCell *)self titleLabelHidden])
  {
    v51.origin.y = 20.0;
    v51.origin.x = v28;
    v51.size.width = v29;
    v51.size.height = v30;
    double MaxY = CGRectGetMaxY(v51);
    v40 = +[CKUIBehavior sharedBehaviors];
    v41 = [v40 searchIndexingSubtitleFont];
    [v41 capHeight];
    double v38 = MaxY + v42;
  }
  if (v37 == 0.0) {
    double v43 = 1.0;
  }
  else {
    double v43 = v37;
  }
  double v44 = 1.0 / v43 * (v12 * v43 + floor((v36 * v43 - v34 * v43) * 0.5));
  double v45 = v34 * v43 * (1.0 / v43);
  double v46 = v48 * v43 * (1.0 / v43);
  v47 = [(CKSearchIndexingFooterCell *)self subtitleLabel];
  objc_msgSend(v47, "setFrame:", v44, v38, v45, v46);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double v8 = CGRectGetWidth(v24);
  [(CKSearchIndexingFooterCell *)self marginInsets];
  double v11 = v8 - (v9 + v10);
  if ([(CKSearchIndexingFooterCell *)self titleLabelHidden])
  {
    double v12 = 0.0;
  }
  else
  {
    double v13 = [(CKSearchIndexingFooterCell *)self titleLabel];
    objc_msgSend(v13, "sizeThatFits:", v11, 1.79769313e308);
    double v15 = v14 + 0.0;

    double v16 = +[CKUIBehavior sharedBehaviors];
    double v17 = [v16 searchIndexingSubtitleFont];
    [v17 capHeight];
    double v12 = v15 + v18;
  }
  double v19 = [(CKSearchIndexingFooterCell *)self subtitleLabel];
  objc_msgSend(v19, "sizeThatFits:", v11, 1.79769313e308);
  double v21 = v12 + v20;

  objc_msgSend(v4, "setFrame:", x, y, width, v21 + 40.0);

  return v4;
}

- (void)setTitleLabelHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKSearchIndexingFooterCell *)self titleLabel];
  [v4 setHidden:v3];
}

- (BOOL)titleLabelHidden
{
  v2 = [(CKSearchIndexingFooterCell *)self titleLabel];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setTitleString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    titleString = self->_titleString;
    self->_titleString = v4;

    CGFloat v6 = [(CKSearchIndexingFooterCell *)self titleLabel];
    [v6 setText:self->_titleString];

    [(CKSearchIndexingFooterCell *)self setNeedsLayout];
  }
}

- (void)setSubtitleString:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_subtitleString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v7 copy];
    subtitleString = self->_subtitleString;
    self->_subtitleString = v4;

    CGFloat v6 = [(CKSearchIndexingFooterCell *)self subtitleLabel];
    [v6 setText:self->_subtitleString];

    [(CKSearchIndexingFooterCell *)self setNeedsLayout];
  }
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

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end