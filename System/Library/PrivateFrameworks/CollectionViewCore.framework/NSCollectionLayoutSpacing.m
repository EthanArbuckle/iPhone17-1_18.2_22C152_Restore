@interface NSCollectionLayoutSpacing
+ (NSCollectionLayoutSpacing)fixedSpacing:(CGFloat)fixedSpacing;
+ (NSCollectionLayoutSpacing)flexibleSpacing:(CGFloat)flexibleSpacing;
+ (id)defaultSpacing;
- (BOOL)_hasSpacing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFixedSpacing;
- (BOOL)isFlexibleSpacing;
- (CGFloat)spacing;
- (NSCollectionLayoutSpacing)initWithSpacing:(double)a3 isFlexible:(BOOL)a4;
- (id)_externalDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation NSCollectionLayoutSpacing

+ (id)defaultSpacing
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSpacing:0 isFlexible:0.0];
  return v2;
}

+ (NSCollectionLayoutSpacing)fixedSpacing:(CGFloat)fixedSpacing
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSpacing:0 isFlexible:fixedSpacing];
  return (NSCollectionLayoutSpacing *)v3;
}

- (NSCollectionLayoutSpacing)initWithSpacing:(double)a3 isFlexible:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSCollectionLayoutSpacing;
  result = [(NSCollectionLayoutSpacing *)&v7 init];
  if (result)
  {
    result->_spacing = a3;
    result->_isFlexible = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(NSCollectionLayoutSpacing *)self spacing];
  double v6 = v5;
  BOOL v7 = [(NSCollectionLayoutSpacing *)self isFlexibleSpacing];
  return (id)[v4 initWithSpacing:v7 isFlexible:v6];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutSpacing *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v5 = [(NSCollectionLayoutSpacing *)self isFlexibleSpacing];
    if (v5 == [(NSCollectionLayoutSpacing *)v4 isFlexibleSpacing])
    {
      [(NSCollectionLayoutSpacing *)self spacing];
      double v8 = v7;
      [(NSCollectionLayoutSpacing *)v4 spacing];
      BOOL v6 = vabdd_f64(v8, v9) <= 0.00001;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isFlexibleSpacing
{
  return self->_isFlexible;
}

- (CGFloat)spacing
{
  return self->_spacing;
}

- (BOOL)_hasSpacing
{
  return self->_isFlexible || self->_spacing > 0.0;
}

- (id)_externalDescription
{
  BOOL isFlexible = self->_isFlexible;
  v3 = NSString;
  uint64_t v4 = [NSNumber numberWithDouble:self->_spacing];
  BOOL v5 = (void *)v4;
  if (isFlexible) {
    BOOL v6 = @".flexible(%@)";
  }
  else {
    BOOL v6 = @".fixed(%@)";
  }
  double v7 = objc_msgSend(v3, "stringWithFormat:", v6, v4);

  return v7;
}

- (id)description
{
  BOOL isFlexible = self->_isFlexible;
  uint64_t v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  uint64_t v7 = [NSNumber numberWithDouble:self->_spacing];
  double v8 = (void *)v7;
  if (isFlexible) {
    double v9 = @"<%@ - %p: flexible:%@>";
  }
  else {
    double v9 = @"<%@ - %p: fixed:%@>";
  }
  v10 = objc_msgSend(v4, "stringWithFormat:", v9, v6, self, v7);

  return v10;
}

+ (NSCollectionLayoutSpacing)flexibleSpacing:(CGFloat)flexibleSpacing
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSpacing:1 isFlexible:flexibleSpacing];
  return (NSCollectionLayoutSpacing *)v3;
}

- (BOOL)isFixedSpacing
{
  return !self->_isFlexible;
}

@end