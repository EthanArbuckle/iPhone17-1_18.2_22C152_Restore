@interface HMAccessorySettingConstraint(HMDBackingStoreModelObject)
- (HMDAccessorySettingConstraintModel)modelWithParentIdentifier:()HMDBackingStoreModelObject;
- (char)initWithModel:()HMDBackingStoreModelObject;
@end

@implementation HMAccessorySettingConstraint(HMDBackingStoreModelObject)

- (HMDAccessorySettingConstraintModel)modelWithParentIdentifier:()HMDBackingStoreModelObject
{
  id v4 = a3;
  v5 = [HMDAccessorySettingConstraintModel alloc];
  v6 = [a1 identifier];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:0 uuid:v6 parentUUID:v4];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "type"));
  [(HMDAccessorySettingConstraintModel *)v7 setType:v8];

  v9 = [a1 value];
  v10 = encodeRootObject();
  [(HMDAccessorySettingConstraintModel *)v7 setValue:v10];

  return v7;
}

- (char)initWithModel:()HMDBackingStoreModelObject
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_19;
  }
  v6 = [v4 type];

  if (!v6)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = a1;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model missing 'type'", buf, 0xCu);
    }
    v33 = [[HMDAssertionLogEvent alloc] initWithReason:@"Model missing 'type'"];
    v34 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v34 submitLogEvent:v33];
  }
  v7 = [v5 type];

  if (!v7)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    a1 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      v27 = "%{public}@Model missing 'type'";
LABEL_17:
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, v27, buf, 0xCu);
    }
LABEL_18:

LABEL_19:
    v23 = 0;
    goto LABEL_20;
  }
  v8 = [v5 type];
  uint64_t v9 = [v8 integerValue];

  v10 = [v5 value];

  if (!v10)
  {
    v35 = (void *)MEMORY[0x1D9452090]();
    v36 = a1;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v38;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Model missing 'value'", buf, 0xCu);
    }
    v39 = [[HMDAssertionLogEvent alloc] initWithReason:@"Model missing 'value'"];
    v40 = +[HMDMetricsManager sharedLogEventSubmitter];
    [v40 submitLogEvent:v39];
  }
  v11 = [v5 value];

  if (!v11)
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    a1 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v43 = v26;
      v27 = "%{public}@Model missing 'value'";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x1E4F28DC0];
  v13 = [(id)objc_opt_class() supportedValueClasses];
  v14 = [v5 value];
  id v41 = 0;
  v15 = [v12 unarchivedObjectOfClasses:v13 fromData:v14 error:&v41];
  id v16 = v41;

  if (!v15)
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = a1;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v43 = v20;
      __int16 v44 = 2112;
      id v45 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory setting constraint model supported value from the model's value: %@", buf, 0x16u);
    }
  }

  v21 = (char *)[a1 initWithType:v9 value:v15];
  if (v21)
  {
    v22 = [v5 uuid];
    [v22 getUUIDBytes:&v21[*MEMORY[0x1E4F2EC10]]];
  }
  a1 = v21;

  v23 = a1;
LABEL_20:

  return v23;
}

@end