@interface AXTimeTravelDateManager
+ (id)timeTravelDate;
+ (void)setTimeTravelDate:(id)a3;
@end

@implementation AXTimeTravelDateManager

+ (id)timeTravelDate
{
  return (id)__timeTravelDate;
}

+ (void)setTimeTravelDate:(id)a3
{
  __timeTravelDate = (uint64_t)[a3 copy];

  _objc_release_x1();
}

@end