@interface NSData
+ (NSData)dataWithHexString:(id)a3;
+ (NSData)dataWithMACAddressString:(id)a3;
- (NSData)initWithBase64EncodedString:(id)a3;
- (id)base64EncodedString;
- (id)hexString;
@end

@implementation NSData

+ (NSData)dataWithHexString:(id)a3
{
  v3 = +[NSString sanitizedHexString:a3];
  if ([v3 length])
  {
    v9 = sub_100010114();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10001FF50((uint64_t)v3, v9);
    }

    v5 = 0;
  }
  else
  {
    __int16 v12 = 0;
    v4 = [v3 lowercaseString];

    v5 = objc_opt_new();
    int v6 = [v4 length];
    if (v6 >= 2)
    {
      uint64_t v7 = 0;
      int v8 = v6 - 1;
      do
      {
        __str[0] = [v4 characterAtIndex:v7];
        __str[1] = [v4 characterAtIndex:v7 + 1];
        HIBYTE(v12) = strtol(__str, 0, 16);
        [v5 appendBytes:(char *)&v12 + 1 length:1];
        v7 += 2;
      }
      while (v8 > (int)v7);
    }
    v3 = v4;
  }

  return (NSData *)v5;
}

+ (NSData)dataWithMACAddressString:(id)a3
{
  v3 = +[NSString sanitizedHexString:a3];
  if ([v3 length] == (id)12)
  {
    v4 = +[NSData dataWithHexString:v3];
  }
  else
  {
    v5 = sub_100010114();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_10001FFC8((uint64_t)v3, v5);
    }

    v4 = 0;
  }

  return (NSData *)v4;
}

- (id)base64EncodedString
{
  return [(NSData *)self base64EncodedStringWithOptions:0];
}

- (NSData)initWithBase64EncodedString:(id)a3
{
  return [(NSData *)self initWithBase64EncodedString:a3 options:0];
}

- (id)hexString
{
  +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E6E0;
  v6[3] = &unk_100035C10;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v7;
  [(NSData *)self enumerateByteRangesUsingBlock:v6];
  v4 = +[NSString stringWithString:v3];

  return v4;
}

@end