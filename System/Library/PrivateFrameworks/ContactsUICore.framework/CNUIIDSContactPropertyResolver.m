@interface CNUIIDSContactPropertyResolver
+ (id)IDSRelevantPropertiesForContact:(id)a3;
+ (id)descriptorForCopyingStrippedContact:(id)a3;
+ (id)descriptorForRequiredKeys;
- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider;
- (CNUIIDSContactPropertyResolver)initWithIDSAvailabilityProvider:(id)a3;
- (id)resolveAllFaceTimeIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4;
- (id)resolveBestExpanseIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4;
- (id)resolveBestFaceTimeIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4;
- (id)resolveBestIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5;
- (id)resolveBestIMessageIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4;
- (id)resolveIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5;
@end

@implementation CNUIIDSContactPropertyResolver

+ (id)descriptorForRequiredKeys
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v3 = *MEMORY[0x263EFE070];
  v8[0] = *MEMORY[0x263EFDF80];
  v8[1] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  v5 = [NSString stringWithUTF8String:"+[CNUIIDSContactPropertyResolver descriptorForRequiredKeys]"];
  v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

+ (id)descriptorForCopyingStrippedContact:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 keyVector];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x263EFE140];
  v16[0] = *MEMORY[0x263EFDFF8];
  v16[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  [v4 subtractKeys:v6];

  uint64_t v7 = *MEMORY[0x263EFE130];
  v15[0] = *MEMORY[0x263EFDFC0];
  v15[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  [v4 subtractKeys:v8];

  v9 = (void *)MEMORY[0x263EFE9F8];
  v14 = v4;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
  v11 = [NSString stringWithUTF8String:"+[CNUIIDSContactPropertyResolver descriptorForCopyingStrippedContact:]"];
  v12 = [v9 descriptorWithKeyDescriptors:v10 description:v11];

  return v12;
}

- (CNUIIDSContactPropertyResolver)initWithIDSAvailabilityProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIIDSContactPropertyResolver;
  v6 = [(CNUIIDSContactPropertyResolver *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsAvailabilityProvider, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)IDSRelevantPropertiesForContact:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 descriptorForCopyingStrippedContact:v4];
  v21[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v7 = (void *)[v4 copyWithPropertyKeys:v6];

  v8 = [MEMORY[0x263EFF980] array];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke;
  aBlock[3] = &unk_2640187F0;
  id v20 = v7;
  id v9 = v7;
  objc_super v10 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  uint64_t v11 = *MEMORY[0x263EFDF80];
  v12 = [v9 emailAddresses];
  v13 = v10[2](v10, v11, v12);
  [v8 addObjectsFromArray:v13];

  uint64_t v14 = *MEMORY[0x263EFE070];
  v15 = [v9 phoneNumbers];
  v16 = v10[2](v10, v14, v15);
  [v8 addObjectsFromArray:v16];

  v17 = (void *)[v8 copy];
  return v17;
}

id __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = objc_msgSend(a3, "_cn_filter:", &__block_literal_global_39);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_3;
  v10[3] = &unk_2640187C8;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "_cn_map:", v10);

  return v8;
}

uint64_t __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSuggested] ^ 1;
}

id __66__CNUIIDSContactPropertyResolver_IDSRelevantPropertiesForContact___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFEA30];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [a2 identifier];
  v6 = [v2 contactPropertyWithContactNoCopy:v3 propertyKey:v4 identifier:v5];

  return v6;
}

- (id)resolveBestIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F33608];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke;
  v17[3] = &unk_2640188A0;
  id v18 = v9;
  v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  v15 = [v11 observableWithBlock:v17];

  return v15;
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) backgroundScheduler];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2;
  v9[3] = &unk_264018878;
  id v5 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v6 = v3;
  id v7 = [v4 performCancelableBlock:v9];

  return v7;
}

void __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v11 = [(id)objc_opt_class() IDSRelevantPropertiesForContact:a1[5]];
  uint64_t v4 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_14_0);
  id v5 = (*(void (**)(void))(a1[8] + 16))();
  id v6 = [v5 filter:&__block_literal_global_18];
  id v7 = [v6 map:&__block_literal_global_21_1];
  id v8 = [v7 scan:&__block_literal_global_24];
  id v9 = [v8 throttle:a1[6] schedulerProvider:0.0];
  id v10 = [v9 subscribe:a1[7]];
  [v3 addCancelable:v10];
}

CNUIContactPropertyIDSHandle *__115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNUIContactPropertyIDSHandle alloc] initWithContactProperty:v2];

  return v3;
}

uint64_t __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isAvailable];
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 handle];
  id v3 = [v2 contactProperty];

  return v3;
}

id __115__CNUIIDSContactPropertyResolver_resolveBestIDSPropertyForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = +[CNUIContactPropertyRanker bestPropertyComparator];
  uint64_t v7 = ((uint64_t (**)(void, id, id))v6)[2](v6, v5, v4);

  if (v7 == -1) {
    id v8 = v5;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (id)resolveBestFaceTimeIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__CNUIIDSContactPropertyResolver_resolveBestFaceTimeIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_2640188C8;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNUIIDSContactPropertyResolver *)self resolveBestIDSPropertyForContact:a3 schedulerProvider:v7 usingAvailabilityProviderCall:v10];

  return v8;
}

id __93__CNUIIDSContactPropertyResolver_resolveBestFaceTimeIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 idsAvailabilityProvider];
  id v6 = [v5 validateHandlesForFaceTime:v4 schedulerProvider:*(void *)(a1 + 40)];

  return v6;
}

- (id)resolveBestIMessageIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__CNUIIDSContactPropertyResolver_resolveBestIMessageIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_2640188C8;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNUIIDSContactPropertyResolver *)self resolveBestIDSPropertyForContact:a3 schedulerProvider:v7 usingAvailabilityProviderCall:v10];

  return v8;
}

id __93__CNUIIDSContactPropertyResolver_resolveBestIMessageIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 idsAvailabilityProvider];
  id v6 = [v5 validateHandlesForIMessage:v4 schedulerProvider:*(void *)(a1 + 40)];

  return v6;
}

- (id)resolveBestExpanseIDSPropertyForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __92__CNUIIDSContactPropertyResolver_resolveBestExpanseIDSPropertyForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_2640188C8;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNUIIDSContactPropertyResolver *)self resolveBestIDSPropertyForContact:a3 schedulerProvider:v7 usingAvailabilityProviderCall:v10];

  return v8;
}

id __92__CNUIIDSContactPropertyResolver_resolveBestExpanseIDSPropertyForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 idsAvailabilityProvider];
  id v6 = [v5 validateHandlesForExpanse:v4 schedulerProvider:*(void *)(a1 + 40)];

  return v6;
}

- (id)resolveIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4 usingAvailabilityProviderCall:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F33608];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke;
  v17[3] = &unk_2640188A0;
  id v18 = v9;
  v19 = self;
  id v20 = v8;
  id v21 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  v15 = [v11 observableWithBlock:v17];

  return v15;
}

id __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) backgroundScheduler];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2;
  v9[3] = &unk_264018878;
  id v5 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v13 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  id v6 = v3;
  id v7 = [v4 performCancelableBlock:v9];

  return v7;
}

void __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v10 = [(id)objc_opt_class() IDSRelevantPropertiesForContact:a1[5]];
  id v4 = objc_msgSend(v10, "_cn_map:", &__block_literal_global_30);
  id v5 = (*(void (**)(void))(a1[8] + 16))();
  id v6 = [v5 filter:&__block_literal_global_32_0];
  id v7 = [v6 map:&__block_literal_global_34];
  id v8 = [v7 throttle:a1[6] schedulerProvider:0.0];
  id v9 = [v8 subscribe:a1[7]];
  [v3 addCancelable:v9];
}

CNUIContactPropertyIDSHandle *__113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[CNUIContactPropertyIDSHandle alloc] initWithContactProperty:v2];

  return v3;
}

uint64_t __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isAvailable];
}

id __113__CNUIIDSContactPropertyResolver_resolveIDSPropertiesForContact_schedulerProvider_usingAvailabilityProviderCall___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 handle];
  id v3 = [v2 contactProperty];

  return v3;
}

- (id)resolveAllFaceTimeIDSPropertiesForContact:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__CNUIIDSContactPropertyResolver_resolveAllFaceTimeIDSPropertiesForContact_schedulerProvider___block_invoke;
  v10[3] = &unk_2640188C8;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(CNUIIDSContactPropertyResolver *)self resolveIDSPropertiesForContact:a3 schedulerProvider:v7 usingAvailabilityProviderCall:v10];

  return v8;
}

id __94__CNUIIDSContactPropertyResolver_resolveAllFaceTimeIDSPropertiesForContact_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 idsAvailabilityProvider];
  id v6 = [v5 validateHandlesForFaceTime:v4 schedulerProvider:*(void *)(a1 + 40)];

  return v6;
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  return self->_idsAvailabilityProvider;
}

- (void).cxx_destruct
{
}

@end