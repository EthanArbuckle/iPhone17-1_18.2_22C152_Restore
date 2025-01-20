@interface HMDSettingsControllerDependency
- (HMDSettingTransactionReceiverProtocol)transactionReceiver;
- (HMDSettingsBackingStoreController)backingStoreController;
- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9;
- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9 keyPathsToPrune:(id)a10;
- (HMDSettingsMessageHandlerProtocol)messageHandler;
- (HMDSettingsMetadataParserProtocol)metadataParser;
- (HMDUserSettingsInitialValueProviding)migrationProvider;
- (NSArray)keyPathsToPrune;
- (NSString)codingKey;
- (NSString)logIdentifier;
- (NSUUID)parentIdentifier;
- (id)createSettingGroupModelWithName:(id)a3 parent:(id)a4;
- (id)createSettingModelWithName:(id)a3 parent:(id)a4 type:(id)a5 properties:(id)a6;
- (id)createSettingRootGroupModelWithParentModelID:(id)a3;
- (id)loadMetadata;
- (id)settingModelForUpdateWithIdentifier:(id)a3 parentIdentifier:(id)a4 value:(id)a5;
- (id)settingValueForValue:(id)a3 type:(id)a4 constraintModels:(id)a5 error:(id *)a6;
- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 backingStoreController:(id)a5;
- (void)setTransactionReceiver:(id)a3;
@end

@implementation HMDSettingsControllerDependency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalMessageHandler, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metadataFileName, 0);
  objc_storeStrong((id *)&self->_metadataParser, 0);
  objc_destroyWeak((id *)&self->_migrationProvider);
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_backingStoreController, 0);
  objc_destroyWeak((id *)&self->_transactionReceiver);
  objc_storeStrong((id *)&self->_keyPathsToPrune, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

- (HMDSettingsMetadataParserProtocol)metadataParser
{
  return (HMDSettingsMetadataParserProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (HMDUserSettingsInitialValueProviding)migrationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrationProvider);
  return (HMDUserSettingsInitialValueProviding *)WeakRetained;
}

- (NSString)codingKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDSettingsBackingStoreController)backingStoreController
{
  return (HMDSettingsBackingStoreController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransactionReceiver:(id)a3
{
}

- (HMDSettingTransactionReceiverProtocol)transactionReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transactionReceiver);
  return (HMDSettingTransactionReceiverProtocol *)WeakRetained;
}

- (NSArray)keyPathsToPrune
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)createSettingModelWithName:(id)a3 parent:(id)a4 type:(id)a5 properties:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [HMDSettingModel alloc];
  v14 = [MEMORY[0x1E4F29128] UUID];
  v15 = [(HMBModel *)v13 initWithModelID:v14 parentModelID:v11];

  [(HMDSettingModel *)v15 setName:v12];
  [(HMDSettingModel *)v15 setType:v10];

  [(HMDSettingModel *)v15 setProperties:v9];
  return v15;
}

- (id)createSettingGroupModelWithName:(id)a3 parent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [HMDSettingGroupModel alloc];
  v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [(HMBModel *)v7 initWithModelID:v8 parentModelID:v5];

  [(HMDSettingGroupModel *)v9 setName:v6];
  return v9;
}

- (id)createSettingRootGroupModelWithParentModelID:(id)a3
{
  id v3 = a3;
  v4 = [HMDSettingRootGroupModel alloc];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [(HMDSettingRootGroupModel *)v4 initWithModelID:v5 parentModelID:v3];

  return v6;
}

- (id)loadMetadata
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v3 resourceURL];
  if (self) {
    id Property = objc_getProperty(self, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  v7 = [v5 URLByAppendingPathComponent:Property];

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v7 path];
  char v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot find user settings resource at: %@", (uint8_t *)&v17, 0x16u);
    }
    id v11 = 0;
  }

  return v11;
}

- (id)settingValueForValue:(id)a3 type:(id)a4 constraintModels:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = v9;
  id v12 = v10;
  v13 = 0;
  switch([a4 integerValue])
  {
    case 1:
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2EAB8]) initDataSettingWithValue:v11];
      goto LABEL_5;
    case 2:
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2EAB8]) initNumberSettingWithValue:v11];
      goto LABEL_5;
    case 3:
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F2EAB8]) initStringSettingWithValue:v11];
LABEL_5:
      v13 = (void *)v14;
      goto LABEL_23;
    case 4:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v15 = v12;
        v13 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (!v13) {
          goto LABEL_15;
        }
        uint64_t v16 = *(void *)v26;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v15);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            __int16 v19 = objc_msgSend(v18, "stringValue", (void)v25);
            int v20 = [v19 isEqualToString:v11];

            if (v20)
            {
              id v22 = objc_alloc(MEMORY[0x1E4F2EAB8]);
              v23 = [v18 hmbModelID];
              v13 = (void *)[v22 initWithType:4 stringValue:0 numberValue:0 dataValue:0 selectionIdentifier:v23 selectionValue:v11];

              char v21 = 1;
              goto LABEL_20;
            }
          }
          v13 = (void *)[v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
LABEL_15:
        char v21 = 0;
LABEL_20:

        if (!a6) {
          goto LABEL_23;
        }
LABEL_21:
        if ((v21 & 1) == 0)
        {
          *a6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Unable to create setting value" reason:@"Could not determine type" suggestion:0];
        }
        goto LABEL_23;
      }
      v13 = 0;
LABEL_17:
      char v21 = 0;
      if (a6) {
        goto LABEL_21;
      }
LABEL_23:

      return v13;
    case 5:
      goto LABEL_23;
    default:
      goto LABEL_17;
  }
}

- (id)settingModelForUpdateWithIdentifier:(id)a3 parentIdentifier:(id)a4 value:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMBModel *)[HMDSettingModel alloc] initWithModelID:v8 parentModelID:v9];
  if ([(HMDSettingModel *)v11 setSettingValue:v10])
  {
    id v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    uint64_t v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v18 = 138543362;
      __int16 v19 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to set value on model", (uint8_t *)&v18, 0xCu);
    }
    id v12 = 0;
  }

  return v12;
}

- (HMDSettingsMessageHandlerProtocol)messageHandler
{
  if (self)
  {
    self = (HMDSettingsControllerDependency *)objc_getProperty(self, a2, 96, 1);
    uint64_t v2 = vars8;
  }
  return (HMDSettingsMessageHandlerProtocol *)self;
}

- (void)configureWithHome:(id)a3 messageDispatcher:(id)a4 backingStoreController:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  if (self)
  {
    id v9 = a5;
    objc_setProperty_atomic(self, v10, v8, 88);
    objc_setProperty_atomic(self, v11, v9, 40);

    id Property = objc_getProperty(self, v12, 96, 1);
  }
  else
  {
    id Property = 0;
  }
  [Property configureWithMessageDispatcher:v8 home:v14];
}

- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9
{
  return [(HMDSettingsControllerDependency *)self initWithParentUUID:a3 logName:a4 queue:a5 metadataFileName:a6 codingKey:a7 messageHandler:a8 migrationProvider:a9 keyPathsToPrune:MEMORY[0x1E4F1CBF0]];
}

- (HMDSettingsControllerDependency)initWithParentUUID:(id)a3 logName:(id)a4 queue:(id)a5 metadataFileName:(id)a6 codingKey:(id)a7 messageHandler:(id)a8 migrationProvider:(id)a9 keyPathsToPrune:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v19 = a9;
  id v20 = a10;
  v36.receiver = self;
  v36.super_class = (Class)HMDSettingsControllerDependency;
  char v21 = [(HMDSettingsControllerDependency *)&v36 init];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_internalMessageHandler, a8);
    messageDispatcher = v22->_messageDispatcher;
    v22->_messageDispatcher = 0;

    objc_storeStrong((id *)&v22->_parentIdentifier, a3);
    v24 = objc_msgSend(v17, "UUIDString", v32, v33, v34, v35);
    uint64_t v25 = [v18 stringByAppendingString:v24];
    logIdentifier = v22->_logIdentifier;
    v22->_logIdentifier = (NSString *)v25;

    objc_storeStrong((id *)&v22->_queue, a5);
    long long v27 = [[HMDSettingsMetadataParser alloc] initWithDependency:v22];
    metadataParser = v22->_metadataParser;
    v22->_metadataParser = (HMDSettingsMetadataParserProtocol *)v27;

    objc_storeStrong((id *)&v22->_metadataFileName, a6);
    objc_storeStrong((id *)&v22->_codingKey, a7);
    objc_storeWeak((id *)&v22->_migrationProvider, v19);
    uint64_t v29 = [v20 copy];
    keyPathsToPrune = v22->_keyPathsToPrune;
    v22->_keyPathsToPrune = (NSArray *)v29;
  }
  return v22;
}

@end