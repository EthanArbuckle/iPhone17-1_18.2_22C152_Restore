@interface HDHealthServiceOOBInfo
- (HDHealthServiceOOBInfo)initWithOOBData:(id)a3 btAddress:(id)a4;
- (NSData)btAddress;
- (NSData)confirmationValue;
- (NSData)oobData;
- (NSData)randomValue;
- (id)description;
@end

@implementation HDHealthServiceOOBInfo

- (HDHealthServiceOOBInfo)initWithOOBData:(id)a3 btAddress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] != (char *)&stru_20.cmd + 2)
  {
    _HKInitializeLogging();
    v19 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_407D8((uint64_t)v7, v19);
    }
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)HDHealthServiceOOBInfo;
  v9 = [(HDHealthServiceOOBInfo *)&v22 init];
  self = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oobData, a3);
    sub_1B6A4((uint64_t)HDHealthServiceOOBInfo, v8);
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    btAddress = self->_btAddress;
    self->_btAddress = v10;

    __int16 v25 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    [v7 getBytes:&v23 length:34];
    if (v23 == 114 && BYTE1(v24) == 99)
    {
      v12 = +[NSData dataWithBytes:(char *)&v23 + 1 length:16];
      v13 = +[NSData dataWithBytes:(char *)&v24 + 2 length:16];
      sub_1B6A4((uint64_t)HDHealthServiceOOBInfo, v12);
      v14 = (NSData *)objc_claimAutoreleasedReturnValue();
      randomValue = self->_randomValue;
      self->_randomValue = v14;

      sub_1B6A4((uint64_t)HDHealthServiceOOBInfo, v13);
      v16 = (NSData *)objc_claimAutoreleasedReturnValue();
      confirmationValue = self->_confirmationValue;
      self->_confirmationValue = v16;

      goto LABEL_6;
    }
    _HKInitializeLogging();
    v20 = HKLogWorkouts;
    if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
      sub_407D8((uint64_t)v7, v20);
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
LABEL_6:
  self = self;
  v18 = self;
LABEL_12:

  return v18;
}

- (id)description
{
  v3 = [(HDHealthServiceOOBInfo *)self randomValue];
  v4 = [(HDHealthServiceOOBInfo *)self confirmationValue];
  v5 = [(HDHealthServiceOOBInfo *)self btAddress];
  v6 = +[NSString stringWithFormat:@"OOBInfo: randomValue=%@, confirmationValue=%@, btAddress=%@", v3, v4, v5];

  return v6;
}

- (NSData)oobData
{
  return self->_oobData;
}

- (NSData)randomValue
{
  return self->_randomValue;
}

- (NSData)confirmationValue
{
  return self->_confirmationValue;
}

- (NSData)btAddress
{
  return self->_btAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_confirmationValue, 0);
  objc_storeStrong((id *)&self->_randomValue, 0);

  objc_storeStrong((id *)&self->_oobData, 0);
}

@end