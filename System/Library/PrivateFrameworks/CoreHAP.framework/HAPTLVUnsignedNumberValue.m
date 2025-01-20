@interface HAPTLVUnsignedNumberValue
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5;
- (id)_serialize;
- (id)description;
@end

@implementation HAPTLVUnsignedNumberValue

- (id)description
{
  v2 = NSString;
  v3 = [(HAPTLVNumberValueBase *)self value];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"<HAPTLVUnsignedNumberValue value=%llu>", objc_msgSend(v3, "unsignedLongLongValue"));

  return v4;
}

- (id)_serialize
{
  v2 = [(HAPTLVNumberValueBase *)self value];
  v3 = HAPTLVWriteUInt64([v2 unsignedLongLongValue]);

  return v3;
}

- (id)_parseFromData:(const char *)a3 length:(unint64_t)a4 status:(int *)a5
{
  v5 = NSNumber;
  uint64_t v6 = HAPTLVParseUInt64((unsigned __int8 *)a3, a4, a5);

  return (id)[v5 numberWithUnsignedLongLong:v6];
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(HAPTLVUnsignedNumberValue);
  v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPTLVNumberValueBase *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end