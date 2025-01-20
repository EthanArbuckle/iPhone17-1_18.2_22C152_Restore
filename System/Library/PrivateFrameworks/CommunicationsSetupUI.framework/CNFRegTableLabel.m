@interface CNFRegTableLabel
- (BOOL)isTopmostHeader;
- (CNFRegTableLabel)initWithSpecifier:(id)a3;
- (NSString)URLText;
- (NSURL)URLTarget;
- (UITableView)cnfreg_tableView;
- (double)_bottomPadding;
- (double)_labelInset;
- (double)_topPadding;
- (double)preferredHeightForWidth:(double)a3;
- (id)_URLTarget;
- (id)_URLText;
- (id)_labelText;
- (int64_t)_labelTextAlignment;
- (void)_urlTapped:(id)a3;
- (void)clearSpecifier;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setCnfreg_tableView:(id)a3;
- (void)setIsTopmostHeader:(BOOL)a3;
- (void)setURLTarget:(id)a3;
- (void)setURLText:(id)a3;
- (void)updateLabelText;
@end

@implementation CNFRegTableLabel

- (CNFRegTableLabel)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNFRegTableLabel;
  v6 = [(CNFRegTableLabel *)&v16 init];
  if (v6)
  {
    v7 = +[CNFRegAppearanceController globalAppearanceController];
    [(CNFRegTableLabel *)v6 setContentMode:3];
    [(CNFRegTableLabel *)v6 setOpaque:0];
    v8 = [MEMORY[0x263F825C8] clearColor];
    [(CNFRegTableLabel *)v6 setBackgroundColor:v8];

    objc_storeStrong((id *)&v6->_specifier, a3);
    id v9 = objc_alloc(MEMORY[0x263F828E0]);
    [(CNFRegTableLabel *)v6 frame];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    label = v6->_label;
    v6->_label = (UILabel *)v10;

    v12 = [v7 tableHeaderTextColor];
    [(UILabel *)v6->_label setTextColor:v12];

    [(UILabel *)v6->_label setNumberOfLines:0];
    [(UILabel *)v6->_label setLineBreakMode:0];
    v13 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v6->_label setBackgroundColor:v13];

    v14 = [v7 tableHeaderTextShadowColor];
    [(UILabel *)v6->_label setShadowColor:v14];

    [v7 tableHeaderTextShadowOffset];
    -[UILabel setShadowOffset:](v6->_label, "setShadowOffset:");
    [(UILabel *)v6->_label setAutoresizingMask:18];
    [(CNFRegTableLabel *)v6 addSubview:v6->_label];
    [(CNFRegTableLabel *)v6 updateLabelText];
  }
  return v6;
}

- (void)dealloc
{
  [(CNFRegLearnMoreButton *)self->_urlButton removeTarget:self action:sel__handleUrlTapped_ forControlEvents:64];
  self->_cnfreg_tableView = 0;
  v3.receiver = self;
  v3.super_class = (Class)CNFRegTableLabel;
  [(CNFRegTableLabel *)&v3 dealloc];
}

- (void)clearSpecifier
{
  self->_specifier = 0;
  MEMORY[0x270F9A758]();
}

- (double)_labelInset
{
  PreferencesTableViewCellLeftPad();
  float v3 = v2;
  PreferencesTableViewCellRightPad();
  return fmaxf(v3, v4);
}

- (double)_topPadding
{
  BOOL v2 = [(CNFRegTableLabel *)self isTopmostHeader];
  float v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  float v5 = 7.0;
  if (v4 == 1) {
    float v5 = 5.0;
  }
  float v6 = 17.0;
  if (v4 == 1) {
    float v6 = 26.0;
  }
  if (v2) {
    return v6;
  }
  return v5;
}

- (double)_bottomPadding
{
  return 8.0;
}

- (void)layoutSubviews
{
  v51[1] = *MEMORY[0x263EF8340];
  [(CNFRegTableLabel *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UITableView *)self->_cnfreg_tableView _backgroundInset];
  double v12 = v11;
  [(CNFRegTableLabel *)self _labelInset];
  CGFloat v14 = v12 + v13;
  v52.origin.double x = v4;
  v52.origin.CGFloat y = v6;
  v52.size.CGFloat width = v8;
  v52.size.CGFloat height = v10;
  CGRect v53 = CGRectInset(v52, v14, 0.0);
  double x = v53.origin.x;
  CGFloat y = v53.origin.y;
  CGFloat width = v53.size.width;
  CGFloat height = v53.size.height;
  double v19 = CGRectGetWidth(v53);
  uint64_t v20 = [(UILabel *)self->_label text];
  if (v20
    && (v21 = (void *)v20,
        [(UILabel *)self->_label text],
        v22 = objc_claimAutoreleasedReturnValue(),
        uint64_t v23 = [v22 length],
        v22,
        v21,
        v23))
  {
    uint64_t v50 = *MEMORY[0x263F814F0];
    v24 = [(UILabel *)self->_label font];
    v51[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];

    v26 = [(UILabel *)self->_label text];
    objc_msgSend(v26, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v19, 1.79769313e308);
    CGFloat v27 = y;
    double v29 = v28;

    [(UILabel *)self->_label setTextAlignment:4];
    double v30 = ceil(v29);
    CGFloat y = v27;
    v54.origin.double x = x;
    v54.origin.CGFloat y = v27;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    if (v30 >= CGRectGetHeight(v54))
    {
      double v30 = height;
      double v32 = v27;
    }
    else
    {
      [(CNFRegTableLabel *)self _topPadding];
      double v32 = v31;
    }

    CGFloat v33 = x;
    double v34 = width;
  }
  else
  {
    CGFloat v33 = x;
    double x = *MEMORY[0x263F001A8];
    double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v34 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v30 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  -[UILabel setFrame:](self->_label, "setFrame:", x, v32, v34, v30);
  urlButton = self->_urlButton;
  if (urlButton)
  {
    CGFloat v47 = y;
    CGFloat v48 = width;
    CGFloat rect = height;
    [(CNFRegLearnMoreButton *)urlButton sizeToFit];
    int64_t v36 = [(CNFRegTableLabel *)self _labelTextAlignment];
    [(CNFRegLearnMoreButton *)self->_urlButton bounds];
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v55.origin.double x = x;
    v55.origin.CGFloat y = v32;
    v55.size.CGFloat width = v34;
    v55.size.CGFloat height = v30;
    double v43 = CGRectGetMaxY(v55) + 5.0;
    if (v36 == 2)
    {
      v57.origin.double x = v33;
      v57.origin.CGFloat y = v47;
      v57.size.CGFloat width = v48;
      v57.size.CGFloat height = rect;
      double MaxX = CGRectGetMaxX(v57);
      v58.origin.double x = v38;
      v58.origin.CGFloat y = v43;
      v58.size.CGFloat width = v40;
      v58.size.CGFloat height = v42;
      double MinX = MaxX - CGRectGetWidth(v58);
    }
    else if (v36 == 1)
    {
      v59.origin.double x = v33;
      v59.origin.CGFloat y = v47;
      v59.size.CGFloat width = v48;
      v59.size.CGFloat height = rect;
      double MidX = CGRectGetMidX(v59);
      v60.origin.double x = v38;
      v60.origin.CGFloat y = v43;
      v60.size.CGFloat width = v40;
      v60.size.CGFloat height = v42;
      double MinX = MidX + CGRectGetWidth(v60) * -0.5;
    }
    else
    {
      if (v36)
      {
LABEL_16:
        -[CNFRegLearnMoreButton setFrame:](self->_urlButton, "setFrame:", v38, v43, v40, v42);
        return;
      }
      v56.origin.double x = v33;
      v56.origin.CGFloat y = v47;
      v56.size.CGFloat width = v48;
      v56.size.CGFloat height = rect;
      double MinX = CGRectGetMinX(v56);
    }
    double v38 = floor(MinX);
    goto LABEL_16;
  }
}

- (id)_labelText
{
  return 0;
}

- (int64_t)_labelTextAlignment
{
  return 4;
}

- (id)_URLText
{
  return 0;
}

- (id)_URLTarget
{
  return 0;
}

- (void)_urlTapped:(id)a3
{
  uint64_t v3 = [(CNFRegTableLabel *)self _URLTarget];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v3 = [(id)*MEMORY[0x263F83300] openURL:v3 withCompletionHandler:0];
    uint64_t v4 = v5;
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)updateLabelText
{
  uint64_t v3 = [(CNFRegTableLabel *)self _labelText];
  [(UILabel *)self->_label setText:v3];

  [(UILabel *)self->_label setTextAlignment:[(CNFRegTableLabel *)self _labelTextAlignment]];
  [(CNFRegLearnMoreButton *)self->_urlButton removeTarget:self action:sel__urlTapped_ forControlEvents:64];
  [(CNFRegLearnMoreButton *)self->_urlButton removeFromSuperview];
  urlButton = self->_urlButton;
  self->_urlButton = 0;

  id v10 = [(CNFRegTableLabel *)self _URLText];
  uint64_t v5 = [(CNFRegTableLabel *)self _URLTarget];
  CGFloat v6 = (void *)v5;
  if (v10 && v5)
  {
    [(CNFRegTableLabel *)self setURLText:v10];
    [(CNFRegTableLabel *)self setURLTarget:v6];
    double v7 = [CNFRegLearnMoreButton alloc];
    CGFloat v8 = -[CNFRegLearnMoreButton initWithFrame:style:text:](v7, "initWithFrame:style:text:", 1, v10, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v9 = self->_urlButton;
    self->_urlButton = v8;

    [(CNFRegLearnMoreButton *)self->_urlButton addTarget:self action:sel__urlTapped_ forControlEvents:64];
    [(CNFRegTableLabel *)self addSubview:self->_urlButton];
  }
  else
  {
    [(CNFRegTableLabel *)self setURLText:0];
    [(CNFRegTableLabel *)self setURLTarget:0];
  }
  [(CNFRegTableLabel *)self setNeedsLayout];
}

- (double)preferredHeightForWidth:(double)a3
{
  v30[1] = *MEMORY[0x263EF8340];
  if (a3 == 0.0) {
    double v4 = 320.0;
  }
  else {
    double v4 = a3;
  }
  uint64_t v5 = MEMORY[0x263F001B0];
  cnfreg_tableView = self->_cnfreg_tableView;
  double v7 = 0.0;
  if (cnfreg_tableView)
  {
    [(UITableView *)cnfreg_tableView _backgroundInset];
    double v7 = v8;
  }
  double v9 = *(double *)(v5 + 8);
  [(CNFRegTableLabel *)self _labelInset];
  double v11 = v7 + v10;
  double v12 = v11 + v11;
  double v13 = v4 + v11 * -2.0;
  if (v4 >= v12) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0;
  }
  uint64_t v15 = [(UILabel *)self->_label text];
  if (v15)
  {
    objc_super v16 = (void *)v15;
    v17 = [(UILabel *)self->_label text];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      uint64_t v29 = *MEMORY[0x263F814F0];
      double v19 = [(UILabel *)self->_label font];
      v30[0] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];

      v21 = [(UILabel *)self->_label text];
      objc_msgSend(v21, "boundingRectWithSize:options:attributes:context:", 1, v20, 0, v14, 1.79769313e308);
      double v9 = v22;
    }
  }
  if (v9 > 0.0)
  {
    [(CNFRegTableLabel *)self _topPadding];
    double v24 = v9 + v23;
    [(CNFRegTableLabel *)self _bottomPadding];
    double v9 = v24 + v25;
  }
  urlButton = self->_urlButton;
  if (urlButton)
  {
    [(CNFRegLearnMoreButton *)urlButton sizeToFit];
    -[CNFRegLearnMoreButton sizeThatFits:](self->_urlButton, "sizeThatFits:", v4, 1.79769313e308);
    double v9 = v9 + v27 + 5.0;
  }
  return ceil(v9);
}

- (UITableView)cnfreg_tableView
{
  return self->_cnfreg_tableView;
}

- (void)setCnfreg_tableView:(id)a3
{
  self->_cnfreg_tableView = (UITableView *)a3;
}

- (BOOL)isTopmostHeader
{
  return self->_isTopmostHeader;
}

- (void)setIsTopmostHeader:(BOOL)a3
{
  self->_isTopmostHeader = a3;
}

- (NSString)URLText
{
  return self->_URLText;
}

- (void)setURLText:(id)a3
{
}

- (NSURL)URLTarget
{
  return self->_URLTarget;
}

- (void)setURLTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLTarget, 0);
  objc_storeStrong((id *)&self->_URLText, 0);
  objc_storeStrong((id *)&self->_urlButton, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end