@interface HMDAccessoryNetworkAccessViolation
+ (BOOL)supportsSecureCoding;
+ (id)noViolation;
- (BOOL)hasCurrentViolation;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryNetworkAccessViolation)initWithCoder:(id)a3;
- (HMDAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4;
- (HMDAccessoryNetworkAccessViolation)initWithLastViolationTimeInterval:(id)a3 lastViolationResetTimeInterval:(id)a4;
- (NSDate)lastResetDate;
- (NSDate)lastViolationDate;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryNetworkAccessViolation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_lastViolationDate, 0);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)lastViolationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryNetworkAccessViolation *)self lastViolationDate];
  v5 = (void *)[v3 initWithName:@"lastViolationDate" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];
  v8 = (void *)[v6 initWithName:@"lastResetDate" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (!objc_msgSend(v6, "hmd_isForXPCTransport")
    || objc_msgSend(v6, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    v4 = [(HMDAccessoryNetworkAccessViolation *)self lastViolationDate];
    [v6 encodeObject:v4 forKey:*MEMORY[0x263F0B3D0]];

    v5 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];
    [v6 encodeObject:v5 forKey:*MEMORY[0x263F0B3D8]];
  }
}

- (HMDAccessoryNetworkAccessViolation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B3D0]];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B3D8]];

  v7 = [(HMDAccessoryNetworkAccessViolation *)self initWithLastViolationDate:v5 lastViolationResetDate:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessoryNetworkAccessViolation *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6
      && ([(HMDAccessoryNetworkAccessViolation *)self lastViolationDate],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(HMDAccessoryNetworkAccessViolation *)v6 lastViolationDate],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      v10 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];
      v11 = [(HMDAccessoryNetworkAccessViolation *)v6 lastResetDate];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HMDAccessoryNetworkAccessViolation *)self lastViolationDate];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (HMDAccessoryNetworkAccessViolation)initWithLastViolationTimeInterval:(id)a3 lastViolationResetTimeInterval:(id)a4
{
  id v6 = a4;
  v7 = DateFromEpochInterval(a3);
  v8 = DateFromEpochInterval(v6);

  int v9 = [(HMDAccessoryNetworkAccessViolation *)self initWithLastViolationDate:v7 lastViolationResetDate:v8];
  return v9;
}

- (BOOL)hasCurrentViolation
{
  id v3 = [(HMDAccessoryNetworkAccessViolation *)self lastViolationDate];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];

  if (!v4) {
    return 1;
  }
  v5 = [(HMDAccessoryNetworkAccessViolation *)self lastViolationDate];
  id v6 = [(HMDAccessoryNetworkAccessViolation *)self lastResetDate];
  BOOL v7 = [v5 compare:v6] == 1;

  return v7;
}

- (HMDAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryNetworkAccessViolation;
  int v9 = [(HMDAccessoryNetworkAccessViolation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastViolationDate, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)noViolation
{
  if (noViolation_onceToken != -1) {
    dispatch_once(&noViolation_onceToken, &__block_literal_global_104481);
  }
  v2 = (void *)noViolation_noViolation;
  return v2;
}

void __49__HMDAccessoryNetworkAccessViolation_noViolation__block_invoke()
{
  v0 = [[HMDAccessoryNetworkAccessViolation alloc] initWithLastViolationDate:0 lastViolationResetDate:0];
  v1 = (void *)noViolation_noViolation;
  noViolation_noViolation = (uint64_t)v0;
}

@end