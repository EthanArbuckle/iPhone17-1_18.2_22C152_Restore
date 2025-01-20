@interface CLKUIColoringView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)usesLegibility;
- (CLKUIColoringView)initWithFrame:(CGRect)a3;
- (UIColor)overrideColor;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setOverrideColor:(id)a3;
@end

@implementation CLKUIColoringView

- (CLKUIColoringView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLKUIColoringView;
  v3 = -[CLKUIColoringView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CLKUIColoringView *)v3 setOpaque:0];
    v5 = objc_alloc_init(_CLKUIColorManager);
    colorManager = v4->_colorManager;
    v4->_colorManager = v5;

    v7 = v4->_colorManager;
    v8 = [(CLKUIColoringView *)v4 layer];
    [(_CLKUIColorManager *)v7 setLayer:v8];
  }
  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", a3);
  v5.receiver = self;
  v5.super_class = (Class)CLKUIColoringView;
  [(CLKUIColoringView *)&v5 setBackgroundColor:v4];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKUIColoringView;
  BOOL v5 = [(CLKUIColoringView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || [(_CLKUIColorManager *)self->_colorManager shouldAnimatePropertyWithKey:v4];

  return v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_colorManager;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (BOOL)usesLegibility
{
  return 0;
}

- (void)setOverrideColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_colorManager, 0);
}

@end