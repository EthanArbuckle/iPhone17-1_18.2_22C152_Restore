@interface CaliCalendarPRODID
+ (id)copyString;
@end

@implementation CaliCalendarPRODID

+ (id)copyString
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end