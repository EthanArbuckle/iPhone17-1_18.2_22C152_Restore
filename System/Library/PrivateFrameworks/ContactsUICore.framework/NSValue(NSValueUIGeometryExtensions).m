@interface NSValue(NSValueUIGeometryExtensions)
+ (id)valueWithCGSize:()NSValueUIGeometryExtensions;
@end

@implementation NSValue(NSValueUIGeometryExtensions)

+ (id)valueWithCGSize:()NSValueUIGeometryExtensions
{
  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  v2 = [MEMORY[0x263F08D40] valueWithBytes:v4 objCType:"{CGSize=dd}"];
  return v2;
}

@end