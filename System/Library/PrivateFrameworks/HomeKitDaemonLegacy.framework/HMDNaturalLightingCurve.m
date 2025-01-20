@interface HMDNaturalLightingCurve
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (int64_t)colorTemperatureMiredsFromKelvins:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDNaturalLightingCurve)initWithCoder:(id)a3;
- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5;
- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8;
- (NSArray)transitionPoints;
- (id)attributeDescriptions;
- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)transitionPointsWithmillisecondsElapsedSinceStartOfDay:(unint64_t)a3;
- (int64_t)maximumBrightness;
- (int64_t)maximumColorTemperature;
- (int64_t)minimumBrightness;
- (int64_t)minimumColorTemperature;
- (unint64_t)checksum;
- (unint64_t)colorTemperatureNotifyIntervalThresholdInMilliseconds;
- (unint64_t)colorTemperatureNotifyValueChangeThreshold;
- (unint64_t)colorTemperatureUpdateIntervalInMilliseconds;
- (unint64_t)hash;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setColorTemperatureNotifyIntervalThresholdInMilliseconds:(unint64_t)a3;
- (void)setColorTemperatureNotifyValueChangeThreshold:(unint64_t)a3;
- (void)setColorTemperatureUpdateIntervalInMilliseconds:(unint64_t)a3;
@end

@implementation HMDNaturalLightingCurve

- (void).cxx_destruct
{
}

- (void)setColorTemperatureUpdateIntervalInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureUpdateIntervalInMilliseconds = a3;
}

- (unint64_t)colorTemperatureUpdateIntervalInMilliseconds
{
  return self->_colorTemperatureUpdateIntervalInMilliseconds;
}

- (void)setColorTemperatureNotifyIntervalThresholdInMilliseconds:(unint64_t)a3
{
  self->_colorTemperatureNotifyIntervalThresholdInMilliseconds = a3;
}

- (unint64_t)colorTemperatureNotifyIntervalThresholdInMilliseconds
{
  return self->_colorTemperatureNotifyIntervalThresholdInMilliseconds;
}

- (void)setColorTemperatureNotifyValueChangeThreshold:(unint64_t)a3
{
  self->_colorTemperatureNotifyValueChangeThreshold = a3;
}

- (unint64_t)colorTemperatureNotifyValueChangeThreshold
{
  return self->_colorTemperatureNotifyValueChangeThreshold;
}

- (int64_t)maximumColorTemperature
{
  return self->_maximumColorTemperature;
}

- (int64_t)minimumColorTemperature
{
  return self->_minimumColorTemperature;
}

- (int64_t)maximumBrightness
{
  return self->_maximumBrightness;
}

- (int64_t)minimumBrightness
{
  return self->_minimumBrightness;
}

- (NSArray)transitionPoints
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (id)transitionPointsWithmillisecondsElapsedSinceStartOfDay:(unint64_t)a3
{
  v4 = self;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDNaturalLightingCurve *)self transitionPoints];
  uint64_t v6 = [(HMDNaturalLightingCurve *)v4 minimumBrightness];
  uint64_t v7 = [(HMDNaturalLightingCurve *)v4 maximumBrightness];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obunint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v73 = v7;
    uint64_t v74 = v6;
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v83;
    v78 = v4;
LABEL_3:
    uint64_t v14 = 0;
    uint64_t v80 = v10;
    uint64_t v76 = v10 + v9;
    unint64_t v15 = v11;
    v16 = v12;
    while (1)
    {
      if (*(void *)v83 != v13) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v82 + 1) + 8 * v14);
      v18 = objc_msgSend(v17, "targetCompletionDuration", v73);
      v19 = [v18 value];
      unint64_t v11 = [v19 unsignedLongLongValue] + v15;

      if (v11 == a3)
      {
        unint64_t v20 = v80 + v14;
        unint64_t v11 = a3;
        goto LABEL_16;
      }
      if (v15 <= a3 && v11 > a3) {
        break;
      }
      id v12 = v17;

      ++v14;
      unint64_t v15 = v11;
      v16 = v12;
      if (v9 == v14)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        uint64_t v10 = v76;
        v4 = v78;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    unint64_t v20 = v80 + v14;
LABEL_16:
    id v21 = v17;

    if (!v21)
    {
      v4 = v78;
      goto LABEL_23;
    }
    unint64_t v22 = v11 - a3;
    if ((uint64_t)(v11 - a3) >= 0)
    {
      v23 = obj;
      v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count") + 1);
      if (v11 == a3)
      {
        v25 = (void *)[objc_alloc(MEMORY[0x1E4F5BE68]) initWithValue:&unk_1F2DC7FA8];
        v26 = v21;
        id v27 = objc_alloc(MEMORY[0x1E4F5BC90]);
        v28 = [v26 scale];
        v29 = [v26 offset];
        v30 = (void *)[v27 initWithScale:v28 offset:v29 targetCompletionDuration:v25 startDelayDuration:0];

        [v24 addObject:v30];
        for (unint64_t i = v20 + 1; i < [obj count]; ++i)
        {
          v32 = [obj objectAtIndex:i];
          [v24 addObject:v32];
        }
        if (v20)
        {
          for (unint64_t j = 1; j <= v20; ++j)
          {
            v57 = [obj objectAtIndex:j];
            [v24 addObject:v57];
          }
        }

        id v21 = v26;
      }
      else if (v16)
      {
        v43 = [v21 targetCompletionDuration];
        v44 = [v43 value];
        unint64_t v45 = [v44 unsignedLongLongValue] - v22;

        id v46 = objc_alloc(MEMORY[0x1E4F5BE68]);
        v47 = [NSNumber numberWithLongLong:v22];
        uint64_t v48 = [v46 initWithValue:v47];

        unint64_t v77 = v45;
        v49 = [MEMORY[0x1E4F5BC90] transitionPointWithPreviousTransitionPoint:v16 nextTransitionPoint:v21 timeElapsedSincePreviousTransitionPoint:v45 minimumBrightness:v74 maximumBrightness:v73];
        objc_msgSend(v24, "addObject:");
        id v50 = objc_alloc(MEMORY[0x1E4F5BC90]);
        v51 = [v21 scale];
        v52 = [v21 offset];
        v79 = (void *)v48;
        uint64_t v53 = [v50 initWithScale:v51 offset:v52 targetCompletionDuration:v48 startDelayDuration:0];

        v75 = (void *)v53;
        [v24 addObject:v53];
        for (unint64_t k = v20 + 1; k < [obj count]; ++k)
        {
          v55 = [obj objectAtIndex:k];
          [v24 addObject:v55];
        }
        if (v20 >= 2)
        {
          uint64_t v58 = 1;
          do
          {
            v59 = [obj objectAtIndex:v58];
            [v24 addObject:v59];

            ++v58;
          }
          while (v80 + v14 != v58);
        }
        id v60 = objc_alloc(MEMORY[0x1E4F5BC90]);
        v61 = v49;
        v62 = [v49 scale];
        v63 = [v49 offset];
        id v64 = objc_alloc(MEMORY[0x1E4F5BE68]);
        v65 = [NSNumber numberWithUnsignedLongLong:v77];
        v66 = (void *)[v64 initWithValue:v65];
        v67 = (void *)[v60 initWithScale:v62 offset:v63 targetCompletionDuration:v66 startDelayDuration:0];

        [v24 addObject:v67];
        v23 = obj;
      }
      else
      {
        v68 = (void *)MEMORY[0x1D9452090]();
        v69 = v78;
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v87 = v71;
          __int16 v88 = 2048;
          unint64_t v89 = a3;
          _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);
        }
        v23 = obj;
      }
      v37 = (void *)[v24 copy];

      goto LABEL_46;
    }
    v38 = v21;
    v39 = (void *)MEMORY[0x1D9452090]();
    v40 = v78;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v42;
      __int16 v88 = 2048;
      unint64_t v89 = v22;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_ERROR, "%{public}@Time to reach next transiton point is negative: %lldms", buf, 0x16u);
    }
  }
  else
  {
    id v12 = 0;
LABEL_13:

    v16 = v12;
LABEL_23:
    v33 = (void *)MEMORY[0x1D9452090]();
    v34 = v4;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v36;
      __int16 v88 = 2048;
      unint64_t v89 = a3;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);
    }
  }
  v37 = (void *)MEMORY[0x1E4F1CBF0];
  v23 = obj;
LABEL_46:

  return v37;
}

- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(HMDNaturalLightingCurve *)self transitionPointsWithmillisecondsElapsedSinceStartOfDay:a4];
  uint64_t v8 = [v7 firstObject];

  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  if ([(HMDNaturalLightingCurve *)self minimumBrightness] > a3)
  {
    int64_t v9 = [(HMDNaturalLightingCurve *)self minimumBrightness];
LABEL_7:
    a3 = v9;
    goto LABEL_8;
  }
  if ([(HMDNaturalLightingCurve *)self maximumBrightness] < a3)
  {
    int64_t v9 = [(HMDNaturalLightingCurve *)self maximumBrightness];
    goto LABEL_7;
  }
LABEL_8:
  unint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543874;
    v17 = v14;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Transition point for milliseconds elapsed since start of day %llums is %@", (uint8_t *)&v16, 0x20u);
  }
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "colorTemperatureForBrightness:", a3));
LABEL_11:

  return v10;
}

- (unint64_t)checksum
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(HMDNaturalLightingCurve *)self transitionPoints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        *(_DWORD *)data = 0;
        *(_DWORD *)data = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
        CC_SHA256_Update(&c, data, 4u);
        LODWORD(v11) = 0;
        LODWORD(v11) = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
        CC_SHA256_Update(&c, &v11, 4u);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  int v12 = [(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold];
  CC_SHA256_Update(&c, &v12, 4u);
  unint64_t v11 = [(HMDNaturalLightingCurve *)self colorTemperatureNotifyIntervalThresholdInMilliseconds];
  CC_SHA256_Update(&c, &v11, 8u);
  unint64_t v10 = [(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds];
  CC_SHA256_Update(&c, &v10, 8u);
  CC_SHA256_Final(data, &c);
  return *(void *)data;
}

- (id)attributeDescriptions
{
  v41[11] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNaturalLightingCurve version](self, "version"));
  v39 = (void *)[v3 initWithName:@"Version" value:v40];
  v41[0] = v39;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
  v37 = (void *)[v4 initWithName:@"Minimum Brightness" value:v38];
  v41[1] = v37;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v36 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
  v35 = (void *)[v5 initWithName:@"Maximum Brightness" value:v36];
  v41[2] = v35;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = NSNumber;
  v34 = [(HMDNaturalLightingCurve *)self transitionPoints];
  v33 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
  v32 = (void *)[v6 initWithName:@"Transition Points Count" value:v33];
  v41[3] = v32;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v31 = [(HMDNaturalLightingCurve *)self transitionPoints];
  v30 = [v31 firstObject];
  v29 = (void *)[v8 initWithName:@"Transition Start Point" value:v30];
  v41[4] = v29;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"));
  id v27 = (void *)[v9 initWithName:@"Minimum Color Temperature" value:v28];
  v41[5] = v27;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"));
  unint64_t v11 = (void *)[v10 initWithName:@"Maximum Color Temperature" value:v26];
  v41[6] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
  long long v14 = (void *)[v12 initWithName:@"Color Temperature Notify Interval Threshold In Milliseconds" value:v13];
  v41[7] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"));
  v17 = (void *)[v15 initWithName:@"Color Temperature Notify Value Change Threshold" value:v16];
  v41[8] = v17;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  unint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"));
  uint64_t v20 = (void *)[v18 initWithName:@"Color Temperature Update Interval In Milliseconds" value:v19];
  v41[9] = v20;
  id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDNaturalLightingCurve checksum](self, "checksum"));
  v23 = (void *)[v21 initWithName:@"Transition Checksum" value:v22];
  v41[10] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:11];

  return v24;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMDMutableNaturalLightingCurve allocWithZone:a3];
  unint64_t v5 = [(HMDNaturalLightingCurve *)self version];
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  uint64_t v7 = [(HMDNaturalLightingCurve *)v4 initWithVersion:v5 transitionPoints:v6 minimumBrightness:[(HMDNaturalLightingCurve *)self minimumBrightness] maximumBrightness:[(HMDNaturalLightingCurve *)self maximumBrightness] minimumColorTemperature:[(HMDNaturalLightingCurve *)self minimumColorTemperature] maximumColorTemperature:[(HMDNaturalLightingCurve *)self maximumColorTemperature]];

  [(HMDNaturalLightingCurve *)v7 setColorTemperatureNotifyIntervalThresholdInMilliseconds:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyIntervalThresholdInMilliseconds]];
  [(HMDNaturalLightingCurve *)v7 setColorTemperatureNotifyValueChangeThreshold:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold]];
  [(HMDNaturalLightingCurve *)v7 setColorTemperatureUpdateIntervalInMilliseconds:[(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds]];
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19 != -1) {
    dispatch_once(&logCategory__hmf_once_t19, &__block_literal_global_66799);
  }
  v2 = (void *)logCategory__hmf_once_v20;
  return v2;
}

uint64_t __38__HMDNaturalLightingCurve_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20;
  logCategory__hmf_once_uint64_t v20 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (int64_t)colorTemperatureMiredsFromKelvins:(int64_t)a3
{
  if (a3) {
    return 1000000 / a3;
  }
  id v4 = (void *)_HMFPreconditionFailure();
  return +[HMDNaturalLightingCurve supportsSecureCoding];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMDNaturalLightingCurve *)self version];
  int64_t v4 = [(HMDNaturalLightingCurve *)self minimumBrightness] ^ v3;
  int64_t v5 = v4 ^ [(HMDNaturalLightingCurve *)self maximumBrightness];
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  uint64_t v7 = [v6 count];

  int64_t v8 = v5 ^ v7 ^ [(HMDNaturalLightingCurve *)self minimumColorTemperature];
  int64_t v9 = [(HMDNaturalLightingCurve *)self maximumColorTemperature];
  unint64_t v10 = v9 ^ [(HMDNaturalLightingCurve *)self colorTemperatureNotifyIntervalThresholdInMilliseconds];
  unint64_t v11 = v10 ^ [(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds];
  return v8 ^ v11 ^ [(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (v6
    && (uint64_t v8 = [v6 version], v8 == -[HMDNaturalLightingCurve version](self, "version"))
    && (uint64_t v9 = [v7 minimumBrightness],
        v9 == [(HMDNaturalLightingCurve *)self minimumBrightness])
    && (uint64_t v10 = [v7 maximumBrightness],
        v10 == [(HMDNaturalLightingCurve *)self maximumBrightness]))
  {
    unint64_t v11 = [v7 transitionPoints];
    id v12 = [(HMDNaturalLightingCurve *)self transitionPoints];
    if ([v11 isEqual:v12]
      && (uint64_t v13 = [v7 minimumColorTemperature],
          v13 == [(HMDNaturalLightingCurve *)self minimumColorTemperature])
      && (uint64_t v14 = [v7 maximumColorTemperature],
          v14 == [(HMDNaturalLightingCurve *)self maximumColorTemperature])
      && (uint64_t v15 = [v7 colorTemperatureNotifyIntervalThresholdInMilliseconds],
          v15 == -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"))&& (uint64_t v16 = [v7 colorTemperatureNotifyValueChangeThreshold], v16 == -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold")))
    {
      uint64_t v17 = [v7 colorTemperatureUpdateIntervalInMilliseconds];
      BOOL v18 = v17 == [(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds];
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve version](self, "version"), @"HNLCurve.vk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"), @"HNLCurve.mibk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"), @"HNLCurve.mabk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"), @"HNLCurve.mictk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"), @"HNLCurve.mactk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"), @"HNLCurve.ctnvctk");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"), @"HNLCurve.ctnitk");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"), @"HNLCurve.ctuik");
  int64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v18 = 0;
        id v12 = [v11 serializeWithError:&v18];
        id v13 = v18;
        if (!v12)
        {
          uint64_t v14 = (void *)MEMORY[0x1D9452090]();
          uint64_t v15 = self;
          uint64_t v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v24 = v17;
            __int16 v25 = 2112;
            v26 = v11;
            __int16 v27 = 2112;
            id v28 = v13;
            _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition point %@:%@", buf, 0x20u);
          }

          goto LABEL_13;
        }
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v6 = (void *)[v5 copy];
  [v4 encodeObject:v6 forKey:@"HNLCurve.tpk"];
LABEL_13:
}

- (HMDNaturalLightingCurve)initWithCoder:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HNLCurve.vk"];
  if (v5 != 1)
  {
    uint64_t v18 = v5;
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    long long v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v58 = v19;
    __int16 v59 = 2048;
    uint64_t v60 = v18;
    __int16 v61 = 2048;
    uint64_t v62 = 1;
    long long v20 = "%{public}@Curve version is not equal to (%ld != %ld)";
    long long v21 = v13;
    uint32_t v22 = 32;
LABEL_14:
    _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);

    goto LABEL_25;
  }
  uint64_t v6 = [v4 decodeIntegerForKey:@"HNLCurve.mabk"];
  if (v6 <= 0)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    long long v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v58 = v19;
    __int16 v59 = 2048;
    uint64_t v60 = v6;
    long long v20 = "%{public}@Maximum brightness is less than or equal to 0: %ld";
    long long v21 = v13;
    uint32_t v22 = 22;
    goto LABEL_14;
  }
  uint64_t v7 = [v4 decodeIntegerForKey:@"HNLCurve.mibk"];
  uint64_t v8 = v7;
  if (v7 <= 0)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v58 = v14;
    __int16 v59 = 2048;
    uint64_t v60 = v8;
    uint64_t v15 = "%{public}@Minimum brightness is less than or equal to 0: %ld";
LABEL_23:
    uint64_t v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_24;
  }
  if (v7 >= (unint64_t)v6)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v58 = v23;
      __int16 v59 = 2048;
      uint64_t v60 = v8;
      __int16 v61 = 2048;
      uint64_t v62 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Minimum brightness is greater than equal to maximum brightness (%ld:%ld)", buf, 0x20u);
    }
    goto LABEL_25;
  }
  uint64_t v9 = [v4 decodeIntegerForKey:@"HNLCurve.mictk"];
  if (v9 <= 0)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v58 = v14;
    __int16 v59 = 2048;
    uint64_t v60 = v9;
    uint64_t v15 = "%{public}@Minimum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  uint64_t v10 = [v4 decodeIntegerForKey:@"HNLCurve.mactk"];
  if (!v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v58 = v14;
    __int16 v59 = 2048;
    uint64_t v60 = 0;
    uint64_t v15 = "%{public}@Maximum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  if (v9 > v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v58 = v14;
      __int16 v59 = 2048;
      uint64_t v60 = v9;
      __int16 v61 = 2048;
      uint64_t v62 = v11;
      uint64_t v15 = "%{public}@Minimum color temperature is greater than maximum color temperature (%ld:%ld)";
      uint64_t v16 = v13;
      uint32_t v17 = 32;
LABEL_24:
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
LABEL_25:

    v24 = 0;
    goto LABEL_26;
  }
  uint64_t v45 = v10;
  v26 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v28 = [v26 setWithArray:v27];

  v29 = [v4 decodeObjectOfClasses:v28 forKey:@"HNLCurve.tpk"];
  if (v29)
  {
    uint64_t v44 = v9;
    v47 = v28;
    v49 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v46 = v29;
    obunint64_t j = v29;
    uint64_t v30 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          id v50 = 0;
          v35 = [MEMORY[0x1E4F5BC90] parsedFromData:v34 error:&v50];
          id v36 = v50;
          if (!v35)
          {
            v38 = (void *)MEMORY[0x1D9452090]();
            self = self;
            v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              uint64_t v58 = v40;
              __int16 v59 = 2112;
              uint64_t v60 = v34;
              __int16 v61 = 2112;
              uint64_t v62 = (uint64_t)v36;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse encoded transition point %@:%@", buf, 0x20u);
            }

            v24 = 0;
            v29 = v46;
            id v28 = v47;
            v37 = v49;
            goto LABEL_46;
          }
          [v49 addObject:v35];
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    v37 = v49;
    if ([v49 count])
    {
      self = [(HMDNaturalLightingCurve *)self initWithVersion:1 transitionPoints:v49 minimumBrightness:v8 maximumBrightness:v6 minimumColorTemperature:v44 maximumColorTemperature:v45];
      -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](self, "setColorTemperatureNotifyValueChangeThreshold:", [v4 decodeIntegerForKey:@"HNLCurve.ctnvctk"]);
      -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](self, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", [v4 decodeInt64ForKey:@"HNLCurve.ctnitk"]);
      -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](self, "setColorTemperatureUpdateIntervalInMilliseconds:", [v4 decodeInt64ForKey:@"HNLCurve.ctuik"]);
      v24 = self;
    }
    else
    {
      v24 = 0;
    }
    v29 = v46;
    id v28 = v47;
LABEL_46:
  }
  else
  {
    v41 = (void *)MEMORY[0x1D9452090]();
    self = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v58 = v43;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode transition points", buf, 0xCu);
    }
    v24 = 0;
  }

LABEL_26:
  return v24;
}

- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = [v6 transitionPoints];
  v40 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obunint64_t j = [v6 transitionPoints];
  uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (v41)
  {
    uint64_t v38 = *(void *)v43;
    id v34 = v6;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        int64_t v13 = objc_msgSend(v12, "colorTemperatureForBrightness:", objc_msgSend(v6, "minimumBrightness"));
        int64_t v14 = v13;
        if (v13 <= a4) {
          int64_t v15 = a4;
        }
        else {
          int64_t v15 = v13;
        }
        if (v13 <= a5) {
          int64_t v16 = v15;
        }
        else {
          int64_t v16 = a5;
        }
        int64_t v17 = objc_msgSend(v12, "colorTemperatureForBrightness:", objc_msgSend(v6, "maximumBrightness"));
        if (v17 <= a4) {
          int64_t v18 = a4;
        }
        else {
          int64_t v18 = v17;
        }
        if (v17 <= a5) {
          int64_t v19 = v18;
        }
        else {
          int64_t v19 = a5;
        }
        if (v17 > a5 || v17 < a4 || v14 > a5 || v14 < a4)
        {
          v37 = (void *)MEMORY[0x1E4F5BC90];
          uint64_t v36 = [v6 minimumBrightness];
          uint64_t v23 = [v6 maximumBrightness];
          v24 = [v12 targetCompletionDuration];
          __int16 v25 = [v24 value];
          v26 = objc_msgSend(v37, "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", v36, v16, v23, v19, objc_msgSend(v25, "unsignedLongLongValue"));

          id v6 = v34;
        }
        else
        {
          v26 = (void *)[v12 copy];
        }
        [v40 addObject:v26];
        if (v16 >= v19) {
          int64_t v27 = v19;
        }
        else {
          int64_t v27 = v16;
        }
        if (v10 >= v27) {
          uint64_t v28 = v27;
        }
        else {
          uint64_t v28 = v10;
        }
        if (v10 <= 0) {
          uint64_t v10 = v27;
        }
        else {
          uint64_t v10 = v28;
        }
        if (v19 <= v16) {
          int64_t v29 = v16;
        }
        else {
          int64_t v29 = v19;
        }
        if (v9 <= v29) {
          uint64_t v30 = v29;
        }
        else {
          uint64_t v30 = v9;
        }
        if (v9 <= 0) {
          uint64_t v9 = v29;
        }
        else {
          uint64_t v9 = v30;
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v41);
  }

  uint64_t v31 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](self, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", [v6 version], v40, objc_msgSend(v6, "minimumBrightness"), objc_msgSend(v6, "maximumBrightness"), v10, v9);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v31, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", [v6 colorTemperatureNotifyIntervalThresholdInMilliseconds]);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v31, "setColorTemperatureNotifyValueChangeThreshold:", [v6 colorTemperatureNotifyValueChangeThreshold]);
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v31, "setColorTemperatureUpdateIntervalInMilliseconds:", [v6 colorTemperatureUpdateIntervalInMilliseconds]);

  return v31;
}

- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8
{
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDNaturalLightingCurve;
  int64_t v15 = [(HMDNaturalLightingCurve *)&v20 init];
  int64_t v16 = v15;
  if (v15)
  {
    v15->_version = a3;
    uint64_t v17 = [v14 copy];
    transitionPoints = v16->_transitionPoints;
    v16->_transitionPoints = (NSArray *)v17;

    v16->_minimumBrightness = a5;
    v16->_maximumBrightness = a6;
    v16->_minimumColorTemperature = a7;
    v16->_maximumColorTemperature = a8;
  }

  return v16;
}

@end