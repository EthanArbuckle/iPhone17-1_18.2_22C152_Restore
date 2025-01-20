@interface AMUIPasscodeButton
- (AMUIPasscodeButton)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UIFont)font;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMUIPasscodeButton

- (AMUIPasscodeButton)initWithFrame:(CGRect)a3
{
  v43[1] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)AMUIPasscodeButton;
  v3 = -[AMUIPasscodeButton initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    [(AMUIPasscodeButton *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    pillView = v3->_pillView;
    v3->_pillView = (UIView *)v5;

    [(UIView *)v3->_pillView setAlpha:0.1];
    v7 = v3->_pillView;
    v8 = [MEMORY[0x263F1C550] whiteColor];
    [(UIView *)v7 setBackgroundColor:v8];

    v9 = [(UIView *)v3->_pillView layer];
    uint64_t v10 = *MEMORY[0x263F15A20];
    [v9 setCornerCurve:*MEMORY[0x263F15A20]];

    [(AMUIPasscodeButton *)v3 addSubview:v3->_pillView];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    backdropView = v3->_backdropView;
    v3->_backdropView = v11;

    v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
    [v13 setName:@"saturation"];
    [v13 setValue:&unk_26FBDB1E0 forKey:@"inputAmount"];
    v14 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x263F15758]);
    backdropLayer = v3->_backdropLayer;
    v3->_backdropLayer = v14;

    v16 = v3->_backdropLayer;
    v43[0] = v13;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
    [(CABackdropLayer *)v16 setFilters:v17];

    [(CABackdropLayer *)v3->_backdropLayer setCornerCurve:v10];
    v18 = [(UIView *)v3->_backdropView layer];
    [v18 addSublayer:v3->_backdropLayer];

    [(AMUIPasscodeButton *)v3 addSubview:v3->_backdropView];
    id v19 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v20;

    v22 = v3->_titleLabel;
    v23 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.48];
    [(UILabel *)v22 setTextColor:v23];

    v24 = [(UILabel *)v3->_titleLabel layer];
    v25 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    [v24 setCompositingFilter:v25];

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AMUIPasscodeButton *)v3 addSubview:v3->_titleLabel];
    v26 = (void *)MEMORY[0x263F08938];
    v27 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v3->_titleLabel, 0);
    v28 = [v26 constraintsWithVisualFormat:@"|-(>=16)-[_titleLabel]-(>=16)-|" options:0 metrics:0 views:v27];
    [v26 activateConstraints:v28];

    v29 = (void *)MEMORY[0x263F08938];
    v30 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, v3->_titleLabel, 0);
    v31 = [v29 constraintsWithVisualFormat:@"V:|-(14)-[_titleLabel]-(14)-|" options:0 metrics:0 views:v30];
    [v29 activateConstraints:v31];

    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(UILabel *)v3->_titleLabel centerXAnchor];
    v34 = [(AMUIPasscodeButton *)v3 centerXAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v42[0] = v35;
    v36 = [(UILabel *)v3->_titleLabel centerYAnchor];
    v37 = [(AMUIPasscodeButton *)v3 centerYAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v42[1] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    [v32 activateConstraints:v39];
  }
  return v3;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (UIFont)font
{
  return [(UILabel *)self->_titleLabel font];
}

- (void)setFont:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMUIPasscodeButton;
  -[AMUIPasscodeButton setHighlighted:](&v12, sel_setHighlighted_);
  objc_initWeak(&location, self->_pillView);
  id v5 = objc_alloc(MEMORY[0x263F1CB78]);
  if (v3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 0.85;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__AMUIPasscodeButton_setHighlighted___block_invoke;
  v8[3] = &unk_265224950;
  objc_copyWeak(&v9, &location);
  BOOL v10 = v3;
  v7 = objc_msgSend(v5, "initWithDuration:controlPoint1:controlPoint2:animations:", v8, v6, 0.0, 0.0, 0.0, 1.0);
  [v7 startAnimation];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __37__AMUIPasscodeButton_setHighlighted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:dbl_24786BF40[*(unsigned char *)(a1 + 40) == 0]];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(AMUIPasscodeButton *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    v7 = self;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AMUIPasscodeButton;
  [(AMUIPasscodeButton *)&v7 layoutSubviews];
  [(AMUIPasscodeButton *)self bounds];
  double v4 = v3 * 0.5;
  -[UIView setFrame:](self->_pillView, "setFrame:");
  id v5 = [(UIView *)self->_pillView layer];
  [v5 setCornerRadius:v4];

  backdropLayer = self->_backdropLayer;
  [(UIView *)self->_pillView frame];
  -[CABackdropLayer setFrame:](backdropLayer, "setFrame:");
  [(CABackdropLayer *)self->_backdropLayer setCornerRadius:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end