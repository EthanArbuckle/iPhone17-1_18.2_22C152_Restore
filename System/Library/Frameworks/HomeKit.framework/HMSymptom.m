@interface HMSymptom
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMSymptom)initWithCoder:(id)a3;
- (HMSymptom)initWithType:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMSymptom

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSymptom *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      int64_t v7 = [(HMSymptom *)self type];
      BOOL v8 = v7 == [(HMSymptom *)v6 type];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMSymptom type](self, "type"), @"HMS.type");
}

- (HMSymptom)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMSymptom *)self init];
  if (v5) {
    v5->_type = [v4 decodeIntegerForKey:@"HMS.type"];
  }

  return v5;
}

- (id)description
{
  int64_t v2 = [(HMSymptom *)self type] - 1;
  v3 = @"HMSymptomTypeNeediCloudCredential";
  switch(v2)
  {
    case 0:
      break;
    case 1:
      v3 = @"HMSymptomTypeNeediTunesCredential";
      break;
    case 2:
      v3 = @"HMSymptomTypeNeedHomeKitFix";
      break;
    case 3:
      v3 = @"HMSymptomTypeNeedWiFiFix";
      break;
    case 4:
      v3 = @"HMSymptomTypeNeedWiFiPerformanceFix";
      break;
    case 5:
      v3 = @"HMSymptomTypeNeedInternetFix";
      break;
    case 6:
      v3 = @"HMSymptomTypeNeedHardwareFix";
      break;
    case 7:
      v3 = @"HMSymptomTypeStereoVersionMismatch";
      break;
    case 8:
      v3 = @"HMSymptomTypeStereoNotFound";
      break;
    case 9:
      v3 = @"HMSymptomTypeStereoError";
      break;
    case 10:
      v3 = @"HMSymptomTypeWiFiNetworkMismatch";
      break;
    case 11:
      v3 = @"HMSymptomTypeNoConfiguredTargets";
      break;
    case 12:
      v3 = @"HMSymptomTypeVPNProfileExpired";
      break;
    case 13:
      v3 = @"HMSymptomTypeNeed8021xNetworkFix";
      break;
    case 14:
      v3 = @"HMSymptomTypeNeedWiFiSecurityFix";
      break;
    case 15:
      v3 = @"HMSymptomTypeNeedNetworkProfileFix";
      break;
    case 16:
      v3 = @"HMSymptomTypeNeedNetworkProfileInstall";
      break;
    case 17:
      v3 = @"HMSymptomTypeNetworkNotShareable";
      break;
    case 18:
      v3 = @"HMSymptomTypeNeedCaptiveLeaseRenewal";
      break;
    case 19:
      v3 = @"HMSymptomTypeNeedCDPFix";
      break;
    case 20:
      v3 = @"HMSymptomTypePrimaryResidentUnreachable";
      break;
    default:
      if (@"HMSymptomTypeNeediCloudCredential" == (__CFString *)999)
      {
        v3 = @"HMSymptomTypeNeedGeneralFix";
      }
      else if (@"HMSymptomTypeNeediCloudCredential" == (__CFString *)1000)
      {
        v3 = @"HMSymptomTypeFixInProgress";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"<Unknown symptom type: %ld>", @"HMSymptomTypeNeediCloudCredential");
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }

  return v3;
}

- (HMSymptom)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMSymptom;
  result = [(HMSymptom *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end