@interface AVCacheLargestInscribedRectInBoundingPath
- (AVCacheLargestInscribedRectInBoundingPath)init;
- (CGRect)getLargestInscribableRectForView:(id)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5;
- (NSCache)cache;
- (id)retrieveCacheForCenter:(CGPoint)a3 aspectRatio:(double)a4;
- (void)clearCache;
- (void)saveCacheFor:(CGPoint)a3 aspectRatio:(double)a4 value:(CGRect)a5;
- (void)setCache:(id)a3;
@end

@implementation AVCacheLargestInscribedRectInBoundingPath

- (AVCacheLargestInscribedRectInBoundingPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVCacheLargestInscribedRectInBoundingPath;
  v2 = [(AVCacheLargestInscribedRectInBoundingPath *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    cache = v2->_cache;
    v2->_cache = v3;

    [(NSCache *)v2->_cache setCountLimit:10];
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setCache:(id)a3
{
}

- (NSCache)cache
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (CGRect)getLargestInscribableRectForView:(id)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = -[AVCacheLargestInscribedRectInBoundingPath retrieveCacheForCenter:aspectRatio:](self, "retrieveCacheForCenter:aspectRatio:", x, y, a5);
  v11 = v10;
  if (v10)
  {
    [v10 largestInscribedRect];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    objc_msgSend(v9, "avkit_largestInscribedRectInBoundingPathWithCenter:aspectRatio:", x, y, a5);
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
    -[AVCacheLargestInscribedRectInBoundingPath saveCacheFor:aspectRatio:value:](self, "saveCacheFor:aspectRatio:value:", x, y, a5, v20, v21, v22, v23);
  }

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)clearCache
{
}

- (void)saveCacheFor:(CGPoint)a3 aspectRatio:(double)a4 value:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v10 = -[AVCacheLargestInscribedRectInBoundingPathKey initWithCenter:aspectRatio:]([AVCacheLargestInscribedRectInBoundingPathKey alloc], "initWithCenter:aspectRatio:", a3.x, a3.y, a4);
  v11 = -[AVCacheLargestInscribedRectInBoundingPathValue initWithLargestInscribedRect:]([AVCacheLargestInscribedRectInBoundingPathValue alloc], "initWithLargestInscribedRect:", x, y, width, height);
  if ([(NSCache *)self->_cache countLimit] == 10)
  {
    double v12 = _AVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "AVCacheLargestInscribedRectInBoundingPath: attempting to save cache while full", v13, 2u);
    }
  }
  [(NSCache *)self->_cache setObject:v11 forKey:v10];
}

- (id)retrieveCacheForCenter:(CGPoint)a3 aspectRatio:(double)a4
{
  v5 = -[AVCacheLargestInscribedRectInBoundingPathKey initWithCenter:aspectRatio:]([AVCacheLargestInscribedRectInBoundingPathKey alloc], "initWithCenter:aspectRatio:", a3.x, a3.y, a4);
  objc_super v6 = [(NSCache *)self->_cache objectForKey:v5];

  return v6;
}

@end