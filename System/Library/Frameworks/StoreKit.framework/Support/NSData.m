@interface NSData
- (NSString)lib_digestMD5;
- (NSString)lib_shortDigestMD5;
- (id)lib_gzippedData;
- (void)lib_enumerateSubdataWithOffset:(unint64_t)a3 length:(unint64_t)a4 usingBlock:(id)a5;
@end

@implementation NSData

- (NSString)lib_digestMD5
{
  v2 = self;
  CC_MD5([(NSData *)v2 bytes], (CC_LONG)[(NSData *)v2 length], md);
  v3 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", md[i]);
  id v5 = [v3 copy];

  return (NSString *)v5;
}

- (NSString)lib_shortDigestMD5
{
  v2 = [(NSData *)self lib_digestMD5];
  if ((unint64_t)[v2 length] <= 8)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 substringToIndex:8];
  }
  v4 = v3;

  return (NSString *)v4;
}

- (void)lib_enumerateSubdataWithOffset:(unint64_t)a3 length:(unint64_t)a4 usingBlock:(id)a5
{
  v8 = (void (**)(id, void *, BOOL, unsigned char *))a5;
  char v14 = 0;
  if ([(NSData *)self length] > a3)
  {
    uint64_t v9 = -(uint64_t)a3;
    do
    {
      v10 = (char *)[(NSData *)self length] + v9;
      if ((unint64_t)v10 >= a4) {
        unint64_t v12 = a4;
      }
      else {
        unint64_t v12 = (unint64_t)v10;
      }
      v13 = -[NSData subdataWithRange:](self, "subdataWithRange:", a3, v12);
      v8[2](v8, v13, (unint64_t)v10 < a4, &v14);

      if (v14) {
        break;
      }
      a3 += a4;
      v9 -= a4;
    }
    while (a3 < [(NSData *)self length]);
  }
}

- (id)lib_gzippedData
{
  v2 = self;
  id v3 = [(NSData *)v2 bytes];
  id v4 = [(NSData *)v2 length];
  id v5 = 0;
  if (v3)
  {
    id v6 = v4;
    if (v4)
    {
      memset(&v11.avail_in, 0, 104);
      v11.avail_in = v4;
      v11.avail_out = v4;
      v11.next_in = v3;
      id v7 = [objc_alloc((Class)NSMutableData) initWithLength:v4];
      v11.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v11.next_in, *(void *)&v11.avail_in);
      if (v7
        && !deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (v8 = deflate(&v11, 4), int v9 = deflateEnd(&v11), v8 == 1))
      {
        id v5 = 0;
        if (!v9 && v6 == (id)v11.total_in)
        {
          [v7 setLength:v11.total_out];
          id v5 = v7;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
  }

  return v5;
}

@end