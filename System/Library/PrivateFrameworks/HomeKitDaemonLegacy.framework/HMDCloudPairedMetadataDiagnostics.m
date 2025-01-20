@interface HMDCloudPairedMetadataDiagnostics
+ (id)logCategory;
- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4;
- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 privacyPolicyURL:(id)a4 uploadDestination:(id)a5 consentVersion:(unint64_t)a6 uploadType:(unint64_t)a7;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier;
- (NSDictionary)prettyJSONDictionary;
- (NSURL)privacyPolicyURL;
- (NSURL)uploadDestination;
- (id)attributeDescriptions;
- (unint64_t)consentVersion;
- (unint64_t)uploadType;
@end

@implementation HMDCloudPairedMetadataDiagnostics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_uploadDestination, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (unint64_t)uploadType
{
  return self->_uploadType;
}

- (unint64_t)consentVersion
{
  return self->_consentVersion;
}

- (NSURL)uploadDestination
{
  return self->_uploadDestination;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSDictionary)prettyJSONDictionary
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"privacyPolicyURL";
  v3 = [(HMDCloudPairedMetadataDiagnostics *)self privacyPolicyURL];
  v4 = [v3 description];
  v12[0] = v4;
  v11[1] = @"uploadDestination";
  v5 = [(HMDCloudPairedMetadataDiagnostics *)self uploadDestination];
  v6 = [v5 description];
  v12[1] = v6;
  v11[2] = @"consentVersion";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics consentVersion](self, "consentVersion"));
  v12[2] = v7;
  v11[3] = @"uploadType";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics uploadType](self, "uploadType"));
  v12[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return (NSDictionary *)v9;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDCloudPairedMetadataDiagnostics *)self privacyPolicyURL];
  v5 = (void *)[v3 initWithName:@"privacyPolicyURL" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDCloudPairedMetadataDiagnostics *)self uploadDestination];
  v8 = (void *)[v6 initWithName:@"uploadDestination" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics consentVersion](self, "consentVersion"));
  v11 = (void *)[v9 initWithName:@"consentVersion" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDCloudPairedMetadataDiagnostics uploadType](self, "uploadType"));
  v14 = (void *)[v12 initWithName:@"uploadType" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 privacyPolicyURL:(id)a4 uploadDestination:(id)a5 consentVersion:(unint64_t)a6 uploadType:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDCloudPairedMetadataDiagnostics;
  v16 = [(HMDCloudPairedMetadataDiagnostics *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v17->_privacyPolicyURL, a4);
    objc_storeStrong((id *)&v17->_uploadDestination, a5);
    v17->_consentVersion = a6;
    v17->_uploadType = a7;
    v18 = v17;
  }

  return v17;
}

- (HMDCloudPairedMetadataDiagnostics)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  *(void *)&v38[13] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 firmwareVersion];

  if (v8)
  {
    id v34 = 0;
    int v9 = decodeStringFromJSONDictionary(v7, @"p", 1, &v34);
    id v10 = v34;
    if (!v9)
    {
      v24 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v33 = 0;
    int v11 = decodeStringFromJSONDictionary(v7, @"d", 1, &v33);
    id v12 = v33;
    if (!v11)
    {
      v24 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v32 = 0;
    int v13 = decodeUnsignedIntegerFromJSONDictionary(v7, @"c", 1, 0xFFuLL, &v32);
    id v14 = v32;
    id v15 = v14;
    if (v13)
    {
      uint64_t v16 = [v14 unsignedIntegerValue];
      id v31 = v15;
      int v17 = decodeUnsignedIntegerFromJSONDictionary(v7, @"t", 1, 0xFFuLL, &v31);
      id v18 = v31;

      if (v17)
      {
        uint64_t v19 = [v18 unsignedIntegerValue];
        if (!v19)
        {
          v29 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
          v30 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
          self = [(HMDCloudPairedMetadataDiagnostics *)self initWithAccessoryIdentifier:v6 privacyPolicyURL:v29 uploadDestination:v30 consentVersion:v16 uploadType:0];

          v24 = self;
          goto LABEL_17;
        }
        int v20 = v19;
        v21 = (void *)MEMORY[0x1D9452090]();
        self = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v36 = v23;
          __int16 v37 = 1024;
          *(_DWORD *)v38 = v20;
          v38[2] = 2112;
          *(void *)&v38[3] = v6;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid uploadType: %u received in JSON for accessory: %@", buf, 0x1Cu);
        }
      }
      v24 = 0;
    }
    else
    {
      v24 = 0;
      id v18 = v14;
    }
LABEL_17:

    goto LABEL_18;
  }
  v25 = (void *)MEMORY[0x1D9452090]();
  self = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v27;
    __int16 v37 = 2112;
    *(void *)v38 = v6;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Version configuration must contain firmware version: %@", buf, 0x16u);
  }
  v24 = 0;
LABEL_20:

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_120500 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_120500, &__block_literal_global_120501);
  }
  v2 = (void *)logCategory__hmf_once_v1_120502;
  return v2;
}

uint64_t __48__HMDCloudPairedMetadataDiagnostics_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_120502;
  logCategory__hmf_once_v1_120502 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end