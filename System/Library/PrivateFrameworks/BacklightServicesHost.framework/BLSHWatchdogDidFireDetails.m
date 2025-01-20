@interface BLSHWatchdogDidFireDetails
- (BLSHWatchdogDidFireDetails)initWithWatchdogDidFireDictionary:(id)a3;
- (BOOL)debugLogsEnabled;
- (NSDate)date;
- (NSString)abortReasonString;
- (NSString)buildVersion;
- (NSString)device;
- (NSString)explanation;
- (void)setAbortReasonString:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDate:(id)a3;
- (void)setDebugLogsEnabled:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setExplanation:(id)a3;
@end

@implementation BLSHWatchdogDidFireDetails

- (BLSHWatchdogDidFireDetails)initWithWatchdogDidFireDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BLSHWatchdogDidFireDetails;
  v5 = [(BLSHWatchdogDidFireDetails *)&v24 init];
  if (v5)
  {
    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"BLSHWatchdogDidFireDate", objc_opt_class());
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = [v4 objectForKeyedSubscript:@"BLSHWatchdogDidFireBuildVersion"];
    v8 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHWatchdogDidFireExplanation");
    v9 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHWatchdogDidFireAbortReason");
    v10 = objc_msgSend(v4, "bs_safeStringForKey:", @"BLSHWatchdogDidFireDeviceType");
    if ([v10 hasSuffix:@"AP"])
    {
      uint64_t v11 = [v10 substringToIndex:objc_msgSend(v10, "length") - objc_msgSend(@"AP", "length")];

      v10 = (void *)v11;
    }
    date = v5->_date;
    v5->_date = v6;
    v13 = v6;

    uint64_t v14 = [v7 copy];
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v16;

    uint64_t v18 = [v9 copy];
    abortReasonString = v5->_abortReasonString;
    v5->_abortReasonString = (NSString *)v18;

    uint64_t v20 = [v10 copy];
    device = v5->_device;
    v5->_device = (NSString *)v20;

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

- (NSString)abortReasonString
{
  return self->_abortReasonString;
}

- (void)setAbortReasonString:(id)a3
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
  objc_storeStrong((id *)&self->_abortReasonString, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end