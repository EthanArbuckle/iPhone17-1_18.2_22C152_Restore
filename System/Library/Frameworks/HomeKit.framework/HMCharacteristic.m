@interface HMCharacteristic
+ (BOOL)supportsSecureCoding;
+ (HMCharacteristic)characteristicWithCharacteristicReference:(id)a3 home:(id)a4;
+ (HMCharacteristic)characteristicWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)__localizedDescriptionForCharacteristicType:(id)a3;
+ (id)_characteristicTypeAsString:(id)a3;
+ (id)localizedDescriptionForCharacteristicType:(id)a3;
+ (id)logCategory;
- (BOOL)hasAuthorizationData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotificationEnabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)notificationEnabledByThisClient;
- (BOOL)requiresDeviceUnlock;
- (HMCharacteristic)init;
- (HMCharacteristic)initWithCoder:(id)a3;
- (HMCharacteristic)initWithInstanceID:(id)a3 characteristicType:(id)a4 service:(id)a5 metadata:(id)a6;
- (HMCharacteristicMetadata)metadata;
- (HMService)service;
- (NSArray)properties;
- (NSDate)notificationEnabledTime;
- (NSDate)valueUpdatedTime;
- (NSDictionary)serializedDictionaryRepresentation;
- (NSNumber)instanceID;
- (NSString)characteristicType;
- (NSString)localizedDescription;
- (NSUUID)serviceUniqueIdentifier;
- (NSUUID)uniqueIdentifier;
- (_HMContext)context;
- (id)_characteristicTypeDescription;
- (id)logIdentifier;
- (id)propertiesFromHAPProperties:(int64_t)a3;
- (id)value;
- (unint64_t)hash;
- (void)__configureWithContext:(id)a3 service:(id)a4;
- (void)_enableNotification:(BOOL)a3 completionHandler:(id)a4;
- (void)_readValueWithCompletionHandler:(id)a3;
- (void)_unconfigure;
- (void)_updateAuthorizationData:(id)a3 completionHandler:(id)a4;
- (void)_updateValue:(id)a3 valueUpdatedDate:(id)a4;
- (void)_writeValue:(id)a3 completionHandler:(id)a4;
- (void)enableNotification:(BOOL)enable completionHandler:(void *)completion;
- (void)readValueWithCompletionHandler:(void *)completion;
- (void)setCharacteristicType:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasAuthorizationData:(BOOL)a3;
- (void)setNotificationEnabled:(BOOL)a3;
- (void)setNotificationEnabledByThisClient:(BOOL)a3;
- (void)setNotificationEnabledTime:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRequiresDeviceUnlock:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueUpdateTime:(id)a3;
- (void)setValueUpdatedTime:(id)a3;
- (void)updateAuthorizationData:(NSData *)data completionHandler:(void *)completion;
- (void)writeValue:(id)value completionHandler:(void *)completion;
@end

@implementation HMCharacteristic

- (HMCharacteristicMetadata)metadata
{
  return self->_metadata;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMCharacteristic)initWithInstanceID:(id)a3 characteristicType:(id)a4 service:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)HMCharacteristic;
  v14 = [(HMCharacteristic *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    instanceID = v14->_instanceID;
    v14->_instanceID = (NSNumber *)v15;

    uint64_t v17 = [v11 copy];
    characteristicType = v14->_characteristicType;
    v14->_characteristicType = (NSString *)v17;

    objc_storeWeak((id *)&v14->_service, v12);
    uint64_t v19 = [v12 uniqueIdentifier];
    serviceUniqueIdentifier = v14->_serviceUniqueIdentifier;
    v14->_serviceUniqueIdentifier = (NSUUID *)v19;

    uint64_t v21 = [v13 copy];
    metadata = v14->_metadata;
    v14->_metadata = (HMCharacteristicMetadata *)v21;

    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] distantPast];
    valueUpdatedTime = v14->_valueUpdatedTime;
    v14->_valueUpdatedTime = (NSDate *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1C9C8] distantFuture];
    notificationEnabledTime = v14->_notificationEnabledTime;
    v14->_notificationEnabledTime = (NSDate *)v25;
  }
  return v14;
}

- (id)logIdentifier
{
  v2 = [(HMCharacteristic *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMCharacteristic *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
      v7 = [(HMCharacteristic *)self uniqueIdentifier];
      v8 = [(HMCharacteristic *)v6 uniqueIdentifier];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMCharacteristic *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  v14[1] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    v5 = (void *)MEMORY[0x1E4F29128];
    v6 = [(HMCharacteristic *)self serviceUniqueIdentifier];
    v7 = [NSString stringWithFormat:@"%@", self->_instanceID];
    v14[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v9 = objc_msgSend(v5, "hm_deriveUUIDFromBaseUUID:withSalts:", v6, v8);
    id v11 = self->_uniqueIdentifier;
    p_uniqueIdentifier = &self->_uniqueIdentifier;
    *p_uniqueIdentifier = (NSUUID *)v9;

    uniqueIdentifier = *p_uniqueIdentifier;
  }
  id v12 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (NSUUID)serviceUniqueIdentifier
{
  return self->_serviceUniqueIdentifier;
}

- (void)setNotificationEnabledTime:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDate *)[v6 copy];
  notificationEnabledTime = self->_notificationEnabledTime;
  self->_notificationEnabledTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateValue:(id)a3 valueUpdatedDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = [(HMCharacteristic *)v9 value];
    int v14 = 138544130;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic value from %@ -> %@ with value updated date: %@", (uint8_t *)&v14, 0x2Au);
  }
  [(HMCharacteristic *)v9 setValue:v6];
  if (v7)
  {
    [(HMCharacteristic *)v9 setValueUpdatedTime:v7];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    [(HMCharacteristic *)v9 setValueUpdatedTime:v13];
  }
}

- (id)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setValueUpdatedTime:(id)a3
{
}

- (void)setValue:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[v6 copy];
  id value = self->_value;
  self->_id value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)characteristicType
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_characteristicType;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSArray)properties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_properties;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1) {
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_950);
  }
  v2 = (void *)logCategory__hmf_once_v22;

  return v2;
}

- (NSDate)valueUpdatedTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_valueUpdatedTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)localizedDescriptionForCharacteristicType:(id)a3
{
  return +[HMCharacteristic __localizedDescriptionForCharacteristicType:a3];
}

- (HMCharacteristic)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicInstanceID"];
  id v6 = objc_msgSend(v4, "hm_decodeAndCacheStringForKey:", @"characteristicType");
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"service"];
  v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v23 = 138544130;
      v24 = v13;
      __int16 v25 = 2112;
      v26 = v5;
      __int16 v27 = 2112;
      objc_super v28 = v6;
      __int16 v29 = 2112;
      v30 = v8;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize from instanceID: %@, characteristicType: %@, service: %@", (uint8_t *)&v23, 0x2Au);
    }
    int v14 = 0;
  }
  else
  {
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicMetadata"];
    __int16 v16 = [(HMCharacteristic *)self initWithInstanceID:v5 characteristicType:v6 service:v8 metadata:v15];
    if ([v4 containsValueForKey:@"characteristicValue"])
    {
      uint64_t v17 = allowedCharValueTypes();
      __int16 v18 = [v4 decodeObjectOfClasses:v17 forKey:@"characteristicValue"];
      [(HMCharacteristic *)v16 setValue:v18];
    }
    id v19 = -[HMCharacteristic propertiesFromHAPProperties:](v16, "propertiesFromHAPProperties:", (int)[v4 decodeInt32ForKey:@"characteristicProperties"]);
    [(HMCharacteristic *)v16 setProperties:v19];

    if ([v4 containsValueForKey:@"characteristicValueUpdateTime"])
    {
      __int16 v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicValueUpdateTime"];
      [(HMCharacteristic *)v16 setValueUpdatedTime:v20];
    }
    if ([v4 containsValueForKey:@"characteristicNotificationEnableTime"])
    {
      id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicNotificationEnableTime"];
      [(HMCharacteristic *)v16 setNotificationEnabledTime:v21];
    }
    -[HMCharacteristic setNotificationEnabled:](v16, "setNotificationEnabled:", [v4 decodeBoolForKey:@"characteristicNotificationEnabled"]);
    -[HMCharacteristic setHasAuthorizationData:](v16, "setHasAuthorizationData:", [v4 decodeBoolForKey:@"HM.characteristicAuthDataPresent"]);
    -[HMCharacteristic setRequiresDeviceUnlock:](v16, "setRequiresDeviceUnlock:", [v4 decodeBoolForKey:@"HM.requiresDeviceUnlock"]);
    self = v16;

    int v14 = self;
  }

  return v14;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_notificationEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setRequiresDeviceUnlock:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_requiresDeviceUnlock = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setProperties:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSArray *)[v6 copy];
  properties = self->_properties;
  self->_properties = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setHasAuthorizationData:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_hasAuthorizationData = a3;

  os_unfair_lock_unlock(p_lock);
}

- (id)propertiesFromHAPProperties:(int64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = v4;
  if ((v3 & 4) != 0)
  {
    [v4 addObject:@"HMCharacteristicPropertyWritable"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"HMCharacteristicPropertyReadable"];
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v5 addObject:@"HMCharacteristicPropertySupportsEventNotification"];
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v5 addObject:@"HMCharacteristicPropertyHidden"];
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"HMCharacteristicPropertyRequiresAuthorizationData"];
LABEL_7:

  return v5;
}

- (BOOL)requiresDeviceUnlock
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_requiresDeviceUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (HMService *)WeakRetained;
}

- (void)__configureWithContext:(id)a3 service:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F3A64A0]();
  BOOL v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@, service: %@", (uint8_t *)&v12, 0x20u);
  }
  [(HMCharacteristic *)v9 setContext:v6];
  [(HMCharacteristic *)v9 setService:v7];
}

- (void)setService:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (NSDate)notificationEnabledTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_notificationEnabledTime;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (id)__localizedDescriptionForCharacteristicType:(id)a3
{
  char v3 = localizationKeyForCharacteristicType(a3);
  id v4 = +[HMLocalization sharedManager];
  v5 = [v4 getLocalizedOrCustomString:v3];

  return v5;
}

- (BOOL)notificationEnabledByThisClient
{
  return self->_notificationEnabledByThisClient;
}

uint64_t __31__HMCharacteristic_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v22;
  logCategory__hmf_once_uint64_t v22 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_notificationEnabledTime, 0);
  objc_storeStrong((id *)&self->_valueUpdatedTime, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)setNotificationEnabledByThisClient:(BOOL)a3
{
  self->_notificationEnabledByThisClient = a3;
}

- (_HMContext)context
{
  return self->_context;
}

- (NSString)localizedDescription
{
  char v3 = objc_opt_class();
  id v4 = [(HMCharacteristic *)self characteristicType];
  v5 = objc_msgSend(v3, "__localizedDescriptionForCharacteristicType:", v4);

  return (NSString *)v5;
}

- (id)_characteristicTypeDescription
{
  v2 = [(HMCharacteristic *)self characteristicType];
  char v3 = +[HMCharacteristic _characteristicTypeAsString:v2];

  return v3;
}

- (void)_updateAuthorizationData:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(HMCharacteristic *)self service];
  v8 = [v7 accessory];
  BOOL v9 = v8;
  if (v7 && v8)
  {
    [v8 _updateAuthorizationData:v13 forService:v7 characteristic:self completionHandler:v6];
  }
  else
  {
    id v10 = [(HMCharacteristic *)self context];
    id v11 = [v10 delegateCaller];
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
    [v11 callCompletion:v6 error:v12];
  }
}

- (void)updateAuthorizationData:(NSData *)data completionHandler:(void *)completion
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = data;
  id v7 = completion;
  v8 = [(HMCharacteristic *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristic updateAuthorizationData:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      objc_super v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  BOOL v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HMCharacteristic_updateAuthorizationData_completionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    int v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    int v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      __int16 v27 = 2080;
      objc_super v28 = "-[HMCharacteristic updateAuthorizationData:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __62__HMCharacteristic_updateAuthorizationData_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAuthorizationData:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_enableNotification:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMCharacteristic *)self service];
  v8 = [v7 accessory];
  BOOL v9 = [v8 home];
  if (!v9)
  {
    id v13 = [(HMCharacteristic *)self context];
    __int16 v14 = [v13 delegateCaller];
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 21;
LABEL_6:
    id v17 = [v15 errorWithDomain:@"HMErrorDomain" code:v16 userInfo:0];
    [v14 callCompletion:v6 error:v17];

    goto LABEL_7;
  }
  id v10 = [(HMCharacteristic *)self properties];
  char v11 = [v10 containsObject:@"HMCharacteristicPropertySupportsEventNotification"];

  if ((v11 & 1) == 0)
  {
    id v13 = [(HMCharacteristic *)self context];
    __int16 v14 = [v13 delegateCaller];
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 7;
    goto LABEL_6;
  }
  v18[0] = self;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v9 enableNotification:v4 forCharacteristics:v12 completionHandler:v6];

LABEL_7:
}

- (void)enableNotification:(BOOL)enable completionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = completion;
  id v7 = [(HMCharacteristic *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristic enableNotification:completionHandler:]", @"completion"];
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v19;
      __int16 v26 = 2112;
      __int16 v27 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__HMCharacteristic_enableNotification_completionHandler___block_invoke;
    block[3] = &unk_1E5941420;
    block[4] = self;
    BOOL v23 = enable;
    id v22 = v6;
    dispatch_async(v9, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v13;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMCharacteristic enableNotification:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    __int16 v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);
  }
}

uint64_t __57__HMCharacteristic_enableNotification_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableNotification:*(unsigned __int8 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
}

- (void)_readValueWithCompletionHandler:(id)a3
{
  id v15 = a3;
  BOOL v4 = [(HMCharacteristic *)self service];
  uint64_t v5 = [v4 accessory];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = [(HMCharacteristic *)self properties];
    char v8 = [v7 containsObject:@"HMCharacteristicPropertyReadable"];

    if (v8)
    {
      [v6 _readValueForCharacteristic:self completionHandler:v15];
    }
    else
    {
      int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:48 userInfo:0];
      id v13 = [(HMCharacteristic *)self context];
      __int16 v14 = [v13 delegateCaller];
      [v14 callCompletion:v15 error:v12];
    }
  }
  else
  {
    BOOL v9 = [(HMCharacteristic *)self context];
    id v10 = [v9 delegateCaller];
    char v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:21 userInfo:0];
    [v10 callCompletion:v15 error:v11];
  }
}

- (void)readValueWithCompletionHandler:(void *)completion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = completion;
  uint64_t v5 = [(HMCharacteristic *)self context];
  if (!v4)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristic readValueWithCompletionHandler:]", @"completion"];
    id v15 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v18;
      __int16 v26 = 2112;
      __int16 v27 = (const char *)v14;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0];
    objc_exception_throw(v19);
  }
  id v6 = (void *)v5;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"CharacteristicRead"];
    char v8 = [v6 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__HMCharacteristic_readValueWithCompletionHandler___block_invoke;
    block[3] = &unk_1E5945138;
    id v21 = v7;
    id v22 = self;
    id v23 = v4;
    id v9 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    char v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v25 = v13;
      __int16 v26 = 2080;
      __int16 v27 = "-[HMCharacteristic readValueWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, id))v4 + 2))(v4, v9);
  }
}

uint64_t __51__HMCharacteristic_readValueWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _readValueWithCompletionHandler:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);

  return [v2 end];
}

- (void)_writeValue:(id)a3 completionHandler:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    char v8 = [(HMCharacteristic *)self service];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = [v8 accessory];
      if (v10)
      {
        char v11 = (void *)v10;
        int v12 = [(HMCharacteristic *)self properties];
        char v13 = [v12 containsObject:@"HMCharacteristicPropertyWritable"];

        if (v13)
        {
          [v11 _writeValue:v6 forCharacteristic:self service:v9 completionHandler:v7];
        }
        else
        {
          v32 = [(HMCharacteristic *)self properties];
          int v33 = [v32 containsObject:@"HMCharacteristicPropertyReadable"];

          v34 = (void *)MEMORY[0x19F3A64A0]();
          v35 = self;
          v36 = HMFGetOSLogHandle();
          BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
          if (v33)
          {
            if (v37)
            {
              v38 = HMFGetLogIdentifier();
              int v44 = 138543362;
              v45 = v38;
              _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: characteristic is readonly", (uint8_t *)&v44, 0xCu);
            }
            uint64_t v39 = 5;
          }
          else
          {
            if (v37)
            {
              v40 = HMFGetLogIdentifier();
              int v44 = 138543362;
              v45 = v40;
              _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: characteristic is not writeable", (uint8_t *)&v44, 0xCu);
            }
            uint64_t v39 = 48;
          }

          v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v39];
          v42 = [(HMCharacteristic *)v35 context];
          v43 = [v42 delegateCaller];
          [v43 callCompletion:v7 error:v41];
        }
      }
      else
      {
        __int16 v25 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v26 = self;
        __int16 v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = HMFGetLogIdentifier();
          int v44 = 138543362;
          v45 = v28;
          _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: service's accessory is nil", (uint8_t *)&v44, 0xCu);
        }
        uint64_t v29 = [(HMCharacteristic *)v26 context];
        v30 = [v29 delegateCaller];
        uint64_t v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v30 callCompletion:v7 error:v31];

        char v11 = 0;
      }
    }
    else
    {
      id v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = self;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = HMFGetLogIdentifier();
        int v44 = 138543362;
        v45 = v22;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: service is nil", (uint8_t *)&v44, 0xCu);
      }
      char v11 = [(HMCharacteristic *)v20 context];
      id v23 = [v11 delegateCaller];
      id v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
      [v23 callCompletion:v7 error:v24];

      id v9 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v44 = 138543362;
      v45 = v17;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot write value for characteristic: value is nil", (uint8_t *)&v44, 0xCu);
    }
    id v9 = [(HMCharacteristic *)v15 context];
    char v11 = [v9 delegateCaller];
    uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v11 callCompletion:v7 error:v18];
  }
}

- (void)writeValue:(id)value completionHandler:(void *)completion
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = value;
  id v7 = completion;
  uint64_t v8 = [(HMCharacteristic *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristic writeValue:completionHandler:]", @"completion"];
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:@"CharacteristicWrite"];
    char v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__HMCharacteristic_writeValue_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v24 = v10;
    __int16 v25 = self;
    id v26 = v6;
    id v27 = v7;
    id v12 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    char v13 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v16;
      __int16 v30 = 2080;
      uint64_t v31 = "-[HMCharacteristic writeValue:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(void *, id))v7 + 2))(v7, v12);
  }
}

uint64_t __49__HMCharacteristic_writeValue_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  [*(id *)(a1 + 40) _writeValue:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);

  return [v2 end];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v9 = 0;
    goto LABEL_34;
  }
  id v6 = v5;
  id v7 = [(HMCharacteristic *)self metadata];
  uint64_t v8 = [v6 metadata];
  char v9 = [v7 mergeFromNewObject:v8];

  uint64_t v10 = [v6 properties];
  [(HMCharacteristic *)self setProperties:v10];

  char v11 = [v6 characteristicType];
  [(HMCharacteristic *)self setCharacteristicType:v11];

  objc_msgSend(v6, "setNotificationEnabledByThisClient:", -[HMCharacteristic notificationEnabledByThisClient](self, "notificationEnabledByThisClient"));
  -[HMCharacteristic setRequiresDeviceUnlock:](self, "setRequiresDeviceUnlock:", [v6 requiresDeviceUnlock]);
  LODWORD(v11) = [(HMCharacteristic *)self hasAuthorizationData];
  if (v11 != [v6 hasAuthorizationData])
  {
    -[HMCharacteristic setHasAuthorizationData:](self, "setHasAuthorizationData:", [v6 hasAuthorizationData]);
    id v12 = [(HMCharacteristic *)self service];
    char v13 = [v12 accessory];
    uint64_t v14 = [v13 delegate];
    if ([v14 conformsToProtocol:&unk_1EEF70C88]) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v3 = v15;

    if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v16 = [(HMCharacteristic *)self context];
      uint64_t v17 = [v16 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke;
      block[3] = &unk_1E5945650;
      void block[4] = self;
      id v55 = v3;
      id v56 = v13;
      dispatch_async(v17, block);
    }
  }
  uint64_t v18 = [(HMCharacteristic *)self value];
  id v19 = [(HMCharacteristic *)self valueUpdatedTime];
  if (!v19)
  {
    id v3 = [v6 value];
    if ((HMFEqualObjects() & 1) == 0)
    {

LABEL_19:
      id v24 = [v6 value];
      [(HMCharacteristic *)self setValue:v24];

      __int16 v25 = [v6 valueUpdatedTime];
      [(HMCharacteristic *)self setValueUpdatedTime:v25];

      int v23 = 1;
      goto LABEL_20;
    }
  }
  id v20 = [v6 valueUpdatedTime];
  id v21 = [(HMCharacteristic *)self valueUpdatedTime];
  uint64_t v22 = [v20 compare:v21];

  if (v19) {
  else
  }

  if (v22 == 1) {
    goto LABEL_19;
  }
  int v23 = 0;
LABEL_20:
  int v26 = [(HMCharacteristic *)self isNotificationEnabled];
  if (v26 != [v6 isNotificationEnabled])
  {
    -[HMCharacteristic setNotificationEnabled:](self, "setNotificationEnabled:", [v6 isNotificationEnabled]);
    int v23 = 1;
  }
  id v27 = [(HMCharacteristic *)self notificationEnabledTime];
  uint64_t v28 = [v6 notificationEnabledTime];
  char v29 = HMFEqualObjects();

  if ((v29 & 1) == 0)
  {
    __int16 v30 = [v6 notificationEnabledTime];
    [(HMCharacteristic *)self setNotificationEnabledTime:v30];

    int v23 = 1;
  }
  uint64_t v31 = +[HMHAPMetadata getSharedInstance];
  if (v23)
  {
    uint64_t v32 = [(HMCharacteristic *)self characteristicType];
    char v33 = [v31 shouldNotCacheCharacteristicOfType:v32];

    if ((v33 & 1) == 0)
    {
      v34 = [(HMCharacteristic *)self value];
      char v35 = HMFEqualObjects();

      if ((v35 & 1) == 0)
      {
        v36 = (void *)MEMORY[0x19F3A64A0]();
        BOOL v37 = self;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v47 = HMFGetLogIdentifier();
          [(HMCharacteristic *)v37 value];
          uint64_t v39 = v48 = v36;
          uint64_t v40 = [(HMCharacteristic *)v37 valueUpdatedTime];
          *(_DWORD *)buf = 138544130;
          v58 = v47;
          __int16 v59 = 2112;
          v60 = v18;
          __int16 v61 = 2112;
          v62 = v39;
          __int16 v63 = 2112;
          uint64_t v64 = v40;
          v41 = (void *)v40;
          _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_INFO, "%{public}@Merge updated characteristic value from %@ -> %@ with value updated date: %@", buf, 0x2Au);

          v36 = v48;
        }
      }
      v42 = [(HMCharacteristic *)self service];
      v43 = [v42 accessory];
      int v44 = [v43 delegate];
      if (objc_opt_respondsToSelector())
      {
        v49 = [(HMCharacteristic *)self context];
        v45 = [v49 queue];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_143;
        v50[3] = &unk_1E5944F20;
        v50[4] = self;
        id v51 = v44;
        id v52 = v43;
        id v53 = v42;
        dispatch_async(v45, v50);
      }
    }
  }

LABEL_34:
  return v9;
}

void __39__HMCharacteristic_mergeFromNewObject___block_invoke(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_2;
  v6[3] = &unk_1E5945650;
  id v7 = a1[5];
  id v4 = a1[6];
  id v5 = a1[4];
  id v8 = v4;
  id v9 = v5;
  [v3 invokeBlock:v6];
}

void __39__HMCharacteristic_mergeFromNewObject___block_invoke_143(id *a1)
{
  v2 = [a1[4] context];
  id v3 = [v2 delegateCaller];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__HMCharacteristic_mergeFromNewObject___block_invoke_2_144;
  v6[3] = &unk_1E5944F20;
  id v7 = a1[5];
  id v8 = a1[6];
  id v4 = a1[7];
  id v5 = a1[4];
  id v9 = v4;
  id v10 = v5;
  [v3 invokeBlock:v6];
}

uint64_t __39__HMCharacteristic_mergeFromNewObject___block_invoke_2_144(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) didUpdateValueForCharacteristic:*(void *)(a1 + 56)];
}

uint64_t __39__HMCharacteristic_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessory:*(void *)(a1 + 40) didUpdateHasAuthorizationDataForCharacteristic:*(void *)(a1 + 48)];
}

- (BOOL)hasAuthorizationData
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_hasAuthorizationData;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setValueUpdateTime:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSDate *)[v6 copy];
  valueUpdatedTime = self->_valueUpdatedTime;
  self->_valueUpdatedTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isNotificationEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_notificationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCharacteristicType:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v6);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  characteristicType = self->_characteristicType;
  self->_characteristicType = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_unconfigure
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_context)
  {
    [(HMCharacteristic *)self setService:0];
    [(HMCharacteristic *)self setContext:0];
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self];
  }
  else
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", buf, 0xCu);
    }
  }
}

- (HMCharacteristic)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = HMFGetLogIdentifier();
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2080;
    id v12 = "-[HMCharacteristic init]";
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_ERROR, "%{public}@%s is unsupported and will be removed in a future release", (uint8_t *)&v9, 0x16u);
  }
  id v6 = objc_alloc_init(HMService);
  id v7 = [(HMCharacteristic *)self initWithInstanceID:&unk_1EEF07A40 characteristicType:@"000000B0-0000-1000-8000-0026BB765291" service:v6 metadata:0];

  return v7;
}

+ (id)_characteristicTypeAsString:(id)a3
{
  id v3 = a3;
  id v4 = +[HMHAPMetadata getSharedInstance];
  id v5 = [v4 characteristicTypeDescription:v3];

  return v5;
}

- (NSDictionary)serializedDictionaryRepresentation
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = +[HMPBCharacteristicReference characteristicReferenceWithCharacteristic:self];
  v6[0] = @"HMShortcutsSerializedDictionaryVersion";
  v6[1] = @"HMShortcutsSerializedDictionaryProtocol";
  v7[0] = @"1.0";
  v7[1] = @"ProtoBuf";
  v6[2] = @"HMCharacteristicSerializedDataKey";
  id v3 = [v2 data];
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return (NSDictionary *)v4;
}

+ (HMCharacteristic)characteristicWithCharacteristicReference:(id)a3 home:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasUniqueIdentifier] & 1) == 0)
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a1;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v19;
      id v20 = "%{public}@CharacteristicReference uniqueIdentifier not set";
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v26, 0xCu);
    }
LABEL_11:

    uint64_t v14 = 0;
    goto LABEL_18;
  }
  if (([v6 hasServiceReference] & 1) == 0)
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = a1;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v19;
      id v20 = "%{public}@ServiceReference not set in characteristicReference";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = [v6 serviceReference];
  int v9 = +[HMService serviceWithServiceReference:v8 home:v7];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F29128];
    __int16 v11 = [v6 uniqueIdentifier];
    id v12 = objc_msgSend(v10, "hmf_UUIDWithBytesAsData:", v11);

    uint64_t v13 = [v9 _findCharacteristicWithUniqueIdentifier:v12];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v21 = (void *)MEMORY[0x19F3A64A0]();
      id v22 = a1;
      int v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        int v26 = 138543618;
        id v27 = v24;
        __int16 v28 = 2112;
        char v29 = v12;
        _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't find characteristic %@", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

LABEL_18:

  return (HMCharacteristic *)v14;
}

+ (HMCharacteristic)characteristicWithSerializedDictionaryRepresentation:(id)a3 home:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "hmf_dataForKey:", @"HMCharacteristicSerializedDataKey");
  id v8 = +[HMPBCharacteristicReference characteristicReferenceWithData:v7];
  int v9 = [a1 characteristicWithCharacteristicReference:v8 home:v6];

  return (HMCharacteristic *)v9;
}

@end