@interface NSDate(RPExtensions)
+ (id)_srGetStringFromDate:()RPExtensions;
@end

@implementation NSDate(RPExtensions)

+ (id)_srGetStringFromDate:()RPExtensions
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setLocalizedDateFormatFromTemplate:@"MMMM d hh:mm a"];
  v6 = [MEMORY[0x263EFFA18] timeZoneWithName:@"..."];
  [v5 setTimeZone:v6];

  v7 = [v5 stringFromDate:v4];

  return v7;
}

@end