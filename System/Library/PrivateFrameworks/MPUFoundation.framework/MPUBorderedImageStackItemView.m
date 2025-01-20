@interface MPUBorderedImageStackItemView
- (MPUBorderConfiguration)borderConfiguration;
- (MPUBorderDrawingCache)borderDrawingCache;
- (MPUBorderedImageStackItemView)initWithFrame:(CGRect)a3;
- (void)_updateBorderImageView;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBorderConfiguration:(id)a3;
- (void)setBorderDrawingCache:(id)a3;
@end

@implementation MPUBorderedImageStackItemView

- (MPUBorderedImageStackItemView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPUBorderedImageStackItemView;
  v3 = -[MPUImageStackItemView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(MPUBorderedImageStackItemView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    borderImageView = v3->_borderImageView;
    v3->_borderImageView = (UIImageView *)v5;

    [(MPUBorderedImageStackItemView *)v3 addSubview:v3->_borderImageView];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_borderDrawingCache)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"MPUBorderDrawingCacheDidInvalidateNotification" object:self->_borderDrawingCache];
  }
  v4.receiver = self;
  v4.super_class = (Class)MPUBorderedImageStackItemView;
  [(MPUBorderedImageStackItemView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MPUBorderedImageStackItemView;
  [(MPUImageStackItemView *)&v6 layoutSubviews];
  +[MPUBorderView requiredOutsetForDropShadow];
  double v4 = v3;
  borderImageView = self->_borderImageView;
  [(MPUBorderedImageStackItemView *)self bounds];
  CGRect v8 = CGRectInset(v7, -v4, -v4);
  -[UIImageView setFrame:](borderImageView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

- (void)setBorderConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t borderConfiguration = (uint64_t)self->_borderConfiguration;
  if ((id)borderConfiguration != v4)
  {
    CGRect v8 = v4;
    uint64_t borderConfiguration = [(id)borderConfiguration isEqual:v4];
    id v4 = v8;
    if ((borderConfiguration & 1) == 0)
    {
      objc_super v6 = (MPUBorderConfiguration *)[v8 copy];
      CGRect v7 = self->_borderConfiguration;
      self->_uint64_t borderConfiguration = v6;

      uint64_t borderConfiguration = [(MPUBorderedImageStackItemView *)self _updateBorderImageView];
      id v4 = v8;
    }
  }

  MEMORY[0x270F9A758](borderConfiguration, v4);
}

- (void)setBorderDrawingCache:(id)a3
{
  uint64_t v5 = (MPUBorderDrawingCache *)a3;
  p_borderDrawingCache = &self->_borderDrawingCache;
  if (self->_borderDrawingCache != v5)
  {
    v9 = v5;
    CGRect v7 = [MEMORY[0x263F08A00] defaultCenter];
    CGRect v8 = v7;
    if (*p_borderDrawingCache) {
      objc_msgSend(v7, "removeObserver:name:object:", self, @"MPUBorderDrawingCacheDidInvalidateNotification");
    }
    objc_storeStrong((id *)&self->_borderDrawingCache, a3);
    if (*p_borderDrawingCache) {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__borderDrawingCacheWasInvalidated_, @"MPUBorderDrawingCacheDidInvalidateNotification");
    }
    [(MPUBorderedImageStackItemView *)self _updateBorderImageView];

    uint64_t v5 = v9;
  }
}

- (void)_updateBorderImageView
{
  if (self->_borderConfiguration)
  {
    -[MPUBorderDrawingCache imageForBorderConfiguration:](self->_borderDrawingCache, "imageForBorderConfiguration:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  id v3 = [(UIImageView *)self->_borderImageView image];

  id v4 = v5;
  if (v3 != v5)
  {
    [(UIImageView *)self->_borderImageView setImage:v5];
    id v4 = v5;
  }
}

- (MPUBorderConfiguration)borderConfiguration
{
  return self->_borderConfiguration;
}

- (MPUBorderDrawingCache)borderDrawingCache
{
  return self->_borderDrawingCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderDrawingCache, 0);
  objc_storeStrong((id *)&self->_borderConfiguration, 0);

  objc_storeStrong((id *)&self->_borderImageView, 0);
}

@end