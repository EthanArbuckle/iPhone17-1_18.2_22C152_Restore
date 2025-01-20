@interface CLKDeviceMetrics
+ (id)metricsWithDevice:(id)a3 identitySizeClass:(unint64_t)a4;
- (CGPoint)constantPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5;
- (CGPoint)constantPoint:(CGPoint)a3 withOverrides:(id)a4;
- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8;
- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9;
- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9 avoniaCompact:(CGPoint)a10 avoniaRegular:(CGPoint)a11;
- (CGPoint)scaledPoint:(CGPoint)a3;
- (CGPoint)scaledPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5;
- (CGPoint)scaledPoint:(CGPoint)a3 withOverrides:(id)a4;
- (CGSize)constantSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5;
- (CGSize)constantSize:(CGSize)a3 withOverrides:(id)a4;
- (CGSize)scaledSize:(CGSize)a3;
- (CGSize)scaledSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5;
- (CGSize)scaledSize:(CGSize)a3 withOverrides:(id)a4;
- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8;
- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9;
- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9 avoniaCompact:(CGSize)a10 avoniaRegular:(CGSize)a11;
- (CLKDeviceMetrics)initWithDevice:(id)a3 identitySizeClass:(unint64_t)a4;
- (NSNumber)newestAllowedSizeClass;
- (double)_unroundedScaledValue:(double)a3;
- (double)constantValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5;
- (double)constantValue:(double)a3 withOverrides:(id)a4;
- (double)scaledValue:(double)a3;
- (double)scaledValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5;
- (double)scaledValue:(double)a3 withOverrides:(id)a4;
- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8;
- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9;
- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9 avoniaCompact:(double)a10 avoniaRegular:(double)a11;
- (unint64_t)_effectiveSizeClass;
- (unint64_t)roundingBehavior;
- (void)setNewestAllowedSizeClass:(id)a3;
- (void)setRoundingBehavior:(unint64_t)a3;
- (void)setScale:(double)a3 forSizeClass:(unint64_t)a4;
@end

@implementation CLKDeviceMetrics

+ (id)metricsWithDevice:(id)a3 identitySizeClass:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 identitySizeClass:a4];

  return v7;
}

- (CLKDeviceMetrics)initWithDevice:(id)a3 identitySizeClass:(unint64_t)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLKDeviceMetrics;
  v8 = [(CLKDeviceMetrics *)&v24 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_identitySizeClass = a4;
    v9->_roundingBehavior = 1;
    if (initWithDevice_identitySizeClass__onceToken != -1) {
      dispatch_once(&initWithDevice_identitySizeClass__onceToken, &__block_literal_global_7);
    }
    v10 = (void *)initWithDevice_identitySizeClass____defaultScales;
    if (a4 - 1 > 1)
    {
      v13 = [NSNumber numberWithUnsignedInteger:a4];
      v14 = [v10 objectForKeyedSubscript:v13];
      [v14 doubleValue];
      uint64_t v16 = v15;

      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      scales = v9->_scales;
      v9->_scales = (NSMutableDictionary *)v17;

      v19 = (void *)initWithDevice_identitySizeClass____defaultScales;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke_30;
      v21[3] = &unk_26440E6F0;
      v22 = v9;
      uint64_t v23 = v16;
      [v19 enumerateKeysAndObjectsUsingBlock:v21];
      v12 = (NSMutableDictionary *)v22;
    }
    else
    {
      uint64_t v11 = [(id)initWithDevice_identitySizeClass____defaultScales mutableCopy];
      v12 = v9->_scales;
      v9->_scales = (NSMutableDictionary *)v11;
    }
  }
  return v9;
}

void __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke()
{
  v3[9] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CCDBD10;
  v2[1] = &unk_26CCDBD28;
  v3[0] = &unk_26CCDC398;
  v3[1] = &unk_26CCDC3A8;
  v2[2] = &unk_26CCDBD40;
  v2[3] = &unk_26CCDBD58;
  v3[2] = &unk_26CCDC3A8;
  v3[3] = &unk_26CCDC3B8;
  v2[4] = &unk_26CCDBD70;
  v2[5] = &unk_26CCDBD88;
  v3[4] = &unk_26CCDC3C8;
  v3[5] = &unk_26CCDC3D8;
  v2[6] = &unk_26CCDBDA0;
  v2[7] = &unk_26CCDBDB8;
  v3[6] = &unk_26CCDC3D8;
  v3[7] = &unk_26CCDC3B8;
  v2[8] = &unk_26CCDBDD0;
  v3[8] = &unk_26CCDC3E8;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)initWithDevice_identitySizeClass____defaultScales;
  initWithDevice_identitySizeClass____defaultScales = v0;
}

void __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  id v7 = [NSNumber numberWithDouble:v6 / *(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v7 forKeyedSubscript:v5];
}

- (void)setScale:(double)a3 forSizeClass:(unint64_t)a4
{
  id v8 = [NSNumber numberWithDouble:a3];
  scales = self->_scales;
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)scales setObject:v8 forKeyedSubscript:v7];
}

- (double)_unroundedScaledValue:(double)a3
{
  scales = self->_scales;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  double v6 = [(NSMutableDictionary *)scales objectForKeyedSubscript:v5];
  [v6 doubleValue];
  double v8 = v7 * a3;

  return v8;
}

- (unint64_t)_effectiveSizeClass
{
  if (_effectiveSizeClass_onceToken != -1) {
    dispatch_once(&_effectiveSizeClass_onceToken, &__block_literal_global_33);
  }
  unint64_t v3 = [(CLKDevice *)self->_device sizeClass];
  v4 = [(CLKDeviceMetrics *)self newestAllowedSizeClass];

  if (v4)
  {
    id v5 = [(CLKDeviceMetrics *)self newestAllowedSizeClass];
    unint64_t v6 = [v5 integerValue];

    while (v3 > v6)
    {
      double v7 = (void *)_effectiveSizeClass__fallbacks;
      double v8 = [NSNumber numberWithUnsignedInteger:v3];
      v9 = [v7 objectForKeyedSubscript:v8];

      unint64_t v3 = [v9 integerValue];
    }
  }
  return v3;
}

void __39__CLKDeviceMetrics__effectiveSizeClass__block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CCDBD40;
  v2[1] = &unk_26CCDBD58;
  v3[0] = &unk_26CCDBD10;
  v3[1] = &unk_26CCDBD28;
  v3[2] = &unk_26CCDBD40;
  v3[3] = &unk_26CCDBD58;
  v2[4] = &unk_26CCDBDA0;
  v2[5] = &unk_26CCDBDB8;
  v2[2] = &unk_26CCDBD70;
  v2[3] = &unk_26CCDBD88;
  v3[4] = &unk_26CCDBD88;
  v3[5] = &unk_26CCDBD70;
  v2[6] = &unk_26CCDBDD0;
  v3[6] = &unk_26CCDBDA0;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  v1 = (void *)_effectiveSizeClass__fallbacks;
  _effectiveSizeClass__fallbacks = v0;
}

- (double)scaledValue:(double)a3
{
  [(CLKDeviceMetrics *)self _unroundedScaledValue:a3];
  double v5 = v4;
  unint64_t v6 = [(CLKDeviceMetrics *)self roundingBehavior];
  switch(v6)
  {
    case 1uLL:
      device = self->_device;
      CLKRoundForDevice(device, v5);
      return result;
    case 2uLL:
      CLKRoundForDevice(self->_device, v5 * 0.5);
      return v11 + v11;
    case 3uLL:
      CLKRoundForDevice(self->_device, v5 + v5);
      return v12 * 0.5;
    case 4uLL:
      v8.n128_u64[0] = 1.0;
      v7.n128_f64[0] = v5;
      MEMORY[0x270F82EF0](v6, v7, v8);
      return result;
    default:
      return v5;
  }
}

- (double)constantValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5
{
  if ([(CLKDeviceMetrics *)self _effectiveSizeClass] == a5) {
    return a4;
  }
  else {
    return a3;
  }
}

- (double)scaledValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5
{
  if ([(CLKDeviceMetrics *)self _effectiveSizeClass] == a5) {
    return a4;
  }

  [(CLKDeviceMetrics *)self scaledValue:a3];
  return result;
}

- (double)constantValue:(double)a3 withOverrides:(id)a4
{
  unint64_t v6 = NSNumber;
  id v7 = a4;
  __n128 v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [v9 doubleValue];
    a3 = v10;
  }

  return a3;
}

- (double)scaledValue:(double)a3 withOverrides:(id)a4
{
  unint64_t v6 = NSNumber;
  id v7 = a4;
  __n128 v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9) {
    [v9 doubleValue];
  }
  else {
    [(CLKDeviceMetrics *)self scaledValue:a3];
  }
  double v11 = v10;

  return v11;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8
{
  [(CLKDeviceMetrics *)self valueCompact:a3 regular:a4 luxoCompact:a5 luxoRegular:a6 aloeCompact:a7 aloeRegular:a8 agave:a8];
  return result;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9
{
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      return a3;
    case 1uLL:
      a3 = a4;
      break;
    case 2uLL:
      a3 = a5;
      break;
    case 4uLL:
    case 7uLL:
      a3 = a7;
      break;
    case 5uLL:
      a3 = a8;
      break;
    case 6uLL:
    case 8uLL:
      a3 = a9;
      break;
    default:
      a3 = a6;
      break;
  }
  return a3;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9 avoniaCompact:(double)a10 avoniaRegular:(double)a11
{
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      return a3;
    case 1uLL:
      a3 = a4;
      break;
    case 2uLL:
      a3 = a5;
      break;
    case 4uLL:
      a3 = a7;
      break;
    case 5uLL:
      a3 = a8;
      break;
    case 6uLL:
      a3 = a9;
      break;
    case 7uLL:
      a3 = a10;
      break;
    case 8uLL:
      a3 = a11;
      break;
    default:
      a3 = a6;
      break;
  }
  return a3;
}

- (CGPoint)scaledPoint:(CGPoint)a3
{
  double y = a3.y;
  [(CLKDeviceMetrics *)self _unroundedScaledValue:a3.x];
  double v6 = v5;
  [(CLKDeviceMetrics *)self _unroundedScaledValue:y];
  double v8 = v7;
  switch([(CLKDeviceMetrics *)self roundingBehavior])
  {
    case 1uLL:
      CLKPointRoundForDevice(self->_device);
      goto LABEL_6;
    case 2uLL:
      CLKPointRoundForDevice(self->_device);
      double v6 = v11 + v11;
      double v8 = v12 + v12;
      break;
    case 3uLL:
      CLKPointRoundForDevice(self->_device);
      double v6 = v13 * 0.5;
      double v8 = v14 * 0.5;
      break;
    case 4uLL:
      UIPointRoundToScale();
LABEL_6:
      double v6 = v9;
      double v8 = v10;
      break;
    default:
      break;
  }
  double v15 = v6;
  double v16 = v8;
  result.double y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)constantPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  unint64_t v10 = [(CLKDeviceMetrics *)self _effectiveSizeClass];
  if (v10 == a5) {
    double v11 = x;
  }
  else {
    double v11 = v9;
  }
  if (v10 == a5) {
    double v12 = y;
  }
  else {
    double v12 = v8;
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGPoint)scaledPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  if ([(CLKDeviceMetrics *)self _effectiveSizeClass] != a5)
  {
    -[CLKDeviceMetrics scaledPoint:](self, "scaledPoint:", v8, v7);
    CGFloat x = v10;
    CGFloat y = v11;
  }
  double v12 = x;
  double v13 = y;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (CGPoint)constantPoint:(CGPoint)a3 withOverrides:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = NSNumber;
  id v8 = a4;
  double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  double v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    [v10 CGPointValue];
    CGFloat x = v11;
    CGFloat y = v12;
  }

  double v13 = x;
  double v14 = y;
  result.CGFloat y = v14;
  result.CGFloat x = v13;
  return result;
}

- (CGPoint)scaledPoint:(CGPoint)a3 withOverrides:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = NSNumber;
  id v8 = a4;
  double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  double v10 = [v8 objectForKeyedSubscript:v9];

  if (v10) {
    [v10 CGPointValue];
  }
  else {
    -[CLKDeviceMetrics scaledPoint:](self, "scaledPoint:", x, y);
  }
  double v13 = v11;
  double v14 = v12;

  double v15 = v13;
  double v16 = v14;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8
{
  -[CLKDeviceMetrics pointCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:](self, "pointCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:", *(void *)&a7.x, *(void *)&a7.y, *(void *)&a8.x, *(void *)&a8.y, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, v10, v11, v12, v13, v12,
    v13);
  result.double y = v9;
  result.double x = v8;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v11 = a5.y;
  CGFloat v12 = a5.x;
  CGFloat v13 = a4.y;
  CGFloat v14 = a4.x;
  CGFloat v15 = a3.y;
  CGFloat v16 = a3.x;
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      break;
    case 1uLL:
      CGFloat v16 = v14;
      CGFloat v15 = v13;
      break;
    case 2uLL:
      CGFloat v16 = v12;
      CGFloat v15 = v11;
      break;
    case 4uLL:
    case 7uLL:
      CGFloat v16 = v19;
      CGFloat v15 = v20;
      break;
    case 5uLL:
      CGFloat v16 = v21;
      CGFloat v15 = v22;
      break;
    case 6uLL:
    case 8uLL:
      CGFloat v16 = v23;
      CGFloat v15 = v24;
      break;
    default:
      CGFloat v16 = x;
      CGFloat v15 = y;
      break;
  }
  double v17 = v16;
  double v18 = v15;
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9 avoniaCompact:(CGPoint)a10 avoniaRegular:(CGPoint)a11
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v13 = a5.y;
  CGFloat v14 = a5.x;
  CGFloat v15 = a4.y;
  CGFloat v16 = a4.x;
  CGFloat v17 = a3.y;
  CGFloat v18 = a3.x;
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      break;
    case 1uLL:
      CGFloat v18 = v16;
      CGFloat v17 = v15;
      break;
    case 2uLL:
      CGFloat v18 = v14;
      CGFloat v17 = v13;
      break;
    case 4uLL:
      CGFloat v18 = a10.x;
      CGFloat v17 = a10.y;
      break;
    case 5uLL:
      CGFloat v18 = a11.x;
      CGFloat v17 = a11.y;
      break;
    case 6uLL:
      CGFloat v18 = v21;
      CGFloat v17 = v22;
      break;
    case 7uLL:
      CGFloat v18 = v23;
      CGFloat v17 = v24;
      break;
    case 8uLL:
      CGFloat v18 = v25;
      CGFloat v17 = v26;
      break;
    default:
      CGFloat v18 = x;
      CGFloat v17 = y;
      break;
  }
  double v19 = v18;
  double v20 = v17;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3
{
  double height = a3.height;
  [(CLKDeviceMetrics *)self _unroundedScaledValue:a3.width];
  double v6 = v5;
  [(CLKDeviceMetrics *)self _unroundedScaledValue:height];
  double v8 = v7;
  switch([(CLKDeviceMetrics *)self roundingBehavior])
  {
    case 1uLL:
      CLKSizeRoundForDevice(self->_device);
      goto LABEL_6;
    case 2uLL:
      CLKSizeRoundForDevice(self->_device);
      double v6 = v11 + v11;
      double v8 = v12 + v12;
      break;
    case 3uLL:
      CLKSizeRoundForDevice(self->_device);
      double v6 = v13 * 0.5;
      double v8 = v14 * 0.5;
      break;
    case 4uLL:
      UISizeRoundToScale();
LABEL_6:
      double v6 = v9;
      double v8 = v10;
      break;
    default:
      break;
  }
  double v15 = v6;
  double v16 = v8;
  result.double height = v16;
  result.width = v15;
  return result;
}

- (CGSize)constantSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  unint64_t v10 = [(CLKDeviceMetrics *)self _effectiveSizeClass];
  if (v10 == a5) {
    double v11 = width;
  }
  else {
    double v11 = v9;
  }
  if (v10 == a5) {
    double v12 = height;
  }
  else {
    double v12 = v8;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  if ([(CLKDeviceMetrics *)self _effectiveSizeClass] != a5)
  {
    -[CLKDeviceMetrics scaledSize:](self, "scaledSize:", v8, v7);
    CGFloat width = v10;
    CGFloat height = v11;
  }
  double v12 = width;
  double v13 = height;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)constantSize:(CGSize)a3 withOverrides:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v7 = NSNumber;
  id v8 = a4;
  double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  double v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    [v10 CGSizeValue];
    CGFloat width = v11;
    CGFloat height = v12;
  }

  double v13 = width;
  double v14 = height;
  result.CGFloat height = v14;
  result.CGFloat width = v13;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3 withOverrides:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = NSNumber;
  id v8 = a4;
  double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  double v10 = [v8 objectForKeyedSubscript:v9];

  if (v10) {
    [v10 CGSizeValue];
  }
  else {
    -[CLKDeviceMetrics scaledSize:](self, "scaledSize:", width, height);
  }
  double v13 = v11;
  double v14 = v12;

  double v15 = v13;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8
{
  -[CLKDeviceMetrics sizeCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:](self, "sizeCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:", *(void *)&a7.width, *(void *)&a7.height, *(void *)&a8.width, *(void *)&a8.height, a3.width, a3.height, a4.width, a4.height, a5.width, a5.height, a6.width, a6.height, v10, v11, v12, v13, v12,
    v13);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v11 = a5.height;
  CGFloat v12 = a5.width;
  CGFloat v13 = a4.height;
  CGFloat v14 = a4.width;
  CGFloat v15 = a3.height;
  CGFloat v16 = a3.width;
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      break;
    case 1uLL:
      CGFloat v16 = v14;
      CGFloat v15 = v13;
      break;
    case 2uLL:
      CGFloat v16 = v12;
      CGFloat v15 = v11;
      break;
    case 4uLL:
    case 7uLL:
      CGFloat v16 = v19;
      CGFloat v15 = v20;
      break;
    case 5uLL:
      CGFloat v16 = v21;
      CGFloat v15 = v22;
      break;
    case 6uLL:
    case 8uLL:
      CGFloat v16 = v23;
      CGFloat v15 = v24;
      break;
    default:
      CGFloat v16 = width;
      CGFloat v15 = height;
      break;
  }
  double v17 = v16;
  double v18 = v15;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9 avoniaCompact:(CGSize)a10 avoniaRegular:(CGSize)a11
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v13 = a5.height;
  CGFloat v14 = a5.width;
  CGFloat v15 = a4.height;
  CGFloat v16 = a4.width;
  CGFloat v17 = a3.height;
  CGFloat v18 = a3.width;
  switch([(CLKDeviceMetrics *)self _effectiveSizeClass])
  {
    case 0uLL:
      break;
    case 1uLL:
      CGFloat v18 = v16;
      CGFloat v17 = v15;
      break;
    case 2uLL:
      CGFloat v18 = v14;
      CGFloat v17 = v13;
      break;
    case 4uLL:
      CGFloat v18 = a10.width;
      CGFloat v17 = a10.height;
      break;
    case 5uLL:
      CGFloat v18 = a11.width;
      CGFloat v17 = a11.height;
      break;
    case 6uLL:
      CGFloat v18 = v21;
      CGFloat v17 = v22;
      break;
    case 7uLL:
      CGFloat v18 = v23;
      CGFloat v17 = v24;
      break;
    case 8uLL:
      CGFloat v18 = v25;
      CGFloat v17 = v26;
      break;
    default:
      CGFloat v18 = width;
      CGFloat v17 = height;
      break;
  }
  double v19 = v18;
  double v20 = v17;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (unint64_t)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(unint64_t)a3
{
  self->_roundingBehavior = a3;
}

- (NSNumber)newestAllowedSizeClass
{
  return self->_newestAllowedSizeClass;
}

- (void)setNewestAllowedSizeClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newestAllowedSizeClass, 0);
  objc_storeStrong((id *)&self->_scales, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end