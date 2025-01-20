@interface HMService(HFCharacteristicValueDisplayMetadataAdditions)
+ (id)hf_allRequiredCharacteristicTypesForStandardServices;
+ (id)hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:()HFCharacteristicValueDisplayMetadataAdditions;
+ (id)hf_sensorCharacteristicTypeForServiceType:()HFCharacteristicValueDisplayMetadataAdditions;
- (id)hf_requiredCharacteristicTypesForDisplayMetadata;
@end

@implementation HMService(HFCharacteristicValueDisplayMetadataAdditions)

+ (id)hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:()HFCharacteristicValueDisplayMetadataAdditions
{
  v42[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[HFServiceDescriptor alloc] initWithServiceType:v3 serviceSubtype:0 parentServiceDescriptor:0];
  v5 = +[HFServiceState stateClassForServiceDescriptor:v4];
  if (v5)
  {
    v6 = [(objc_class *)v5 requiredCharacteristicTypes];
    goto LABEL_34;
  }
  v7 = objc_msgSend(MEMORY[0x263F0E708], "hf_sensorServiceTypes");
  v8 = __HFSimplePowerStateServices_block_invoke();
  v9 = __HFSimpleActiveStateServices_block_invoke();
  v10 = __HFCurrentTargetPositionServices_block_invoke();
  if ([v3 isEqualToString:*MEMORY[0x263F0D610]]) {
    goto LABEL_4;
  }
  if ([v7 containsObject:v3])
  {
    v12 = (void *)MEMORY[0x263EFFA08];
    v13 = objc_msgSend((id)objc_opt_class(), "hf_sensorCharacteristicTypeForServiceType:", v3);
    v42[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
    v6 = [v12 setWithArray:v14];

    goto LABEL_33;
  }
  if ([v8 containsObject:v3])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v41 = *MEMORY[0x263F0C328];
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = &v41;
LABEL_12:
    uint64_t v18 = 1;
LABEL_32:
    v30 = [v16 arrayWithObjects:v17 count:v18];
    v6 = [v15 setWithArray:v30];

    goto LABEL_33;
  }
  if ([v9 containsObject:v3])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v40 = *MEMORY[0x263F0BEF8];
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = &v40;
    goto LABEL_12;
  }
  if ([v10 containsObject:v3])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = *MEMORY[0x263F0C520];
    v39[0] = *MEMORY[0x263F0C0D0];
    v39[1] = v19;
    v39[2] = *MEMORY[0x263F0C2B8];
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v39;
LABEL_17:
    uint64_t v18 = 3;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D6F8]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = *MEMORY[0x263F0C4A8];
    v38[0] = *MEMORY[0x263F0C040];
    v38[1] = v20;
    v38[2] = *MEMORY[0x263F0C2B8];
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v38;
    goto LABEL_17;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D798]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = *MEMORY[0x263F0C510];
    v37[0] = *MEMORY[0x263F0C0B0];
    v37[1] = v21;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v37;
LABEL_22:
    uint64_t v18 = 2;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D7D8]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v22 = *MEMORY[0x263F0C548];
    v36[0] = *MEMORY[0x263F0C0E8];
    v36[1] = v22;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v36;
    goto LABEL_22;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D870]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = *MEMORY[0x263F0C550];
    v35[0] = *MEMORY[0x263F0C110];
    v35[1] = v23;
    uint64_t v24 = *MEMORY[0x263F0C4D8];
    v35[2] = *MEMORY[0x263F0C068];
    v35[3] = v24;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v35;
LABEL_31:
    uint64_t v18 = 4;
    goto LABEL_32;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D708]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = *MEMORY[0x263F0C110];
    v34[0] = *MEMORY[0x263F0BEF8];
    v34[1] = v25;
    uint64_t v26 = *MEMORY[0x263F0C4D0];
    v34[2] = *MEMORY[0x263F0C058];
    v34[3] = v26;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v34;
    goto LABEL_31;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D618]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v27 = *MEMORY[0x263F0C030];
    v33[0] = *MEMORY[0x263F0BEF8];
    v33[1] = v27;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v33;
    goto LABEL_22;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0D720]])
  {
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = *MEMORY[0x263F0C0E0];
    v32[0] = *MEMORY[0x263F0BEF8];
    v32[1] = v28;
    uint64_t v29 = *MEMORY[0x263F0C4F8];
    v32[2] = *MEMORY[0x263F0C088];
    v32[3] = v29;
    v16 = (void *)MEMORY[0x263EFF8C0];
    v17 = v32;
    goto LABEL_31;
  }
  if (![v3 isEqualToString:*MEMORY[0x263F0D818]]
    && ![v3 isEqualToString:*MEMORY[0x263F0D820]])
  {
    if (![v3 isEqualToString:*MEMORY[0x263F0D738]])
    {
      NSLog(&cfstr_UnknownOrUnimp.isa, v3);
      v6 = 0;
      goto LABEL_33;
    }
    uint64_t v11 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C210]];
    goto LABEL_5;
  }
LABEL_4:
  uint64_t v11 = [MEMORY[0x263EFFA08] set];
LABEL_5:
  v6 = (void *)v11;
LABEL_33:

LABEL_34:
  return v6;
}

- (id)hf_requiredCharacteristicTypesForDisplayMetadata
{
  v2 = objc_opt_class();
  id v3 = [a1 serviceType];
  v4 = objc_msgSend(v2, "hf_requiredCharacteristicTypesForDisplayMetadataWithServiceType:", v3);

  return v4;
}

+ (id)hf_sensorCharacteristicTypeForServiceType:()HFCharacteristicValueDisplayMetadataAdditions
{
  id v3 = a3;
  if (_MergedGlobals_250 != -1) {
    dispatch_once(&_MergedGlobals_250, &__block_literal_global_3_11);
  }
  id v4 = (id)qword_26AB2F068;
  v5 = [v4 objectForKeyedSubscript:v3];
  if (!v5) {
    NSLog(&cfstr_NoCharacterist_0.isa, v3);
  }

  return v5;
}

+ (id)hf_allRequiredCharacteristicTypesForStandardServices
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  v1 = __112__HMService_HFCharacteristicValueDisplayMetadataAdditions__hf_allRequiredCharacteristicTypesForStandardServices__block_invoke((uint64_t)v3);
  return v1;
}

@end