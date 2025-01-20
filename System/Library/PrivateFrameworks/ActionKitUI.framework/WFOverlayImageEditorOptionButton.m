@interface WFOverlayImageEditorOptionButton
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (WFOverlayImageEditorOptionButton)initWithFrame:(CGRect)a3;
- (id)customFont;
@end

@implementation WFOverlayImageEditorOptionButton

- (CGSize)intrinsicContentSize
{
  v20[1] = *MEMORY[0x263EF8340];
  v3 = [(WFOverlayImageEditorOptionButton *)self currentImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  v8 = [(WFOverlayImageEditorOptionButton *)self currentTitle];
  uint64_t v19 = *MEMORY[0x263F814F0];
  v9 = [(WFOverlayImageEditorOptionButton *)self titleLabel];
  v10 = [v9 font];
  v20[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v8 sizeWithAttributes:v11];
  double v13 = v12;
  double v15 = v14;

  if (v5 >= v13) {
    double v16 = v5;
  }
  else {
    double v16 = v13;
  }
  double v17 = ceil(v16);
  double v18 = ceil(v7 + v15);
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v16[1] = *MEMORY[0x263EF8340];
  CGRect remainder = a3;
  v8 = [(WFOverlayImageEditorOptionButton *)self currentTitle];
  uint64_t v15 = *MEMORY[0x263F814F0];
  v9 = [(WFOverlayImageEditorOptionButton *)self customFont];
  v16[0] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v8 sizeWithAttributes:v10];
  CGFloat v12 = v11;

  memset(&v13, 0, sizeof(v13));
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRectDivide(v17, &v13, &remainder, v12, CGRectMaxYEdge);
  return CGRectIntegral(v13);
}

- (id)customFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:13.0];
}

- (WFOverlayImageEditorOptionButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WFOverlayImageEditorOptionButton;
  v3 = -[WFOverlayImageEditorOptionButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(WFOverlayImageEditorOptionButton *)v3 titleLabel];
    double v6 = [(WFOverlayImageEditorOptionButton *)v4 customFont];
    [v5 setFont:v6];

    [v5 setTextAlignment:1];
    double v7 = [(WFOverlayImageEditorOptionButton *)v4 imageView];
    [v7 setContentMode:5];

    v8 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.756862745 blue:0.0274509804 alpha:1.0];
    v9 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.699999988];
    [(WFOverlayImageEditorOptionButton *)v4 setTitleColor:v8 forState:4];
    [(WFOverlayImageEditorOptionButton *)v4 setTitleColor:v9 forState:0];
    v10 = [v9 colorWithAlphaComponent:0.400000006];
    [(WFOverlayImageEditorOptionButton *)v4 setTitleColor:v10 forState:1];

    double v11 = v4;
  }

  return v4;
}

@end