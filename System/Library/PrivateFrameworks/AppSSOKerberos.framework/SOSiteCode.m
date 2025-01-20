@interface SOSiteCode
+ (BOOL)supportsSecureCoding;
- (NSDate)timeStamp;
- (NSString)code;
- (NSString)networkFingerprint;
- (SOSiteCode)initWithCoder:(id)a3;
- (SOSiteCode)initWithSiteCode:(id)a3 forNetworkFingerprint:(id)a4;
- (double)age;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOSiteCode

- (SOSiteCode)initWithSiteCode:(id)a3 forNetworkFingerprint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SOSiteCode;
  v9 = [(SOSiteCode *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_code, a3);
    objc_storeStrong((id *)&v10->_networkFingerprint, a4);
    uint64_t v11 = [MEMORY[0x263EFF910] date];
    timeStamp = v10->_timeStamp;
    v10->_timeStamp = (NSDate *)v11;
  }
  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v3 setFormatOptions:1907];
  v4 = [(SOSiteCode *)self timeStamp];
  v5 = [v3 stringFromDate:v4];

  v6 = NSString;
  id v7 = [(SOSiteCode *)self networkFingerprint];
  id v8 = [(SOSiteCode *)self code];
  v9 = [v6 stringWithFormat:@"%@, %@, %@", v7, v8, v5];

  return v9;
}

- (double)age
{
  id v3 = [MEMORY[0x263EFF910] date];
  v4 = [(SOSiteCode *)self timeStamp];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOSiteCode)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SOSiteCode;
  double v5 = [(SOSiteCode *)&v25 init];
  if (v5)
  {
    double v6 = NSStringFromSelector(sel_code);
    int v7 = [v4 containsValueForKey:v6];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      v9 = NSStringFromSelector(sel_code);
      uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
      code = v5->_code;
      v5->_code = (NSString *)v10;
    }
    v12 = NSStringFromSelector(sel_timeStamp);
    int v13 = [v4 containsValueForKey:v12];

    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      v15 = NSStringFromSelector(sel_timeStamp);
      uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
      timeStamp = v5->_timeStamp;
      v5->_timeStamp = (NSDate *)v16;
    }
    v18 = NSStringFromSelector(sel_networkFingerprint);
    int v19 = [v4 containsValueForKey:v18];

    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      v21 = NSStringFromSelector(sel_networkFingerprint);
      uint64_t v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
      networkFingerprint = v5->_networkFingerprint;
      v5->_networkFingerprint = (NSString *)v22;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  code = self->_code;
  id v5 = a3;
  double v6 = NSStringFromSelector(sel_code);
  [v5 encodeObject:code forKey:v6];

  timeStamp = self->_timeStamp;
  uint64_t v8 = NSStringFromSelector(sel_timeStamp);
  [v5 encodeObject:timeStamp forKey:v8];

  networkFingerprint = self->_networkFingerprint;
  NSStringFromSelector(sel_networkFingerprint);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:networkFingerprint forKey:v10];
}

- (NSString)code
{
  return self->_code;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (NSString)networkFingerprint
{
  return self->_networkFingerprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkFingerprint, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end