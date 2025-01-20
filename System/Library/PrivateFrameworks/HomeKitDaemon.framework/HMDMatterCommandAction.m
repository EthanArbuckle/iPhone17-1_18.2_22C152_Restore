@interface HMDMatterCommandAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)enforceExecutionOrder;
- (BOOL)isActionForMatterPath:(id)a3;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (HMDHome)home;
- (HMDMatterAccessoryProtocol)accessory;
- (HMDMatterCommandAction)init;
- (HMDMatterCommandAction)initWithCoder:(id)a3;
- (HMDMatterCommandAction)initWithUUID:(id)a3 commands:(id)a4 enforceExecutionOrder:(BOOL)a5 actionSet:(id)a6;
- (HMDMatterCommandAction)new;
- (NSArray)commands;
- (NSDictionary)actionInformation;
- (NSString)dumpState;
- (id)associatedAccessories;
- (id)attributeDescriptions;
- (id)dictionaryRepresentation;
- (id)matterPathUUIDs;
- (id)matterPaths;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)serializedCommands;
- (id)serializedCommands:(id)a3;
- (id)stateDump;
- (unint64_t)type;
- (void)_processCommandActionModelUpdated:(id)a3 message:(id)a4;
- (void)addMatterPathsToTransactionIfNotStored:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)matterPathRemoved:(id)a3 message:(id)a4 transaction:(id)a5;
- (void)setCommands:(id)a3;
- (void)setEnforceExecutionOrder:(BOOL)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDMatterCommandAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_dumpState, 0);
  objc_storeStrong((id *)&self->_actionInformation, 0);
  objc_storeStrong((id *)&self->_commands, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)dumpState
{
  return self->_dumpState;
}

- (NSDictionary)actionInformation
{
  return self->_actionInformation;
}

- (void)setEnforceExecutionOrder:(BOOL)a3
{
  self->_enforceExecutionOrder = a3;
}

- (BOOL)enforceExecutionOrder
{
  return self->_enforceExecutionOrder;
}

- (void)setCommands:(id)a3
{
}

- (NSArray)commands
{
  return self->_commands;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAction *)self uuid];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v18[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDMatterCommandAction *)self accessory];
  v8 = [v7 uuid];
  v9 = (void *)[v6 initWithName:@"accessory UUID" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDMatterCommandAction *)self commands];
  v12 = (void *)[v10 initWithName:@"commands" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMatterCommandAction enforceExecutionOrder](self, "enforceExecutionOrder"));
  v15 = (void *)[v13 initWithName:@"enforce execution order" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDMatterCommandActionModel alloc];
  id v6 = [(HMDAction *)self uuid];
  v7 = [(HMDAction *)self actionSet];
  v8 = [v7 uuid];
  v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = [(HMDMatterCommandAction *)self matterPathUUIDs];
  [(HMDMatterCommandActionModel *)v9 setMatterPathUUIDs:v10];

  v11 = [(HMDMatterCommandAction *)self serializedCommands];
  [(HMDMatterCommandActionModel *)v9 setCommands:v11];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMatterCommandAction enforceExecutionOrder](self, "enforceExecutionOrder"));
  [(HMDMatterCommandActionModel *)v9 setEnforceExecutionOrder:v12];

  return v9;
}

- (void)_processCommandActionModelUpdated:(id)a3 message:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 transactionResult];
  v9 = [(HMDAction *)self actionSet];
  id v10 = [v6 setProperties];
  if (![v10 containsObject:@"commands"]) {
    goto LABEL_4;
  }
  v11 = [v6 setProperties];
  int v12 = [v11 containsObject:@"enforceExecutionOrder"];

  if (v12)
  {
    id v13 = [v6 commands];
    v14 = [(HMDMatterCommandAction *)self home];
    v15 = [v6 decodeSerializedMatterCommands:v13 home:v14];
    [(HMDMatterCommandAction *)self setCommands:v15];

    id v10 = [v6 enforceExecutionOrder];
    -[HMDMatterCommandAction setEnforceExecutionOrder:](self, "setEnforceExecutionOrder:", [v10 BOOLValue]);
LABEL_4:
  }
  uint64_t v16 = [v9 home];
  v17 = (void *)v16;
  if (v9 && v16)
  {
    v34 = v8;
    id v35 = v6;
    v36[0] = @"kActionUUID";
    v18 = [(HMDAction *)self uuid];
    v19 = [v18 UUIDString];
    v37[0] = v19;
    v36[1] = @"kActionInfo";
    v20 = [(HMDMatterCommandAction *)self dictionaryRepresentation];
    v37[1] = v20;
    v36[2] = @"kHomeUUID";
    [v17 uuid];
    v22 = v21 = v7;
    v23 = [v22 UUIDString];
    v37[2] = v23;
    v24 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];

    id v7 = v21;
    v25 = (void *)MEMORY[0x230FBD990]([v21 respondWithPayload:v24]);
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v28;
      __int16 v40 = 2112;
      id v41 = v24;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response %@", buf, 0x16u);
    }
    v8 = v34;
    [v34 markChanged];
    id v6 = v35;
    if ([(HMDMatterCommandAction *)v26 isSecureAction]) {
      [v34 markSaveToAssistant];
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v39 = v32;
      __int16 v40 = 2112;
      id v41 = v6;
      __int16 v42 = 2112;
      v43 = v9;
      __int16 v44 = 2112;
      v45 = v17;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@command action Model object (%@) missing actionset %@ or home %@ ", buf, 0x2Au);
    }
    v33 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v33];

    v24 = 0;
  }
}

- (id)matterPathUUIDs
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(HMDMatterCommandAction *)self commands];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_40_118286);
  v5 = [v2 arrayWithArray:v4];

  return v5;
}

id __41__HMDMatterCommandAction_matterPathUUIDs__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 matterPath];
  id v3 = [v2 uuid];

  return v3;
}

- (id)matterPaths
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(HMDMatterCommandAction *)self commands];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_38_118289);
  v5 = [v2 arrayWithArray:v4];

  return v5;
}

uint64_t __37__HMDMatterCommandAction_matterPaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 matterPath];
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [(HMDMatterCommandAction *)self _processCommandActionModelUpdated:v13 message:v10];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
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
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);
    }
    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v19];
  }
}

- (id)serializedCommands:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_118292);
}

uint64_t __45__HMDMatterCommandAction_serializedCommands___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentationWithEncodedValues:0];
}

- (id)serializedCommands
{
  id v3 = [(HMDMatterCommandAction *)self commands];
  v4 = [(HMDMatterCommandAction *)self serializedCommands:v3];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDMatterCommandAction;
  id v4 = a3;
  [(HMDAction *)&v8 encodeWithCoder:v4];
  v5 = [(HMDMatterCommandAction *)self serializedCommands];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0C608]];

  BOOL v6 = [(HMDMatterCommandAction *)self enforceExecutionOrder];
  [v4 encodeBool:v6 forKey:*MEMORY[0x263F0C700]];
  id v7 = [(HMDMatterCommandAction *)self home];
  [v4 encodeConditionalObject:v7 forKey:@"home"];
}

- (HMDMatterCommandAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  objc_super v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)associatedAccessories
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDMatterCommandAction *)self accessory];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = [a3 uuid];
  v5 = [(HMDMatterCommandAction *)self accessory];
  uint64_t v6 = [v5 uuid];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (HMDMatterAccessoryProtocol)accessory
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(HMDMatterCommandAction *)self commands];
  id v4 = [v3 firstObject];
  v5 = [v4 accessory];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    char v7 = self;
    objc_super v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      int v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Accessory was set to nil", (uint8_t *)&v11, 0xCu);
    }
  }
  return (HMDMatterAccessoryProtocol *)v5;
}

- (void)addMatterPathsToTransactionIfNotStored:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMatterCommandAction *)self commands];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__HMDMatterCommandAction_addMatterPathsToTransactionIfNotStored___block_invoke;
  v7[3] = &unk_264A1F8A8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __65__HMDMatterCommandAction_addMatterPathsToTransactionIfNotStored___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addMatterPathToTransactionIfNotStored:*(void *)(a1 + 32)];
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDMatterCommandAction;
  if ([(HMDAction *)&v13 isCompatibleWithAction:v4])
  {
    v5 = [(HMDMatterCommandAction *)self commands];
    id v6 = [v4 commands];
    if ([v5 isEqual:v6])
    {
      char v7 = [(HMDMatterCommandAction *)self accessory];
      id v8 = [v7 uuid];
      id v9 = [v4 accessory];
      id v10 = [v9 uuid];
      char v11 = [v8 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)matterPathRemoved:(id)a3 message:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(HMDMatterCommandAction *)self commands];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __64__HMDMatterCommandAction_matterPathRemoved_message_transaction___block_invoke;
  v22[3] = &unk_264A1F880;
  id v12 = v8;
  id v23 = v12;
  objc_super v13 = objc_msgSend(v11, "na_filter:", v22);

  v14 = [(HMDMatterCommandAction *)self commands];
  char v15 = [v13 isEqualToArray:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = [(HMDAction *)self actionSet];
    uint64_t v17 = [v13 count];
    id v18 = [HMDMatterCommandActionModel alloc];
    v19 = [(HMDAction *)self uuid];
    int v20 = [v16 uuid];
    if (v17)
    {
      v21 = [(HMDBackingStoreModelObject *)v18 initWithObjectChangeType:2 uuid:v19 parentUUID:v20];

      v19 = [(HMDMatterCommandAction *)self serializedCommands:v13];
      [(HMDMatterCommandActionModel *)v21 setCommands:v19];
    }
    else
    {
      v21 = [(HMDBackingStoreModelObject *)v18 initWithObjectChangeType:3 uuid:v19 parentUUID:v20];
    }
    [v10 add:v21 withMessage:v9];
  }
}

uint64_t __64__HMDMatterCommandAction_matterPathRemoved_message_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 matterPath];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (BOOL)isActionForMatterPath:(id)a3
{
  id v4 = a3;
  v5 = [(HMDMatterCommandAction *)self commands];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMDMatterCommandAction_isActionForMatterPath___block_invoke;
  v9[3] = &unk_264A1F880;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __48__HMDMatterCommandAction_isActionForMatterPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCommandForMatterPath:*(void *)(a1 + 32)];
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(HMDMatterCommandAction *)self accessory];
  char v11 = v10;
  if (v10)
  {
    id v12 = [v10 home];
    if (v12)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__118308;
      v34 = __Block_byref_object_dispose__118309;
      id v35 = 0;
      objc_super v13 = [(HMDMatterCommandAction *)self commands];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __73__HMDMatterCommandAction_executeWithSource_clientName_completionHandler___block_invoke;
      v27[3] = &unk_264A1F858;
      id v28 = v11;
      v29 = self;
      v30 = buf;
      unint64_t v31 = a3;
      [v13 enumerateObjectsUsingBlock:v27];

      v14 = _Block_copy(v9);
      char v15 = v14;
      if (v14) {
        (*((void (**)(void *, void))v14 + 2))(v14, *(void *)(*(void *)&buf[8] + 40));
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      __int16 v22 = self;
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home unexpectedly set to nil on accessory %@", buf, 0x16u);
      }
      id v25 = (void (**)(void *, void *))_Block_copy(v9);
      if (v25)
      {
        uint64_t v26 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
        v25[2](v25, v26);
      }
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = 0;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@unable to cast accessory %@ to matter accessory or hap accessory", buf, 0x16u);
    }
    id v12 = (void (**)(void, void))_Block_copy(v9);
    if (v12)
    {
      int v20 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
      ((void (**)(void, void *))v12)[2](v12, v20);
    }
  }
}

void __73__HMDMatterCommandAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a2;
  char v7 = (void *)MEMORY[0x263F10D90];
  id v8 = [v6 matterPath];
  id v9 = [v8 endpointID];
  id v10 = [v6 matterPath];
  char v11 = [v10 clusterID];
  id v12 = [v6 matterPath];
  objc_super v13 = [v12 commandID];
  v14 = [v7 commandPathWithEndpointID:v9 clusterID:v11 commandID:v13];

  char v15 = [*(id *)(a1 + 32) matterAdapter];
  if (v15)
  {
    uint64_t v16 = [v6 commandFields];
    uint64_t v17 = [v6 expectedValues];
    uint64_t v18 = *(void *)(a1 + 56);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __73__HMDMatterCommandAction_executeWithSource_clientName_completionHandler___block_invoke_25;
    v29[3] = &unk_264A1F830;
    uint64_t v19 = *(void *)(a1 + 40);
    v32 = a4;
    v29[4] = v19;
    id v20 = v6;
    uint64_t v21 = *(void *)(a1 + 48);
    id v30 = v20;
    uint64_t v31 = v21;
    [v15 invokeCommand:v14 fields:v16 expectedValues:v17 source:v18 completion:v29];

    __int16 v22 = v30;
  }
  else
  {
    *a4 = 1;
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 40);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v34 = v26;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to find matter adapter for command: %@", buf, 0x16u);
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    __int16 v22 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v28;
  }
}

void __73__HMDMatterCommandAction_executeWithSource_clientName_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    **(unsigned char **)(a1 + 56) = 1;
    char v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v16 = 138543874;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Write completed with error: %@ for command: %@", (uint8_t *)&v16, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      char v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Command completed successfully", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)HMDMatterCommandAction;
  id v3 = [(HMDAction *)&v24 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  id v19 = [(HMDMatterCommandAction *)self accessory];
  id v5 = accessoryToEncodeForXPCTransportForAccessory(v19);
  id v6 = [v5 uuid];
  char v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:@"kAccessoryUUID"];

  id v8 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [(HMDMatterCommandAction *)self commands];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentationWithEncodedValues:1];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }

  char v15 = (void *)[v8 copy];
  [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x263F0C600]];

  int v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDMatterCommandAction enforceExecutionOrder](self, "enforceExecutionOrder"));
  [v4 setObject:v16 forKeyedSubscript:*MEMORY[0x263F0C708]];

  uint64_t v17 = (void *)[v4 copy];
  return v17;
}

- (id)stateDump
{
  id v3 = NSString;
  id v4 = [(HMDAction *)self uuid];
  id v5 = [(HMDMatterCommandAction *)self commands];
  id v6 = [v3 stringWithFormat:@"Action uuid: %@, commands %@", v4, v5];

  return v6;
}

- (unint64_t)type
{
  return 5;
}

- (HMDMatterCommandAction)initWithUUID:(id)a3 commands:(id)a4 enforceExecutionOrder:(BOOL)a5 actionSet:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDMatterCommandAction;
  id v13 = [(HMDAction *)&v16 initWithUUID:a3 actionSet:v12];
  if (v13)
  {
    v14 = [v12 home];
    objc_storeWeak((id *)&v13->_home, v14);

    objc_storeStrong((id *)&v13->_commands, a4);
    v13->_enforceExecutionOrder = a5;
  }

  return v13;
}

- (HMDMatterCommandAction)new
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDMatterCommandAction)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_118328 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_118328, &__block_literal_global_49_118329);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v25_118330;
  return v2;
}

void __37__HMDMatterCommandAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_118330;
  logCategory__hmf_once_v25_118330 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMDCoreData featuresDataSource];
  char v9 = [v8 isRVCEnabled];

  if (v9)
  {
    uint64_t v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
    id v11 = v10;
    if (v10)
    {
      if ([v10 unsignedIntegerValue] == 5)
      {
        v67 = v11;
        v70 = [MEMORY[0x263EFF980] array];
        id v12 = [MEMORY[0x263EFF980] array];
        v68 = v6;
        objc_msgSend(v6, "hmf_arrayForKey:", *MEMORY[0x263F0C600]);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v13 countByEnumeratingWithState:&v72 objects:v76 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v73;
          id obj = v13;
LABEL_6:
          id v17 = v7;
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v73 != v16) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(id *)(*((void *)&v72 + 1) + 8 * v18);
            objc_opt_class();
            id v20 = (objc_opt_isKindOfClass() & 1) != 0 ? v19 : 0;
            id v21 = v20;

            if (!v21) {
              break;
            }
            long long v22 = [[HMDMatterCommand alloc] initWithDictionary:v19 home:v17];
            if (![(HMDMatterCommand *)v22 isValid])
            {
              v50 = (void *)MEMORY[0x230FBD990]();
              id v51 = a1;
              v52 = HMFGetOSLogHandle();
              id v11 = v67;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                v53 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v78 = v53;
                __int16 v79 = 2112;
                id v80 = v21;
                _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize command from dictionary %@", buf, 0x16u);
              }
              id v6 = v68;
              id v7 = v17;
LABEL_40:

LABEL_41:
              id v13 = obj;

              v34 = 0;
              goto LABEL_47;
            }
            [(HMDMatterCommand *)v22 matterPath];
            v24 = long long v23 = v12;
            int v25 = [v23 containsObject:v24];

            if (v25)
            {
              v66 = v23;
              v50 = (void *)MEMORY[0x230FBD990]();
              id v54 = a1;
              v52 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v56 = v55 = v50;
                v57 = [(HMDMatterCommand *)v22 matterPath];
                *(_DWORD *)buf = 138543618;
                v78 = v56;
                __int16 v79 = 2112;
                id v80 = v57;
                _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_ERROR, "%{public}@Conflicting commands detected for matterPath %@", buf, 0x16u);

                v50 = v55;
              }
              id v11 = v67;
              id v6 = v68;
              id v7 = v17;
              id v12 = v66;
              goto LABEL_40;
            }
            [v70 addObject:v22];
            uint64_t v26 = [(HMDMatterCommand *)v22 matterPath];
            [v23 addObject:v26];

            ++v18;
            id v12 = v23;
            if (v15 == v18)
            {
              uint64_t v15 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
              id v7 = v17;
              id v13 = obj;
              if (v15) {
                goto LABEL_6;
              }
              goto LABEL_17;
            }
          }
          uint64_t v46 = (void *)MEMORY[0x230FBD990]();
          id v47 = a1;
          v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            v49 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v78 = v49;
            __int16 v79 = 2112;
            id v80 = v19;
            _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize encoded command %@", buf, 0x16u);
          }
          id v11 = v67;
          id v6 = v68;
          id v7 = v17;
          goto LABEL_41;
        }
LABEL_17:

        if ([v70 count])
        {
          uint64_t v27 = *MEMORY[0x263F0C708];
          id v71 = 0;
          id v6 = v68;
          uint64_t v28 = objc_msgSend(v68, "hmf_BOOLForKey:error:", v27, &v71);
          id v29 = v71;
          if (v29)
          {
            id v30 = (void *)MEMORY[0x230FBD990]();
            id v31 = a1;
            v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v78 = v33;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Command action dictionary must have enforce execution order key", buf, 0xCu);
            }
            v34 = 0;
            id v6 = v68;
          }
          else
          {
            id v62 = objc_alloc((Class)a1);
            [MEMORY[0x263F08C38] UUID];
            v64 = v63 = v12;
            v34 = (void *)[v62 initWithUUID:v64 commands:v70 enforceExecutionOrder:v28 actionSet:0];

            id v12 = v63;
          }
          id v11 = v67;
        }
        else
        {
          v58 = (void *)MEMORY[0x230FBD990]();
          id v59 = a1;
          v60 = HMFGetOSLogHandle();
          id v6 = v68;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v78 = v61;
            _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Command Action must have commands", buf, 0xCu);
          }
          v34 = 0;
          id v11 = v67;
        }
LABEL_47:

        goto LABEL_48;
      }
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = a1;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v78 = v42;
        __int16 v79 = 2112;
        id v80 = v11;
        v43 = "%{public}@Invalid action type: %@";
        __int16 v44 = v41;
        uint32_t v45 = 22;
        goto LABEL_29;
      }
    }
    else
    {
      v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = a1;
      id v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v78 = v42;
        v43 = "%{public}@Action type cannot be nil";
        __int16 v44 = v41;
        uint32_t v45 = 12;
LABEL_29:
        _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, v43, buf, v45);
      }
    }

    v34 = 0;
LABEL_48:

    goto LABEL_49;
  }
  __int16 v35 = (void *)MEMORY[0x230FBD990]();
  id v36 = a1;
  uint64_t v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v78 = v38;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@RVC feature is not enabled", buf, 0xCu);
  }
  v34 = 0;
LABEL_49:

  return v34;
}

@end