@interface BCChatButton
- (BCChatButton)initWithCoder:(NSCoder *)coder;
- (BCChatButton)initWithFrame:(CGRect)a3;
- (BCChatButton)initWithStyle:(BCChatButtonStyle)style;
- (double)calculateButtonLayout;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)updateAppearanceForState:(id *)result;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (uint64_t)setup;
- (void)_populateArchivedSubviews:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)sizeToFit;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation BCChatButton

- (BCChatButton)initWithStyle:(BCChatButtonStyle)style
{
  v7.receiver = self;
  v7.super_class = (Class)BCChatButton;
  v4 = -[BCChatButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = style;
    -[BCChatButton setup]((uint64_t)v4);
  }
  return v5;
}

- (uint64_t)setup
{
  v2 = +[BCShared classBundle]();
  v3 = [v2 localizedStringForKey:@"CHAT_BUTTON_DOUBLE_LINE_INVERTED" value:&stru_26DD2B2A8 table:0];
  *(unsigned char *)(a1 + 456) = [v3 isEqual:@"true"];

  uint64_t v4 = objc_opt_new();
  v5 = *(void **)(a1 + 496);
  *(void *)(a1 + 496) = v4;

  id v6 = objc_alloc(MEMORY[0x263F1C6D0]);
  objc_super v7 = (void *)MEMORY[0x263F1C6B0];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:@"MessagesIcon" inBundle:v8];
  uint64_t v10 = [v6 initWithImage:v9];
  v11 = *(void **)(a1 + 488);
  *(void *)(a1 + 488) = v10;

  uint64_t v12 = objc_opt_new();
  v13 = *(void **)(a1 + 472);
  *(void *)(a1 + 472) = v12;

  double v14 = *MEMORY[0x263F1D330];
  v15 = [MEMORY[0x263F1C658] systemFontOfSize:23.0 weight:*MEMORY[0x263F1D330]];
  [*(id *)(a1 + 472) setFont:v15];

  v16 = +[BCShared classBundle]();
  v17 = [v16 localizedStringForKey:@"CHAT_BUTTON_DOUBLE_LINE_LARGE_LABEL" value:&stru_26DD2B2A8 table:0];
  [*(id *)(a1 + 472) setText:v17];

  [*(id *)(a1 + 472) setTextAlignment:0];
  [*(id *)(a1 + 472) setContentMode:7];
  uint64_t v18 = objc_opt_new();
  v19 = *(void **)(a1 + 480);
  *(void *)(a1 + 480) = v18;

  v20 = [MEMORY[0x263F1C658] systemFontOfSize:11.0 weight:v14];
  [*(id *)(a1 + 480) setFont:v20];

  v21 = +[BCShared classBundle]();
  v22 = [v21 localizedStringForKey:@"CHAT_BUTTON_DOUBLE_LINE_SMALL_LABEL" value:&stru_26DD2B2A8 table:0];
  [*(id *)(a1 + 480) setText:v22];

  [*(id *)(a1 + 480) setTextAlignment:0];
  [(id)a1 _setContinuousCornerRadius:8.0];
  v23 = [(id)a1 layer];
  [v23 setMasksToBounds:1];

  v24 = [(id)a1 layer];
  [v24 setBorderWidth:1.0];

  uint64_t v25 = *(void *)(a1 + 472);
  id v26 = *(id *)(a1 + 496);
  [v26 addSubview:v25];

  uint64_t v27 = *(void *)(a1 + 480);
  id v28 = *(id *)(a1 + 496);
  [v28 addSubview:v27];

  uint64_t v29 = *(void *)(a1 + 488);
  id v30 = *(id *)(a1 + 496);
  [v30 addSubview:v29];

  [(id)a1 addSubview:*(void *)(a1 + 496)];
  -[BCChatButton updateAppearanceForState:]((id *)a1, 0);
  v31 = +[BCShared classBundle]();
  v32 = [v31 localizedStringForKey:@"CHAT_BUTTON_ACCESSIBILITY_LABEL" value:&stru_26DD2B2A8 table:0];
  [(id)a1 setAccessibilityLabel:v32];

  [(id)a1 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  return [(id)a1 sizeToFit];
}

- (BCChatButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = [(BCChatButton *)self initWithStyle:1];
  v8 = v7;
  if (v7) {
    -[BCChatButton setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (BCChatButton)initWithCoder:(NSCoder *)coder
{
  uint64_t v4 = coder;
  v7.receiver = self;
  v7.super_class = (Class)BCChatButton;
  v5 = [(BCChatButton *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_style = [(NSCoder *)v4 decodeIntegerForKey:@"BCChatButtonStyleIdentifier"];
    -[BCChatButton setup]((uint64_t)v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"BCChatButtonStyleIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  [(BCChatButton *)&v6 encodeWithCoder:v5];
}

- (id)updateAppearanceForState:(id *)result
{
  if (result)
  {
    v3 = result;
    if ([result isHighlighted]) {
      a2 = 1;
    }
    int v4 = [v3 isEnabled];
    uint64_t v5 = 2;
    if (v4) {
      uint64_t v5 = a2;
    }
    uint64_t v6 = 17 * v5;
    objc_super v7 = &dbl_228C3AEB8[85 * (void)v3[58] + 17 * v5];
    v8 = [MEMORY[0x263F1C550] colorWithRed:v7[8] green:v7[9] blue:v7[10] alpha:v7[11]];
    [v3[59] setTextColor:v8];

    v9 = &dbl_228C3AEB8[85 * (void)v3[58] + v6];
    uint64_t v10 = [MEMORY[0x263F1C550] colorWithRed:v9[8] green:v9[9] blue:v9[10] alpha:v9[11]];
    [v3[60] setTextColor:v10];

    v11 = &dbl_228C3AEB8[85 * (void)v3[58] + v6];
    id v12 = [MEMORY[0x263F1C550] colorWithRed:*v11 green:v11[1] blue:v11[2] alpha:v11[3]];
    uint64_t v13 = [v12 CGColor];
    double v14 = [v3 layer];
    [v14 setBackgroundColor:v13];

    v15 = &dbl_228C3AEB8[85 * (void)v3[58] + v6];
    id v16 = [MEMORY[0x263F1C550] colorWithRed:v15[12] green:v15[13] blue:v15[14] alpha:v15[15]];
    uint64_t v17 = [v16 CGColor];
    uint64_t v18 = [v3 layer];
    [v18 setBorderColor:v17];

    double v19 = dbl_228C3AEB8[85 * (void)v3[58] + 16 + v6];
    id v20 = v3[61];
    return (id *)[v20 setAlpha:v19];
  }
  return result;
}

- (double)calculateButtonLayout
{
  v44[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0.0;
  }
  double v2 = *MEMORY[0x263F1D330];
  v3 = [MEMORY[0x263F1C658] systemFontOfSize:11.0 weight:*MEMORY[0x263F1D330]];
  int v4 = [MEMORY[0x263F1C658] systemFontOfSize:23.0 weight:v2];
  id v5 = *(id *)(a1 + 480);
  uint64_t v6 = [v5 text];
  uint64_t v43 = *MEMORY[0x263F1C238];
  uint64_t v7 = v43;
  v44[0] = v3;
  v8 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];

  [v6 sizeWithAttributes:v8];
  double v10 = v9;
  double v12 = v11;

  id v13 = *(id *)(a1 + 472);
  double v14 = [v13 text];
  uint64_t v41 = v7;
  v42 = v4;
  v15 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

  [v14 sizeWithAttributes:v15];
  double v17 = v16;
  double v19 = v18;

  if (*(unsigned char *)(a1 + 456))
  {
    objc_msgSend(*(id *)(a1 + 472), "setFrame:", 41.0, -6.0, v17, v19);
    id v20 = &OBJC_IVAR___BCChatButton__smallLabel;
    id v21 = *(id *)(a1 + 472);
    [v21 frame];
    double v23 = v19 + v22;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 480), "setFrame:", 41.0, -1.0, v10, v12);
    id v21 = *(id *)(a1 + 480);
    [v21 frame];
    double v23 = v12 + v24 + -3.0;
    double v10 = v17;
    double v12 = v19;
    id v20 = &OBJC_IVAR___BCChatButton__label;
  }
  objc_msgSend(*(id *)(a1 + *v20), "setFrame:", 41.0, v23, v10, v12);

  id v25 = *(id *)(a1 + 472);
  [v25 frame];
  double v27 = v26;
  id v28 = *(id *)(a1 + 472);
  [v28 frame];
  double v30 = v27 + v29;
  id v31 = *(id *)(a1 + 480);
  [v31 frame];
  double v33 = v32;
  [*(id *)(a1 + 480) frame];
  double v35 = fmax(v30, v33 + v34);

  objc_msgSend(*(id *)(a1 + 488), "setFrame:", 0.0, 0.0, 32.0, 32.0);
  [(id)a1 bounds];
  double v37 = v36 * 0.5 - v35 * 0.5;
  [(id)a1 bounds];
  objc_msgSend(*(id *)(a1 + 496), "setFrame:", v37, v38 * 0.5 + -16.0, v35, 32.0);
  double v39 = fmax(v35 + 18.0, 156.0);

  return v39;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  -[BCChatButton setEnabled:](&v6, sel_setEnabled_);
  if (v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  -[BCChatButton updateAppearanceForState:]((id *)&self->super.super.super.super.isa, v5);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)BCChatButton;
  -[BCChatButton setHighlighted:](&v5, sel_setHighlighted_);
  -[BCChatButton updateAppearanceForState:]((id *)&self->super.super.super.super.isa, v3);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BCChatButton;
  -[BCChatButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self) {
    -[BCChatButton calculateButtonLayout]((uint64_t)self);
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BCChatButton;
  [(BCChatButton *)&v3 _populateArchivedSubviews:a3];
}

- (void)sizeToFit
{
  -[BCChatButton calculateButtonLayout]((uint64_t)self);
  [(BCChatButton *)self frame];
  double v4 = v3;
  [(BCChatButton *)self frame];

  [(BCChatButton *)self setFrame:v4];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  [(BCChatButton *)&v6 touchesBegan:a3 withEvent:a4];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__BCChatButton_touchesBegan_withEvent___block_invoke;
  v5[3] = &unk_264851ED0;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:0.2];
}

id *__39__BCChatButton_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  return -[BCChatButton updateAppearanceForState:](*(id **)(a1 + 32), 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BCChatButton;
  [(BCChatButton *)&v6 touchesEnded:a3 withEvent:a4];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__BCChatButton_touchesEnded_withEvent___block_invoke;
  v5[3] = &unk_264851ED0;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:0.2];
}

id *__39__BCChatButton_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return -[BCChatButton updateAppearanceForState:](*(id **)(a1 + 32), 0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(BCChatButton *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    uint64_t v7 = self;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BCChatButton;
  [(BCChatButton *)&v3 layoutSubviews];
  if (self) {
    -[BCChatButton calculateButtonLayout]((uint64_t)self);
  }
}

- (id)viewForFirstBaselineLayout
{
  if (self) {
    self = (BCChatButton *)self->_smallLabel;
  }
  return self;
}

- (id)viewForLastBaselineLayout
{
  if (self) {
    self = (BCChatButton *)self->_label;
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_smallLabel, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end