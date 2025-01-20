@interface NSValue(CAPoint3DAdditions)
+ (uint64_t)valueWithCAPoint3D:()CAPoint3DAdditions;
- (double)CAPoint3DValue;
@end

@implementation NSValue(CAPoint3DAdditions)

- (double)CAPoint3DValue
{
  v2[3] = *MEMORY[0x1E4F143B8];
  memset(v2, 0, 24);
  [a1 getValue:v2 size:24];
  return *(double *)v2;
}

+ (uint64_t)valueWithCAPoint3D:()CAPoint3DAdditions
{
  v5[3] = *MEMORY[0x1E4F143B8];
  *(double *)v5 = a2;
  *(double *)&v5[1] = a3;
  *(double *)&v5[2] = a4;
  return [a1 valueWithBytes:v5 objCType:"{CAPoint3D=ddd}"];
}

@end