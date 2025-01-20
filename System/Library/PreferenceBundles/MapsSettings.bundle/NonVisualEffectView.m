@interface NonVisualEffectView
- (NSString)_groupName;
- (NonVisualEffectView)initWithCoder:(id)a3;
- (NonVisualEffectView)initWithEffect:(id)a3;
- (NonVisualEffectView)initWithFrame:(CGRect)a3;
- (UIColor)customBackgroundColor;
- (UIView)contentView;
- (UIVisualEffect)effect;
- (double)_cornerRadius;
- (id)backgroundColor;
- (void)_setCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5;
- (void)_setGroupName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setEffect:(id)a3;
- (void)updateTheme;
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
  v5 = -[NonVisualEffectView initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
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
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"-[%@ %@] not implemeneted", v6, v7);

  return [(NonVisualEffectView *)self initWithEffect:0];
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_alloc((Class)UIView);
    [(NonVisualEffectView *)self bounds];
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    [(UIView *)self->_contentView setClipsToBounds:1];
    [(UIView *)self->_contentView setAutoresizingMask:18];
    [(UIView *)self->_contentView _setCornerRadius:self->_cornerRadius];
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
    if (([(UIVisualEffect *)effect isEqual:v4] & 1) == 0)
    {
      v6 = (UIVisualEffect *)[(UIVisualEffect *)v15 copy];
      v7 = self->_effect;
      self->_effect = v6;

      backgroundView = self->_backgroundView;
      if (!self->_effect)
      {
        uint64_t v9 = 1;
        goto LABEL_7;
      }
      if (backgroundView)
      {
        uint64_t v9 = 0;
LABEL_7:
        [(UIView *)backgroundView setHidden:v9];
        goto LABEL_9;
      }
      id v10 = objc_alloc((Class)UIView);
      [(NonVisualEffectView *)self bounds];
      v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
      v12 = self->_backgroundView;
      self->_backgroundView = v11;

      [(UIView *)self->_backgroundView setAutoresizingMask:18];
      [(UIView *)self->_backgroundView _setCornerRadius:self->_cornerRadius];
      [(UIView *)self->_backgroundView setClipsToBounds:1];
      v13 = [(NonVisualEffectView *)self theme];
      v14 = [v13 controlBackgroundColor];
      [(UIView *)self->_backgroundView setBackgroundColor:v14];

      [(NonVisualEffectView *)self insertSubview:self->_backgroundView atIndex:0];
    }
  }
LABEL_9:

  _objc_release_x1();
}

- (id)backgroundColor
{
  return [(UIView *)self->_backgroundView backgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)_setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NonVisualEffectView *)self subviews];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * i) _setCornerRadius:a3];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (void)_setCornerRadius:(double)a3 continuous:(BOOL)a4 maskedCorners:(unint64_t)a5
{
  BOOL v6 = a4;
  self->_cornerRadius = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v8 = [(NonVisualEffectView *)self subviews];
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v14 = [v13 layer];
        [v14 setMaskedCorners:a5];

        if (v6) {
          [v13 _setContinuousCornerRadius:a3];
        }
        else {
          [v13 _setCornerRadius:a3];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)setCustomBackgroundColor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_customBackgroundColor;
  unint64_t v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    id v12 = (id)v6;
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      objc_super v8 = (UIColor *)[v12 copy];
      customBackgroundColor = self->_customBackgroundColor;
      self->_customBackgroundColor = v8;

      if (self->_customBackgroundColor)
      {
        -[NonVisualEffectView setBackgroundColor:](self, "setBackgroundColor:");
      }
      else
      {
        id v10 = [(NonVisualEffectView *)self theme];
        uint64_t v11 = [v10 controlBackgroundColor];
        [(NonVisualEffectView *)self setBackgroundColor:v11];
      }
    }
  }

  _objc_release_x1();
}

- (void)updateTheme
{
  v6.receiver = self;
  v6.super_class = (Class)NonVisualEffectView;
  [(MapsThemeView *)&v6 updateTheme];
  v3 = [(NonVisualEffectView *)self customBackgroundColor];

  if (!v3)
  {
    id v4 = [(NonVisualEffectView *)self theme];
    unint64_t v5 = [v4 controlBackgroundColor];
    [(UIView *)self->_backgroundView setBackgroundColor:v5];
  }
}

- (UIVisualEffect)effect
{
  return self->_effect;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (NSString)_groupName
{
  return self->__groupName;
}

- (void)_setGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__groupName, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end