@interface UARPDeploymentRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeploymentAllowed:(id *)a3;
- (BOOL)isDeploymentAllowedPerCountryList;
- (BOOL)isDeploymentAllowedPerDeploymentLimit;
- (BOOL)isDeploymentAllowedPerGoLiveDate;
- (BOOL)isDeploymentAllowedPerRampPeriod;
- (UARPDeploymentRule)initWithCoder:(id)a3;
- (UARPDeploymentRule)initWithConfig:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentDay;
- (id)deploymentPercent;
- (id)description;
- (id)testSerialNumber;
- (void)calculateDeploymentDay;
- (void)calculateDeploymentPercent;
- (void)createSerialNumber;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDeploymentDay:(id)a3;
- (void)setDeploymentPercent:(id)a3;
- (void)setTestSerialNumber:(id)a3;
@end

@implementation UARPDeploymentRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPDeploymentRule)initWithConfig:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rampPeriod];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 deploymentLimit];

    if (v7) {
      goto LABEL_12;
    }
  }
  v8 = [v4 rampPeriod];

  if (v8)
  {
    v9 = [v4 rampPeriod];
    int v10 = [v9 unsignedIntValue];

    if (v10 != 7 && v10 != 28)
    {
LABEL_12:
      v33 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v11 = [v4 deploymentLimit];

    if (v11)
    {
      v12 = [v4 deploymentLimit];
      int v13 = [v12 unsignedIntValue];

      if ((v13 - 1) > 0x62) {
        goto LABEL_12;
      }
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)UARPDeploymentRule;
  v14 = [(UARPDeploymentRule *)&v35 init];
  if (v14)
  {
    v15 = [v4 goLiveDate];
    uint64_t v16 = [v15 copy];
    goLiveDate = v14->_goLiveDate;
    v14->_goLiveDate = (NSDate *)v16;

    v18 = [v4 countryList];
    uint64_t v19 = [v18 copy];
    countryList = v14->_countryList;
    v14->_countryList = (NSArray *)v19;

    v21 = [v4 rampPeriod];
    uint64_t v22 = [v21 copy];
    rampPeriod = v14->_rampPeriod;
    v14->_rampPeriod = (NSNumber *)v22;

    v24 = [v4 deploymentLimit];
    uint64_t v25 = [v24 copy];
    deploymentLimit = v14->_deploymentLimit;
    v14->_deploymentLimit = (NSNumber *)v25;

    os_log_t v27 = os_log_create("com.apple.accessoryupdater.uarp", "deployment");
    log = v14->_log;
    v14->_log = (OS_os_log *)v27;

    v29 = [MEMORY[0x263F41768] sharedConfiguration];
    v30 = [v29 countryCode];
    uint64_t v31 = [v30 copy];
    currentISOCountryCode = v14->_currentISOCountryCode;
    v14->_currentISOCountryCode = (NSString *)v31;
  }
  self = v14;
  v33 = self;
LABEL_13:

  return v33;
}

- (UARPDeploymentRule)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UARPDeploymentRule;
  uint64_t v5 = [(UARPDeploymentRule *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"goLiveDate"];
    goLiveDate = v5->_goLiveDate;
    v5->_goLiveDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rampPeriod"];
    rampPeriod = v5->_rampPeriod;
    v5->_rampPeriod = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deploymentLimit"];
    deploymentLimit = v5->_deploymentLimit;
    v5->_deploymentLimit = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"countryList"];
    countryList = v5->_countryList;
    v5->_countryList = (NSArray *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  goLiveDate = self->_goLiveDate;
  id v5 = a3;
  [v5 encodeObject:goLiveDate forKey:@"goLiveDate"];
  [v5 encodeObject:self->_countryList forKey:@"countryList"];
  [v5 encodeObject:self->_rampPeriod forKey:@"rampPeriod"];
  [v5 encodeObject:self->_deploymentLimit forKey:@"deploymentLimit"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UARPDeploymentRule);
  objc_storeStrong((id *)&v4->_goLiveDate, self->_goLiveDate);
  objc_storeStrong((id *)&v4->_countryList, self->_countryList);
  objc_storeStrong((id *)&v4->_rampPeriod, self->_rampPeriod);
  objc_storeStrong((id *)&v4->_deploymentLimit, self->_deploymentLimit);
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: goLiveDate=%@, countryList=%@, rampPeriod=%@, deploymentLimit=%@>", v5, self->_goLiveDate, self->_countryList, self->_rampPeriod, self->_deploymentLimit];

  return v6;
}

- (void)setTestSerialNumber:(id)a3
{
  self->_testSerialNumber = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)testSerialNumber
{
  return self->_testSerialNumber;
}

- (void)setDeploymentDay:(id)a3
{
}

- (id)deploymentDay
{
  return self->_deploymentDay;
}

- (void)setDeploymentPercent:(id)a3
{
}

- (id)deploymentPercent
{
  return self->_deploymentPercent;
}

- (BOOL)isDeploymentAllowed:(id *)a3
{
  [(UARPDeploymentRule *)self createSerialNumber];
  [(UARPDeploymentRule *)self calculateDeploymentDay];
  [(UARPDeploymentRule *)self calculateDeploymentPercent];
  if ((!self->_goLiveDate
     || [(UARPDeploymentRule *)self isDeploymentAllowedPerGoLiveDate])
    && (![(NSArray *)self->_countryList count]
     || [(UARPDeploymentRule *)self isDeploymentAllowedPerCountryList])
    && (!self->_rampPeriod
     || [(UARPDeploymentRule *)self isDeploymentAllowedPerRampPeriod])
    && (!self->_deploymentLimit
     || [(UARPDeploymentRule *)self isDeploymentAllowedPerDeploymentLimit]))
  {
    return 1;
  }
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.uarp" code:6 userInfo:0];
  *a3 = v6;

  return 0;
}

- (BOOL)isDeploymentAllowedPerCountryList
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_currentISOCountryCode)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      currentISOCountryCode = self->_currentISOCountryCode;
      int v10 = 136315394;
      v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
      __int16 v12 = 2112;
      int v13 = currentISOCountryCode;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Current location unknown %@", (uint8_t *)&v10, 0x16u);
    }
    if (!self->_currentISOCountryCode) {
      return 0;
    }
  }
  BOOL v5 = -[NSArray containsObject:](self->_countryList, "containsObject:");
  id v6 = self->_log;
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v7)
    {
      int v10 = 136315138;
      v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
      _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, "%s: Device not in country list, deployment not allowed", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  if (!v7) {
    return 1;
  }
  int v10 = 136315138;
  v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
  BOOL v8 = 1;
  _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, "%s: Device is in country list", (uint8_t *)&v10, 0xCu);
  return v8;
}

- (BOOL)isDeploymentAllowedPerGoLiveDate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  uint64_t v4 = [v3 compare:self->_goLiveDate];
  if (v4)
  {
    if (v4 == 1)
    {
      log = self->_log;
      BOOL v6 = 1;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        goLiveDate = self->_goLiveDate;
        int v13 = 136315650;
        uint64_t v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
        __int16 v15 = 2112;
        uint64_t v16 = goLiveDate;
        __int16 v17 = 2112;
        objc_super v18 = v3;
        BOOL v8 = "%s: GoLive %@ date in past (today: %@), deployment allowed";
LABEL_7:
        _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      int v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_goLiveDate;
        int v13 = 136315650;
        uint64_t v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        objc_super v18 = v3;
        _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "%s: GoLive date (%@) in future (today: %@), deployment not allowed", (uint8_t *)&v13, 0x20u);
      }
      BOOL v6 = 0;
    }
  }
  else
  {
    log = self->_log;
    BOOL v6 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v9 = self->_goLiveDate;
      int v13 = 136315650;
      uint64_t v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      objc_super v18 = v3;
      BOOL v8 = "%s: GoLive %@ date today (today: %@), deployment allowed";
      goto LABEL_7;
    }
  }

  return v6;
}

- (BOOL)isDeploymentAllowedPerRampPeriod
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  time_t v12 = 0;
  time(&v12);
  v3 = localtime(&v12);
  deploymentDay = self->_deploymentDay;
  if (!deploymentDay) {
    return 0;
  }
  unsigned int v5 = [(NSNumber *)deploymentDay unsignedIntValue];
  int tm_wday = v3->tm_wday;
  log = self->_log;
  BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (tm_wday != v5)
  {
    if (v8)
    {
      int v10 = v3->tm_wday;
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[UARPDeploymentRule isDeploymentAllowedPerRampPeriod]";
      __int16 v15 = 1024;
      unsigned int v16 = v10;
      __int16 v17 = 1024;
      unsigned int v18 = v5;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Cannot apply update today is Day %d and this device can only do Ramped Updates on Day %d", buf, 0x18u);
    }
    return 0;
  }
  if (!v8) {
    return 1;
  }
  *(_DWORD *)buf = 136315394;
  uint64_t v14 = "-[UARPDeploymentRule isDeploymentAllowedPerRampPeriod]";
  __int16 v15 = 1024;
  unsigned int v16 = v5;
  BOOL v9 = 1;
  _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Today is the day for Ramped Updates: Day %d", buf, 0x12u);
  return v9;
}

- (BOOL)isDeploymentAllowedPerDeploymentLimit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_deploymentPercent) {
    return 0;
  }
  unsigned int v3 = [(NSNumber *)self->_deploymentLimit unsignedIntValue];
  unsigned int v4 = [(NSNumber *)self->_deploymentPercent unsignedIntValue];
  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v4 > v3)
  {
    if (v6)
    {
      int v9 = 136315650;
      int v10 = "-[UARPDeploymentRule isDeploymentAllowedPerDeploymentLimit]";
      __int16 v11 = 1024;
      unsigned int v12 = v3;
      __int16 v13 = 1024;
      unsigned int v14 = v4;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Device cannot apply metered rollout as it doesn't fall under %d percent. Device is %d percent.", (uint8_t *)&v9, 0x18u);
    }
    return 0;
  }
  if (!v6) {
    return 1;
  }
  int v9 = 136315394;
  int v10 = "-[UARPDeploymentRule isDeploymentAllowedPerDeploymentLimit]";
  __int16 v11 = 1024;
  unsigned int v12 = v4;
  BOOL v7 = 1;
  _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: Device can apply metered rollout, %d percent.", (uint8_t *)&v9, 0x12u);
  return v7;
}

- (void)calculateDeploymentDay
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_serialNumber)
  {
    rampPeriod = self->_rampPeriod;
    if (rampPeriod)
    {
      unsigned int v4 = [(NSNumber *)rampPeriod unsignedIntValue];
      unsigned int v5 = [(NSString *)self->_serialNumber UTF8String];
      NSUInteger v6 = [(NSString *)self->_serialNumber length];
      for (unint64_t i = 0; v6; --v6)
      {
        uint64_t v8 = *v5++;
        i += v8;
      }
      unint64_t v9 = i % v4;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        unsigned int v14 = "-[UARPDeploymentRule calculateDeploymentDay]";
        __int16 v15 = 1024;
        int v16 = v9;
        _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: deployDay = %d", (uint8_t *)&v13, 0x12u);
      }
      __int16 v11 = [NSNumber numberWithUnsignedInt:v9];
      deploymentDay = self->_deploymentDay;
      self->_deploymentDay = v11;
    }
  }
}

- (void)calculateDeploymentPercent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    unsigned int v4 = [(NSString *)serialNumber UTF8String];
    NSUInteger v5 = [(NSString *)self->_serialNumber length];
    if (v5)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 3;
      do
      {
        uint64_t v8 = *v4++;
        v6 += v8;
        v7 *= v8;
        --v5;
      }
      while (v5);
      unint64_t v9 = v7 % 0xA + 10 * (v6 % 0xA);
    }
    else
    {
      unint64_t v9 = 3;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      unsigned int v14 = "-[UARPDeploymentRule calculateDeploymentPercent]";
      __int16 v15 = 1024;
      int v16 = v9;
      _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: deployPercent = %d", (uint8_t *)&v13, 0x12u);
    }
    __int16 v11 = [NSNumber numberWithUnsignedInt:v9];
    deploymentPercent = self->_deploymentPercent;
    self->_deploymentPercent = v11;
  }
}

- (void)createSerialNumber
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  testSerialNumber = self->_testSerialNumber;
  if (testSerialNumber)
  {
    p_serialNumber = &self->_serialNumber;
    objc_storeStrong((id *)&self->_serialNumber, testSerialNumber);
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO)) {
      return;
    }
    unint64_t v6 = *p_serialNumber;
    int v13 = 136315394;
    unsigned int v14 = "-[UARPDeploymentRule createSerialNumber]";
    __int16 v15 = 2112;
    int v16 = v6;
    unint64_t v7 = "%s: Using %@ provided by user as seed";
    uint64_t v8 = log;
    uint32_t v9 = 22;
  }
  else
  {
    int v10 = (NSString *)MGCopyAnswer();
    serialNumber = self->_serialNumber;
    self->_serialNumber = v10;

    unsigned int v12 = self->_log;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v13 = 136315138;
    unsigned int v14 = "-[UARPDeploymentRule createSerialNumber]";
    unint64_t v7 = "%s: Using device serial number as seed";
    uint64_t v8 = v12;
    uint32_t v9 = 12;
  }
  _os_log_impl(&dword_21E079000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, v9);
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [v6 appendWithTabDepth:a3 format:@"Deployment Rule:\n"];
  if (self->_currentISOCountryCode) {
    [v6 appendWithTabDepth:a3 + 1, @"Current Country Code: %@\n", self->_currentISOCountryCode format];
  }
  if (self->_goLiveDate) {
    [v6 appendWithTabDepth:a3 + 1, @"Go-Live Date: %@\n", self->_goLiveDate format];
  }
  if ([(NSArray *)self->_countryList count])
  {
    [v6 appendWithTabDepth:a3 + 1 format:@"Country List:"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_countryList;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 appendFormat:@" %@", *(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [v6 appendString:@"\n"];
  }
  if (self->_rampPeriod) {
    [v6 appendWithTabDepth:a3 + 1, @"Ramp Period: %@\n", self->_rampPeriod format];
  }
  if (self->_deploymentLimit) {
    [v6 appendWithTabDepth:a3 + 1, @"Deployment Limit: %@\n", self->_deploymentLimit format];
  }
  if (self->_deploymentPercent) {
    [v6 appendWithTabDepth:a3 + 1, @"Deployment Percent: %@\n", self->_deploymentPercent format];
  }
  if (self->_deploymentDay) {
    [v6 appendWithTabDepth:a3 + 1, @"Deployment Day: %@\n", self->_deploymentDay format];
  }
  if (self->_serialNumber) {
    [v6 appendWithTabDepth:a3 + 1, @"Serial Number: %@\n", self->_serialNumber format];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deploymentDay, 0);
  objc_storeStrong((id *)&self->_deploymentPercent, 0);
  objc_storeStrong((id *)&self->_testSerialNumber, 0);
  objc_storeStrong((id *)&self->_deploymentLimit, 0);
  objc_storeStrong((id *)&self->_rampPeriod, 0);
  objc_storeStrong((id *)&self->_countryList, 0);
  objc_storeStrong((id *)&self->_goLiveDate, 0);
  objc_storeStrong((id *)&self->_currentISOCountryCode, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end