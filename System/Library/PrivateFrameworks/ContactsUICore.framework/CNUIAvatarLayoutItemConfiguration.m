@interface CNUIAvatarLayoutItemConfiguration
- (CGRect)itemFrameInContainingBounds:(CGRect)a3 isRTL:(BOOL)a4;
- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate;
- (CNUIAvatarLayoutItemConfiguration)initWithSize:(double)a3 x:(double)a4 y:(double)a5 baseSize:(double)a6;
- (CNUIAvatarLayoutItemConfiguration)initWithSize:(double)a3 x:(double)a4 y:(double)a5 baseSize:(double)a6 withLayoutDelegate:(id)a7;
- (double)baseSize;
- (double)size;
- (double)x;
- (double)y;
- (void)setBaseSize:(double)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setSize:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)updateLayer:(id)a3 inBounds:(CGRect)a4 atIndex:(int64_t)a5 isRTL:(BOOL)a6;
@end

@implementation CNUIAvatarLayoutItemConfiguration

- (void)updateLayer:(id)a3 inBounds:(CGRect)a4 atIndex:(int64_t)a5 isRTL:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v24 = a3;
  -[CNUIAvatarLayoutItemConfiguration itemFrameInContainingBounds:isRTL:](self, "itemFrameInContainingBounds:isRTL:", v6, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(CNUIAvatarLayoutItemConfiguration *)self layoutDelegate];

  if (v21)
  {
    v22 = [(CNUIAvatarLayoutItemConfiguration *)self layoutDelegate];
    objc_msgSend(v22, "layoutLayer:at:within:withAvatarIndex:", v24, a5, v14, v16, v18, v20, x, y, width, height);

    v23 = v22;
  }
  else
  {
    objc_msgSend(v24, "setFrame:", v14, v16, v18, v20);
    [v24 setZPosition:(double)-a5];
    v23 = v24;
  }
}

- (CGRect)itemFrameInContainingBounds:(CGRect)a3 isRTL:(BOOL)a4
{
  if (a3.size.width <= 0.0 || (double height = a3.size.height, a3.size.height <= 0.0))
  {
    double v17 = *MEMORY[0x263F001A8];
    double v20 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    BOOL v5 = a4;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    [(CNUIAvatarLayoutItemConfiguration *)self size];
    double v11 = v10;
    [(CNUIAvatarLayoutItemConfiguration *)self baseSize];
    double v13 = height / v12;
    double v14 = v11 * (height / v12);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.double height = height;
    double v15 = CGRectGetMidX(v24) - v14 * 0.5;
    [(CNUIAvatarLayoutItemConfiguration *)self x];
    if (v5) {
      double v16 = -v16;
    }
    double v17 = v15 + v16 * v13;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.double height = height;
    CGFloat v18 = CGRectGetMidY(v25) - v14 * 0.5;
    [(CNUIAvatarLayoutItemConfiguration *)self y];
    double v20 = v18 + v19 * v13;
    double v21 = v14;
  }
  double v22 = v17;
  double v23 = v14;
  result.size.double height = v21;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v22;
  return result;
}

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (double)size
{
  return self->_size;
}

- (double)baseSize
{
  return self->_baseSize;
}

- (CNUIAvatarLayoutItemConfiguration)initWithSize:(double)a3 x:(double)a4 y:(double)a5 baseSize:(double)a6
{
  return [(CNUIAvatarLayoutItemConfiguration *)self initWithSize:0 x:a3 y:a4 baseSize:a5 withLayoutDelegate:a6];
}

- (CNUIAvatarLayoutItemConfiguration)initWithSize:(double)a3 x:(double)a4 y:(double)a5 baseSize:(double)a6 withLayoutDelegate:(id)a7
{
  id v12 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CNUIAvatarLayoutItemConfiguration;
  double v13 = [(CNUIAvatarLayoutItemConfiguration *)&v17 init];
  double v14 = v13;
  if (v13)
  {
    v13->_size = a3;
    v13->_CGFloat x = a4;
    v13->_CGFloat y = a5;
    v13->_baseSize = a6;
    objc_storeWeak((id *)&v13->_layoutDelegate, v12);
    double v15 = v14;
  }

  return v14;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (void)setX:(double)a3
{
  self->_CGFloat x = a3;
}

- (void)setY:(double)a3
{
  self->_CGFloat y = a3;
}

- (void)setBaseSize:(double)a3
{
  self->_baseSize = a3;
}

- (CNGroupAvatarLayerLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (CNGroupAvatarLayerLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end