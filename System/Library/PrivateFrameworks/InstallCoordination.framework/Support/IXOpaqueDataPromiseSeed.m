@interface IXOpaqueDataPromiseSeed
+ (BOOL)supportsSecureCoding;
- (IXOpaqueDataPromiseSeed)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXOpaqueDataPromiseSeed

- (IXOpaqueDataPromiseSeed)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXOpaqueDataPromiseSeed;
  return [(IXDataPromiseSeed *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXOpaqueDataPromiseSeed;
  [(IXDataPromiseSeed *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXOpaqueDataPromiseSeed;
  return [(IXDataPromiseSeed *)&v4 copyWithZone:a3];
}

@end