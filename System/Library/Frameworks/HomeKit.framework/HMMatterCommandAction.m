@interface HMMatterCommandAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithProtoBuf:(id)a3 home:(id)a4;
+ (id)new;
- (BOOL)enforceExecutionOrder;
- (BOOL)isEqual:(id)a3;
- (HMMatterCommandAction)init;
- (HMMatterCommandAction)initWithCoder:(id)a3;
- (HMMatterCommandAction)initWithCommands:(id)a3 enforceExecutionOrder:(BOOL)a4 uuid:(id)a5;
- (HMMatterCommandAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMMatterCommandAction)initWithMatterCommands:(id)a3 enforceExecutionOrder:(BOOL)a4;
- (HMMatterCommandAction)initWithUUID:(id)a3;
- (NSArray)commands;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsProtoBuf;
- (unint64_t)type;
- (void)__configureWithContext:(id)a3 actionSet:(id)a4;
@end

@implementation HMMatterCommandAction

- (void).cxx_destruct
{
}

- (BOOL)enforceExecutionOrder
{
  return self->_enforceExecutionOrder;
}

- (NSArray)commands
{
  return self->_commands;
}

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMMatterCommandAction enforceExecutionOrder](self, "enforceExecutionOrder"));
  v5 = [(HMMatterCommandAction *)self commands];
  v6 = [v3 stringWithFormat:@"EnforceExecutionOrder: %@ Commands: %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = +[HMMatterCommandAction allocWithZone:a3];
  v7 = [(HMMatterCommandAction *)self commands];
  v8 = [(HMMatterCommandAction *)v6 initWithMatterCommands:v7 enforceExecutionOrder:[(HMMatterCommandAction *)self enforceExecutionOrder]];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMMatterCommandAction *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
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
      v7 = [(HMMatterCommandAction *)self commands];
      v8 = [(HMMatterCommandAction *)v6 commands];
      if ([v7 isEqualToArray:v8])
      {
        BOOL v9 = [(HMMatterCommandAction *)self enforceExecutionOrder];
        BOOL v10 = v9 ^ [(HMMatterCommandAction *)v6 enforceExecutionOrder] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (HMMatterCommandAction)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMMatterCommandAction;
  v5 = [(HMAction *)&v27 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = HMAllowedClassesForMatterCommand();
  BOOL v9 = [v7 setWithArray:v8];
  BOOL v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HMCommandKey"];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__HMMatterCommandAction_initWithCoder___block_invoke;
    v23[3] = &unk_1E5942B90;
    id v24 = v6;
    v12 = v5;
    v25 = v12;
    id v26 = v11;
    id v13 = v11;
    id v14 = v6;
    [v10 enumerateObjectsUsingBlock:v23];
    uint64_t v15 = [v13 copy];
    commands = v12->_commands;
    v12->_commands = (NSArray *)v15;

    v12->_enforceExecutionOrder = [v4 decodeBoolForKey:@"HMEnforceExecutionOrderCodingKey"];
LABEL_4:
    v17 = v5;
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x19F3A64A0]();
  v19 = v5;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v29 = v21;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to get serializedCommands from coder", buf, 0xCu);
  }

  v17 = 0;
LABEL_8:

  return v17;
}

void __39__HMMatterCommandAction_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[HMMatterCommand alloc] initWithDictionary:v3 home:*(void *)(a1 + 32)];
  if (v4)
  {
    [*(id *)(a1 + 48) addObject:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      BOOL v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to create matter command from dictionary: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)encodeAsProtoBuf
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(HMPBMatterCommandAction);
  id v4 = [(HMAction *)self uuid];
  v5 = objc_msgSend(v4, "hm_convertToData");
  [(HMPBMatterCommandAction *)v3 setActionUUID:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(HMPBMatterCommandAction *)v3 setCommands:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(HMMatterCommandAction *)self commands];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) encodeAsProtoBuf];
        if (v12)
        {
          uint64_t v13 = [(HMPBMatterCommandAction *)v3 commands];
          [v13 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [(HMPBMatterCommandAction *)v3 setEnforceExecutionOrder:[(HMMatterCommandAction *)self enforceExecutionOrder]];
  id v14 = objc_alloc_init(HMPBActionContainer);
  [(HMPBActionContainer *)v14 setType:4];
  [(HMPBActionContainer *)v14 setMatterCommandAction:v3];

  return v14;
}

- (id)_serializeForAdd
{
  if ([(HMAction *)self isValid])
  {
    v11.receiver = self;
    v11.super_class = (Class)HMMatterCommandAction;
    id v3 = [(HMAction *)&v11 _serializeForAdd];
    id v4 = (void *)[v3 mutableCopy];

    v5 = [(HMMatterCommandAction *)self commands];
    id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_36387);

    v7 = (void *)[v6 copy];
    [v4 setObject:v7 forKeyedSubscript:@"HMCommandActionCommandsKey"];

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMMatterCommandAction enforceExecutionOrder](self, "enforceExecutionOrder"));
    [v4 setObject:v8 forKeyedSubscript:@"HMEnforceExecutionOrderKey"];

    uint64_t v9 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __41__HMMatterCommandAction__serializeForAdd__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializeForAdd];
}

- (unint64_t)type
{
  return 5;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMatterCommandAction;
  [(HMAction *)&v14 __configureWithContext:v6 actionSet:v7];
  uint64_t v8 = [(HMMatterCommandAction *)self commands];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HMMatterCommandAction___configureWithContext_actionSet___block_invoke;
  v11[3] = &unk_1E5942B40;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __58__HMMatterCommandAction___configureWithContext_actionSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 home];
  [v4 _configureWithContext:v2 home:v5];
}

- (HMMatterCommandAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HMMatterCommandAction;
  uint64_t v8 = [(HMAction *)&v45 initWithDictionary:v6 home:v7];
  if (!v8) {
    goto LABEL_27;
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v6, "hmf_arrayForKey:", @"HMCommandActionCommandsKey");
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v42;
  v39 = v8;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(id *)(*((void *)&v41 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v16 = v15;
      }
      else {
        long long v16 = 0;
      }
      id v17 = v16;

      if (!v17)
      {
        v29 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v8 = v39;
        uint64_t v30 = v39;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v32;
          __int16 v48 = 2112;
          id v49 = v15;
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize encoded command %@", buf, 0x16u);
        }
        goto LABEL_24;
      }
      long long v18 = [[HMMatterCommand alloc] initWithDictionary:v15 home:v7];
      if (!v18)
      {
        v33 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v8 = v39;
        v34 = v39;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          __int16 v48 = 2112;
          id v49 = v17;
          _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize command from dictionary %@", buf, 0x16u);
        }

LABEL_24:
        goto LABEL_25;
      }
      long long v19 = v18;
      [v9 addObject:v18];
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
    uint64_t v8 = v39;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_14:

  uint64_t v20 = [v9 copy];
  commands = v8->_commands;
  v8->_commands = (NSArray *)v20;

  id v40 = 0;
  char v22 = objc_msgSend(v6, "hmf_BOOLForKey:error:", @"HMEnforceExecutionOrderKey", &v40);
  id v23 = v40;
  v8->_enforceExecutionOrder = v22;
  if (!v23)
  {

LABEL_27:
    v37 = v8;
    goto LABEL_28;
  }
  id v24 = v23;
  v25 = (void *)MEMORY[0x19F3A64A0]();
  id v26 = v8;
  objc_super v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v47 = v28;
    _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Command action dictionary must have enforce execution order key", buf, 0xCu);
  }

LABEL_25:
  v37 = 0;
LABEL_28:

  return v37;
}

- (HMMatterCommandAction)initWithCommands:(id)a3 enforceExecutionOrder:(BOOL)a4 uuid:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMMatterCommandAction;
  id v10 = [(HMAction *)&v13 initWithUUID:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_commands, a3);
    v11->_enforceExecutionOrder = a4;
  }

  return v11;
}

- (HMMatterCommandAction)initWithMatterCommands:(id)a3 enforceExecutionOrder:(BOOL)a4
{
  return [(HMMatterCommandAction *)self initWithCommands:a3 enforceExecutionOrder:a4 uuid:0];
}

- (HMMatterCommandAction)initWithUUID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMMatterCommandAction;
  return [(HMAction *)&v4 initWithUUID:a3];
}

- (HMMatterCommandAction)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F29128];
  uint64_t v8 = [v5 actionUUID];
  id v26 = objc_msgSend(v7, "hmf_UUIDWithBytesAsData:", v8);

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  objc_super v27 = v5;
  id v9 = [v5 commands];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    objc_super v13 = off_1E593D000;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v16 = -[__objc2_class commandWithProtoBuf:home:](v13[233], "commandWithProtoBuf:home:", v15, v6, v26);
        if (v16)
        {
          [v28 addObject:v16];
        }
        else
        {
          id v17 = (void *)MEMORY[0x19F3A64A0]();
          long long v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v19 = v12;
            uint64_t v21 = v20 = v6;
            *(_DWORD *)buf = 138543618;
            v34 = v21;
            __int16 v35 = 2112;
            uint64_t v36 = v15;
            _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create command with proto buf: %@", buf, 0x16u);

            id v6 = v20;
            uint64_t v12 = v19;
            objc_super v13 = off_1E593D000;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v11);
  }

  char v22 = [HMMatterCommandAction alloc];
  id v23 = (void *)[v28 copy];
  id v24 = -[HMMatterCommandAction initWithCommands:enforceExecutionOrder:uuid:](v22, "initWithCommands:enforceExecutionOrder:uuid:", v23, [v27 enforceExecutionOrder], v26);

  return v24;
}

+ (id)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end