@interface _DKPeriodMetadataKey
+ (id)periodEnd;
+ (id)periodStart;
@end

@implementation _DKPeriodMetadataKey

+ (id)periodStart
{
  return @"_DKPeriodMetadataKey-periodStart";
}

+ (id)periodEnd
{
  return @"_DKPeriodMetadataKey-periodEnd";
}

@end