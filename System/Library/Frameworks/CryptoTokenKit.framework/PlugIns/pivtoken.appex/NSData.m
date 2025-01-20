@interface NSData
- (id)hexString;
- (id)inflate;
- (int)getWindowSize;
@end

@implementation NSData

- (int)getWindowSize
{
  v2 = self;
  v3 = [(NSData *)v2 bytes];
  if ([(NSData *)v2 length] >= 3 && *v3 == 31 && v3[1] == 139) {
    return 31;
  }
  else {
    return 47;
  }
}

- (id)inflate
{
  memset(&v12.avail_in, 0, 104);
  int v3 = [(NSData *)self getWindowSize];
  v4 = self;
  v12.avail_in = [(NSData *)v4 length];
  int v5 = inflateInit2_(&v12, v3, "1.2.12", 112);
  id v6 = 0;
  if (!v5)
  {
    v7 = +[NSMutableData dataWithLength:1024];
    v8 = 0;
    while (1)
    {
      id v9 = v7;
      v12.next_out = (Bytef *)&v8[(void)[v9 mutableBytes]];
      v12.avail_out = [v9 length] - v8;
      int v10 = inflate(&v12, 0);
      if (v10) {
        break;
      }
      v8 = (char *)[v9 length];
      objc_msgSend(v9, "setLength:", (char *)objc_msgSend(v9, "length") + ((unint64_t)objc_msgSend(v9, "length") >> 1));
    }
    if (v10 == 1)
    {
      [v9 setLength:v12.total_out];
      inflateEnd(&v12);
      id v6 = v9;
    }
    else
    {
      inflateEnd(&v12);
      id v6 = 0;
    }
  }

  return v6;
}

- (id)hexString
{
  int v3 = +[NSMutableString stringWithCapacity:2 * [(NSData *)self length]];
  v4 = self;
  int v5 = [(NSData *)v4 bytes];
  if ([(NSData *)v4 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v3, "appendFormat:", @"%02lX", v5[v6++]);
    while (v6 < [(NSData *)v4 length]);
  }

  return v3;
}

@end