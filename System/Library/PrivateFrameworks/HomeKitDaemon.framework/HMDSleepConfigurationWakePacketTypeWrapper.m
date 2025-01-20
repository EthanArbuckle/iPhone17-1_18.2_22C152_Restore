@interface HMDSleepConfigurationWakePacketTypeWrapper
+ (id)parsedFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)parseFromData:(id)a3 error:(id *)a4;
- (HMDSleepConfigurationWakePacketTypeWrapper)init;
- (HMDSleepConfigurationWakePacketTypeWrapper)initWithValue:(int64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithError:(id *)a3;
- (int64_t)value;
- (void)setValue:(int64_t)a3;
@end

@implementation HMDSleepConfigurationWakePacketTypeWrapper

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
  int64_t v3 = [(HMDSleepConfigurationWakePacketTypeWrapper *)self value];
  if (v3 == 1)
  {
    v4 = @"HMDSleepConfigurationWakePacketTypeAccessoryConfiguredPacket";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDSleepConfigurationWakePacketType %ld", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v5 = [v2 stringWithFormat:@"<HMDSleepConfigurationWakePacketTypeWrapper value=%@>", v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSleepConfigurationWakePacketTypeWrapper *)a3;
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
      int64_t v6 = [(HMDSleepConfigurationWakePacketTypeWrapper *)self value];
      uint64_t v7 = [(HMDSleepConfigurationWakePacketTypeWrapper *)v5 value];

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
  v4 = +[HMDSleepConfigurationWakePacketTypeWrapper allocWithZone:a3];
  int64_t v5 = [(HMDSleepConfigurationWakePacketTypeWrapper *)self value];
  return [(HMDSleepConfigurationWakePacketTypeWrapper *)v4 initWithValue:v5];
}

- (id)serializeWithError:(id *)a3
{
  int64_t v3 = [(HMDSleepConfigurationWakePacketTypeWrapper *)self value];
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
    [(HMDSleepConfigurationWakePacketTypeWrapper *)self setValue:HAPTLVParseUInt64()];
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

- (HMDSleepConfigurationWakePacketTypeWrapper)initWithValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDSleepConfigurationWakePacketTypeWrapper;
  result = [(HMDSleepConfigurationWakePacketTypeWrapper *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (HMDSleepConfigurationWakePacketTypeWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDSleepConfigurationWakePacketTypeWrapper;
  result = [(HMDSleepConfigurationWakePacketTypeWrapper *)&v3 init];
  if (result) {
    result->_value = 0;
  }
  return result;
}

+ (id)parsedFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HMDSleepConfigurationWakePacketTypeWrapper);
  id v7 = v6;
  if (v6)
  {
    id v10 = 0;
    [(HMDSleepConfigurationWakePacketTypeWrapper *)v6 parseFromData:v5 error:&v10];
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