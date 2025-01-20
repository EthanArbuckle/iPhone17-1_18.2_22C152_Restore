@interface AKFingerPotView
- (AKFingerPotView)initWithFrame:(CGRect)a3;
- (UIImage)menuImage;
- (UIImageView)highlight;
- (UIImageView)selectedOutline;
- (void)layoutSubviews;
- (void)setHighlight:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenuImage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedOutline:(id)a3;
@end

@implementation AKFingerPotView

- (AKFingerPotView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKFingerPotView;
  v3 = -[AKFingerPotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AKFingerPotView *)v3 setAdjustsImageWhenHighlighted:0];
    [(AKFingerPotView *)v4 setShowsTouchWhenHighlighted:0];
  }
  return v4;
}

- (UIImage)menuImage
{
  return (UIImage *)MEMORY[0x270F9A6D0](self, sel_backgroundImageForState_);
}

- (void)setMenuImage:(id)a3
{
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKFingerPotView *)self isSelected] != a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AKFingerPotView;
    [(AKFingerPotView *)&v14 setSelected:v3];
    if (v3)
    {
      v5 = [(AKFingerPotView *)self selectedOutline];

      if (!v5)
      {
        id v6 = objc_alloc(MEMORY[0x263F1C6D0]);
        v7 = [MEMORY[0x263F1C6B0] imageNamed:@"ib_text_pop_icon_highlight_swatch_selection"];
        v8 = (void *)[v6 initWithImage:v7];
        [(AKFingerPotView *)self setSelectedOutline:v8];

        v9 = [(AKFingerPotView *)self selectedOutline];
        [v9 setContentMode:4];

        v10 = [(AKFingerPotView *)self selectedOutline];
        [(AKFingerPotView *)self addSubview:v10];

        v11 = [(AKFingerPotView *)self highlight];

        if (v11)
        {
          v12 = [(AKFingerPotView *)self highlight];
          [(AKFingerPotView *)self bringSubviewToFront:v12];
        }
      }
    }
    v13 = [(AKFingerPotView *)self selectedOutline];
    [v13 setHidden:v3 ^ 1];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKFingerPotView *)self isHighlighted] != a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AKFingerPotView;
    [(AKFingerPotView *)&v14 setHighlighted:v3];
    v5 = [(AKFingerPotView *)self highlight];

    if (v5)
    {
      if (v3)
      {
LABEL_4:
        id v6 = [(AKFingerPotView *)self highlight];
        [v6 setAlpha:1.0];

        return;
      }
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x263F1C6D0]);
      v8 = [MEMORY[0x263F1C6B0] imageNamed:@"FingerPot_Pressed"];
      v9 = (void *)[v7 initWithImage:v8];
      [(AKFingerPotView *)self setHighlight:v9];

      v10 = [(AKFingerPotView *)self highlight];
      [v10 setOpaque:0];

      v11 = [(AKFingerPotView *)self highlight];
      [v11 setAlpha:0.0];

      v12 = [(AKFingerPotView *)self highlight];
      [(AKFingerPotView *)self addSubview:v12];

      if (v3) {
        goto LABEL_4;
      }
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_23767D4A0;
    v13[3] = &unk_264CDAE40;
    v13[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v13 animations:0.25];
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)AKFingerPotView;
  [(AKFingerPotView *)&v26 layoutSubviews];
  BOOL v3 = [(AKFingerPotView *)self imageForState:1];

  [(AKFingerPotView *)self bounds];
  -[AKFingerPotView contentRectForBounds:](self, "contentRectForBounds:");
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v3)
  {
    -[AKFingerPotView imageRectForContentRect:](self, "imageRectForContentRect:", v4, v5, v6, v7);
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v11 = v15;
  }
  v16 = [(AKFingerPotView *)self selectedOutline];
  objc_msgSend(v16, "setFrame:", v8, v9, v10, v11);

  v27.origin.double x = v8;
  v27.origin.double y = v9;
  v27.size.double width = v10;
  v27.size.double height = v11;
  double MidX = CGRectGetMidX(v27);
  v28.origin.double x = v8;
  v28.origin.double y = v9;
  v28.size.double width = v10;
  v28.size.double height = v11;
  double MidY = CGRectGetMidY(v28);
  v19 = [(AKFingerPotView *)self highlight];
  objc_msgSend(v19, "setCenter:", MidX, MidY);

  v20 = [(AKFingerPotView *)self highlight];
  [v20 frame];
  CGRect v30 = CGRectIntegral(v29);
  double x = v30.origin.x;
  double y = v30.origin.y;
  double width = v30.size.width;
  double height = v30.size.height;
  v25 = [(AKFingerPotView *)self highlight];
  objc_msgSend(v25, "setFrame:", x, y, width, height);
}

- (UIImageView)selectedOutline
{
  return self->_selectedOutline;
}

- (void)setSelectedOutline:(id)a3
{
}

- (UIImageView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);

  objc_storeStrong((id *)&self->_selectedOutline, 0);
}

@end