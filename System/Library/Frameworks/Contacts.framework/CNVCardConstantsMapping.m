@interface CNVCardConstantsMapping
+ (id)CNToVCardInstantMessageConstantsMapping;
+ (id)CNToVCardSocialProfileConstantsMapping;
+ (id)vCardToCNInstantMessageConstantsMapping;
+ (id)vCardToCNSocialProfileConstantsMapping;
- (CNVCardConstantsMapping)initWithMapping:(id)a3;
- (NSDictionary)mapping;
- (id)invertedMapping;
- (id)mappedConstant:(id)a3;
- (void)setMapping:(id)a3;
@end

@implementation CNVCardConstantsMapping

+ (id)CNToVCardInstantMessageConstantsMapping
{
  if (CNToVCardInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToVCardInstantMessageConstantsMapping_onceToken, &__block_literal_global_103);
  }
  v2 = (void *)CNToVCardInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __66__CNVCardConstantsMapping_CNToVCardInstantMessageConstantsMapping__block_invoke()
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v0 = [CNVCardConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4FB89C8];
  v13[0] = @"AIM";
  v13[1] = @"Facebook";
  uint64_t v2 = *MEMORY[0x1E4FB89D0];
  v14[0] = v1;
  v14[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB89D8];
  v13[2] = @"GaduGadu";
  v13[3] = @"GoogleTalk";
  uint64_t v4 = *MEMORY[0x1E4FB89E0];
  v14[2] = v3;
  v14[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB89E8];
  v13[4] = @"ICQ";
  v13[5] = @"Jabber";
  uint64_t v6 = *MEMORY[0x1E4FB89F0];
  v14[4] = v5;
  v14[5] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB89F8];
  v13[6] = @"MSN";
  v13[7] = @"QQ";
  uint64_t v8 = *MEMORY[0x1E4FB8A00];
  v14[6] = v7;
  v14[7] = v8;
  v13[8] = @"Skype";
  v13[9] = @"Yahoo";
  uint64_t v9 = *MEMORY[0x1E4FB8A10];
  v14[8] = *MEMORY[0x1E4FB8A08];
  v14[9] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:10];
  uint64_t v11 = [(CNVCardConstantsMapping *)v0 initWithMapping:v10];
  v12 = (void *)CNToVCardInstantMessageConstantsMapping_s_mapping;
  CNToVCardInstantMessageConstantsMapping_s_mapping = v11;
}

+ (id)vCardToCNInstantMessageConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CNVCardConstantsMapping_vCardToCNInstantMessageConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (vCardToCNInstantMessageConstantsMapping_onceToken != -1) {
    dispatch_once(&vCardToCNInstantMessageConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)vCardToCNInstantMessageConstantsMapping_s_mapping;

  return v2;
}

void __66__CNVCardConstantsMapping_vCardToCNInstantMessageConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) CNToVCardInstantMessageConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)vCardToCNInstantMessageConstantsMapping_s_mapping;
  vCardToCNInstantMessageConstantsMapping_s_mapping = v1;
}

+ (id)CNToVCardSocialProfileConstantsMapping
{
  if (CNToVCardSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&CNToVCardSocialProfileConstantsMapping_onceToken, &__block_literal_global_3_1);
  }
  uint64_t v2 = (void *)CNToVCardSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __65__CNVCardConstantsMapping_CNToVCardSocialProfileConstantsMapping__block_invoke()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v0 = [CNVCardConstantsMapping alloc];
  uint64_t v1 = *MEMORY[0x1E4FB8BC0];
  v10[0] = @"Facebook";
  v10[1] = @"Flickr";
  uint64_t v2 = *MEMORY[0x1E4FB8BC8];
  v11[0] = v1;
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FB8BD0];
  v10[2] = @"LinkedIn";
  v10[3] = @"MySpace";
  uint64_t v4 = *MEMORY[0x1E4FB8BD8];
  v11[2] = v3;
  v11[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB8BE0];
  v10[4] = @"SinaWeibo";
  v10[5] = @"TencentWeibo";
  uint64_t v6 = *MEMORY[0x1E4FB89F0];
  v11[4] = v5;
  v11[5] = v6;
  v10[6] = @"Twitter";
  v11[6] = *MEMORY[0x1E4FB8BE8];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v8 = [(CNVCardConstantsMapping *)v0 initWithMapping:v7];
  uint64_t v9 = (void *)CNToVCardSocialProfileConstantsMapping_s_mapping;
  CNToVCardSocialProfileConstantsMapping_s_mapping = v8;
}

+ (id)vCardToCNSocialProfileConstantsMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CNVCardConstantsMapping_vCardToCNSocialProfileConstantsMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (vCardToCNSocialProfileConstantsMapping_onceToken != -1) {
    dispatch_once(&vCardToCNSocialProfileConstantsMapping_onceToken, block);
  }
  uint64_t v2 = (void *)vCardToCNSocialProfileConstantsMapping_s_mapping;

  return v2;
}

void __65__CNVCardConstantsMapping_vCardToCNSocialProfileConstantsMapping__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) CNToVCardSocialProfileConstantsMapping];
  uint64_t v1 = [v3 invertedMapping];
  uint64_t v2 = (void *)vCardToCNSocialProfileConstantsMapping_s_mapping;
  vCardToCNSocialProfileConstantsMapping_s_mapping = v1;
}

- (CNVCardConstantsMapping)initWithMapping:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNVCardConstantsMapping;
  uint64_t v5 = [(CNVCardConstantsMapping *)&v9 init];
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CNVCardConstantsMapping *)self mapping];
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
        v10 = [(CNVCardConstantsMapping *)self mapping];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        [v3 setObject:v9 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMapping:v3];

  return v12;
}

- (id)mappedConstant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNVCardConstantsMapping *)self mapping];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (NSDictionary)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end