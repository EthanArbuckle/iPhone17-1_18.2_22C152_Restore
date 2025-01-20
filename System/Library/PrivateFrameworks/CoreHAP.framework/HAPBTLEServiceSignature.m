@interface HAPBTLEServiceSignature
- (BOOL)isAuthenticated;
- (HAPBTLEServiceSignature)initWithServiceType:(id)a3 serviceInstanceID:(id)a4 serviceProperties:(unint64_t)a5 linkedServices:(id)a6 authenticated:(BOOL)a7;
- (NSArray)linkedServices;
- (NSNumber)serviceInstanceID;
- (NSUUID)serviceType;
- (id)description;
- (unint64_t)serviceProperties;
@end

@implementation HAPBTLEServiceSignature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);

  objc_storeStrong((id *)&self->_serviceType, 0);
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HAPBTLEServiceSignature *)self serviceType];
  v5 = [(HAPBTLEServiceSignature *)self serviceInstanceID];
  unint64_t v6 = [(HAPBTLEServiceSignature *)self serviceProperties];
  v7 = [(HAPBTLEServiceSignature *)self linkedServices];
  v8 = [v3 stringWithFormat:@"Service Signature: Type : %@, InstanceID : %@, Properties : %tu, Linked Services : %@", v4, v5, v6, v7];

  return v8;
}

- (HAPBTLEServiceSignature)initWithServiceType:(id)a3 serviceInstanceID:(id)a4 serviceProperties:(unint64_t)a5 linkedServices:(id)a6 authenticated:(BOOL)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (!v12)
  {
    v23 = (void *)MEMORY[0x1D944E080]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = (id)objc_opt_class();
      id v26 = v33;
      v27 = "%{public}@[%@] The service type is required";
LABEL_10:
      _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, v27, buf, 0x16u);
    }
LABEL_11:

    v22 = 0;
    goto LABEL_12;
  }
  if (!v13)
  {
    v23 = (void *)MEMORY[0x1D944E080]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      __int16 v32 = 2112;
      id v33 = (id)objc_opt_class();
      id v26 = v33;
      v27 = "%{public}@[%@] The service instance ID is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v29.receiver = self;
  v29.super_class = (Class)HAPBTLEServiceSignature;
  v15 = [(HAPBTLEServiceSignature *)&v29 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    serviceType = v15->_serviceType;
    v15->_serviceType = (NSUUID *)v16;

    uint64_t v18 = [v13 copy];
    serviceInstanceID = v15->_serviceInstanceID;
    v15->_serviceInstanceID = (NSNumber *)v18;

    v15->_serviceProperties = a5;
    uint64_t v20 = [v14 copy];
    linkedServices = v15->_linkedServices;
    v15->_linkedServices = (NSArray *)v20;

    v15->_authenticated = a7;
  }
  self = v15;
  v22 = self;
LABEL_12:

  return v22;
}

@end