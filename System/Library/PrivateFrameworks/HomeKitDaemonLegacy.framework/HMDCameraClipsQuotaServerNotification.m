@interface HMDCameraClipsQuotaServerNotification
- (HMDCameraClipsQuotaServerNotification)initWithContainerIdentifier:(id)a3 reason:(int64_t)a4 requestID:(id)a5 userDSID:(id)a6;
- (HMDCameraClipsQuotaServerNotification)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)containerIdentifier;
- (NSString)requestID;
- (NSString)userDSID;
- (int64_t)reason;
@end

@implementation HMDCameraClipsQuotaServerNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

- (NSString)userDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)dictionaryRepresentation
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(HMDCameraClipsQuotaServerNotification *)self reason] == 1) {
    v3 = @"allCamerasDisabled";
  }
  else {
    v3 = 0;
  }
  v12 = @"hk";
  v10[0] = @"c";
  v4 = [(HMDCameraClipsQuotaServerNotification *)self containerIdentifier];
  v11[0] = v4;
  v11[1] = v3;
  v10[1] = @"f";
  v10[2] = @"r";
  v5 = [(HMDCameraClipsQuotaServerNotification *)self requestID];
  v11[2] = v5;
  v10[3] = @"u";
  v6 = [(HMDCameraClipsQuotaServerNotification *)self userDSID];
  v11[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return (NSDictionary *)v8;
}

- (HMDCameraClipsQuotaServerNotification)initWithDictionaryRepresentation:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"hk"];
  v5 = [v4 objectForKeyedSubscript:@"c"];
  v6 = [v4 objectForKeyedSubscript:@"f"];
  v7 = [v4 objectForKeyedSubscript:@"r"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"u"];
  v9 = (void *)v8;
  v10 = 0;
  if (v5 && v6 && v7 && v8)
  {
    if ([v6 isEqualToString:@"allCamerasDisabled"])
    {
      self = [(HMDCameraClipsQuotaServerNotification *)self initWithContainerIdentifier:v5 reason:1 requestID:v7 userDSID:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (HMDCameraClipsQuotaServerNotification)initWithContainerIdentifier:(id)a3 reason:(int64_t)a4 requestID:(id)a5 userDSID:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!a4)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v18 = (void *)_HMFPreconditionFailure();
    return (HMDCameraClipsQuotaServerNotification *)+[HMDMetricsUtilities shouldRedactBundleID:v20 isInternalBuild:v21];
  }
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraClipsQuotaServerNotification;
  v15 = [(HMDCameraClipsQuotaServerNotification *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerIdentifier, a3);
    v16->_reason = a4;
    objc_storeStrong((id *)&v16->_requestID, a5);
    objc_storeStrong((id *)&v16->_userDSID, a6);
  }

  return v16;
}

@end