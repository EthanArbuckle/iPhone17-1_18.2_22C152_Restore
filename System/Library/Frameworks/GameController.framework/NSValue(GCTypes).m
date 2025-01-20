@interface NSValue(GCTypes)
+ (id)valueWithGCPoint2:()GCTypes;
- (float)GCPoint2Value;
@end

@implementation NSValue(GCTypes)

+ (id)valueWithGCPoint2:()GCTypes
{
  *(float *)v5 = a2;
  *(float *)&v5[1] = a3;
  v3 = [a1 valueWithBytes:v5 objCType:"{GCPoint2=ff}"];

  return v3;
}

- (float)GCPoint2Value
{
  uint64_t v2 = 0;
  [a1 getValue:&v2 size:8];
  return *(float *)&v2;
}

@end