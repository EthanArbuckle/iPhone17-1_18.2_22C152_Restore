@interface HFPersonItemUpdateRequest
- (HFPersonItemUpdateRequest)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5;
- (HMHome)home;
- (HMPerson)person;
- (HMPersonManager)personManager;
- (id)updateWithOptions:(id)a3;
@end

@implementation HFPersonItemUpdateRequest

- (HFPersonItemUpdateRequest)initWithPerson:(id)a3 personManager:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFPersonItemUpdateRequest;
  v12 = [(HFPersonItemUpdateRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_person, a3);
    objc_storeStrong((id *)&v13->_personManager, a4);
    objc_storeStrong((id *)&v13->_home, a5);
  }

  return v13;
}

- (id)updateWithOptions:(id)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFPersonItemUpdateRequest *)self home];
  v6 = [v5 personManagerSettings];
  char v7 = [v6 isFaceClassificationEnabled];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    id v9 = [(HFPersonItemUpdateRequest *)self person];
    id v10 = [v9 name];
    objc_msgSend(v8, "na_safeSetObject:forKey:", v10, @"title");

    id v11 = [(HFPersonItemUpdateRequest *)self person];
    v12 = [v11 UUID];
    objc_msgSend(v8, "na_safeSetObject:forKey:", v12, @"personIdentifier");

    v13 = NSNumber;
    v14 = [(HFPersonItemUpdateRequest *)self personManager];
    objc_opt_class();
    objc_super v15 = [v13 numberWithBool:objc_opt_isKindOfClass() & 1];
    [v8 setObject:v15 forKeyedSubscript:@"HFPersonResultIsHomeOriginatedKey"];

    v16 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [v8 setObject:v16 forKeyedSubscript:@"dependentHomeKitClasses"];

    v17 = (void *)MEMORY[0x263EFF9C0];
    v18 = [(HFPersonItemUpdateRequest *)self person];
    objc_msgSend(v17, "na_setWithSafeObject:", v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    [v8 setObject:v19 forKeyedSubscript:@"dependentHomeKitObjects"];
    [v8 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
    v20 = [v4 objectForKeyedSubscript:HFPersonItemUpdateOptionSkipFaceCrop];
    int v21 = [v20 BOOLValue];

    if (v21)
    {
      v22 = (void *)MEMORY[0x263F58190];
      v23 = +[HFItemUpdateOutcome outcomeWithResults:v8];
      v24 = [v22 futureWithResult:v23];
    }
    else
    {
      v23 = [(HFPersonItemUpdateRequest *)self personManager];
      v26 = [(HFPersonItemUpdateRequest *)self person];
      v27 = [v26 UUID];
      v28 = objc_msgSend(v23, "hf_faceCropsForPersonWithIdentifier:", v27);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke;
      v34[3] = &unk_26408E4B8;
      id v29 = v8;
      id v35 = v29;
      id v19 = v19;
      id v36 = v19;
      v37 = self;
      v30 = [v28 flatMap:v34];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_105;
      v32[3] = &unk_26408CE18;
      v32[4] = self;
      id v8 = v29;
      id v33 = v8;
      v24 = [v30 recover:v32];
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x263F58190];
    v38 = @"hidden";
    v39[0] = MEMORY[0x263EFFA88];
    id v8 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v19 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v24 = [v25 futureWithResult:v19];
  }

  return v24;
}

id __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = a2;
  v5 = [v3 setWithArray:v4];
  v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_18);

  char v7 = [v4 lastObject];

  id v8 = a1[4];
  id v9 = objc_msgSend(v7, "hf_imageRepresentation");
  objc_msgSend(v8, "na_safeSetObject:forKey:", v9, @"HFPersonResultFaceCropImageKey");

  id v10 = a1[4];
  id v11 = [v7 dateCreated];
  objc_msgSend(v10, "na_safeSetObject:forKey:", v11, @"HFPersonResultFaceCropDateKey");

  objc_msgSend(a1[4], "na_safeSetObject:forKey:", v6, @"HFPersonResultFaceCropIdentifiersKey");
  objc_msgSend(a1[5], "na_safeAddObject:", v7);
  [a1[4] setObject:a1[5] forKeyedSubscript:@"dependentHomeKitObjects"];
  v12 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v17 = [a1[6] person];
    int v18 = 138412546;
    id v19 = v17;
    __int16 v20 = 2112;
    int v21 = v7;
    _os_log_debug_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEBUG, "Person %@ using face crop %@", (uint8_t *)&v18, 0x16u);
  }
  v13 = (void *)MEMORY[0x263F58190];
  v14 = +[HFItemUpdateOutcome outcomeWithResults:a1[4]];
  objc_super v15 = [v13 futureWithResult:v14];

  return v15;
}

uint64_t __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

id __47__HFPersonItemUpdateRequest_updateWithOptions___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x13uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "%@: Face crop update failed with error %@. Recovering and hiding face crop result.", (uint8_t *)&v10, 0x16u);
  }

  v5 = (void *)MEMORY[0x263F58190];
  v6 = +[HFItemUpdateOutcome outcomeWithResults:*(void *)(a1 + 40)];
  char v7 = [v5 futureWithResult:v6];

  return v7;
}

- (HMPerson)person
{
  return self->_person;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

@end