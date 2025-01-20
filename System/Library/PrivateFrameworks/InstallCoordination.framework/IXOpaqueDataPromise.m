@interface IXOpaqueDataPromise
+ (BOOL)supportsSecureCoding;
- (Class)seedClass;
- (IXOpaqueDataPromise)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXOpaqueDataPromise

- (IXOpaqueDataPromise)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IXOpaqueDataPromise;
  return [(IXDataPromise *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)IXOpaqueDataPromise;
  [(IXDataPromise *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

@end