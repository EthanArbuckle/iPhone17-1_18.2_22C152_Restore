@interface NSCollectionLayoutDimension
+ (NSCollectionLayoutDimension)absoluteDimension:(CGFloat)absoluteDimension;
+ (NSCollectionLayoutDimension)estimatedDimension:(CGFloat)estimatedDimension;
+ (NSCollectionLayoutDimension)fractionalHeightDimension:(CGFloat)fractionalHeight;
+ (NSCollectionLayoutDimension)fractionalWidthDimension:(CGFloat)fractionalWidth;
+ (NSCollectionLayoutDimension)uniformAcrossSiblingsWithEstimate:(CGFloat)estimatedDimension;
+ (id)_dimensionWithDimension:(double)a3 semantic:(int64_t)a4;
- (BOOL)isAbsolute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEstimated;
- (BOOL)isFractionalHeight;
- (BOOL)isFractionalWidth;
- (BOOL)isUniformAcrossSiblings;
- (CGFloat)dimension;
- (NSCollectionLayoutDimension)initWithDimension:(double)a3 semantic:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)semantic;
- (void)setDimension:(double)a3;
- (void)setSemantic:(int64_t)a3;
@end

@implementation NSCollectionLayoutDimension

- (BOOL)isEstimated
{
  return (unint64_t)(self->_semantic - 3) < 2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutDimension *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(NSCollectionLayoutDimension *)self semantic],
          v5 == [(NSCollectionLayoutDimension *)v4 semantic]))
    {
      [(NSCollectionLayoutDimension *)self dimension];
      double v7 = v6;
      [(NSCollectionLayoutDimension *)v4 dimension];
      BOOL v9 = vabdd_f64(v7, v8) <= 0.00001;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (CGFloat)dimension
{
  return self->_dimension;
}

- (int64_t)semantic
{
  return self->_semantic;
}

+ (NSCollectionLayoutDimension)uniformAcrossSiblingsWithEstimate:(CGFloat)estimatedDimension
{
  if (estimatedDimension <= 0.0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"NSCollectionLayoutItem.m", 1830, @"Invalid estimated dimension (%g), must be > 0", *(void *)&estimatedDimension object file lineNumber description];
  }
  double v6 = fabs(estimatedDimension);
  if (v6 >= INFINITY && v6 <= INFINITY)
  {
    double v7 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSCollectionLayoutItem.m", 1831, @"Invalid estimated dimension: %g. The dimension must be a finite value.", *(void *)&estimatedDimension);
  }
  double v8 = (void *)[objc_alloc((Class)a1) initWithDimension:4 semantic:estimatedDimension];
  return (NSCollectionLayoutDimension *)v8;
}

+ (NSCollectionLayoutDimension)fractionalHeightDimension:(CGFloat)fractionalHeight
{
  if (fractionalHeight <= 0.0)
  {
    double v6 = _compLayoutLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20BE1D000, v6, OS_LOG_TYPE_ERROR, "Invalid fractional height dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }
  }
  double v7 = fabs(fractionalHeight);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSCollectionLayoutItem.m", 1809, @"Invalid fractional height: %g. The fraction must be a finite value.", *(void *)&fractionalHeight);
  }
  BOOL v9 = (void *)[objc_alloc((Class)a1) initWithDimension:2 semantic:fractionalHeight];
  return (NSCollectionLayoutDimension *)v9;
}

+ (id)_dimensionWithDimension:(double)a3 semantic:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDimension:a4 semantic:a3];
  return v4;
}

+ (NSCollectionLayoutDimension)absoluteDimension:(CGFloat)absoluteDimension
{
  if (absoluteDimension <= 0.0)
  {
    double v6 = _compLayoutLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20BE1D000, v6, OS_LOG_TYPE_ERROR, "Invalid absolute dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }
  }
  double v7 = fabs(absoluteDimension);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSCollectionLayoutItem.m", 1817, @"Invalid absolute dimension: %g. The dimension must be a finite value.", *(void *)&absoluteDimension);
  }
  BOOL v9 = (void *)[objc_alloc((Class)a1) initWithDimension:0 semantic:absoluteDimension];
  return (NSCollectionLayoutDimension *)v9;
}

+ (NSCollectionLayoutDimension)estimatedDimension:(CGFloat)estimatedDimension
{
  if (estimatedDimension <= 0.0)
  {
    double v6 = _compLayoutLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20BE1D000, v6, OS_LOG_TYPE_ERROR, "Invalid estimated dimension, must be > 0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }
  }
  double v7 = fabs(estimatedDimension);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSCollectionLayoutItem.m", 1825, @"Invalid estimated dimension: %g. The dimension must be a finite value.", *(void *)&estimatedDimension);
  }
  BOOL v9 = (void *)[objc_alloc((Class)a1) initWithDimension:3 semantic:estimatedDimension];
  return (NSCollectionLayoutDimension *)v9;
}

+ (NSCollectionLayoutDimension)fractionalWidthDimension:(CGFloat)fractionalWidth
{
  if (fractionalWidth <= 0.0)
  {
    double v6 = _compLayoutLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20BE1D000, v6, OS_LOG_TYPE_ERROR, "Invalid fractional width dimension, must be > 0.0. NOTE: This will be a hard-assert soon, please update your call site.", buf, 2u);
    }
  }
  double v7 = fabs(fractionalWidth);
  if (v7 >= INFINITY && v7 <= INFINITY)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSCollectionLayoutItem.m", 1801, @"Invalid fractional width: %g. The fraction must be a finite value.", *(void *)&fractionalWidth);
  }
  BOOL v9 = (void *)[objc_alloc((Class)a1) initWithDimension:1 semantic:fractionalWidth];
  return (NSCollectionLayoutDimension *)v9;
}

- (NSCollectionLayoutDimension)initWithDimension:(double)a3 semantic:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSCollectionLayoutDimension;
  result = [(NSCollectionLayoutDimension *)&v7 init];
  if (result)
  {
    result->_dimension = a3;
    result->_semantic = a4;
  }
  return result;
}

- (BOOL)isAbsolute
{
  return self->_semantic == 0;
}

- (BOOL)isFractionalWidth
{
  return self->_semantic == 1;
}

- (BOOL)isFractionalHeight
{
  return self->_semantic == 2;
}

- (BOOL)isUniformAcrossSiblings
{
  return self->_semantic == 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(NSCollectionLayoutDimension *)self dimension];
  double v6 = v5;
  int64_t v7 = [(NSCollectionLayoutDimension *)self semantic];
  return (id)[v4 initWithDimension:v7 semantic:v6];
}

- (void)setDimension:(double)a3
{
  self->_dimension = a3;
}

- (void)setSemantic:(int64_t)a3
{
  self->_semantic = a3;
}

@end