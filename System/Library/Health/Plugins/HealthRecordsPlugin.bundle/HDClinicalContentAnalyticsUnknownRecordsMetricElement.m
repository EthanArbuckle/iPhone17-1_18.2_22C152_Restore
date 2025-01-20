@interface HDClinicalContentAnalyticsUnknownRecordsMetricElement
- (BOOL)isEqual:(id)a3;
- (HDClinicalContentAnalyticsUnknownRecordsMetricElement)initWithExtractionRulesVersion:(int64_t)a3 reportedHost:(id)a4 resourceType:(id)a5 propertyName:(id)a6 resourceKeyPath:(id)a7 failureCode:(int64_t)a8;
- (NSString)keyPath;
- (NSString)propertyName;
- (NSString)reportedHost;
- (NSString)resourceType;
- (id)debugDescription;
- (id)payloadForCoreAnalyticsWithEventCount:(id)a3 deviceContext:(id)a4;
- (int64_t)compare:(id)a3;
- (int64_t)extractionRulesVersion;
- (int64_t)failureCode;
- (unint64_t)hash;
@end

@implementation HDClinicalContentAnalyticsUnknownRecordsMetricElement

- (HDClinicalContentAnalyticsUnknownRecordsMetricElement)initWithExtractionRulesVersion:(int64_t)a3 reportedHost:(id)a4 resourceType:(id)a5 propertyName:(id)a6 resourceKeyPath:(id)a7 failureCode:(int64_t)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HDClinicalContentAnalyticsUnknownRecordsMetric.m", 148, @"Invalid parameter not satisfying: %@", @"host" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v30 = +[NSAssertionHandler currentHandler];
  [v30 handleFailureInMethod:a2, self, @"HDClinicalContentAnalyticsUnknownRecordsMetric.m", 149, @"Invalid parameter not satisfying: %@", @"resourceType" object file lineNumber description];

LABEL_3:
  v31.receiver = self;
  v31.super_class = (Class)HDClinicalContentAnalyticsUnknownRecordsMetricElement;
  v19 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)&v31 init];
  if (v19)
  {
    v20 = (NSString *)[v15 copy];
    reportedHost = v19->_reportedHost;
    v19->_reportedHost = v20;

    v22 = (NSString *)[v16 copy];
    resourceType = v19->_resourceType;
    v19->_resourceType = v22;

    v24 = (NSString *)[v17 copy];
    propertyName = v19->_propertyName;
    v19->_propertyName = v24;

    v26 = (NSString *)[v18 copy];
    keyPath = v19->_keyPath;
    v19->_keyPath = v26;

    v19->_failureCode = a8;
    v19->_extractionRulesVersion = a3;
  }

  return v19;
}

- (id)payloadForCoreAnalyticsWithEventCount:(id)a3 deviceContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"countPairediPad"];
  v10 = (void *)v9;
  if (v9) {
    v11 = (_UNKNOWN **)v9;
  }
  else {
    v11 = &off_11D2A8;
  }
  v31[0] = v11;
  v30[1] = @"countPairediPhone";
  uint64_t v12 = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13 = (void *)v12;
  if (v12) {
    v14 = (_UNKNOWN **)v12;
  }
  else {
    v14 = &off_11D2A8;
  }
  v31[1] = v14;
  v30[2] = @"countPairedWatch";
  uint64_t v15 = objc_msgSend(v7, "objectForKeyedSubscript:");
  id v16 = (void *)v15;
  if (v15) {
    id v17 = (_UNKNOWN **)v15;
  }
  else {
    id v17 = &off_11D2A8;
  }
  v31[2] = v17;
  v30[3] = @"countPairedVisionPro";
  objc_msgSend(v7, "objectForKeyedSubscript:");
  id v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();

  if (v18) {
    v19 = v18;
  }
  else {
    v19 = &off_11D2A8;
  }
  v31[3] = v19;
  v31[4] = v6;
  v30[4] = @"extractionFailureEventCount";
  v30[5] = @"extractionRulesVersion";
  v20 = +[NSNumber numberWithInteger:self->_extractionRulesVersion];
  v31[5] = v20;
  v30[6] = @"failureCode";
  v21 = NSStringFromHDClinicalAnalyticsExtractionFailureCode();
  reportedHost = self->_reportedHost;
  resourceType = self->_resourceType;
  v31[6] = v21;
  v31[7] = reportedHost;
  v30[7] = @"host";
  v30[8] = @"resourceType";
  v31[8] = resourceType;
  v24 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:9];
  id v25 = [v8 initWithDictionary:v24];

  propertyName = self->_propertyName;
  if (propertyName) {
    [v25 setObject:propertyName forKeyedSubscript:@"propertyName"];
  }
  keyPath = self->_keyPath;
  if (keyPath) {
    [v25 setObject:keyPath forKeyedSubscript:@"resourceKeyPath"];
  }
  id v28 = [v25 copy];

  return v28;
}

- (unint64_t)hash
{
  int64_t extractionRulesVersion = self->_extractionRulesVersion;
  unint64_t v4 = [(NSString *)self->_reportedHost hash] ^ extractionRulesVersion;
  NSUInteger v5 = [(NSString *)self->_resourceType hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_keyPath hash];
  return v6 ^ [(NSString *)self->_propertyName hash] ^ self->_failureCode;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HDClinicalContentAnalyticsUnknownRecordsMetricElement *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      if (self->_extractionRulesVersion != v5->_extractionRulesVersion) {
        goto LABEL_19;
      }
      reportedHost = self->_reportedHost;
      id v7 = v5->_reportedHost;
      if (reportedHost != v7 && (!v7 || !-[NSString isEqual:](reportedHost, "isEqual:"))) {
        goto LABEL_19;
      }
      if (((resourceType = self->_resourceType, uint64_t v9 = v5->_resourceType, resourceType == v9)
         || v9 && -[NSString isEqualToString:](resourceType, "isEqualToString:"))
        && ((keyPath = self->_keyPath, v11 = v5->_keyPath, keyPath == v11)
         || v11 && -[NSString isEqualToString:](keyPath, "isEqualToString:"))
        && ((propertyName = self->_propertyName, v13 = v5->_propertyName, propertyName == v13)
         || v13 && -[NSString isEqualToString:](propertyName, "isEqualToString:")))
      {
        char v14 = self->_failureCode == v5->_failureCode;
      }
      else
      {
LABEL_19:
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (int64_t)compare:(id)a3
{
  unint64_t v4 = a3;
  NSUInteger v5 = +[NSNumber numberWithInteger:self->_extractionRulesVersion];
  unint64_t v6 = +[NSNumber numberWithInteger:v4[1]];
  NSComparisonResult v7 = (NSComparisonResult)[v5 compare:v6];

  if (v7 == NSOrderedSame)
  {
    NSComparisonResult v7 = [(NSString *)self->_resourceType compare:v4[3]];
    if (v7 == NSOrderedSame)
    {
      propertyName = self->_propertyName;
      uint64_t v10 = v4[4];
      if (propertyName)
      {
        if (!v10) {
          goto LABEL_13;
        }
        NSComparisonResult v7 = -[NSString compare:](propertyName, "compare:");
        if (v7) {
          goto LABEL_3;
        }
      }
      else if (v10)
      {
        goto LABEL_15;
      }
      keyPath = self->_keyPath;
      uint64_t v12 = v4[5];
      if (keyPath)
      {
        if (v12)
        {
          NSComparisonResult v7 = -[NSString compare:](keyPath, "compare:");
          if (v7) {
            goto LABEL_3;
          }
LABEL_16:
          v13 = +[NSNumber numberWithInteger:self->_failureCode];
          char v14 = +[NSNumber numberWithInteger:v4[6]];
          NSComparisonResult v7 = (NSComparisonResult)[v13 compare:v14];

          goto LABEL_3;
        }
LABEL_13:
        NSComparisonResult v7 = NSOrderedDescending;
        goto LABEL_3;
      }
      if (!v12) {
        goto LABEL_16;
      }
LABEL_15:
      NSComparisonResult v7 = NSOrderedAscending;
    }
  }
LABEL_3:

  return v7;
}

- (id)debugDescription
{
  int64_t v3 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self extractionRulesVersion];
  unint64_t v4 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self reportedHost];
  NSUInteger v5 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self resourceType];
  unint64_t v6 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self propertyName];
  NSComparisonResult v7 = [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self keyPath];
  [(HDClinicalContentAnalyticsUnknownRecordsMetricElement *)self failureCode];
  id v8 = NSStringFromHDClinicalAnalyticsExtractionFailureCode();
  uint64_t v9 = +[NSString stringWithFormat:@"(%ld, %@, %@, %@, %@, %@)", v3, v4, v5, v6, v7, v8];

  uint64_t v10 = +[NSString stringWithFormat:@"<%@ %p> %@", objc_opt_class(), self, v9];

  return v10;
}

- (int64_t)extractionRulesVersion
{
  return self->_extractionRulesVersion;
}

- (NSString)reportedHost
{
  return self->_reportedHost;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (int64_t)failureCode
{
  return self->_failureCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);

  objc_storeStrong((id *)&self->_reportedHost, 0);
}

@end