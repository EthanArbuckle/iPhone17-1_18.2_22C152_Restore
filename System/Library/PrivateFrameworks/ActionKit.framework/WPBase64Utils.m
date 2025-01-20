@interface WPBase64Utils
+ (id)decodeString:(id)a3;
+ (id)encodeData:(id)a3;
+ (void)encodeFileHandle:(id)a3 withChunkHandler:(id)a4;
+ (void)encodeInputStream:(id)a3 withChunkHandler:(id)a4;
@end

@implementation WPBase64Utils

+ (id)decodeString:(id)a3
{
  [a3 dataUsingEncoding:1];
  uint64_t v7 = 0;
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = NewBase64Decode((char *)[v3 bytes], objc_msgSend(v3, "length"), &v7);
  v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v4 length:v7];
  free(v4);

  return v5;
}

+ (void)encodeFileHandle:(id)a3 withChunkHandler:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [v10 readDataOfLength:18000];
  if ([v7 length])
  {
    do
    {
      v8 = [a1 encodeData:v7];
      v6[2](v6, v8);
      v9 = [v10 readDataOfLength:18000];

      uint64_t v7 = v9;
    }
    while ([v9 length]);
  }
  else
  {
    v9 = v7;
  }
}

+ (void)encodeInputStream:(id)a3 withChunkHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  [v6 open];
  if ([v6 hasBytesAvailable])
  {
    do
    {
      uint64_t v8 = [v6 read:v13 maxLength:18000];
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = (void *)MEMORY[0x23ECE6170]();
        v11 = [MEMORY[0x263EFF8F8] dataWithBytes:v13 length:v9];
        v12 = [a1 encodeData:v11];
        v7[2](v7, v12);
      }
    }
    while (([v6 hasBytesAvailable] & 1) != 0);
  }
  [v6 close];
}

+ (id)encodeData:(id)a3
{
  uint64_t v10 = 0;
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = [v3 length];

  id v6 = NewBase64Encode(v4, v5, 0, &v10);
  id v7 = [NSString alloc];
  uint64_t v8 = (void *)[v7 initWithBytes:v6 length:v10 encoding:1];
  free(v6);
  return v8;
}

@end