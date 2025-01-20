@interface BDSSecureEngagementData
+ (id)propertyIDKey;
- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4;
- (NSString)debugDescription;
- (id)mutableCopy;
- (id)recordType;
- (id)zoneName;
- (void)_configureFromEngagementData:(id)a3 withMergers:(id)a4;
- (void)configureFromCloudData:(id)a3 withMergers:(id)a4;
- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4;
@end

@implementation BDSSecureEngagementData

- (id)mutableCopy
{
  v3 = [BDSMutableSecureEngagementData alloc];
  return [(BDSMutableSecureEngagementData *)v3 initWithCloudData:self];
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5 = a4;
  v6 = BUProtocolCast();
  if (v6)
  {
    [(BDSSecureEngagementData *)self _configureFromEngagementData:v6 withMergers:v5];
  }
  else
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E9908();
    }
  }
}

- (void)_configureFromEngagementData:(id)a3 withMergers:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BDSSecureEngagementData;
  [(BCCloudData *)&v19 configureFromCloudData:v6 withMergers:a4];
  v7 = [v6 startTimestampString];
  [(BDSSecureEngagementData *)self setDifferentString:v7 forKey:@"startTimestampString"];

  [v6 durationInterval];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BDSSecureEngagementData *)self setDifferentNumber:v8 forKey:@"durationInterval"];

  v9 = [(BDSSecureEngagementData *)self value];
  v10 = [v6 value];
  v11 = +[BDSSecureEngagementDataHelper mergedTimeSliceDataLocal:v9 remote:v10];

  if (v11) {
    [(BDSSecureEngagementData *)self setDifferentObject:v11 forKey:@"value"];
  }
  v12 = [v6 value];
  [(BDSSecureEngagementData *)self setDifferentObject:v12 forKey:@"value"];

  v13 = +[BULogUtilities shared];
  unsigned int v14 = [v13 verboseLoggingEnabled];

  if (v14)
  {
    v15 = sub_10000CD80();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(BDSSecureEngagementData *)self startTimestampString];
      v17 = [(BDSSecureEngagementData *)self debugDescription];
      v18 = [v6 startTimestampString];
      *(_DWORD *)buf = 138412802;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "\"\\\"BDSSecureEngagementData configured: %@ %@ from engagementData:%@\\\"\"", buf, 0x20u);
    }
  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = BUProtocolCast();
  v20.receiver = self;
  v20.super_class = (Class)BDSSecureEngagementData;
  LOBYTE(v4) = [(BCCloudData *)&v20 isEqualExceptForDate:v6 ignoringEmptySalt:v4];
  v7 = [(BDSSecureEngagementData *)self startTimestampString];
  v8 = [v6 startTimestampString];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  [(BDSSecureEngagementData *)self durationInterval];
  double v11 = v10;
  [v6 durationInterval];
  double v13 = v12;
  unsigned int v14 = [(BDSSecureEngagementData *)self value];
  v15 = [v6 value];
  unsigned __int8 v16 = [v14 isEqual:v15];

  BOOL v17 = v4 & v9;
  if (v11 != v13) {
    BOOL v17 = 0;
  }
  BOOL v18 = v17 & v16;

  return v18;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BDSSecureEngagementData;
  [(BCCloudData *)&v43 resolveConflictsFromRecord:v6 withResolvers:a4];
  if (v6)
  {
    v7 = +[BCCloudData localIdentifierFromRecord:v6];
    v8 = [(BDSSecureEngagementData *)self startTimestampString];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      double v10 = sub_1000083A0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1001E99D4(self, (uint64_t)v7, v10);
      }

      [(BDSSecureEngagementData *)self setStartTimestampString:v7];
    }
    uint64_t v11 = [(BDSSecureEngagementData *)self modificationDate];
    if (v11)
    {
      double v12 = (void *)v11;
      double v13 = [(BDSSecureEngagementData *)self modificationDate];
      [v13 timeIntervalSinceReferenceDate];
      double v15 = v14;
      unsigned __int8 v16 = [v6 modificationDate];
      [v16 timeIntervalSinceReferenceDate];
      double v18 = v17;

      if (v15 > v18)
      {
        objc_super v19 = sub_1000083A0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_super v20 = [(BDSSecureEngagementData *)self startTimestampString];
          v21 = [v6 recordID];
          __int16 v22 = [v21 recordName];
          v23 = [(BDSSecureEngagementData *)self modificationDate];
          [v23 timeIntervalSinceReferenceDate];
          double v25 = v24;
          v26 = [v6 modificationDate];
          [v26 timeIntervalSinceReferenceDate];
          CFStringRef v27 = @"newer";
          *(_DWORD *)buf = 138412802;
          v45 = v20;
          if (v25 == v28) {
            CFStringRef v27 = @"the same";
          }
          __int16 v46 = 2112;
          v47 = v22;
          __int16 v48 = 2114;
          CFStringRef v49 = v27;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BDSSecureEngagementData %@ Resolving conflicts from record %@, keeping my properties as my modification date is %{public}@.", buf, 0x20u);
        }
        [(BCCloudData *)self incrementEditGeneration];
        goto LABEL_27;
      }
    }
    v29 = [v6 objectForKey:@"durationInterval"];
    [(BDSSecureEngagementData *)self setDifferentNumber:v29 forKey:@"durationInterval"];
    v30 = [v6 objectForKey:@"value"];
    v31 = [(BDSSecureEngagementData *)self value];
    v32 = +[BDSSecureEngagementDataHelper mergedTimeSliceDataLocal:v31 remote:v30];

    if (v32) {
      [(BDSSecureEngagementData *)self setDifferentObject:v32 forKey:@"value"];
    }
    v33 = [v6 modificationDate];
    [(BDSSecureEngagementData *)self setDifferentDate:v33 forKey:@"modificationDate"];
    unsigned int v34 = [(BDSSecureEngagementData *)self hasChanges];
    v35 = +[BULogUtilities shared];
    unsigned int v36 = [v35 verboseLoggingEnabled];

    if (v34)
    {
      if (v36)
      {
        v37 = sub_10000CD80();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = [(BDSSecureEngagementData *)self startTimestampString];
          v42 = [v6 recordID];
          v39 = [v42 recordName];
          v40 = [(BDSSecureEngagementData *)self debugDescription];
          *(_DWORD *)buf = 138412802;
          v45 = v38;
          __int16 v46 = 2112;
          v47 = v39;
          __int16 v48 = 2112;
          CFStringRef v49 = v40;
          v41 = "\"\\\"BDSSecureEngagementData %@ Resolving: Adopted properties from record: %@ %@\\\"\"";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v41, buf, 0x20u);

          goto LABEL_25;
        }
        goto LABEL_25;
      }
    }
    else if (v36)
    {
      v37 = sub_10000CD80();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(BDSSecureEngagementData *)self startTimestampString];
        v42 = [v6 recordID];
        v39 = [v42 recordName];
        v40 = [(BDSSecureEngagementData *)self debugDescription];
        *(_DWORD *)buf = 138412802;
        v45 = v38;
        __int16 v46 = 2112;
        v47 = v39;
        __int16 v48 = 2112;
        CFStringRef v49 = v40;
        v41 = "\"\\\"BDSSecureEngagementData %@ Resolving: Identical properties from record: %@ %@\\\"\"";
        goto LABEL_24;
      }
LABEL_25:
    }
    goto LABEL_27;
  }
  v7 = sub_1000083A0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001E993C(self, v7);
  }
LABEL_27:
}

- (id)recordType
{
  return @"SecureEngagement";
}

+ (id)propertyIDKey
{
  return @"startTimestampString";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (NSString)debugDescription
{
  v3 = [(BDSSecureEngagementData *)self startTimestampString];
  [(BDSSecureEngagementData *)self durationInterval];
  id v5 = +[NSString stringWithFormat:@"start timestamp: %@, duration: %.1lf", v3, v4];

  return (NSString *)v5;
}

@end