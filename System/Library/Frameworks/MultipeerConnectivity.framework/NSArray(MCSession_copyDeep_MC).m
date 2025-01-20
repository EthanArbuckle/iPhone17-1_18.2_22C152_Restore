@interface NSArray(MCSession_copyDeep_MC)
- (uint64_t)copyDeep_MC;
@end

@implementation NSArray(MCSession_copyDeep_MC)

- (uint64_t)copyDeep_MC
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 count];
  v3 = (void **)((char *)v8 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v2)
  {
    uint64_t v4 = 0;
    do
    {
      v3[v4] = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v4), "copy");
      ++v4;
    }
    while (v2 != v4);
  }
  for (uint64_t i = [objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:v3 count:v2]; v2; --v2)
  {
    v6 = *v3++;
  }
  return i;
}

@end