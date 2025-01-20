@interface AAUIProfileSummaryView
+ (double)desiredHeight;
- (AAUIProfileSummaryView)initWithName:(id)a3 email:(id)a4 image:(id)a5;
- (BOOL)hidesPhoto;
- (double)topPadding;
- (void)layoutSubviews;
- (void)setHidesPhoto:(BOOL)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation AAUIProfileSummaryView

- (AAUIProfileSummaryView)initWithName:(id)a3 email:(id)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)AAUIProfileSummaryView;
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  v15 = -[AAUIProfileSummaryView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x263F001A8], v12, v13, v14);
  if (v15)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v10];
    profileImageView = v15->_profileImageView;
    v15->_profileImageView = (UIImageView *)v16;

    [(AAUIProfileSummaryView *)v15 addSubview:v15->_profileImageView];
    v18 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    if ([v8 length]) {
      v19 = v8;
    }
    else {
      v19 = v9;
    }
    v20 = (objc_class *)MEMORY[0x263F828E0];
    id v21 = v19;
    uint64_t v22 = objc_msgSend([v20 alloc], "initWithFrame:", v11, v12, v13, v14);
    nameLabel = v15->_nameLabel;
    v15->_nameLabel = (UILabel *)v22;

    [(UILabel *)v15->_nameLabel setText:v21];
    v24 = v15->_nameLabel;
    v25 = (void *)MEMORY[0x263F81708];
    [v18 scaledValueForValue:20.0];
    v26 = objc_msgSend(v25, "boldSystemFontOfSize:");
    [(UILabel *)v24 setFont:v26];

    [(UILabel *)v15->_nameLabel setNumberOfLines:1];
    [(AAUIProfileSummaryView *)v15 addSubview:v15->_nameLabel];
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v11, v12, v13, v14);
    emailLabel = v15->_emailLabel;
    v15->_emailLabel = (UILabel *)v27;

    [(UILabel *)v15->_emailLabel setText:v9];
    v29 = v15->_emailLabel;
    v30 = (void *)MEMORY[0x263F81708];
    [v18 scaledValueForValue:15.0];
    v31 = objc_msgSend(v30, "systemFontOfSize:");
    [(UILabel *)v29 setFont:v31];

    [(UILabel *)v15->_emailLabel setNumberOfLines:1];
    v32 = v15->_emailLabel;
    v33 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v32 setTextColor:v33];

    [(AAUIProfileSummaryView *)v15 addSubview:v15->_emailLabel];
  }

  return v15;
}

- (void)setHidesPhoto:(BOOL)a3
{
  if (self->_hidesPhoto != a3)
  {
    if (a3) {
      [(UIImageView *)self->_profileImageView removeFromSuperview];
    }
    else {
      [(AAUIProfileSummaryView *)self addSubview:self->_profileImageView];
    }
  }
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)AAUIProfileSummaryView;
  [(AAUIProfileSummaryView *)&v39 layoutSubviews];
  v3 = [(AAUIProfileSummaryView *)self superview];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(AAUIProfileSummaryView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  int v8 = IsAccessibilityCategory & ~isKindOfClass;
  [(UIImageView *)self->_profileImageView frame];
  double v10 = v9;
  double v12 = v11;
  [(AAUIProfileSummaryView *)self frame];
  UIRoundToViewScale();
  if (v8 == 1)
  {
    [(AAUIProfileSummaryView *)self frame];
    UIRectCenteredXInRect();
LABEL_5:
    double v19 = v14;
    double v18 = v15;
    double v10 = v16;
    double v12 = v17;
    goto LABEL_6;
  }
  double v18 = v13 + self->_topPadding;
  if (IsAccessibilityCategory)
  {
    [(AAUIProfileSummaryView *)self frame];
    UIRectCenteredYInRect();
    goto LABEL_5;
  }
  double v19 = 15.0;
  if ([(AAUIProfileSummaryView *)self _shouldReverseLayoutDirection])
  {
    [(AAUIProfileSummaryView *)self bounds];
    double v19 = v30 + -15.0 - v10;
  }
LABEL_6:
  -[UIImageView setFrame:](self->_profileImageView, "setFrame:", v19, v18, v10, v12);
  [(UILabel *)self->_nameLabel sizeToFit];
  [(UILabel *)self->_nameLabel frame];
  double v21 = v20;
  double v38 = v19;
  if (v8)
  {
    v40.origin.x = v19;
    v40.origin.y = v18;
    v40.size.width = v10;
    v40.size.height = v12;
    CGRectGetMaxY(v40);
    [(AAUIProfileSummaryView *)self frame];
    [(AAUIProfileSummaryView *)self frame];
    UIRectCenteredXInRect();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v21 = v28;
  }
  else
  {
    double v25 = self->_topPadding + 18.0;
    if ([(AAUIProfileSummaryView *)self _shouldReverseLayoutDirection])
    {
      [(AAUIProfileSummaryView *)self bounds];
      double v27 = v29 - v10 + -30.0;
      double v23 = v19 + -15.0 - v27;
    }
    else
    {
      double v23 = v10 + v19 + 15.0;
      [(AAUIProfileSummaryView *)self frame];
      double v27 = v31 - v23;
    }
  }
  -[UILabel setFrame:](self->_nameLabel, "setFrame:", v23, v25, v27, v21);
  [(UILabel *)self->_emailLabel sizeToFit];
  [(UILabel *)self->_emailLabel frame];
  UIRoundToViewScale();
  if (v8)
  {
    v41.origin.x = v23;
    v41.origin.y = v25;
    v41.size.width = v27;
    v41.size.height = v21;
    CGRectGetMaxY(v41);
    [(AAUIProfileSummaryView *)self frame];
    [(AAUIProfileSummaryView *)self frame];
    UIRectCenteredXInRect();
    double v23 = v33;
    double v35 = v34;
    uint64_t v36 = 1;
  }
  else
  {
    double v35 = v32;
    if ([(AAUIProfileSummaryView *)self _shouldReverseLayoutDirection])
    {
      [(AAUIProfileSummaryView *)self bounds];
      double v23 = v38 + -15.0 - (v37 - v10 + -30.0);
    }
    else
    {
      [(AAUIProfileSummaryView *)self frame];
    }
    uint64_t v36 = 4;
  }
  -[UILabel setFrame:](self->_emailLabel, "setFrame:", v23, v35);
  [(UILabel *)self->_nameLabel setTextAlignment:v36];
  [(UILabel *)self->_emailLabel setTextAlignment:v36];
}

+ (double)desiredHeight
{
  v2 = [(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (!IsAccessibilityCategory) {
    return 81.0;
  }
  v4 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
  v5 = (void *)MEMORY[0x263F81708];
  [v4 scaledValueForValue:20.0];
  v6 = objc_msgSend(v5, "systemFontOfSize:");
  v7 = (void *)MEMORY[0x263F81708];
  [v4 scaledValueForValue:15.0];
  int v8 = objc_msgSend(v7, "systemFontOfSize:");
  [v6 _bodyLeading];
  double v10 = v9 + 60.0;
  [v8 _bodyLeading];
  double v12 = v10 + v11;

  return v12;
}

- (BOOL)hidesPhoto
{
  return self->_hidesPhoto;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_profileImageView, 0);
}

@end