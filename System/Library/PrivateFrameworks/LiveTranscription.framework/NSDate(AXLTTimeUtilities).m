@interface NSDate(AXLTTimeUtilities)
+ (__CFString)timeAgoSinceDateString:()AXLTTimeUtilities;
+ (double)timeDifferenceDateStringOld:()AXLTTimeUtilities dateStringNew:;
+ (id)dateToString:()AXLTTimeUtilities;
+ (id)stringToDate:()AXLTTimeUtilities;
+ (id)timeAgoSinceDate:()AXLTTimeUtilities currentDate:;
@end

@implementation NSDate(AXLTTimeUtilities)

+ (id)dateToString:()AXLTTimeUtilities
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (id)stringToDate:()AXLTTimeUtilities
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
  v6 = [v5 dateFromString:v4];

  return v6;
}

+ (__CFString)timeAgoSinceDateString:()AXLTTimeUtilities
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [MEMORY[0x263EFF910] stringToDate:v3];
    id v5 = (void *)MEMORY[0x263EFF910];
    v6 = [MEMORY[0x263EFF910] date];
    v7 = [v5 timeAgoSinceDate:v4 currentDate:v6];
  }
  else
  {
    v7 = &stru_26EFE42D0;
  }

  return v7;
}

+ (id)timeAgoSinceDate:()AXLTTimeUtilities currentDate:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    [v6 timeIntervalSinceDate:v5];
    if (v8 >= 60.0)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F08AF8]);
      v9 = [v10 localizedStringForDate:v5 relativeToDate:v7];
    }
    else
    {
      v9 = AXLCLocString(@"liveCaptions.just_now");
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (double)timeDifferenceDateStringOld:()AXLTTimeUtilities dateStringNew:
{
  id v5 = (void *)MEMORY[0x263EFF910];
  id v6 = a4;
  v7 = [v5 stringToDate:a3];
  double v8 = [MEMORY[0x263EFF910] stringToDate:v6];

  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  return v10;
}

@end