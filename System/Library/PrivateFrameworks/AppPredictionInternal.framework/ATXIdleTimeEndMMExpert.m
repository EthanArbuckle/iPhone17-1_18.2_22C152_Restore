@interface ATXIdleTimeEndMMExpert
+ (Class)supportedAnchorClass;
+ (unsigned)predictionReasonForExpert;
@end

@implementation ATXIdleTimeEndMMExpert

+ (Class)supportedAnchorClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)predictionReasonForExpert
{
  return 8;
}

@end