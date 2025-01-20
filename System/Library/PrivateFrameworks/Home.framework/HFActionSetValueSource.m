@interface HFActionSetValueSource
+ (NAIdentity)na_identity;
- (BOOL)_isCurrentStateCharacteristic:(id)a3;
- (BOOL)hasPendingWritesForRouteID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNaturalLightingEnabledForProfile:(id)a3;
- (BOOL)isNaturalLightingSupportedForProfile:(id)a3;
- (HFActionSetBuilderProtocol)actionSetBuilder;
- (HFActionSetValueSource)initWithActionSet:(id)a3;
- (HFActionSetValueSource)initWithActionSetBuilder:(id)a3;
- (HFActionSetValueSourceDelegate)delegate;
- (HMActionSet)actionSet;
- (id)_actionForCharacteristic:(id)a3;
- (id)_existingActionBuilderForCharacteristic:(id)a3;
- (id)_existingActionBuilderForLightProfile:(id)a3;
- (id)_existingActionBuilderForMediaProfile:(id)a3;
- (id)_targetValueForCharacteristic:(id)a3;
- (id)_valueForCurrentStateCharacteristic:(id)a3;
- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3;
- (id)mediaProfileContainerForRouteID:(id)a3;
- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4;
- (id)readValuesForCharacteristics:(id)a3;
- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4;
- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5;
- (id)writeValuesForCharacteristics:(id)a3;
- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3;
- (unint64_t)hash;
- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5;
- (void)mediaValueUpdated:(id)a3 playbackState:(int64_t)a4 playbackArchive:(id)a5;
- (void)setActionSet:(id)a3;
- (void)setActionSetBuilder:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HFActionSetValueSource

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0x39uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HFActionSetValueSource *)self actionSet];
    v7 = [v6 name];
    int v11 = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Checking if natural light is supported for action set: '%@'  profile:%@", (uint8_t *)&v11, 0x16u);
  }
  v8 = [v4 settings];
  char v9 = [v8 supportedFeatures];

  return v9 & 1;
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFActionSetValueSource *)self _existingActionBuilderForLightProfile:v4];
  v6 = HFLogForCategory(0x39uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(HFActionSetValueSource *)self actionSet];
    v8 = [v7 name];
    int v11 = 138412802;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 1024;
    int v16 = [v5 naturalLightEnabled];
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Checking if natural light is enabled for action set: '%@'  profile:%@ actionBuilder: %{BOOL}d", (uint8_t *)&v11, 0x1Cu);
  }
  char v9 = [v5 naturalLightEnabled];

  return v9;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F58190];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke;
  v11[3] = &unk_26408E9C0;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a3;
  id v8 = v6;
  char v9 = [v7 futureWithBlock:v11];

  return v9;
}

void __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 _existingActionBuilderForLightProfile:v4];
  v7 = v6;
  if (v6)
  {
    [(HFNaturalLightingActionBuilder *)v6 setNaturalLightEnabled:*(unsigned __int8 *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 32) actionSetBuilder];
    [v8 updateAction:v7];
    char v9 = v7;
  }
  else
  {
    v10 = [HFNaturalLightingActionBuilder alloc];
    int v11 = [*(id *)(a1 + 32) actionSetBuilder];
    id v12 = [v11 home];
    char v9 = [(HFItemBuilder *)v10 initWithHome:v12];

    [(HFNaturalLightingActionBuilder *)v9 setLightProfile:*(void *)(a1 + 40)];
    [(HFNaturalLightingActionBuilder *)v9 setNaturalLightEnabled:*(unsigned __int8 *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 32) actionSetBuilder];
    [v8 addAction:v9];
  }

  BOOL v13 = HFLogForCategory(0x39uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = v7 == 0;
    __int16 v15 = [*(id *)(a1 + 32) actionSet];
    int v16 = [v15 name];
    int v17 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    v23 = v16;
    __int16 v24 = 1024;
    int v25 = v17;
    __int16 v26 = 2112;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v14;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Updating natural light state for action set '%@' to %{BOOL}d for profile: %@ actionBuilder: %@ newAction: %{BOOL}d", buf, 0x2Cu);
  }
  v19 = +[HFHomeKitDispatcher sharedDispatcher];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_76;
  v20[3] = &unk_26408EA60;
  id v21 = *(id *)(a1 + 40);
  [v19 dispatchLightObserverMessage:v20 sender:0];

  [v5 finishWithNoResult];
}

void __94__HFActionSetValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState_forProfile___block_invoke_76(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 settings];
  [v3 lightProfile:v2 didUpdateSettings:v4];
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
}

- (id)_existingActionBuilderForLightProfile:(id)a3
{
  id v4 = a3;
  id v5 = [(HFActionSetValueSource *)self actionSetBuilder];
  id v6 = [v5 actions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__HFActionSetValueSource_HFLightProfileValueSource___existingActionBuilderForLightProfile___block_invoke;
  v10[3] = &unk_26408EA88;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __91__HFActionSetValueSource_HFLightProfileValueSource___existingActionBuilderForLightProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 lightProfile];
    uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (HFActionSetValueSource)initWithActionSetBuilder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFActionSetValueSource;
  uint64_t v5 = [(HFActionSetValueSource *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HFActionSetValueSource *)v5 setActionSetBuilder:v4];
  }

  return v6;
}

- (HFActionSetValueSource)initWithActionSet:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFActionSetValueSource;
  uint64_t v5 = [(HFActionSetValueSource *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HFActionSetValueSource *)v5 setActionSet:v4];
  }

  return v6;
}

- (id)readValuesForCharacteristics:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HFActionSetValueSource_readValuesForCharacteristics___block_invoke;
  v7[3] = &unk_264097130;
  v7[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v7);
  id v4 = [[HFCharacteristicBatchReadResponse alloc] initWithReadResponses:v3 contextProvider:0];
  uint64_t v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

HFCharacteristicReadResponse *__55__HFActionSetValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _targetValueForCharacteristic:v3];
  uint64_t v5 = [HFCharacteristicReadResponse alloc];
  id v6 = [MEMORY[0x263EFFA08] set];
  id v7 = [(HFCharacteristicReadResponse *)v5 initWithCharacteristic:v3 readTraits:v6 value:v4 error:0];

  return v7;
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6 = a3;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  __int16 v15 = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  int v16 = &unk_264095448;
  id v17 = v6;
  uint64_t v18 = self;
  id v7 = v6;
  objc_super v8 = objc_msgSend(a4, "na_map:", &v13);
  char v9 = objc_msgSend(v8, "na_setByFlattening", v13, v14, v15, v16);

  v10 = [[HFCharacteristicBatchReadResponse alloc] initWithReadResponses:v9 contextProvider:0];
  id v11 = [MEMORY[0x263F58190] futureWithResult:v10];

  return v11;
}

id __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [a2 characteristics];
  uint64_t v5 = [v3 setWithArray:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v10[3] = &unk_2640903A0;
  id v11 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v5, "na_filter:", v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3;
  v9[3] = &unk_264097130;
  v9[4] = *(void *)(a1 + 40);
  id v7 = objc_msgSend(v6, "na_map:", v9);

  return v7;
}

uint64_t __70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

HFCharacteristicReadResponse *__70__HFActionSetValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 _targetValueForCharacteristic:v3];
  uint64_t v5 = [HFCharacteristicReadResponse alloc];
  id v6 = [MEMORY[0x263EFFA08] set];
  id v7 = [(HFCharacteristicReadResponse *)v5 initWithCharacteristic:v3 readTraits:v6 value:v4 error:0];

  return v7;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFActionSetValueSource *)self actionSetBuilder];

  if (!v5) {
    NSLog(&cfstr_RequestToWrite.isa);
  }
  id v6 = [(HFActionSetValueSource *)self actionSetBuilder];

  if (v6)
  {
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke;
    v68[3] = &unk_26408D8F0;
    v68[4] = self;
    id v47 = v4;
    id v8 = v4;
    id v69 = v8;
    [v7 dispatchHomeObserverMessage:v68 sender:0];

    char v9 = [MEMORY[0x263EFF9C0] set];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v53 = v8;
    v10 = [v8 allCharacteristics];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v65;
      do
      {
        uint64_t v14 = 0;
        uint64_t v51 = v12;
        do
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v64 + 1) + 8 * v14);
          int v16 = [v53 valueForCharacteristic:v15];
          if (v16)
          {
            uint64_t v17 = [(HFActionSetValueSource *)self _existingActionBuilderForCharacteristic:v15];
            if (v17)
            {
              uint64_t v18 = (HFCharacteristicWriteActionBuilder *)v17;
              v19 = [(HFActionSetValueSource *)self actionSetBuilder];
              [v19 updateAction:v18];
            }
            else
            {
              v20 = [HFCharacteristicWriteActionBuilder alloc];
              id v21 = [(HFActionSetValueSource *)self actionSetBuilder];
              [v21 home];
              uint64_t v22 = v13;
              __int16 v24 = v23 = v10;
              uint64_t v18 = [(HFItemBuilder *)v20 initWithHome:v24];

              v10 = v23;
              uint64_t v13 = v22;
              uint64_t v12 = v51;

              [(HFCharacteristicWriteActionBuilder *)v18 setCharacteristic:v15];
              v19 = [(HFActionSetValueSource *)self actionSetBuilder];
              [v19 addAction:v18];
            }

            [(HFCharacteristicWriteActionBuilder *)v18 setTargetValue:v16];
            [v9 addObject:v18];
          }
          else
          {
            objc_msgSend(v15, "hf_prettyDescription");
            uint64_t v18 = (HFCharacteristicWriteActionBuilder *)objc_claimAutoreleasedReturnValue();
            NSLog(&cfstr_NoValueSetForC.isa, v18);
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v12);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    int v25 = [v53 allCharacteristics];
    uint64_t v50 = [v25 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v50)
    {
      uint64_t v26 = *(void *)v61;
      unint64_t v27 = 0x263F0E000uLL;
      uint64_t v48 = *(void *)v61;
      v49 = v25;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          __int16 v30 = [v53 valueForCharacteristic:v29];
          BOOL v31 = objc_msgSend(*(id *)(v27 + 584), "hf_powerStateCharacteristicTypes");
          uint64_t v32 = [v29 characteristicType];
          v52 = v30;
          if ([v31 containsObject:v32])
          {
            int v33 = [v30 isEqual:MEMORY[0x263EFFA80]];

            if (!v33) {
              goto LABEL_38;
            }
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v34 = [v29 service];
            BOOL v31 = [v34 characteristics];

            uint64_t v35 = [v31 countByEnumeratingWithState:&v56 objects:v70 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v57 != v37) {
                    objc_enumerationMutation(v31);
                  }
                  if (*(void **)(*((void *)&v56 + 1) + 8 * j) != v29)
                  {
                    v39 = -[HFActionSetValueSource _existingActionBuilderForCharacteristic:](self, "_existingActionBuilderForCharacteristic:");
                    if (v39)
                    {
                      v40 = [(HFActionSetValueSource *)self actionSetBuilder];
                      [v40 removeAction:v39];

                      [v9 addObject:v39];
                    }
                  }
                }
                uint64_t v36 = [v31 countByEnumeratingWithState:&v56 objects:v70 count:16];
              }
              while (v36);
              uint64_t v26 = v48;
              int v25 = v49;
              unint64_t v27 = 0x263F0E000;
            }
          }
          else
          {
          }
LABEL_38:
        }
        uint64_t v50 = [v25 countByEnumeratingWithState:&v60 objects:v71 count:16];
      }
      while (v50);
    }

    v41 = +[HFHomeKitDispatcher sharedDispatcher];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke_2;
    v54[3] = &unk_26408D8F0;
    v54[4] = self;
    id v55 = v53;
    [v41 dispatchHomeObserverMessage:v54 sender:0];

    if ([v9 count])
    {
      v42 = [(HFActionSetValueSource *)self delegate];
      char v43 = objc_opt_respondsToSelector();

      if (v43)
      {
        v44 = [(HFActionSetValueSource *)self delegate];
        [v44 actionSetValueSource:self didUpdateValuesForActionBuilders:v9];
      }
    }
    v45 = [MEMORY[0x263F58190] futureWithNoResult];

    id v4 = v47;
  }
  else
  {
    v45 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v45;
}

void __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) actionSetBuilder];
    id v4 = [v3 home];
    uint64_t v5 = [*(id *)(a1 + 40) allCharacteristics];
    [v6 home:v4 willWriteValuesForCharacteristics:v5];
  }
}

void __56__HFActionSetValueSource_writeValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) actionSetBuilder];
    id v4 = [v3 home];
    uint64_t v5 = [*(id *)(a1 + 40) allCharacteristics];
    id v6 = [MEMORY[0x263EFFA08] set];
    [v7 home:v4 didWriteValuesForCharacteristics:v5 failedCharacteristics:v6];
  }
}

- (void)mediaValueUpdated:(id)a3 playbackState:(int64_t)a4 playbackArchive:(id)a5
{
  id v16 = a5;
  id v8 = objc_msgSend(a3, "hf_mediaRouteIdentifier");
  char v9 = [(HFActionSetValueSource *)self _existingActionBuilderForMediaProfile:v8];

  if (v9)
  {
    [v9 setTargetPlayState:a4];
    id v10 = a4 == 1 ? v16 : 0;
    [v9 setPlaybackArchive:v10];
    uint64_t v11 = [(HFActionSetValueSource *)self actionSetBuilder];
    [v11 updateAction:v9];

    uint64_t v12 = [(HFActionSetValueSource *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(HFActionSetValueSource *)self delegate];
      __int16 v15 = [MEMORY[0x263EFFA08] setWithObject:v9];
      [v14 actionSetValueSource:self didUpdateValuesForActionBuilders:v15];
    }
  }
}

- (id)cachedPlaybackStateWriteErrorForRouteID:(id)a3
{
  return 0;
}

- (BOOL)hasPendingWritesForRouteID:(id)a3
{
  return 0;
}

- (int64_t)lastPlaybackStateForProfileForRouteID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[HFActionSetValueSource _existingActionBuilderForMediaProfile:](self, "_existingActionBuilderForMediaProfile:");
  int64_t v4 = [v3 targetPlayState];

  return v4;
}

- (id)mediaProfileContainerForRouteID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(HFActionSetValueSource *)self _existingActionBuilderForMediaProfile:v4];
    id v6 = [v5 mediaProfiles];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__HFActionSetValueSource_mediaProfileContainerForRouteID___block_invoke;
    v9[3] = &unk_264090270;
    id v10 = v4;
    id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v9);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __58__HFActionSetValueSource_mediaProfileContainerForRouteID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_mediaRouteIdentifier");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)writePlaybackState:(int64_t)a3 playbackArchive:(id)a4 forRouteID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    id v10 = (void *)MEMORY[0x263F58190];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke;
    v13[3] = &unk_264096DF0;
    objc_copyWeak(v16, &location);
    id v14 = v9;
    v16[1] = (id)a3;
    id v15 = v8;
    uint64_t v11 = [v10 futureWithBlock:v13];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v11;
}

void __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _existingActionBuilderForMediaProfile:*(void *)(a1 + 32)];

  id v7 = [v6 mediaProfiles];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke_2;
  v10[3] = &unk_264090270;
  id v11 = *(id *)(a1 + 32);
  id v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v10);

  id v9 = objc_loadWeakRetained(v3);
  [v9 mediaValueUpdated:v8 playbackState:*(void *)(a1 + 56) playbackArchive:*(void *)(a1 + 40)];

  [v4 finishWithNoResult];
}

uint64_t __72__HFActionSetValueSource_writePlaybackState_playbackArchive_forRouteID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_mediaRouteIdentifier");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_existingActionBuilderForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFActionSetValueSource *)self actionSetBuilder];
  id v6 = [v5 actions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__HFActionSetValueSource__existingActionBuilderForCharacteristic___block_invoke;
  v10[3] = &unk_26408EA88;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __66__HFActionSetValueSource__existingActionBuilderForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 characteristic];
    uint64_t v5 = [v4 uniqueIdentifier];
    id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_existingActionBuilderForMediaProfile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFActionSetValueSource *)self actionSetBuilder];
  id v6 = [v5 actions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke;
  v10[3] = &unk_26408EA88;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 mediaProfiles];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke_2;
    v7[3] = &unk_264090270;
    id v8 = *(id *)(a1 + 32);
    uint64_t v5 = objc_msgSend(v4, "na_any:", v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __64__HFActionSetValueSource__existingActionBuilderForMediaProfile___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_mediaRouteIdentifier");
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_actionForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFActionSetValueSource *)self actionSet];
  id v6 = [v5 actions];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFActionSetValueSource__actionForCharacteristic___block_invoke;
  v10[3] = &unk_264090490;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __51__HFActionSetValueSource__actionForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 characteristic];
    uint64_t v5 = [v4 uniqueIdentifier];
    id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_targetValueForCharacteristic:(id)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFActionSetValueSource *)self _existingActionBuilderForCharacteristic:v4];
  id v6 = v5;
  if (!v5 || ([v5 targetValue], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = [(HFActionSetValueSource *)self _actionForCharacteristic:v4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v7 = [v8 targetValue];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  uint64_t v10 = *MEMORY[0x263F0C0E0];
  v27[0] = *MEMORY[0x263F0C110];
  v27[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
  if (!v7)
  {
    char v13 = [v4 characteristicType];
    int v14 = [v11 containsObject:v13];

    if (!v14) {
      goto LABEL_15;
    }
    id v15 = [v4 service];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__HFActionSetValueSource__targetValueForCharacteristic___block_invoke;
    v24[3] = &unk_264097158;
    id v25 = v11;
    uint64_t v26 = self;
    uint64_t v7 = +[HFTargetRangeUtilities targetValueForService:v15 valueProvider:v24];

    if (!v7)
    {
      uint64_t v7 = objc_msgSend(v4, "hf_defaultValue");
    }

    if (!v7)
    {
LABEL_15:
      id v16 = (void *)MEMORY[0x263F0E248];
      uint64_t v17 = [v4 characteristicType];
      uint64_t v18 = objc_msgSend(v16, "hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:", v17);

      if (!v18
        || ([v4 service],
            v19 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v19, "hf_characteristicOfType:", v18),
            v20 = objc_claimAutoreleasedReturnValue(),
            v19,
            !v20))
      {

LABEL_21:
        if (![(HFActionSetValueSource *)self _isCurrentStateCharacteristic:v4]
          || ([(HFActionSetValueSource *)self _valueForCurrentStateCharacteristic:v4], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          v23 = [v4 value];

          if (v23) {
            [v4 value];
          }
          else {
          uint64_t v7 = objc_msgSend(v4, "hf_defaultValue");
          }
        }
        goto LABEL_8;
      }
      uint64_t v7 = [(HFActionSetValueSource *)self _targetValueForCharacteristic:v20];
      id v21 = [v4 characteristicType];
      if ([v21 isEqualToString:*MEMORY[0x263F0C068]])
      {
        uint64_t v22 = [v7 integerValue];

        if (v22 == 3)
        {

          uint64_t v7 = &unk_26C0F6CD8;
          goto LABEL_8;
        }
      }
      else
      {
      }
      if (!v7) {
        goto LABEL_21;
      }
    }
  }
LABEL_8:

  return v7;
}

id __56__HFActionSetValueSource__targetValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 characteristicType];
  LOBYTE(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) _targetValueForCharacteristic:v3];
  }

  return v6;
}

- (BOOL)_isCurrentStateCharacteristic:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F0C058];
  uint64_t v9 = *MEMORY[0x263F0C030];
  uint64_t v10 = v3;
  uint64_t v11 = *MEMORY[0x263F0C088];
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:3];
  uint64_t v7 = objc_msgSend(v5, "characteristicType", v9, v10, v11, v12);

  LOBYTE(v4) = [v6 containsObject:v7];
  return (char)v4;
}

- (id)_valueForCurrentStateCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [v4 service];
  id v6 = objc_msgSend(v5, "hf_characteristicOfType:", *MEMORY[0x263F0BEF8]);
  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = [(HFActionSetValueSource *)self _targetValueForCharacteristic:v6];
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    int v9 = [v8 BOOLValue];
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v10 = [v4 characteristicType];
  int v11 = [v10 isEqualToString:*MEMORY[0x263F0C030]];

  if (v11)
  {
    uint64_t v12 = &unk_26C0F6CD8;
    if (v9) {
      uint64_t v12 = &unk_26C0F6CF0;
    }
    id v13 = v12;
  }
  else
  {
    int v14 = [v4 characteristicType];
    int v15 = [v14 isEqualToString:*MEMORY[0x263F0C058]];

    if (v15)
    {
      id v16 = (void *)MEMORY[0x263F0C4D0];
    }
    else
    {
      uint64_t v17 = [v4 characteristicType];
      int v18 = [v17 isEqualToString:*MEMORY[0x263F0C088]];

      if (!v18)
      {
        id v13 = 0;
        goto LABEL_30;
      }
      id v16 = (void *)MEMORY[0x263F0C4F8];
    }
    v19 = objc_msgSend(v5, "hf_characteristicOfType:", *v16);
    objc_opt_class();
    v20 = [(HFActionSetValueSource *)self _targetValueForCharacteristic:v19];
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;

    if (v22) {
      int v23 = v9;
    }
    else {
      int v23 = 0;
    }
    if (v23 == 1)
    {
      uint64_t v24 = [v22 integerValue];
      id v25 = &unk_26C0F6D08;
      if (v24 == 1) {
        id v25 = &unk_26C0F6CF0;
      }
      if (v24 == 2) {
        id v13 = &unk_26C0F6D20;
      }
      else {
        id v13 = v25;
      }
    }
    else
    {
      id v13 = &unk_26C0F6CD8;
    }
  }
LABEL_30:

  return v13;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_272 != -1) {
    dispatch_once(&_MergedGlobals_272, &__block_literal_global_40_3);
  }
  v2 = (void *)qword_26AB2F2E8;
  return (NAIdentity *)v2;
}

void __37__HFActionSetValueSource_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x263F58198] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_47_3];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_49_0];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_26AB2F2E8;
  qword_26AB2F2E8 = v3;
}

uint64_t __37__HFActionSetValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 actionSet];
}

uint64_t __37__HFActionSetValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 actionSetBuilder];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (HFActionSetBuilderProtocol)actionSetBuilder
{
  return self->_actionSetBuilder;
}

- (void)setActionSetBuilder:(id)a3
{
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void)setActionSet:(id)a3
{
}

- (HFActionSetValueSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFActionSetValueSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_actionSetBuilder, 0);
}

@end