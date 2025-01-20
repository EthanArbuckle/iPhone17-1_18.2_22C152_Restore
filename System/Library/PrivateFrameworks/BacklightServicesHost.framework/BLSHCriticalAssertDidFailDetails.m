@interface BLSHCriticalAssertDidFailDetails
- (BLSHCriticalAssertDidFailDetails)initWithCriticalAssertDidFailDictionary:(id)a3;
- (BOOL)debugLogsEnabled;
- (NSDate)date;
- (NSString)buildVersion;
- (NSString)device;
- (NSString)explanation;
- (NSString)processName;
- (void)setBuildVersion:(id)a3;
- (void)setDate:(id)a3;
- (void)setDebugLogsEnabled:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation BLSHCriticalAssertDidFailDetails

- (BLSHCriticalAssertDidFailDetails)initWithCriticalAssertDidFailDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BLSHCriticalAssertDidFailDetails;
  v5 = [(BLSHCriticalAssertDidFailDetails *)&v24 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"BLSHCriticalAssertDidFailDate", objc_opt_class());
    v7 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHCriticalAssertDidFailBuildVersion");
    v8 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHCriticalAssertDidFailDescription");
    v9 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHCriticalAssertDidFailProcess");
    v10 = (void *)MGCopyAnswer();
    v11 = (void *)[v10 copy];

    if ([v11 hasSuffix:@"AP"])
    {
      uint64_t v12 = [v11 substringToIndex:objc_msgSend(v11, "length") - objc_msgSend(@"AP", "length")];

      v11 = (void *)v12;
    }
    uint64_t v13 = [v6 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    uint64_t v15 = [v7 copy];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v15;

    uint64_t v17 = [v8 copy];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v17;

    uint64_t v19 = [v9 copy];
    processName = v5->_processName;
    v5->_processName = (NSString *)v19;

    device = v5->_device;
    v5->_device = (NSString *)v11;

    v22 = bls_backlight_log();
    v5->_debugLogsEnabled = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (BOOL)debugLogsEnabled
{
  return self->_debugLogsEnabled;
}

- (void)setDebugLogsEnabled:(BOOL)a3
{
  self->_debugLogsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end