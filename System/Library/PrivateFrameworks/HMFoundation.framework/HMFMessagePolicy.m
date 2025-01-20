@interface HMFMessagePolicy
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HMFMessagePolicy

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

@end