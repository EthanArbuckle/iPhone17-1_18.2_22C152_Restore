@interface NSValue(CCUILayout)
+ (id)ccui_valueWithLayoutPoint:()CCUILayout;
+ (id)ccui_valueWithLayoutSize:()CCUILayout;
+ (uint64_t)ccui_valueWithLayoutRect:()CCUILayout;
- (const)ccui_rectValue;
- (uint64_t)ccui_pointValue;
- (uint64_t)ccui_sizeValue;
@end

@implementation NSValue(CCUILayout)

+ (id)ccui_valueWithLayoutPoint:()CCUILayout
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [MEMORY[0x1E4F29238] value:v6 withObjCType:kCCUILayoutPointObjCType];

  return v4;
}

+ (id)ccui_valueWithLayoutSize:()CCUILayout
{
  v6[0] = a3;
  v6[1] = a4;
  v4 = [MEMORY[0x1E4F29238] value:v6 withObjCType:kCCUILayoutSizeObjCType];

  return v4;
}

+ (uint64_t)ccui_valueWithLayoutRect:()CCUILayout
{
  return [MEMORY[0x1E4F29238] value:a3 withObjCType:kCCUILayoutRectObjCType];
}

- (uint64_t)ccui_pointValue
{
  v5[0] = 0;
  v5[1] = 0;
  id v1 = a1;
  v2 = (const char *)[v1 objCType];
  v3 = (const char *)kCCUILayoutPointObjCType;
  NSUInteger v6 = 0;
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(v2, &sizep, 0);
  NSGetSizeAndAlignment(v3, &v6, 0);
  if (sizep != v6 || strncmp(v2, v3, sizep)) {
    return 0;
  }
  [v1 getValue:v5];
  return v5[0];
}

- (uint64_t)ccui_sizeValue
{
  v5[0] = 0;
  v5[1] = 0;
  id v1 = a1;
  v2 = (const char *)[v1 objCType];
  v3 = (const char *)kCCUILayoutSizeObjCType;
  NSUInteger v6 = 0;
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(v2, &sizep, 0);
  NSGetSizeAndAlignment(v3, &v6, 0);
  if (sizep != v6 || strncmp(v2, v3, sizep)) {
    return 0;
  }
  [v1 getValue:v5];
  return v5[0];
}

- (const)ccui_rectValue
{
  *a2 = 0u;
  a2[1] = 0u;
  id v3 = a1;
  v4 = (const char *)[v3 objCType];
  v5 = (const char *)kCCUILayoutRectObjCType;
  NSUInteger v7 = 0;
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(v4, &sizep, 0);
  result = NSGetSizeAndAlignment(v5, &v7, 0);
  if (sizep == v7)
  {
    result = (const char *)strncmp(v4, v5, sizep);
    if (!result) {
      return (const char *)[v3 getValue:a2];
    }
  }
  return result;
}

@end