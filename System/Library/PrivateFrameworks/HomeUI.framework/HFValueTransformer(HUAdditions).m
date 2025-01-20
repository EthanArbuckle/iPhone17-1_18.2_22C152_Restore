@interface HFValueTransformer(HUAdditions)
+ (id)transformerForRingSliderViewProfile:()HUAdditions rangeControlItem:;
@end

@implementation HFValueTransformer(HUAdditions)

+ (id)transformerForRingSliderViewProfile:()HUAdditions rangeControlItem:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F683E0]];

  v9 = [MEMORY[0x1E4F69678] sharedCoordinator];
  uint64_t v10 = [v9 isCelsius];

  if ([v8 mode] == 1)
  {
    v11 = (void *)MEMORY[0x1E4F69660];
    v12 = [v6 targetValueConstraints];
    v13 = [v12 validRange];
    v14 = [v11 integerTemperatureRangeWithinNumberRange:v13 representsCelsius:v10];

    v15 = (void *)MEMORY[0x1E4F69760];
    uint64_t v16 = objc_opt_class();
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke;
    v50[3] = &unk_1E638C050;
    id v51 = v5;
    id v52 = v14;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_2;
    v47[3] = &unk_1E638C078;
    id v48 = v52;
    id v49 = v51;
    v17 = v52;
    v18 = [v15 transformerForValueClass:v16 transformBlock:v50 reverseTransformBlock:v47];
  }
  else if ([v8 mode] == 2)
  {
    v19 = (void *)MEMORY[0x1E4F69660];
    v20 = [v6 maximumValueConstraints];
    v21 = [v20 validRange];
    v22 = [v19 integerTemperatureRangeWithinNumberRange:v21 representsCelsius:v10];

    v23 = (void *)MEMORY[0x1E4F69660];
    v24 = [v6 minimumValueConstraints];
    v25 = [v24 validRange];
    v26 = [v23 integerTemperatureRangeWithinNumberRange:v25 representsCelsius:v10];

    v27 = [v5 primaryValueConstraints];
    v28 = [v27 validRange];

    v29 = [v5 secondaryValueConstraints];
    v30 = [v29 validRange];

    v31 = (void *)MEMORY[0x1E4F69760];
    uint64_t v32 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_3;
    v42[3] = &unk_1E638C0A0;
    id v43 = v28;
    id v44 = v22;
    id v45 = v30;
    id v46 = v26;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __88__HFValueTransformer_HUAdditions__transformerForRingSliderViewProfile_rangeControlItem___block_invoke_4;
    v37[3] = &unk_1E638C0C8;
    id v38 = v46;
    id v39 = v45;
    id v40 = v44;
    id v41 = v43;
    id v33 = v43;
    id v34 = v44;
    id v35 = v45;
    v17 = v46;
    v18 = [v31 transformerForValueClass:v32 transformBlock:v42 reverseTransformBlock:v37];
  }
  else
  {
    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "+[HFValueTransformer(HUAdditions) transformerForRingSliderViewProfile:rangeControlItem:]";
      __int16 v55 = 2048;
      uint64_t v56 = [v8 mode];
      _os_log_debug_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEBUG, "(%s) %lu is an unsupported mode for HUQuickControlRingSliderRangeViewController. Only HFRangeControlItemModeTarget and HFRangeControlItemModeThreshold are valid. (HFTemperatureModeTarget and HFTemperatureModeThreshold are deprecated)", buf, 0x16u);
    }
    v18 = 0;
  }

  return v18;
}

@end