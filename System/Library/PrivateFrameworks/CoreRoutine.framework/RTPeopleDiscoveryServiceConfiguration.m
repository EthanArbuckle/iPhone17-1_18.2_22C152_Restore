@interface RTPeopleDiscoveryServiceConfiguration
+ (BOOL)supportsSecureCoding;
+ (double)secondsForStorageDuration:(unint64_t)a3;
+ (unint64_t)aggregateAdvertisingCapability:(unint64_t)a3 with:(unint64_t)a4;
+ (unint64_t)aggregateObservationInterval:(unint64_t)a3 with:(unint64_t)a4;
+ (unint64_t)aggregateServiceLevel:(unint64_t)a3 with:(unint64_t)a4;
+ (unint64_t)aggregateStorageDuration:(unint64_t)a3 with:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAdvertise;
- (RTPeopleDensityCallbackConfiguration)densityCallbackConfiguration;
- (RTPeopleDiscoveryServiceConfiguration)init;
- (RTPeopleDiscoveryServiceConfiguration)initWithAdvertisingCapability:(unint64_t)a3 serviceLevel:(unint64_t)a4 observationInterval:(unint64_t)a5 storageDuration:(unint64_t)a6 densityCallbackConfiguration:(id)a7;
- (RTPeopleDiscoveryServiceConfiguration)initWithAggregation:(id)a3;
- (RTPeopleDiscoveryServiceConfiguration)initWithCoder:(id)a3;
- (RTPeopleDiscoveryServiceConfiguration)initWithServiceLevel:(unint64_t)a3 storageDuration:(unint64_t)a4 observationInterval:(unint64_t)a5 densityCallbackConfiguration:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)advertisingCapability;
- (unint64_t)observationInterval;
- (unint64_t)serviceLevel;
- (unint64_t)storageDuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPeopleDiscoveryServiceConfiguration

- (RTPeopleDiscoveryServiceConfiguration)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithServiceLevel_storageDuration_observationInterval_densityCallbackConfiguration_);
}

- (RTPeopleDiscoveryServiceConfiguration)initWithServiceLevel:(unint64_t)a3 storageDuration:(unint64_t)a4 observationInterval:(unint64_t)a5 densityCallbackConfiguration:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  v12 = [(RTPeopleDiscoveryServiceConfiguration *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_advertisingCapability = 0;
    if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = a3;
        _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "serviceLevel %d out of bounds", buf, 8u);
      }

      a3 = 1;
    }
    v13->_serviceLevel = a3;
    if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = a4;
        _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "storageDuration %d out of bounds", buf, 8u);
      }

      a4 = 1;
    }
    v13->_storageDuration = a4;
    if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = a5;
        _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, "observationInterval %d out of bounds", buf, 8u);
      }

      a5 = 1;
    }
    v13->_observationInterval = a5;
    objc_storeStrong((id *)&v13->_densityCallbackConfiguration, a6);
  }

  return v13;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithAdvertisingCapability:(unint64_t)a3 serviceLevel:(unint64_t)a4 observationInterval:(unint64_t)a5 storageDuration:(unint64_t)a6 densityCallbackConfiguration:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  v14 = [(RTPeopleDiscoveryServiceConfiguration *)&v20 init];
  v15 = v14;
  if (v14)
  {
    v14->_advertisingCapability = a3;
    if (a4 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = a4;
        _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, "serviceLevel %d out of bounds", buf, 8u);
      }

      a4 = 1;
    }
    v15->_serviceLevel = a4;
    if (a5 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = a5;
        _os_log_error_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_ERROR, "observationInterval %d out of bounds", buf, 8u);
      }

      a5 = 1;
    }
    v15->_observationInterval = a5;
    if (a6 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
    {
      objc_super v18 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = a6;
        _os_log_error_impl(&dword_1A8FEF000, v18, OS_LOG_TYPE_ERROR, "storageDuration %d out of bounds", buf, 8u);
      }

      a6 = 1;
    }
    v15->_storageDuration = a6;
    objc_storeStrong((id *)&v15->_densityCallbackConfiguration, a7);
  }

  return v15;
}

+ (unint64_t)aggregateAdvertisingCapability:(unint64_t)a3 with:(unint64_t)a4
{
  return a4 | a3;
}

+ (unint64_t)aggregateServiceLevel:(unint64_t)a3 with:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v6 = a4 - 3 >= 0xFFFFFFFFFFFFFFFDLL;
    BOOL v7 = a4 == 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A90370B0[a3] <= dword_1A90370B0[a4]) {
      return a4;
    }
    else {
      return a3;
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "service level %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (unint64_t)aggregateObservationInterval:(unint64_t)a3 with:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 - 3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v6 = a4 - 3 >= 0xFFFFFFFFFFFFFFFDLL;
    BOOL v7 = a4 == 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A90370BC[a3] <= dword_1A90370BC[a4]) {
      return a4;
    }
    else {
      return a3;
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "observation interval %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (unint64_t)aggregateStorageDuration:(unint64_t)a3 with:(unint64_t)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    BOOL v6 = a4 - 4 >= 0xFFFFFFFFFFFFFFFCLL;
    BOOL v7 = a4 == 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v7 = 0;
  }
  if (!v7 && v6)
  {
    if (dword_1A90370A0[a3] <= dword_1A90370A0[a4]) {
      return a4;
    }
    else {
      return a3;
    }
  }
  else
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109376;
      v10[1] = v5;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v8, OS_LOG_TYPE_ERROR, "storage duration %d or %d out of bounds", (uint8_t *)v10, 0xEu);
    }

    return 1;
  }
}

+ (double)secondsForStorageDuration:(unint64_t)a3
{
  double result = 86400.0;
  if (a3 != 2) {
    double result = 0.0;
  }
  if (a3 == 3) {
    return 2419200.0;
  }
  return result;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithAggregation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryServiceConfiguration;
  int v5 = [(RTPeopleDiscoveryServiceConfiguration *)&v18 init];
  BOOL v6 = (RTPeopleDiscoveryServiceConfiguration *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1A9037090;
    *(int64x2_t *)(v5 + 24) = vdupq_n_s64(1uLL);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
          v6->_advertisingCapability = objc_msgSend((id)objc_opt_class(), "aggregateAdvertisingCapability:with:", v6->_advertisingCapability, objc_msgSend(v12, "advertisingCapability", (void)v14));
          v6->_serviceLevel = objc_msgSend((id)objc_opt_class(), "aggregateServiceLevel:with:", v6->_serviceLevel, objc_msgSend(v12, "serviceLevel"));
          v6->_observationInterval = objc_msgSend((id)objc_opt_class(), "aggregateObservationInterval:with:", v6->_observationInterval, objc_msgSend(v12, "observationInterval"));
          v6->_storageDuration = objc_msgSend((id)objc_opt_class(), "aggregateStorageDuration:with:", v6->_storageDuration, objc_msgSend(v12, "storageDuration"));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (BOOL)shouldAdvertise
{
  return [(RTPeopleDiscoveryServiceConfiguration *)self advertisingCapability] & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTPeopleDiscoveryServiceConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      BOOL v6 = [(RTPeopleDiscoveryServiceConfiguration *)self densityCallbackConfiguration];
      if (v6)
      {
        BOOL v7 = 0;
      }
      else
      {
        uint64_t v9 = [(RTPeopleDiscoveryServiceConfiguration *)v5 densityCallbackConfiguration];
        BOOL v7 = v9 == 0;
      }
      unint64_t v10 = [(RTPeopleDiscoveryServiceConfiguration *)self advertisingCapability];
      if (v10 == [(RTPeopleDiscoveryServiceConfiguration *)v5 advertisingCapability]
        && (unint64_t v11 = [(RTPeopleDiscoveryServiceConfiguration *)self serviceLevel],
            v11 == [(RTPeopleDiscoveryServiceConfiguration *)v5 serviceLevel])
        && (unint64_t v12 = [(RTPeopleDiscoveryServiceConfiguration *)self observationInterval],
            v12 == [(RTPeopleDiscoveryServiceConfiguration *)v5 observationInterval]))
      {
        unint64_t v13 = [(RTPeopleDiscoveryServiceConfiguration *)self storageDuration];
        char v8 = v13 == [(RTPeopleDiscoveryServiceConfiguration *)v5 storageDuration];
        if (v8) {
          char v14 = v7;
        }
        else {
          char v14 = 1;
        }
        if ((v14 & 1) == 0)
        {
          long long v15 = [(RTPeopleDiscoveryServiceConfiguration *)self densityCallbackConfiguration];
          long long v16 = [(RTPeopleDiscoveryServiceConfiguration *)v5 densityCallbackConfiguration];
          char v8 = [v15 isEqual:v16];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = v3;
  if (self->_advertisingCapability) {
    int v5 = @"Enabled";
  }
  else {
    int v5 = @"Disabled";
  }
  [v3 appendString:v5];
  unint64_t v6 = self->_serviceLevel - 1;
  if (v6 >= 2)
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      unint64_t serviceLevel = self->_serviceLevel;
      *(_DWORD *)buf = 138412546;
      v39 = v20;
      __int16 v40 = 1024;
      int v41 = serviceLevel;
      _os_log_error_impl(&dword_1A8FEF000, v7, OS_LOG_TYPE_ERROR, "%@ invalid serviceLevel %d", buf, 0x12u);
    }
  }
  unint64_t v8 = self->_observationInterval - 1;
  if (v8 >= 2)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      unint64_t observationInterval = self->_observationInterval;
      *(_DWORD *)buf = 138412546;
      v39 = v23;
      __int16 v40 = 1024;
      int v41 = observationInterval;
      _os_log_error_impl(&dword_1A8FEF000, v9, OS_LOG_TYPE_ERROR, "%@ invalid observationInterval %d", buf, 0x12u);
    }
  }
  unint64_t v10 = self->_storageDuration - 1;
  if (v10 >= 3)
  {
    unint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      unint64_t storageDuration = self->_storageDuration;
      *(_DWORD *)buf = 138412546;
      v39 = v26;
      __int16 v40 = 1024;
      int v41 = storageDuration;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "%@ invalid storageDuration %d", buf, 0x12u);
    }
  }
  v33 = v4;
  v28 = @"AdvertisingCapability";
  v29 = @"ServiceLevel";
  if (v6 > 1) {
    unint64_t v12 = &stru_1EFF84648;
  }
  else {
    unint64_t v12 = (__CFString *)ServiceLevelDescriptor[self->_serviceLevel];
  }
  v34 = v12;
  v30 = @"ObservationInterval";
  if (v8 > 1) {
    unint64_t v13 = &stru_1EFF84648;
  }
  else {
    unint64_t v13 = (__CFString *)ObservationIntervalDescriptor[self->_observationInterval];
  }
  v35 = v13;
  v31 = @"StorageDuration";
  if (v10 > 2) {
    char v14 = &stru_1EFF84648;
  }
  else {
    char v14 = (__CFString *)StorageDurationDescriptor[self->_storageDuration];
  }
  v36 = v14;
  v32 = @"DensityCallbackConfig";
  densityCallbackConfiguration = self->_densityCallbackConfiguration;
  if (densityCallbackConfiguration)
  {
    long long v16 = [(RTPeopleDensityCallbackConfiguration *)densityCallbackConfiguration description];
  }
  else
  {
    long long v16 = &stru_1EFF84648;
  }
  v37 = v16;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v28 count:5];
  if (densityCallbackConfiguration) {

  }
  return v17;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDiscoveryServiceConfiguration *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      unint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      unint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1A8FEF000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  BOOL v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t advertisingCapability = self->_advertisingCapability;
  unint64_t serviceLevel = self->_serviceLevel;
  unint64_t observationInterval = self->_observationInterval;
  unint64_t storageDuration = self->_storageDuration;
  densityCallbackConfiguration = self->_densityCallbackConfiguration;
  return (id)[v4 initWithAdvertisingCapability:advertisingCapability serviceLevel:serviceLevel observationInterval:observationInterval storageDuration:storageDuration densityCallbackConfiguration:densityCallbackConfiguration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoveryServiceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"AdvertisingCapability"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"ServiceLevel"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"ObservationInterval"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"StorageDuration"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DensityCallbackConfig"];

  unint64_t v10 = [(RTPeopleDiscoveryServiceConfiguration *)self initWithAdvertisingCapability:v5 serviceLevel:v6 observationInterval:v7 storageDuration:v8 densityCallbackConfiguration:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t advertisingCapability = self->_advertisingCapability;
  id v5 = a3;
  [v5 encodeInteger:advertisingCapability forKey:@"AdvertisingCapability"];
  [v5 encodeInteger:self->_serviceLevel forKey:@"ServiceLevel"];
  [v5 encodeInteger:self->_observationInterval forKey:@"ObservationInterval"];
  [v5 encodeInteger:self->_storageDuration forKey:@"StorageDuration"];
  [v5 encodeObject:self->_densityCallbackConfiguration forKey:@"DensityCallbackConfig"];
}

- (unint64_t)advertisingCapability
{
  return self->_advertisingCapability;
}

- (unint64_t)serviceLevel
{
  return self->_serviceLevel;
}

- (unint64_t)observationInterval
{
  return self->_observationInterval;
}

- (unint64_t)storageDuration
{
  return self->_storageDuration;
}

- (RTPeopleDensityCallbackConfiguration)densityCallbackConfiguration
{
  return self->_densityCallbackConfiguration;
}

- (void).cxx_destruct
{
}

@end