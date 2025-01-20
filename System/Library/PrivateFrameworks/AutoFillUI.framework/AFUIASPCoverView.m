@interface AFUIASPCoverView
+ (double)screenScale;
+ (id)ASPCoverViewColor;
+ (id)coverForeground:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6;
- (CAGradientLayer)gradientLayer;
- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4;
- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5;
- (void)layoutSubviews;
- (void)setGradientLayer:(id)a3;
@end

@implementation AFUIASPCoverView

+ (double)screenScale
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

+ (id)coverForeground:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v12 = a3;
  id v13 = objc_alloc((Class)a1);
  if (v12) {
    v14 = objc_msgSend(v13, "initCoverViewWithFrame:isRightToLeft:withTextWidth:", v7, x, y, width, height, a6);
  }
  else {
    v14 = objc_msgSend(v13, "initCoverBackgroundViewWithFrame:isRightToLeft:", v7, x, y, width, height);
  }

  return v14;
}

- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AFUIASPCoverView;
  double v4 = -[AFUIASPCoverView initWithFrame:](&v10, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(AFUIASPCoverView *)v4 setUserInteractionEnabled:0];
    id v6 = [(id)objc_opt_class() ASPCoverViewColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(AFUIASPCoverView *)v5 layer];
    [v8 setBackgroundColor:v7];
  }
  return v5;
}

- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5
{
  BOOL v6 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v54[2] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)AFUIASPCoverView;
  v11 = -[AFUIASPCoverView initWithFrame:](&v51, sel_initWithFrame_);
  p_isa = (id *)&v11->super.super.super.isa;
  if (v11)
  {
    [(AFUIASPCoverView *)v11 setUserInteractionEnabled:0];
    id v13 = [MEMORY[0x263F825C8] clearColor];
    uint64_t v14 = [v13 CGColor];
    v15 = [p_isa layer];
    [v15 setBackgroundColor:v14];

    uint64_t v16 = [MEMORY[0x263F157D0] layer];
    id v17 = p_isa[51];
    p_isa[51] = (id)v16;

    [(id)objc_opt_class() screenScale];
    if (v18 == 3.0) {
      double v19 = 4.0;
    }
    else {
      double v19 = 6.0;
    }
    [p_isa bounds];
    double v50 = v19;
    double v21 = v20 - v19;
    [p_isa bounds];
    objc_msgSend(p_isa[51], "setFrame:", 0.0, 0.0, v21);
    id v22 = [MEMORY[0x263F825C8] colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:0.0];
    v54[0] = [v22 CGColor];
    id v23 = [MEMORY[0x263F825C8] colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:1.0];
    v54[1] = [v23 CGColor];
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];

    [p_isa[51] setColors:v24];
    [p_isa[51] frame];
    double v25 = CGRectGetWidth(v55);
    double v26 = 0.45;
    if (v25 * 0.45 <= a5)
    {
      double v27 = 0.1;
    }
    else
    {
      double v27 = a5 * 0.1 / v25;
      double v26 = a5 * 0.65 / v25;
    }
    double v28 = 1.0 - v27;
    if (!v6) {
      double v28 = v27;
    }
    double v29 = 1.0 - v26;
    if (v6) {
      double v30 = 1.0 - v26;
    }
    else {
      double v30 = v26;
    }
    objc_msgSend(p_isa[51], "setStartPoint:", v28, 0.0);
    objc_msgSend(p_isa[51], "setEndPoint:", v30, 0.0);
    v31 = [p_isa layer];
    [v31 addSublayer:p_isa[51]];

    v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"Strong Password" value:@"Automatic Strong Password cover view text" table:0];

    v34 = [MEMORY[0x263F82760] systemFontOfSize:14.0 weight:*MEMORY[0x263F83638]];
    uint64_t v35 = *MEMORY[0x263F82270];
    v53[0] = v34;
    uint64_t v36 = *MEMORY[0x263F82278];
    v52[0] = v35;
    v52[1] = v36;
    v37 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    v53[1] = v37;
    v38 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];

    [v33 sizeWithAttributes:v38];
    double v40 = v39;
    [p_isa[51] frame];
    double v41 = v29 * CGRectGetWidth(v56);
    if (v40 < v41)
    {
      v42 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v33 attributes:v38];
      v57.origin.CGFloat x = x;
      v57.origin.CGFloat y = y;
      v57.size.CGFloat width = width;
      v57.size.CGFloat height = height;
      v43 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", 0.0, 0.0, v41, CGRectGetHeight(v57));
      [v43 setUserInteractionEnabled:0];
      [v43 setAttributedText:v42];
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];
      [p_isa addSubview:v43];
      v44 = [MEMORY[0x263EFF980] array];
      if (v6) {
        uint64_t v45 = 1;
      }
      else {
        uint64_t v45 = 2;
      }
      double v46 = -v50;
      if (v6) {
        double v46 = (double)v6;
      }
      v47 = [MEMORY[0x263F08938] constraintWithItem:v43 attribute:v45 relatedBy:0 toItem:p_isa attribute:v45 multiplier:1.0 constant:v46];
      [v44 addObject:v47];

      v48 = [MEMORY[0x263F08938] constraintWithItem:v43 attribute:10 relatedBy:0 toItem:p_isa attribute:10 multiplier:1.0 constant:0.0];
      [v44 addObject:v48];

      [MEMORY[0x263F08938] activateConstraints:v44];
    }
  }
  return p_isa;
}

+ (id)ASPCoverViewColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:1.0];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)AFUIASPCoverView;
  [(AFUIASPCoverView *)&v10 layoutSubviews];
  [(id)objc_opt_class() screenScale];
  if (v3 == 3.0) {
    double v4 = 4.0;
  }
  else {
    double v4 = 6.0;
  }
  [(AFUIASPCoverView *)self bounds];
  double v6 = v5 - v4;
  [(AFUIASPCoverView *)self bounds];
  double v8 = v7;
  v9 = [(AFUIASPCoverView *)self gradientLayer];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v6, v8);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end