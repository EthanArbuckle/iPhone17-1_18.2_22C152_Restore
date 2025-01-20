@interface AVTAvatarConfigurationMetric
+ (id)defaultMetric;
+ (int64_t)gapFromDistance:(unint64_t)a3;
+ (int64_t)impactForSettingKind:(id)a3;
+ (unint64_t)differenceCountFromDistance:(unint64_t)a3;
+ (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4;
+ (void)enumerateDifferencesFromConfiguration:(id)a3 toConfiguration:(id)a4 withHandler:(id)a5;
- (int64_t)gapFromDistance:(unint64_t)a3;
- (unint64_t)differenceCountFromDistance:(unint64_t)a3;
- (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4;
@end

@implementation AVTAvatarConfigurationMetric

+ (id)defaultMetric
{
  if (defaultMetric_onceToken != -1) {
    dispatch_once(&defaultMetric_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)defaultMetric_sInstance;
  return v2;
}

uint64_t __45__AVTAvatarConfigurationMetric_defaultMetric__block_invoke()
{
  v0 = objc_alloc_init(AVTAvatarConfigurationMetric);
  uint64_t v1 = defaultMetric_sInstance;
  defaultMetric_sInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__AVTAvatarConfigurationMetric_distanceFromConfiguration_toConfiguration___block_invoke;
  v10[3] = &unk_263FF2018;
  v10[4] = &v11;
  v10[5] = a1;
  [a1 enumerateDifferencesFromConfiguration:v6 toConfiguration:v7 withHandler:v10];
  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__AVTAvatarConfigurationMetric_distanceFromConfiguration_toConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "impactForSettingKind:", a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += 1 << (6 * result);
  return result;
}

+ (int64_t)gapFromDistance:(unint64_t)a3
{
  if ((a3 & 7) != 0) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = -1;
  }
  if ((a3 & 0x1C0) != 0) {
    int64_t v3 = 1;
  }
  if ((a3 & 0x7000) != 0) {
    int64_t v3 = 2;
  }
  if ((a3 & 0x1C0000) != 0) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (unint64_t)differenceCountFromDistance:(unint64_t)a3
{
  return ((a3 >> 6) & 7) + (a3 & 7) + ((a3 >> 12) & 7) + ((a3 >> 18) & 7);
}

+ (int64_t)impactForSettingKind:(id)a3
{
  v43[11] = *MEMORY[0x263EF8340];
  uint64_t v3 = AVTPresetSettingKind();
  v40 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v3, v4);
  v42[0] = v40;
  v43[0] = &unk_26BF4D4C0;
  uint64_t v5 = AVTPresetSettingKind();
  v39 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v5, v6);
  v42[1] = v39;
  v43[1] = &unk_26BF4D4C0;
  uint64_t v7 = AVTPresetSettingKind();
  v38 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v7, v8);
  v42[2] = v38;
  v43[2] = &unk_26BF4D4C0;
  uint64_t v9 = AVTPresetSettingKind();
  v37 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v9, v10);
  v42[3] = v37;
  v43[3] = &unk_26BF4D4C0;
  uint64_t v11 = AVTPresetSettingKind();
  uint64_t v13 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v11, v12);
  v42[4] = v13;
  v43[4] = &unk_26BF4D4C0;
  uint64_t v14 = AVTPresetSettingKind();
  v16 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v14, v15);
  v42[5] = v16;
  v43[5] = &unk_26BF4D4C0;
  uint64_t v17 = AVTPresetSettingKind();
  v19 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v17, v18);
  v42[6] = v19;
  v43[6] = &unk_26BF4D4C0;
  uint64_t v20 = AVTPresetSettingKind();
  v22 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v20, v21);
  v42[7] = v22;
  v43[7] = &unk_26BF4D4C0;
  uint64_t v23 = AVTPresetSettingKind();
  v25 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v23, v24);
  v42[8] = v25;
  v43[8] = &unk_26BF4D4D8;
  uint64_t v26 = AVTPresetSettingKind();
  v28 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v26, v27);
  v42[9] = v28;
  v43[9] = &unk_26BF4D4D8;
  uint64_t v29 = AVTPresetSettingKind();
  v31 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", v29, v30);
  v42[10] = v31;
  v43[10] = &unk_26BF4D4D8;
  v32 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:11];

  v33 = +[AVTAvatarSettingKindValue valueWithSettingKind:](AVTAvatarSettingKindValue, "valueWithSettingKind:", a3.var0, a3.var1);
  v34 = [v32 objectForKeyedSubscript:v33];

  if (v34) {
    int64_t v35 = [v34 integerValue];
  }
  else {
    int64_t v35 = 0;
  }

  return v35;
}

+ (void)enumerateDifferencesFromConfiguration:(id)a3 toConfiguration:(id)a4 withHandler:(id)a5
{
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 set];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__AVTAvatarConfigurationMetric_enumerateDifferencesFromConfiguration_toConfiguration_withHandler___block_invoke;
  v15[3] = &unk_263FF2040;
  id v16 = v11;
  id v17 = v7;
  id v12 = v7;
  id v13 = v11;
  uint64_t v14 = (void (**)(void, void, void))MEMORY[0x210530210](v15);
  ((void (**)(void, id, id))v14)[2](v14, v10, v9);
  ((void (**)(void, id, id))v14)[2](v14, v9, v10);
}

void __98__AVTAvatarConfigurationMetric_enumerateDifferencesFromConfiguration_toConfiguration_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [a2 configurationPresets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    unint64_t v10 = 0x263FEF000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v29 = v8;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        uint64_t v13 = [v12 settingKind];
        uint64_t v15 = objc_msgSend(v5, "configurationPresetForSettingKind:", v13, v14);
        id v16 = *(void **)(v10 + 1624);
        uint64_t v17 = [v12 settingKind];
        v19 = objc_msgSend(v16, "valueWithSettingKind:", v17, v18);
        if (([*(id *)(a1 + 32) containsObject:v19] & 1) == 0)
        {
          [*(id *)(a1 + 32) addObject:v19];
          if (([v12 isEqual:v15] & 1) == 0)
          {
            uint64_t v20 = v9;
            id v21 = v5;
            unint64_t v22 = v10;
            uint64_t v23 = v6;
            uint64_t v24 = *(void *)(a1 + 40);
            uint64_t v25 = [v12 settingKind];
            uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16);
            uint64_t v27 = v24;
            uint64_t v6 = v23;
            unint64_t v10 = v22;
            id v5 = v21;
            uint64_t v9 = v20;
            uint64_t v8 = v29;
            v26(v27, v25, v28);
          }
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
}

- (unint64_t)distanceFromConfiguration:(id)a3 toConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [(id)objc_opt_class() distanceFromConfiguration:v6 toConfiguration:v5];

  return v7;
}

- (unint64_t)differenceCountFromDistance:(unint64_t)a3
{
  uint64_t v4 = objc_opt_class();
  return [v4 differenceCountFromDistance:a3];
}

- (int64_t)gapFromDistance:(unint64_t)a3
{
  uint64_t v4 = objc_opt_class();
  return [v4 gapFromDistance:a3];
}

@end