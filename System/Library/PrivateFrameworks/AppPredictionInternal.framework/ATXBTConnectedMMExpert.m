@interface ATXBTConnectedMMExpert
+ (Class)supportedAnchorClass;
+ (unsigned)predictionReasonForExpert;
@end

@implementation ATXBTConnectedMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 4;
}

@end