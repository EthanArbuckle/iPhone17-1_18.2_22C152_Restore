@interface NSValue(JUDirectionalRangeExtensions)
+ (id)valueWithJUDirectionalRange:()JUDirectionalRangeExtensions;
+ (id)valueWithRange:()JUDirectionalRangeExtensions direction:hasMixedDirectionality:;
- (uint64_t)juDirectionalRangeValue;
@end

@implementation NSValue(JUDirectionalRangeExtensions)

+ (id)valueWithJUDirectionalRange:()JUDirectionalRangeExtensions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  long long v6 = *a3;
  uint64_t v3 = *((unsigned __int8 *)a3 + 24);
  uint64_t v7 = *((void *)a3 + 2);
  uint64_t v8 = v3;
  v4 = [a1 value:&v6 withObjCType:"[4q]"];

  return v4;
}

+ (id)valueWithRange:()JUDirectionalRangeExtensions direction:hasMixedDirectionality:
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v8[0] = a3;
  v8[1] = a4;
  v8[2] = a5;
  v8[3] = a6;
  long long v6 = [a1 value:v8 withObjCType:"[4q]"];

  return v6;
}

- (uint64_t)juDirectionalRangeValue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t result = [a1 getValue:&v5 size:32];
  *(_OWORD *)a2 = v5;
  uint64_t v4 = v7;
  *(void *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 24) = v4 != 0;
  return result;
}

@end