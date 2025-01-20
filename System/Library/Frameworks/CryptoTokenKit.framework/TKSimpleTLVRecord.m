@interface TKSimpleTLVRecord
+ (id)parseFromDataSource:(id)a3 error:(id *)a4;
- (TKSimpleTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value;
@end

@implementation TKSimpleTLVRecord

- (TKSimpleTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value
{
  unsigned int v4 = tag;
  v6 = value;
  if ([(NSData *)v6 length] > 0xFE)
  {
    if ([(NSData *)v6 length] >= 0x10000) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"value for TKSimpleTLVRecord record too big (%lu)", -[NSData length](v6, "length"));
    }
    char v13 = v4;
    char v14 = -1;
    char v15 = (unsigned __int16)[(NSData *)v6 length] >> 8;
    char v16 = [(NSData *)v6 length];
    v7 = (void *)MEMORY[0x1E4F1CA58];
    uint64_t v8 = 4;
  }
  else
  {
    char v13 = v4;
    char v14 = [(NSData *)v6 length];
    v7 = (void *)MEMORY[0x1E4F1CA58];
    uint64_t v8 = 2;
  }
  v9 = [v7 dataWithBytes:&v13 length:v8];
  [v9 appendData:v6];
  v12.receiver = self;
  v12.super_class = (Class)TKSimpleTLVRecord;
  v10 = [(TKTLVRecord *)&v12 initWithTag:v4 value:v6 data:v9];

  return v10;
}

+ (id)parseFromDataSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 bytesSafeToRead:1])
  {
    uint64_t v6 = [v5 ptr];
    unsigned int v7 = [v5 fetchByte];
    if ((v7 + 1) >= 2u)
    {
      unsigned int v8 = v7;
      if ([v5 bytesSafeToRead:1])
      {
        unsigned int v9 = [v5 fetchByte];
        if (v9 != 255)
        {
          unint64_t v10 = v9;
LABEL_8:
          objc_super v12 = [v5 fetchDataWithLength:v10];
          if (v12)
          {
            id v13 = objc_alloc((Class)a1);
            char v14 = [v5 dataFromPtr:v6];
            char v15 = (void *)[v13 initWithTag:v8 value:v12 data:v14];
          }
          else
          {
            char v15 = 0;
          }

          goto LABEL_11;
        }
        if ([v5 bytesSafeToRead:2])
        {
          uint64_t v11 = [v5 fetchByte];
          unint64_t v10 = [v5 fetchByte] | (unint64_t)(v11 << 8);
          goto LABEL_8;
        }
      }
    }
  }
  char v15 = 0;
LABEL_11:

  return v15;
}

@end