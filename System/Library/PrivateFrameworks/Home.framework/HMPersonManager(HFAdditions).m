@interface HMPersonManager(HFAdditions)
- (id)hf_associateFaceCropsWithUUIDs:()HFAdditions toPersonWithUUID:;
- (id)hf_faceCropsForPersonWithIdentifier:()HFAdditions;
- (id)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:()HFAdditions;
- (id)hf_linkFromPerson:()HFAdditions toPerson:toPersonManagerUUID:;
- (id)hf_namePerson:()HFAdditions name:;
- (id)hf_personWithIdentifier:()HFAdditions;
- (id)hf_reassociateFaceCropsFromPersonWithUUID:()HFAdditions toPersonWithUUID:removePerson:;
- (id)hf_removeFaceCropsWithUUIDs:()HFAdditions;
- (id)hf_removePersonWithUUID:()HFAdditions;
@end

@implementation HMPersonManager(HFAdditions)

- (id)hf_personWithIdentifier:()HFAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_personWithIdentifier___block_invoke;
  v9[3] = &unk_26408F0C8;
  v9[4] = a1;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 futureWithBlock:v9];

  return v7;
}

- (id)hf_faceCropsForPersonWithIdentifier:()HFAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke;
  v13[3] = &unk_264090378;
  v13[4] = a1;
  id v6 = v4;
  id v14 = v6;
  v7 = [v5 futureWithCompletionHandlerAdapterBlock:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HMPersonManager_HFAdditions__hf_faceCropsForPersonWithIdentifier___block_invoke_2;
  v11[3] = &unk_2640967B8;
  v11[4] = a1;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 flatMap:v11];

  return v9;
}

- (id)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:()HFAdditions
{
  v1 = objc_msgSend(a1, "hf_faceCropsForPersonWithIdentifier:");
  v2 = [v1 flatMap:&__block_literal_global_11_6];

  return v2;
}

- (id)hf_namePerson:()HFAdditions name:
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  id v8 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__HMPersonManager_HFAdditions__hf_namePerson_name___block_invoke;
  v13[3] = &unk_264096CB0;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  v11 = [v8 futureWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (id)hf_removePersonWithUUID:()HFAdditions
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HMPersonManager_HFAdditions__hf_removePersonWithUUID___block_invoke;
  v9[3] = &unk_264097010;
  v9[4] = a1;
  id v6 = v4;
  id v10 = v6;
  objc_copyWeak(&v11, &location);
  id v7 = [v5 futureWithBlock:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v7;
}

- (id)hf_removeFaceCropsWithUUIDs:()HFAdditions
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x263F58190];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__HMPersonManager_HFAdditions__hf_removeFaceCropsWithUUIDs___block_invoke;
  v9[3] = &unk_264097010;
  v9[4] = a1;
  id v6 = v4;
  id v10 = v6;
  objc_copyWeak(&v11, &location);
  id v7 = [v5 futureWithBlock:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v7;
}

- (id)hf_associateFaceCropsWithUUIDs:()HFAdditions toPersonWithUUID:
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, a1);
  id v8 = (void *)MEMORY[0x263F58190];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HMPersonManager_HFAdditions__hf_associateFaceCropsWithUUIDs_toPersonWithUUID___block_invoke;
  v13[3] = &unk_264096CB0;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v11 = [v8 futureWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (id)hf_reassociateFaceCropsFromPersonWithUUID:()HFAdditions toPersonWithUUID:removePerson:
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqual:v9])
  {
    id v10 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F58190];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __104__HMPersonManager_HFAdditions__hf_reassociateFaceCropsFromPersonWithUUID_toPersonWithUUID_removePerson___block_invoke;
    v13[3] = &unk_2640970D8;
    void v13[4] = a1;
    id v14 = v8;
    id v15 = v9;
    char v16 = a5;
    id v10 = [v11 futureWithBlock:v13];
  }
  return v10;
}

- (id)hf_linkFromPerson:()HFAdditions toPerson:toPersonManagerUUID:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x263F0E630];
  id v11 = a5;
  id v12 = [v10 alloc];
  v13 = [v9 UUID];
  id v14 = (void *)[v12 initWithPersonUUID:v13 personManagerUUID:v11];

  id v15 = (void *)[v8 mutableCopy];
  char v16 = [v15 personLinks];
  v17 = (void *)[v16 mutableCopy];

  [v17 addObject:v14];
  [v15 setPersonLinks:v17];
  v18 = (void *)MEMORY[0x263F58190];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __79__HMPersonManager_HFAdditions__hf_linkFromPerson_toPerson_toPersonManagerUUID___block_invoke;
  v24[3] = &unk_264097100;
  v24[4] = a1;
  id v25 = v15;
  id v26 = v8;
  id v27 = v9;
  id v19 = v9;
  id v20 = v8;
  id v21 = v15;
  v22 = [v18 futureWithBlock:v24];

  return v22;
}

@end