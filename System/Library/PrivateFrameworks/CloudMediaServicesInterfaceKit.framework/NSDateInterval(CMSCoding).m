@interface NSDateInterval(CMSCoding)
+ (id)instanceFromCMSCoded:()CMSCoding;
- (id)cmsCoded;
@end

@implementation NSDateInterval(CMSCoding)

- (id)cmsCoded
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"startDate";
  v2 = [a1 startDate];
  uint64_t v3 = [v2 cmsCoded];
  v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_26DE5AB78;
  }
  v12[1] = @"endDate";
  v13[0] = v5;
  v6 = [a1 endDate];
  uint64_t v7 = [v6 cmsCoded];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_26DE5AB78;
  }
  v13[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

+ (id)instanceFromCMSCoded:()CMSCoding
{
  uint64_t v3 = cmsSafeDictionary(a3);
  v4 = v3;
  if (v3)
  {
    v5 = [v3 cmsOptionalDateForKey:@"startDate"];
    uint64_t v6 = [v4 cmsOptionalDateForKey:@"endDate"];
    uint64_t v7 = (void *)v6;
    v8 = 0;
    if (v5 && v6) {
      v8 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v6];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end