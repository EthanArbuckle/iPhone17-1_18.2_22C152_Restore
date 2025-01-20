@interface NWURLSessionDataTask
- (BOOL)isKindOfClass:(Class)a3;
- (void)joiningContext;
@end

@implementation NWURLSessionDataTask

- (void)joiningContext
{
  if (self) {
    return (void *)*((void *)self + 50);
  }
  return self;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionDataTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end