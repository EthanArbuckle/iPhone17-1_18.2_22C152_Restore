@interface UARPUpdateFirmwareAnalyticsEventFrameworkParams
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)applyDuration;
- (NSNumber)applyStatus;
- (NSNumber)applyUserInitiated;
- (NSNumber)applyVendorError;
- (NSNumber)stagingDuration;
- (NSNumber)stagingIterations;
- (NSNumber)stagingStatus;
- (NSNumber)stagingUserInitiated;
- (NSNumber)stagingVendorError;
- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setApplyDuration:(id)a3;
- (void)setApplyStatus:(id)a3;
- (void)setApplyUserInitiated:(id)a3;
- (void)setApplyVendorError:(id)a3;
- (void)setStagingDuration:(id)a3;
- (void)setStagingIterations:(id)a3;
- (void)setStagingStatus:(id)a3;
- (void)setStagingUserInitiated:(id)a3;
- (void)setStagingVendorError:(id)a3;
@end

@implementation UARPUpdateFirmwareAnalyticsEventFrameworkParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UARPUpdateFirmwareAnalyticsEventFrameworkParams;
  v5 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingUserInitiated"];
    stagingUserInitiated = v5->_stagingUserInitiated;
    v5->_stagingUserInitiated = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingDuration"];
    stagingDuration = v5->_stagingDuration;
    v5->_stagingDuration = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingIterations"];
    stagingIterations = v5->_stagingIterations;
    v5->_stagingIterations = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingStatus"];
    stagingStatus = v5->_stagingStatus;
    v5->_stagingStatus = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stagingVendorError"];
    stagingVendorError = v5->_stagingVendorError;
    v5->_stagingVendorError = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyUserInitiated"];
    applyUserInitiated = v5->_applyUserInitiated;
    v5->_applyUserInitiated = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyDuration"];
    applyDuration = v5->_applyDuration;
    v5->_applyDuration = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyStatus"];
    applyStatus = v5->_applyStatus;
    v5->_applyStatus = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applyVendorError"];
    applyVendorError = v5->_applyVendorError;
    v5->_applyVendorError = (NSNumber *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  stagingUserInitiated = self->_stagingUserInitiated;
  id v5 = a3;
  [v5 encodeObject:stagingUserInitiated forKey:@"stagingUserInitiated"];
  [v5 encodeObject:self->_stagingDuration forKey:@"stagingDuration"];
  [v5 encodeObject:self->_stagingIterations forKey:@"stagingIterations"];
  [v5 encodeObject:self->_stagingStatus forKey:@"stagingStatus"];
  [v5 encodeObject:self->_stagingVendorError forKey:@"stagingVendorError"];
  [v5 encodeObject:self->_applyUserInitiated forKey:@"applyUserInitiated"];
  [v5 encodeObject:self->_applyDuration forKey:@"applyDuration"];
  [v5 encodeObject:self->_applyStatus forKey:@"applyStatus"];
  [v5 encodeObject:self->_applyVendorError forKey:@"applyVendorError"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPUpdateFirmwareAnalyticsEventFrameworkParams *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v25 = 1;
    }
    else
    {
      id v5 = v4;
      stagingUserInitiated = self->_stagingUserInitiated;
      v7 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 stagingUserInitiated];
      if (nullableObjectsEqual(stagingUserInitiated, (uint64_t)v7))
      {
        stagingDuration = self->_stagingDuration;
        v9 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 stagingDuration];
        if (nullableObjectsEqual(stagingDuration, (uint64_t)v9))
        {
          stagingIterations = self->_stagingIterations;
          v11 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 stagingIterations];
          if (nullableObjectsEqual(stagingIterations, (uint64_t)v11))
          {
            stagingStatus = self->_stagingStatus;
            v13 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 stagingStatus];
            if (nullableObjectsEqual(stagingStatus, (uint64_t)v13))
            {
              stagingVendorError = self->_stagingVendorError;
              v15 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 stagingVendorError];
              if (nullableObjectsEqual(stagingVendorError, (uint64_t)v15))
              {
                applyUserInitiated = self->_applyUserInitiated;
                v17 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 applyUserInitiated];
                if (nullableObjectsEqual(applyUserInitiated, (uint64_t)v17))
                {
                  applyDuration = self->_applyDuration;
                  uint64_t v19 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 applyDuration];
                  uint64_t v20 = applyDuration;
                  v21 = (void *)v19;
                  if (nullableObjectsEqual(v20, v19))
                  {
                    v28 = v21;
                    applyStatus = self->_applyStatus;
                    v27 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 applyStatus];
                    if (nullableObjectsEqual(applyStatus, (uint64_t)v27))
                    {
                      applyVendorError = self->_applyVendorError;
                      v24 = [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v5 applyVendorError];
                      char v25 = nullableObjectsEqual(applyVendorError, (uint64_t)v24);
                    }
                    else
                    {
                      char v25 = 0;
                    }
                    v21 = v28;
                  }
                  else
                  {
                    char v25 = 0;
                  }
                }
                else
                {
                  char v25 = 0;
                }
              }
              else
              {
                char v25 = 0;
              }
            }
            else
            {
              char v25 = 0;
            }
          }
          else
          {
            char v25 = 0;
          }
        }
        else
        {
          char v25 = 0;
        }
      }
      else
      {
        char v25 = 0;
      }
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"%@\n{\n", v5];

  stagingUserInitiated = self->_stagingUserInitiated;
  if (stagingUserInitiated)
  {
    if ([(NSNumber *)stagingUserInitiated BOOLValue]) {
      uint64_t v8 = "YES";
    }
    else {
      uint64_t v8 = "NO";
    }
    objc_msgSend(v6, "appendFormat:", @"\tStaging user initiated: %s\n", v8);
  }
  stagingDuration = self->_stagingDuration;
  if (stagingDuration) {
    objc_msgSend(v6, "appendFormat:", @"\tStaging duration: %lus\n", -[NSNumber unsignedIntegerValue](stagingDuration, "unsignedIntegerValue"));
  }
  stagingIterations = self->_stagingIterations;
  if (stagingIterations) {
    objc_msgSend(v6, "appendFormat:", @"\tStaging iterations: %lu\n", -[NSNumber unsignedIntegerValue](stagingIterations, "unsignedIntegerValue"));
  }
  stagingStatus = self->_stagingStatus;
  if (stagingStatus) {
    objc_msgSend(v6, "appendFormat:", @"\tStaging status: %s\n", UARPAnalyticsStagingStatusToString(-[NSNumber integerValue](stagingStatus, "integerValue")));
  }
  stagingVendorError = self->_stagingVendorError;
  if (stagingVendorError) {
    objc_msgSend(v6, "appendFormat:", @"\tStaging vendor error: %u\n", -[NSNumber unsignedIntValue](stagingVendorError, "unsignedIntValue"));
  }
  applyUserInitiated = self->_applyUserInitiated;
  if (applyUserInitiated)
  {
    if ([(NSNumber *)applyUserInitiated BOOLValue]) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    objc_msgSend(v6, "appendFormat:", @"\tApply user initiated: %s\n", v14);
  }
  applyDuration = self->_applyDuration;
  if (applyDuration) {
    objc_msgSend(v6, "appendFormat:", @"\tApply duration: %lus\n", -[NSNumber unsignedIntegerValue](applyDuration, "unsignedIntegerValue"));
  }
  applyStatus = self->_applyStatus;
  if (applyStatus) {
    objc_msgSend(v6, "appendFormat:", @"\tApply status: %s\n", UARPAnalyticsApplyStatusToString(-[NSNumber integerValue](applyStatus, "integerValue")));
  }
  applyVendorError = self->_applyVendorError;
  if (applyVendorError) {
    objc_msgSend(v6, "appendFormat:", @"\tApply vendor error: %u\n", -[NSNumber unsignedIntValue](applyVendorError, "unsignedIntValue"));
  }
  [v6 appendString:@"}"];
  uint64_t v18 = [NSString stringWithString:v6];

  return v18;
}

- (NSNumber)stagingUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStagingUserInitiated:(id)a3
{
}

- (NSNumber)stagingDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStagingDuration:(id)a3
{
}

- (NSNumber)stagingIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStagingIterations:(id)a3
{
}

- (NSNumber)stagingStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStagingStatus:(id)a3
{
}

- (NSNumber)stagingVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStagingVendorError:(id)a3
{
}

- (NSNumber)applyUserInitiated
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplyUserInitiated:(id)a3
{
}

- (NSNumber)applyDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplyDuration:(id)a3
{
}

- (NSNumber)applyStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setApplyStatus:(id)a3
{
}

- (NSNumber)applyVendorError
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setApplyVendorError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyVendorError, 0);
  objc_storeStrong((id *)&self->_applyStatus, 0);
  objc_storeStrong((id *)&self->_applyDuration, 0);
  objc_storeStrong((id *)&self->_applyUserInitiated, 0);
  objc_storeStrong((id *)&self->_stagingVendorError, 0);
  objc_storeStrong((id *)&self->_stagingStatus, 0);
  objc_storeStrong((id *)&self->_stagingIterations, 0);
  objc_storeStrong((id *)&self->_stagingDuration, 0);
  objc_storeStrong((id *)&self->_stagingUserInitiated, 0);
}

@end