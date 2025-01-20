@interface _HMAccessorySetting
+ (BOOL)supportsSecureCoding;
+ (id)_encodedConstraintsToAdd:(id)a3;
+ (id)_encodedConstraintsToRemove:(id)a3;
+ (id)_replaceConstraintsPayloadWithAdditions:(id)a3 removals:(id)a4 keyPath:(id)a5;
+ (id)logCategory;
+ (id)shortDescription;
+ (id)supportedConstraintClasses;
+ (id)supportedValueClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReflected;
- (BOOL)mergeConstraints:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (HMAccessorySettings)accessorySettings;
- (NSArray)constraints;
- (NSCopying)value;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)messageTargetUUID;
- (_HMAccessorySetting)initWithCoder:(id)a3;
- (_HMAccessorySetting)initWithType:(int64_t)a3 properties:(unint64_t)a4 name:(id)a5 constraints:(id)a6;
- (_HMAccessorySettingDelegate)delegate;
- (_HMContext)context;
- (id)constraintWithType:(int64_t)a3;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)logIdentifier;
- (id)messageDestination;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)properties;
- (void)_handleUpdatedValue:(id)a3;
- (void)_registerUpdatedValueHandlers;
- (void)addConstraint:(id)a3;
- (void)addConstraint:(id)a3 completionHandler:(id)a4;
- (void)configureWithAccessorySettings:(id)a3 context:(id)a4;
- (void)configureWithAccessorySettings:(id)a3 context:(id)a4 shouldHandleUpdatedValue:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
- (void)notifyDelegateOfAddedConstraint:(id)a3;
- (void)notifyDelegateOfRemovedConstraint:(id)a3;
- (void)removeConstraint:(id)a3;
- (void)removeConstraint:(id)a3 completionHandler:(id)a4;
- (void)replaceConstraints:(id)a3 withConstraints:(id)a4 completionHandler:(id)a5;
- (void)setAccessorySettings:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setReflected:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)unconfigure;
- (void)updateConstraints:(id)a3 completionHandler:(id)a4;
- (void)updateValue:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMAccessorySetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_accessorySettings);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setAccessorySettings:(id)a3
{
}

- (HMAccessorySettings)accessorySettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessorySettings);

  return (HMAccessorySettings *)WeakRetained;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (_HMAccessorySettingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_HMAccessorySettingDelegate *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_HMAccessorySetting *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_HMAccessorySetting type](self, "type"), @"HM.type");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_HMAccessorySetting properties](self, "properties"), @"HM.properties");
  v6 = [(_HMAccessorySetting *)self name];
  [v4 encodeObject:v6 forKey:@"HM.name"];

  v7 = [(_HMAccessorySetting *)self constraints];
  [v4 encodeObject:v7 forKey:@"HM.constraint"];

  id v8 = [(_HMAccessorySetting *)self value];
  [v4 encodeObject:v8 forKey:@"HM.value"];
}

- (_HMAccessorySetting)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"HM.type"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HM.properties"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  id v8 = [(id)objc_opt_class() supportedConstraintClasses];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HM.constraint"];

  v10 = [(_HMAccessorySetting *)self initWithType:v5 properties:v6 name:v7 constraints:v9];
  if (v10)
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v11);
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v12;

    v14 = [(id)objc_opt_class() supportedValueClasses];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"HM.value"];
    value = v10->_value;
    v10->_value = (NSCopying *)v15;

    v10->_reflected = [v4 decodeBoolForKey:@"HM.pms"];
  }

  return v10;
}

- (id)messageDestination
{
  v2 = [(_HMAccessorySetting *)self messageTargetUUID];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F65488]) initWithTarget:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(_HMAccessorySetting *)self accessorySettings];
  v3 = [v2 settingsContainerInternal];
  id v4 = [v3 containerUUID];

  return (NSUUID *)v4;
}

- (BOOL)mergeConstraints:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = [(_HMAccessorySetting *)self constraints];
  v7 = [v5 setWithArray:v6];

  id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  v9 = (void *)[v7 mutableCopy];
  [v9 minusSet:v8];
  if ([v9 count])
  {
    id v32 = v4;
    v10 = (void *)MEMORY[0x19F3A64A0]();
    v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v13;
      __int16 v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing constraints: %@", buf, 0x16u);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    BOOL v16 = v15 != 0;
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v14);
          }
          [(_HMAccessorySetting *)v11 removeConstraint:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v17);
    }

    id v4 = v32;
  }
  else
  {
    BOOL v16 = 0;
  }
  v20 = (void *)[v8 mutableCopy];
  [v20 minusSet:v7];
  if ([v20 count])
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = id v24 = v4;
      *(_DWORD *)buf = 138543618;
      v44 = v25;
      __int16 v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Adding constraints: %@", buf, 0x16u);

      id v4 = v24;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v26 = v20;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          [(_HMAccessorySetting *)v22 addConstraint:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v28);
      BOOL v16 = 1;
    }
  }
  return v16;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(_HMAccessorySetting *)self value];
    id v8 = [v6 value];
    char v9 = HMFEqualObjects();
    char v10 = v9 ^ 1;

    if ((v9 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = [v6 value];
        int v24 = 138543618;
        v25 = v14;
        __int16 v26 = 2112;
        uint64_t v27 = v15;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updated value: %@", (uint8_t *)&v24, 0x16u);
      }
      BOOL v16 = [v6 value];
      [(_HMAccessorySetting *)v12 setValue:v16];

      uint64_t v17 = [(_HMAccessorySetting *)v12 accessorySettings];
      uint64_t v18 = [(_HMAccessorySetting *)v12 delegate];
      v19 = [v18 keyPathForSetting:v12];
      [v17 _notifyDelegateDidUpdateKeyPath:v19];
    }
    v20 = [v4 constraints];
    BOOL v21 = [(_HMAccessorySetting *)self mergeConstraints:v20];

    char v22 = v21 | v10;
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (id)logIdentifier
{
  v2 = [(_HMAccessorySetting *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)updateValue:(id)a3 completionHandler:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMAccessorySetting *)self context];
  if (!v7)
  {
    uint64_t v37 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAccessorySetting updateValue:completionHandler:]", @"completionHandler"];
    long long v38 = (void *)MEMORY[0x19F3A64A0]();
    long long v39 = self;
    long long v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v41;
      __int16 v57 = 2112;
      v58 = (const char *)v37;
      _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v42 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v37 userInfo:0];
    objc_exception_throw(v42);
  }
  char v9 = (void *)v8;
  if (v8)
  {
    char v10 = [(_HMAccessorySetting *)self accessorySettings];
    if (v10)
    {
      v11 = [(_HMAccessorySetting *)self delegate];
      uint64_t v12 = [v11 keyPathForSetting:self];

      v13 = [v10 settingsContainer];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;

      if (v15 && [v15 supportsMessagedHomePodSettings])
      {
        BOOL v16 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v17 = self;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v56 = v19;
          __int16 v57 = 2112;
          v58 = v12;
          __int16 v59 = 2112;
          id v60 = v6;
          _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating through settings adapter with keypath: %@ value: %@", buf, 0x20u);
        }
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke;
        v53[3] = &unk_1E59449C8;
        v53[4] = v17;
        id v54 = v7;
        [v15 updateSettingWithKeyPath:v12 value:v6 completionHandler:v53];
      }
      else
      {
        int v24 = [v10 settingsContainer];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
        id v26 = v25;

        if (v26 && [v26 supportsMessagedHomepodSettings])
        {
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_123;
          v50[3] = &unk_1E59449F0;
          v50[4] = self;
          v51 = v12;
          id v52 = v7;
          [v26 updateSettingWithKeyPath:v51 value:v6 completionHandler:v50];
        }
        else
        {
          v30 = (void *)MEMORY[0x19F3A64A0]();
          v31 = self;
          id v32 = HMFGetOSLogHandle();
          id v43 = v6;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            long long v33 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v56 = v33;
            __int16 v57 = 2112;
            v58 = v12;
            __int16 v59 = 2112;
            id v60 = v43;
            _os_log_impl(&dword_19D1A8000, v32, OS_LOG_TYPE_INFO, "%{public}@Updating through sending update value message with keypath: %@ value: %@", buf, 0x20u);

            id v6 = v43;
          }

          long long v34 = (void *)[v6 copy];
          long long v35 = [v9 queue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __53___HMAccessorySetting_updateValue_completionHandler___block_invoke_124;
          block[3] = &unk_1E5944A18;
          block[4] = v31;
          id v49 = v7;
          id v45 = v34;
          v46 = v12;
          id v47 = v10;
          id v48 = v9;
          id v36 = v34;
          dispatch_async(v35, block);

          id v6 = v43;
        }
      }
    }
    else
    {
      uint64_t v27 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v56 = v29;
        _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, char *))v7 + 2))(v7, v12);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v21 = self;
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v56 = v23;
      __int16 v57 = 2080;
      v58 = "-[_HMAccessorySetting updateValue:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)_handleUpdatedValue:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HMAccessorySetting *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 pendingRequests];
    uint64_t v8 = [v4 identifier];
    char v9 = [v7 retrieveCompletionBlockForIdentifier:v8];

    if (v9)
    {
LABEL_3:
      [v4 respondWithPayload:0];
LABEL_4:

      goto LABEL_8;
    }
    id v14 = [v4 dataForKey:@"value"];
    if (!v14)
    {
      long long v34 = (void *)MEMORY[0x19F3A64A0]();
      long long v35 = self;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = HMFGetLogIdentifier();
        long long v38 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v56 = v37;
        __int16 v57 = 2112;
        v58 = v38;
        _os_log_impl(&dword_19D1A8000, v36, OS_LOG_TYPE_ERROR, "%{public}@Missing updated serialized value from message payload: %@", buf, 0x16u);
      }
      long long v39 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v39];

      goto LABEL_4;
    }
    id v15 = (void *)MEMORY[0x1E4F28DC0];
    BOOL v16 = +[_HMAccessorySetting supportedValueClasses];
    id v54 = 0;
    id v17 = [v15 unarchivedObjectOfClasses:v16 fromData:v14 error:&v54];
    v50 = (char *)v54;

    if (!v17)
    {
      long long v40 = (void *)MEMORY[0x19F3A64A0]();
      v41 = self;
      id v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v56 = v43;
        __int16 v57 = 2112;
        v58 = v50;
        _os_log_impl(&dword_19D1A8000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive supported value from value data: %@", buf, 0x16u);
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v17];
      int v33 = 1;
LABEL_31:

      if (v33) {
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    uint64_t v18 = [v4 stringForKey:@"keyPath"];
    if (v18)
    {
      v19 = [(_HMAccessorySetting *)self delegate];
      v20 = [v19 keyPathForSetting:self];
      int v21 = [v18 isEqualToString:v20];

      if (v21)
      {
        char v22 = [MEMORY[0x1E4F1CA98] null];
        int v23 = [v17 isEqual:v22];

        if (v23)
        {

          id v17 = 0;
        }
        int v24 = (void *)MEMORY[0x19F3A64A0]();
        v25 = self;
        id v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          uint64_t v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v56 = v27;
          __int16 v57 = 2112;
          v58 = (const char *)v17;
          _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating value to: %@", buf, 0x16u);
        }
        uint64_t v28 = [(_HMAccessorySetting *)v25 value];
        char v29 = HMFEqualObjects();

        if ((v29 & 1) == 0)
        {
          objc_initWeak((id *)buf, v25);
          v30 = [(_HMAccessorySetting *)v25 delegate];
          v31 = [(_HMAccessorySetting *)v25 accessorySettings];
          [v30 _settingWillUpdateValue:v25];
          id v49 = v30;
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __43___HMAccessorySetting__handleUpdatedValue___block_invoke;
          v51[3] = &unk_1E59449A0;
          objc_copyWeak(&v53, (id *)buf);
          id v17 = v17;
          id v52 = v17;
          [v31 _updateSettingsWithBlock:v51];
          id v32 = [v30 keyPathForSetting:v25];
          [v31 _notifyDelegateDidUpdateKeyPath:v32];

          objc_destroyWeak(&v53);
          objc_destroyWeak((id *)buf);
        }
        int v33 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x19F3A64A0]();
      id v45 = self;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v56 = v47;
        _os_log_impl(&dword_19D1A8000, v46, OS_LOG_TYPE_INFO, "%{public}@Accessory settings update value message missing key path", buf, 0xCu);
      }
      id v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v48];
    }
    int v33 = 1;
LABEL_30:

    goto LABEL_31;
  }
  char v10 = (void *)MEMORY[0x19F3A64A0]();
  v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v56 = v13;
    __int16 v57 = 2080;
    v58 = "-[_HMAccessorySetting _handleUpdatedValue:]";
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
  }
LABEL_8:
}

- (void)setValue:(id)a3
{
  id v4 = (NSCopying *)a3;
  os_unfair_lock_lock_with_options();
  value = self->_value;
  self->_value = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSCopying)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_value;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateConstraints:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMAccessorySetting *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAccessorySetting updateConstraints:completionHandler:]", @"completionHandler"];
    char v22 = (void *)MEMORY[0x19F3A64A0]();
    int v23 = self;
    int v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v33 = v25;
      __int16 v34 = 2112;
      long long v35 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  char v9 = (void *)v8;
  if (v8)
  {
    char v10 = (void *)[v6 copy];
    v11 = [(_HMAccessorySetting *)self accessorySettings];
    if (v11)
    {
      uint64_t v12 = [v9 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59___HMAccessorySetting_updateConstraints_completionHandler___block_invoke;
      block[3] = &unk_1E5944900;
      block[4] = self;
      id v28 = v10;
      id v31 = v7;
      id v29 = v11;
      id v30 = v9;
      dispatch_async(v12, block);
    }
    else
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        int v33 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);
      }
      v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v20);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v33 = v16;
      __int16 v34 = 2080;
      long long v35 = "-[_HMAccessorySetting updateConstraints:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)replaceConstraints:(id)a3 withConstraints:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(_HMAccessorySetting *)self context];
  if (!v10)
  {
    uint64_t v25 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAccessorySetting replaceConstraints:withConstraints:completionHandler:]", @"completionHandler"];
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v27 = self;
    id v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v40 = v29;
      __int16 v41 = 2112;
      id v42 = (const char *)v25;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0];
    objc_exception_throw(v30);
  }
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    v13 = (void *)[v8 copy];
    id v14 = (void *)[v9 copy];
    id v15 = [(_HMAccessorySetting *)self accessorySettings];
    if (v15)
    {
      BOOL v16 = [v12 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76___HMAccessorySetting_replaceConstraints_withConstraints_completionHandler___block_invoke;
      block[3] = &unk_1E5944950;
      block[4] = self;
      id v32 = v13;
      id v33 = v14;
      id v34 = v8;
      id v35 = v9;
      id v38 = v10;
      id v36 = v15;
      id v37 = v12;
      dispatch_async(v16, block);
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
      char v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v40 = v23;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);
      }
      int v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v10 + 2))(v10, v24);
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v40 = v20;
      __int16 v41 = 2080;
      id v42 = "-[_HMAccessorySetting replaceConstraints:withConstraints:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

- (void)setReflected:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_reflected = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isReflected
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reflected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)removeConstraint:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMAccessorySetting *)self context];
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAccessorySetting removeConstraint:completionHandler:]", @"completionHandler"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    char v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v24;
      __int16 v34 = 2112;
      id v35 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = [(_HMAccessorySetting *)self accessorySettings];
    if (v10)
    {
      uint64_t v11 = [v9 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58___HMAccessorySetting_removeConstraint_completionHandler___block_invoke;
      block[3] = &unk_1E5944900;
      id v27 = v6;
      id v28 = self;
      id v31 = v7;
      id v29 = v10;
      id v30 = v9;
      dispatch_async(v11, block);

      uint64_t v12 = v27;
    }
    else
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v16;
      __int16 v34 = 2080;
      id v35 = "-[_HMAccessorySetting removeConstraint:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)notifyDelegateOfRemovedConstraint:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_HMAccessorySetting *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __57___HMAccessorySetting_notifyDelegateOfRemovedConstraint___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[_HMAccessorySetting notifyDelegateOfRemovedConstraint:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)removeConstraint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableOrderedSet *)self->_constraints containsObject:v5])
    {
      [(NSMutableOrderedSet *)self->_constraints removeObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySetting *)self notifyDelegateOfRemovedConstraint:v5];
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)addConstraint:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_HMAccessorySetting *)self context];
  if (!v7)
  {
    uint64_t v20 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMAccessorySetting addConstraint:completionHandler:]", @"completionHandler"];
    uint64_t v21 = (void *)MEMORY[0x19F3A64A0]();
    char v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v24;
      __int16 v34 = 2112;
      id v35 = (const char *)v20;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:0];
    objc_exception_throw(v25);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = [(_HMAccessorySetting *)self accessorySettings];
    if (v10)
    {
      uint64_t v11 = [v9 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55___HMAccessorySetting_addConstraint_completionHandler___block_invoke;
      block[3] = &unk_1E5944900;
      id v27 = v6;
      id v28 = self;
      id v31 = v7;
      id v29 = v10;
      id v30 = v9;
      dispatch_async(v11, block);

      uint64_t v12 = v27;
    }
    else
    {
      id v17 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v33 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@VERIFY_ACCESSORYSETTINGS - nil", buf, 0xCu);
      }
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMErrorDomain" code:2 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v16;
      __int16 v34 = 2080;
      id v35 = "-[_HMAccessorySetting addConstraint:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)notifyDelegateOfAddedConstraint:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_HMAccessorySetting *)self context];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55___HMAccessorySetting_notifyDelegateOfAddedConstraint___block_invoke;
    v12[3] = &unk_1E5945628;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v7, v12);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v11;
      __int16 v16 = 2080;
      id v17 = "-[_HMAccessorySetting notifyDelegateOfAddedConstraint:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

- (void)addConstraint:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableOrderedSet *)self->_constraints containsObject:v5])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSMutableOrderedSet *)self->_constraints addObject:v5];
      os_unfair_lock_unlock(&self->_lock);
      [(_HMAccessorySetting *)self notifyDelegateOfAddedConstraint:v5];
    }
  }

  MEMORY[0x1F4181820]();
}

- (id)constraintWithType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_constraints;
  uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (void)setConstraints:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:a3];
  os_unfair_lock_lock_with_options();
  constraints = self->_constraints;
  self->_constraints = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)constraints
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableOrderedSet *)self->_constraints array];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v5;
}

- (void)_registerUpdatedValueHandlers
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Registering message for updated value", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(_HMAccessorySetting *)v4 context];
  uint64_t v8 = [v7 messageDispatcher];
  [v8 registerForMessage:@"HMAS.uv" receiver:v4 selector:sel__handleUpdatedValue_];
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4 shouldHandleUpdatedValue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    long long v13 = HMFGetLogIdentifier();
    int v14 = 138543618;
    long long v15 = v13;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Configuring with context: %@", (uint8_t *)&v14, 0x16u);
  }
  [(_HMAccessorySetting *)v11 setAccessorySettings:v8];
  [(_HMAccessorySetting *)v11 setContext:v9];
  if (v5) {
    [(_HMAccessorySetting *)v11 _registerUpdatedValueHandlers];
  }
}

- (void)configureWithAccessorySettings:(id)a3 context:(id)a4
{
}

- (NSString)description
{
  return (NSString *)[(_HMAccessorySetting *)self descriptionWithPointer:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(_HMAccessorySetting *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = NSString;
  id v6 = [(id)objc_opt_class() shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &stru_1EEE9DD88;
  }
  id v8 = [(_HMAccessorySetting *)self identifier];
  id v9 = [v8 UUIDString];
  id v10 = [(_HMAccessorySetting *)self name];
  uint64_t v11 = [(_HMAccessorySetting *)self value];
  uint64_t v12 = [v5 stringWithFormat:@"<%@%@, Identifier = %@, Name = %@, Value = %@>", v6, v7, v9, v10, v11];

  if (v3) {

  }
  return v12;
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  BOOL v5 = [(_HMAccessorySetting *)self name];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_HMAccessorySetting *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(_HMAccessorySetting *)self identifier];
      id v8 = [(_HMAccessorySetting *)v6 identifier];
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
  v2 = [(_HMAccessorySetting *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)unconfigure
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x19F3A64A0](self, a2);
  id v4 = self;
  BOOL v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring accessorySetting", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = [(_HMAccessorySetting *)v4 context];
  id v8 = [v7 messageDispatcher];
  [v8 deregisterReceiver:v4];

  [(_HMAccessorySetting *)v4 setContext:0];
}

- (_HMAccessorySetting)initWithType:(int64_t)a3 properties:(unint64_t)a4 name:(id)a5 constraints:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)_HMAccessorySetting;
    uint64_t v12 = [(_HMAccessorySetting *)&v23 init];
    if (v12)
    {
      long long v13 = (void *)MEMORY[0x1E4F654F0];
      int v14 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v15 = objc_msgSend(v13, "hmf_cachedInstanceForNSUUID:", v14);
      identifier = v12->_identifier;
      v12->_identifier = (NSUUID *)v15;

      v12->_type = a3;
      v12->_properties = a4;
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v10);
      name = v12->_name;
      v12->_name = (NSString *)v17;

      if (v11) {
        [MEMORY[0x1E4F1CA70] orderedSetWithArray:v11];
      }
      else {
      uint64_t v19 = [MEMORY[0x1E4F1CA70] orderedSet];
      }
      constraints = v12->_constraints;
      v12->_constraints = (NSMutableOrderedSet *)v19;
    }
    self = v12;
    uint64_t v20 = self;
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedConstraintClasses
{
  if (supportedConstraintClasses_onceToken != -1) {
    dispatch_once(&supportedConstraintClasses_onceToken, &__block_literal_global_139);
  }
  v2 = (void *)supportedConstraintClasses_supportedConstraintClasses;

  return v2;
}

+ (id)supportedValueClasses
{
  if (supportedValueClasses_onceToken_57298 != -1) {
    dispatch_once(&supportedValueClasses_onceToken_57298, &__block_literal_global_133_57299);
  }
  v2 = (void *)supportedValueClasses_supportedValueClasses_57300;

  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t63 != -1) {
    dispatch_once(&logCategory__hmf_once_t63, &__block_literal_global_57341);
  }
  v2 = (void *)logCategory__hmf_once_v64;

  return v2;
}

+ (id)_replaceConstraintsPayloadWithAdditions:(id)a3 removals:(id)a4 keyPath:(id)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"remove";
  v13[1] = @"add";
  v14[0] = a4;
  v14[1] = a3;
  v13[2] = @"keyPath";
  v14[2] = a5;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

+ (id)_encodedConstraintsToAdd:(id)a3
{
  return encodeRootObject(a3);
}

+ (id)_encodedConstraintsToRemove:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
        id v11 = [v10 UUIDString];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end