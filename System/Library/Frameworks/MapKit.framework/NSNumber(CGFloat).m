@interface NSNumber(CGFloat)
+ (uint64_t)numberWithCGFloat:()CGFloat;
@end

@implementation NSNumber(CGFloat)

+ (uint64_t)numberWithCGFloat:()CGFloat
{
  v2 = objc_opt_class();

  return [v2 numberWithDouble:a1];
}

@end