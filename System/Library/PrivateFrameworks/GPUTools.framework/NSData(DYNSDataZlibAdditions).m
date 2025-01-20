@interface NSData(DYNSDataZlibAdditions)
+ (BOOL)dy_decompressData:()DYNSDataZlibAdditions inMutableData:error:;
+ (id)dy_dataByCompressingData:()DYNSDataZlibAdditions level:error:;
+ (id)dy_dataByDecompressingData:()DYNSDataZlibAdditions error:;
+ (id)dy_dataWithContentsOfGzipFileAtPath:()DYNSDataZlibAdditions error:;
+ (uint64_t)dy_dataByCompressingData:()DYNSDataZlibAdditions error:;
+ (uint64_t)dy_decompressData:()DYNSDataZlibAdditions inBuffer:bufferSize:error:;
- (uLong)dy_crc32;
@end

@implementation NSData(DYNSDataZlibAdditions)

+ (uint64_t)dy_dataByCompressingData:()DYNSDataZlibAdditions error:
{
  return objc_msgSend(MEMORY[0x263EFF8F8], "dy_dataByCompressingData:level:error:", a3, 2, a4);
}

+ (id)dy_dataByCompressingData:()DYNSDataZlibAdditions level:error:
{
  memset(&v18, 0, sizeof(v18));
  if ((a4 - 1) >= 3)
  {
    if (a5)
    {
      uint64_t v8 = -2;
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = deflateInit_(&v18, dword_24F644CB8[a4 - 1], "1.2.12", 112);
    if (v7)
    {
      if (a5)
      {
        uint64_t v8 = v7;
LABEL_7:
        v9 = +[DYZlibError errorWithDomain:@"ZlibErrorDomain", v8, 0, v18.next_in code userInfo];
        id result = 0;
        *a5 = v9;
        return result;
      }
    }
    else
    {
      uInt v11 = deflateBound(&v18, objc_msgSend(a3, "length", *(_OWORD *)&v18.next_in, *(_OWORD *)&v18.total_in, *(void *)&v18.avail_out));
      v12 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v11];
      id v13 = a3;
      v18.avail_in = objc_msgSend(a3, "length", objc_msgSend(a3, "bytes"));
      v18.next_out = (Bytef *)[v12 mutableBytes];
      v18.avail_out = v11;
      int v14 = deflate(&v18, 4);
      if (!v14)
      {
        do
        {
          objc_msgSend(v12, "increaseLengthBy:", (unint64_t)objc_msgSend(a3, "length") >> 2);
          unsigned int v15 = [a3 length];
          v18.avail_out += v15 >> 2;
          int v16 = deflate(&v18, 4);
        }
        while (!v16);
        int v14 = v16;
      }
      int v17 = deflateEnd(&v18);

      if (v14 == 1 && !v17)
      {
        [v12 setLength:v18.total_out];
        return v12;
      }

      if (a5)
      {
        uint64_t v8 = v14;
        goto LABEL_7;
      }
    }
  }
  return 0;
}

+ (id)dy_dataByDecompressingData:()DYNSDataZlibAdditions error:
{
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:4096];
  if (objc_msgSend(MEMORY[0x263EFF8F8], "dy_decompressData:inMutableData:error:", a3, v6, a4))
  {
    return v6;
  }
  else
  {

    return 0;
  }
}

+ (BOOL)dy_decompressData:()DYNSDataZlibAdditions inMutableData:error:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(&strm.avail_in, 0, 104);
  strm.next_in = (Bytef *)[a3 bytes];
  strm.avail_in = [a3 length];
  int v8 = inflateInit_(&strm, "1.2.12", 112);
  if (v8)
  {
    if (!a5) {
      return 0;
    }
    v9 = +[DYZlibError errorWithDomain:@"ZlibErrorDomain" code:v8 userInfo:0];
    BOOL v10 = 0;
    goto LABEL_20;
  }
  do
  {
    strm.next_out = v18;
    strm.avail_out = 4096;
    int v11 = inflate(&strm, 2);
    int v12 = v11;
    if (strm.avail_out) {
      BOOL v13 = v11 == 1;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      [a4 appendBytes:v18 length:4096 - strm.avail_out];
    }
  }
  while (!v12);
  int v14 = inflateEnd(&strm);
  self;
  BOOL v10 = v12 == 1 && v14 == 0;
  if (a5 && !v10)
  {
    v9 = +[DYZlibError errorWithDomain:@"ZlibErrorDomain" code:v12 userInfo:0];
LABEL_20:
    *a5 = v9;
  }
  return v10;
}

+ (uint64_t)dy_decompressData:()DYNSDataZlibAdditions inBuffer:bufferSize:error:
{
  memset(&v15.avail_in, 0, 104);
  v15.avail_in = objc_msgSend(a3, "length", objc_msgSend(a3, "bytes"));
  int v9 = inflateInit_(&v15, "1.2.12", 112);
  if (v9)
  {
    if (a6)
    {
      uint64_t v10 = v9;
LABEL_9:
      int v14 = +[DYZlibError errorWithDomain:@"ZlibErrorDomain" code:v10 userInfo:0];
      uint64_t result = 0;
      *a6 = v14;
      return result;
    }
  }
  else
  {
    v15.next_out = a4;
    v15.avail_out = a5;
    int v11 = inflate(&v15, 4);
    int v12 = inflateEnd(&v15);
    if (v11 == 1 && !v12)
    {
      self;
      return 1;
    }
    if (a6)
    {
      uint64_t v10 = v11;
      goto LABEL_9;
    }
  }
  return 0;
}

+ (id)dy_dataWithContentsOfGzipFileAtPath:()DYNSDataZlibAdditions error:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  gzFile v5 = gzopen((const char *)[a3 fileSystemRepresentation], "rb");
  if (v5)
  {
    v6 = v5;
    int v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:4096];
    while (!gzeof(v6))
    {
      int v8 = gzread(v6, buf, 0x2000u);
      if (v8 == -1)
      {
        int errnum = 0;
        gzerror(v6, &errnum);
        if (errnum == -1)
        {
          if (a4)
          {
            BOOL v13 = (__objc2_class *)MEMORY[0x263F087E8];
            int v14 = (__CFString *)*MEMORY[0x263F08438];
            __error();
            int v11 = v13;
            int v12 = v14;
LABEL_14:
            *a4 = -[__objc2_class errorWithDomain:code:userInfo:](v11, "errorWithDomain:code:userInfo:", v12);
          }
        }
        else if (a4)
        {
          int v11 = DYZlibError;
          int v12 = @"ZlibErrorDomain";
          goto LABEL_14;
        }

        int v7 = 0;
        break;
      }
      [v7 appendBytes:buf length:v8];
    }
    gzclose(v6);
    return v7;
  }
  else if (a4)
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    id result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uLong)dy_crc32
{
  uLong v2 = crc32(0, 0, 0);
  return crc32(v2, (const Bytef *)[a1 bytes], objc_msgSend(a1, "length"));
}

@end