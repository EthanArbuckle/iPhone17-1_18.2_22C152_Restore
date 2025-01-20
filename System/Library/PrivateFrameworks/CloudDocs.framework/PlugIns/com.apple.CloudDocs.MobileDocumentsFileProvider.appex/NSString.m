@interface NSString
+ (id)br_stringWithSize:(CGSize)a3;
@end

@implementation NSString

+ (id)br_stringWithSize:(CGSize)a3
{
  return +[NSString stringWithFormat:@"{%.2f, %.2f}", *(void *)&a3.width, *(void *)&a3.height];
}

@end