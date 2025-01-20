@interface CPSEntityMapButton
+ (CPSEntityMapButton)buttonWithEntityMapButtonType:(unint64_t)a3;
- (CGSize)buttonGlyphSize;
- (CGSize)buttonSize;
- (CPSEntityMapButton)initWithFrame:(CGRect)a3;
- (id)buttonAttributes;
- (id)buttonBackgroundColor;
- (id)buttonImageTintColor;
- (unint64_t)entityMapButtonType;
- (void)layoutSubviews;
- (void)setEntityMapButtonType:(unint64_t)a3;
- (void)setNeedsLayout;
@end

@implementation CPSEntityMapButton

+ (CPSEntityMapButton)buttonWithEntityMapButtonType:(unint64_t)a3
{
  id v9 = a1;
  SEL v8 = a2;
  unint64_t v7 = a3;
  v6[1] = 0;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CPSEntityMapButton;
  v6[0] = objc_msgSendSuper2(&v5, sel_buttonWithType_, 0);
  [v6[0] setEntityMapButtonType:v7];
  id v4 = v6[0];
  objc_storeStrong(v6, 0);

  return (CPSEntityMapButton *)v4;
}

- (CPSEntityMapButton)initWithFrame:(CGRect)a3
{
  CGRect v12 = a3;
  SEL v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)CPSEntityMapButton;
  v11 = -[CPSActionButton initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    [(CPSActionButton *)v11 setLayoutDelegate:v11];
    objc_super v5 = v11;
    id v6 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    -[CPSActionButton setTintColor:forState:](v5, "setTintColor:forState:");

    id v8 = +[CPSEntityStyles mapButtonDropShadow];
    id v7 = (id)[(CPSEntityMapButton *)v11 layer];
    objc_msgSend(v8, "applyShadowToLayer:");
  }
  id v4 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v4;
}

- (void)setEntityMapButtonType:(unint64_t)a3
{
  if (self->_entityMapButtonType != a3)
  {
    self->_entityMapButtonType = a3;
    [(CPSEntityMapButton *)self setNeedsLayout];
  }
}

- (void)setNeedsLayout
{
  v23 = self;
  SEL v22 = a2;
  v21.receiver = self;
  v21.super_class = (Class)CPSEntityMapButton;
  [(CPSEntityMapButton *)&v21 setNeedsLayout];
  id v20 = 0;
  uint64_t v2 = [(CPSEntityMapButton *)v23 entityMapButtonType];
  if (v2)
  {
    uint64_t v4 = v2;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if ((v3 & 1) == 0)
  {
    switch(v4)
    {
      case 0:
        break;
      case 1:
        id v18 = (id)[(CPSEntityMapButton *)v23 traitCollection];
        id v5 = (id)CPUIImageZoomInGlyph();
        id v6 = v20;
        id v20 = v5;

        id v19 = (id)[(CPSEntityMapButton *)v23 layer];
        [v19 setMaskedCorners:3];

        break;
      case 2:
        id v16 = (id)[(CPSEntityMapButton *)v23 traitCollection];
        id v7 = (id)CPUIImageZoomOutGlyph();
        id v8 = v20;
        id v20 = v7;

        id v17 = (id)[(CPSEntityMapButton *)v23 layer];
        [v17 setMaskedCorners:12];

        break;
      case 3:
        id v15 = (id)[(CPSEntityMapButton *)v23 traitCollection];
        id v9 = (id)CPUIImagePanGlyph();
        SEL v10 = v20;
        id v20 = v9;

        break;
      case 4:
        id v14 = (id)[(CPSEntityMapButton *)v23 traitCollection];
        id v11 = (id)CPUIImageRecenterGlyph();
        CGRect v12 = v20;
        id v20 = v11;

        break;
      default:
        JUMPOUT(0);
    }
  }
  -[CPSActionButton setButtonImage:](v23, "setButtonImage:", v20, &v20);
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  id v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSEntityMapButton;
  [(CPSActionButton *)&v4 layoutSubviews];
  [(CPSEntityMapButton *)v6 frame];
  CGFloat v2 = CGRectGetWidth(v7) * 0.5;
  id v3 = (id)[(CPSEntityMapButton *)v6 layer];
  [v3 setCornerRadius:v2];
}

- (id)buttonAttributes
{
  return MEMORY[0x263EFFA78];
}

- (CGSize)buttonSize
{
  CGSizeMake_10();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)buttonGlyphSize
{
  CGSizeMake_10();
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)buttonBackgroundColor
{
  char v6 = 0;
  char v4 = 0;
  if ([(CPSEntityMapButton *)self isFocused])
  {
    id v7 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    char v6 = 1;
    id v2 = v7;
  }
  else
  {
    id v5 = +[CPSEntityStyles mapButtonBackgroundColor];
    char v4 = 1;
    id v2 = v5;
  }
  id v8 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

- (id)buttonImageTintColor
{
  char v6 = 0;
  char v4 = 0;
  if ([(CPSEntityMapButton *)self isFocused])
  {
    id v7 = +[CPSEntityStyles mapButtonBackgroundColor];
    char v6 = 1;
    id v2 = v7;
  }
  else
  {
    id v5 = (id)[MEMORY[0x263F1C550] _carSystemFocusColor];
    char v4 = 1;
    id v2 = v5;
  }
  id v8 = v2;
  if (v4) {

  }
  if (v6) {

  }
  return v8;
}

- (unint64_t)entityMapButtonType
{
  return self->_entityMapButtonType;
}

@end