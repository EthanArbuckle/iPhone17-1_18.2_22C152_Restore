@interface NSUUID(CoordinationCore)
- (uint64_t)co_compare:()CoordinationCore;
@end

@implementation NSUUID(CoordinationCore)

- (uint64_t)co_compare:()CoordinationCore
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11[0] = 0;
  v11[1] = 0;
  v10[0] = 0;
  v10[1] = 0;
  [a1 getUUIDBytes:v11];
  [v4 getUUIDBytes:v10];
  uint64_t v5 = 0;
  uint64_t v6 = 1;
  while (1)
  {
    unsigned int v7 = *((unsigned __int8 *)v11 + v5);
    unsigned int v8 = *((unsigned __int8 *)v10 + v5);
    if (v7 < v8) {
      break;
    }
    if (v7 > v8) {
      goto LABEL_7;
    }
    if (++v5 == 16)
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v6 = -1;
LABEL_7:

  return v6;
}

@end