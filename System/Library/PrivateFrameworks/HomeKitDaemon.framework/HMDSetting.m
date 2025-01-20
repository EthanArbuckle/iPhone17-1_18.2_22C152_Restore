@interface HMDSetting
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)settingValueWithModel:(id)a3;
- (BOOL)isReadOnly;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)updateWithSettingValue:(id)a3;
- (BOOL)wouldValueUpdate:(id)a3;
- (HMDSetting)initWithCoder:(id)a3;
- (HMDSetting)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 properties:(id)a6 type:(id)a7 value:(id)a8 constraints:(id)a9;
- (HMDSetting)initWithModel:(id)a3;
- (HMSettingValue)internalValue;
- (NSArray)constraints;
- (NSNumber)properties;
- (NSNumber)type;
- (NSString)description;
- (NSString)keyPath;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (id)constraintsByKeyPathWithCurrentKeyPath:(id)a3;
- (id)logIdentifier;
- (id)value;
- (void)addConstraint:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setInternalValue:(id)a3;
- (void)setKeyPath:(id)a3;
- (void)setProperties:(id)a3;
- (void)setReadOnly:(BOOL)a3;
- (void)setType:(id)a3;
@end

@implementation HMDSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalValue, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

- (void)setInternalValue:(id)a3
{
}

- (HMSettingValue)internalValue
{
  return (HMSettingValue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProperties:(id)a3
{
}

- (NSNumber)properties
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setType:(id)a3
{
}

- (NSNumber)type
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setKeyPath:(id)a3
{
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    v5 = [(HMDSetting *)self identifier];
    [v4 encodeObject:v5 forKey:*MEMORY[0x263F0B558]];

    v6 = [(HMDSetting *)self parentIdentifier];
    [v4 encodeObject:v6 forKey:@"HMDSettingParentIdentifierCodingKey"];

    v7 = [(HMDSetting *)self properties];
    [v4 encodeObject:v7 forKey:*MEMORY[0x263F0B568]];

    v8 = [(HMDSetting *)self name];
    [v4 encodeObject:v8 forKey:*MEMORY[0x263F0B560]];

    v9 = [(HMDSetting *)self constraints];
    [v4 encodeObject:v9 forKey:*MEMORY[0x263F0B530]];

    v10 = [(HMDSetting *)self value];
    [v4 encodeObject:v10 forKey:*MEMORY[0x263F0B5A0]];

    v11 = [(HMDSetting *)self type];
    [v4 encodeObject:v11 forKey:*MEMORY[0x263F0B588]];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Did not encode setting as transport is not XPC.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (HMDSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)constraintsByKeyPathWithCurrentKeyPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(HMDSetting *)self constraints];
  uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = NSString;
        v12 = [v10 name];
        v13 = [v11 stringWithFormat:@"%@.%@", v4, v12];

        [v5 setValue:v10 forKey:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (BOOL)wouldValueUpdate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSetting *)self internalValue];
  char v6 = [v5 isEqual:v4];

  return v6 ^ 1;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = v6;
  v9 = [(HMDSetting *)v7 type];
  uint64_t v10 = [v9 integerValue];

  switch(v10)
  {
    case 1:
      if ([v8 type] == 1) {
        goto LABEL_53;
      }
      v11 = (void *)MEMORY[0x230FBD990]();
      v12 = v7;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_62;
      }
      v14 = HMFGetLogIdentifier();
      v15 = v7;
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      __int16 v107 = 2112;
      id v108 = v16;
      long long v17 = "%{public}@Unexpected value type: %@ expected data";
      goto LABEL_61;
    case 2:
      if ([v8 type] != 2)
      {
        v11 = (void *)MEMORY[0x230FBD990]();
        v12 = v7;
        v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          v15 = v7;
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v105 = 138543618;
          v106 = v14;
          __int16 v107 = 2112;
          id v108 = v16;
          long long v17 = "%{public}@Unexpected value class: %@ expected number";
LABEL_61:
          _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, v17, v105, 0x16u);

          uint64_t v7 = v15;
        }
LABEL_62:

        if (a4)
        {
          [MEMORY[0x263F087E8] hmErrorWithCode:22];
          BOOL v54 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_95;
        }
        goto LABEL_94;
      }
      v88 = a4;
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id obj = [(HMDSetting *)v7 constraints];
      uint64_t v95 = [obj countByEnumeratingWithState:&v101 objects:v105 count:16];
      if (!v95) {
        goto LABEL_48;
      }
      context = *(void **)v102;
      id v89 = v8;
      break;
    case 3:
      if ([v8 type] == 3) {
        goto LABEL_53;
      }
      v11 = (void *)MEMORY[0x230FBD990]();
      v12 = v7;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_62;
      }
      v14 = HMFGetLogIdentifier();
      v15 = v7;
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "type"));
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      __int16 v107 = 2112;
      id v108 = v16;
      long long v17 = "%{public}@Unexpected value type: %@ expected string";
      goto LABEL_61;
    case 4:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_53;
      }
      v11 = (void *)MEMORY[0x230FBD990]();
      v12 = v7;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_62;
      }
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)v105 = 138543618;
      v106 = v14;
      __int16 v107 = 2112;
      id v108 = (id)objc_opt_class();
      v15 = v7;
      id v16 = v108;
      long long v17 = "%{public}@Unexpected value class: %@";
      goto LABEL_61;
    case 5:
      v55 = (void *)MEMORY[0x230FBD990]();
      v56 = v7;
      v57 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v58 = HMFGetLogIdentifier();
        *(_DWORD *)v105 = 138543362;
        v106 = v58;
        _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_INFO, "%{public}@Value cannot be used for collection.", v105, 0xCu);
      }
      goto LABEL_94;
    default:
      goto LABEL_94;
  }
  do
  {
    for (uint64_t i = 0; i != v95; ++i)
    {
      if (*(void **)v102 != context) {
        objc_enumerationMutation(obj);
      }
      long long v19 = *(void **)(*((void *)&v101 + 1) + 8 * i);
      long long v20 = [v8 numberValue];
      v21 = v7;
      id v22 = v20;
      id v23 = v19;
      v24 = [(HMDSetting *)v21 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
      id v26 = v25;

      v27 = [v23 type];
      uint64_t v28 = [v27 integerValue];

      switch(v28)
      {
        case 3:
          v29 = [v23 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v33 = v29;
          }
          else {
            v33 = 0;
          }
          id v34 = v33;

          if (v34)
          {
            if (!v22)
            {
              v69 = (void *)MEMORY[0x230FBD990]();
              v70 = v21;
              v71 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                v72 = v97 = v7;
                v73 = [v23 value];
                *(_DWORD *)buf = 138543618;
                v110 = v72;
                __int16 v111 = 2112;
                id v112 = v73;
                _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@Value is nil but have step value constraint: %@", buf, 0x16u);

                uint64_t v7 = v97;
              }

              id v22 = 0;
              v32 = v26;
              goto LABEL_92;
            }
            v32 = v26;
            [v22 doubleValue];
            double v36 = v35;
            [v26 doubleValue];
            long double v38 = vabdd_f64(v36, v37);
            [v34 doubleValue];
            double v40 = fmod(v38, v39);
            if (v40 > 0.00000011920929)
            {
              uint64_t v41 = [v34 doubleValue];
              if (v40 < v42 + -0.00000011920929)
              {
                contextb = (void *)MEMORY[0x230FBD990](v41);
                v100 = v21;
                v84 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  v86 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138544130;
                  v110 = v86;
                  __int16 v111 = 2112;
                  id v112 = v22;
                  __int16 v113 = 2112;
                  id v114 = v34;
                  __int16 v115 = 2112;
                  id v116 = v26;
                  _os_log_impl(&dword_22F52A000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, does not conform to step, %@, from current value: %@", buf, 0x2Au);

                  v32 = v26;
                }

                v74 = v88;
                if (v88)
                {
                  v79 = (void *)MEMORY[0x263F087E8];
                  uint64_t v80 = 43;
LABEL_90:
                  id v75 = [v79 hmErrorWithCode:v80];
LABEL_91:
                  id *v74 = v75;
                }
LABEL_92:

LABEL_93:
LABEL_94:
                BOOL v54 = 0;
                goto LABEL_95;
              }
            }
          }
          else
          {
            v29 = 0;
            v32 = v26;
          }
          break;
        case 2:
          v29 = [v23 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v43 = v29;
          }
          else {
            v43 = 0;
          }
          id v44 = v43;

          if (!v44)
          {
            v45 = (void *)MEMORY[0x230FBD990]();
            v53 = v21;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = HMFGetLogIdentifier();
              [v23 value];
              v50 = v49 = v7;
              *(_DWORD *)buf = 138543618;
              v110 = v48;
              __int16 v111 = 2112;
              id v112 = v50;
              v51 = v47;
              v52 = "%{public}@Invalid maximum constraint value: %@";
LABEL_44:
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 0x16u);

              uint64_t v7 = v49;
              id v8 = v89;
            }
LABEL_45:
            v32 = v26;

            v29 = 0;
            break;
          }
          if (!v22)
          {
            v64 = (void *)MEMORY[0x230FBD990]();
            v65 = v21;
            v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v67 = v96 = v64;
              *(_DWORD *)buf = 138543874;
              v110 = v67;
              __int16 v111 = 2112;
              id v112 = 0;
              __int16 v113 = 2112;
              id v114 = v44;
              v68 = "%{public}@Value is %@, but have maximum value constraint: %@";
LABEL_74:
              _os_log_impl(&dword_22F52A000, v66, OS_LOG_TYPE_DEFAULT, v68, buf, 0x20u);

              v64 = v96;
            }
LABEL_75:

            v74 = v88;
            v32 = v26;
            if (v88)
            {
              id v75 = [MEMORY[0x263F087E8] hmErrorWithCode:44];
              id v22 = 0;
              goto LABEL_91;
            }
            id v22 = 0;
            goto LABEL_92;
          }
          v32 = v26;
          if ([v22 compare:v44] == 1)
          {
            contextc = (void *)MEMORY[0x230FBD990]();
            v99 = v21;
            v81 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              v83 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v110 = v83;
              __int16 v111 = 2112;
              id v112 = v22;
              __int16 v113 = 2112;
              id v114 = v44;
              _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, more than maximum value: %@", buf, 0x20u);

              v32 = v26;
            }

            v74 = v88;
            if (v88)
            {
              v79 = (void *)MEMORY[0x263F087E8];
              uint64_t v80 = 45;
              goto LABEL_90;
            }
            goto LABEL_92;
          }
          break;
        case 1:
          v29 = [v23 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v30 = v29;
          }
          else {
            v30 = 0;
          }
          id v31 = v30;

          if (!v31)
          {
            v45 = (void *)MEMORY[0x230FBD990]();
            v46 = v21;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = HMFGetLogIdentifier();
              [v23 value];
              v50 = v49 = v7;
              *(_DWORD *)buf = 138543618;
              v110 = v48;
              __int16 v111 = 2112;
              id v112 = v50;
              v51 = v47;
              v52 = "%{public}@Invalid minimum constraint value: %@";
              goto LABEL_44;
            }
            goto LABEL_45;
          }
          if (!v22)
          {
            v64 = (void *)MEMORY[0x230FBD990]();
            v65 = v21;
            v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v67 = v96 = v64;
              *(_DWORD *)buf = 138543874;
              v110 = v67;
              __int16 v111 = 2112;
              id v112 = 0;
              __int16 v113 = 2112;
              id v114 = v31;
              v68 = "%{public}@Value is %@, but have minimum value constraint: %@";
              goto LABEL_74;
            }
            goto LABEL_75;
          }
          v32 = v26;
          if ([v22 compare:v31] == -1)
          {
            contexta = (void *)MEMORY[0x230FBD990]();
            v98 = v21;
            v76 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              v78 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v110 = v78;
              __int16 v111 = 2112;
              id v112 = v22;
              __int16 v113 = 2112;
              id v114 = v31;
              _os_log_impl(&dword_22F52A000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, less than minimum value: %@", buf, 0x20u);

              v32 = v26;
            }

            v74 = v88;
            if (v88)
            {
              v79 = (void *)MEMORY[0x263F087E8];
              uint64_t v80 = 44;
              goto LABEL_90;
            }
            goto LABEL_92;
          }
          break;
        default:
          v59 = (void *)MEMORY[0x230FBD990]();
          v60 = v21;
          v61 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v63 = v62 = v7;
            *(_DWORD *)buf = 138543618;
            v110 = v63;
            __int16 v111 = 2112;
            id v112 = v22;
            _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@Did not understand value %@", buf, 0x16u);

            uint64_t v7 = v62;
          }

          v32 = v26;
          goto LABEL_93;
      }
    }
    uint64_t v95 = [obj countByEnumeratingWithState:&v101 objects:v105 count:16];
  }
  while (v95);
LABEL_48:

LABEL_53:
  BOOL v54 = 1;
LABEL_95:

  return v54;
}

- (id)logIdentifier
{
  v3 = NSString;
  id v4 = [(HMDSetting *)self identifier];
  v5 = [v4 UUIDString];
  id v6 = [(HMDSetting *)self name];
  uint64_t v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (BOOL)updateWithSettingValue:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(HMDSetting *)self isValidValue:v4 error:0])
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      long long v18 = v15;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Received value is not valid %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_9;
  }
  if (![(HMDSetting *)self wouldValueUpdate:v4])
  {
LABEL_9:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    v9 = [(HMDSetting *)v6 name];
    uint64_t v10 = [(HMDSetting *)v6 internalValue];
    int v17 = 138544130;
    long long v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ in transaction from %@ to %@", (uint8_t *)&v17, 0x2Au);
  }
  [(HMDSetting *)v6 setInternalValue:v4];
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (void)addConstraint:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_constraints addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConstraints:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSMutableArray *)[v6 mutableCopy];
  constraints = self->_constraints;
  self->_constraints = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)constraints
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_constraints copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)value
{
  id v2 = [(HMDSetting *)self internalValue];
  switch([v2 type])
  {
    case 1:
      uint64_t v3 = [v2 dataValue];
      goto LABEL_6;
    case 2:
      uint64_t v3 = [v2 numberValue];
      goto LABEL_6;
    case 3:
      uint64_t v3 = [v2 stringValue];
LABEL_6:
      id v4 = (HMDSettingValueSelectionItem *)v3;
      break;
    case 4:
      v5 = [HMDSettingValueSelectionItem alloc];
      id v6 = [v2 selectionIdentifier];
      uint64_t v7 = [v2 selectionValue];
      id v4 = [(HMDSettingValueSelectionItem *)v5 initWithIdentifier:v6 selection:v7];

      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = [(HMDSetting *)self name];
  v5 = [(HMDSetting *)self identifier];
  id v6 = [(HMDSetting *)self internalValue];
  uint64_t v7 = [v3 stringWithFormat:@"[HMDSetting: %@/%@ - %@]", v4, v5, v6];

  return (NSString *)v7;
}

- (HMDSetting)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 name:(id)a5 properties:(id)a6 type:(id)a7 value:(id)a8 constraints:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)HMDSetting;
  id v22 = [(HMDSetting *)&v38 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    uint64_t v25 = [v16 copy];
    parentIdentifier = v22->_parentIdentifier;
    v22->_parentIdentifier = (NSUUID *)v25;

    uint64_t v27 = [v17 copy];
    name = v22->_name;
    v22->_name = (NSString *)v27;

    uint64_t v29 = [v17 copy];
    keyPath = v22->_keyPath;
    v22->_keyPath = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    type = v22->_type;
    v22->_type = (NSNumber *)v31;

    objc_storeStrong((id *)&v22->_internalValue, a8);
    uint64_t v33 = [v18 copy];
    properties = v22->_properties;
    v22->_properties = (NSNumber *)v33;

    uint64_t v35 = [v21 mutableCopy];
    constraints = v22->_constraints;
    v22->_constraints = (NSMutableArray *)v35;
  }
  return v22;
}

- (HMDSetting)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = +[HMDSetting settingValueWithModel:v4];
  id v6 = [v4 hmbModelID];
  uint64_t v7 = [v4 hmbParentModelID];
  id v8 = [v4 name];
  v9 = [v4 properties];
  uint64_t v10 = [v4 type];

  BOOL v11 = [(HMDSetting *)self initWithIdentifier:v6 parentIdentifier:v7 name:v8 properties:v9 type:v10 value:v5 constraints:MEMORY[0x263EFFA68]];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7 != -1) {
    dispatch_once(&logCategory__hmf_once_t7, &__block_literal_global_295);
  }
  id v2 = (void *)logCategory__hmf_once_v8;
  return v2;
}

void __25__HMDSetting_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8;
  logCategory__hmf_once_id v8 = v0;
}

+ (id)settingValueWithModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 type];
  switch([v4 integerValue])
  {
    case 1:
      v5 = [v3 dataValue];
      id v6 = 0;
      uint64_t v7 = 0;
      goto LABEL_10;
    case 2:
      BOOL v11 = [v3 numberValue];
      id v6 = 0;
      uint64_t v7 = 0;
      v5 = 0;
      goto LABEL_11;
    case 3:
      v12 = [v3 stringValue];
      id v6 = 0;
      uint64_t v7 = 0;
      v5 = 0;
      BOOL v11 = 0;
      goto LABEL_12;
    case 4:
      uint64_t v7 = [v3 selectionIdentifier];
      id v6 = [v3 selectionValue];
      goto LABEL_9;
    default:
      id v8 = (void *)MEMORY[0x230FBD990]();
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v15 = 138543874;
        id v16 = v10;
        __int16 v17 = 2112;
        id v18 = v3;
        __int16 v19 = 2112;
        id v20 = v4;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine type of setting value for model %@ of type %@.", (uint8_t *)&v15, 0x20u);
      }
      id v6 = 0;
      uint64_t v7 = 0;
LABEL_9:
      v5 = 0;
LABEL_10:
      BOOL v11 = 0;
LABEL_11:
      v12 = 0;
LABEL_12:
      v13 = objc_msgSend(objc_alloc(MEMORY[0x263F0E750]), "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", objc_msgSend(v4, "integerValue"), v12, v11, v5, v7, v6);

      return v13;
  }
}

@end