@interface NSString(hex)
- (BOOL)_validHexChar:()hex;
- (id)fromHex;
- (id)hex;
@end

@implementation NSString(hex)

- (id)hex
{
  v2 = [MEMORY[0x263F089D8] string];
  v3 = (const char *)[a1 UTF8String];
  size_t v4 = strlen(v3);
  if (v4)
  {
    size_t v5 = v4;
    do
    {
      unsigned int v6 = *(unsigned __int8 *)v3++;
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02x", v6);
      [v2 appendString:v7];

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (BOOL)_validHexChar:()hex
{
  return a3 - 48 < 0xA || a3 - 97 < 6 || a3 - 65 < 6;
}

- (id)fromHex
{
  id v1 = a1;
  v2 = (const char *)[v1 UTF8String];
  size_t v3 = strlen(v2);
  size_t v4 = v3;
  if ((v3 & 1) == 0)
  {
    size_t v5 = malloc_type_malloc((v3 >> 1) + 1, 0xA23A9FB4uLL);
    if (v5)
    {
      unsigned int v6 = v5;
      if (!v4)
      {
LABEL_10:
        v6[v4 >> 1] = 0;
        v9 = [NSString stringWithUTF8String:v6];
        free(v6);
        goto LABEL_13;
      }
      size_t v7 = 0;
      while (1)
      {
        v12[0] = v2[v7];
        char v8 = v2[v7 + 1];
        v12[1] = v8;
        v12[2] = 0;
        if (!objc_msgSend(v1, "_validHexChar:")) {
          break;
        }
        if (([v1 _validHexChar:v8] & 1) == 0) {
          break;
        }
        int v11 = 0;
        if (sscanf(v12, "%x", &v11) != 1 || !v11) {
          break;
        }
        v6[v7 >> 1] = v11;
        v7 += 2;
        if (v7 >= v4) {
          goto LABEL_10;
        }
      }
      free(v6);
    }
  }
  v9 = 0;
LABEL_13:
  return v9;
}

@end