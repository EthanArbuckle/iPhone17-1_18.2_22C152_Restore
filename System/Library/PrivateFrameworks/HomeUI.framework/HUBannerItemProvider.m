@interface HUBannerItemProvider
+ (id)_bannerItemClasses;
+ (id)bannerItemComparator;
+ (id)sortOrderForBannerItemCategory:(unint64_t)a3;
- (HMHome)home;
- (HUBannerItemProvider)initWithHome:(id)a3;
- (HUBannerItemProvider)initWithItems:(id)a3;
- (HUCameraUpgradeOfferBannerItem)cameraUpgradeOfferBannerItem;
- (HUHomeHubMigrationBannerItem)homeHubMigrationBannerItem;
- (HUMultiUserTokenFixBannerItem)multiUserTokenFixBannerItem;
- (HUSetupBannerItem)setupBannerItem;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUBannerItemProvider

+ (id)bannerItemComparator
{
  return &__block_literal_global_106;
}

- (HUBannerItemProvider)initWithHome:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v24 = self;
  id obj = [(id)objc_opt_class() _bannerItemClasses];
  uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v6)
  {
    v8 = 0;
    v25 = 0;
    v26 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = v6;
  v8 = 0;
  v25 = 0;
  v26 = 0;
  v9 = 0;
  uint64_t v10 = *(void *)v30;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(objc_class **)(*((void *)&v29 + 1) + 8 * v11);
      v13 = (void *)[[v12 alloc] initWithHome:v4];
      [v5 addObject:v13];
      if ([(objc_class *)v12 isEqual:objc_opt_class()])
      {
        v14 = v8;
        v8 = v13;
        goto LABEL_10;
      }
      if ([(objc_class *)v12 isEqual:objc_opt_class()])
      {
        v14 = v26;
        v26 = v13;
LABEL_10:
        v15 = v9;
LABEL_11:
        id v16 = v13;

        v9 = v15;
        goto LABEL_12;
      }
      if ([(objc_class *)v12 isEqual:objc_opt_class()])
      {
        v14 = v25;
        v15 = v9;
        v25 = v13;
        goto LABEL_11;
      }
      int v17 = [(objc_class *)v12 isEqual:objc_opt_class()];
      v14 = v9;
      v15 = v13;
      if (v17) {
        goto LABEL_11;
      }
LABEL_12:

      ++v11;
    }
    while (v7 != v11);
    uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v7 = v18;
  }
  while (v18);
LABEL_21:

  v28.receiver = v24;
  v28.super_class = (Class)HUBannerItemProvider;
  v19 = [(HFStaticItemProvider *)&v28 initWithItems:v5];
  p_isa = (id *)&v19->super.super.super.isa;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_home, a3);
    objc_storeStrong(p_isa + 5, v8);
    objc_storeStrong(p_isa + 6, v26);
    objc_storeStrong(p_isa + 7, v9);
    objc_storeStrong(p_isa + 8, v25);
  }
  v21 = p_isa;

  return v21;
}

+ (id)_bannerItemClasses
{
  if (_MergedGlobals_5_0 != -1) {
    dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_76);
  }
  v2 = (void *)qword_1EBA47278;

  return v2;
}

- (HUSetupBannerItem)setupBannerItem
{
  return self->_setupBannerItem;
}

- (HUMultiUserTokenFixBannerItem)multiUserTokenFixBannerItem
{
  return self->_multiUserTokenFixBannerItem;
}

void __42__HUBannerItemProvider__bannerItemClasses__block_invoke_2()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)qword_1EBA47278;
  qword_1EBA47278 = v0;
}

+ (id)sortOrderForBannerItemCategory:(unint64_t)a3
{
  if (a3 == 2)
  {
    if (qword_1EBA472A0 == -1)
    {
      v3 = &qword_1EBA472A8;
      goto LABEL_10;
    }
    v5 = &qword_1EBA472A0;
    uint64_t v6 = &__block_literal_global_103;
LABEL_17:
    dispatch_once(v5, v6);
    v3 = v5 + 1;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (qword_1EBA47290 == -1)
    {
      v3 = &qword_1EBA47298;
      goto LABEL_10;
    }
    v5 = &qword_1EBA47290;
    uint64_t v6 = &__block_literal_global_95;
    goto LABEL_17;
  }
  if (a3) {
    goto LABEL_11;
  }
  if (qword_1EBA47280 != -1)
  {
    v5 = &qword_1EBA47280;
    uint64_t v6 = &__block_literal_global_88;
    goto LABEL_17;
  }
  v3 = &qword_1EBA47288;
LABEL_10:
  a1 = (id)*v3;
LABEL_11:

  return a1;
}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_2()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)qword_1EBA47288;
  qword_1EBA47288 = v0;
}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_4()
{
  void v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  void v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)qword_1EBA47298;
  qword_1EBA47298 = v0;
}

void __55__HUBannerItemProvider_sortOrderForBannerItemCategory___block_invoke_6()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)qword_1EBA472A8;
  qword_1EBA472A8 = v0;
}

uint64_t __44__HUBannerItemProvider_bannerItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 latestResults];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bannerItemCategory"];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = &unk_1F19B3C08;
  }
  id v10 = v9;

  uint64_t v11 = [v5 latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"bannerItemCategory"];
  v13 = (void *)v12;
  if (v12) {
    v14 = (void *)v12;
  }
  else {
    v14 = &unk_1F19B3C08;
  }
  id v15 = v14;

  uint64_t v16 = [v10 compare:v15];
  if (!v16)
  {
    int v17 = +[HUBannerItemProvider sortOrderForBannerItemCategory:](HUBannerItemProvider, "sortOrderForBannerItemCategory:", [v10 integerValue]);
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", objc_opt_class()));
    uint64_t v16 = [v18 compare:v19];
    if (!v16)
    {
      v20 = [v4 latestResults];
      uint64_t v21 = *MEMORY[0x1E4F68A28];
      uint64_t v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F68A28]];
      v23 = (void *)v22;
      v24 = &unk_1F19B3C20;
      if (v22) {
        v24 = (void *)v22;
      }
      id v38 = v24;

      v25 = [v5 latestResults];
      uint64_t v26 = [v25 objectForKeyedSubscript:v21];
      v27 = (void *)v26;
      objc_super v28 = &unk_1F19B3C20;
      if (v26) {
        objc_super v28 = (void *)v26;
      }
      id v29 = v28;

      long long v30 = v38;
      if ([v38 isEqualToNumber:v29])
      {
        long long v31 = [v4 latestResults];
        uint64_t v32 = *MEMORY[0x1E4F68C10];
        v37 = [v31 objectForKeyedSubscript:*MEMORY[0x1E4F68C10]];

        v33 = [v5 latestResults];
        [v33 objectForKeyedSubscript:v32];
        uint64_t v34 = v36 = v29;

        long long v30 = v38;
        uint64_t v16 = [v37 localizedStandardCompare:v34];

        id v29 = v36;
      }
      else
      {
        uint64_t v16 = [v29 compare:v38];
      }
    }
  }

  return v16;
}

- (HUBannerItemProvider)initWithItems:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBannerItemProvider.m", 175, @"%s is unavailable; use %@ instead",
    "-[HUBannerItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUBannerItemProvider *)self home];
  uint64_t v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (HMHome)home
{
  return self->_home;
}

- (HUCameraUpgradeOfferBannerItem)cameraUpgradeOfferBannerItem
{
  return self->_cameraUpgradeOfferBannerItem;
}

- (HUHomeHubMigrationBannerItem)homeHubMigrationBannerItem
{
  return self->_homeHubMigrationBannerItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeHubMigrationBannerItem, 0);
  objc_storeStrong((id *)&self->_setupBannerItem, 0);
  objc_storeStrong((id *)&self->_multiUserTokenFixBannerItem, 0);
  objc_storeStrong((id *)&self->_cameraUpgradeOfferBannerItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end