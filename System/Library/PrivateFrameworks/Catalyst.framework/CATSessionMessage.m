@interface CATSessionMessage
+ (BOOL)supportsSecureCoding;
@end

@implementation CATSessionMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end