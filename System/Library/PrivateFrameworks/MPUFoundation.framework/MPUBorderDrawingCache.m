@interface MPUBorderDrawingCache
- (MPUBorderDrawingCache)init;
- (double)displayScale;
- (id)_borderView;
- (id)imageForBorderConfiguration:(id)a3;
- (void)_applicationDidReceiveMemoryWarning:(id)a3;
- (void)_invalidate;
- (void)dealloc;
- (void)setDisplayScale:(double)a3;
@end

@implementation MPUBorderDrawingCache

- (MPUBorderDrawingCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)MPUBorderDrawingCache;
  v2 = [(MPUBorderDrawingCache *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C920] mainScreen];
    [v3 scale];
    v2->_displayScale = v4;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    images = v2->_images;
    v2->_images = v5;

    [(NSCache *)v2->_images setTotalCostLimit:20971520];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *MEMORY[0x263F1D060];
    v9 = [MEMORY[0x263F1C408] sharedApplication];
    [v7 addObserver:v2 selector:sel__applicationDidReceiveMemoryWarning_ name:v8 object:v9];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F1D060];
  v5 = [MEMORY[0x263F1C408] sharedApplication];
  [v3 removeObserver:self name:v4 object:v5];

  v6.receiver = self;
  v6.super_class = (Class)MPUBorderDrawingCache;
  [(MPUBorderDrawingCache *)&v6 dealloc];
}

- (void)setDisplayScale:(double)a3
{
  double SafeScaleForValue = MPUFloatGetSafeScaleForValue(a3);
  if (!MPUFloatEqualToFloat(self->_displayScale, SafeScaleForValue))
  {
    self->_displayScale = SafeScaleForValue;
    [(MPUBorderDrawingCache *)self _invalidate];
  }
}

- (id)imageForBorderConfiguration:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ([v4 isFullyTransparent] & 1) != 0) {
    goto LABEL_3;
  }
  objc_super v6 = [(NSCache *)self->_images objectForKey:v5];
  if (!v6)
  {
    if (!MPUFloatGreaterThanOrEqualToFloat(self->_displayScale, 0.0))
    {
LABEL_3:
      objc_super v6 = 0;
      goto LABEL_9;
    }
    v7 = [(MPUBorderDrawingCache *)self _borderView];
    [v7 setBorderConfiguration:v5];
    objc_msgSend(v7, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v9 = v8;
    double v11 = v10;
    double v12 = *MEMORY[0x263F001A8];
    double v13 = *(double *)(MEMORY[0x263F001A8] + 8);
    objc_msgSend(v7, "setBounds:", *MEMORY[0x263F001A8], v13, v8, v10);
    v20.width = v9;
    v20.height = v11;
    UIGraphicsBeginImageContextWithOptions(v20, 0, self->_displayScale);
    objc_msgSend(v7, "drawRect:", v12, v13, v9, v11);
    v14 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [v7 resizableImageCapInsets];
    objc_super v6 = objc_msgSend(v14, "resizableImageWithCapInsets:");
    if (v6)
    {
      unint64_t v15 = llround(v9 * self->_displayScale * (v11 * self->_displayScale));
      images = self->_images;
      v17 = (void *)[v5 copy];
      [(NSCache *)images setObject:v6 forKey:v17 cost:v15];
    }
  }
LABEL_9:

  return v6;
}

- (void)_applicationDidReceiveMemoryWarning:(id)a3
{
  self->_borderView = 0;
  MEMORY[0x270F9A758]();
}

- (id)_borderView
{
  borderView = self->_borderView;
  if (!borderView)
  {
    id v4 = objc_alloc_init(MPUBorderView);
    v5 = self->_borderView;
    self->_borderView = v4;

    borderView = self->_borderView;
  }

  return borderView;
}

- (void)_invalidate
{
  [(NSCache *)self->_images removeAllObjects];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"MPUBorderDrawingCacheDidInvalidateNotification" object:self];
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);

  objc_storeStrong((id *)&self->_borderView, 0);
}

@end