@interface HKHRAFibBurdenSevenDayAnalysisBreadcrumbs
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithAlarmFiredDate:(id)a3 xpcActivityFiredDate:(id)a4 maintenanceOperationRunDate:(id)a5 analysisStartedDate:(id)a6 tachogramsClassifiedDate:(id)a7 analysisEndedDate:(id)a8 analysisRetryLaterRequestedDate:(id)a9 lastAnalysisResultDate:(id)a10 lastAnalysisResultContext:(id)a11;
- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithCoder:(id)a3;
- (NSDate)alarmFiredDate;
- (NSDate)analysisEndedDate;
- (NSDate)analysisRetryLaterRequestedDate;
- (NSDate)analysisStartedDate;
- (NSDate)lastAnalysisResultDate;
- (NSDate)maintenanceOperationRunDate;
- (NSDate)tachogramsClassifiedDate;
- (NSDate)xpcActivityFiredDate;
- (NSString)lastAnalysisResultContext;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAlarmFiredDate:(id)a3;
- (void)setAnalysisEndedDate:(id)a3;
- (void)setAnalysisRetryLaterRequestedDate:(id)a3;
- (void)setAnalysisStartedDate:(id)a3;
- (void)setLastAnalysisResultContext:(id)a3;
- (void)setLastAnalysisResultDate:(id)a3;
- (void)setMaintenanceOperationRunDate:(id)a3;
- (void)setTachogramsClassifiedDate:(id)a3;
- (void)setXpcActivityFiredDate:(id)a3;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisBreadcrumbs

- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithAlarmFiredDate:(id)a3 xpcActivityFiredDate:(id)a4 maintenanceOperationRunDate:(id)a5 analysisStartedDate:(id)a6 tachogramsClassifiedDate:(id)a7 analysisEndedDate:(id)a8 analysisRetryLaterRequestedDate:(id)a9 lastAnalysisResultDate:(id)a10 lastAnalysisResultContext:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisBreadcrumbs;
  v19 = [(HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_alarmFiredDate, a3);
    objc_storeStrong((id *)&v20->_xpcActivityFiredDate, a4);
    objc_storeStrong((id *)&v20->_maintenanceOperationRunDate, a5);
    objc_storeStrong((id *)&v20->_analysisStartedDate, a6);
    objc_storeStrong((id *)&v20->_tachogramsClassifiedDate, a7);
    objc_storeStrong((id *)&v20->_analysisEndedDate, a8);
    objc_storeStrong((id *)&v20->_analysisRetryLaterRequestedDate, a9);
    objc_storeStrong((id *)&v20->_lastAnalysisResultDate, a10);
    objc_storeStrong((id *)&v20->_lastAnalysisResultContext, a11);
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(NSDate *)self->_alarmFiredDate isEqualToDate:v5->_alarmFiredDate]
        && [(NSDate *)self->_xpcActivityFiredDate isEqualToDate:v5->_xpcActivityFiredDate]
        && [(NSDate *)self->_maintenanceOperationRunDate isEqualToDate:v5->_maintenanceOperationRunDate]&& [(NSDate *)self->_analysisStartedDate isEqualToDate:v5->_analysisStartedDate]&& [(NSDate *)self->_tachogramsClassifiedDate isEqualToDate:v5->_tachogramsClassifiedDate]&& [(NSDate *)self->_analysisEndedDate isEqualToDate:v5->_analysisEndedDate]&& [(NSDate *)self->_analysisRetryLaterRequestedDate isEqualToDate:v5->_analysisRetryLaterRequestedDate]&& [(NSDate *)self->_lastAnalysisResultDate isEqualToDate:v5->_lastAnalysisResultDate]&& [(NSString *)self->_lastAnalysisResultContext isEqualToString:v5->_lastAnalysisResultContext];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_alarmFiredDate hash];
  uint64_t v4 = [(NSDate *)self->_xpcActivityFiredDate hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_maintenanceOperationRunDate hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_analysisStartedDate hash];
  uint64_t v7 = [(NSDate *)self->_tachogramsClassifiedDate hash];
  uint64_t v8 = v7 ^ [(NSDate *)self->_analysisEndedDate hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSDate *)self->_analysisRetryLaterRequestedDate hash];
  uint64_t v10 = [(NSDate *)self->_lastAnalysisResultDate hash];
  return v9 ^ v10 ^ [(NSString *)self->_lastAnalysisResultContext hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  alarmFiredDate = self->_alarmFiredDate;
  id v5 = a3;
  [v5 encodeObject:alarmFiredDate forKey:@"AlarmFiredDateKey"];
  [v5 encodeObject:self->_xpcActivityFiredDate forKey:@"XpcActivityFiredDateKey"];
  [v5 encodeObject:self->_maintenanceOperationRunDate forKey:@"MaintenanceOperationRunDateKey"];
  [v5 encodeObject:self->_analysisStartedDate forKey:@"AnalysisStartedDateKey"];
  [v5 encodeObject:self->_tachogramsClassifiedDate forKey:@"TachogramsClassifiedDateKey"];
  [v5 encodeObject:self->_analysisEndedDate forKey:@"AnalysisEndedDateKey"];
  [v5 encodeObject:self->_analysisRetryLaterRequestedDate forKey:@"AnalysisRetryLaterRequestedDateKey"];
  [v5 encodeObject:self->_lastAnalysisResultDate forKey:@"LastAnalysisResultDateKey"];
  [v5 encodeObject:self->_lastAnalysisResultContext forKey:@"LastAnalysisResultContextKey"];
}

- (HKHRAFibBurdenSevenDayAnalysisBreadcrumbs)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisBreadcrumbs;
  id v5 = [(HKHRAFibBurdenSevenDayAnalysisBreadcrumbs *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlarmFiredDateKey"];
    alarmFiredDate = v5->_alarmFiredDate;
    v5->_alarmFiredDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"XpcActivityFiredDateKey"];
    xpcActivityFiredDate = v5->_xpcActivityFiredDate;
    v5->_xpcActivityFiredDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MaintenanceOperationRunDateKey"];
    maintenanceOperationRunDate = v5->_maintenanceOperationRunDate;
    v5->_maintenanceOperationRunDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnalysisStartedDateKey"];
    analysisStartedDate = v5->_analysisStartedDate;
    v5->_analysisStartedDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TachogramsClassifiedDateKey"];
    tachogramsClassifiedDate = v5->_tachogramsClassifiedDate;
    v5->_tachogramsClassifiedDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnalysisEndedDateKey"];
    analysisEndedDate = v5->_analysisEndedDate;
    v5->_analysisEndedDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnalysisRetryLaterRequestedDateKey"];
    analysisRetryLaterRequestedDate = v5->_analysisRetryLaterRequestedDate;
    v5->_analysisRetryLaterRequestedDate = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastAnalysisResultDateKey"];
    lastAnalysisResultDate = v5->_lastAnalysisResultDate;
    v5->_lastAnalysisResultDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastAnalysisResultContextKey"];
    lastAnalysisResultContext = v5->_lastAnalysisResultContext;
    v5->_lastAnalysisResultContext = (NSString *)v22;
  }
  return v5;
}

- (NSDate)alarmFiredDate
{
  return self->_alarmFiredDate;
}

- (void)setAlarmFiredDate:(id)a3
{
}

- (NSDate)xpcActivityFiredDate
{
  return self->_xpcActivityFiredDate;
}

- (void)setXpcActivityFiredDate:(id)a3
{
}

- (NSDate)maintenanceOperationRunDate
{
  return self->_maintenanceOperationRunDate;
}

- (void)setMaintenanceOperationRunDate:(id)a3
{
}

- (NSDate)analysisStartedDate
{
  return self->_analysisStartedDate;
}

- (void)setAnalysisStartedDate:(id)a3
{
}

- (NSDate)tachogramsClassifiedDate
{
  return self->_tachogramsClassifiedDate;
}

- (void)setTachogramsClassifiedDate:(id)a3
{
}

- (NSDate)analysisEndedDate
{
  return self->_analysisEndedDate;
}

- (void)setAnalysisEndedDate:(id)a3
{
}

- (NSDate)analysisRetryLaterRequestedDate
{
  return self->_analysisRetryLaterRequestedDate;
}

- (void)setAnalysisRetryLaterRequestedDate:(id)a3
{
}

- (NSDate)lastAnalysisResultDate
{
  return self->_lastAnalysisResultDate;
}

- (void)setLastAnalysisResultDate:(id)a3
{
}

- (NSString)lastAnalysisResultContext
{
  return self->_lastAnalysisResultContext;
}

- (void)setLastAnalysisResultContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAnalysisResultContext, 0);
  objc_storeStrong((id *)&self->_lastAnalysisResultDate, 0);
  objc_storeStrong((id *)&self->_analysisRetryLaterRequestedDate, 0);
  objc_storeStrong((id *)&self->_analysisEndedDate, 0);
  objc_storeStrong((id *)&self->_tachogramsClassifiedDate, 0);
  objc_storeStrong((id *)&self->_analysisStartedDate, 0);
  objc_storeStrong((id *)&self->_maintenanceOperationRunDate, 0);
  objc_storeStrong((id *)&self->_xpcActivityFiredDate, 0);

  objc_storeStrong((id *)&self->_alarmFiredDate, 0);
}

@end