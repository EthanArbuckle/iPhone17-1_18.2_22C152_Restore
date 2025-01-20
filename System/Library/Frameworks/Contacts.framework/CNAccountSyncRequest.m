@interface CNAccountSyncRequest
+ (BOOL)supportsSecureCoding;
@end

@implementation CNAccountSyncRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end