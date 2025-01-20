@interface CNiOSABConstantsMapping
+ (id)ABToCNContactShortNameFormatConstantsMapping;
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
+ (id)CNToABPersonShortNameFormatConstantsMapping;
+ (id)CNToABPersonSocialProfileConstantsMapping;
+ (id)CNToABPersonSortOrderingConstantsMapping;
+ (id)CNToABSourceTypeConstantsMapping;
- (CNiOSABConstantsMapping)initWithMapping:(id)a3;
- (NSDictionary)mapping;
- (id)defaultConstant;
- (id)invertedMapping;
- (id)mappedConstant:(id)a3;
- (void)setDefaultConstant:(id)a3;
- (void)setMapping:(id)a3;
@end

@implementation CNiOSABConstantsMapping

- (id)mappedConstant:(id)a3
{
  id v4 = a3;
  v5 = [(CNiOSABConstantsMapping *)self mapping];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [(CNiOSABConstantsMapping *)self defaultConstant];

    if (v8)
    {
      id v7 = [(CNiOSABConstantsMapping *)self defaultConstant];
    }
    else
    {
      id v7 = v4;
    }
  }
  v9 = v7;

  return v9;
}

- (id)defaultConstant
{
  return self->_defaultConstant;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

+ (id)CNToABPersonSortOrderingConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CNiOSABConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSortOrderingConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonSortOrderingConstantsMapping_onceToken, block);
  }
  v2 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;

  return v2;
}

uint64_t __67__CNiOSABConstantsMapping_CNToABPersonSortOrderingConstantsMapping__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) ABToCNContactSortOrderConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  v3 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;
  CNToABPersonSortOrderingConstantsMapping_s_mapping = v2;

  id v4 = (void *)CNToABPersonSortOrderingConstantsMapping_s_mapping;

  return [v4 setDefaultConstant:&unk_1EE0894E8];
}

+ (id)ABToCNContactSortOrderConstantsMapping
{
  if (ABToCNContactSortOrderConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNContactSortOrderConstantsMapping_onceToken, &__block_literal_global_15_2);
  }
  uint64_t v2 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;

  return v2;
}

uint64_t __72__CNiOSABConstantsMapping_ABtoCNContactDisplayNameOrderConstantsMapping__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1EE0894D0;
  v5[1] = &unk_1EE0894E8;
  v6[0] = &unk_1EE0894B8;
  v6[1] = &unk_1EE089500;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  uint64_t v2 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v1];
  v3 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;
  ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping = v2;

  return [(id)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping setDefaultConstant:&unk_1EE0894A0];
}

uint64_t __65__CNiOSABConstantsMapping_ABToCNContactSortOrderConstantsMapping__block_invoke()
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1EE0894D0;
  v5[1] = &unk_1EE0894E8;
  v6[0] = &unk_1EE089500;
  v6[1] = &unk_1EE089518;
  void v5[2] = &unk_1EE089530;
  v6[2] = &unk_1EE089548;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  uint64_t v2 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v1];
  v3 = (void *)ABToCNContactSortOrderConstantsMapping_s_mapping;
  ABToCNContactSortOrderConstantsMapping_s_mapping = v2;

  return [(id)ABToCNContactSortOrderConstantsMapping_s_mapping setDefaultConstant:&unk_1EE0894B8];
}

- (void)setDefaultConstant:(id)a3
{
}

- (id)invertedMapping
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CNiOSABConstantsMapping *)self mapping];
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
        v10 = [(CNiOSABConstantsMapping *)self mapping];
        v11 = [v10 objectForKeyedSubscript:v9];

        [v3 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapping:v3];

  return v12;
}

- (CNiOSABConstantsMapping)initWithMapping:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABConstantsMapping;
  uint64_t v5 = [(CNiOSABConstantsMapping *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mapping = v5->_mapping;
    v5->_mapping = (NSDictionary *)v6;
  }
  return v5;
}

+ (id)ABtoCNContactDisplayNameOrderConstantsMapping
{
  if (ABtoCNContactDisplayNameOrderConstantsMapping_onceToken != -1) {
    dispatch_once(&ABtoCNContactDisplayNameOrderConstantsMapping_onceToken, &__block_literal_global_6_8);
  }
  uint64_t v2 = (void *)ABtoCNContactDisplayNameOrderConstantsMapping_s_mapping;

  return v2;
}

+ (id)ABToCNPersonKindConstantsMapping
{
  if (ABToCNPersonKindConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonKindConstantsMapping_onceToken, &__block_literal_global_134);
  }
  uint64_t v2 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;

  return v2;
}

uint64_t __59__CNiOSABConstantsMapping_ABToCNPersonKindConstantsMapping__block_invoke()
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4F49BD0];
  v6[0] = *MEMORY[0x1E4F49BD8];
  v6[1] = v1;
  v7[0] = &unk_1EE0894A0;
  v7[1] = &unk_1EE0894B8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  uint64_t v3 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v2];
  id v4 = (void *)ABToCNPersonKindConstantsMapping_s_mapping;
  ABToCNPersonKindConstantsMapping_s_mapping = v3;

  return [(id)ABToCNPersonKindConstantsMapping_s_mapping setDefaultConstant:&unk_1EE0894A0];
}

+ (id)CNToABPersonKindConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CNiOSABConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonKindConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonKindConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonKindConstantsMapping_s_mapping;

  return v2;
}

uint64_t __59__CNiOSABConstantsMapping_CNToABPersonKindConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ABToCNPersonKindConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  uint64_t v3 = (void *)CNToABPersonKindConstantsMapping_s_mapping;
  CNToABPersonKindConstantsMapping_s_mapping = v2;

  id v4 = (void *)CNToABPersonKindConstantsMapping_s_mapping;
  uint64_t v5 = *MEMORY[0x1E4F49BD8];

  return [v4 setDefaultConstant:v5];
}

+ (id)CNToABCompositeNameFormatConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CNiOSABConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABCompositeNameFormatConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABCompositeNameFormatConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;

  return v2;
}

uint64_t __68__CNiOSABConstantsMapping_CNToABCompositeNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ABtoCNContactDisplayNameOrderConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  uint64_t v3 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;
  CNToABCompositeNameFormatConstantsMapping_s_mapping = v2;

  id v4 = (void *)CNToABCompositeNameFormatConstantsMapping_s_mapping;

  return [v4 setDefaultConstant:&unk_1EE0894E8];
}

+ (id)ABToCNPersonAddressConstantsMapping
{
  if (ABToCNPersonAddressConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonAddressConstantsMapping_onceToken, &__block_literal_global_23_1);
  }
  uint64_t v2 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;

  return v2;
}

void __62__CNiOSABConstantsMapping_ABToCNPersonAddressConstantsMapping__block_invoke()
{
  v9[8] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4F49A00];
  v8[0] = *MEMORY[0x1E4F499F0];
  v8[1] = v1;
  v9[0] = @"street";
  v9[1] = @"subLocality";
  uint64_t v2 = *MEMORY[0x1E4F499F8];
  v8[2] = *MEMORY[0x1E4F499C8];
  v8[3] = v2;
  v9[2] = @"city";
  v9[3] = @"subAdministrativeArea";
  uint64_t v3 = *MEMORY[0x1E4F49A08];
  v8[4] = *MEMORY[0x1E4F499E8];
  v8[5] = v3;
  v9[4] = @"state";
  v9[5] = @"postalCode";
  uint64_t v4 = *MEMORY[0x1E4F499D0];
  v8[6] = *MEMORY[0x1E4F499D8];
  v8[7] = v4;
  v9[6] = @"country";
  v9[7] = @"ISOCountryCode";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:8];
  uint64_t v6 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v5];
  uint64_t v7 = (void *)ABToCNPersonAddressConstantsMapping_s_mapping;
  ABToCNPersonAddressConstantsMapping_s_mapping = v6;
}

+ (id)CNToABPersonAddressConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CNiOSABConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonAddressConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonAddressConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;

  return v2;
}

void __62__CNiOSABConstantsMapping_CNToABPersonAddressConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonAddressConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonAddressConstantsMapping_s_mapping;
  CNToABPersonAddressConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNPersonInstantMessageConstantsMapping
{
  if (ABToCNPersonInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonInstantMessageConstantsMapping_onceToken, &__block_literal_global_25_0);
  }
  uint64_t v2 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __69__CNiOSABConstantsMapping_ABToCNPersonInstantMessageConstantsMapping__block_invoke()
{
  v11[12] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4F49BB0];
  v10[0] = *MEMORY[0x1E4F49B80];
  v10[1] = v1;
  v11[0] = @"service";
  v11[1] = @"username";
  uint64_t v2 = *MEMORY[0x1E4F49B78];
  v10[2] = *MEMORY[0x1E4F49BA0];
  v10[3] = v2;
  v11[2] = @"Yahoo";
  v11[3] = @"Jabber";
  uint64_t v3 = *MEMORY[0x1E4F49B70];
  v10[4] = *MEMORY[0x1E4F49B88];
  v10[5] = v3;
  v11[4] = @"MSN";
  v11[5] = @"ICQ";
  uint64_t v4 = *MEMORY[0x1E4F49B90];
  v10[6] = *MEMORY[0x1E4F49B50];
  v10[7] = v4;
  v11[6] = @"AIM";
  v11[7] = @"QQ";
  uint64_t v5 = *MEMORY[0x1E4F49B98];
  v10[8] = *MEMORY[0x1E4F49B68];
  v10[9] = v5;
  v11[8] = @"GoogleTalk";
  v11[9] = @"Skype";
  uint64_t v6 = *MEMORY[0x1E4F49B60];
  v10[10] = *MEMORY[0x1E4F49B58];
  v10[11] = v6;
  v11[10] = @"Facebook";
  v11[11] = @"GaduGadu";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:12];
  uint64_t v8 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v7];
  objc_super v9 = (void *)ABToCNPersonInstantMessageConstantsMapping_s_mapping;
  ABToCNPersonInstantMessageConstantsMapping_s_mapping = v8;
}

+ (id)CNToABPersonInstantMessageConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CNiOSABConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonInstantMessageConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __69__CNiOSABConstantsMapping_CNToABPersonInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonInstantMessageConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonInstantMessageConstantsMapping_s_mapping;
  CNToABPersonInstantMessageConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNPersonSocialProfileConstantsMapping
{
  if (ABToCNPersonSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNPersonSocialProfileConstantsMapping_onceToken, &__block_literal_global_27_1);
  }
  uint64_t v2 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __68__CNiOSABConstantsMapping_ABToCNPersonSocialProfileConstantsMapping__block_invoke()
{
  v10[11] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4F49D88];
  v9[0] = *MEMORY[0x1E4F49D78];
  v9[1] = v1;
  v10[0] = @"urlString";
  v10[1] = @"username";
  uint64_t v2 = *MEMORY[0x1E4F49D50];
  v9[2] = *MEMORY[0x1E4F49D80];
  v9[3] = v2;
  v10[2] = @"userIdentifier";
  v10[3] = @"service";
  uint64_t v3 = *MEMORY[0x1E4F49D68];
  v9[4] = *MEMORY[0x1E4F49D70];
  v9[5] = v3;
  v10[4] = @"Twitter";
  v10[5] = @"SinaWeibo";
  uint64_t v4 = *MEMORY[0x1E4F49D38];
  v9[6] = *MEMORY[0x1E4F49D48];
  v9[7] = v4;
  v10[6] = @"Game Center";
  v10[7] = @"Facebook";
  uint64_t v5 = *MEMORY[0x1E4F49D58];
  v9[8] = *MEMORY[0x1E4F49D60];
  void v9[9] = v5;
  v10[8] = @"MySpace";
  v10[9] = @"LinkedIn";
  v9[10] = *MEMORY[0x1E4F49D40];
  v10[10] = @"Flickr";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:11];
  uint64_t v7 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v6];
  uint64_t v8 = (void *)ABToCNPersonSocialProfileConstantsMapping_s_mapping;
  ABToCNPersonSocialProfileConstantsMapping_s_mapping = v7;
}

+ (id)CNToABPersonSocialProfileConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CNiOSABConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonSocialProfileConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __68__CNiOSABConstantsMapping_CNToABPersonSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNPersonSocialProfileConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABPersonSocialProfileConstantsMapping_s_mapping;
  CNToABPersonSocialProfileConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNLabelConstantsMapping
{
  if (ABToCNLabelConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNLabelConstantsMapping_onceToken, &__block_literal_global_29_1);
  }
  uint64_t v2 = (void *)ABToCNLabelConstantsMapping_s_mapping;

  return v2;
}

void __54__CNiOSABConstantsMapping_ABToCNLabelConstantsMapping__block_invoke()
{
  v20[31] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4F499B8];
  v19[0] = *MEMORY[0x1E4F49E78];
  v19[1] = v1;
  v20[0] = @"_$!<Work>!$_";
  v20[1] = @"_$!<Home>!$_";
  uint64_t v2 = *MEMORY[0x1E4F499C0];
  v19[2] = *MEMORY[0x1E4F49DE8];
  v19[3] = v2;
  v20[2] = @"_$!<School>!$_";
  v20[3] = @"_$!<Other>!$_";
  uint64_t v3 = *MEMORY[0x1E4F49CA0];
  v19[4] = *MEMORY[0x1E4F49A50];
  v19[5] = v3;
  v20[4] = @"_$!<Anniversary>!$_";
  v20[5] = @"iPhone";
  uint64_t v4 = *MEMORY[0x1E4F49CA8];
  v19[6] = *MEMORY[0x1E4F49C78];
  v19[7] = v4;
  v20[6] = @"Apple Watch";
  v20[7] = @"_$!<Main>!$_";
  uint64_t v5 = *MEMORY[0x1E4F49CD8];
  v19[8] = *MEMORY[0x1E4F49C98];
  v19[9] = v5;
  v20[8] = @"_$!<HomeFAX>!$_";
  v20[9] = @"_$!<WorkFAX>!$_";
  uint64_t v6 = *MEMORY[0x1E4F49CC0];
  v19[10] = *MEMORY[0x1E4F49CB8];
  v19[11] = v6;
  v20[10] = @"_$!<OtherFAX>!$_";
  v20[11] = @"_$!<Pager>!$_";
  uint64_t v7 = *MEMORY[0x1E4F49C80];
  v19[12] = *MEMORY[0x1E4F49CB0];
  v19[13] = v7;
  v20[12] = @"_$!<Mobile>!$_";
  v20[13] = @"_$!<AssistantPhone>!$_";
  uint64_t v8 = *MEMORY[0x1E4F49CD0];
  v19[14] = *MEMORY[0x1E4F49C88];
  v19[15] = v8;
  v20[14] = @"_$!<Car>!$_";
  v20[15] = @"_$!<Radio>!$_";
  uint64_t v9 = *MEMORY[0x1E4F49B18];
  v19[16] = *MEMORY[0x1E4F49C90];
  v19[17] = v9;
  v20[16] = @"_$!<CompanyMain>!$_";
  v20[17] = @"_$!<HomePage>!$_";
  uint64_t v10 = *MEMORY[0x1E4F49C40];
  v19[18] = *MEMORY[0x1E4F49AE8];
  v19[19] = v10;
  v20[18] = @"_$!<Father>!$_";
  v20[19] = @"_$!<Mother>!$_";
  uint64_t v11 = *MEMORY[0x1E4F49A68];
  v19[20] = *MEMORY[0x1E4F49C68];
  v19[21] = v11;
  v20[20] = @"_$!<Parent>!$_";
  v20[21] = @"_$!<Brother>!$_";
  uint64_t v12 = *MEMORY[0x1E4F49D90];
  v19[22] = *MEMORY[0x1E4F49D20];
  v19[23] = v12;
  v20[22] = @"_$!<Sister>!$_";
  v20[23] = @"_$!<Son>!$_";
  uint64_t v13 = *MEMORY[0x1E4F49A70];
  v19[24] = *MEMORY[0x1E4F49A88];
  v19[25] = v13;
  v20[24] = @"_$!<Daughter>!$_";
  v20[25] = @"_$!<Child>!$_";
  uint64_t v14 = *MEMORY[0x1E4F49DA0];
  v19[26] = *MEMORY[0x1E4F49B10];
  v19[27] = v14;
  v20[26] = @"_$!<Friend>!$_";
  v20[27] = @"_$!<Spouse>!$_";
  uint64_t v15 = *MEMORY[0x1E4F49A58];
  v19[28] = *MEMORY[0x1E4F49C70];
  v19[29] = v15;
  v20[28] = @"_$!<Partner>!$_";
  v20[29] = @"_$!<Assistant>!$_";
  v19[30] = *MEMORY[0x1E4F49C10];
  v20[30] = @"_$!<Manager>!$_";
  long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:31];
  uint64_t v17 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v16];
  v18 = (void *)ABToCNLabelConstantsMapping_s_mapping;
  ABToCNLabelConstantsMapping_s_mapping = v17;
}

+ (id)CNToABLabelConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CNiOSABConstantsMapping_CNToABLabelConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABLabelConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABLabelConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABLabelConstantsMapping_s_mapping;

  return v2;
}

void __54__CNiOSABConstantsMapping_CNToABLabelConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) ABToCNLabelConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)CNToABLabelConstantsMapping_s_mapping;
  CNToABLabelConstantsMapping_s_mapping = v1;
}

+ (id)ABToCNContainerTypeConstantsMapping
{
  if (ABToCNContainerTypeConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNContainerTypeConstantsMapping_onceToken, &__block_literal_global_31_0);
  }
  uint64_t v2 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;

  return v2;
}

uint64_t __62__CNiOSABConstantsMapping_ABToCNContainerTypeConstantsMapping__block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  v5[0] = &unk_1EE0894D0;
  v5[1] = &unk_1EE0894E8;
  v6[0] = &unk_1EE0894B8;
  v6[1] = &unk_1EE089500;
  void v5[2] = &unk_1EE089560;
  void v5[3] = &unk_1EE089590;
  void v6[2] = &unk_1EE089578;
  void v6[3] = &unk_1EE089518;
  v5[4] = &unk_1EE0895A8;
  v5[5] = &unk_1EE0895C0;
  void v6[4] = &unk_1EE089548;
  v6[5] = &unk_1EE0895D8;
  v5[6] = &unk_1EE0895F0;
  v6[6] = &unk_1EE089608;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:7];
  uint64_t v2 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v1];
  id v3 = (void *)ABToCNContainerTypeConstantsMapping_s_mapping;
  ABToCNContainerTypeConstantsMapping_s_mapping = v2;

  return [(id)ABToCNContainerTypeConstantsMapping_s_mapping setDefaultConstant:&unk_1EE0894B8];
}

+ (id)CNToABSourceTypeConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CNiOSABConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABSourceTypeConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABSourceTypeConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;

  return v2;
}

void __59__CNiOSABConstantsMapping_CNToABSourceTypeConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ABToCNContainerTypeConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  id v3 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  CNToABSourceTypeConstantsMapping_s_mapping = v2;

  uint64_t v4 = (void *)CNToABSourceTypeConstantsMapping_s_mapping;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  [v4 setDefaultConstant:v5];
}

+ (id)ABToCNContactShortNameFormatConstantsMapping
{
  if (ABToCNContactShortNameFormatConstantsMapping_onceToken != -1) {
    dispatch_once(&ABToCNContactShortNameFormatConstantsMapping_onceToken, &__block_literal_global_50_1);
  }
  uint64_t v2 = (void *)ABToCNContactShortNameFormatConstantsMapping_s_mapping;

  return v2;
}

void __71__CNiOSABConstantsMapping_ABToCNContactShortNameFormatConstantsMapping__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v0 = [CNiOSABConstantsMapping alloc];
  v4[0] = &unk_1EE0894D0;
  v4[1] = &unk_1EE0894E8;
  v5[0] = &unk_1EE0894A0;
  v5[1] = &unk_1EE0894B8;
  v4[2] = &unk_1EE089620;
  v4[3] = &unk_1EE089638;
  void v5[2] = &unk_1EE089500;
  void v5[3] = &unk_1EE089518;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  uint64_t v2 = [(CNiOSABConstantsMapping *)v0 initWithMapping:v1];
  id v3 = (void *)ABToCNContactShortNameFormatConstantsMapping_s_mapping;
  ABToCNContactShortNameFormatConstantsMapping_s_mapping = v2;
}

+ (id)CNToABPersonShortNameFormatConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CNiOSABConstantsMapping_CNToABPersonShortNameFormatConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (CNToABPersonShortNameFormatConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToABPersonShortNameFormatConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)CNToABPersonShortNameFormatConstantsMapping_s_mapping;

  return v2;
}

void __70__CNiOSABConstantsMapping_CNToABPersonShortNameFormatConstantsMapping__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) ABToCNContactShortNameFormatConstantsMapping];
  uint64_t v2 = [v1 invertedMapping];
  id v3 = (void *)CNToABPersonShortNameFormatConstantsMapping_s_mapping;
  CNToABPersonShortNameFormatConstantsMapping_s_mapping = v2;

  uint64_t v4 = (void *)CNToABPersonShortNameFormatConstantsMapping_s_mapping;
  id v5 = [MEMORY[0x1E4F1CA98] null];
  [v4 setDefaultConstant:v5];
}

- (void)setMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultConstant, 0);

  objc_storeStrong((id *)&self->_mapping, 0);
}

@end