@interface NSNumber
+ (NSNumber)numberWithCGFloat:(double)a3;
@end

@implementation NSNumber

+ (NSNumber)numberWithCGFloat:(double)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGFloat:a3];

  return (NSNumber *)v3;
}

@end