@interface HKStateSyncRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)description;
@end

@implementation HKStateSyncRequest

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p", objc_opt_class(), self];
}

@end