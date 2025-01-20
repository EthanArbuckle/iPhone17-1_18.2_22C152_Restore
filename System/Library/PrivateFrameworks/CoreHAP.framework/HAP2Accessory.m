@interface HAP2Accessory
+ (BOOL)validateAccessoryInformationService:(id)a3;
+ (BOOL)validateDiscoveredServices:(id)a3 isPrimary:(BOOL)a4;
+ (BOOL)validateProtocolInformationService:(id)a3;
+ (HAP2Accessory)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5;
- (BOOL)isPrimary;
- (BOOL)updateDiscoveredServices:(id)a3;
- (HAP2Accessory)initWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5;
- (HAP2AccessoryDelegate)delegate;
- (HAP2PairedAccessoryServerPrivate)accessoryServerPrivate;
- (HAP2PropertyLock)propertyLock;
- (NSArray)services;
- (NSNumber)internalSleepIntervalMs;
- (NSString)firmwareVersion;
- (NSString)identifier;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)productData;
- (NSString)serialNumber;
- (double)sleepInterval;
- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4;
- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4;
- (id)identifyWithCompletion:(id)a3;
- (id)internalSleepInterval;
- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5;
- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5;
- (unint64_t)category;
- (unint64_t)connectionState;
- (unint64_t)instanceID;
- (void)_handleUpdatedAccessoryInformationService:(id)a3;
- (void)_handleUpdatedAccessoryRuntimeInformationService:(id)a3;
- (void)_updateDiscoveredServices:(id)a3;
- (void)characteristicValueChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setInternalSleepInterval:(id)a3;
- (void)setInternalSleepIntervalMs:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setProductData:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setServices:(id)a3;
- (void)updateConnectionState:(unint64_t)a3;
@end

@implementation HAP2Accessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_destroyWeak((id *)&self->_accessoryServerPrivate);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_internalSleepIntervalMs, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (HAP2PairedAccessoryServerPrivate)accessoryServerPrivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryServerPrivate);

  return (HAP2PairedAccessoryServerPrivate *)WeakRetained;
}

- (void)setInternalSleepIntervalMs:(id)a3
{
}

- (NSNumber)internalSleepIntervalMs
{
  return self->_internalSleepIntervalMs;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)instanceID
{
  return self->_instanceID;
}

- (void)setDelegate:(id)a3
{
}

- (HAP2AccessoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAP2AccessoryDelegate *)WeakRetained;
}

- (void)_updateDiscoveredServices:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17089;
  v19 = __Block_byref_object_dispose__17090;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__17089;
  v13 = __Block_byref_object_dispose__17090;
  id v14 = 0;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = [(HAP2Accessory *)self services];
  +[HAPService hap2_mergeServices:v6 discoveredServices:v4 mergedServices:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HAP2Accessory__updateDiscoveredServices___block_invoke;
  v8[3] = &unk_1E69F3868;
  v8[4] = &v15;
  v8[5] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  [(HAP2Accessory *)self _handleUpdatedAccessoryInformationService:v16[5]];
  if (v10[5]) {
    -[HAP2Accessory _handleUpdatedAccessoryRuntimeInformationService:](self, "_handleUpdatedAccessoryRuntimeInformationService:");
  }
  v7 = (void *)[v5 copy];
  [(HAP2Accessory *)self setServices:v7];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
}

void __43__HAP2Accessory__updateDiscoveredServices___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v4 = [v9 type];
  int v5 = [v4 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

  if (v5)
  {
    uint64_t v6 = a1 + 32;
  }
  else
  {
    v7 = [v9 type];
    int v8 = [v7 isEqualToString:@"00000239-0000-1000-8000-0026BB765291"];

    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v6 = a1 + 40;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v6 + 8) + 40), a2);
LABEL_6:
}

- (void)_handleUpdatedAccessoryRuntimeInformationService:(id)a3
{
  id v4 = [a3 characteristics];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__HAP2Accessory__handleUpdatedAccessoryRuntimeInformationService___block_invoke;
  v5[3] = &unk_1E69F3740;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __66__HAP2Accessory__handleUpdatedAccessoryRuntimeInformationService___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = [v8 type];
  int v4 = [v3 isEqualToString:@"0000023A-0000-1000-8000-0026BB765291"];

  if (v4)
  {
    int v5 = [v8 value];

    if (v5)
    {
      uint64_t v6 = [v8 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v8 value];
      }
      else
      {
        v7 = 0;
      }

      [*(id *)(a1 + 32) setInternalSleepIntervalMs:v7];
    }
  }
}

- (void)_handleUpdatedAccessoryInformationService:(id)a3
{
  int v4 = [a3 characteristics];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__HAP2Accessory__handleUpdatedAccessoryInformationService___block_invoke;
  v8[3] = &unk_1E69F3740;
  v8[4] = self;
  [v4 enumerateObjectsUsingBlock:v8];

  if ([(HAP2Accessory *)self isPrimary])
  {
    int v5 = [(HAP2Accessory *)self name];

    if (!v5)
    {
      uint64_t v6 = [(HAP2Accessory *)self accessoryServer];
      v7 = [v6 name];
      [(HAP2Accessory *)self setName:v7];
    }
  }
}

void __59__HAP2Accessory__handleUpdatedAccessoryInformationService___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  v3 = [v28 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v5);

  v7 = [v28 type];
  int v8 = [v7 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    id v9 = [v28 value];

    if (v9) {
      [*(id *)(a1 + 32) setName:v6];
    }
  }
  else
  {
    v10 = [v28 type];
    int v11 = [v10 isEqualToString:@"00000020-0000-1000-8000-0026BB765291"];

    if (v11)
    {
      v12 = [v28 value];

      if (v12) {
        [*(id *)(a1 + 32) setManufacturer:v6];
      }
    }
    else
    {
      v13 = [v28 type];
      int v14 = [v13 isEqualToString:@"00000021-0000-1000-8000-0026BB765291"];

      if (v14)
      {
        uint64_t v15 = [v28 value];

        if (v15) {
          [*(id *)(a1 + 32) setModel:v6];
        }
      }
      else
      {
        v16 = [v28 type];
        int v17 = [v16 isEqualToString:@"00000052-0000-1000-8000-0026BB765291"];

        if (v17)
        {
          v18 = [v28 value];

          if (v18) {
            [*(id *)(a1 + 32) setFirmwareVersion:v6];
          }
        }
        else
        {
          v19 = [v28 type];
          int v20 = [v19 isEqualToString:@"00000030-0000-1000-8000-0026BB765291"];

          if (v20)
          {
            v21 = [v28 value];

            if (v21) {
              [*(id *)(a1 + 32) setSerialNumber:v6];
            }
          }
          else
          {
            v22 = [v28 type];
            int v23 = [v22 isEqualToString:@"00000220-0000-1000-8000-0026BB765291"];

            if (v23)
            {
              v24 = [v28 value];

              if (v24)
              {
                v25 = [v28 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v26 = [v28 value];
                }
                else
                {
                  v26 = 0;
                }

                v27 = +[HAPAccessory productDataStringFromData:v26];
                [*(id *)(a1 + 32) setProductData:v27];
              }
            }
          }
        }
      }
    }
  }
}

- (void)characteristicValueChanged:(id)a3
{
  id v5 = a3;
  int v4 = [(HAP2Accessory *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 accessory:self didNotifyForUpdatedValuesOnCharacteristic:v5];
  }
}

- (BOOL)updateDiscoveredServices:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend((id)objc_opt_class(), "validateDiscoveredServices:isPrimary:", v4, -[HAP2Accessory isPrimary](self, "isPrimary"));
  if (v5)
  {
    [(HAP2Accessory *)self _updateDiscoveredServices:v4];
    uint64_t v6 = [(HAP2Accessory *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v6 accessoryDidUpdateServices:self];
    }
  }
  return v5;
}

- (void)updateConnectionState:(unint64_t)a3
{
  id v4 = [(HAP2Accessory *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 accessoryDidUpdateConnectionState:self];
  }
}

- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAP2Accessory *)self accessoryServerPrivate];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 disableNotificationsForCharacteristics:v6 completion:v7];
  }
  else
  {
    int v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HAP2Accessory_disableNotificationsForCharacteristics_completion___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v14 = v7;
    dispatch_async(v11, block);

    v10 = +[HAP2Cancelable ignore];
  }

  return v10;
}

void __67__HAP2Accessory_disableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HAP2Accessory *)self accessoryServerPrivate];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 enableNotificationsForCharacteristics:v6 completion:v7];
  }
  else
  {
    int v11 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HAP2Accessory_enableNotificationsForCharacteristics_completion___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v14 = v7;
    dispatch_async(v11, block);

    v10 = +[HAP2Cancelable ignore];
  }

  return v10;
}

void __66__HAP2Accessory_enableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HAP2Accessory *)self accessoryServerPrivate];
  int v11 = v10;
  if (v10)
  {
    v12 = [v10 writeValuesForCharacteristics:v8 timeout:v9 completion:a4];
  }
  else
  {
    v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HAP2Accessory_writeValuesForCharacteristics_timeout_completion___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v16 = v9;
    dispatch_async(v13, block);

    v12 = +[HAP2Cancelable ignore];
  }

  return v12;
}

void __66__HAP2Accessory_writeValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HAP2Accessory *)self accessoryServerPrivate];
  int v11 = v10;
  if (v10)
  {
    v12 = [v10 readValuesForCharacteristics:v8 timeout:v9 completion:a4];
  }
  else
  {
    v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HAP2Accessory_readValuesForCharacteristics_timeout_completion___block_invoke;
    block[3] = &unk_1E69F3B20;
    id v16 = v9;
    dispatch_async(v13, block);

    v12 = +[HAP2Cancelable ignore];
  }

  return v12;
}

void __65__HAP2Accessory_readValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (id)identifyWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)setServices:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__HAP2Accessory_setServices___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __29__HAP2Accessory_setServices___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSArray)services
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__HAP2Accessory_services__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __25__HAP2Accessory_services__block_invoke(uint64_t a1)
{
}

- (void)setProductData:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__HAP2Accessory_setProductData___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __32__HAP2Accessory_setProductData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)productData
{
  if ([(HAP2Accessory *)self isPrimary])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy__17089;
    int v11 = __Block_byref_object_dispose__17090;
    id v12 = 0;
    uint64_t v3 = [(HAP2Accessory *)self propertyLock];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__HAP2Accessory_productData__block_invoke;
    v6[3] = &unk_1E69F44F0;
    v6[4] = self;
    v6[5] = &v7;
    [v3 performReadingBlock:v6];

    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

uint64_t __28__HAP2Accessory_productData__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setInternalSleepInterval:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__HAP2Accessory_setInternalSleepInterval___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __42__HAP2Accessory_setInternalSleepInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 80);
  *(void *)(v3 + 80) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)internalSleepInterval
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__HAP2Accessory_internalSleepInterval__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__HAP2Accessory_internalSleepInterval__block_invoke(uint64_t a1)
{
}

- (double)sleepInterval
{
  uint64_t v2 = [(HAP2Accessory *)self internalSleepIntervalMs];
  +[HAPAccessoryReachabilityProfile timeIntervalFromMillisecondNumberValue:v2];
  double v4 = v3;

  return v4;
}

- (void)setFirmwareVersion:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__HAP2Accessory_setFirmwareVersion___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __36__HAP2Accessory_setFirmwareVersion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)firmwareVersion
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__HAP2Accessory_firmwareVersion__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __32__HAP2Accessory_firmwareVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setSerialNumber:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2Accessory_setSerialNumber___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __33__HAP2Accessory_setSerialNumber___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)serialNumber
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HAP2Accessory_serialNumber__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __29__HAP2Accessory_serialNumber__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setManufacturer:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2Accessory_setManufacturer___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __33__HAP2Accessory_setManufacturer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)manufacturer
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__HAP2Accessory_manufacturer__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __29__HAP2Accessory_manufacturer__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setModel:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__HAP2Accessory_setModel___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __26__HAP2Accessory_setModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)model
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__HAP2Accessory_model__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __22__HAP2Accessory_model__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setName:(id)a3
{
  id v4 = a3;
  int v5 = [(HAP2Accessory *)self propertyLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__HAP2Accessory_setName___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWritingBlock:v7];
}

uint64_t __25__HAP2Accessory_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSString)name
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__17089;
  int v11 = __Block_byref_object_dispose__17090;
  id v12 = 0;
  uint64_t v3 = [(HAP2Accessory *)self propertyLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21__HAP2Accessory_name__block_invoke;
  v6[3] = &unk_1E69F44F0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performReadingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __21__HAP2Accessory_name__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (unint64_t)category
{
  uint64_t v2 = [(HAP2Accessory *)self accessoryServer];
  unint64_t v3 = [v2 category];

  return v3;
}

- (unint64_t)connectionState
{
  uint64_t v2 = [(HAP2Accessory *)self accessoryServer];
  unint64_t v3 = [v2 connectionState];

  return v3;
}

- (BOOL)isPrimary
{
  return [(HAP2Accessory *)self instanceID] == 1;
}

- (HAP2Accessory)initWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HAP2Accessory;
  id v10 = [(HAP2Accessory *)&v21 init];
  if (v10)
  {
    uint64_t v11 = +[HAP2PropertyLock lockWithName:@"HAP2Accessory.propertyLock"];
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v11;

    objc_storeWeak((id *)&v10->_accessoryServerPrivate, v8);
    v10->_instanceID = a4;
    v13 = NSString;
    id v14 = [v8 deviceID];
    uint64_t v15 = [v14 deviceIDString];
    uint64_t v16 = [v13 stringWithFormat:@"%@+%lu", v15, a4];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v16;

    if ([v9 count])
    {
      [(HAP2Accessory *)v10 _updateDiscoveredServices:v9];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1C978] array];
      services = v10->_services;
      v10->_services = (NSArray *)v18;
    }
  }

  return v10;
}

+ (HAP2Accessory)accessoryWithAccessoryServer:(id)a3 instanceID:(unint64_t)a4 discoveredServices:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 conformsToProtocol:&unk_1F2C8CD98]) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  if (v11 && [a1 validateDiscoveredServices:v9 isPrimary:a4 == 1]) {
    id v12 = [[HAP2Accessory alloc] initWithAccessoryServer:v11 instanceID:a4 discoveredServices:v9];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)validateProtocolInformationService:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v4 = [v3 characteristics];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__HAP2Accessory_validateProtocolInformationService___block_invoke;
  v9[3] = &unk_1E69F2E78;
  v9[4] = &v14;
  v9[5] = &v10;
  [v4 enumerateObjectsUsingBlock:v9];

  if (!*((unsigned char *)v11 + 24))
  {
    if (*((unsigned char *)v15 + 24))
    {
      BOOL v5 = 1;
      goto LABEL_5;
    }
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, "Protocol Information service does not contain a Version characteristic", v8, 2u);
    }
  }
  BOOL v5 = 0;
LABEL_5:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __52__HAP2Accessory_validateProtocolInformationService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  int v5 = [v4 isEqualToString:@"00000037-0000-1000-8000-0026BB765291"];

  if (v5)
  {
    uint64_t v6 = a1 + 32;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v7 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      __int16 v14 = 0;
      id v8 = "Protocol Information service contains more than one Version characteristic";
      id v9 = (uint8_t *)&v14;
    }
    else
    {
      uint64_t v10 = [v3 metadata];
      id v11 = [v10 format];
      uint64_t v12 = HAPCharacteristicFormatFromString(v11);

      if (v12 == 11)
      {
LABEL_14:
        *(unsigned char *)(*(void *)(*(void *)v6 + 8) + 24) = 1;
        goto LABEL_15;
      }
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v7 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        uint64_t v6 = a1 + 40;
        goto LABEL_14;
      }
      __int16 v13 = 0;
      id v8 = "Protocol Information service contains an invalid Version characteristic";
      id v9 = (uint8_t *)&v13;
    }
    _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    goto LABEL_13;
  }
LABEL_15:
}

+ (BOOL)validateAccessoryInformationService:(id)a3
{
  id v3 = a3;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v4 = [v3 characteristics];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__HAP2Accessory_validateAccessoryInformationService___block_invoke;
  v10[3] = &unk_1E69F2E50;
  v10[4] = &v37;
  v10[5] = &v11;
  v10[6] = &v33;
  v10[7] = &v29;
  v10[8] = &v25;
  v10[9] = &v21;
  v10[10] = &v17;
  v10[11] = v15;
  [v4 enumerateObjectsUsingBlock:v10];

  if (*((unsigned char *)v12 + 24)) {
    goto LABEL_2;
  }
  if (!*((unsigned char *)v38 + 24))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain an Identify characteristic";
    goto LABEL_35;
  }
  if (!*((unsigned char *)v34 + 24))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain a Name characteristic";
    goto LABEL_35;
  }
  if (!*((unsigned char *)v30 + 24))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain a Manufacturer characteristic";
    goto LABEL_35;
  }
  if (!*((unsigned char *)v26 + 24))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain a Model characteristic";
    goto LABEL_35;
  }
  if (!*((unsigned char *)v22 + 24))
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v7 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain a Firmware Revision characteristic";
    goto LABEL_35;
  }
  if (*((unsigned char *)v18 + 24))
  {
    BOOL v5 = 1;
    goto LABEL_3;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  uint64_t v7 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    id v8 = "Accessory Information service does not contain a Serial Number characteristic";
LABEL_35:
    _os_log_error_impl(&dword_1D4758000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
  }
LABEL_2:
  BOOL v5 = 0;
LABEL_3:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v5;
}

void __53__HAP2Accessory_validateAccessoryInformationService___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 type];
  int v8 = [v7 isEqualToString:@"00000014-0000-1000-8000-0026BB765291"];

  if (v8)
  {
    if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains more than one Identify characteristic";
LABEL_78:
      _os_log_error_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, v10, v47, 2u);
LABEL_79:
      uint64_t v18 = a1[5];
      goto LABEL_80;
    }
    uint64_t v15 = [v6 metadata];
    char v16 = [v15 format];
    uint64_t v17 = HAPCharacteristicFormatFromString(v16);

    if (v17 != 9)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Identify characteristic";
      goto LABEL_78;
    }
    uint64_t v18 = a1[4];
LABEL_80:
    *(unsigned char *)(*(void *)(v18 + 8) + 24) = 1;
    goto LABEL_81;
  }
  uint64_t v11 = [v6 type];
  int v12 = [v11 isEqualToString:@"00000023-0000-1000-8000-0026BB765291"];

  if (v12)
  {
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains more than one Name characteristic";
      goto LABEL_78;
    }
    uint64_t v21 = [v6 metadata];
    v22 = [v21 format];
    uint64_t v23 = HAPCharacteristicFormatFromString(v22);

    if (v23 != 11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Name characteristic";
      goto LABEL_78;
    }
    uint64_t v18 = a1[6];
    goto LABEL_80;
  }
  uint64_t v13 = [v6 type];
  int v14 = [v13 isEqualToString:@"00000020-0000-1000-8000-0026BB765291"];

  if (v14)
  {
    if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains more than one Manufacturer characteristic";
      goto LABEL_78;
    }
    v26 = [v6 metadata];
    uint64_t v27 = [v26 format];
    uint64_t v28 = HAPCharacteristicFormatFromString(v27);

    if (v28 != 11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Manufacturer characteristic";
      goto LABEL_78;
    }
    uint64_t v18 = a1[7];
    goto LABEL_80;
  }
  uint64_t v19 = [v6 type];
  int v20 = [v19 isEqualToString:@"00000021-0000-1000-8000-0026BB765291"];

  if (v20)
  {
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains more than one Model characteristic";
      goto LABEL_78;
    }
    uint64_t v33 = [v6 metadata];
    v34 = [v33 format];
    uint64_t v35 = HAPCharacteristicFormatFromString(v34);

    if (v35 != 11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Model characteristic";
      goto LABEL_78;
    }
    uint64_t v18 = a1[8];
    goto LABEL_80;
  }
  char v24 = [v6 type];
  int v25 = [v24 isEqualToString:@"00000052-0000-1000-8000-0026BB765291"];

  if (v25)
  {
    if (*(unsigned char *)(*(void *)(a1[9] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains more than one Firmware Revision characteristic";
      goto LABEL_78;
    }
    v38 = [v6 metadata];
    uint64_t v39 = [v38 format];
    uint64_t v40 = HAPCharacteristicFormatFromString(v39);

    if (v40 != 11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Firmware Revision characteristic";
      goto LABEL_78;
    }
    uint64_t v18 = a1[9];
    goto LABEL_80;
  }
  uint64_t v29 = [v6 type];
  int v30 = [v29 isEqualToString:@"00000030-0000-1000-8000-0026BB765291"];

  if (v30)
  {
    if (*(unsigned char *)(*(void *)(a1[10] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v31 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_WORD *)v47 = 0;
      char v32 = "Accessory Information service contains more than one Serial Number characteristic";
LABEL_89:
      _os_log_error_impl(&dword_1D4758000, v31, OS_LOG_TYPE_ERROR, v32, v47, 2u);
LABEL_62:
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_81;
    }
    v41 = [v6 metadata];
    v42 = [v41 format];
    uint64_t v43 = HAPCharacteristicFormatFromString(v42);

    if (v43 != 11)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Serial Number characteristic";
      goto LABEL_78;
    }
    goto LABEL_83;
  }
  char v36 = [v6 type];
  int v37 = [v36 isEqualToString:@"00000220-0000-1000-8000-0026BB765291"];

  if (v37)
  {
    if (*(unsigned char *)(*(void *)(a1[11] + 8) + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v31 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_WORD *)v47 = 0;
      char v32 = "Accessory Information service contains more than one Product Data characteristic";
      goto LABEL_89;
    }
    v44 = [v6 metadata];
    v45 = [v44 format];
    uint64_t v46 = HAPCharacteristicFormatFromString(v45);

    if (v46 != 12)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      id v9 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_79;
      }
      *(_WORD *)v47 = 0;
      uint64_t v10 = "Accessory Information service contains an invalid Product Data characteristic";
      goto LABEL_78;
    }
LABEL_83:
    uint64_t v18 = a1[10];
    goto LABEL_80;
  }
LABEL_81:
}

+ (BOOL)validateDiscoveredServices:(id)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v35 = 0;
  char v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__17089;
  uint64_t v39 = __Block_byref_object_dispose__17090;
  id v40 = 0;
  uint64_t v29 = 0;
  int v30 = &v29;
  uint64_t v31 = 0x3032000000;
  char v32 = __Block_byref_object_copy__17089;
  uint64_t v33 = __Block_byref_object_dispose__17090;
  id v34 = 0;
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__17089;
  uint64_t v27 = __Block_byref_object_dispose__17090;
  id v28 = 0;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__HAP2Accessory_validateDiscoveredServices_isPrimary___block_invoke;
  v18[3] = &unk_1E69F2E28;
  v18[4] = &v35;
  v18[5] = &v19;
  v18[6] = &v29;
  v18[7] = &v23;
  [v6 enumerateObjectsUsingBlock:v18];
  if (*((unsigned char *)v20 + 24)) {
    goto LABEL_2;
  }
  uint64_t v9 = v36[5];
  if (!v9)
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v15 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)buf = 0;
    char v16 = "Service list contains no Accessory Information service";
LABEL_30:
    _os_log_error_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_2;
  }
  if (!v4) {
    goto LABEL_13;
  }
  if (!v30[5])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v15 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
      goto LABEL_2;
    }
    *(_WORD *)buf = 0;
    char v16 = "Service list contains no Protocol Information service";
    goto LABEL_30;
  }
  if (!v24[5])
  {
    if (hap2LogInitialize_onceToken != -1) {
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
    }
    uint64_t v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_DEFAULT, "Service list contains no Accessory Runtime Information service", buf, 2u);
    }
    uint64_t v9 = v36[5];
  }
LABEL_13:
  if (![a1 validateAccessoryInformationService:v9]
    || v30[5] && !objc_msgSend(a1, "validateProtocolInformationService:"))
  {
    goto LABEL_2;
  }
  uint64_t v11 = (void *)v24[5];
  if (!v11) {
    goto LABEL_33;
  }
  id v12 = v11;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  char v55 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v13 = [v12 characteristics];
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  v44 = __validateAccessoryRuntimeInformationService_block_invoke;
  v45 = &unk_1E69F2E78;
  uint64_t v46 = &v52;
  v47 = &v48;
  [v13 enumerateObjectsUsingBlock:buf];

  if (!*((unsigned char *)v49 + 24))
  {
    if (!*((unsigned char *)v53 + 24))
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      int v14 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_WORD *)v41 = 0;
      uint64_t v17 = "Accessory Runtime Information service does not contain required characteristics";
      goto LABEL_39;
    }
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);

LABEL_33:
    BOOL v7 = 1;
    goto LABEL_3;
  }
  if (hap2LogInitialize_onceToken != -1) {
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
  }
  int v14 = hap2Log_accessory;
  if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
    goto LABEL_21;
  }
  *(_WORD *)v41 = 0;
  uint64_t v17 = "Accessory Runtime Information service is invalid";
LABEL_39:
  _os_log_error_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, v17, v41, 2u);
LABEL_21:
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

LABEL_2:
  BOOL v7 = 0;
LABEL_3:
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v7;
}

void __54__HAP2Accessory_validateDiscoveredServices_isPrimary___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  BOOL v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"0000003E-0000-1000-8000-0026BB765291"];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1[4] + 8);
    uint64_t v9 = *(void *)(v7 + 40);
    int v8 = (id *)(v7 + 40);
    if (v9)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v23 = 0;
      uint64_t v11 = "Service list contains more than one Accessory Information service";
      id v12 = (uint8_t *)&v23;
LABEL_19:
      _os_log_error_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
LABEL_20:
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v13 = [v4 type];
  int v14 = [v13 isEqualToString:@"000000A2-0000-1000-8000-0026BB765291"];

  if (v14)
  {
    uint64_t v15 = *(void *)(a1[6] + 8);
    uint64_t v16 = *(void *)(v15 + 40);
    int v8 = (id *)(v15 + 40);
    if (v16)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v22 = 0;
      uint64_t v11 = "Service list contains more than one Protocol Information service";
      id v12 = (uint8_t *)&v22;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  uint64_t v17 = [v4 type];
  int v18 = [v17 isEqualToString:@"00000239-0000-1000-8000-0026BB765291"];

  if (v18)
  {
    uint64_t v19 = *(void *)(a1[7] + 8);
    uint64_t v20 = *(void *)(v19 + 40);
    int v8 = (id *)(v19 + 40);
    if (v20)
    {
      if (hap2LogInitialize_onceToken != -1) {
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1907);
      }
      uint64_t v10 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v21 = 0;
      uint64_t v11 = "Service list contains more than one Accessory Runtime Information service";
      id v12 = (uint8_t *)&v21;
      goto LABEL_19;
    }
LABEL_21:
    objc_storeStrong(v8, a2);
  }
LABEL_22:
}

@end