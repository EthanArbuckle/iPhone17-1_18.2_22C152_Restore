@interface HFActionSetServiceSuggestionMetadata
+ (id)metadataForServiceType:(id)a3;
- (HFActionSetServiceSuggestionMetadata)initWithServiceType:(id)a3 primaryCharacteristicType:(id)a4 secondaryCharacteristicTypes:(id)a5;
- (NSArray)secondaryCharacteristicTypes;
- (NSString)primaryCharacteristicType;
- (NSString)serviceType;
@end

@implementation HFActionSetServiceSuggestionMetadata

+ (id)metadataForServiceType:(id)a3
{
  id v4 = a3;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke;
  v12 = &unk_2640995F8;
  id v13 = v4;
  id v14 = a1;
  id v5 = v4;
  v6 = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke((uint64_t)&v9);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", v5, v9, v10, v11, v12);

  return v7;
}

id __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_2;
  block[3] = &unk_26408FE38;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v4;
  long long v6 = v4;
  if (qword_26AB2FAD0 != -1) {
    dispatch_once(&qword_26AB2FAD0, block);
  }
  id v2 = (id)qword_26AB2FAD8;

  return v2;
}

void __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3;
  v5[3] = &unk_2640995D0;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v4;
  long long v6 = v4;
  uint64_t v2 = __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3((uint64_t)v5);
  v3 = (void *)qword_26AB2FAD8;
  qword_26AB2FAD8 = v2;
}

id __63__HFActionSetServiceSuggestionMetadata_metadataForServiceType___block_invoke_3(uint64_t a1)
{
  v39[12] = *MEMORY[0x263EF8340];
  v38[0] = *MEMORY[0x263F0D780];
  id v2 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F0C328];
  uint64_t v37 = *MEMORY[0x263F0BF68];
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  v33 = (void *)[v2 initWithServiceType:v3 primaryCharacteristicType:v4 secondaryCharacteristicTypes:v34];
  v39[0] = v33;
  v38[1] = *MEMORY[0x263F0D6C8];
  id v5 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v36 = *MEMORY[0x263F0C378];
  uint64_t v7 = v36;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  v31 = (void *)[v5 initWithServiceType:v6 primaryCharacteristicType:v4 secondaryCharacteristicTypes:v32];
  v39[1] = v31;
  v38[2] = *MEMORY[0x263F0D890];
  id v8 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *MEMORY[0x263F0BEF8];
  uint64_t v35 = v7;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  v29 = (void *)[v8 initWithServiceType:v9 primaryCharacteristicType:v10 secondaryCharacteristicTypes:v30];
  v39[2] = v29;
  v38[3] = *MEMORY[0x263F0D828];
  id v11 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v12 = MEMORY[0x263EFFA68];
  v28 = (void *)[v11 initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:v4 secondaryCharacteristicTypes:MEMORY[0x263EFFA68]];
  v39[3] = v28;
  v38[4] = *MEMORY[0x263F0D7D0];
  id v13 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:v4 secondaryCharacteristicTypes:v12];
  v39[4] = v13;
  v38[5] = *MEMORY[0x263F0D798];
  id v14 = objc_alloc(*(Class *)(a1 + 40));
  v15 = (void *)[v14 initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:*MEMORY[0x263F0C510] secondaryCharacteristicTypes:v12];
  v39[5] = v15;
  v38[6] = *MEMORY[0x263F0D6A8];
  id v16 = objc_alloc(*(Class *)(a1 + 40));
  uint64_t v17 = *MEMORY[0x263F0C520];
  v18 = (void *)[v16 initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:*MEMORY[0x263F0C520] secondaryCharacteristicTypes:v12];
  v39[6] = v18;
  v38[7] = *MEMORY[0x263F0D8A8];
  v19 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:v17 secondaryCharacteristicTypes:v12];
  v39[7] = v19;
  v38[8] = *MEMORY[0x263F0D8B8];
  v20 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:v17 secondaryCharacteristicTypes:v12];
  v39[8] = v20;
  v38[9] = *MEMORY[0x263F0D7D8];
  id v21 = objc_alloc(*(Class *)(a1 + 40));
  v22 = (void *)[v21 initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:*MEMORY[0x263F0C548] secondaryCharacteristicTypes:v12];
  v39[9] = v22;
  v38[10] = *MEMORY[0x263F0D6F8];
  id v23 = objc_alloc(*(Class *)(a1 + 40));
  v24 = (void *)[v23 initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:*MEMORY[0x263F0C4A8] secondaryCharacteristicTypes:v12];
  v39[10] = v24;
  v38[11] = *MEMORY[0x263F0D850];
  v25 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithServiceType:*(void *)(a1 + 32) primaryCharacteristicType:v10 secondaryCharacteristicTypes:v12];
  v39[11] = v25;
  v26 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:12];

  return v26;
}

- (HFActionSetServiceSuggestionMetadata)initWithServiceType:(id)a3 primaryCharacteristicType:(id)a4 secondaryCharacteristicTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFActionSetServiceSuggestionMetadata;
  uint64_t v12 = [(HFActionSetServiceSuggestionMetadata *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceType, a3);
    objc_storeStrong((id *)&v13->_primaryCharacteristicType, a4);
    objc_storeStrong((id *)&v13->_secondaryCharacteristicTypes, a5);
  }

  return v13;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)primaryCharacteristicType
{
  return self->_primaryCharacteristicType;
}

- (NSArray)secondaryCharacteristicTypes
{
  return self->_secondaryCharacteristicTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCharacteristicTypes, 0);
  objc_storeStrong((id *)&self->_primaryCharacteristicType, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end