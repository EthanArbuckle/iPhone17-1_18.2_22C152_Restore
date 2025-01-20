@interface NSData(MobileActivation)
- (id)hexString;
@end

@implementation NSData(MobileActivation)

- (id)hexString
{
  uint64_t v2 = [a1 length];
  v3 = (char *)malloc_type_malloc(2 * v2, 0x193D21A2uLL);
  if (v3)
  {
    v4 = v3;
    if (v2)
    {
      uint64_t v5 = 0;
      v6 = v3 + 1;
      do
      {
        id v7 = a1;
        unsigned int v8 = *(unsigned __int8 *)([v7 bytes] + v5);
        if (v8 <= 0x9F) {
          char v9 = 48;
        }
        else {
          char v9 = 55;
        }
        *(v6 - 1) = v9 + (v8 >> 4);
        unsigned int v10 = *(unsigned char *)([v7 bytes] + v5) & 0xF;
        if (v10 <= 9) {
          char v11 = 48;
        }
        else {
          char v11 = 55;
        }
        unsigned char *v6 = v11 + v10;
        v6 += 2;
        ++v5;
      }
      while (v2 != v5);
    }
    v12 = (void *)[[NSString alloc] initWithBytes:v4 length:2 * v2 encoding:1];
    free(v4);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end