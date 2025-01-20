@interface AMSRandomNumberGenerator
+ (void)initialize;
+ (void)reSeedNormalizedRandomDoubleGeneratorWithValue:(int64_t)a3;
@end

@implementation AMSRandomNumberGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = arc4random();
    srand48(v2);
  }
}

+ (void)reSeedNormalizedRandomDoubleGeneratorWithValue:(int64_t)a3
{
}

@end