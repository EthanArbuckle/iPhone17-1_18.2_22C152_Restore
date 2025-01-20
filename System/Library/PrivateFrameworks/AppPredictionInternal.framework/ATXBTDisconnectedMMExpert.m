@interface ATXBTDisconnectedMMExpert
+ (Class)supportedAnchorClass;
+ (unsigned)predictionReasonForExpert;
@end

@implementation ATXBTDisconnectedMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 512;
}

@end