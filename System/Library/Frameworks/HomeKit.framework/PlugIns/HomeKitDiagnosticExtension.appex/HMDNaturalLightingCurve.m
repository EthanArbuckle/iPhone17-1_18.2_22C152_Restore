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
  v5 = [(HMDNaturalLightingCurve *)self transitionPoints];
  int64_t v6 = [(HMDNaturalLightingCurve *)v4 minimumBrightness];
  int64_t v7 = [(HMDNaturalLightingCurve *)v4 maximumBrightness];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obunint64_t j = v5;
  v8 = (char *)[obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v8)
  {
    v9 = v8;
    int64_t v73 = v7;
    int64_t v74 = v6;
    v10 = 0;
    v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v83;
    v78 = v4;
LABEL_3:
    v14 = 0;
    v80 = v10;
    v76 = &v9[(void)v10];
    unint64_t v15 = (unint64_t)v11;
    v16 = v12;
    while (1)
    {
      if (*(void *)v83 != v13) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v14);
      v18 = objc_msgSend(v17, "targetCompletionDuration", v73);
      v19 = [v18 value];
      v11 = (char *)[v19 unsignedLongLongValue] + v15;

      if (v11 == (char *)a3)
      {
        unint64_t v20 = (unint64_t)&v14[(void)v80];
        v11 = (char *)a3;
        goto LABEL_16;
      }
      if (v15 <= a3 && (unint64_t)v11 > a3) {
        break;
      }
      id v12 = v17;

      ++v14;
      unint64_t v15 = (unint64_t)v11;
      v16 = v12;
      if (v9 == v14)
      {
        v9 = (char *)[obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        v10 = v76;
        v4 = v78;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    unint64_t v20 = (unint64_t)&v14[(void)v80];
LABEL_16:
    id v21 = v17;

    if (!v21)
    {
      v4 = v78;
      goto LABEL_23;
    }
    v22 = &v11[-a3];
    if ((uint64_t)&v11[-a3] >= 0)
    {
      v23 = obj;
      v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[obj count] + 1);
      if (v11 == (char *)a3)
      {
        id v25 = [objc_alloc((Class)HAPTLVUnsignedNumberValue) initWithValue:&off_10002F2E8];
        v26 = v21;
        id v27 = objc_alloc((Class)HAPCharacteristicValueLinearDerivedTransitionPoint);
        v28 = [v26 scale];
        v29 = [v26 offset];
        id v30 = [v27 initWithScale:v28 offset:v29 targetCompletionDuration:v25 startDelayDuration:0];

        [v24 addObject:v30];
        for (unint64_t i = v20 + 1; i < (unint64_t)[obj count]; ++i)
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
        v45 = (char *)((unsigned char *)[v44 unsignedLongLongValue] - v22);

        id v46 = objc_alloc((Class)HAPTLVUnsignedNumberValue);
        v47 = +[NSNumber numberWithLongLong:v22];
        id v48 = [v46 initWithValue:v47];

        v77 = v45;
        v49 = +[HAPCharacteristicValueLinearDerivedTransitionPoint transitionPointWithPreviousTransitionPoint:v16 nextTransitionPoint:v21 timeElapsedSincePreviousTransitionPoint:v45 minimumBrightness:v74 maximumBrightness:v73];
        objc_msgSend(v24, "addObject:");
        id v50 = objc_alloc((Class)HAPCharacteristicValueLinearDerivedTransitionPoint);
        v51 = [v21 scale];
        v52 = [v21 offset];
        v79 = v48;
        id v53 = [v50 initWithScale:v51 offset:v52 targetCompletionDuration:v48 startDelayDuration:0];

        v75 = v53;
        [v24 addObject:v53];
        for (unint64_t k = v20 + 1; k < (unint64_t)[obj count]; ++k)
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
          while (&v14[(void)v80] != (char *)v58);
        }
        id v60 = objc_alloc((Class)HAPCharacteristicValueLinearDerivedTransitionPoint);
        v61 = v49;
        v62 = [v49 scale];
        v63 = [v49 offset];
        id v64 = objc_alloc((Class)HAPTLVUnsignedNumberValue);
        v65 = +[NSNumber numberWithUnsignedLongLong:v77];
        id v66 = [v64 initWithValue:v65];
        id v67 = [v60 initWithScale:v62 offset:v63 targetCompletionDuration:v66 startDelayDuration:0];

        [v24 addObject:v67];
        v23 = obj;
      }
      else
      {
        v69 = v78;
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          v71 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v87 = v71;
          __int16 v88 = 2048;
          unint64_t v89 = a3;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);
        }
        v23 = obj;
      }
      id v37 = [v24 copy];

      goto LABEL_46;
    }
    v38 = v21;
    v40 = v78;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v42;
      __int16 v88 = 2048;
      unint64_t v89 = (unint64_t)v22;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@Time to reach next transiton point is negative: %lldms", buf, 0x16u);
    }
  }
  else
  {
    id v12 = 0;
LABEL_13:

    v16 = v12;
LABEL_23:
    v34 = v4;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v87 = v36;
      __int16 v88 = 2048;
      unint64_t v89 = a3;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@Next transition point for current time: %llums not found", buf, 0x16u);
    }
  }
  id v37 = &__NSArray0__struct;
  v23 = obj;
LABEL_46:

  return v37;
}

- (id)colorTemperatureForBrightness:(int64_t)a3 millisecondsElapsedSinceStartOfDay:(unint64_t)a4
{
  int64_t v7 = [(HMDNaturalLightingCurve *)self transitionPointsWithmillisecondsElapsedSinceStartOfDay:a4];
  v8 = [v7 firstObject];

  if (!v8)
  {
    v10 = 0;
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
  id v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543874;
    v17 = v14;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Transition point for milliseconds elapsed since start of day %llums is %@", (uint8_t *)&v16, 0x20u);
  }
  v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 colorTemperatureForBrightness:a3]);
LABEL_11:

  return v10;
}

- (unint64_t)checksum
{
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(HMDNaturalLightingCurve *)self transitionPoints];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      int64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        *(_DWORD *)data = 0;
        *(_DWORD *)data = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"));
        CC_SHA256_Update(&c, data, 4u);
        LODWORD(v11) = 0;
        LODWORD(v11) = objc_msgSend(v8, "colorTemperatureForBrightness:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"));
        CC_SHA256_Update(&c, &v11, 4u);
        int64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  unsigned int v12 = [(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold];
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
  id v3 = objc_alloc((Class)HMFAttributeDescription);
  v39 = +[NSNumber numberWithUnsignedInteger:[(HMDNaturalLightingCurve *)self version]];
  id v38 = [v3 initWithName:@"Version" value:v39];
  v40[0] = v38;
  id v4 = objc_alloc((Class)HMFAttributeDescription);
  id v37 = +[NSNumber numberWithInteger:[(HMDNaturalLightingCurve *)self minimumBrightness]];
  id v36 = [v4 initWithName:@"Minimum Brightness" value:v37];
  v40[1] = v36;
  id v5 = objc_alloc((Class)HMFAttributeDescription);
  v35 = +[NSNumber numberWithInteger:[(HMDNaturalLightingCurve *)self maximumBrightness]];
  id v34 = [v5 initWithName:@"Maximum Brightness" value:v35];
  v40[2] = v34;
  id v6 = objc_alloc((Class)HMFAttributeDescription);
  v33 = [(HMDNaturalLightingCurve *)self transitionPoints];
  v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 count]);
  id v31 = [v6 initWithName:@"Transition Points Count" value:v32];
  v40[3] = v31;
  id v7 = objc_alloc((Class)HMFAttributeDescription);
  id v30 = [(HMDNaturalLightingCurve *)self transitionPoints];
  v29 = [v30 firstObject];
  id v28 = [v7 initWithName:@"Transition Start Point" value:v29];
  v40[4] = v28;
  id v8 = objc_alloc((Class)HMFAttributeDescription);
  id v27 = +[NSNumber numberWithInteger:[(HMDNaturalLightingCurve *)self minimumColorTemperature]];
  id v26 = [v8 initWithName:@"Minimum Color Temperature" value:v27];
  v40[5] = v26;
  id v9 = objc_alloc((Class)HMFAttributeDescription);
  id v25 = +[NSNumber numberWithInteger:[(HMDNaturalLightingCurve *)self maximumColorTemperature]];
  id v10 = [v9 initWithName:@"Maximum Color Temperature" value:v25];
  v40[6] = v10;
  id v11 = objc_alloc((Class)HMFAttributeDescription);
  unsigned int v12 = +[NSNumber numberWithUnsignedLongLong:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyIntervalThresholdInMilliseconds]];
  id v13 = [v11 initWithName:@"Color Temperature Notify Interval Threshold In Milliseconds" value:v12];
  v40[7] = v13;
  id v14 = objc_alloc((Class)HMFAttributeDescription);
  long long v15 = +[NSNumber numberWithUnsignedInteger:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold]];
  id v16 = [v14 initWithName:@"Color Temperature Notify Value Change Threshold" value:v15];
  v40[8] = v16;
  id v17 = objc_alloc((Class)HMFAttributeDescription);
  __int16 v18 = +[NSNumber numberWithUnsignedLongLong:[(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds]];
  id v19 = [v17 initWithName:@"Color Temperature Update Interval In Milliseconds" value:v18];
  v40[9] = v19;
  id v20 = objc_alloc((Class)HMFAttributeDescription);
  id v21 = +[NSNumber numberWithUnsignedLongLong:[(HMDNaturalLightingCurve *)self checksum]];
  id v22 = [v20 initWithName:@"Transition Checksum" value:v21];
  v40[10] = v22;
  v23 = +[NSArray arrayWithObjects:v40 count:11];

  return v23;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMDMutableNaturalLightingCurve allocWithZone:a3];
  unint64_t v5 = [(HMDNaturalLightingCurve *)self version];
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  id v7 = [(HMDNaturalLightingCurve *)v4 initWithVersion:v5 transitionPoints:v6 minimumBrightness:[(HMDNaturalLightingCurve *)self minimumBrightness] maximumBrightness:[(HMDNaturalLightingCurve *)self maximumBrightness] minimumColorTemperature:[(HMDNaturalLightingCurve *)self minimumColorTemperature] maximumColorTemperature:[(HMDNaturalLightingCurve *)self maximumColorTemperature]];

  [(HMDNaturalLightingCurve *)v7 setColorTemperatureNotifyIntervalThresholdInMilliseconds:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyIntervalThresholdInMilliseconds]];
  [(HMDNaturalLightingCurve *)v7 setColorTemperatureNotifyValueChangeThreshold:[(HMDNaturalLightingCurve *)self colorTemperatureNotifyValueChangeThreshold]];
  [(HMDNaturalLightingCurve *)v7 setColorTemperatureUpdateIntervalInMilliseconds:[(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds]];
  return v7;
}

+ (id)logCategory
{
  if (qword_100036C18 != -1) {
    dispatch_once(&qword_100036C18, &stru_10002C948);
  }
  v2 = (void *)qword_100036C20;

  return v2;
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
  unint64_t v4 = [(HMDNaturalLightingCurve *)self minimumBrightness] ^ v3;
  unint64_t v5 = v4 ^ [(HMDNaturalLightingCurve *)self maximumBrightness];
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  unint64_t v7 = (unint64_t)[v6 count];

  unint64_t v8 = v5 ^ v7 ^ [(HMDNaturalLightingCurve *)self minimumColorTemperature];
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
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  unint64_t v7 = v6;
  if (v6
    && (id v8 = [v6 version], v8 == (id)-[HMDNaturalLightingCurve version](self, "version"))
    && (id v9 = [v7 minimumBrightness],
        v9 == (id)[(HMDNaturalLightingCurve *)self minimumBrightness])
    && (id v10 = [v7 maximumBrightness],
        v10 == (id)[(HMDNaturalLightingCurve *)self maximumBrightness]))
  {
    unint64_t v11 = [v7 transitionPoints];
    unsigned int v12 = [(HMDNaturalLightingCurve *)self transitionPoints];
    if ([v11 isEqual:v12]
      && (id v13 = [v7 minimumColorTemperature],
          v13 == (id)[(HMDNaturalLightingCurve *)self minimumColorTemperature])
      && (id v14 = [v7 maximumColorTemperature],
          v14 == (id)[(HMDNaturalLightingCurve *)self maximumColorTemperature])
      && (id v15 = [v7 colorTemperatureNotifyIntervalThresholdInMilliseconds],
          v15 == (id)-[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"))&& (id v16 = [v7 colorTemperatureNotifyValueChangeThreshold], v16 == (id)-[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold")))
    {
      id v17 = [v7 colorTemperatureUpdateIntervalInMilliseconds];
      BOOL v18 = v17 == (id)[(HMDNaturalLightingCurve *)self colorTemperatureUpdateIntervalInMilliseconds];
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
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve version](self, "version"), @"HNLCurve.vk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumBrightness](self, "minimumBrightness"), @"HNLCurve.mibk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumBrightness](self, "maximumBrightness"), @"HNLCurve.mabk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve minimumColorTemperature](self, "minimumColorTemperature"), @"HNLCurve.mictk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve maximumColorTemperature](self, "maximumColorTemperature"), @"HNLCurve.mactk");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyValueChangeThreshold](self, "colorTemperatureNotifyValueChangeThreshold"), @"HNLCurve.ctnvctk");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureNotifyIntervalThresholdInMilliseconds](self, "colorTemperatureNotifyIntervalThresholdInMilliseconds"), @"HNLCurve.ctnitk");
  objc_msgSend(v4, "encodeInt64:forKey:", -[HMDNaturalLightingCurve colorTemperatureUpdateIntervalInMilliseconds](self, "colorTemperatureUpdateIntervalInMilliseconds"), @"HNLCurve.ctuik");
  unint64_t v5 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(HMDNaturalLightingCurve *)self transitionPoints];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v10);
        id v18 = 0;
        unsigned int v12 = [v11 serializeWithError:&v18];
        id v13 = v18;
        if (!v12)
        {
          id v15 = self;
          id v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v24 = v17;
            __int16 v25 = 2112;
            id v26 = v11;
            __int16 v27 = 2112;
            id v28 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition point %@:%@", buf, 0x20u);
          }

          goto LABEL_13;
        }
        [v5 addObject:v12];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v6 = [v5 copy];
  [v4 encodeObject:v6 forKey:@"HNLCurve.tpk"];
LABEL_13:
}

- (HMDNaturalLightingCurve)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"HNLCurve.vk"];
  if (v5 != (id)1)
  {
    id v18 = v5;
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    long long v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v57 = v19;
    __int16 v58 = 2048;
    id v59 = v18;
    __int16 v60 = 2048;
    uint64_t v61 = 1;
    long long v20 = "%{public}@Curve version is not equal to (%ld != %ld)";
    long long v21 = v13;
    uint32_t v22 = 32;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);

    goto LABEL_25;
  }
  id v6 = [v4 decodeIntegerForKey:@"HNLCurve.mabk"];
  if ((uint64_t)v6 <= 0)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    long long v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v57 = v19;
    __int16 v58 = 2048;
    id v59 = v6;
    long long v20 = "%{public}@Maximum brightness is less than or equal to 0: %ld";
    long long v21 = v13;
    uint32_t v22 = 22;
    goto LABEL_14;
  }
  id v7 = [v4 decodeIntegerForKey:@"HNLCurve.mibk"];
  id v8 = v7;
  if ((uint64_t)v7 <= 0)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v57 = v14;
    __int16 v58 = 2048;
    id v59 = v8;
    id v15 = "%{public}@Minimum brightness is less than or equal to 0: %ld";
LABEL_23:
    id v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_24;
  }
  if (v7 >= v6)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v57 = v23;
      __int16 v58 = 2048;
      id v59 = v8;
      __int16 v60 = 2048;
      uint64_t v61 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Minimum brightness is greater than equal to maximum brightness (%ld:%ld)", buf, 0x20u);
    }
    goto LABEL_25;
  }
  id v9 = [v4 decodeIntegerForKey:@"HNLCurve.mictk"];
  if ((uint64_t)v9 <= 0)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v57 = v14;
    __int16 v58 = 2048;
    id v59 = v9;
    id v15 = "%{public}@Minimum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  id v10 = [v4 decodeIntegerForKey:@"HNLCurve.mactk"];
  if (!v10)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    id v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v57 = v14;
    __int16 v58 = 2048;
    id v59 = 0;
    id v15 = "%{public}@Maximum color temperature is less than or equal to 0: %ld";
    goto LABEL_23;
  }
  uint64_t v11 = (uint64_t)v10;
  if ((uint64_t)v9 > (uint64_t)v10)
  {
    self = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v57 = v14;
      __int16 v58 = 2048;
      id v59 = v9;
      __int16 v60 = 2048;
      uint64_t v61 = v11;
      id v15 = "%{public}@Minimum color temperature is greater than maximum color temperature (%ld:%ld)";
      id v16 = v13;
      uint32_t v17 = 32;
LABEL_24:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
LABEL_25:

    v24 = 0;
    goto LABEL_26;
  }
  id v44 = v10;
  v55[0] = objc_opt_class();
  v55[1] = objc_opt_class();
  id v26 = +[NSArray arrayWithObjects:v55 count:2];
  __int16 v27 = +[NSSet setWithArray:v26];

  id v28 = [v4 decodeObjectOfClasses:v27 forKey:@"HNLCurve.tpk"];
  if (v28)
  {
    id v43 = v9;
    id v46 = v27;
    id v48 = +[NSMutableArray array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v45 = v28;
    obunint64_t j = v28;
    id v29 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v51;
      while (2)
      {
        for (unint64_t i = 0; i != v30; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v51 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v49 = 0;
          id v34 = +[HAPCharacteristicValueLinearDerivedTransitionPoint parsedFromData:v33 error:&v49];
          id v35 = v49;
          if (!v34)
          {
            self = self;
            id v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v57 = v39;
              __int16 v58 = 2112;
              id v59 = v33;
              __int16 v60 = 2112;
              uint64_t v61 = (uint64_t)v35;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse encoded transition point %@:%@", buf, 0x20u);
            }

            v24 = 0;
            id v28 = v45;
            __int16 v27 = v46;
            id v36 = v48;
            goto LABEL_46;
          }
          [v48 addObject:v34];
        }
        id v30 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }

    id v36 = v48;
    if ([v48 count])
    {
      self = [(HMDNaturalLightingCurve *)self initWithVersion:1 transitionPoints:v48 minimumBrightness:v8 maximumBrightness:v6 minimumColorTemperature:v43 maximumColorTemperature:v44];
      -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](self, "setColorTemperatureNotifyValueChangeThreshold:", [v4 decodeIntegerForKey:@"HNLCurve.ctnvctk"]);
      -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](self, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", [v4 decodeInt64ForKey:@"HNLCurve.ctnitk"]);
      -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](self, "setColorTemperatureUpdateIntervalInMilliseconds:", [v4 decodeInt64ForKey:@"HNLCurve.ctuik"]);
      v24 = self;
    }
    else
    {
      v24 = 0;
    }
    id v28 = v45;
    __int16 v27 = v46;
LABEL_46:
  }
  else
  {
    self = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode transition points", buf, 0xCu);
    }
    v24 = 0;
  }

LABEL_26:
  return v24;
}

- (HMDNaturalLightingCurve)initWithCurve:(id)a3 minimumColorTemperature:(int64_t)a4 maximumColorTemperature:(int64_t)a5
{
  id v6 = a3;
  id v7 = [v6 transitionPoints];
  id v38 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obunint64_t j = [v6 transitionPoints];
  id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (v39)
  {
    uint64_t v36 = *(void *)v41;
    id v33 = v6;
    do
    {
      for (unint64_t i = 0; i != v39; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "colorTemperatureForBrightness:", objc_msgSend(v6, "minimumBrightness"));
        int64_t v13 = (int64_t)v12;
        if ((uint64_t)v12 <= a4) {
          int64_t v14 = a4;
        }
        else {
          int64_t v14 = (int64_t)v12;
        }
        if ((uint64_t)v12 <= a5) {
          int64_t v15 = v14;
        }
        else {
          int64_t v15 = a5;
        }
        id v16 = objc_msgSend(v11, "colorTemperatureForBrightness:", objc_msgSend(v6, "maximumBrightness"));
        if ((uint64_t)v16 <= a4) {
          int64_t v17 = a4;
        }
        else {
          int64_t v17 = (int64_t)v16;
        }
        if ((uint64_t)v16 <= a5) {
          int64_t v18 = v17;
        }
        else {
          int64_t v18 = a5;
        }
        if ((uint64_t)v16 > a5 || (uint64_t)v16 < a4 || v13 > a5 || v13 < a4)
        {
          id v35 = [v6 minimumBrightness];
          id v22 = [v6 maximumBrightness];
          v23 = [v11 targetCompletionDuration];
          v24 = [v23 value];
          +[HAPCharacteristicValueLinearDerivedTransitionPoint transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:](HAPCharacteristicValueLinearDerivedTransitionPoint, "transitionPointWithMinimumBrightness:minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:", v35, v15, v22, v18, [v24 unsignedLongLongValue]);
          id v25 = (id)objc_claimAutoreleasedReturnValue();

          id v6 = v33;
        }
        else
        {
          id v25 = [v11 copy];
        }
        [v38 addObject:v25];
        if (v15 >= v18) {
          int64_t v26 = v18;
        }
        else {
          int64_t v26 = v15;
        }
        if (v9 >= v26) {
          uint64_t v27 = v26;
        }
        else {
          uint64_t v27 = v9;
        }
        if (v9 <= 0) {
          uint64_t v9 = v26;
        }
        else {
          uint64_t v9 = v27;
        }
        if (v18 <= v15) {
          int64_t v28 = v15;
        }
        else {
          int64_t v28 = v18;
        }
        if (v8 <= v28) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = v8;
        }
        if (v8 <= 0) {
          uint64_t v8 = v28;
        }
        else {
          uint64_t v8 = v29;
        }
      }
      id v39 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v39);
  }

  id v30 = -[HMDNaturalLightingCurve initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:](self, "initWithVersion:transitionPoints:minimumBrightness:maximumBrightness:minimumColorTemperature:maximumColorTemperature:", [v6 version], v38, objc_msgSend(v6, "minimumBrightness"), objc_msgSend(v6, "maximumBrightness"), v9, v8);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyIntervalThresholdInMilliseconds:](v30, "setColorTemperatureNotifyIntervalThresholdInMilliseconds:", [v6 colorTemperatureNotifyIntervalThresholdInMilliseconds]);
  -[HMDNaturalLightingCurve setColorTemperatureNotifyValueChangeThreshold:](v30, "setColorTemperatureNotifyValueChangeThreshold:", [v6 colorTemperatureNotifyValueChangeThreshold]);
  -[HMDNaturalLightingCurve setColorTemperatureUpdateIntervalInMilliseconds:](v30, "setColorTemperatureUpdateIntervalInMilliseconds:", [v6 colorTemperatureUpdateIntervalInMilliseconds]);

  return v30;
}

- (HMDNaturalLightingCurve)initWithVersion:(unint64_t)a3 transitionPoints:(id)a4 minimumBrightness:(int64_t)a5 maximumBrightness:(int64_t)a6 minimumColorTemperature:(int64_t)a7 maximumColorTemperature:(int64_t)a8
{
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDNaturalLightingCurve;
  int64_t v15 = [(HMDNaturalLightingCurve *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    v15->_version = a3;
    int64_t v17 = (NSArray *)[v14 copy];
    transitionPoints = v16->_transitionPoints;
    v16->_transitionPoints = v17;

    v16->_minimumBrightness = a5;
    v16->_maximumBrightness = a6;
    v16->_minimumColorTemperature = a7;
    v16->_maximumColorTemperature = a8;
  }

  return v16;
}

@end