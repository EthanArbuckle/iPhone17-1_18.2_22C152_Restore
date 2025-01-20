@interface AVMobileChromelessBackgroundGradientView
+ (Class)layerClass;
- (AVMobileChromelessBackgroundGradientView)initWithFrame:(CGRect)a3;
- (BOOL)isActive;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateGradientColors;
- (void)setActive:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AVMobileChromelessBackgroundGradientView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorsLight, 0);

  objc_storeStrong((id *)&self->_colorsDark, 0);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  id v4 = a3;
  [(AVMobileChromelessBackgroundGradientView *)&v8 traitCollectionDidChange:v4];
  v5 = [(AVMobileChromelessBackgroundGradientView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[AVMobileChromelessBackgroundGradientView _updateGradientColors]((char *)self);
  }
}

- (void)_updateGradientColors
{
  if (a1)
  {
    v2 = [a1 traitCollection];
    uint64_t v3 = [v2 userInterfaceStyle];

    id v4 = [a1 layer];
    id v6 = v4;
    v5 = &OBJC_IVAR___AVMobileChromelessBackgroundGradientView__colorsDark;
    if (v3 == 1) {
      v5 = &OBJC_IVAR___AVMobileChromelessBackgroundGradientView__colorsLight;
    }
    [v4 setColors:*(void *)&a1[*v5]];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  -[AVMobileChromelessBackgroundGradientView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AVMobileChromelessBackgroundGradientView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if ([(AVMobileChromelessBackgroundGradientView *)self isActive]) {
      float v4 = 1.0;
    }
    else {
      float v4 = 0.0;
    }
    id v6 = [(AVMobileChromelessBackgroundGradientView *)self layer];
    *(float *)&double v5 = v4;
    [v6 setOpacity:v5];
  }
}

- (AVMobileChromelessBackgroundGradientView)initWithFrame:(CGRect)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AVMobileChromelessBackgroundGradientView;
  uint64_t v3 = -[AVMobileChromelessBackgroundGradientView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    v22[0] = [v4 CGColor];
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    v22[1] = [v5 CGColor];
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    v22[2] = [v6 CGColor];
    id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    v22[3] = [v7 CGColor];
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    v22[4] = [v8 CGColor];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    colorsDark = v3->_colorsDark;
    v3->_colorsDark = (NSArray *)v9;

    id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
    v21[0] = [v11 CGColor];
    id v12 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    v21[1] = [v12 CGColor];
    id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.15];
    v21[2] = [v13 CGColor];
    id v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
    v21[3] = [v14 CGColor];
    id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    v21[4] = [v15 CGColor];
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
    colorsLight = v3->_colorsLight;
    v3->_colorsLight = (NSArray *)v16;

    v18 = [(AVMobileChromelessBackgroundGradientView *)v3 layer];
    [v18 setLocations:&unk_1F094A358];
    -[AVMobileChromelessBackgroundGradientView _updateGradientColors]((char *)v3);
    v3->_active = 1;
  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end