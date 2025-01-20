@interface CLLocationContextUtil
+ (BOOL)isIndoor:(int64_t)a3;
+ (BOOL)isRegional:(int64_t)a3;
@end

@implementation CLLocationContextUtil

+ (BOOL)isRegional:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)isIndoor:(int64_t)a3
{
  return a3 == 0;
}

@end