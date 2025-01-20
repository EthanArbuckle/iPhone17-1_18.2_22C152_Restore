@interface NSData(CRXUExtensions)
+ (id)crxu_dataWithHexString:()CRXUExtensions;
+ (uint64_t)crxu_randomDataWithLength:()CRXUExtensions;
- (id)crxu_SHA256Hash;
- (id)crxu_asHexString;
@end

@implementation NSData(CRXUExtensions)

+ (id)crxu_dataWithHexString:()CRXUExtensions
{
  id v4 = a3;
  uint64_t v5 = [v4 UTF8String];
  unint64_t v6 = [v4 length];
  if (v6)
  {
    v11 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263EFF990] dataWithCapacity:v6 >> 1];
    __str[2] = 0;
    unint64_t v14 = 0;
    if (v6)
    {
      unint64_t v8 = 0;
      uint64_t v9 = MEMORY[0x263EF8318];
      while (1)
      {
        int v10 = *(char *)(v5 + v8);
        if (v10 < 0) {
          break;
        }
        v11 = 0;
        if ((*(_DWORD *)(v9 + 4 * *(unsigned __int8 *)(v5 + v8) + 60) & 0x10000) == 0) {
          goto LABEL_12;
        }
        uint64_t v12 = *(unsigned __int8 *)(v5 + v8 + 1);
        if ((char)v12 < 0) {
          goto LABEL_12;
        }
        if ((*(_DWORD *)(v9 + 4 * v12 + 60) & 0x10000) == 0) {
          break;
        }
        v8 += 2;
        __str[0] = v10;
        __str[1] = v12;
        unint64_t v14 = strtoul(__str, 0, 16);
        [v7 appendBytes:&v14 length:1];
        if (v8 >= v6) {
          goto LABEL_9;
        }
      }
      v11 = 0;
    }
    else
    {
LABEL_9:
      v11 = objc_msgSend(a1, "dataWithData:", v7, v14);
    }
LABEL_12:
  }
  return v11;
}

+ (uint64_t)crxu_randomDataWithLength:()CRXUExtensions
{
  id v4 = malloc_type_malloc(size, 0x100004077774924uLL);
  arc4random_buf(v4, size);
  uint64_t v5 = (void *)MEMORY[0x263EFF8F8];
  return [v5 dataWithBytesNoCopy:v4 length:size freeWhenDone:1];
}

- (id)crxu_asHexString
{
  v2 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 2 * objc_msgSend(a1, "length"));
  id v3 = a1;
  id v4 = (unsigned __int8 *)[v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 >= 1)
  {
    unint64_t v6 = &v4[v5];
    do
    {
      unsigned int v7 = *v4++;
      objc_msgSend(v2, "appendFormat:", @"%02x", v7);
    }
    while (v4 < v6);
  }
  unint64_t v8 = [NSString stringWithString:v2];

  return v8;
}

- (id)crxu_SHA256Hash
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:md length:32 freeWhenDone:0];
  id v3 = objc_msgSend(v2, "crxu_asHexString");

  return v3;
}

@end