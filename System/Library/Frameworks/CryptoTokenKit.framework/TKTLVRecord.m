@interface TKTLVRecord
+ (NSArray)sequenceOfRecordsFromData:(NSData *)data;
+ (TKTLVRecord)recordFromData:(NSData *)data;
+ (id)parseFromDataSource:(id)a3;
- (NSData)data;
- (NSData)value;
- (TKTLVRecord)initWithTag:(unint64_t)a3 value:(id)a4 data:(id)a5;
- (TKTLVTag)tag;
- (id)description;
@end

@implementation TKTLVRecord

+ (NSArray)sequenceOfRecordsFromData:(NSData *)data
{
  v4 = data;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [[TKDataSource alloc] initWithData:v4];
  for (i = v6; ; v6 = i)
  {
    unint64_t v8 = [(TKDataSource *)v6 ptr];
    if ((const char *)v8 >= [(TKDataSource *)i end])
    {
      id v11 = v5;
      goto LABEL_7;
    }
    uint64_t v9 = [a1 parseFromDataSource:i];
    if (!v9) {
      break;
    }
    v10 = (void *)v9;
    [v5 addObject:v9];
  }
  id v11 = 0;
LABEL_7:

  return (NSArray *)v11;
}

- (TKTLVRecord)initWithTag:(unint64_t)a3 value:(id)a4 data:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TKTLVRecord;
  id v11 = [(TKTLVRecord *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_tag = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

+ (TKTLVRecord)recordFromData:(NSData *)data
{
  v4 = data;
  v5 = [[TKDataSource alloc] initWithData:v4];

  v6 = [a1 parseFromDataSource:v5];
  uint64_t v7 = [(TKDataSource *)v5 ptr];
  if ((const char *)v7 == [(TKDataSource *)v5 end]) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (NSData)value
{
  return self->_value;
}

- (TKTLVTag)tag
{
  return self->_tag;
}

- (NSData)data
{
  return self->_data;
}

+ (id)parseFromDataSource:(id)a3
{
  return 0;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = [(TKTLVRecord *)self value];
  uint64_t v5 = [v4 bytes];

  v6 = [(TKTLVRecord *)self value];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v5 + v8++));
      id v9 = [(TKTLVRecord *)self value];
      unint64_t v10 = [v9 length];
    }
    while (v8 < v10);
  }
  id v11 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)TKTLVRecord;
  v12 = [(TKTLVRecord *)&v15 description];
  v13 = [v11 stringWithFormat:@"%@ 0x%llx=%@", v12, -[TKTLVRecord tag](self, "tag"), v3];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end