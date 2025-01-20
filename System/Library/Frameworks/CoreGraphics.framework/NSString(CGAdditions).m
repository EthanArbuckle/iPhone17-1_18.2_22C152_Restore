@interface NSString(CGAdditions)
- (uint64_t)enumerateComponentsSeparatedByCharactersInSet:()CGAdditions usingBlock:;
@end

@implementation NSString(CGAdditions)

- (uint64_t)enumerateComponentsSeparatedByCharactersInSet:()CGAdditions usingBlock:
{
  char v16 = 0;
  uint64_t v7 = [a1 length];
  uint64_t v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, 0, v7);
  if (!v9) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, char *))(a4 + 16))(a4, 0, v7, &v16);
  }
  uint64_t v10 = v8;
  uint64_t v11 = v9;
  uint64_t v12 = 0;
  while (1)
  {
    if (v10 != v12)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v12, v10 - v12, &v16);
      if (v16) {
        break;
      }
    }
    uint64_t v12 = v10 + v11;
    uint64_t v14 = v7 - (v10 + v11);
    uint64_t result = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, v10 + v11, v14);
    uint64_t v10 = result;
    uint64_t v11 = v15;
    if (!v15)
    {
      if (v7 != v12) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *))(a4 + 16))(a4, v12, v14, &v16);
      }
      return result;
    }
  }
  return result;
}

@end