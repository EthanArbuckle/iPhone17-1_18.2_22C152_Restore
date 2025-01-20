@interface NSUUID(AppleMediaServices)
- (id)ams_base62String;
@end

@implementation NSUUID(AppleMediaServices)

- (id)ams_base62String
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = 0;
  v8[1] = 0;
  [a1 getUUIDBytes:v8];
  uint64_t v1 = 0;
  v2 = v7;
  do
  {
    unsigned int v3 = *((_DWORD *)v8 + v1);
    for (uint64_t i = 5; i != -1; --i)
    {
      v2[i] = Base62Chars[v3 % 0x3E];
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