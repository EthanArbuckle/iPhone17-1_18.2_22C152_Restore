@interface NSString
- (id)URLEncodedString_ch;
@end

@implementation NSString

- (id)URLEncodedString_ch
{
  v3 = +[NSMutableString string];
  v4 = [(NSString *)self UTF8String];
  int v5 = strlen(v4);
  if (v5 >= 1)
  {
    for (uint64_t i = v5; i; --i)
    {
      int v8 = *(unsigned __int8 *)v4++;
      uint64_t v7 = v8;
      if (v8 > 57)
      {
        if (v7 == 58)
        {
          v9 = v3;
          CFStringRef v10 = @"%3A";
          goto LABEL_16;
        }
        if (v7 == 95 || v7 == 126)
        {
LABEL_14:
          [v3 appendFormat:@"%c" v7];
          continue;
        }
      }
      else
      {
        if ((v7 - 45) < 2) {
          goto LABEL_14;
        }
        if (v7 == 32)
        {
          v9 = v3;
          CFStringRef v10 = @"%20";
LABEL_16:
          [v9 appendString:v10];
          continue;
        }
      }
      if ((v7 & 0xFFFFFFDF) - 65 < 0x1A || v7 == 61 || (v7 - 48) <= 9) {
        goto LABEL_14;
      }
      [v3 appendFormat:@"%%%02X" v7];
    }
  }

  return v3;
}

@end