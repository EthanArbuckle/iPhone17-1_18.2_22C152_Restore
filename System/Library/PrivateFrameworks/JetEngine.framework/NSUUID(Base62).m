@interface NSUUID(Base62)
- (id)je_base62String;
@end

@implementation NSUUID(Base62)

- (id)je_base62String
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 getUUIDBytes:v8];
  uint64_t v1 = 0;
  v2 = v7;
  do
  {
    unsigned int v3 = v8[v1];
    for (uint64_t i = 5; i != -1; --i)
    {
      v2[i] = _base62Chars[v3 % 0x3E];
      v3 /= 0x3Eu;
    }
    ++v1;
    v2 += 6;
  }
  while (v1 != 4);
  v5 = (void *)[[NSString alloc] initWithBytes:v7 length:24 encoding:4];
  return v5;
}

@end