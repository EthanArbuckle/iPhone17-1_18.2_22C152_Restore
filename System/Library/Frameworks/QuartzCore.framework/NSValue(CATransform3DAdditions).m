@interface NSValue(CATransform3DAdditions)
+ (uint64_t)valueWithCATransform3D:()CATransform3DAdditions;
- (const)CATransform3DValue;
@end

@implementation NSValue(CATransform3DAdditions)

+ (uint64_t)valueWithCATransform3D:()CATransform3DAdditions
{
  return [a1 valueWithBytes:a3 objCType:"{CATransform3D=dddddddddddddddd}"];
}

- (const)CATransform3DValue
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  result = NSGetSizeAndAlignment((const char *)[a1 objCType], v5, 0);
  if (v5[0] > 0x7F)
  {
    *(_OWORD *)&a2->m41 = 0u;
    *(_OWORD *)&a2->m43 = 0u;
    *(_OWORD *)&a2->m31 = 0u;
    *(_OWORD *)&a2->m33 = 0u;
    *(_OWORD *)&a2->m21 = 0u;
    *(_OWORD *)&a2->m23 = 0u;
    *(_OWORD *)&a2->m11 = 0u;
    *(_OWORD *)&a2->m13 = 0u;
    return (const char *)[a1 getValue:a2 size:128];
  }
  else
  {
    *a2 = CATransform3DIdentity;
  }
  return result;
}

@end