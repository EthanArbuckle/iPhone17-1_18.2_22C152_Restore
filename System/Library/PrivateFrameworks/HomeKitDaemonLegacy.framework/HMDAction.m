@interface HMDAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isUnsecuringAction;
- (BOOL)requiresDeviceUnlock;
- (Class)modelClass;
- (HMDAction)init;
- (HMDAction)initWithCoder:(id)a3;
- (HMDAction)initWithUUID:(id)a3 actionSet:(id)a4;
- (HMDActionSet)actionSet;
- (NSArray)associatedAccessories;
- (NSDictionary)dictionaryRepresentation;
- (NSString)stateDump;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (NSUUID)uuid;
- (id)attributeDescriptions;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)logIdentifier;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)modelObjectWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (unint64_t)entitlementsForNotification;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)setActionSet:(id)a3;
- (void)setUuid:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateActionSetIfNil:(id)a3;
@end

@implementation HMDAction

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAction *)self actionSet];
  [v4 encodeConditionalObject:v5 forKey:@"actionActionSet"];

  id v7 = [(HMDAction *)self uuid];
  v6 = [v7 UUIDString];
  [v4 encodeObject:v6 forKey:@"actionUUID"];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDActionSet)actionSet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSet);
  return (HMDActionSet *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionSet);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setActionSet:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDAction *)self uuid];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAction *)self type];
  id v7 = HMActionTypeAsString();
  v8 = (void *)[v6 initWithName:@"Type" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDAction)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionUUID"];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionActionSet"];
    v8 = [(HMDAction *)self initWithUUID:v6 actionSet:v7];

    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = @"actionUUID";
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode HMDAction missing key: %@", (uint8_t *)&v14, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)logIdentifier
{
  v2 = [(HMDAction *)self uuid];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    int v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = (id)objc_opt_class();
      id v18 = v25;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);
    }
    v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v19];
  }
}

- (id)modelBackedObjects
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HMDAction *)self modelObjectWithChangeType:a3 version:a4];
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v6 = objc_alloc([(HMDAction *)self modelClass]);
  uuid = self->_uuid;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSet);
  id v9 = [WeakRetained uuid];
  id v10 = (void *)[v6 initWithObjectChangeType:a3 uuid:uuid parentUUID:v9];

  return v10;
}

- (NSUUID)modelParentIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionSet);
  id v3 = [WeakRetained uuid];

  return (NSUUID *)v3;
}

- (NSUUID)modelIdentifier
{
  return self->_uuid;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isUnsecuringAction
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HMDAction *)self type];
  uint64_t v6 = [v4 type];

  return v5 == v6;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSArray)associatedAccessories
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)entitlementsForNotification
{
  return 1;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_msgSend(objc_alloc(-[HMDAction modelClass](self, "modelClass")), "initWithObjectChangeType:uuid:parentUUID:", a3, v9, v8);

  return v10;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  return [(HMDAction *)self modelObjectWithChangeType:a3 version:4];
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v10 = *MEMORY[0x1E4F1C3B8];
  id v11 = NSString;
  v12 = NSStringFromSelector(a2);
  id v13 = [v11 stringWithFormat:@"You must override %@ in a subclass", v12];
  id v14 = [v9 exceptionWithName:v10 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (NSDictionary)dictionaryRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"kActionUUID";
  uint64_t v3 = [(HMDAction *)self uuid];
  id v4 = [v3 UUIDString];
  v8[1] = @"kActionType";
  v9[0] = v4;
  unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAction type](self, "type"));
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return (NSDictionary *)v6;
}

- (NSString)stateDump
{
  v2 = NSString;
  uint64_t v3 = [(HMDAction *)self uuid];
  id v4 = [v3 UUIDString];
  unint64_t v5 = [v2 stringWithFormat:@"Action uuid: %@", v4];

  return (NSString *)v5;
}

- (unint64_t)type
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)updateActionSetIfNil:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDAction *)self actionSet];

  if (!v4) {
    [(HMDAction *)self setActionSet:v5];
  }
}

- (HMDAction)initWithUUID:(id)a3 actionSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAction;
  id v9 = [(HMDAction *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeWeak((id *)&v10->_actionSet, v8);
  }

  return v10;
}

- (HMDAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_121507 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_121507, &__block_literal_global_121508);
  }
  v2 = (void *)logCategory__hmf_once_v3_121509;
  return v2;
}

uint64_t __24__HMDAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_121509;
  logCategory__hmf_once_v3_121509 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  return 0;
}

@end