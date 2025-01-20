@interface HUSecurityStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUSecurityStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUSecurityStatusBannerItem;
  v4 = [(HUStatusBannerItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUSecurityStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __58__HUSecurityStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  if ([v5 BOOLValue])
  {

LABEL_4:
    objc_super v8 = (void *)MEMORY[0x1E4F7A0D8];
    id v9 = objc_alloc(MEMORY[0x1E4F69228]);
    uint64_t v18 = v4;
    v19[0] = MEMORY[0x1E4F1CC38];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v11 = (void *)[v9 initWithResults:v10];
    v12 = v8;
    v13 = v11;
    goto LABEL_5;
  }
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68A80]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7) {
    goto LABEL_4;
  }
  v10 = (void *)[v3 mutableCopy];
  v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C00]];
  [v10 setObject:@"HFStatusTitleSecuritySystem" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  v16 = HFLocalizedString();
  [v10 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v17 = [*(id *)(a1 + 32) _descriptionForLocalizedStringKey:@"HUBannerAlert_Security_Description" representedHomeKitObjects:v11];
  [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  [v10 setObject:&unk_1F19B4D78 forKeyedSubscript:@"bannerItemCategory"];
  v12 = (void *)MEMORY[0x1E4F7A0D8];
  v13 = v10;
LABEL_5:
  v14 = [v12 futureWithResult:v13];

  return v14;
}

@end