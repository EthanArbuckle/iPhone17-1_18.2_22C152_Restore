@interface ATXCarPlayDisconnectedMMExpert
+ (Class)supportedAnchorClass;
+ (unsigned)predictionReasonForExpert;
@end

@implementation ATXCarPlayDisconnectedMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 512;
}

@end