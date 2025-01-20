@interface HMFNetworkServiceInfo
+ (id)defaultServiceTypes;
+ (id)logCategory;
- (BOOL)isAirPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHAP;
- (BOOL)isMatter;
- (BOOL)isTCP;
- (BOOL)isUDP;
- (HMFNetworkServiceInfo)initWithEndpoint:(id)a3 txtRecord:(id)a4;
- (HMFNetworkServiceInfo)initWithServiceName:(id)a3 serviceType:(id)a4 serviceDomain:(id)a5 txtRecord:(id)a6;
- (NSDictionary)txtRecord;
- (NSString)category;
- (NSString)configNumber;
- (NSString)deviceID;
- (NSString)model;
- (NSString)serviceDomain;
- (NSString)serviceName;
- (NSString)serviceType;
- (NSString)stateNumber;
- (NSString)statusFlag;
- (void)updateWithServiceInfo:(id)a3;
@end

@implementation HMFNetworkServiceInfo

- (HMFNetworkServiceInfo)initWithEndpoint:(id)a3 txtRecord:(id)a4
{
  v6 = a3;
  id v7 = a4;
  bonjour_service_name = (char *)nw_endpoint_get_bonjour_service_name(v6);
  if (bonjour_service_name) {
    bonjour_service_name = (char *)[[NSString alloc] initWithUTF8String:bonjour_service_name];
  }
  bonjour_service_type = (char *)nw_endpoint_get_bonjour_service_type(v6);
  if (bonjour_service_type) {
    bonjour_service_type = (char *)[[NSString alloc] initWithUTF8String:bonjour_service_type];
  }
  bonjour_service_domain = (char *)nw_endpoint_get_bonjour_service_domain(v6);
  if (bonjour_service_domain) {
    bonjour_service_domain = (char *)[[NSString alloc] initWithUTF8String:bonjour_service_domain];
  }
  v11 = v7;
  v12 = v11;
  if (v11)
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:nw_txt_record_get_key_count(v11)];
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __txtRecordDictionary_block_invoke;
    applier[3] = &unk_1E5958770;
    id v14 = v13;
    id v19 = v14;
    if (nw_txt_record_apply(v12, applier)) {
      v15 = (void *)[v14 copy];
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  v16 = [(HMFNetworkServiceInfo *)self initWithServiceName:bonjour_service_name serviceType:bonjour_service_type serviceDomain:bonjour_service_domain txtRecord:v15];
  return v16;
}

- (HMFNetworkServiceInfo)initWithServiceName:(id)a3 serviceType:(id)a4 serviceDomain:(id)a5 txtRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMFNetworkServiceInfo;
    v16 = [(HMFNetworkServiceInfo *)&v19 init];
    p_isa = (id *)&v16->super.super.isa;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_serviceName, a3);
      objc_storeStrong(p_isa + 4, a4);
      objc_storeStrong(p_isa + 5, a5);
      objc_storeStrong(p_isa + 2, a6);
    }
    self = p_isa;
    v15 = self;
  }

  return v15;
}

- (NSDictionary)txtRecord
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(NSDictionary *)self->_txtRecord copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSString)deviceID
{
  if ([(HMFNetworkServiceInfo *)self isAirPlay])
  {
    v3 = [(HMFNetworkServiceInfo *)self txtRecord];
    v4 = v3;
    v5 = @"deviceid";
  }
  else
  {
    v6 = [(HMFNetworkServiceInfo *)self serviceType];
    int v7 = [v6 containsString:@"_companion-link._tcp"];

    v3 = [(HMFNetworkServiceInfo *)self txtRecord];
    v4 = v3;
    if (v7) {
      v5 = @"rpBA";
    }
    else {
      v5 = @"id";
    }
  }
  v8 = objc_msgSend(v3, "hmf_stringForKey:", v5);

  return (NSString *)v8;
}

- (NSString)model
{
  if ([(HMFNetworkServiceInfo *)self isAirPlay])
  {
    v3 = [(HMFNetworkServiceInfo *)self txtRecord];
    v4 = v3;
    v5 = @"model";
  }
  else
  {
    v6 = [(HMFNetworkServiceInfo *)self serviceType];
    int v7 = [v6 containsString:@"_companion-link._tcp"];

    v3 = [(HMFNetworkServiceInfo *)self txtRecord];
    v4 = v3;
    if (v7) {
      v5 = @"rpMd";
    }
    else {
      v5 = @"md";
    }
  }
  v8 = objc_msgSend(v3, "hmf_stringForKey:", v5);

  return (NSString *)v8;
}

- (NSString)category
{
  v2 = [(HMFNetworkServiceInfo *)self txtRecord];
  v3 = objc_msgSend(v2, "hmf_stringForKey:", @"ci");

  return (NSString *)v3;
}

- (NSString)statusFlag
{
  v2 = [(HMFNetworkServiceInfo *)self txtRecord];
  v3 = objc_msgSend(v2, "hmf_stringForKey:", @"sf");

  return (NSString *)v3;
}

- (NSString)stateNumber
{
  v2 = [(HMFNetworkServiceInfo *)self txtRecord];
  v3 = objc_msgSend(v2, "hmf_stringForKey:", @"s#");

  return (NSString *)v3;
}

- (NSString)configNumber
{
  v2 = [(HMFNetworkServiceInfo *)self txtRecord];
  v3 = objc_msgSend(v2, "hmf_stringForKey:", @"c#");

  return (NSString *)v3;
}

- (BOOL)isUDP
{
  if ([(HMFNetworkServiceInfo *)self isMatter]) {
    return 1;
  }
  v4 = [(HMFNetworkServiceInfo *)self serviceType];
  char v5 = [v4 hasSuffix:@"._udp"];

  return v5;
}

- (BOOL)isTCP
{
  v2 = [(HMFNetworkServiceInfo *)self serviceType];
  char v3 = [v2 hasSuffix:@"._tcp"];

  return v3;
}

- (BOOL)isAirPlay
{
  v2 = [(HMFNetworkServiceInfo *)self serviceType];
  char v3 = [v2 isEqualToString:@"_airplay._tcp"];

  return v3;
}

- (BOOL)isHAP
{
  char v3 = [(HMFNetworkServiceInfo *)self serviceType];
  if ([v3 isEqualToString:@"_hap._tcp"])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(HMFNetworkServiceInfo *)self serviceType];
    char v4 = [v5 isEqualToString:@"_hap._udp"];
  }
  return v4;
}

- (BOOL)isMatter
{
  char v3 = [(HMFNetworkServiceInfo *)self serviceType];
  if ([v3 isEqualToString:@"_matter._tcp"])
  {
    char v4 = 1;
  }
  else
  {
    char v5 = [(HMFNetworkServiceInfo *)self serviceType];
    char v4 = [v5 isEqualToString:@"_matterc._udp"];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;
  int v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  v8 = [v6 serviceName];
  v9 = [(HMFNetworkServiceInfo *)self serviceName];
  int v10 = HMFEqualObjects(v8, v9);

  if (!v10) {
    goto LABEL_9;
  }
  id v11 = [v7 serviceType];
  id v12 = [(HMFNetworkServiceInfo *)self serviceType];
  int v13 = HMFEqualObjects(v11, v12);

  if (!v13) {
    goto LABEL_9;
  }
  id v14 = [v7 serviceDomain];
  v15 = [(HMFNetworkServiceInfo *)self serviceDomain];
  int v16 = HMFEqualObjects(v14, v15);

  if (v16)
  {
    v17 = [v7 txtRecord];
    v18 = [(HMFNetworkServiceInfo *)self txtRecord];
    char v19 = HMFEqualObjects(v17, v18);
  }
  else
  {
LABEL_9:
    char v19 = 0;
  }

  return v19;
}

- (void)updateWithServiceInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  char v5 = [v4 serviceName];
  int v6 = HMFEqualObjects(v5, self->_serviceName);

  if (!v6) {
    goto LABEL_5;
  }
  int v7 = [v4 serviceType];
  int v8 = HMFEqualObjects(v7, self->_serviceType);

  if (!v8) {
    goto LABEL_5;
  }
  v9 = [v4 serviceDomain];
  int v10 = HMFEqualObjects(v9, self->_serviceDomain);

  if (!v10) {
    goto LABEL_5;
  }
  id v11 = [v4 txtRecord];
  char v12 = HMFEqualObjects(v11, self->_txtRecord);

  if ((v12 & 1) == 0)
  {
    int v13 = [v4 txtRecord];
    txtRecord = self->_txtRecord;
    self->_txtRecord = v13;

    os_unfair_lock_unlock(&self->_lock);
    v15 = (void *)MEMORY[0x19F3A87A0]();
    int v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier(v16);
      char v19 = [v4 txtRecord];
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v19;
      _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating with new txt record: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_lock);
  }
}

+ (id)defaultServiceTypes
{
  if (_MergedGlobals_3_15 != -1) {
    dispatch_once(&_MergedGlobals_3_15, &__block_literal_global_42);
  }
  v2 = (void *)qword_1EB4EEBA0;
  return v2;
}

void __44__HMFNetworkServiceInfo_defaultServiceTypes__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"_hap._tcp";
  v2[1] = @"_hap._udp";
  v2[2] = @"_airplay._tcp";
  v2[3] = @"_matter._tcp";
  v2[4] = @"_matterc._udp";
  v2[5] = @"_companion-link._tcp";
  v2[6] = @"_sleep-proxy._udp";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)qword_1EB4EEBA0;
  qword_1EB4EEBA0 = v0;
}

+ (id)logCategory
{
  if (qword_1EB4EEBA8 != -1) {
    dispatch_once(&qword_1EB4EEBA8, &__block_literal_global_62);
  }
  v2 = (void *)qword_1EB4EEBB0;
  return v2;
}

uint64_t __36__HMFNetworkServiceInfo_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"HMFNetworkService", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEBB0;
  qword_1EB4EEBB0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)serviceDomain
{
  return self->_serviceDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
}

@end