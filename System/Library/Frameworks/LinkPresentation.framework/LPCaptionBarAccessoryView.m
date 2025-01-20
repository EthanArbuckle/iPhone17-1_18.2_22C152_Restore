@interface LPCaptionBarAccessoryView
- (CGSize)size;
- (LPCaptionBarAccessoryView)initWithHost:(id)a3;
- (LPCaptionBarAccessoryView)initWithHost:(id)a3 type:(int64_t)a4 side:(int64_t)a5;
- (id)_createImageViewWithImage:(id)a3;
- (id)ensureAccessoryView;
- (void)layoutComponentView;
@end

@implementation LPCaptionBarAccessoryView

- (LPCaptionBarAccessoryView)initWithHost:(id)a3
{
  return 0;
}

- (LPCaptionBarAccessoryView)initWithHost:(id)a3 type:(int64_t)a4 side:(int64_t)a5
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LPCaptionBarAccessoryView;
  v8 = [(LPComponentView *)&v14 initWithHost:v7];
  v9 = v8;
  v10 = 0;
  if (a4 && v8)
  {
    v8->_type = a4;
    uint64_t v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    color = v9->_color;
    v9->_color = (UIColor *)v11;

    v10 = v9;
  }

  return v10;
}

- (id)ensureAccessoryView
{
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    v3 = accessoryView;
  }
  else
  {
    if (self->_type == 1)
    {
      v5 = +[LPResources chevron];
      if (v5)
      {
        v6 = [(LPCaptionBarAccessoryView *)self _createImageViewWithImage:v5];
        id v7 = self->_accessoryView;
        self->_accessoryView = v6;

        [(LPCaptionBarAccessoryView *)self addSubview:self->_accessoryView];
      }
    }
    else
    {
      v5 = 0;
    }
    v3 = self->_accessoryView;
  }

  return v3;
}

- (void)layoutComponentView
{
  id v3 = [(LPCaptionBarAccessoryView *)self ensureAccessoryView];
  [(LPCaptionBarAccessoryView *)self bounds];
  accessoryView = self->_accessoryView;

  -[UIImageView setFrame:](accessoryView, "setFrame:");
}

- (CGSize)size
{
  v2 = [(LPCaptionBarAccessoryView *)self ensureAccessoryView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_createImageViewWithImage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  double v6 = [v4 platformImage];
  double v7 = (void *)[v5 initWithImage:v6];

  [v7 setTintColor:self->_color];
  [v7 setContentMode:4];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end