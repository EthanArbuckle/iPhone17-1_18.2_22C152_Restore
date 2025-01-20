@interface NSData(GZip)
+ (id)makeArchive:()GZip length:level:;
- (id)gzipDeflate:()GZip;
- (id)gzipInflate;
@end

@implementation NSData(GZip)

- (id)gzipDeflate:()GZip
{
  if ([a1 length])
  {
    float v4 = fminf(a2, 1.0);
    float v5 = v4 * 9.0;
    BOOL v6 = v4 <= 0.0;
    float v7 = 0.0;
    if (!v6) {
      float v7 = v5;
    }
    int v8 = (int)v7;
    id v9 = a1;
    v18.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    v18.avail_out = 0;
    v18.uLong total_out = 0;
    memset(&v18.zalloc, 0, 24);
    int v10 = deflateInit2_(&v18, v8, 8, 31, 8, 0, "1.2.12", 112);
    id v11 = 0;
    if (!v10)
    {
      v12 = [MEMORY[0x263EFF990] dataWithLength:0x8000];
      while (!v18.avail_out)
      {
        uLong total_out = v18.total_out;
        if (total_out >= [v12 length]) {
          objc_msgSend(v12, "setLength:", objc_msgSend(v12, "length") + 0x8000);
        }
        id v14 = v12;
        uint64_t v15 = [v14 mutableBytes];
        v18.next_out = (Bytef *)(v15 + v18.total_out);
        int v16 = [v14 length];
        v18.avail_out = v16 - LODWORD(v18.total_out);
        if (deflate(&v18, 4))
        {
          deflateEnd(&v18);
          id v11 = 0;
          goto LABEL_13;
        }
      }
      deflateEnd(&v18);
      [v12 setLength:v18.total_out];
      id v11 = v12;
LABEL_13:
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)makeArchive:()GZip length:level:
{
  id v5 = 0;
  if (a4 && a5)
  {
    float v6 = fminf(a1, 1.0);
    float v7 = v6 * 9.0;
    BOOL v8 = v6 <= 0.0;
    float v9 = 0.0;
    if (!v8) {
      float v9 = v7;
    }
    v16.next_in = a4;
    v16.avail_in = a5;
    v16.avail_out = 0;
    v16.uLong total_out = 0;
    memset(&v16.zalloc, 0, 24);
    id v5 = 0;
    if (!deflateInit2_(&v16, (int)v9, 8, 31, 8, 0, "1.2.12", 112))
    {
      int v10 = [MEMORY[0x263EFF990] dataWithLength:0x8000];
      while (!v16.avail_out)
      {
        uLong total_out = v16.total_out;
        if (total_out >= [v10 length]) {
          objc_msgSend(v10, "setLength:", objc_msgSend(v10, "length") + 0x8000);
        }
        id v12 = v10;
        uint64_t v13 = [v12 mutableBytes];
        v16.next_out = (Bytef *)(v13 + v16.total_out);
        int v14 = [v12 length];
        v16.avail_out = v14 - LODWORD(v16.total_out);
        if (deflate(&v16, 4))
        {
          deflateEnd(&v16);
          id v5 = 0;
          goto LABEL_13;
        }
      }
      deflateEnd(&v16);
      [v10 setLength:v16.total_out];
      id v5 = v10;
LABEL_13:
    }
  }

  return v5;
}

- (id)gzipInflate
{
  if ([a1 length])
  {
    uint64_t v2 = [a1 length];
    unint64_t v3 = [a1 length];
    float v4 = [MEMORY[0x263EFF990] dataWithLength:v2 + (v3 >> 1)];
    id v5 = a1;
    v17.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"));
    v17.zalloc = 0;
    v17.zfree = 0;
    v17.uLong total_out = 0;
    if (inflateInit2_(&v17, 47, "1.2.12", 112)) {
      goto LABEL_13;
    }
    unint64_t v6 = v3 >> 1;
    do
    {
      uLong total_out = v17.total_out;
      if (total_out >= [v4 length]) {
        [v4 increaseLengthBy:v6];
      }
      id v8 = v4;
      uint64_t v9 = [v8 mutableBytes];
      v17.next_out = (Bytef *)(v9 + v17.total_out);
      int v10 = [v8 length];
      v17.avail_out = v10 - LODWORD(v17.total_out);
      int v11 = inflate(&v17, 2);
    }
    while (!v11);
    BOOL v12 = v11 == 1;
    int v14 = inflateEnd(&v17);
    char v15 = !v12;
    if (v14) {
      char v15 = 1;
    }
    if (v15)
    {
LABEL_13:
      uint64_t v13 = 0;
    }
    else
    {
      [v8 setLength:v17.total_out];
      uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithData:v8];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end