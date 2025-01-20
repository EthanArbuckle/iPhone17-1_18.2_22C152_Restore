@interface NonVisualEffectView
- (NSString)_groupName;
- (NonVisualEffectView)initWithCoder:(id)a3;
- (NonVisualEffectView)initWithEffect:(id)a3;
- (NonVisualEffectView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIVisualEffect)effect;
- (_UIVisualEffectBackdropView)_captureView;
- (double)_cornerRadius;
- (void)_setCaptureView:(id)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setGroupName:(id)a3;
- (void)setEffect:(id)a3;
@end

@implementation NonVisualEffectView

- (NonVisualEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(NonVisualEffectView *)self initWithEffect:0];
  v8 = v7;
  if (v7) {
    -[NonVisualEffectView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (NonVisualEffectView)initWithEffect:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NonVisualEffectView;
  v5 = -[NonVisualEffectView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    [(NonVisualEffectView *)v5 setAutoresizesSubviews:1];
    [(NonVisualEffectView *)v6 setEffect:v4];
  }

  return v6;
}

- (NonVisualEffectView)initWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"-[%@ %@] not implemeneted", v8, v9 format];

  return [(NonVisualEffectView *)self initWithEffect:0];
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    [(NonVisualEffectView *)self bounds];
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    uint64_t v6 = self->_contentView;
    self->_contentView = v5;

    [(UIView *)self->_contentView setClipsToBounds:1];
    [(UIView *)self->_contentView setAutoresizingMask:18];
    [(UIView *)self->_contentView _setContinuousCornerRadius:self->_cornerRadius];
    [(NonVisualEffectView *)self addSubview:self->_contentView];
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)setEffect:(id)a3
{
  id v4 = (UIVisualEffect *)a3;
  effect = self->_effect;
  if (effect != v4)
  {
    v15 = v4;
    char v6 = [(UIVisualEffect *)effect isEqual:v4];
    id v4 = v15;
    if ((v6 & 1) == 0)
    {
      v7 = (UIVisualEffect *)[(UIVisualEffect *)v15 copy];
      objc_super v8 = self->_effect;
      self->_effect = v7;

      backgroundView = self->_backgroundView;
      if (self->_effect)
      {
        if (!backgroundView)
        {
          id v11 = objc_alloc(MEMORY[0x263F82E00]);
          [(NonVisualEffectView *)self bounds];
          v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
          v13 = self->_backgroundView;
          self->_backgroundView = v12;

          [(UIView *)self->_backgroundView setAutoresizingMask:18];
          [(UIView *)self->_backgroundView _setContinuousCornerRadius:self->_cornerRadius];
          [(UIView *)self->_backgroundView setClipsToBounds:1];
          v14 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
          [(UIView *)self->_backgroundView setBackgroundColor:v14];

          [(NonVisualEffectView *)self insertSubview:self->_backgroundView atIndex:0];
          goto LABEL_9;
        }
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = 1;
      }
      [(UIView *)backgroundView setHidden:v10];
LABEL_9:
      id v4 = v15;
    }
  }
}

- (void)_setCornerRadius:(double)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NonVisualEffectView *)self subviews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) _setContinuousCornerRadius:a3];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (NSString)_groupName
{
  return self->__groupName;
}

- (void)_setGroupName:(id)a3
{
}

- (_UIVisualEffectBackdropView)_captureView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureView);
  return (_UIVisualEffectBackdropView *)WeakRetained;
}

- (void)_setCaptureView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__captureView);
  objc_storeStrong((id *)&self->__groupName, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end