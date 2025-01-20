@interface HKMultiGradientFillStyle
- (BOOL)_needsRenderForSize:(CGSize)a3;
- (HKMultiGradientFillStyle)initWithColors:(id)a3;
- (NSArray)colors;
- (NSLock)multiGradientFillStyleLock;
- (UIImage)cachedImageStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fillImageWithHeight:(double)a3;
- (id)fillImageWithWidth:(double)a3;
- (void)_renderCacheIfNecessaryForHeight:(double)a3;
- (void)_renderCacheIfNecessaryForSize:(CGSize)a3;
- (void)_renderCacheIfNecessaryForWidth:(double)a3;
- (void)_renderInContext:(CGContext *)a3 size:(CGSize)a4;
- (void)clearCache;
- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6;
@end

@implementation HKMultiGradientFillStyle

- (HKMultiGradientFillStyle)initWithColors:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKMultiGradientFillStyle;
  v6 = [(HKMultiGradientFillStyle *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_colors, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    multiGradientFillStyleLock = v7->_multiGradientFillStyleLock;
    v7->_multiGradientFillStyleLock = v8;

    [(NSLock *)v7->_multiGradientFillStyleLock setName:@"HKMultiGradientFillStyleLock"];
    cachedImageStorage = v7->_cachedImageStorage;
    v7->_cachedImageStorage = 0;
  }
  return v7;
}

- (void)clearCache
{
  v6.receiver = self;
  v6.super_class = (Class)HKMultiGradientFillStyle;
  [(HKFillStyle *)&v6 clearCache];
  v3 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v3 lock];

  cachedImageStorage = self->_cachedImageStorage;
  self->_cachedImageStorage = 0;

  id v5 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v5 unlock];
}

- (id)fillImageWithHeight:(double)a3
{
  id v5 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v5 lock];

  [(HKMultiGradientFillStyle *)self _renderCacheIfNecessaryForHeight:a3];
  objc_super v6 = self->_cachedImageStorage;
  v7 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v7 unlock];

  return v6;
}

- (id)fillImageWithWidth:(double)a3
{
  id v5 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v5 lock];

  [(HKMultiGradientFillStyle *)self _renderCacheIfNecessaryForWidth:a3];
  objc_super v6 = self->_cachedImageStorage;
  v7 = [(HKMultiGradientFillStyle *)self multiGradientFillStyleLock];
  [v7 unlock];

  return v6;
}

- (void)renderPath:(CGPath *)a3 context:(CGContext *)a4 axisRect:(CGRect)a5 alpha:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGContextSaveGState(a4);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  id v14 = [(HKMultiGradientFillStyle *)self fillImageWithHeight:CGRectGetHeight(v16)];
  CGContextAddPath(a4, a3);
  CGContextClip(a4);
  objc_msgSend(v14, "drawInRect:blendMode:alpha:", 0, x, y, width, height, a6);
  CGContextRestoreGState(a4);
}

- (void)_renderCacheIfNecessaryForHeight:(double)a3
{
}

- (void)_renderCacheIfNecessaryForWidth:(double)a3
{
}

- (void)_renderCacheIfNecessaryForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (-[HKMultiGradientFillStyle _needsRenderForSize:](self, "_needsRenderForSize:"))
  {
    objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", width, height);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__HKMultiGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke;
    v9[3] = &unk_1E6D53D88;
    v9[4] = self;
    *(double *)&v9[5] = width;
    *(double *)&v9[6] = height;
    v7 = [v6 imageWithActions:v9];
    cachedImageStorage = self->_cachedImageStorage;
    self->_cachedImageStorage = v7;
  }
}

uint64_t __59__HKMultiGradientFillStyle__renderCacheIfNecessaryForSize___block_invoke(double *a1, void *a2)
{
  v3 = (void *)*((void *)a1 + 4);
  uint64_t v4 = [a2 CGContext];
  double v5 = a1[5];
  double v6 = a1[6];
  return objc_msgSend(v3, "_renderInContext:size:", v4, v5, v6);
}

- (BOOL)_needsRenderForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  cachedImageStorage = self->_cachedImageStorage;
  [(UIImage *)cachedImageStorage size];
  BOOL v9 = width != v7 || cachedImageStorage == 0;
  return height != v6 || v9;
}

- (void)_renderInContext:(CGContext *)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGContextSaveGState(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  BOOL v9 = [(HKMultiGradientFillStyle *)self colors];
  v10 = (CGFloat *)malloc_type_malloc(8 * (int)[v9 count], 0x100004000313F17uLL);

  CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  objc_super v12 = [(HKMultiGradientFillStyle *)self colors];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__HKMultiGradientFillStyle__renderInContext_size___block_invoke;
  v16[3] = &__block_descriptor_48_e41_v32__0__HKMultiGradientFillColor_8Q16_B24l;
  v16[4] = Mutable;
  v16[5] = v10;
  [v12 enumerateObjectsUsingBlock:v16];

  v13 = CGGradientCreateWithColors(DeviceRGB, Mutable, v10);
  CGFloat v14 = *MEMORY[0x1E4F1DAD8];
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGContextSaveGState(a3);
  v19.origin.double x = 0.0;
  v19.origin.double y = 0.0;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGContextAddRect(a3, v19);
  CGContextClip(a3);
  v18.double x = 0.0;
  v17.double x = v14;
  v17.double y = v15;
  v18.double y = height;
  CGContextDrawLinearGradient(a3, v13, v17, v18, 0);
  CGContextRestoreGState(a3);
  CGGradientRelease(v13);
  CGColorSpaceRelease(DeviceRGB);
  free(v10);
}

void __50__HKMultiGradientFillStyle__renderInContext_size___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(__CFArray **)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 color];
  CFArrayAppendValue(v5, (const void *)[v7 CGColor]);

  id v9 = [v6 location];

  [v9 floatValue];
  *(double *)(*(void *)(a1 + 40) + 8 * a3) = v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKMultiGradientFillStyle;
  uint64_t v4 = [(HKFillStyle *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_colors);
  objc_storeStrong(v4 + 3, self->_cachedImageStorage);
  return v4;
}

- (NSArray)colors
{
  return self->_colors;
}

- (NSLock)multiGradientFillStyleLock
{
  return self->_multiGradientFillStyleLock;
}

- (UIImage)cachedImageStorage
{
  return self->_cachedImageStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedImageStorage, 0);
  objc_storeStrong((id *)&self->_multiGradientFillStyleLock, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end