@interface ATXCarPlayConnectedMMExpert
+ (Class)supportedAnchorClass;
+ (unsigned)predictionReasonForExpert;
@end

@implementation ATXCarPlayConnectedMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 128;
}

@end