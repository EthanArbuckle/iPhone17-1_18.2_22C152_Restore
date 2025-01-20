@interface NSObject(BSXPCSecureCoding)
+ (uint64_t)supportsBSXPCSecureCoding;
- (uint64_t)supportsBSXPCSecureCoding;
@end

@implementation NSObject(BSXPCSecureCoding)

+ (uint64_t)supportsBSXPCSecureCoding
{
  return 0;
}

- (uint64_t)supportsBSXPCSecureCoding
{
  v0 = objc_opt_class();
  return [v0 supportsBSXPCSecureCoding];
}

@end