@interface HIDEvent(HIDEventDesc)
- (uint64_t)getEventFields;
- (void)enumerateFieldsWithBlock:()HIDEventDesc;
@end

@implementation HIDEvent(HIDEventDesc)

- (void)enumerateFieldsWithBlock:()HIDEventDesc
{
  v6 = a3;
  if (v6)
  {
    uint64_t v4 = [a1 getEventFields];
    if (v4)
    {
      for (uint64_t i = v4; *(_DWORD *)i || (*(unsigned char *)(i + 4) & 0x3F) != 0 || *(void *)(i + 8); i += 16)
        v6[2](v6, i);
    }
  }
}

- (uint64_t)getEventFields
{
  for (uint64_t i = 0; i != 39; ++i)
  {
    int v3 = *((_DWORD *)&hidEventFieldDescTable + 6 * i);
    if (v3 == [a1 type])
    {
      if ((0xFCFFFEFFBFuLL >> i))
      {
        uint64_t result = *((void *)&hidEventFieldDescTable + 3 * i + 1);
        goto LABEL_15;
      }
      uint64_t v4 = *((void *)&hidEventFieldDescTable + 3 * i + 2);
      v5 = (void *)(v4 + 8);
      if (*(void *)(v4 + 8))
      {
        uint64_t v6 = 0;
        do
        {
          uint64_t v7 = [a1 integerValueForField:*(unsigned int *)(v4 + 16 * v6)];
          for (j = (uint64_t *)(*v5 + 8); ; j += 2)
          {
            uint64_t result = *j;
            if (!*j) {
              break;
            }
            uint64_t v10 = *((unsigned int *)j - 2);
            if (v7 == v10) {
              return result;
            }
          }
          ++v6;
          uint64_t v11 = v4 + 16 * v6;
          uint64_t v12 = *(void *)(v11 + 8);
          v5 = (void *)(v11 + 8);
        }
        while (v12);
        goto LABEL_15;
      }
    }
    uint64_t result = 0;
LABEL_15:
    if (result) {
      return result;
    }
  }
  return 0;
}

@end