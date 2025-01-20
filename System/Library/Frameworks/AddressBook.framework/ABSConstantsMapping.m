@interface ABSConstantsMapping
+ (id)ABToCNContactSortOrderConstantsMapping;
+ (id)ABToCNContainerTypeConstantsMapping;
+ (id)ABToCNLabelConstantsMapping;
+ (id)ABToCNPersonAddressConstantsMapping;
+ (id)ABToCNPersonInstantMessageConstantsMapping;
+ (id)ABToCNPersonKindConstantsMapping;
+ (id)ABToCNPersonSocialProfileConstantsMapping;
+ (id)ABtoCNContactDisplayNameOrderConstantsMapping;
+ (id)CNToABCompositeNameFormatConstantsMapping;
+ (id)CNToABLabelConstantsMapping;
+ (id)CNToABPersonAddressConstantsMapping;
+ (id)CNToABPersonInstantMessageConstantsMapping;
+ (id)CNToABPersonKindConstantsMapping;
+ (id)CNToABPersonSocialProfileConstantsMapping;
+ (id)CNToABPersonSortOrderingConstantsMapping;
+ (id)CNToABSourceTypeConstantsMapping;
- (ABSConstantsMapping)initWithMapping:(id)a3;
- (NSDictionary)mapping;
- (id)defaultConstant;
- (id)invertedMapping;
- (id)mappedConstant:(id)a3;
- (void)setDefaultConstant:(id)a3;
- (void)setMapping:(id)a3;
@end

@implementation ABSConstantsMapping

+ (id)ABToCNPersonKindConstantsMapping
{
  if (ABToCNPersonKindConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonKindConstantsMapping_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;

  return v2;
}

uint64_t __55__ABSConstantsMapping_ABToCNPersonKindConstantsMapping__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = kABPersonKindPerson;
  v5[1] = kABPersonKindOrganization;
  v6[0] = &unk_26C591B38;
  v6[1] = &unk_26C591B50;
  v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v2 = [(ABSConstantsMapping *)v0 initWithMapping:v1];
  v3 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;
  ABToCNPersonKindConstantsMapping_s_mapping = v2;

  return [(id)ABToCNPersonKindConstantsMapping_s_mapping setDefaultConstant:&unk_26C591B38];
}

+ (id)CNToABPersonKindConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ABSConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonKindConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonKindConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonKindConstantsMapping_s_mapping;

  return v2;
}

uint64_t __55__ABSConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) ABToCNPersonKindConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  v3 = (void *)CNToABPersonKindConstantsMapping_s_mapping;
  CNToABPersonKindConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABPersonKindConstantsMapping_s_mapping;

  return [v4 setDefaultConstant:kABPersonKindPerson];
}

+ (id)ABtoCNContactDisplayNameOrderConstantsMapping
{
  if (ABtoCNContactDisplayNameOrderConstantsMapping_onceToken != -1) {
    dispatch_once(&ABtoCNContactDisplayNameOrderConstantsMapping_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;

  return v2;
}

uint64_t __68__ABSConstantsMapping_ABtoCNContactDisplayNameOrderConstantsMapping__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_26C591B68;
  v5[1] = &unk_26C591B80;
  v6[0] = &unk_26C591B50;
  v6[1] = &unk_26C591B98;
  v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v2 = [(ABSConstantsMapping *)v0 initWithMapping:v1];
  v3 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
  ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping = v2;

  return [(id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping setDefaultConstant:&unk_26C591B38];
}

+ (id)CNToABCompositeNameFormatConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ABSConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABCompositeNameFormatConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABCompositeNameFormatConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;

  return v2;
}

uint64_t __64__ABSConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) ABtoCNContactDisplayNameOrderConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  v3 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;
  CNToABCompositeNameFormatConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;

  return [v4 setDefaultConstant:&unk_26C591B80];
}

+ (id)ABToCNContactSortOrderConstantsMapping
{
  if (ABToCNContactSortOrderConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNContactSortOrderConstantsMapping_onceToken, &__block_literal_global_15);
  }
  uint64_t v2 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;

  return v2;
}

uint64_t __61__ABSConstantsMapping_ABToCNContactSortOrderConstantsMapping__block_invoke()
{
  v6[2] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_26C591B68;
  v5[1] = &unk_26C591B80;
  v6[0] = &unk_26C591B98;
  v6[1] = &unk_26C591BB0;
  v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v2 = [(ABSConstantsMapping *)v0 initWithMapping:v1];
  v3 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;
  ABToCNContactSortOrderConstantsMapping_s_mapping = v2;

  return [(id)ABToCNContactSortOrderConstantsMapping_s_mapping setDefaultConstant:&unk_26C591B50];
}

+ (id)CNToABPersonSortOrderingConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ABSConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSortOrderingConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonSortOrderingConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;

  return v2;
}

uint64_t __63__ABSConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) ABToCNContactSortOrderConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  v3 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;
  CNToABPersonSortOrderingConstantsMapping_s_mapping = v2;

  v4 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;

  return [v4 setDefaultConstant:&unk_26C591B80];
}

+ (id)ABToCNPersonAddressConstantsMapping
{
  if (ABToCNPersonAddressConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonAddressConstantsMapping_onceToken, &__block_literal_global_19);
  }
  uint64_t v2 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;

  return v2;
}

void __58__ABSConstantsMapping_ABToCNPersonAddressConstantsMapping__block_invoke()
{
  v10[6] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x263EFE950];
  v9[0] = @"Street";
  v9[1] = @"City";
  uint64_t v2 = *MEMORY[0x263EFE918];
  v10[0] = v1;
  v10[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFE948];
  v9[2] = @"State";
  v9[3] = @"ZIP";
  uint64_t v4 = *MEMORY[0x263EFE938];
  v10[2] = v3;
  v10[3] = v4;
  v9[4] = @"Country";
  v9[5] = @"CountryCode";
  uint64_t v5 = *MEMORY[0x263EFE928];
  v10[4] = *MEMORY[0x263EFE920];
  v10[5] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  uint64_t v7 = [(ABSConstantsMapping *)v0 initWithMapping:v6];
  v8 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;
  ABToCNPersonAddressConstantsMapping_s_mapping = v7;
}

+ (id)CNToABPersonAddressConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ABSConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonAddressConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonAddressConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;

  return v2;
}

void __58__ABSConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonAddressConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;
  CNToABPersonAddressConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNPersonInstantMessageConstantsMapping
{
  if (ABToCNPersonInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonInstantMessageConstantsMapping_onceToken, &__block_literal_global_21);
  }
  uint64_t v2 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __65__ABSConstantsMapping_ABToCNPersonInstantMessageConstantsMapping__block_invoke()
{
  v16[12] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x263EFE1C8];
  v15[0] = @"service";
  v15[1] = @"username";
  uint64_t v2 = *MEMORY[0x263EFE1D0];
  v16[0] = v1;
  v16[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFE220];
  v15[2] = @"Yahoo";
  v15[3] = @"Jabber";
  uint64_t v4 = *MEMORY[0x263EFE200];
  v16[2] = v3;
  v16[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFE208];
  v15[4] = @"MSN";
  v15[5] = @"ICQ";
  uint64_t v6 = *MEMORY[0x263EFE1F8];
  v16[4] = v5;
  v16[5] = v6;
  uint64_t v7 = *MEMORY[0x263EFE1D8];
  v15[6] = @"AIM";
  v15[7] = @"QQ";
  uint64_t v8 = *MEMORY[0x263EFE210];
  v16[6] = v7;
  v16[7] = v8;
  uint64_t v9 = *MEMORY[0x263EFE1F0];
  v15[8] = @"GoogleTalk";
  v15[9] = @"Skype";
  uint64_t v10 = *MEMORY[0x263EFE218];
  v16[8] = v9;
  v16[9] = v10;
  v15[10] = @"Facebook";
  v15[11] = @"GaduGadu";
  uint64_t v11 = *MEMORY[0x263EFE1E8];
  v16[10] = *MEMORY[0x263EFE1E0];
  v16[11] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:12];
  uint64_t v13 = [(ABSConstantsMapping *)v0 initWithMapping:v12];
  v14 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
  ABToCNPersonInstantMessageConstantsMapping_s_mapping = v13;
}

+ (id)CNToABPersonInstantMessageConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ABSConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonInstantMessageConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __65__ABSConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonInstantMessageConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;
  CNToABPersonInstantMessageConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNPersonSocialProfileConstantsMapping
{
  if (ABToCNPersonSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonSocialProfileConstantsMapping_onceToken, &__block_literal_global_23);
  }
  uint64_t v2 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __64__ABSConstantsMapping_ABToCNPersonSocialProfileConstantsMapping__block_invoke()
{
  v15[11] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x263EFE9B0];
  v14[0] = @"url";
  v14[1] = @"username";
  uint64_t v2 = *MEMORY[0x263EFE9C0];
  v15[0] = v1;
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFE9B8];
  v14[2] = @"identifier";
  v14[3] = @"service";
  uint64_t v4 = *MEMORY[0x263EFE978];
  v15[2] = v3;
  v15[3] = v4;
  uint64_t v5 = *MEMORY[0x263F33540];
  v14[4] = @"twitter";
  v14[5] = @"sinaweibo";
  uint64_t v6 = *MEMORY[0x263F33538];
  v15[4] = v5;
  v15[5] = v6;
  uint64_t v7 = *MEMORY[0x263EFE970];
  v14[6] = @"gamecenter";
  v14[7] = @"facebook";
  uint64_t v8 = *MEMORY[0x263F33518];
  v15[6] = v7;
  v15[7] = v8;
  uint64_t v9 = *MEMORY[0x263F33530];
  v14[8] = @"myspace";
  v14[9] = @"linkedin";
  uint64_t v10 = *MEMORY[0x263F33528];
  v15[8] = v9;
  v15[9] = v10;
  v14[10] = @"flickr";
  v15[10] = *MEMORY[0x263F33520];
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:11];
  uint64_t v12 = [(ABSConstantsMapping *)v0 initWithMapping:v11];
  uint64_t v13 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
  ABToCNPersonSocialProfileConstantsMapping_s_mapping = v12;
}

+ (id)CNToABPersonSocialProfileConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ABSConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonSocialProfileConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __64__ABSConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonSocialProfileConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;
  CNToABPersonSocialProfileConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNLabelConstantsMapping
{
  if (ABToCNLabelConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNLabelConstantsMapping_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)ABToCNLabelConstantsMapping_s_mapping;

  return v2;
}

void __50__ABSConstantsMapping_ABToCNLabelConstantsMapping__block_invoke()
{
  v27[23] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x263EFE910];
  v26[0] = @"_$!<Work>!$_";
  v26[1] = @"_$!<Home>!$_";
  uint64_t v2 = *MEMORY[0x263EFE8B8];
  v27[0] = v1;
  v27[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFE8C0];
  v26[2] = @"_$!<Other>!$_";
  v26[3] = @"_$!<Anniversary>!$_";
  uint64_t v4 = *MEMORY[0x263EFE8A8];
  v27[2] = v3;
  v27[3] = v4;
  uint64_t v5 = *MEMORY[0x263EFE8F8];
  v26[4] = @"iPhone";
  v26[5] = @"_$!<Main>!$_";
  uint64_t v6 = *MEMORY[0x263EFE8D0];
  v27[4] = v5;
  v27[5] = v6;
  uint64_t v7 = *MEMORY[0x263EFE8C8];
  v26[6] = @"_$!<HomeFAX>!$_";
  v26[7] = @"_$!<WorkFAX>!$_";
  uint64_t v8 = *MEMORY[0x263EFE8F0];
  v27[6] = v7;
  v27[7] = v8;
  uint64_t v9 = *MEMORY[0x263EFE8E0];
  v26[8] = @"_$!<OtherFAX>!$_";
  v26[9] = @"_$!<Pager>!$_";
  uint64_t v10 = *MEMORY[0x263EFE8E8];
  v27[8] = v9;
  v27[9] = v10;
  uint64_t v11 = *MEMORY[0x263EFE8D8];
  v26[10] = @"_$!<Mobile>!$_";
  v26[11] = @"_$!<HomePage>!$_";
  uint64_t v12 = *MEMORY[0x263EFE908];
  v27[10] = v11;
  v27[11] = v12;
  uint64_t v13 = *MEMORY[0x263EFE480];
  v26[12] = @"_$!<Father>!$_";
  v26[13] = @"_$!<Mother>!$_";
  uint64_t v14 = *MEMORY[0x263EFE5C8];
  v27[12] = v13;
  v27[13] = v14;
  uint64_t v15 = *MEMORY[0x263EFE650];
  v26[14] = @"_$!<Parent>!$_";
  v26[15] = @"_$!<Brother>!$_";
  uint64_t v16 = *MEMORY[0x263EFE2A8];
  v27[14] = v15;
  v27[15] = v16;
  uint64_t v17 = *MEMORY[0x263EFE6C8];
  v26[16] = @"_$!<Sister>!$_";
  v26[17] = @"_$!<Child>!$_";
  uint64_t v18 = *MEMORY[0x263EFE2F8];
  v27[16] = v17;
  v27[17] = v18;
  uint64_t v19 = *MEMORY[0x263EFE4C0];
  v26[18] = @"_$!<Friend>!$_";
  v26[19] = @"_$!<Spouse>!$_";
  uint64_t v20 = *MEMORY[0x263EFE738];
  v27[18] = v19;
  v27[19] = v20;
  uint64_t v21 = *MEMORY[0x263EFE6A8];
  v26[20] = @"_$!<Partner>!$_";
  v26[21] = @"_$!<Assistant>!$_";
  uint64_t v22 = *MEMORY[0x263EFE228];
  v27[20] = v21;
  v27[21] = v22;
  v26[22] = @"_$!<Manager>!$_";
  v27[22] = *MEMORY[0x263EFE5C0];
  v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:23];
  uint64_t v24 = [(ABSConstantsMapping *)v0 initWithMapping:v23];
  v25 = (void *)ABToCNLabelConstantsMapping_s_mapping;
  ABToCNLabelConstantsMapping_s_mapping = v24;
}

+ (id)CNToABLabelConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ABSConstantsMapping_CNToABLabelConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABLabelConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABLabelConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABLabelConstantsMapping_s_mapping;

  return v2;
}

void __50__ABSConstantsMapping_CNToABLabelConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNLabelConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABLabelConstantsMapping_s_mapping;
  CNToABLabelConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNContainerTypeConstantsMapping
{
  if (ABToCNContainerTypeConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNContainerTypeConstantsMapping_onceToken, &__block_literal_global_27);
  }
  uint64_t v2 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;

  return v2;
}

uint64_t __58__ABSConstantsMapping_ABToCNContainerTypeConstantsMapping__block_invoke()
{
  void v6[3] = *MEMORY[0x263EF8340];
  v0 = [ABSConstantsMapping alloc];
  v5[0] = &unk_26C591B68;
  v5[1] = &unk_26C591B80;
  v6[0] = &unk_26C591B50;
  v6[1] = &unk_26C591B98;
  void v5[2] = &unk_26C591BC8;
  v6[2] = &unk_26C591BB0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  uint64_t v2 = [(ABSConstantsMapping *)v0 initWithMapping:v1];
  id v3 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;
  ABToCNContainerTypeConstantsMapping_s_mapping = v2;

  return [(id)ABToCNContainerTypeConstantsMapping_s_mapping setDefaultConstant:&unk_26C591B50];
}

+ (id)CNToABSourceTypeConstantsMapping
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ABSConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABSourceTypeConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABSourceTypeConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;

  return v2;
}

void __55__ABSConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ABToCNContainerTypeConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  id v3 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  CNToABSourceTypeConstantsMapping_s_mapping = v2;

  uint64_t v4 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  id v5 = [MEMORY[0x263EFF9D0] null];
  [v4 setDefaultConstant:v5];
}

- (ABSConstantsMapping)initWithMapping:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABSConstantsMapping;
  id v5 = [(ABSConstantsMapping *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mapping = v5->_mapping;
    v5->_mapping = (NSDictionary *)v6;
  }
  return v5;
}

- (id)invertedMapping
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(ABSConstantsMapping *)self mapping];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(ABSConstantsMapping *)self mapping];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        [v3 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapping:v3];

  return v12;
}

- (id)mappedConstant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ABSConstantsMapping *)self mapping];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [(ABSConstantsMapping *)self defaultConstant];

    if (v8)
    {
      id v7 = [(ABSConstantsMapping *)self defaultConstant];
    }
    else
    {
      id v7 = v4;
    }
  }
  uint64_t v9 = v7;

  return v9;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (id)defaultConstant
{
  return self->_defaultConstant;
}

- (void)setDefaultConstant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultConstant, 0);

  objc_storeStrong((id *)&self->_mapping, 0);
}

@end