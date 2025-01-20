@interface HAPDataStreamTransportProtocolWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPDataStreamTransportProtocolWrapper)init;
- (HAPDataStreamTransportProtocolWrapper)initWithValue:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation HAPDataStreamTransportProtocolWrapper

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = v6;
    v8 = (unsigned __int8 *)[v7 bytes];
    switch([v7 length])
    {
      case 1:
        uint64_t v9 = *v8;
        break;
      case 2:
        uint64_t v9 = *(unsigned __int16 *)v8;
        break;
      case 4:
        uint64_t v9 = *(unsigned int *)v8;
        break;
      case 8:
        uint64_t v9 = *(void *)v8;
        break;
      default:
        if (!a4) {
          goto LABEL_10;
        }
        v10 = HMErrorFromOSStatus(4294960553);
        goto LABEL_9;
    }
    [(HAPDataStreamTransportProtocolWrapper *)self setValue:v9];
    BOOL v11 = 1;
  }
  else if (a4)
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
LABEL_9:
    BOOL v11 = 0;
    *a4 = v10;
  }
  else
  {
LABEL_10:
    BOOL v11 = 0;
  }

  return v11;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (int64_t)value
{
  return self->_value;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPDataStreamTransportProtocolWrapper);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPDataStreamTransportProtocolWrapper *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      id v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

- (HAPDataStreamTransportProtocolWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPDataStreamTransportProtocolWrapper;
  result = [(HAPDataStreamTransportProtocolWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

- (NSString)description
{
  v2 = NSString;
  objc_super v3 = HAPDataStreamTransportProtocolAsString([(HAPDataStreamTransportProtocolWrapper *)self value]);
  v4 = [v2 stringWithFormat:@"<HAPDataStreamTransportProtocolWrapper value=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPDataStreamTransportProtocolWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(HAPDataStreamTransportProtocolWrapper *)self value];
      uint64_t v7 = [(HAPDataStreamTransportProtocolWrapper *)v5 value];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPDataStreamTransportProtocolWrapper allocWithZone:a3];
  int64_t v5 = [(HAPDataStreamTransportProtocolWrapper *)self value];

  return [(HAPDataStreamTransportProtocolWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  unint64_t v3 = [(HAPDataStreamTransportProtocolWrapper *)self value];

  return HAPTLVWriteUInt64(v3);
}

- (HAPDataStreamTransportProtocolWrapper)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPDataStreamTransportProtocolWrapper;
  result = [(HAPDataStreamTransportProtocolWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

@end