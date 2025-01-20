@interface HFServiceLikeItemUpdateRequest
- (HFCharacteristicValueSource)valueSource;
- (HFServiceLikeItemUpdateRequest)init;
- (HFServiceLikeItemUpdateRequest)initWithAccessory:(id)a3 valueSource:(id)a4 characteristics:(id)a5;
- (HFServiceLikeItemUpdateRequest)initWithService:(id)a3 valueSource:(id)a4 characteristics:(id)a5;
- (HMAccessory)accessory;
- (HMService)service;
- (NSSet)characteristics;
- (id)_displayMetadataForReadResponse:(id)a3;
- (id)_standardResultsForReadResponse:(id)a3 displayMetadata:(id)a4 batteryLevelResults:(id)a5 updateOptions:(id)a6;
- (id)updateWithOptions:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setService:(id)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFServiceLikeItemUpdateRequest

id __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 service];
  v5 = objc_msgSend(v4, "hf_characteristicOfType:", v3);

  return v5;
}

id __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v3 objectAtIndexedSubscript:1];

  v6 = [*(id *)(a1 + 32) _displayMetadataForReadResponse:v4];
  v7 = [*(id *)(a1 + 32) _standardResultsForReadResponse:v4 displayMetadata:v6 batteryLevelResults:v5 updateOptions:*(void *)(a1 + 40)];
  v8 = [[HFServiceLikeItemUpdateResponse alloc] initWithDisplayMetadata:v6 readResponse:v4 standardResults:v7];
  v9 = [MEMORY[0x263F58190] futureWithResult:v8];

  return v9;
}

- (id)_standardResultsForReadResponse:(id)a3 displayMetadata:(id)a4 batteryLevelResults:(id)a5 updateOptions:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(HFServiceLikeItemUpdateRequest *)self service];
  v15 = v14;
  if (!v14)
  {
    v15 = [(HFServiceLikeItemUpdateRequest *)self accessory];
  }
  v16 = [(HFServiceLikeItemUpdateRequest *)self accessory];
  v17 = [(HFServiceLikeItemUpdateRequest *)self valueSource];
  v18 = +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:v15 withBackingAccessory:v16 displayMetadata:v12 readResponse:v13 batteryLevelResults:v11 valueSource:v17 updateOptions:v10];

  if (!v14) {
  return v18;
  }
}

- (HMAccessory)accessory
{
  accessory = self->_accessory;
  if (accessory)
  {
    id v3 = accessory;
  }
  else
  {
    v4 = [(HFServiceLikeItemUpdateRequest *)self service];
    id v3 = [v4 accessory];
  }
  return v3;
}

- (id)_displayMetadataForReadResponse:(id)a3
{
  id v4 = a3;
  v5 = [(HFServiceLikeItemUpdateRequest *)self service];

  if (v5)
  {
    v6 = [(HFServiceLikeItemUpdateRequest *)self service];
    v7 = +[HFCharacteristicValueDisplayMetadata displayMetadataForService:v6 characteristicReadResponse:v4];
  }
  else
  {
    v8 = [(HFServiceLikeItemUpdateRequest *)self accessory];

    if (v8)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke;
      v12[3] = &unk_2640976F8;
      v12[4] = self;
      v9 = __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke((uint64_t)v12);
      id v10 = [(HFServiceLikeItemUpdateRequest *)self accessory];
      v7 = +[HFCharacteristicValueDisplayMetadata displayMetadataForAccessory:v10 withContextProvider:v9];
    }
    else
    {
      NSLog(&cfstr_NoAccessoryOrS.isa, self);
      v7 = 0;
    }
  }

  return v7;
}

- (HMService)service
{
  return self->_service;
}

- (id)updateWithOptions:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFServiceLikeItemUpdateRequest *)self characteristics];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(HFServiceLikeItemUpdateRequest *)self service];

  if (v7)
  {
    v8 = [(HFServiceLikeItemUpdateRequest *)self service];
    v9 = objc_msgSend(v8, "hf_requiredCharacteristicTypesForDisplayMetadata");
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke;
    v28[3] = &unk_2640976D0;
    v28[4] = self;
    id v10 = objc_msgSend(v9, "na_map:", v28);
    [v6 unionSet:v10];
  }
  id v11 = [HFAccessoryBatteryLevelItem alloc];
  id v12 = [(HFServiceLikeItemUpdateRequest *)self accessory];
  id v13 = [(HFServiceLikeItemUpdateRequest *)self valueSource];
  v14 = [(HFAccessoryBatteryLevelItem *)v11 initWithAccessory:v12 valueSource:v13];

  v15 = (void *)[v4 mutableCopy];
  v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"batteryLow", @"batteryPercentage", 0);
  [v15 setObject:v16 forKeyedSubscript:@"accessoryBatteryDesiredKeys"];

  v17 = [(HFItem *)v14 updateWithOptions:v15];
  v18 = [v17 recover:&__block_literal_global_137];

  v19 = [(HFServiceLikeItemUpdateRequest *)self valueSource];
  v20 = [v19 readValuesForCharacteristics:v6];
  v29[0] = v20;
  v29[1] = v18;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];

  v22 = [MEMORY[0x263F58190] combineAllFutures:v21];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_3;
  v26[3] = &unk_264096D00;
  v26[4] = self;
  id v27 = v4;
  id v23 = v4;
  v24 = [v22 flatMap:v26];

  return v24;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

id __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valueSource];
  char v3 = objc_opt_respondsToSelector();

  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5 = [v4 valueSource];
    [v5 contextProvider];
  }
  else
  {
    v5 = [v4 accessory];
    [v5 home];
  v6 = };

  return v6;
}

- (HFServiceLikeItemUpdateRequest)initWithService:(id)a3 valueSource:(id)a4 characteristics:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)HFServiceLikeItemUpdateRequest;
    id v12 = [(HFServiceLikeItemUpdateRequest *)&v17 init];
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_service, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    v15 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "HFServiceLikeItemUpdateRequest cannot init with nil service %@ or nil valueSource %@", buf, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (HFServiceLikeItemUpdateRequest)initWithAccessory:(id)a3 valueSource:(id)a4 characteristics:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && v10)
  {
    v19.receiver = self;
    v19.super_class = (Class)HFServiceLikeItemUpdateRequest;
    id v12 = [(HFServiceLikeItemUpdateRequest *)&v19 init];
    id v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_accessory, a3);
      objc_storeStrong((id *)&v13->_valueSource, a4);
      if (v11)
      {
        v14 = (NSSet *)v11;
      }
      else
      {
        v14 = [MEMORY[0x263EFFA08] set];
      }
      characteristics = v13->_characteristics;
      v13->_characteristics = v14;
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v15 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "HFServiceLikeItemUpdateRequest cannot init with nil accessory %@ or nil valueSource %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (HFServiceLikeItemUpdateRequest)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithService_valueSource_characteristics_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFServiceLikeItem.m", 105, @"%s is unavailable; use %@ instead",
    "-[HFServiceLikeItemUpdateRequest init]",
    v5);

  return 0;
}

uint64_t __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_2()
{
  return [MEMORY[0x263F58190] futureWithResult:MEMORY[0x263EFFA78]];
}

- (void)setAccessory:(id)a3
{
}

- (void)setService:(id)a3
{
}

- (void)setValueSource:(id)a3
{
}

- (void)setCharacteristics:(id)a3
{
}

@end