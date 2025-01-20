@interface NSDate(CDMJSONSerialization)
- (id)_cdm_safeJSONString;
@end

@implementation NSDate(CDMJSONSerialization)

- (id)_cdm_safeJSONString
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
  v3 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v2 setTimeZone:v3];

  v4 = [v2 stringFromDate:a1];

  return v4;
}

@end