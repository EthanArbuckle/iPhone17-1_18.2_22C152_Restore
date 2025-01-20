@interface INRecurrenceRule(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation INRecurrenceRule(CMSCoding)

- (id)cmsCoded
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"interval";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "interval"));
  v6[1] = @"frequency";
  v7[0] = v2;
  v3 = INRecurrenceFrequencyToString([a1 frequency]);
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 cmsUnsignedForKey:@"interval" withDefault:1];
    v6 = [v4 cmsOptionalStringForKey:@"frequency"];
    uint64_t v7 = INRecurrenceFrequencyFromString(v6);

    v8 = (void *)[objc_alloc(MEMORY[0x263F0FDA0]) initWithInterval:v5 frequency:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end