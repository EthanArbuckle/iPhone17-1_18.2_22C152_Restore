@interface CIGenericMetalProcessorSingleChannel
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIGenericMetalProcessorSingleChannel

+ (int)outputFormat
{
  return 2053;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 2053;
}

@end