@interface HMDSleepConfigurationOperationStatusWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDSleepConfigurationOperationStatusWrapper)init;
- (HMDSleepConfigurationOperationStatusWrapper)initWithValue:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation HMDSleepConfigurationOperationStatusWrapper

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (int64_t)value
{
  return self->_value;
}

- (NSString)description
{
  v2 = NSString;
  v3 = HMDSleepConfigurationOperationStatusAsString([(HMDSleepConfigurationOperationStatusWrapper *)self value]);
  v4 = [v2 stringWithFormat:@"<HMDSleepConfigurationOperationStatusWrapper value=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSleepConfigurationOperationStatusWrapper *)a3;
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
      int64_t v6 = [(HMDSleepConfigurationOperationStatusWrapper *)self value];
      uint64_t v7 = [(HMDSleepConfigurationOperationStatusWrapper *)v5 value];

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
  v4 = +[HMDSleepConfigurationOperationStatusWrapper allocWithZone:a3];
  int64_t v5 = [(HMDSleepConfigurationOperationStatusWrapper *)self value];
  return [(HMDSleepConfigurationOperationStatusWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDSleepConfigurationOperationStatusWrapper *)self value];
  return (id)MEMORY[0x1F4113D68](v3);
}

- (BOOL)parseFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = v6;
    [v7 bytes];
    [v7 length];
    BOOL v8 = 1;
    [(HMDSleepConfigurationOperationStatusWrapper *)self setValue:HAPTLVParseUInt64()];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:0];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (HMDSleepConfigurationOperationStatusWrapper)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDSleepConfigurationOperationStatusWrapper;
  result = [(HMDSleepConfigurationOperationStatusWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (HMDSleepConfigurationOperationStatusWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSleepConfigurationOperationStatusWrapper;
  result = [(HMDSleepConfigurationOperationStatusWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSleepConfigurationOperationStatusWrapper);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSleepConfigurationOperationStatusWrapper *)v6 parseFromData:v5 error:&v10];
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

@end