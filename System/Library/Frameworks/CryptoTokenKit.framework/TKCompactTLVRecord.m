@interface TKCompactTLVRecord
+ (id)parseFromDataSource:(id)a3;
- (TKCompactTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value;
@end

@implementation TKCompactTLVRecord

- (TKCompactTLVRecord)initWithTag:(UInt8)tag value:(NSData *)value
{
  uint64_t v4 = tag;
  v6 = value;
  v7 = (void *)MEMORY[0x1E4F1C3C8];
  if (v4 >= 0x10) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"bad tag value for TKCompactTLVRecord (%u)", v4);
  }
  if ([(NSData *)v6 length] >= 0x10) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v7, @"value for TKCompactTLVRecord too big (%lu)", -[NSData length](v6, "length"));
  }
  char v12 = [(NSData *)v6 length] | (16 * v4);
  v8 = [MEMORY[0x1E4F1CA58] dataWithBytes:&v12 length:1];
  [v8 appendData:v6];
  v11.receiver = self;
  v11.super_class = (Class)TKCompactTLVRecord;
  v9 = [(TKTLVRecord *)&v11 initWithTag:v4 value:v6 data:v8];

  return v9;
}

+ (id)parseFromDataSource:(id)a3
{
  id v4 = a3;
  if ([v4 bytesSafeToRead:1])
  {
    uint64_t v5 = [v4 ptr];
    unsigned int v6 = [v4 fetchByte];
    unint64_t v7 = v6;
    v8 = [v4 fetchDataWithLength:v6 & 0xF];
    if (v8)
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___TKCompactTLVRecord;
      id v9 = objc_msgSendSuper2(&v13, sel_alloc);
      v10 = [v4 dataFromPtr:v5];
      objc_super v11 = (void *)[v9 initWithTag:v7 >> 4 value:v8 data:v10];
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

@end