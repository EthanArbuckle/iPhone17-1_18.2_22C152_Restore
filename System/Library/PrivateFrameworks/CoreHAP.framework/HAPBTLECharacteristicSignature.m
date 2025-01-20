@interface HAPBTLECharacteristicSignature
- (BOOL)isAuthenticated;
- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8;
- (HAPCharacteristicMetadata)characteristicMetadata;
- (NSNumber)serviceInstanceID;
- (NSUUID)characteristicType;
- (NSUUID)serviceType;
- (unint64_t)characteristicProperties;
@end

@implementation HAPBTLECharacteristicSignature

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicMetadata, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInstanceID, 0);

  objc_storeStrong((id *)&self->_characteristicType, 0);
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (HAPCharacteristicMetadata)characteristicMetadata
{
  return self->_characteristicMetadata;
}

- (unint64_t)characteristicProperties
{
  return self->_characteristicProperties;
}

- (NSUUID)serviceType
{
  return self->_serviceType;
}

- (NSNumber)serviceInstanceID
{
  return self->_serviceInstanceID;
}

- (NSUUID)characteristicType
{
  return self->_characteristicType;
}

- (HAPBTLECharacteristicSignature)initWithCharacteristicType:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 characteristicProperties:(unint64_t)a6 characteristicMetadata:(id)a7 authenticated:(BOOL)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = v17;
  if (!v14)
  {
    v27 = (void *)MEMORY[0x1D944E080]();
    v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = (id)objc_opt_class();
    id v30 = v37;
    v31 = "%{public}@[%@] The characteristic type is required";
LABEL_19:
    _os_log_impl(&dword_1D4758000, v28, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);

    goto LABEL_20;
  }
  if (!v15)
  {
    v27 = (void *)MEMORY[0x1D944E080]();
    v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = (id)objc_opt_class();
    id v30 = v37;
    v31 = "%{public}@[%@] The service instance ID is required";
    goto LABEL_19;
  }
  if (!v16)
  {
    v27 = (void *)MEMORY[0x1D944E080]();
    v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = (id)objc_opt_class();
    id v30 = v37;
    v31 = "%{public}@[%@] The service type is required";
    goto LABEL_19;
  }
  if (!a6)
  {
    v27 = (void *)MEMORY[0x1D944E080]();
    v28 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v35 = v29;
    __int16 v36 = 2112;
    id v37 = (id)objc_opt_class();
    id v30 = v37;
    v31 = "%{public}@[%@] The characteristic properties is required";
    goto LABEL_19;
  }
  if (!v17)
  {
    v27 = (void *)MEMORY[0x1D944E080]();
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v29;
      __int16 v36 = 2112;
      id v37 = (id)objc_opt_class();
      id v30 = v37;
      v31 = "%{public}@[%@] The characteristic metadata is required";
      goto LABEL_19;
    }
LABEL_20:

    v26 = 0;
    goto LABEL_21;
  }
  v33.receiver = self;
  v33.super_class = (Class)HAPBTLECharacteristicSignature;
  v19 = [(HAPBTLECharacteristicSignature *)&v33 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    characteristicType = v19->_characteristicType;
    v19->_characteristicType = (NSUUID *)v20;

    uint64_t v22 = [v15 copy];
    serviceInstanceID = v19->_serviceInstanceID;
    v19->_serviceInstanceID = (NSNumber *)v22;

    uint64_t v24 = [v16 copy];
    serviceType = v19->_serviceType;
    v19->_serviceType = (NSUUID *)v24;

    v19->_characteristicProperties = a6;
    objc_storeStrong((id *)&v19->_characteristicMetadata, a7);
    v19->_authenticated = a8;
  }
  self = v19;
  v26 = self;
LABEL_21:

  return v26;
}

@end