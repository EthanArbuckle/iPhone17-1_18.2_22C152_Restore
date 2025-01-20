@interface ANSTVideoFoundationModelConfiguration
- (ANSTVideoFoundationModelConfiguration)init;
- (ANSTVideoFoundationModelConfiguration)initWithVersion:(unint64_t)a3;
- (id)description;
@end

@implementation ANSTVideoFoundationModelConfiguration

- (ANSTVideoFoundationModelConfiguration)init
{
  return (ANSTVideoFoundationModelConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTVideoFoundationModelConfiguration)initWithVersion:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFoundationModelConfiguration;
  return [(ANSTConfiguration *)&v4 initWithVersion:a3];
}

- (id)description
{
  objc_super v4 = NSString;
  uint64_t v5 = objc_msgSend_version(self, a2, v2);
  v6 = ANSTVideoFoundationModelVersionToNSString(v5);
  int v9 = objc_msgSend_qualityOfService(self, v7, v8);
  int v11 = v9;
  if (v9 > 20)
  {
    switch(v9)
    {
      case 21:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"DEFAULT");
        goto LABEL_17;
      case 33:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"USER_INTERACTIVE");
        goto LABEL_17;
      case 25:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"USER_INITIATED");
        goto LABEL_17;
    }
  }
  else
  {
    switch(v9)
    {
      case 0:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"UNSPECIFIED");
        goto LABEL_17;
      case 9:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"BACKGROUND");
        goto LABEL_17;
      case 17:
        objc_msgSend_stringWithFormat_(v4, v10, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"UTILITY");
        goto LABEL_17;
    }
  }
  v12 = _ANSTLoggingGetOSLogForCategoryANSTKit();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    sub_246D99CAC(v11, v12);
  }

  objc_msgSend_stringWithFormat_(v4, v13, @"ANSTVideoFoundationModelConfiguration [version %@, QoS %@]", v6, @"UNEXPECTED_ENUM_VALUE");
  v14 = LABEL_17:;

  return v14;
}

@end