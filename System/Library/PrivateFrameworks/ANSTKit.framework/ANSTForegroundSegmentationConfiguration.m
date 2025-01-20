@interface ANSTForegroundSegmentationConfiguration
- (ANSTForegroundSegmentationConfiguration)init;
- (ANSTForegroundSegmentationConfiguration)initWithVersion:(unint64_t)a3;
- (id)description;
- (int64_t)networkResolution;
- (void)setNetworkResolution:(int64_t)a3;
@end

@implementation ANSTForegroundSegmentationConfiguration

- (ANSTForegroundSegmentationConfiguration)init
{
  return (ANSTForegroundSegmentationConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x20000);
}

- (ANSTForegroundSegmentationConfiguration)initWithVersion:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTForegroundSegmentationConfiguration;
  result = [(ANSTConfiguration *)&v4 initWithVersion:a3];
  if (result) {
    result->_networkResolution = 0;
  }
  return result;
}

- (id)description
{
  objc_super v4 = NSString;
  uint64_t v5 = objc_msgSend_version(self, a2, v2);
  v6 = ANSTForegroundSegmentationVersionToNSString(v5);
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
  v13 = ANSTForegroundSegmentationResolutionToNSString(self->_networkResolution);
  v15 = objc_msgSend_stringWithFormat_(v4, v14, @"ANSTForegroundSegmentationConfiguration [version %@, QoS %@, networkResolution %@]", v6, v11, v13);

  return v15;
}

- (int64_t)networkResolution
{
  return self->_networkResolution;
}

- (void)setNetworkResolution:(int64_t)a3
{
  self->_networkResolution = a3;
}

@end