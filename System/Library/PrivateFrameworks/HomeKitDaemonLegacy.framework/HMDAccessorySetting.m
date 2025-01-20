@interface HMDAccessorySetting
+ (BOOL)supportsSecureCoding;
+ (id)decodedValue:(id)a3 error:(id *)a4;
+ (id)logCategory;
+ (id)supportedConstraintClasses;
+ (id)supportedValueClasses;
- (BOOL)canAddConstraint:(id)a3 error:(id *)a4;
- (BOOL)canRemoveConstraint:(id)a3;
- (BOOL)compareConstraints:(id)a3;
- (BOOL)isCollectionType;
- (BOOL)isConstraintMergeStrategyReflection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReflected;
- (BOOL)isValid:(id *)a3;
- (BOOL)shouldBlockSettingUpdateFromVersion:(id)a3 isMultiUserEnabled:(BOOL)a4;
- (BOOL)shouldTurnOffPersonalRequestsOnLanguageChangeTo:(id)a3 supportedMultiUserLanguageCodes:(id)a4 isMultiUserEnabled:(BOOL)a5;
- (HMDAccessorySetting)init;
- (HMDAccessorySetting)initWithCoder:(id)a3;
- (HMDAccessorySetting)initWithIdentifier:(id)a3 name:(id)a4;
- (HMDAccessorySetting)initWithModel:(id)a3;
- (HMDAccessorySettingModel)model;
- (HMFMessageDispatcher)messageDispatcher;
- (NSArray)constraints;
- (NSArray)models;
- (NSString)description;
- (NSString)keyPath;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (OS_dispatch_queue)clientQueue;
- (id)_initWithCoder:(id)a3;
- (id)_modelsForMergeStrategyConstraintsUpdate:(id)a3;
- (id)constraintWithIdentifier:(id)a3;
- (id)constraintsForCodingXPC;
- (id)copyIdentical;
- (id)copyReplica;
- (id)counterpartConstraintFor:(id)a3;
- (id)inMemoryConstraintWithIdentifier:(id)a3;
- (id)logIdentifier;
- (id)modelsForConstraintsUpdate:(id)a3;
- (id)replicatedMissingConstraintsFrom:(id)a3;
- (id)value;
- (int64_t)type;
- (unint64_t)configurationVersion;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)_encodeWithCoder:(id)a3;
- (void)_mergeConstraintsLocallyWithAdditions:(id)a3 removals:(id)a4;
- (void)_setType:(int64_t)a3;
- (void)addConstraint:(id)a3;
- (void)addConstraintsInMemory:(id)a3;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)mergeConstraintsFromOther:(id)a3;
- (void)removeConstraint:(id)a3;
- (void)removeConstraintsInMemory:(id)a3;
- (void)setConfigurationVersion:(unint64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setGroup:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setReflected:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation HMDAccessorySetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_inMemoryCachedConstraints, 0);
  objc_storeStrong((id *)&self->_inMemoryCachedConstraintRemovals, 0);
}

- (NSArray)models
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (HMDAccessorySettingModel)model
{
  return (HMDAccessorySettingModel *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setReflected:(BOOL)a3
{
  self->_reflected = a3;
}

- (BOOL)isReflected
{
  return self->_reflected;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 80, 1);
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  char v6 = objc_msgSend(v4, "hmd_isForRemoteTransport");
  v7 = [(HMDAccessorySetting *)self identifier];
  [v4 encodeObject:v7 forKey:*MEMORY[0x1E4F2C5C8]];

  unint64_t v8 = [(HMDAccessorySetting *)self properties];
  [v4 encodeInteger:v8 forKey:*MEMORY[0x1E4F2C5D8]];
  v9 = [(HMDAccessorySetting *)self name];
  [v4 encodeObject:v9 forKey:*MEMORY[0x1E4F2C5D0]];

  v10 = [(HMDAccessorySetting *)self value];
  [v4 encodeObject:v10 forKey:*MEMORY[0x1E4F2C610]];

  if ((v6 & 1) == 0)
  {
    if (v5) {
      [(HMDAccessorySetting *)self constraintsForCodingXPC];
    }
    else {
    v24 = [(HMDAccessorySetting *)self constraints];
    }
    [v4 encodeObject:v24 forKey:*MEMORY[0x1E4F2C5A0]];

    if (v5) {
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAccessorySetting configurationVersion](self, "configurationVersion"), @"HM.version");
    goto LABEL_21;
  }
  char v27 = v5;
  v28 = v4;
  v11 = [MEMORY[0x1E4F1CA48] array];
  v12 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v13 = [(HMDAccessorySetting *)self constraints];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = [v18 value];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          v21 = v12;
        }
        else {
          v21 = v11;
        }
        [v21 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  v22 = (void *)[v11 copy];
  id v4 = v28;
  [v28 encodeObject:v22 forKey:*MEMORY[0x1E4F2C5A0]];

  if ([v12 count])
  {
    v23 = (void *)[v12 copy];
    [v28 encodeObject:v23 forKey:@"HM.constraintsV1"];
  }
  char v5 = v27;
  if ((v27 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_21:
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    BOOL v25 = [(HMDAccessorySetting *)self isReflected];
    [v4 encodeBool:v25 forKey:*MEMORY[0x1E4F2C5E0]];
  }
  if (v5) {
    uint64_t Type = [(HMDAccessorySetting *)self type];
  }
  else {
    uint64_t Type = __getType((os_unfair_lock_s *)self);
  }
  [v4 encodeInteger:Type forKey:*MEMORY[0x1E4F2C5F8]];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x1D9452090]();
  [(HMDAccessorySetting *)self _encodeWithCoder:v5];
}

- (id)constraintsForCodingXPC
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__177785;
  uint64_t v16 = __Block_byref_object_dispose__177786;
  id v17 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_constraints copy];
  id v5 = (void *)[(NSMutableArray *)self->_inMemoryCachedConstraints copy];
  uint64_t v6 = [(NSMutableSet *)self->_inMemoryCachedConstraintRemovals copy];
  v7 = (void *)v13[5];
  v13[5] = v6;

  os_unfair_lock_unlock(p_lock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__HMDAccessorySetting_constraintsForCodingXPC__block_invoke;
  v11[3] = &unk_1E6A175F0;
  v11[4] = &v12;
  unint64_t v8 = objc_msgSend(v4, "hmf_objectsPassingTest:", v11);

  v9 = [v8 arrayByAddingObjectsFromArray:v5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __46__HMDAccessorySetting_constraintsForCodingXPC__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (id)_initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C5C8]];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C5D0]];
  v7 = [(HMDAccessorySetting *)self initWithIdentifier:v5 name:v6];
  if (v7)
  {
    v7->_type = [v4 decodeIntegerForKey:*MEMORY[0x1E4F2C5F8]];
    v7->_properties = [v4 decodeIntegerForKey:*MEMORY[0x1E4F2C5D8]];
    unint64_t v8 = [(id)objc_opt_class() supportedConstraintClasses];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:*MEMORY[0x1E4F2C5A0]];
    v10 = (void *)[v9 mutableCopy];

    if (v10)
    {
      v11 = [(id)objc_opt_class() supportedConstraintClasses];
      uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HM.constraintsV1"];

      if (v12) {
        [v10 addObjectsFromArray:v12];
      }
      objc_storeStrong((id *)&v7->_constraints, v10);
    }
    v13 = [(id)objc_opt_class() supportedValueClasses];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:*MEMORY[0x1E4F2C610]];
    id value = v7->_value;
    v7->_id value = (id)v14;

    v7->_configurationVersion = [v4 decodeIntegerForKey:@"HM.version"];
  }

  return v7;
}

- (HMDAccessorySetting)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = (HMDAccessorySetting *)[(HMDAccessorySetting *)self _initWithCoder:v4];

  return v6;
}

- (id)_modelsForMergeStrategyConstraintsUpdate:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(HMDAccessorySetting *)self constraints];
  v7 = __missingElementsFromLeftNotInRight(v6, v4);

  id v45 = v4;
  v46 = v5;
  v44 = v7;
  if ((objc_msgSend(v7, "hmf_isEmpty") & 1) == 0)
  {
    unint64_t v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v52 = v11;
      __int16 v53 = 2112;
      v54 = v7;
      __int16 v55 = 2112;
      v56 = v9;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@will remove %@ from %@", buf, 0x20u);
    }
    uint64_t v12 = [(HMDAccessorySetting *)v9 identifier];
    id v13 = v7;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v21 = [HMDAccessorySettingConstraintModel alloc];
          v22 = [v20 identifier];
          v23 = [(HMDBackingStoreModelObject *)v21 initWithObjectChangeType:3 uuid:v22 parentUUID:v12];

          [v14 addObject:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:buf count:16];
      }
      while (v17);
    }

    id v5 = v46;
    [v46 addObjectsFromArray:v14];

    v7 = v44;
  }
  v24 = [(HMDAccessorySetting *)self constraints];
  BOOL v25 = __missingElementsFromLeftNotInRight(v4, v24);

  if ((objc_msgSend(v25, "hmf_isEmpty") & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    char v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v52 = v29;
      __int16 v53 = 2112;
      v54 = v25;
      __int16 v55 = 2112;
      v56 = v27;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@will add %@ to %@", buf, 0x20u);
    }
    long long v30 = [(HMDAccessorySetting *)v27 identifier];
    id v31 = v25;
    long long v32 = [MEMORY[0x1E4F1CA48] array];
    v33 = __deepCopiedConstraints(v31);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:buf count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v47 + 1) + 8 * j) modelWithParentIdentifier:v30];
          [v38 setObjectChangeType:1];
          [v32 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:buf count:16];
      }
      while (v35);
    }

    id v5 = v46;
    [v46 addObjectsFromArray:v32];

    v7 = v44;
    id v4 = v45;
  }
  if ([v5 count])
  {
    v39 = (void *)MEMORY[0x1D9452090]();
    v40 = self;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v52 = v42;
      __int16 v53 = 2112;
      v54 = v5;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_DEBUG, "%{public}@fixing up accessory constraints %@", buf, 0x16u);
    }
  }

  return v5;
}

- (id)logIdentifier
{
  v3 = NSString;
  id v4 = [(HMDAccessorySetting *)self identifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [(HMDAccessorySetting *)self name];
  v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)setConfigurationVersion:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_configurationVersion < a3) {
    self->_configurationVersion = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)configurationVersion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t configurationVersion = self->_configurationVersion;
  os_unfair_lock_unlock(p_lock);
  return configurationVersion;
}

- (BOOL)shouldTurnOffPersonalRequestsOnLanguageChangeTo:(id)a3 supportedMultiUserLanguageCodes:(id)a4 isMultiUserEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDAccessorySetting *)self value];
  if (v5
    && ([(HMDAccessorySetting *)self keyPath],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:@"root.siri.language"],
        v11,
        v12))
  {
    id v13 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    uint64_t v16 = v15;
    id v17 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;

    v20 = v19;
    v44 = v16;
    v21 = [v16 title];
    v22 = [v19 title];
    v23 = [v21 componentsSeparatedByString:@","];
    v24 = [v22 componentsSeparatedByString:@","];
    id v45 = v23;
    if ((unint64_t)[v23 count] < 4)
    {
      long long v32 = v24;
      v33 = (void *)MEMORY[0x1D9452090]();
      uint64_t v34 = self;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        uint64_t v36 = loga = v21;
        *(_DWORD *)buf = 138543362;
        long long v47 = v36;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize selected language.", buf, 0xCu);

        v21 = loga;
      }

      BOOL v31 = 0;
      v24 = v32;
    }
    else
    {
      BOOL v25 = [v23 objectAtIndexedSubscript:0];
      if ([v9 containsObject:v25])
      {
        v43 = v24;
        if ((unint64_t)[v24 count] >= 4
          && ([v24 objectAtIndexedSubscript:0],
              v26 = objc_claimAutoreleasedReturnValue(),
              int v27 = [v9 containsObject:v26],
              v26,
              v27))
        {
          context = (void *)MEMORY[0x1D9452090]();
          v28 = self;
          log = HMFGetOSLogHandle();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            long long v29 = HMFGetLogIdentifier();
            long long v30 = [v43 objectAtIndexedSubscript:0];
            *(_DWORD *)buf = 138543874;
            long long v47 = v29;
            __int16 v48 = 2112;
            long long v49 = v25;
            __int16 v50 = 2112;
            v51 = v30;
            _os_log_impl(&dword_1D49D5000, log, OS_LOG_TYPE_INFO, "%{public}@Language changing from %@ to %@ and both are supported.", buf, 0x20u);
          }
          BOOL v31 = 0;
        }
        else
        {
          context = (void *)MEMORY[0x1D9452090]();
          v37 = self;
          HMFGetOSLogHandle();
          log = BOOL v31 = 1;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            long long v47 = v38;
            __int16 v48 = 2112;
            long long v49 = v25;
            _os_log_impl(&dword_1D49D5000, log, OS_LOG_TYPE_INFO, "%{public}@Found recognition language %@ in supported languages need to turn off personal requests.", buf, 0x16u);
          }
        }

        v24 = v43;
      }
      else
      {
        BOOL v31 = 0;
      }
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)shouldBlockSettingUpdateFromVersion:(id)a3 isMultiUserEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:@"6.0"];
  id v8 = [(HMDAccessorySetting *)self keyPath];
  int v9 = [v8 isEqual:@"root.siri.language"];
  if (!v6 || !v9 || [v6 compare:v7] != -1)
  {

LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }

  if (!v4) {
    goto LABEL_5;
  }
  int v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = HMFGetLogIdentifier();
    int v16 = 138543618;
    id v17 = v15;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Settings update blocked due to attempting language setting update with homekit version: %@", (uint8_t *)&v16, 0x16u);
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (void)setValue:(id)a3
{
  id v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  p_id value = &self->_value;
  if ((HMFEqualObjects() & 1) == 0) {
    objc_storeStrong(p_value, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)modelsForConstraintsUpdate:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDAccessorySetting *)self isConstraintMergeStrategyReflection])
  {
    BOOL v5 = [(HMDAccessorySetting *)self _modelsForMergeStrategyConstraintsUpdate:v4];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v10;
      __int16 v59 = 2112;
      id v60 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updating constraints: %@", buf, 0x16u);
    }
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    int v12 = [(HMDAccessorySetting *)v8 constraints];
    id v13 = [v11 setWithArray:v12];

    id v45 = v4;
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    v46 = v13;
    id v15 = (void *)[v13 mutableCopy];
    v44 = (void *)v14;
    int v16 = (void *)MEMORY[0x1D9452090]([v15 minusSet:v14]);
    id v17 = v8;
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v19;
      __int16 v59 = 2112;
      id v60 = v15;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing constraints: %@", buf, 0x16u);
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(v20);
          }
          BOOL v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v26 = [HMDAccessorySettingConstraintModel alloc];
          int v27 = [v25 identifier];
          v28 = [(HMDAccessorySetting *)v17 identifier];
          long long v29 = [(HMDBackingStoreModelObject *)v26 initWithObjectChangeType:3 uuid:v27 parentUUID:v28];

          [v6 addObject:v29];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v22);
    }

    long long v30 = (void *)[v44 mutableCopy];
    BOOL v31 = (void *)MEMORY[0x1D9452090]([v30 minusSet:v46]);
    long long v32 = v17;
    v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v58 = v34;
      __int16 v59 = 2112;
      id v60 = v30;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Adding constraints: %@", buf, 0x16u);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v35 = v30;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v41 = [(HMDAccessorySetting *)v32 identifier];
          v42 = [v40 modelWithParentIdentifier:v41];

          [v42 setObjectChangeType:1];
          [v6 addObject:v42];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v37);
    }

    BOOL v5 = (void *)[v6 copy];
    id v4 = v45;
  }

  return v5;
}

- (BOOL)isCollectionType
{
  return [(HMDAccessorySetting *)self type] == 5;
}

- (BOOL)isConstraintMergeStrategyReflection
{
  v2 = [(HMDAccessorySetting *)self name];
  char v3 = [v2 isEqualToString:@"alarms"];

  return v3;
}

- (void)_mergeConstraintsLocallyWithAdditions:(id)a3 removals:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HMDAccessorySetting *)self removeConstraint:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HMDAccessorySetting addConstraint:](self, "addConstraint:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)removeConstraintsInMemory:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v8, lock))
        {
          inMemoryCachedConstraintRemovals = self->_inMemoryCachedConstraintRemovals;
          uint64_t v10 = [v8 identifier];
          LOBYTE(inMemoryCachedConstraintRemovals) = [(NSMutableSet *)inMemoryCachedConstraintRemovals containsObject:v10];

          if ((inMemoryCachedConstraintRemovals & 1) == 0)
          {
            uint64_t v11 = self->_inMemoryCachedConstraintRemovals;
            id v12 = [v8 identifier];
            [(NSMutableSet *)v11 addObject:v12];
          }
        }
        if ([(NSMutableArray *)self->_inMemoryCachedConstraints containsObject:v8])
        {
          uint64_t v13 = self->_inMemoryCachedConstraintRemovals;
          uint64_t v14 = [v8 identifier];
          LOBYTE(v13) = [(NSMutableSet *)v13 containsObject:v14];

          if ((v13 & 1) == 0)
          {
            [(NSMutableArray *)self->_inMemoryCachedConstraints removeObject:v8];
            uint64_t v15 = self->_inMemoryCachedConstraintRemovals;
            uint64_t v16 = [v8 identifier];
            [(NSMutableSet *)v15 addObject:v16];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock(lock);
}

- (void)addConstraintsInMemory:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_constraints, "containsObject:", v9, (void)v10) & 1) == 0
          && ([(NSMutableArray *)self->_inMemoryCachedConstraints containsObject:v9] & 1) == 0)
        {
          [(NSMutableArray *)self->_inMemoryCachedConstraints addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeConstraint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    inMemoryCachedConstraintRemovals = self->_inMemoryCachedConstraintRemovals;
    uint64_t v6 = [v9 identifier];
    LODWORD(inMemoryCachedConstraintRemovals) = [(NSMutableSet *)inMemoryCachedConstraintRemovals containsObject:v6];

    if (inMemoryCachedConstraintRemovals)
    {
      uint64_t v7 = self->_inMemoryCachedConstraintRemovals;
      uint64_t v8 = [v9 identifier];
      [(NSMutableSet *)v7 removeObject:v8];
    }
    if ([(NSMutableArray *)self->_constraints containsObject:v9]) {
      [(NSMutableArray *)self->_constraints removeObject:v9];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v9;
  }
}

- (void)addConstraint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableArray *)self->_constraints containsObject:v5] & 1) == 0) {
      [(NSMutableArray *)self->_constraints addObject:v5];
    }
    if ([(NSMutableArray *)self->_inMemoryCachedConstraints containsObject:v5]) {
      [(NSMutableArray *)self->_inMemoryCachedConstraints removeObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
  MEMORY[0x1F4181820]();
}

- (void)mergeConstraintsFromOther:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySetting *)self constraints];
  uint64_t v6 = __missingElementsFromLeftNotInRight(v4, v5);

  if ((objc_msgSend(v6, "hmf_isEmpty") & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@found constraints that are not present adding, %@", buf, 0x16u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v11 = __deepCopiedConstraints(v6);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[HMDAccessorySetting addConstraint:](v8, "addConstraint:", *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (id)replicatedMissingConstraintsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySetting *)self constraints];
  uint64_t v6 = __missingElementsFromLeftNotInRight(v4, v5);

  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    long long v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      long long v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      long long v16 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@found constraints that are not present returning, %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v7 = __deepCopiedConstraints(v6);
  }

  return v7;
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

- (id)inMemoryConstraintWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_inMemoryCachedConstraints;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "identifier", (void)v14);
        char v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)constraintWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_constraints;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "identifier", (void)v14);
        char v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)counterpartConstraintFor:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __itemFromConstraint(v4);
  if (v5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = [(HMDAccessorySetting *)self constraints];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          char v12 = __itemFromConstraint(v11);
          if (v12 && [v5 isEqual:v12])
          {
            long long v18 = (void *)MEMORY[0x1D9452090]();
            uint64_t v19 = self;
            long long v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              long long v21 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v28 = v21;
              __int16 v29 = 2112;
              id v30 = v11;
              __int16 v31 = 2112;
              id v32 = v4;
              _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Found counterpart constraint %@ for %@", buf, 0x20u);
            }
            id v13 = v11;

            goto LABEL_18;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_18:
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1D9452090]();
    long long v15 = self;
    long long v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      long long v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Can't decode constraint %@", buf, 0x16u);
    }
    id v13 = 0;
  }

  return v13;
}

- (NSArray)constraints
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_constraints copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)canRemoveConstraint:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessorySetting *)self constraints];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Missing Constraint: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v6;
}

- (BOOL)canAddConstraint:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HMDAccessorySetting *)self constraints];
  int v8 = [v7 containsObject:v6];

  if (!v8)
  {
    if (__isConstraintValid(self, v6, a4))
    {
      BOOL v13 = 1;
      goto LABEL_12;
    }
    __int16 v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = HMFGetLogIdentifier();
      id v18 = *a4;
      int v20 = 138543874;
      long long v21 = v17;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint, %@, with error: %@", (uint8_t *)&v20, 0x20u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  long long v10 = self;
  long long v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    int v20 = 138543618;
    long long v21 = v12;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Duplicate constraint: %@", (uint8_t *)&v20, 0x16u);
  }
  if (!a4) {
    goto LABEL_11;
  }
  [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
  BOOL v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v13;
}

- (BOOL)isValid:(id *)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessorySetting *)self type])
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v5 = [(HMDAccessorySetting *)self constraints];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v86 objects:v94 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v87;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v87 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!__isConstraintValid(self, *(void **)(*((void *)&v86 + 1) + 8 * v9), a3)) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v86 objects:v94 count:16];
          if (!v7) {
            goto LABEL_10;
          }
          goto LABEL_4;
        }
      }

      return 0;
    }
LABEL_10:

    long long v10 = [(HMDAccessorySetting *)self value];
    long long v11 = self;
    id v12 = v10;
    if (!v12)
    {
LABEL_71:
      BOOL v16 = 1;
      goto LABEL_94;
    }
    switch([(HMDAccessorySetting *)v11 type])
    {
      case 1:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_71;
        }
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        __int16 v14 = v11;
        id v15 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_76;
        }
        goto LABEL_75;
      case 2:
        id v17 = v12;
        objc_opt_class();
        int v18 = objc_opt_isKindOfClass() & 1;
        if (v18) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = 0;
        }
        id v82 = v19;

        if (v18)
        {
          id v76 = v17;
          id v77 = v12;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          obuint64_t j = [(HMDAccessorySetting *)v11 constraints];
          uint64_t v81 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
          if (!v81)
          {
LABEL_66:

            BOOL v16 = 1;
            id v12 = v77;
            goto LABEL_94;
          }
          uint64_t v80 = *(void *)v91;
          v78 = v11;
LABEL_25:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v91 != v80) {
              objc_enumerationMutation(obj);
            }
            long long v21 = *(void **)(*((void *)&v90 + 1) + 8 * v20);
            __int16 v22 = v11;
            id v23 = v82;
            id v24 = v21;
            id v25 = [(HMDAccessorySetting *)v22 value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v26 = v25;
            }
            else {
              uint64_t v26 = 0;
            }
            id v27 = v26;

            uint64_t v28 = [v24 type];
            switch(v28)
            {
              case 3:
                __int16 v29 = [v24 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v32 = v29;
                }
                else {
                  id v32 = 0;
                }
                id v33 = v32;

                if (v33)
                {
                  [v23 doubleValue];
                  double v35 = v34;
                  [v27 doubleValue];
                  long double v37 = vabdd_f64(v35, v36);
                  [v33 doubleValue];
                  double v39 = fmod(v37, v38);
                  if (v39 > 0.00000011920929)
                  {
                    uint64_t v40 = [v33 doubleValue];
                    if (v39 < v41 + -0.00000011920929)
                    {
                      v70 = (void *)MEMORY[0x1D9452090](v40);
                      v71 = v22;
                      v72 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                      {
                        HMFGetLogIdentifier();
                        v74 = v85 = v70;
                        *(_DWORD *)buf = 138544130;
                        v100 = v74;
                        __int16 v101 = 2112;
                        id v102 = v76;
                        __int16 v103 = 2112;
                        id v104 = v33;
                        __int16 v105 = 2112;
                        id v106 = v27;
                        _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, does not conform to step, %@, from current value: %@", buf, 0x2Au);

                        v70 = v85;
                      }

                      if (a3)
                      {
                        uint64_t v64 = 43;
LABEL_90:
                        long long v11 = v78;
                        id v12 = v77;
                        *a3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v64];
LABEL_92:

LABEL_93:
                        BOOL v16 = 0;
                        goto LABEL_94;
                      }
LABEL_91:
                      long long v11 = v78;
                      id v12 = v77;
                      goto LABEL_92;
                    }
                  }
                  goto LABEL_63;
                }
                goto LABEL_62;
              case 2:
                __int16 v29 = [v24 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  v42 = v29;
                }
                else {
                  v42 = 0;
                }
                id v43 = v42;

                if (v43)
                {
                  if ([v23 compare:v43] == 1)
                  {
                    v65 = (void *)MEMORY[0x1D9452090]();
                    v66 = v22;
                    v67 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v69 = v84 = v65;
                      *(_DWORD *)buf = 138543874;
                      v100 = v69;
                      __int16 v101 = 2112;
                      id v102 = v76;
                      __int16 v103 = 2112;
                      id v104 = v43;
                      _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, more than maximum value: %@", buf, 0x20u);

                      v65 = v84;
                    }

                    if (a3)
                    {
                      uint64_t v64 = 45;
                      goto LABEL_90;
                    }
                    goto LABEL_91;
                  }
                  goto LABEL_63;
                }
                long long v48 = (void *)MEMORY[0x1D9452090]();
                __int16 v55 = v22;
                long long v50 = HMFGetOSLogHandle();
                if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_61;
                }
                long long v51 = HMFGetLogIdentifier();
                long long v52 = [v24 value];
                *(_DWORD *)buf = 138543618;
                v100 = v51;
                __int16 v101 = 2112;
                id v102 = v52;
                long long v53 = v50;
                long long v54 = "%{public}@Invalid maximum constraint value: %@";
                break;
              case 1:
                __int16 v29 = [v24 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v30 = v29;
                }
                else {
                  id v30 = 0;
                }
                id v31 = v30;

                if (v31)
                {
                  if ([v23 compare:v31] == -1)
                  {
                    __int16 v59 = (void *)MEMORY[0x1D9452090]();
                    id v60 = v22;
                    uint64_t v61 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v63 = v83 = v59;
                      *(_DWORD *)buf = 138543874;
                      v100 = v63;
                      __int16 v101 = 2112;
                      id v102 = v76;
                      __int16 v103 = 2112;
                      id v104 = v31;
                      _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@Value, %@, less than minimum value: %@", buf, 0x20u);

                      __int16 v59 = v83;
                    }

                    if (a3)
                    {
                      uint64_t v64 = 44;
                      goto LABEL_90;
                    }
                    goto LABEL_91;
                  }
                  goto LABEL_63;
                }
                long long v48 = (void *)MEMORY[0x1D9452090]();
                long long v49 = v22;
                long long v50 = HMFGetOSLogHandle();
                if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_61;
                }
                long long v51 = HMFGetLogIdentifier();
                long long v52 = [v24 value];
                *(_DWORD *)buf = 138543618;
                v100 = v51;
                __int16 v101 = 2112;
                id v102 = v52;
                long long v53 = v50;
                long long v54 = "%{public}@Invalid minimum constraint value: %@";
                break;
              default:
                v44 = (void *)MEMORY[0x1D9452090]();
                id v45 = v22;
                v46 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  long long v47 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543618;
                  v100 = v47;
                  __int16 v101 = 2112;
                  id v102 = v24;
                  _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring numeric constraint: %@", buf, 0x16u);

                  long long v11 = v78;
                }

                goto LABEL_64;
            }
            _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 0x16u);

            long long v11 = v78;
LABEL_61:

LABEL_62:
            __int16 v29 = 0;
LABEL_63:

LABEL_64:
            if (v81 == ++v20)
            {
              uint64_t v81 = [obj countByEnumeratingWithState:&v90 objects:v95 count:16];
              if (!v81) {
                goto LABEL_66;
              }
              goto LABEL_25;
            }
          }
        }
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        __int16 v14 = v11;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
LABEL_75:
          v56 = HMFGetLogIdentifier();
          uint64_t v57 = objc_opt_class();
          *(_DWORD *)v95 = 138543618;
          v96 = v56;
          __int16 v97 = 2112;
          v98 = v57;
          id v58 = v57;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Unexpected value class: %@", v95, 0x16u);
        }
LABEL_76:

        if (!a3) {
          goto LABEL_93;
        }
        [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
        BOOL v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_94:

        break;
      case 3:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_71;
        }
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        __int16 v14 = v11;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_75;
        }
        goto LABEL_76;
      case 4:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_71;
        }
        BOOL v13 = (void *)MEMORY[0x1D9452090]();
        __int16 v14 = v11;
        id v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
          goto LABEL_75;
        }
        goto LABEL_76;
      default:
        goto LABEL_93;
    }
  }
  else
  {
    if (!a3) {
      return 0;
    }
    [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
    BOOL v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)_setType:(int64_t)a3
{
  if (self)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    id v5 = self;
    os_unfair_lock_lock_with_options();
    v5->_type = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (int64_t)type
{
  int64_t result = __getType((os_unfair_lock_s *)self);
  if ((unint64_t)result >= 6) {
    return 0;
  }
  return result;
}

- (NSString)name
{
  v2 = self->_name;
  return v2;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v5;

  id v11 = [v4 keyPath];

  uint64_t v7 = [(HMDAccessorySetting *)self name];
  if (v11)
  {
    uint64_t v8 = [v11 stringByAppendingFormat:@".%@", v7];
    keyPath = self->_keyPath;
    self->_keyPath = v8;
  }
  else
  {
    long long v10 = self->_keyPath;
    self->_keyPath = v7;
    uint64_t v7 = v10;
  }
}

- (id)copyReplica
{
  char v3 = [HMDAccessorySetting alloc];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [(HMDAccessorySetting *)self name];
  uint64_t v6 = [(HMDAccessorySetting *)v3 initWithIdentifier:v4 name:v5];

  v6->_type = [(HMDAccessorySetting *)self type];
  v6->_properties = [(HMDAccessorySetting *)self properties];
  uint64_t v7 = [(HMDAccessorySetting *)self constraints];
  uint64_t v8 = __deepCopiedConstraints(v7);
  uint64_t v9 = [v8 mutableCopy];
  constraints = v6->_constraints;
  v6->_constraints = (NSMutableArray *)v9;

  uint64_t v11 = [(HMDAccessorySetting *)self value];
  id value = v6->_value;
  v6->_id value = (id)v11;

  return v6;
}

- (id)copyIdentical
{
  char v3 = [HMDAccessorySetting alloc];
  id v4 = [(HMDAccessorySetting *)self identifier];
  id v5 = [(HMDAccessorySetting *)self name];
  uint64_t v6 = [(HMDAccessorySetting *)v3 initWithIdentifier:v4 name:v5];

  v6->_type = [(HMDAccessorySetting *)self type];
  v6->_properties = [(HMDAccessorySetting *)self properties];
  uint64_t v7 = [(HMDAccessorySetting *)self constraints];
  uint64_t v8 = [v7 mutableCopy];
  constraints = v6->_constraints;
  v6->_constraints = (NSMutableArray *)v8;

  uint64_t v10 = [(HMDAccessorySetting *)self value];
  id value = v6->_value;
  v6->_id value = (id)v10;

  return v6;
}

- (BOOL)compareConstraints:(id)a3
{
  id v4 = (HMDAccessorySetting *)a3;
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
    uint64_t v6 = v5;
    if (v6)
    {
      int64_t v7 = [(HMDAccessorySetting *)self type];
      if (v7 == 4 || v7 == 2)
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v9 = [(HMDAccessorySetting *)self constraints];
        uint64_t v10 = [v8 setWithArray:v9];
        uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
        id v12 = [(HMDAccessorySetting *)v6 constraints];
        BOOL v13 = [v11 setWithArray:v12];
        char v14 = [v10 isEqualToSet:v13];
      }
      else
      {
        char v14 = 1;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccessorySetting *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
    uint64_t v6 = v5;
    if (v6)
    {
      int64_t v7 = [(HMDAccessorySetting *)self name];
      uint64_t v8 = [(HMDAccessorySetting *)v6 name];
      char v9 = [v7 isEqualToString:v8];
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
  v2 = [(HMDAccessorySetting *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)description:(id)a3 indent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessorySetting *)self name];
  char v9 = [(HMDAccessorySetting *)self identifier];
  [v6 appendFormat:@"\r %@ name = %@, identifier = %@\n", v7, v8, v9];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(HMDAccessorySetting *)self constraints];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [v6 appendFormat:@"\r     %@ %@\n", v7, *(void *)(*((void *)&v15 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (NSString)description
{
  unint64_t v3 = NSString;
  id v4 = [(HMDAccessorySetting *)self keyPath];
  id v5 = [(HMDAccessorySetting *)self identifier];
  id v6 = [(HMDAccessorySetting *)self value];
  id v7 = [v3 stringWithFormat:@"[HMD-Accessory-Setting: %@/%@ - %@]", v4, v5, v6];

  return (NSString *)v7;
}

- (HMDAccessorySetting)initWithIdentifier:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDAccessorySetting;
    char v9 = [(HMDAccessorySetting *)&v19 init];
    uint64_t v10 = v9;
    if (v9)
    {
      v9->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_identifier, a3);
      objc_storeStrong((id *)&v10->_name, a4);
      uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      constraints = v10->_constraints;
      v10->_constraints = (NSMutableArray *)v11;

      uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
      inMemoryCachedConstraints = v10->_inMemoryCachedConstraints;
      v10->_inMemoryCachedConstraints = (NSMutableArray *)v13;

      uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
      inMemoryCachedConstraintRemovals = v10->_inMemoryCachedConstraintRemovals;
      v10->_inMemoryCachedConstraintRemovals = (NSMutableSet *)v15;
    }
    self = v10;
    long long v17 = self;
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (HMDAccessorySetting)initWithModel:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuid];
  id v6 = (void *)[v5 copy];
  id v7 = [v4 name];
  id v8 = (void *)[v7 copy];
  char v9 = [(HMDAccessorySetting *)self initWithIdentifier:v6 name:v8];

  if (v9)
  {
    uint64_t v10 = [v4 type];
    v9->_type = [v10 integerValue];

    uint64_t v11 = [v4 properties];
    v9->_properties = [v11 unsignedIntegerValue];

    uint64_t v12 = [v4 configurationVersion];
    v9->_unint64_t configurationVersion = [v12 unsignedIntegerValue];

    uint64_t v13 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = [(id)objc_opt_class() supportedValueClasses];
    uint64_t v15 = [v4 value];
    id v24 = 0;
    uint64_t v16 = [v13 unarchivedObjectOfClasses:v14 fromData:v15 error:&v24];
    id v17 = v24;
    id value = v9->_value;
    v9->_id value = (id)v16;

    if (!v9->_value)
    {
      objc_super v19 = (void *)MEMORY[0x1D9452090]();
      uint64_t v20 = v9;
      long long v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v26 = v22;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive supported value from the model's value data: %@", buf, 0x16u);
      }
    }
  }
  return v9;
}

- (HMDAccessorySetting)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedConstraintClasses
{
  if (supportedConstraintClasses_onceToken != -1) {
    dispatch_once(&supportedConstraintClasses_onceToken, &__block_literal_global_55_177877);
  }
  v2 = (void *)supportedConstraintClasses_supportedConstraintClasses;
  return v2;
}

void __49__HMDAccessorySetting_supportedConstraintClasses__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supportedConstraintClasses_supportedConstraintClasses;
  supportedConstraintClasses_supportedConstraintClasses = v2;
}

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken != -1) {
    dispatch_once(&supportedValueClasses_onceToken, &__block_literal_global_50_177880);
  }
  uint64_t v2 = (void *)supportedValueClasses_supportedValueClasses;
  return v2;
}

void __44__HMDAccessorySetting_supportedValueClasses__block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  void v4[3] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supportedValueClasses_supportedValueClasses;
  supportedValueClasses_supportedValueClasses = v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t58 != -1) {
    dispatch_once(&logCategory__hmf_once_t58, &__block_literal_global_177882);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v59;
  return v2;
}

uint64_t __34__HMDAccessorySetting_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v59;
  logCategory__hmf_once___int16 v59 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)decodedValue:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v7 = +[HMDAccessorySetting supportedValueClasses];
  id v8 = [v5 unarchivedObjectOfClasses:v7 fromData:v6 error:a4];

  return v8;
}

@end