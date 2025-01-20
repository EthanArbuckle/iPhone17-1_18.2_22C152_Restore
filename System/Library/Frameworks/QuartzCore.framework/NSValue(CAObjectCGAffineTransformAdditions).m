@interface NSValue(CAObjectCGAffineTransformAdditions)
- (const)CA_CGAffineTransformValue;
@end

@implementation NSValue(CAObjectCGAffineTransformAdditions)

- (const)CA_CGAffineTransformValue
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  result = NSGetSizeAndAlignment((const char *)[a1 objCType], v7, 0);
  if (v7[0] > 0x2F)
  {
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
    return (const char *)[a1 getValue:a2 size:48];
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *a2 = *MEMORY[0x1E4F1DAB8];
    a2[1] = v6;
    a2[2] = *(_OWORD *)(v5 + 32);
  }
  return result;
}

@end