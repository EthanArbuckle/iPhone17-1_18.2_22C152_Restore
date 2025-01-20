@interface HAPCharacteristic
+ (id)hap2_shortTypeFromUUID:(id)a3;
- (BOOL)eventNotificationsEnabled;
- (BOOL)hap2_canUseCachedValue;
- (BOOL)hap2_mergeWithCharacteristic:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWriteWithResponseImplicitlySupported;
- (BOOL)mergeObject:(id)a3;
- (BOOL)prohibitCaching;
- (BOOL)shouldValidateValueAfterReading;
- (BOOL)supportsAdditionalAuthorizationData;
- (BOOL)supportsEventNotificationContext;
- (BOOL)supportsWriteWithResponse;
- (CBCharacteristic)cbCharacteristic;
- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10;
- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9;
- (HAPCharacteristicMetadata)accessoryMetadata;
- (HAPCharacteristicMetadata)metadata;
- (HAPService)service;
- (NSData)notificationContext;
- (NSDate)valueUpdatedTime;
- (NSNumber)instanceID;
- (NSNumber)stateNumber;
- (NSString)description;
- (NSString)type;
- (id)_generateValidMetadata:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertiesDescription;
- (id)shortDescription;
- (id)validateValue:(id)a3 outValue:(id *)a4;
- (id)value;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4;
- (void)setCBCharacteristic:(id)a3;
- (void)setEventNotificationsEnabled:(BOOL)a3;
- (void)setInstanceID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNotificationContext:(id)a3;
- (void)setProhibitCaching:(BOOL)a3;
- (void)setProperties:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setShouldValidateValueAfterReading:(BOOL)a3;
- (void)setStateNumber:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdatedTime:(id)a3;
@end

@implementation HAPCharacteristic

- (void)setProhibitCaching:(BOOL)a3
{
  self->_prohibitCaching = a3;
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 metadata:(id)a9
{
  LOBYTE(v10) = 0;
  return [(HAPCharacteristic *)self initWithType:a3 instanceID:a4 value:a5 stateNumber:a6 properties:a7 eventNotificationsEnabled:a8 implicitWriteWithResponse:v10 metadata:a9];
}

- (HAPCharacteristic)initWithType:(id)a3 instanceID:(id)a4 value:(id)a5 stateNumber:(id)a6 properties:(unint64_t)a7 eventNotificationsEnabled:(BOOL)a8 implicitWriteWithResponse:(BOOL)a9 metadata:(id)a10
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v71 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  if (isValidTypeName(v16))
  {
    objc_msgSend(v16, "hap_validatedAndNormalizedUUIDString");
    v70 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v70)
    {
      v33 = (void *)MEMORY[0x1D944E080]();
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v74 = v35;
        v36 = "%{public}@### Unable to initialize characteristic because type name is not a UUID";
        v37 = v34;
        uint32_t v38 = 12;
LABEL_48:
        _os_log_impl(&dword_1D4758000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);

        goto LABEL_49;
      }
      goto LABEL_49;
    }
    if ((isValidInstanceID(v71) & 1) == 0)
    {
      v33 = (void *)MEMORY[0x1D944E080]();
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v74 = v35;
        __int16 v75 = 2112;
        v76 = v70;
        v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid instance ID";
LABEL_47:
        v37 = v34;
        uint32_t v38 = 22;
        goto LABEL_48;
      }
LABEL_49:

      v32 = 0;
LABEL_50:

      goto LABEL_51;
    }
    v68 = v70;
    v20 = +[HAPMetadata getSharedInstance];
    id v66 = v20;
    if (a7)
    {
      if ((a7 & 0xF) != 0)
      {
        v21 = [v20 getDefaultCharacteristicProperties:v68];
        v22 = v21;
        if (v21)
        {
          v63 = v21;
          char v23 = [v21 unsignedIntegerValue];
          if ((a7 & 2) == 0 && (v23 & 2) != 0)
          {
            v24 = (void *)MEMORY[0x1D944E080]();
            v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              __int16 v75 = 2112;
              v27 = v68;
              v76 = v68;
              v28 = "%{public}@### HomeKit Characteristic '%@' does not support secureRead.";
LABEL_42:
              _os_log_impl(&dword_1D4758000, v25, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);

LABEL_44:

LABEL_45:
              v33 = (void *)MEMORY[0x1D944E080]();
              v34 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v74 = v35;
                __int16 v75 = 2112;
                v76 = v27;
                v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid properties";
                goto LABEL_47;
              }
              goto LABEL_49;
            }
            goto LABEL_43;
          }
          v22 = v63;
          if ((a7 & 0x80) == 0 && v23 < 0 && ((a7 & 4) == 0 || !a9))
          {
            v24 = (void *)MEMORY[0x1D944E080]();
            v25 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v74 = v26;
              __int16 v75 = 2114;
              v27 = v68;
              v76 = v68;
              v28 = "%{public}@### HomeKit Characteristic '%{public}@' does not support writeResponse.";
              goto LABEL_42;
            }
LABEL_43:
            v27 = v68;
            goto LABEL_44;
          }
        }

        id v43 = v19;
        id v67 = v43;
        if (v43)
        {
          v44 = [v43 constraints];
          if (v44
            || ([v67 manufacturerDescription], (v44 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v67 format], (v44 = objc_claimAutoreleasedReturnValue()) != 0))
          {

            id v43 = v67;
          }
          else
          {
            v65 = [v67 units];

            id v43 = v67;
            if (!v65)
            {
              v57 = (void *)MEMORY[0x1D944E080]();
              v58 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
              {
                v59 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v74 = v59;
                _os_log_impl(&dword_1D4758000, v58, OS_LOG_TYPE_ERROR, "%{public}@### Characteristic metadata is empty", buf, 0xCu);
              }

              v33 = (void *)MEMORY[0x1D944E080]();
              v34 = HMFGetOSLogHandle();
              if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                goto LABEL_49;
              }
              v35 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v74 = v35;
              __int16 v75 = 2112;
              v76 = v68;
              v36 = "%{public}@### Unable to initialize characteristic '%@' because of invalid metadata";
              goto LABEL_47;
            }
          }
        }

        v72.receiver = self;
        v72.super_class = (Class)HAPCharacteristic;
        v45 = [(HAPCharacteristic *)&v72 init];
        if (v45)
        {
          v64 = +[HAPMetadata getSharedInstance];
          uint64_t v46 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v68);
          type = v45->_type;
          v45->_type = (NSString *)v46;

          v69 = [v64 characteristicUTIFromType:v68];
          if (v69)
          {
            context = (void *)MEMORY[0x1D944E080]();
            v62 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
            {
              v60 = HMFGetLogIdentifier();
              v48 = v45->_type;
              *(_DWORD *)buf = 138544130;
              v74 = v60;
              __int16 v75 = 2112;
              v76 = v48;
              __int16 v77 = 2112;
              v78 = v69;
              __int16 v79 = 2112;
              id v80 = v71;
              _os_log_impl(&dword_1D4758000, v62, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);
            }
          }
          objc_storeStrong((id *)&v45->_instanceID, a4);
          objc_storeStrong(&v45->_value, a5);
          objc_storeStrong((id *)&v45->_stateNumber, a6);
          uint64_t v49 = [MEMORY[0x1E4F1C9C8] date];
          valueUpdatedTime = v45->_valueUpdatedTime;
          v45->_valueUpdatedTime = (NSDate *)v49;

          v45->_properties = a7;
          v45->_eventNotificationsEnabled = a8;
          v45->_implicitWriteWithResponse = a9;
          v45->_shouldValidateValueAfterReading = 1;
          uint64_t v51 = +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:v67];
          accessoryMetadata = v45->_accessoryMetadata;
          v45->_accessoryMetadata = (HAPCharacteristicMetadata *)v51;

          v53 = [(HAPCharacteristic *)v45 _generateValidMetadata:v67];
          uint64_t v54 = +[HMFObjectCacheHAPCharacteristicMetadata hap_cacheInstanceForMetadata:v53];
          metadata = v45->_metadata;
          v45->_metadata = (HAPCharacteristicMetadata *)v54;
        }
        self = v45;
        v32 = self;
        goto LABEL_50;
      }
      v39 = (void *)MEMORY[0x1D944E080]();
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v74 = v41;
        v42 = "%{public}@### Characteristic is missing valid properties";
        goto LABEL_22;
      }
    }
    else
    {
      v39 = (void *)MEMORY[0x1D944E080]();
      v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v74 = v41;
        v42 = "%{public}@### Characteristic has nil properties";
LABEL_22:
        _os_log_impl(&dword_1D4758000, v40, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);
      }
    }
    v27 = v68;

    goto LABEL_45;
  }
  v29 = (void *)MEMORY[0x1D944E080]();
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v74 = v31;
    __int16 v75 = 2112;
    v76 = (NSString *)v16;
    _os_log_impl(&dword_1D4758000, v30, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize characteristic because of invalid characteristic type name: %@", buf, 0x16u);
  }
  v32 = 0;
LABEL_51:

  return v32;
}

- (id)_generateValidMetadata:(id)a3
{
  id v4 = a3;
  v5 = +[HAPMetadata getSharedInstance];
  v6 = [(HAPCharacteristic *)self type];
  v7 = [v5 getDefaultCharacteristicMetadata:v6];

  v8 = v4;
  if (v7)
  {
    v8 = v7;
    if (v4)
    {
      [(HAPCharacteristic *)self _updateMetadata:v7 withProvidedMetadata:v4];
      v8 = v7;
    }
  }
  id v9 = v8;

  return v9;
}

- (void)_updateMetadata:(id)a3 withProvidedMetadata:(id)a4
{
  id v40 = a3;
  id v5 = a4;
  v6 = [v40 format];

  if (!v6)
  {
    v7 = [v5 format];
    [v40 setFormat:v7];
  }
  v8 = [v40 units];

  if (!v8)
  {
    id v9 = [v5 units];
    [v40 setUnits:v9];
  }
  uint64_t v10 = [v40 manufacturerDescription];

  if (!v10)
  {
    v11 = [v5 manufacturerDescription];
    [v40 setManufacturerDescription:v11];
  }
  v12 = [v40 constraints];

  v13 = [v5 constraints];
  v14 = v13;
  if (!v12)
  {
    [v40 setConstraints:v13];
    goto LABEL_20;
  }

  if (v14)
  {
    v15 = [v5 constraints];
    id v16 = [v15 minimumValue];

    if (v16)
    {
      id v17 = [v5 constraints];
      id v18 = [v17 minimumValue];
      id v19 = [v40 constraints];
      [v19 setMinimumValue:v18];
    }
    v20 = [v5 constraints];
    v21 = [v20 maximumValue];

    if (v21)
    {
      v22 = [v5 constraints];
      char v23 = [v22 maximumValue];
      v24 = [v40 constraints];
      [v24 setMaximumValue:v23];
    }
    v25 = [v5 constraints];
    v26 = [v25 stepValue];

    if (v26)
    {
      v27 = [v5 constraints];
      v28 = [v27 stepValue];
      v29 = [v40 constraints];
      [v29 setStepValue:v28];
    }
    v30 = [v5 constraints];
    v31 = [v30 maxLength];

    if (v31)
    {
      v32 = [v5 constraints];
      v33 = [v32 maxLength];
      v34 = [v40 constraints];
      [v34 setMaxLength:v33];
    }
    v35 = [v5 constraints];
    v36 = [v35 validValues];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      v14 = [v5 constraints];
      uint32_t v38 = [v14 validValues];
      v39 = [v40 constraints];
      [v39 setValidValues:v38];

LABEL_20:
    }
  }
}

- (unint64_t)hash
{
  v2 = [(HAPCharacteristic *)self instanceID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSDate)valueUpdatedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSData)notificationContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationContext;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)stateNumber
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (BOOL)shouldValidateValueAfterReading
{
  return self->_shouldValidateValueAfterReading;
}

- (id)validateValue:(id)a3 outValue:(id *)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HAPCharacteristic *)self metadata];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(HAPCharacteristic *)self metadata];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = [(HAPCharacteristic *)self metadata];
      v12 = [v11 format];

      if (!v12) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    v14 = [(HAPCharacteristic *)self metadata];
    v15 = [v14 format];

    if (a4) {
      *a4 = 0;
    }
    if (!v6)
    {
      id v13 = 0;
LABEL_65:

      goto LABEL_66;
    }
    id v16 = [(HAPCharacteristic *)self metadata];
    if (v16)
    {
      id v17 = [(HAPCharacteristic *)self metadata];
      id v18 = [v17 constraints];

      if (v18)
      {
        id v19 = [(HAPCharacteristic *)self metadata];
        v20 = [v19 constraints];
        id v16 = [v20 minimumValue];

        v21 = [(HAPCharacteristic *)self metadata];
        v22 = [v21 constraints];
        char v23 = [v22 maximumValue];

        v24 = [(HAPCharacteristic *)self metadata];
        v25 = [v24 constraints];
        uint64_t v26 = [v25 minLength];

        v27 = [(HAPCharacteristic *)self metadata];
        v28 = [v27 constraints];
        v91 = [v28 maxLength];

        v29 = (void *)v26;
      }
      else
      {
        v91 = 0;
        v29 = 0;
        char v23 = 0;
        id v16 = 0;
      }
    }
    else
    {
      v91 = 0;
      v29 = 0;
      char v23 = 0;
    }
    if (([v15 isEqualToString:@"int"] & 1) != 0
      || ([v15 isEqualToString:@"float"] & 1) != 0
      || ([v15 isEqualToString:@"BOOL"] & 1) != 0
      || ([v15 isEqualToString:@"int8"] & 1) != 0
      || ([v15 isEqualToString:@"int16"] & 1) != 0
      || ([v15 isEqualToString:@"int64"] & 1) != 0
      || ([v15 isEqualToString:@"uint8"] & 1) != 0
      || ([v15 isEqualToString:@"uint16"] & 1) != 0
      || ([v15 isEqualToString:@"uint32"] & 1) != 0
      || ([v15 isEqualToString:@"uint64"] & 1) != 0
      || ([v15 isEqualToString:@"string"] & 1) != 0
      || ([v15 isEqualToString:@"date"] & 1) != 0
      || ([v15 isEqualToString:@"array"] & 1) != 0
      || ([v15 isEqualToString:@"dict"] & 1) != 0
      || ([v15 isEqualToString:@"data"] & 1) != 0
      || [v15 isEqualToString:@"tlv8"])
    {
      uint64_t v30 = objc_opt_class();
    }
    else
    {
      uint64_t v30 = 0;
    }
    if (([(id)objc_opt_class() isSubclassOfClass:v30] & 1) == 0)
    {
      uint64_t v37 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:43];
      uint32_t v38 = (void *)MEMORY[0x1D944E080]();
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = v15;
        id v40 = v23;
        v41 = v16;
        id v43 = v42 = v29;
        v44 = [(HAPCharacteristic *)self type];
        *(_DWORD *)buf = 138544130;
        v93 = v43;
        __int16 v94 = 2112;
        uint64_t v95 = (uint64_t)v44;
        __int16 v96 = 2112;
        id v97 = (id)objc_opt_class();
        __int16 v98 = 2112;
        uint64_t v99 = v30;
        id v45 = v97;
        _os_log_impl(&dword_1D4758000, v39, OS_LOG_TYPE_ERROR, "%{public}@### Failed to validate value for characteristic with type '%@' because the value was of class '%@' but should be '%@'", buf, 0x2Au);

        v29 = v42;
        id v16 = v41;
        char v23 = v40;
        v15 = v88;
      }

      goto LABEL_64;
    }
    if (!a4)
    {
LABEL_47:
      if (([v15 isEqualToString:@"int"] & 1) != 0
        || ([v15 isEqualToString:@"float"] & 1) != 0
        || ([v15 isEqualToString:@"int8"] & 1) != 0
        || ([v15 isEqualToString:@"int16"] & 1) != 0
        || ([v15 isEqualToString:@"int64"] & 1) != 0
        || ([v15 isEqualToString:@"uint8"] & 1) != 0
        || ([v15 isEqualToString:@"uint16"] & 1) != 0
        || ([v15 isEqualToString:@"uint32"] & 1) != 0
        || [v15 isEqualToString:@"uint64"])
      {
        if (v16 && [v6 compare:v16] == -1)
        {
          v63 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:44];
          if (a4) {
            *a4 = 0;
          }
        }
        else
        {
          v63 = 0;
        }
        if (v23 && [v6 compare:v23] == 1)
        {
          uint64_t v37 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:45];

          if (a4) {
            *a4 = 0;
          }
        }
        else
        {
          uint64_t v37 = v63;
        }
        goto LABEL_64;
      }
      if ([v15 isEqualToString:@"BOOL"])
      {
        v65 = objc_opt_class();
        if (([v65 isSubclassOfClass:objc_opt_class()] & 1) == 0)
        {
          id v66 = v29;
          if ([v65 isSubclassOfClass:objc_opt_class()])
          {
            if ([v6 intValue] < 2)
            {
              uint64_t v37 = 0;
LABEL_104:
              v29 = v66;
              goto LABEL_64;
            }
            uint64_t v89 = MEMORY[0x1D944E080]();
            id v67 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              v68 = HMFGetLogIdentifier();
              v69 = objc_opt_class();
              id v70 = v6;
              id v86 = v69;
              *(_DWORD *)buf = 138544130;
              v93 = v68;
              __int16 v94 = 2112;
              uint64_t v95 = (uint64_t)v6;
              __int16 v96 = 2112;
              id v97 = v69;
              __int16 v98 = 2080;
              uint64_t v99 = [v70 objCType];
              _os_log_impl(&dword_1D4758000, v67, OS_LOG_TYPE_ERROR, "%{public}@Value to be validated is expected to be either '0' or '1', instead it was '%@' - class %@  objCType %s", buf, 0x2Au);
            }
            id v71 = (void *)v89;
          }
          else
          {
            uint64_t v79 = MEMORY[0x1D944E080]();
            id v80 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              uint64_t v81 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v93 = v81;
              __int16 v94 = 2112;
              uint64_t v95 = (uint64_t)v6;
              __int16 v96 = 2112;
              id v97 = v65;
              _os_log_impl(&dword_1D4758000, v80, OS_LOG_TYPE_ERROR, "%{public}@inValue not a BOOLean value %@ - class %@", buf, 0x20u);
            }
            id v71 = (void *)v79;
          }
          uint64_t v37 = [MEMORY[0x1E4F28C58] errorWithHMErrorCode:3];
          if (a4) {
            *a4 = 0;
          }
          goto LABEL_104;
        }
LABEL_87:
        uint64_t v37 = 0;
LABEL_64:
        id v13 = v37;

        goto LABEL_65;
      }
      if (![v15 isEqualToString:@"string"]) {
        goto LABEL_87;
      }
      v90 = v29;
      id v72 = v6;
      unint64_t v73 = [v72 length];
      if (v73 <= [v91 unsignedIntValue])
      {
        unint64_t v82 = [v72 length];
        if (v82 >= [v29 unsignedIntValue])
        {
          uint64_t v37 = 0;
LABEL_106:

          v29 = v90;
          goto LABEL_64;
        }
        v83 = (void *)MEMORY[0x1D944E080]();
        v84 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          v85 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v93 = v85;
          __int16 v94 = 2048;
          uint64_t v95 = [v72 length];
          __int16 v96 = 1024;
          LODWORD(v97) = [v90 unsignedIntValue];
          _os_log_impl(&dword_1D4758000, v84, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu < minLength: %u", buf, 0x1Cu);
        }
        __int16 v77 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v78 = 51;
      }
      else
      {
        v74 = (void *)MEMORY[0x1D944E080]();
        __int16 v75 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          v76 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v93 = v76;
          __int16 v94 = 2048;
          uint64_t v95 = [v72 length];
          __int16 v96 = 1024;
          LODWORD(v97) = [v91 unsignedIntValue];
          _os_log_impl(&dword_1D4758000, v75, OS_LOG_TYPE_ERROR, "%{public}@inValue string.length: %lu > maxLength: %u", buf, 0x1Cu);
        }
        __int16 v77 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v78 = 46;
      }
      uint64_t v37 = [v77 errorWithHMErrorCode:v78];
      if (a4) {
        *a4 = 0;
      }
      goto LABEL_106;
    }
    v87 = v23;
    v31 = v16;
    v32 = v29;
    v33 = [(HAPCharacteristic *)self metadata];
    v34 = [v33 constraints];
    uint64_t v35 = [v34 stepValue];
    if (v35)
    {
      v36 = (void *)v35;
      if ([v15 isEqualToString:@"float"])
      {

LABEL_38:
        v47 = [(HAPCharacteristic *)self metadata];
        v48 = [v47 constraints];
        uint64_t v49 = [v48 stepValue];
        [v49 doubleValue];
        double v51 = v50;

        v52 = [(HAPCharacteristic *)self metadata];
        v53 = [v52 constraints];
        uint64_t v54 = [v53 minimumValue];

        if (v54)
        {
          v55 = [(HAPCharacteristic *)self metadata];
          v56 = [v55 constraints];
          v57 = [v56 minimumValue];
          [v57 doubleValue];
          double v59 = v58;
        }
        else
        {
          double v59 = 0.0;
        }
        [v6 doubleValue];
        double v62 = v59 + round((v61 - v59) / v51) * v51;
        v29 = v32;
        if ([v15 isEqualToString:@"int"]) {
          [NSNumber numberWithInteger:(uint64_t)v62];
        }
        else {
          [NSNumber numberWithDouble:v62];
        }
        id v16 = v31;
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_46;
      }
      char v46 = [v15 isEqualToString:@"int"];

      if (v46) {
        goto LABEL_38;
      }
    }
    else
    {
    }
    id v60 = v6;
    v29 = v32;
    id v16 = v31;
LABEL_46:
    char v23 = v87;
    *a4 = v60;
    goto LABEL_47;
  }
LABEL_4:
  id v13 = 0;
  if (a4) {
    *a4 = v6;
  }
LABEL_66:

  return v13;
}

- (HAPCharacteristicMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPCharacteristic *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6) {
      goto LABEL_15;
    }
    uint64_t v7 = [(HAPCharacteristic *)self instanceID];
    v8 = [(HAPCharacteristic *)v6 instanceID];
    char v9 = numbersAreNotEqualNilSafe(v7, v8);

    if (v9) {
      goto LABEL_15;
    }
    uint64_t v10 = [(HAPCharacteristic *)self type];
    uint64_t v11 = [(HAPCharacteristic *)v6 type];
    if (v10 | v11)
    {
      v12 = (void *)v11;
      int v13 = [(id)v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_15;
      }
    }
    unint64_t v15 = [(HAPCharacteristic *)self properties];
    if (v15 == [(HAPCharacteristic *)v6 properties])
    {
      uint64_t v16 = [(HAPCharacteristic *)self service];
      if (v16)
      {
        id v17 = (void *)v16;
        uint64_t v18 = [(HAPCharacteristic *)v6 service];
        if (v18)
        {
          id v19 = (void *)v18;
          v20 = [(HAPCharacteristic *)self service];
          v21 = [(HAPCharacteristic *)v6 service];
          char v14 = [v20 isEqual:v21];
        }
        else
        {
          char v14 = 1;
        }
      }
      else
      {
        char v14 = 1;
      }
    }
    else
    {
LABEL_15:
      char v14 = 0;
    }
  }
  return v14;
}

- (NSString)type
{
  return self->_type;
}

- (HAPService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (HAPService *)WeakRetained;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_notificationContext, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
}

- (void)setCBCharacteristic:(id)a3
{
}

- (CBCharacteristic)cbCharacteristic
{
  v2 = objc_getAssociatedObject(self, "cbCharacteristic");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (CBCharacteristic *)v3;
}

- (BOOL)hap2_canUseCachedValue
{
  id v3 = +[HAPMetadata getSharedInstance];
  if ([(HAPCharacteristic *)self eventNotificationsEnabled]
    && ![(HAPCharacteristic *)self prohibitCaching])
  {
    id v5 = [(HAPCharacteristic *)self value];
    char v4 = 0;
    if (v5 && v3)
    {
      id v6 = [(HAPCharacteristic *)self type];
      char v4 = [v3 isStandardHAPCharacteristic:v6];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)hap2_mergeWithCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 value];
  [(HAPCharacteristic *)self setValue:v5];

  id v6 = [v4 valueUpdatedTime];
  [(HAPCharacteristic *)self setValueUpdatedTime:v6];

  -[HAPCharacteristic setProperties:](self, "setProperties:", [v4 properties]);
  uint64_t v7 = [v4 metadata];

  [(HAPCharacteristic *)self setMetadata:v7];
  return 1;
}

+ (id)hap2_shortTypeFromUUID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 hasSuffix:@"-0000-1000-8000-0026BB765291"])
  {
    id v4 = [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@"-0000-1000-8000-0026BB765291", "length")];
  }

  return v4;
}

- (BOOL)isWriteWithResponseImplicitlySupported
{
  return self->_implicitWriteWithResponse;
}

- (HAPCharacteristicMetadata)accessoryMetadata
{
  return self->_accessoryMetadata;
}

- (BOOL)prohibitCaching
{
  return self->_prohibitCaching;
}

- (void)setShouldValidateValueAfterReading:(BOOL)a3
{
  self->_shouldValidateValueAfterReading = a3;
}

- (void)setMetadata:(id)a3
{
}

- (void)setEventNotificationsEnabled:(BOOL)a3
{
  self->_eventNotificationsEnabled = a3;
}

- (BOOL)eventNotificationsEnabled
{
  return self->_eventNotificationsEnabled;
}

- (void)setProperties:(unint64_t)a3
{
  self->_properties = a3;
}

- (void)setInstanceID:(id)a3
{
}

- (void)setType:(id)a3
{
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
LABEL_14:
    char v17 = 0;
    goto LABEL_15;
  }
  if (![(HAPCharacteristic *)self shouldMergeObject:v6])
  {
    uint64_t v18 = (void *)MEMORY[0x1D944E080]();
    id v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      int v23 = 138543618;
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_INFO, "%{public}@Not merging with characteristic: %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_14;
  }
  uint64_t v7 = [v6 value];
  [(HAPCharacteristic *)self setValue:v7];

  v8 = [(HAPCharacteristic *)self metadata];
  char v9 = [v6 metadata];
  char v10 = [v8 isEqualToCharacteristicMetadata:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944E080]();
    v12 = self;
    int v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = HMFGetLogIdentifier();
      unint64_t v15 = [v6 metadata];
      int v23 = 138543618;
      v24 = v14;
      __int16 v25 = 2112;
      id v26 = v15;
      _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Updated the characteristic metadata: %@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v16 = [v6 metadata];
    [(HAPCharacteristic *)v12 setMetadata:v16];
  }
  char v17 = v10 ^ 1;
LABEL_15:

  return v17;
}

- (BOOL)supportsEventNotificationContext
{
  return ([(HAPCharacteristic *)self properties] >> 8) & 1;
}

- (BOOL)supportsAdditionalAuthorizationData
{
  if (([(HAPCharacteristic *)self properties] & 0x10) != 0) {
    return 1;
  }
  id v3 = +[HAPMetadata getSharedInstance];
  id v4 = [(HAPCharacteristic *)self service];
  id v5 = [(HAPCharacteristic *)self type];
  id v6 = [v4 type];
  char v7 = [v3 supportsAdditionalAuthorizationData:v5 forService:v6];

  return v7;
}

- (BOOL)supportsWriteWithResponse
{
  unsigned int v3 = [(HAPCharacteristic *)self properties];
  if ((v3 & 0x80) != 0) {
    LOBYTE(v4) = 1;
  }
  else {
    return [(HAPCharacteristic *)self isWriteWithResponseImplicitlySupported] & (v3 >> 2);
  }
  return v4;
}

- (void)setNotificationContext:(id)a3
{
  BOOL v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  notificationContext = self->_notificationContext;
  self->_notificationContext = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setValueUpdatedTime:(id)a3
{
  BOOL v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setStateNumber:(id)a3
{
  BOOL v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  stateNumber = self->_stateNumber;
  self->_stateNumber = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  os_unfair_lock_lock_with_options();
  id value = self->_value;
  self->_id value = v4;
  id v7 = v4;

  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)propertiesDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([(HAPCharacteristic *)self properties] & 2) != 0) {
    [v3 addObject:@"read"];
  }
  if (([(HAPCharacteristic *)self properties] & 4) != 0) {
    [v3 addObject:@"write"];
  }
  if ([(HAPCharacteristic *)self properties]) {
    [v3 addObject:@"eventConnectionNotifications"];
  }
  if (([(HAPCharacteristic *)self properties] & 8) != 0) {
    [v3 addObject:@"broadcast"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x10) != 0) {
    [v3 addObject:@"additionalAuthData"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x20) != 0) {
    [v3 addObject:@"requiresTimedWrite"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x40) != 0) {
    [v3 addObject:@"hidden"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x80) != 0) {
    [v3 addObject:@"writeResponse"];
  }
  if (([(HAPCharacteristic *)self properties] & 0x100) != 0) {
    [v3 addObject:@"eventNotificationContext"];
  }
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v5 = [v3 objectAtIndexedSubscript:0];
    [v4 appendString:v5];

    id v6 = [v3 objectAtIndexedSubscript:0];
    [v3 removeObject:v6];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 appendFormat:@", %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)shortDescription
{
  id v3 = [(HAPCharacteristic *)self service];
  id v4 = [v3 accessory];
  id v5 = [v4 uniqueIdentifier];

  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(HAPCharacteristic *)self instanceID];
  uint64_t v9 = [(HAPCharacteristic *)self type];
  uint64_t v10 = HAPShortUUIDType(v9);
  uint64_t v11 = [(HAPCharacteristic *)self stateNumber];
  v12 = [(HAPCharacteristic *)self value];
  long long v13 = [(HAPCharacteristic *)self valueUpdatedTime];
  long long v14 = [v6 stringWithFormat:@"%@ %@/%@/%@/%@ %@/%@", v7, v5, v8, v10, v11, v12, v13];

  return v14;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v20.receiver = self;
  v20.super_class = (Class)HAPCharacteristic;
  id v4 = [(HMFObject *)&v20 description];
  [v3 appendFormat:@"%@", v4];

  id v5 = [(HAPCharacteristic *)self service];
  id v6 = [v5 accessory];
  uint64_t v7 = [v6 uniqueIdentifier];
  [v3 appendFormat:@", Accessory Unique ID: %@", v7];

  uint64_t v8 = [(HAPCharacteristic *)self instanceID];
  [v3 appendFormat:@", Instance ID: %@", v8];

  uint64_t v9 = [(HAPCharacteristic *)self type];
  [v3 appendFormat:@", Type: %@", v9];

  uint64_t v10 = [(HAPCharacteristic *)self value];
  [v3 appendFormat:@", Value: %@", v10];

  uint64_t v11 = [(HAPCharacteristic *)self stateNumber];
  [v3 appendFormat:@", State Number: %@", v11];

  v12 = [(HAPCharacteristic *)self valueUpdatedTime];
  long long v13 = objc_msgSend(v12, "hmf_localTimeDescription");
  [v3 appendFormat:@", Value update time: %@", v13];

  long long v14 = [(HAPCharacteristic *)self propertiesDescription];
  [v3 appendFormat:@", Properties: %@", v14];

  [(HAPCharacteristic *)self eventNotificationsEnabled];
  long long v15 = HMFBooleanToString();
  [v3 appendFormat:@", Event Notifications Enabled: %@", v15];

  long long v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HAPCharacteristic isWriteWithResponseImplicitlySupported](self, "isWriteWithResponseImplicitlySupported"));
  [v3 appendFormat:@", Write With Response Implicitly Supported: %@", v16];

  char v17 = [(HAPCharacteristic *)self metadata];
  [v3 appendFormat:@", Metadata: %@", v17];

  [(HAPCharacteristic *)self supportsEventNotificationContext];
  uint64_t v18 = HMFBooleanToString();
  [v3 appendFormat:@", supportsEventNotificationContext: %@", v18];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(HAPCharacteristic *)self value];
  if (([v5 conformsToProtocol:&unk_1F2C83AA8] & 1) == 0)
  {

    goto LABEL_5;
  }
  id v6 = [(HAPCharacteristic *)self value];

  if (!v6)
  {
LABEL_5:
    id v6 = [(HAPCharacteristic *)self value];
    uint64_t v7 = [v6 copy];
    goto LABEL_6;
  }
  uint64_t v7 = [v6 copyWithZone:a3];
LABEL_6:
  __int16 v25 = (void *)v7;

  id v22 = objc_alloc((Class)objc_opt_class());
  v24 = [(HAPCharacteristic *)self type];
  v21 = (void *)[v24 copyWithZone:a3];
  int v23 = [(HAPCharacteristic *)self instanceID];
  uint64_t v8 = (void *)[v23 copyWithZone:a3];
  uint64_t v9 = [(HAPCharacteristic *)self stateNumber];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  unint64_t v11 = [(HAPCharacteristic *)self properties];
  BOOL v12 = [(HAPCharacteristic *)self eventNotificationsEnabled];
  BOOL v13 = [(HAPCharacteristic *)self isWriteWithResponseImplicitlySupported];
  long long v14 = [(HAPCharacteristic *)self metadata];
  long long v15 = (void *)[v14 copyWithZone:a3];
  LOBYTE(v20) = v13;
  long long v16 = (void *)[v22 initWithType:v21 instanceID:v8 value:v25 stateNumber:v10 properties:v11 eventNotificationsEnabled:v12 implicitWriteWithResponse:v20 metadata:v15];

  char v17 = [(HAPCharacteristic *)self valueUpdatedTime];
  [v16 setValueUpdatedTime:v17];

  uint64_t v18 = [(HAPCharacteristic *)self notificationContext];
  [v16 setNotificationContext:v18];

  objc_msgSend(v16, "setProhibitCaching:", -[HAPCharacteristic prohibitCaching](self, "prohibitCaching"));
  objc_msgSend(v16, "setShouldValidateValueAfterReading:", -[HAPCharacteristic shouldValidateValueAfterReading](self, "shouldValidateValueAfterReading"));

  return v16;
}

@end