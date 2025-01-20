@interface DDCreateTimeZoneValuesFromResultValue
@end

@implementation DDCreateTimeZoneValuesFromResultValue

CFStringRef __DDCreateTimeZoneValuesFromResultValue_block_invoke()
{
  CFStringRef result = createPropertyListForResource(@"TimeZones");
  DDCreateTimeZoneValuesFromResultValue__sTimeZonesPlist = (uint64_t)result;
  return result;
}

@end