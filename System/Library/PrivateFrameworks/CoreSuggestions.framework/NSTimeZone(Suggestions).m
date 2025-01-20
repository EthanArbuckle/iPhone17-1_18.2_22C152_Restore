@interface NSTimeZone(Suggestions)
+ (id)timeZoneForAddress:()Suggestions;
@end

@implementation NSTimeZone(Suggestions)

+ (id)timeZoneForAddress:()Suggestions
{
  return +[SGTimeZone timeZoneForAddress:](SGTimeZone, "timeZoneForAddress:");
}

@end