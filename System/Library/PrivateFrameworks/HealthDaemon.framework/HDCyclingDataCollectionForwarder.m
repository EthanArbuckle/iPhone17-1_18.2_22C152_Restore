@interface HDCyclingDataCollectionForwarder
- (HDCyclingDataCollectionForwarder)init;
- (id)_newBikeSensor;
- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5;
@end

@implementation HDCyclingDataCollectionForwarder

- (HDCyclingDataCollectionForwarder)init
{
  v7.receiver = self;
  v7.super_class = (Class)HDCyclingDataCollectionForwarder;
  v2 = [(HDCyclingDataCollectionForwarder *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(HDCyclingDataCollectionForwarder *)v2 _newBikeSensor];
    cmBikeSensor = v3->_cmBikeSensor;
    v3->_cmBikeSensor = (CMBikeSensor *)v4;
  }
  return v3;
}

- (id)_newBikeSensor
{
  if (![MEMORY[0x1E4F221B0] isAvailable]) {
    return 0;
  }
  v2 = (objc_class *)MEMORY[0x1E4F221B0];

  return objc_alloc_init(v2);
}

- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (self->_cmBikeSensor)
  {
    v12 = [v10 bundleIdentifier];
    v13 = v12;
    if (v12 == (void *)*MEMORY[0x1E4F2BCF0])
    {
    }
    else
    {
      if (![MEMORY[0x1E4F2B860] isCollectBLETypesFromLocalSourceEnabled])
      {

        goto LABEL_9;
      }
      char v14 = [v11 _isLocalDevice];

      if ((v14 & 1) == 0) {
        goto LABEL_9;
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__HDCyclingDataCollectionForwarder_insertSamples_device_source___block_invoke;
    v15[3] = &unk_1E6307428;
    v15[4] = self;
    id v16 = v9;
    [v8 enumerateObjectsUsingBlock:v15];
  }
LABEL_9:
}

void __64__HDCyclingDataCollectionForwarder_insertSamples_device_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v5 = a2;
  v6 = v5;
  if (!v4)
  {

    goto LABEL_15;
  }
  objc_super v7 = (objc_class *)MEMORY[0x1E4F221B8];
  id v8 = v3;
  id v9 = [v7 alloc];
  id v10 = [v6 endDate];
  v11 = (void *)[v9 initWithTimestamp:v10];

  v12 = [v8 manufacturer];
  [v11 setManufacturer:v12];

  v13 = [v8 localIdentifier];
  [v11 setDeviceIdentifier:v13];

  char v14 = [v8 model];

  [v11 setModel:v14];
  v15 = [v6 quantityType];
  uint64_t v16 = [v15 code];

  switch(v16)
  {
    case 282:
      v17 = [v6 quantity];
      v18 = [MEMORY[0x1E4F2B618] unitFromString:@"count/min"];
      [v17 doubleValueForUnit:v18];
      objc_msgSend(v11, "setInstantaneousCadence:");
      goto LABEL_8;
    case 281:
      v17 = [v6 quantity];
      v18 = [MEMORY[0x1E4F2B618] unitFromString:@"m/s"];
      [v17 doubleValueForUnit:v18];
      objc_msgSend(v11, "setInstantaneousSpeed:");
      goto LABEL_8;
    case 280:
      v17 = [v6 quantity];
      v18 = [MEMORY[0x1E4F2B618] wattUnit];
      [v17 doubleValueForUnit:v18];
      objc_msgSend(v11, "setInstantaneousPower:");
LABEL_8:

      id v22 = v11;
      goto LABEL_12;
  }
  _HKInitializeLogging();
  v19 = (void *)*MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
  {
    v20 = v19;
    v21 = [v6 quantityType];
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v4;
    __int16 v25 = 2114;
    v26 = v21;
    _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Received non forwardable of %{public}@", buf, 0x16u);
  }
  id v22 = 0;
LABEL_12:

  if (v22)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "feedBikeSensorData:");
    goto LABEL_16;
  }
LABEL_15:
  id v22 = 0;
LABEL_16:
}

- (void).cxx_destruct
{
}

@end