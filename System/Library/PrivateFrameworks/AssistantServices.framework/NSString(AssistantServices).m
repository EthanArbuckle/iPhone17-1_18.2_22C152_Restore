@interface NSString(AssistantServices)
+ (id)hexStringFromBytes:()AssistantServices length:;
+ (id)hexStringFromData:()AssistantServices;
@end

@implementation NSString(AssistantServices)

+ (id)hexStringFromData:()AssistantServices
{
  if (a3)
  {
    id v5 = a3;
    uint64_t v6 = [v5 bytes];
    uint64_t v7 = [v5 length];

    v8 = [a1 hexStringFromBytes:v6 length:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)hexStringFromBytes:()AssistantServices length:
{
  uint64_t v4 = a4;
  uint64_t v6 = malloc_type_malloc(2 * a4, 0x31C64490uLL);
  uint64_t v7 = v6;
  if (v4)
  {
    v8 = v6;
    do
    {
      if (*a3 <= 0x9Fu) {
        char v9 = 48;
      }
      else {
        char v9 = 87;
      }
      unsigned char *v8 = v9 + (*a3 >> 4);
      char v10 = *a3++;
      unsigned int v11 = v10 & 0xF;
      if (v11 <= 9) {
        char v12 = 48;
      }
      else {
        char v12 = 87;
      }
      uint64_t v7 = v8 + 2;
      v8[1] = v12 + v11;
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  v13 = (void *)[[NSString alloc] initWithBytesNoCopy:v6 length:v7 - v6 encoding:1 freeWhenDone:1];
  return v13;
}

@end