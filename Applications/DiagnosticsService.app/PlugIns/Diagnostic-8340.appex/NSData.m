@interface NSData
+ (NSData)dataWithHexString:(id)a3;
- (id)convertToHexString;
@end

@implementation NSData

- (id)convertToHexString
{
  v2 = self;
  v3 = [(NSData *)v2 bytes];
  v4 = [(NSData *)v2 length];
  for (id i = objc_alloc_init((Class)NSMutableString); v4; --v4)
  {
    unsigned int v6 = *v3++;
    [i appendFormat:@"%02X", v6];
  }
  v7 = +[NSString stringWithString:i];

  return v7;
}

+ (NSData)dataWithHexString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  __int16 v13 = 0;
  if (v3)
  {
    v5 = [v3 lowercaseString];

    v4 = objc_opt_new();
    int v6 = [v5 length];
    if (v6 >= 2)
    {
      int v7 = 0;
      int v8 = v6 - 1;
      do
      {
        int v9 = v7 + 1;
        unsigned __int8 v10 = [v5 characterAtIndex:v7];
        if ((char)v10 >= 48 && v10 <= 0x66u && v10 - 58 >= 0x27)
        {
          __str[0] = v10;
          __str[1] = [v5 characterAtIndex:v9];
          HIBYTE(v13) = strtol(__str, 0, 16);
          [v4 appendBytes:(char *)&v13 + 1 length:1];
          int v9 = v7 + 2;
        }
        int v7 = v9;
      }
      while (v9 < v8);
    }
  }
  else
  {
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sub_10000EEEC(v5);
      v4 = 0;
    }
  }

  return (NSData *)v4;
}

@end