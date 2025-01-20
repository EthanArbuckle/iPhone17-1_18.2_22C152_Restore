@interface NSValue(EDColor)
+ (id)valueWithColor:()EDColor;
- (double)colorValue;
@end

@implementation NSValue(EDColor)

+ (id)valueWithColor:()EDColor
{
  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  v3 = [MEMORY[0x263F08D40] value:v5 withObjCType:"{EDColor=ddd}"];

  return v3;
}

- (double)colorValue
{
  memset(v2, 0, sizeof(v2));
  [a1 getValue:v2];
  return *(double *)v2;
}

@end