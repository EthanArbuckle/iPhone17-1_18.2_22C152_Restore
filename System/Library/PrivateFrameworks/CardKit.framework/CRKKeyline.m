@interface CRKKeyline
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CRKKeyline)initWithType:(int64_t)a3 direction:(int64_t)a4 visualEffectStyle:(unint64_t)a5;
- (double)_roundedKeylineThickness;
- (double)defaultKeylineInsetForCurrentDevice;
- (id)_keylineColorForVisualEffectStyle:(unint64_t)a3;
- (int64_t)direction;
- (int64_t)type;
- (unint64_t)visualEffectStyle;
- (void)layoutSubviews;
@end

@implementation CRKKeyline

- (CRKKeyline)initWithType:(int64_t)a3 direction:(int64_t)a4 visualEffectStyle:(unint64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)CRKKeyline;
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = -[CRKKeyline initWithFrame:](&v18, sel_initWithFrame_, a3, a4, *MEMORY[0x263F001A8], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v7, v8, v9, v10);
    keylineView = v12->_keylineView;
    v12->_keylineView = (UIView *)v13;

    v12->_visualEffectStyle = a5;
    v15 = v12->_keylineView;
    v16 = [(CRKKeyline *)v12 _keylineColorForVisualEffectStyle:a5];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v12->_keylineView setHidden:a3 == 0];
    [(CRKKeyline *)v12 addSubview:v12->_keylineView];
  }
  return v12;
}

- (id)_keylineColorForVisualEffectStyle:(unint64_t)a3
{
  double v3 = 0.0;
  if (a3 == 1) {
    double v3 = 1.0;
  }
  return (id)[MEMORY[0x263F1C550] colorWithWhite:v3 alpha:0.18];
}

- (double)_roundedKeylineThickness
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  double result = 1.0;
  if (v4 != 1.0) {
    return 1.0 / v4;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRKKeyline *)self _roundedKeylineThickness];
  int64_t direction = self->_direction;
  if (direction)
  {
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (direction == 1)
    {
      double v8 = height;
      double width = v6;
    }
    else
    {
      double width = *MEMORY[0x263F001B0];
    }
  }
  else
  {
    double v8 = v6;
  }
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[CRKKeyline sizeThatFits:](self, "sizeThatFits:", 0.0, 0.0);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)defaultKeylineInsetForCurrentDevice
{
  double v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 16.0;
  if (v3 != 2)
  {
    BOOL v5 = CRKIsLargeDevice();
    double result = 16.0;
    if (v5) {
      return 20.0;
    }
  }
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CRKKeyline;
  [(CRKKeyline *)&v21 layoutSubviews];
  [(CRKKeyline *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t type = self->_type;
  double v12 = 0.0;
  if (type == 1)
  {
    [(CRKKeyline *)self defaultKeylineInsetForCurrentDevice];
    double v13 = v16;
  }
  else if (type == 2)
  {
    [(CRKKeyline *)self defaultKeylineInsetForCurrentDevice];
    double v12 = v17;
    double v13 = 43.0;
  }
  else
  {
    double v13 = 0.0;
    if (type == 3)
    {
      [(CRKKeyline *)self defaultKeylineInsetForCurrentDevice];
      double v13 = v14;
      [(CRKKeyline *)self defaultKeylineInsetForCurrentDevice];
      double v12 = v15;
    }
  }
  BOOL v18 = CRKIsRTL(self);
  if (v18) {
    double v19 = v12;
  }
  else {
    double v19 = v13;
  }
  if (v18) {
    double v20 = v13;
  }
  else {
    double v20 = v12;
  }
  -[UIView setFrame:](self->_keylineView, "setFrame:", v4 + v19, v6, v8 - (v19 + v20), v10);
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)direction
{
  return self->_direction;
}

- (unint64_t)visualEffectStyle
{
  return self->_visualEffectStyle;
}

- (void).cxx_destruct
{
}

@end