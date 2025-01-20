@interface EMUnsubscribeAction
+ (BOOL)supportsSecureCoding;
- (int64_t)signpostType;
@end

@implementation EMUnsubscribeAction

- (int64_t)signpostType
{
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end