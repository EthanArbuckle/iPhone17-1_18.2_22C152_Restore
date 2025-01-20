@interface HMDSleepConfigurationOperationTypeWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDSleepConfigurationOperationTypeWrapper)init;
- (HMDSleepConfigurationOperationTypeWrapper)initWithValue:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation HMDSleepConfigurationOperationTypeWrapper

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
  v3 = HMDSleepConfigurationOperationTypeAsString([(HMDSleepConfigurationOperationTypeWrapper *)self value]);
  v4 = [v2 stringWithFormat:@"<HMDSleepConfigurationOperationTypeWrapper value=%@>", v3];

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSleepConfigurationOperationTypeWrapper *)a3;
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
      int64_t v6 = [(HMDSleepConfigurationOperationTypeWrapper *)self value];
      uint64_t v7 = [(HMDSleepConfigurationOperationTypeWrapper *)v5 value];

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
  v4 = +[HMDSleepConfigurationOperationTypeWrapper allocWithZone:a3];
  int64_t v5 = [(HMDSleepConfigurationOperationTypeWrapper *)self value];
  return [(HMDSleepConfigurationOperationTypeWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDSleepConfigurationOperationTypeWrapper *)self value];
  return (id)MEMORY[0x270F18D88](v3);
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
    [(HMDSleepConfigurationOperationTypeWrapper *)self setValue:HAPTLVParseUInt64()];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:3 userInfo:0];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (HMDSleepConfigurationOperationTypeWrapper)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDSleepConfigurationOperationTypeWrapper;
  result = [(HMDSleepConfigurationOperationTypeWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (HMDSleepConfigurationOperationTypeWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSleepConfigurationOperationTypeWrapper;
  result = [(HMDSleepConfigurationOperationTypeWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSleepConfigurationOperationTypeWrapper);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSleepConfigurationOperationTypeWrapper *)v6 parseFromData:v5 error:&v10];
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