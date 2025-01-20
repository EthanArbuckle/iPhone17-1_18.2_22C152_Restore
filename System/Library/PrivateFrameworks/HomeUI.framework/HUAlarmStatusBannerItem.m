@interface HUAlarmStatusBannerItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUAlarmStatusBannerItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUAlarmStatusBannerItem;
  v4 = [(HUStatusBannerItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__HUAlarmStatusBannerItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1E6389290;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __55__HUAlarmStatusBannerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F68B10];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  if ([v5 BOOLValue])
  {

LABEL_4:
    objc_super v8 = (void *)MEMORY[0x1E4F7A0D8];
    id v9 = objc_alloc(MEMORY[0x1E4F69228]);
    uint64_t v28 = v4;
    v29[0] = MEMORY[0x1E4F1CC38];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    v11 = (void *)[v9 initWithResults:v10];
    v12 = [v8 futureWithResult:v11];

    goto LABEL_5;
  }
  v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68A80]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7) {
    goto LABEL_4;
  }
  v10 = (void *)[v3 mutableCopy];
  v14 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C00]];
  v15 = [*(id *)(a1 + 32) sourceItem];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v17 = @"HUBannerAlert_CO2_Description";
    uint64_t v18 = 2;
    v19 = @"Home.Banners.Status.Alarm.CarbonDioxide";
  }
  else
  {
    v20 = [*(id *)(a1 + 32) sourceItem];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if (v21)
    {
      v17 = @"HUBannerAlert_CO_Description";
      uint64_t v18 = 1;
      v19 = @"Home.Banners.Status.Alarm.CarbonMonoxide";
    }
    else
    {
      v22 = [*(id *)(a1 + 32) sourceItem];
      objc_opt_class();
      char v23 = objc_opt_isKindOfClass();

      if (v23)
      {
        uint64_t v18 = 0;
        v17 = @"HUBannerAlert_Smoke_Description";
        v19 = @"Home.Banners.Status.Alarm.Smoke";
      }
      else
      {
        v24 = [*(id *)(a1 + 32) sourceItem];
        objc_opt_class();
        char v25 = objc_opt_isKindOfClass();

        uint64_t v18 = -1;
        if ((v25 & 1) == 0)
        {
          v17 = 0;
          goto LABEL_17;
        }
        v17 = @"HUBannerAlert_Leak_Description";
        v19 = @"Home.Banners.Status.Alarm.Leak";
      }
    }
  }
  [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68928]];
LABEL_17:
  if ([(__CFString *)v17 length]) {
    [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  }
  v26 = [*(id *)(a1 + 32) _descriptionForLocalizedStringKey:v17 representedHomeKitObjects:v14 options:1];
  [v10 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  [v10 setObject:&unk_1F19B4CB8 forKeyedSubscript:@"bannerItemCategory"];
  v27 = [NSNumber numberWithInteger:v18];
  [v10 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68A28]];

  [v10 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F68948]];
  v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

LABEL_5:

  return v12;
}

@end