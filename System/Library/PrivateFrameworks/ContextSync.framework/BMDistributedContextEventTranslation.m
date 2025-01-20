@interface BMDistributedContextEventTranslation
- (BMDistributedContextEventTranslation)initWithLocalDeviceIdentifier:(id)a3;
- (id)contextSyncActivityLevelEventFromEvent:(id)a3;
- (id)contextSyncAppInFocusFromEvent:(id)a3;
- (id)contextSyncCellularStatusFromEvent:(id)a3;
- (id)contextSyncLOIFromSemanticLocationEvent:(id)a3;
- (id)contextSyncWalletTransactionFromEvent:(id)a3;
- (id)translateEvent:(id)a3;
@end

@implementation BMDistributedContextEventTranslation

- (BMDistributedContextEventTranslation)initWithLocalDeviceIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDistributedContextEventTranslation;
  v6 = [(BMDistributedContextEventTranslation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localDeviceIdentifier, a3);
  }

  return v7;
}

- (id)translateEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 eventBody];
  if (isKindOfClass)
  {
    v8 = [(BMDistributedContextEventTranslation *)self contextSyncLOIFromSemanticLocationEvent:v7];

    objc_super v9 = [v8 serialize];
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    uint64_t v11 = getBMContextSyncLOIIdentifier();
LABEL_17:
    v26 = (void *)v11;

    goto LABEL_18;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v12 = (void *)getBMActivityLevelClass_softClass;
  uint64_t v37 = getBMActivityLevelClass_softClass;
  if (!getBMActivityLevelClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getBMActivityLevelClass_block_invoke;
    v32 = &unk_26455C250;
    v33 = &v34;
    __getBMActivityLevelClass_block_invoke((uint64_t)&v29);
    v12 = (void *)v35[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v34, 8);
  char v14 = objc_opt_isKindOfClass();

  v15 = [v4 eventBody];
  if (v14)
  {
    v8 = [(BMDistributedContextEventTranslation *)self contextSyncActivityLevelEventFromEvent:v15];

    objc_super v9 = [v8 serialize];
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    uint64_t v11 = getBMContextSyncDeviceActivityLevelIdentifier();
    goto LABEL_17;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v16 = (void *)getBMDeviceCellularAvailabilityStatusClass_softClass;
  uint64_t v37 = getBMDeviceCellularAvailabilityStatusClass_softClass;
  if (!getBMDeviceCellularAvailabilityStatusClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getBMDeviceCellularAvailabilityStatusClass_block_invoke;
    v32 = &unk_26455C250;
    v33 = &v34;
    __getBMDeviceCellularAvailabilityStatusClass_block_invoke((uint64_t)&v29);
    v16 = (void *)v35[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v34, 8);
  char v18 = objc_opt_isKindOfClass();

  v19 = [v4 eventBody];
  if (v18)
  {
    v8 = [(BMDistributedContextEventTranslation *)self contextSyncCellularStatusFromEvent:v19];

    objc_super v9 = [v8 serialize];
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    uint64_t v11 = getBMContextSyncCellularAvailabilityStatusIdentifier();
    goto LABEL_17;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v20 = (void *)getBMWalletTransactionClass_softClass;
  uint64_t v37 = getBMWalletTransactionClass_softClass;
  if (!getBMWalletTransactionClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getBMWalletTransactionClass_block_invoke;
    v32 = &unk_26455C250;
    v33 = &v34;
    __getBMWalletTransactionClass_block_invoke((uint64_t)&v29);
    v20 = (void *)v35[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v34, 8);
  char v22 = objc_opt_isKindOfClass();

  v23 = [v4 eventBody];
  if (v22)
  {
    v8 = [(BMDistributedContextEventTranslation *)self contextSyncWalletTransactionFromEvent:v23];

    objc_super v9 = [v8 serialize];
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    uint64_t v11 = getBMContextSyncWalletTransactionIdentifier();
    goto LABEL_17;
  }
  getBMAppInFocusClass();
  char v24 = objc_opt_isKindOfClass();

  if (v24)
  {
    v25 = [v4 eventBody];
    v8 = [(BMDistributedContextEventTranslation *)self contextSyncAppInFocusFromEvent:v25];

    objc_super v9 = [v8 serialize];
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v8, "dataVersion"));
    uint64_t v11 = getBMContextSyncAppInFocusIdentifier();
    goto LABEL_17;
  }
  v10 = 0;
  objc_super v9 = 0;
  v26 = 0;
LABEL_18:
  v27 = [[BMDistributedContextTranslatedEventMessage alloc] initWithStreamIdentifier:v26 eventData:v9 eventDataVersion:v10];

  return v27;
}

- (id)contextSyncLOIFromSemanticLocationEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isStarting];
  uint64_t v6 = [v4 userSpecificPlaceType];
  uint64_t v7 = [v4 placeType];

  id v8 = objc_alloc((Class)getBMContextSyncLOIClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  v10 = [NSNumber numberWithBool:v5];
  uint64_t v11 = (void *)[v8 initWithID:@"com.apple.biome.ContextSync" deviceUUID:localDeviceIdentifier starting:v10 userSpecificPlaceType:v6 placeType:v7];

  return v11;
}

- (id)contextSyncActivityLevelEventFromEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if ([v4 inUseStatus])
  {
    uint64_t v6 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:1];
    [v5 addObject:v6];
  }
  if (([v4 inUseStatus] & 2) != 0)
  {
    uint64_t v7 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:2];
    [v5 addObject:v7];
  }
  if (([v4 inUseStatus] & 4) != 0)
  {
    id v8 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:3];
    [v5 addObject:v8];
  }
  if (([v4 inUseStatus] & 8) != 0)
  {
    objc_super v9 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:4];
    [v5 addObject:v9];
  }
  if (([v4 inUseStatus] & 0x10) != 0)
  {
    v10 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:5];
    [v5 addObject:v10];
  }
  if (([v4 inUseStatus] & 0x20) != 0)
  {
    uint64_t v11 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelDeviceActivityStateClass()) initWithState:6];
    [v5 addObject:v11];
  }
  v12 = (void *)[objc_alloc((Class)getBMContextSyncDeviceActivityLevelClass()) initWithID:@"com.apple.biome.ContextSync" deviceUUID:self->_localDeviceIdentifier deviceActivityState:v5];

  return v12;
}

- (id)contextSyncCellularStatusFromEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 deviceType];
  LODWORD(v6) = [v4 deviceRegistrationStatus];
  LODWORD(v7) = [v4 previousDeviceRegistrationStatus];
  if ([v4 hasAboveThreshold])
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "aboveThreshold"));
  }
  else
  {
    id v8 = 0;
  }
  if ((v7 - 1) >= 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v7;
  }
  if ((v6 - 1) >= 4) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v6;
  }
  if (v5 == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v5 == 1;
  }
  id v10 = objc_alloc((Class)getBMContextSyncCellularAvailabilityStatusClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  v12 = [v4 timeStamp];
  id v13 = [v4 latestStrongTimeStamp];
  char v14 = (void *)[v10 initWithID:@"com.apple.biome.ContextSync" deviceUUID:localDeviceIdentifier timeStamp:v12 deviceType:v9 deviceRegistrationStatus:v6 previousDeviceRegistrationStatus:v7 aboveThreshold:v8 latestStrongTimeStamp:v13];

  return v14;
}

- (id)contextSyncWalletTransactionFromEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 transactionType];
  if (v5 - 1 >= 6) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  int v7 = [v4 merchantType];
  if ((v7 - 1) >= 7) {
    int v8 = 0;
  }
  else {
    int v8 = v7;
  }
  id v9 = objc_alloc((Class)getBMContextSyncWalletTransactionClass());
  localDeviceIdentifier = self->_localDeviceIdentifier;
  uint64_t v11 = [v4 passUniqueID];
  v12 = [v4 passLocalizedDescription];
  id v13 = [v4 transactionID];
  char v14 = [v4 poiCategory];
  LODWORD(v17) = v8;
  v15 = (void *)[v9 initWithID:@"com.apple.biome.ContextSync" deviceUUID:localDeviceIdentifier passUniqueID:v11 passLocalizedDescription:v12 transactionType:v6 transactionID:v13 merchantType:v17 poiCategory:v14];

  return v15;
}

- (id)contextSyncAppInFocusFromEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)getBMAppInFocusClass());
  unsigned int v5 = [v3 launchReason];
  uint64_t v6 = [v3 type];
  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "starting"));
  v19 = [v3 absoluteTimestamp];
  char v18 = [v3 bundleID];
  uint64_t v17 = [v3 parentBundleID];
  int v7 = [v3 extensionHostID];
  int v8 = [v3 shortVersionString];
  id v9 = [v3 exactVersionString];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "dyldPlatform"));
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v3 isNativeArchitecture];

  id v13 = [v11 numberWithBool:v12];
  v16 = (void *)[v4 initWithLaunchReason:v5 type:v6 starting:v20 absoluteTimestamp:v19 bundleID:v18 parentBundleID:v17 extensionHostID:v7 shortVersionString:v8 exactVersionString:v9 dyldPlatform:v10 isNativeArchitecture:v13];

  char v14 = (void *)[objc_alloc((Class)getBMContextSyncAppInFocusClass()) initWithID:@"com.apple.biome.ContextSync" deviceUUID:self->_localDeviceIdentifier AppInFocus:v16];
  return v14;
}

- (void).cxx_destruct
{
}

@end