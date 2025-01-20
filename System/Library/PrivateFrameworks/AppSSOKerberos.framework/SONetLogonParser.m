@interface SONetLogonParser
+ (id)parseNetLoginUsingData:(id)a3;
@end

@implementation SONetLogonParser

+ (id)parseNetLoginUsingData:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v22 = (id)[MEMORY[0x263EFFA78] mutableCopy];
  v21[1] = v21;
  v4 = (char *)v21 - (([v3 length] + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, "getBytes:length:", v4, objc_msgSend(v3, "length"));
  int v5 = 0;
  int v6 = 1;
  int v7 = 24;
  do
  {
    if ([v3 length] <= (unint64_t)v7)
    {
      v10 = &stru_26D3372C0;
    }
    else
    {
      uint64_t v8 = v7;
      char v9 = 1;
      v10 = &stru_26D3372C0;
      while (1)
      {
        int v11 = v4[v8];
        if (!v11) {
          break;
        }
        if ((v11 & 0xC0) != 0)
        {
          uint64_t v12 = v7 + 1;
          if (!v5) {
            int v5 = v7 + 2;
          }
          int v7 = v4[v12];
          if ([v3 length] < (unint64_t)v7)
          {
            int v7 = v12;
            goto LABEL_20;
          }
        }
        else
        {
          if ((v9 & 1) == 0)
          {
            uint64_t v13 = [(__CFString *)v10 stringByAppendingString:@"."];

            v10 = (__CFString *)v13;
          }
          uint64_t v14 = v7 + 1;
          v15 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4[v14] length:v11];
          v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
          uint64_t v17 = [(__CFString *)v10 stringByAppendingString:v16];

          int v7 = v14 + v11;
          char v9 = 0;
          v10 = (__CFString *)v17;
        }
        uint64_t v8 = v7;
        if ([v3 length] <= (unint64_t)v7) {
          goto LABEL_20;
        }
      }
      v18 = [NSNumber numberWithShort:(__int16)v6];
      [v22 setObject:v10 forKeyedSubscript:v18];

      if (v5) {
        int v7 = v5;
      }
      else {
        ++v7;
      }
      int v5 = 0;
    }
LABEL_20:

    ++v6;
  }
  while (v6 != 9);

  id v19 = v22;
  return v19;
}

@end