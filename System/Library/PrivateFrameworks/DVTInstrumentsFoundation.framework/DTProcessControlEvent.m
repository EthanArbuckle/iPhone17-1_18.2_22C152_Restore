@interface DTProcessControlEvent
+ (BOOL)supportsSecureCoding;
@end

@implementation DTProcessControlEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end