@interface SKWarpGeometry
+ (BOOL)supportsSecureCoding;
- (BOOL)isIdentityWarp;
- (SKWarpGeometry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SKWarpGeometry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKWarpGeometry)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKWarpGeometry;
  return [(SKWarpGeometry *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SKWarpGeometry);
}

- (BOOL)isIdentityWarp
{
  return 0;
}

@end