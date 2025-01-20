@interface ANSTISPAlgorithmConfiguration
- (ANSTISPAlgorithmConfiguration)init;
- (ANSTISPAlgorithmConfiguration)initWithVersion:(unint64_t)a3;
- (BOOL)enableObjectTracking;
- (BOOL)enableSegmentation;
- (id)description;
- (int64_t)networkResolution;
- (int64_t)runningFrameRate;
- (void)setEnableObjectTracking:(BOOL)a3;
- (void)setEnableSegmentation:(BOOL)a3;
- (void)setNetworkResolution:(int64_t)a3;
- (void)setRunningFrameRate:(int64_t)a3;
@end

@implementation ANSTISPAlgorithmConfiguration

- (ANSTISPAlgorithmConfiguration)init
{
  return (ANSTISPAlgorithmConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTISPAlgorithmConfiguration)initWithVersion:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithmConfiguration;
  result = [(ANSTConfiguration *)&v4 initWithVersion:a3];
  if (result)
  {
    result->_enableObjectTracking = 1;
    result->_enableSegmentation = 1;
    result->_networkResolution = 0;
    result->_runningFrameRate = 0;
  }
  return result;
}

- (id)description
{
  objc_super v4 = NSString;
  uint64_t v5 = objc_msgSend_version(self, a2, v2);
  v6 = ANSTISPAlgorithmVersionToNSString(v5);
  int v9 = objc_msgSend_qualityOfService(self, v7, v8);
  int v10 = v9;
  if (v9 > 20)
  {
    switch(v9)
    {
      case 21:
        v11 = @"DEFAULT";
        goto LABEL_17;
      case 33:
        v11 = @"USER_INTERACTIVE";
        goto LABEL_17;
      case 25:
        v11 = @"USER_INITIATED";
        goto LABEL_17;
    }
  }
  else
  {
    switch(v9)
    {
      case 0:
        v11 = @"UNSPECIFIED";
        goto LABEL_17;
      case 9:
        v11 = @"BACKGROUND";
        goto LABEL_17;
      case 17:
        v11 = @"UTILITY";
        goto LABEL_17;
    }
  }
  v12 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    sub_246D99CAC(v10, v12);
  }

  v11 = @"UNEXPECTED_ENUM_VALUE";
LABEL_17:
  if (self->_enableObjectTracking) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (self->_enableSegmentation) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  int64_t networkResolution = self->_networkResolution;
  v16 = v14;
  v17 = v13;
  v18 = ANSTISPAlgorithmResolutionToNSString(networkResolution);
  v19 = ANSTISPAlgorithmRunningFrameRateToNSString(self->_runningFrameRate);
  v21 = objc_msgSend_stringWithFormat_(v4, v20, @"ANSTISPAlgorithmConfiguration [version %@, QoS %@, enableOD %@, enableSeg %@, networkResolution %@, runningFrameRate %@]", v6, v11, v17, v16, v18, v19);

  return v21;
}

- (BOOL)enableObjectTracking
{
  return self->_enableObjectTracking;
}

- (void)setEnableObjectTracking:(BOOL)a3
{
  self->_enableObjectTracking = a3;
}

- (BOOL)enableSegmentation
{
  return self->_enableSegmentation;
}

- (void)setEnableSegmentation:(BOOL)a3
{
  self->_enableSegmentation = a3;
}

- (int64_t)networkResolution
{
  return self->_networkResolution;
}

- (void)setNetworkResolution:(int64_t)a3
{
  self->_int64_t networkResolution = a3;
}

- (int64_t)runningFrameRate
{
  return self->_runningFrameRate;
}

- (void)setRunningFrameRate:(int64_t)a3
{
  self->_runningFrameRate = a3;
}

@end