@interface HAPStagingNotReadyReasonsWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HAPStagingNotReadyReasonsWrapper)init;
- (HAPStagingNotReadyReasonsWrapper)initWithValue:(unint64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (unint64_t)value;
- (void)setValue:(unint64_t)a3;
@end

@implementation HAPStagingNotReadyReasonsWrapper

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (unint64_t)value
{
  return self->_value;
}

- (NSString)description
{
  v2 = NSString;
  v3 = HAPStagingNotReadyReasonsAsString([(HAPStagingNotReadyReasonsWrapper *)self value]);
  v4 = [v2 stringWithFormat:@"<HAPStagingNotReadyReasonsWrapper value=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HAPStagingNotReadyReasonsWrapper *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(HAPStagingNotReadyReasonsWrapper *)self value];
      uint64_t v7 = [(HAPStagingNotReadyReasonsWrapper *)v5 value];

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
  v4 = +[HAPStagingNotReadyReasonsWrapper allocWithZone:a3];
  unint64_t v5 = [(HAPStagingNotReadyReasonsWrapper *)self value];

  return [(HAPStagingNotReadyReasonsWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  unint64_t v3 = [(HAPStagingNotReadyReasonsWrapper *)self value];

  return HAPTLVWriteUInt64(v3);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    *a4 = 0;
    if (![v6 length])
    {
      BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
LABEL_10:
      BOOL v12 = 0;
      *a4 = v8;
      goto LABEL_15;
    }
  }
  else if (![v6 length])
  {
LABEL_11:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v9 = v7;
  v10 = (unsigned __int8 *)[v9 bytes];
  switch([v9 length])
  {
    case 1:
      uint64_t v11 = *v10;
      break;
    case 2:
      uint64_t v11 = *(unsigned __int16 *)v10;
      break;
    case 4:
      uint64_t v11 = *(unsigned int *)v10;
      break;
    case 8:
      uint64_t v11 = *(void *)v10;
      break;
    default:
      if (!a4) {
        goto LABEL_11;
      }
      BOOL v8 = HMErrorFromOSStatus(4294960553);
      goto LABEL_10;
  }
  [(HAPStagingNotReadyReasonsWrapper *)self setValue:v11];
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (HAPStagingNotReadyReasonsWrapper)initWithValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HAPStagingNotReadyReasonsWrapper;
  result = [(HAPStagingNotReadyReasonsWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (HAPStagingNotReadyReasonsWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HAPStagingNotReadyReasonsWrapper;
  result = [(HAPStagingNotReadyReasonsWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HAPStagingNotReadyReasonsWrapper);
  uint64_t v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HAPStagingNotReadyReasonsWrapper *)v6 parseFromData:v5 error:&v10];
    id v8 = v10;
    if (v8)
    {

      uint64_t v7 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return v7;
}

@end