@interface EMMessageDeleteAction
+ (BOOL)supportsSecureCoding;
- (int64_t)signpostType;
@end

@implementation EMMessageDeleteAction

- (int64_t)signpostType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end