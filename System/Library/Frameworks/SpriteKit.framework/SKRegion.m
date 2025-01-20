@interface SKRegion
+ (BOOL)supportsSecureCoding;
+ (SKRegion)infiniteRegion;
- (BOOL)containsPoint:(CGPoint)point;
- (BOOL)isEmpty;
- (BOOL)isEqualToRegion:(id)a3;
- (BOOL)isInfinite;
- (CGPathRef)path;
- (SKRegion)initWithCoder:(id)a3;
- (SKRegion)initWithPath:(CGPathRef)path;
- (SKRegion)initWithRadius:(float)radius;
- (SKRegion)initWithSize:(CGSize)size;
- (SKRegion)inverseRegion;
- (SKRegion)regionByDifferenceFromRegion:(SKRegion *)region;
- (SKRegion)regionByIntersectionWithRegion:(SKRegion *)region;
- (SKRegion)regionByUnionWithRegion:(SKRegion *)region;
- (id)copyWithZone:(_NSZone *)a3;
- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPathRef)path
{
  return (CGPathRef)[(PKRegion *)self->_region path];
}

+ (SKRegion)infiniteRegion
{
  v2 = (void *)sharedInfiniteRegion;
  if (!sharedInfiniteRegion)
  {
    v3 = objc_alloc_init(SKRegion);
    v4 = (void *)sharedInfiniteRegion;
    sharedInfiniteRegion = (uint64_t)v3;

    uint64_t v5 = [MEMORY[0x263F5E598] infiniteRegion];
    v6 = *(void **)(sharedInfiniteRegion + 8);
    *(void *)(sharedInfiniteRegion + 8) = v5;

    v2 = (void *)sharedInfiniteRegion;
  }

  return (SKRegion *)v2;
}

- (SKRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKRegion;
  uint64_t v5 = [(SKRegion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_region"];
    region = v5->_region;
    v5->_region = (PKRegion *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  region = self->_region;
  if (region) {
    [v5 encodeObject:region forKey:@"_region"];
  }
}

- (BOOL)isEqualToRegion:(id)a3
{
  region = self->_region;
  if (region == *((PKRegion **)a3 + 1)) {
    return 1;
  }
  else {
    return -[PKRegion isEqualToRegion:](region, "isEqualToRegion:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_region);
  return v4;
}

- (SKRegion)initWithRadius:(float)radius
{
  v10.receiver = self;
  v10.super_class = (Class)SKRegion;
  id v4 = [(SKRegion *)&v10 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F5E598]);
    *(float *)&double v6 = radius;
    uint64_t v7 = [v5 initWithRadius:v6];
    region = v4->_region;
    v4->_region = (PKRegion *)v7;
  }
  return v4;
}

- (SKRegion)initWithSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v9.receiver = self;
  v9.super_class = (Class)SKRegion;
  id v5 = [(SKRegion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263F5E598]), "initWithSize:", width, height);
    region = v5->_region;
    v5->_region = (PKRegion *)v6;
  }
  return v5;
}

- (SKRegion)initWithPath:(CGPathRef)path
{
  v8.receiver = self;
  v8.super_class = (Class)SKRegion;
  id v4 = [(SKRegion *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F5E598]) initWithPath:path];
    region = v4->_region;
    v4->_region = (PKRegion *)v5;
  }
  return v4;
}

- (SKRegion)inverseRegion
{
  v2 = (id *)[(SKRegion *)self copy];
  uint64_t v3 = [v2[1] inverseRegion];
  id v4 = v2[1];
  v2[1] = (id)v3;

  return (SKRegion *)v2;
}

- (SKRegion)regionByUnionWithRegion:(SKRegion *)region
{
  id v4 = region;
  uint64_t v5 = (id *)[(SKRegion *)self copy];
  uint64_t v6 = [v5[1] regionByUnionWithRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (SKRegion)regionByDifferenceFromRegion:(SKRegion *)region
{
  id v4 = region;
  uint64_t v5 = (id *)[(SKRegion *)self copy];
  uint64_t v6 = [v5[1] regionByDifferenceFromRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (SKRegion)regionByIntersectionWithRegion:(SKRegion *)region
{
  id v4 = region;
  uint64_t v5 = (id *)[(SKRegion *)self copy];
  uint64_t v6 = [v5[1] regionByIntersectionWithRegion:v4->_region];
  id v7 = v5[1];
  v5[1] = (id)v6;

  return (SKRegion *)v5;
}

- (BOOL)isInfinite
{
  return [(PKRegion *)self->_region isInfinite];
}

- (BOOL)isEmpty
{
  return [(PKRegion *)self->_region isEmpty];
}

- (BOOL)containsPoint:(CGPoint)point
{
  if (!self->_region) {
    return 0;
  }
  double y = point.y;
  double x = point.x;
  PKGet_INV_PTM_RATIO();
  double v7 = v6;
  double v8 = x * v6;
  double v9 = y * v7;
  region = self->_region;

  return -[PKRegion containsPoint:](region, "containsPoint:", v8, v9);
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  if (a7 >= 1)
  {
    uint64_t v21 = v12;
    uint64_t v22 = v11;
    uint64_t v23 = v10;
    uint64_t v24 = v9;
    uint64_t v25 = v8;
    uint64_t v26 = v7;
    uint64_t v27 = v13;
    uint64_t v28 = v14;
    int v15 = a7;
    v20 = (float *)(a3 + 1);
    do
    {
      *a5 = -[SKRegion containsPoint:](self, "containsPoint:", *(v20 - 1), *v20, v21, v22, v23, v24, v25, v26, v27, v28);
      a5 += a6;
      v20 = (float *)((char *)v20 + a4);
      --v15;
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
}

@end