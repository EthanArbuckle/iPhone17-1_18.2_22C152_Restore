@interface SCNMTLComputePipeline
- (SCNMTLComputePipeline)init;
- (id)description;
- (void)dealloc;
- (void)setComputeFunction:(void *)a1;
- (void)setState:(void *)a1;
@end

@implementation SCNMTLComputePipeline

- (void)setState:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 8);
  }
}

- (void)setComputeFunction:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic(a1, newValue, newValue, 16);
  }
}

- (SCNMTLComputePipeline)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLComputePipeline;
  return [(SCNMTLComputePipeline *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLComputePipeline;
  [(SCNMTLComputePipeline *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

@end