@interface HMAccessoryProfile
@end

@implementation HMAccessoryProfile

void __65__HMAccessoryProfile_HFAdditions___profilesWithNonStandardTileUI__block_invoke_2()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  v1 = (void *)qword_26AB2ED18;
  qword_26AB2ED18 = v0;
}

uint64_t __64__HMAccessoryProfile_AbstractionAdditions__hf_containedServices__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2ECE8;
  qword_26AB2ECE8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __71__HMAccessoryProfile_AbstractionAdditions__hf_containedCharacteristics__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] set];
  uint64_t v1 = qword_26AB2ECF8;
  qword_26AB2ECF8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 profiles];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2;
  v14[3] = &unk_26408E240;
  id v15 = *(id *)(a1 + 32);
  char v5 = objc_msgSend(v4, "na_any:", v14);

  if ((v5 & 1) != 0
    || ([v3 mediaProfile],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 uniqueIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:*(void *)(a1 + 32)],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    uint64_t v9 = 1;
  }
  else
  {
    v10 = [v3 cameraProfiles];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_3;
    v12[3] = &unk_264092120;
    id v13 = *(id *)(a1 + 32);
    uint64_t v9 = objc_msgSend(v10, "na_any:", v12);
  }
  return v9;
}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __66__HMAccessoryProfile_HFHomeKitObjectConformance__hf_isValidObject__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end