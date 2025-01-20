unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

id AAUISortSubAchievementsByActivityType(void *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v10 = AAUILocalizedActivityTypeForAchievement(v9);
        v11 = [v3 objectForKeyedSubscript:v10];

        if (!v11)
        {
          id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v3 setObject:v12 forKeyedSubscript:v10];
        }
        v13 = [v3 objectForKeyedSubscript:v10];
        [v13 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  v14 = [v3 allKeys];
  v15 = [v14 sortedArrayUsingSelector:sel_compare_];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
        [v21 sortUsingComparator:&__block_literal_global_731];
        [v2 addObjectsFromArray:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v2;
}

id AAUIAchievementBadgeCacheKey(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  if (AAUIAchievementBadgeCacheKey_onceToken != -1) {
    dispatch_once(&AAUIAchievementBadgeCacheKey_onceToken, &__block_literal_global_367);
  }
  if ([v5 count])
  {
    uint64_t v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_370);
    uint64_t v7 = [v6 componentsJoinedByString:@"_"];

    UIRoundToScale();
    double v9 = v8;
    UIRoundToScale();
    double v11 = v10;
    id v12 = [v5 firstObject];
    uint64_t v13 = [v12 unearned] ^ 1;

    v14 = NSString;
    v15 = [NSNumber numberWithDouble:v9];
    id v16 = [NSNumber numberWithDouble:v11];
    uint64_t v17 = [NSNumber numberWithBool:v13];
    uint64_t v18 = [NSNumber numberWithUnsignedInt:a2];
    uint64_t v19 = [NSNumber numberWithUnsignedInt:a3];
    v20 = [v14 stringWithFormat:@"%@_%@_%@_%@_%@_%@", v7, v15, v16, v17, v18, v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void sub_2292964A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229296624(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

__CFString *AAUILocalizedActivityTypeForAchievement(void *a1)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 template];
  uint64_t v3 = [v2 uniqueName];
  if ([v3 containsString:@"FiftyKilometersCyclingWorkout"]) {
    goto LABEL_6;
  }
  id v4 = [v1 template];
  id v5 = [v4 uniqueName];
  if ([v5 containsString:@"FiftyMilesCyclingWorkout"])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    FILocalizedNameForIndoorAgnosticActivityType();
    double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v6 = [v1 template];
  uint64_t v7 = [v6 uniqueName];
  if ([v7 containsString:@"OneHundredKilometersCyclingWorkout"])
  {

    goto LABEL_5;
  }
  double v10 = [v1 template];
  double v11 = [v10 uniqueName];
  char v12 = [v11 containsString:@"OneHundredMilesCyclingWorkout"];

  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = [v1 template];
  v14 = [v13 uniqueName];
  if ([v14 containsString:@"WheelchairMarathonWorkout"])
  {
LABEL_21:

    goto LABEL_7;
  }
  v15 = [v1 template];
  id v16 = [v15 uniqueName];
  if ([v16 containsString:@"FastestWheelchairMarathonWorkout"])
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v17 = [v1 template];
  uint64_t v18 = [v17 uniqueName];
  if ([v18 containsString:@"WheelchairHalfMarathonWorkout"])
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v19 = [v1 template];
  v20 = [v19 uniqueName];
  if ([v20 containsString:@"FastestWheelchairHalfMarathonWorkout"])
  {
LABEL_18:

    goto LABEL_19;
  }
  v72 = v19;
  v21 = [v1 template];
  v22 = [v21 uniqueName];
  if ([v22 containsString:@"BestWheelchair10KDuration"])
  {

    uint64_t v19 = v72;
    goto LABEL_18;
  }
  v67 = v22;
  v69 = v21;
  v65 = [v1 template];
  long long v23 = [v65 uniqueName];
  if ([v23 containsString:@"TenKilometerWheelchairWorkout"])
  {
    char v24 = 1;
  }
  else
  {
    v63 = [v1 template];
    v61 = [v63 uniqueName];
    if ([v61 containsString:@"BestWheelchair5KDuration"])
    {
      char v24 = 1;
    }
    else
    {
      v59 = [v1 template];
      v57 = [v59 uniqueName];
      char v24 = [v57 containsString:@"FiveKilometerWheelchairWorkout"];
    }
  }

  if (v24) {
    goto LABEL_7;
  }
  long long v25 = [v1 template];
  long long v26 = [v25 uniqueName];
  if ([v26 containsString:@"HalfMarathonWorkout"])
  {
LABEL_39:

    goto LABEL_7;
  }
  long long v27 = [v1 template];
  long long v28 = [v27 uniqueName];
  if ([v28 containsString:@"FastestHalfMarathonWorkout"])
  {
LABEL_38:

    goto LABEL_39;
  }
  long long v29 = [v1 template];
  long long v30 = [v29 uniqueName];
  if ([v30 containsString:@"MarathonWorkout"])
  {
LABEL_37:

    goto LABEL_38;
  }
  v31 = [v1 template];
  v32 = [v31 uniqueName];
  if ([v32 containsString:@"FastestMarathonWorkout"])
  {
LABEL_36:

    goto LABEL_37;
  }
  v73 = [v1 template];
  uint64_t v33 = [v73 uniqueName];
  if ([v33 containsString:@"Best10KDuration"])
  {

    goto LABEL_36;
  }
  v70 = [v1 template];
  v68 = [v70 uniqueName];
  if ([v68 containsString:@"TenKilometerWorkout"])
  {
    char v66 = 1;
  }
  else
  {
    v64 = [v1 template];
    v62 = [v64 uniqueName];
    if ([v62 containsString:@"Best5KDuration"])
    {
      char v66 = 1;
    }
    else
    {
      v60 = [v1 template];
      v58 = [v60 uniqueName];
      char v66 = [v58 containsString:@"FiveKilometerWorkout"];
    }
  }

  if (v66) {
    goto LABEL_7;
  }
  v34 = [v1 template];
  v35 = [v34 uniqueName];
  if ([v35 containsString:@"DuathlonWorkout"]) {
    goto LABEL_55;
  }
  v36 = [v1 template];
  v37 = [v36 uniqueName];
  if ([v37 containsString:@"SprintTriathlonWorkout"])
  {
LABEL_54:

LABEL_55:
LABEL_56:
    id v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v43 = [v42 localizedStringForKey:@"TRIATHLON_ACTIVITY_TYPE" value:&stru_26DD6AF88 table:@"Localizable"];
    goto LABEL_57;
  }
  v38 = [v1 template];
  v39 = [v38 uniqueName];
  if ([v39 containsString:@"FiftyKilometerTriathlonWorkout"])
  {
LABEL_53:

    goto LABEL_54;
  }
  v40 = [v1 template];
  v41 = [v40 uniqueName];
  if ([v41 containsString:@"HalfDistanceTriathlonWorkout"])
  {

    goto LABEL_53;
  }
  v71 = [v1 template];
  v44 = [v71 uniqueName];
  char v74 = [v44 containsString:@"FullDistanceTriathlonWorkout"];

  if (v74) {
    goto LABEL_56;
  }
  v45 = [v1 template];
  v46 = [v45 uniqueName];
  int v47 = [v46 isEqualToString:@"7WorkoutWeek"];

  if (v47)
  {
    id v42 = [v1 template];
    uint64_t v43 = [v42 uniqueName];
LABEL_57:
    double v8 = (__CFString *)v43;
LABEL_58:

    goto LABEL_8;
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v42 = (id)*MEMORY[0x263F23508];
  uint64_t v48 = [v42 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v76;
    while (2)
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v76 != v50) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * i) unsignedIntegerValue];
        v52 = _HKWorkoutActivityNameForActivityType();
        if (v52)
        {
          v53 = [v1 template];
          v54 = [v53 uniqueName];
          char v55 = [v54 containsString:v52];

          if (v55)
          {
            FILocalizedNameForIndoorAgnosticActivityType();
            double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_58;
          }
        }
      }
      uint64_t v49 = [v42 countByEnumeratingWithState:&v75 objects:v79 count:16];
      if (v49) {
        continue;
      }
      break;
    }
  }

  v56 = ACHLogDefault();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
    AAUILocalizedActivityTypeForAchievement_cold_1(v1);
  }

  double v8 = &stru_26DD6AF88;
LABEL_8:

  return v8;
}

id AAUIAchievementInArrayWithUniqueName(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __AAUIAchievementInArrayWithUniqueName_block_invoke;
  v7[3] = &unk_264860E30;
  id v8 = v3;
  id v4 = v3;
  id v5 = objc_msgSend(a1, "hk_firstObjectPassingTest:", v7);

  return v5;
}

uint64_t __AAUIAchievementInArrayWithUniqueName_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 template];
  id v4 = [v3 uniqueName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t AAUICompareAchievements(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = AAUICompareAchievementsByMostRecentEarnedDate(v3, v4);
  if (!v5)
  {
    id v6 = v3;
    id v7 = v4;
    uint64_t v8 = [v6 progress];
    if (v8
      && (double v9 = (void *)v8,
          [v7 progress],
          double v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      double v11 = [v6 progress];
      char v12 = [v7 progress];
      uint64_t v5 = [v11 compare:v12];
    }
    else
    {
      uint64_t v13 = [v6 progress];
      if (v13)
      {

        uint64_t v5 = 0;
      }
      else
      {
        v14 = [v7 progress];

        if (v14) {
          uint64_t v5 = -1;
        }
        else {
          uint64_t v5 = 0;
        }
      }
    }
  }
  return v5;
}

uint64_t __AAUISortAchievementsByDisplayOrder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = [a2 template];
  id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "displayOrder"));
  uint64_t v8 = NSNumber;
  double v9 = [v5 template];

  double v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "displayOrder"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

uint64_t AAUICompareAchievementsByMostRecentEarnedDate(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if (ACHShouldUseNewAwardsSystem())
  {
    id v5 = [v4 relevantEarnedInstance];

    id v6 = [v3 relevantEarnedInstance];
  }
  else
  {
    id v7 = [v4 earnedInstances];

    id v5 = [v7 lastObject];

    uint64_t v8 = [v3 earnedInstances];

    id v6 = [v8 lastObject];
    id v3 = v8;
  }

  if (!v5 || v6)
  {
    if (v5 || !v6) {
      uint64_t v9 = [v5 compareEarnedDateWithEarnedInstance:v6];
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __AAUIGoldWorkoutAchievement_block_invoke(uint64_t a1, void *a2)
{
  return AAUIIsGoldAchievement(a2);
}

uint64_t objectdestroy_72Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void freeData(int a1, void *a2)
{
}

void __AAUIAchievementBadgeCacheKey_block_invoke()
{
  id v1 = [MEMORY[0x263F82B60] mainScreen];
  [v1 scale];
  AAUIAchievementBadgeCacheKey_scale = v0;
}

void sub_229299F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _matrix4x4_rotation(float a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  float32x2_t v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  float32x4_t v7 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  __float2 v5 = __sincosf_stret(a1);
  return COERCE_DOUBLE(__PAIR64__(vmuls_lane_f32(v5.__sinval, v7, 2)+ (float)(vmuls_lane_f32(v7.f32[0], *(float32x2_t *)v7.f32, 1) * (float)(1.0 - v5.__cosval)), COERCE_UNSIGNED_INT(vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v7, v7).f32[0]))));
}

__n128 AAUIColorVectorFromColor(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v1 = [MEMORY[0x263F825C8] blackColor];
  }
  float64_t v8 = 0.0;
  float64_t v9 = 0.0;
  uint64_t v6 = 0;
  double v7 = 0.0;
  [v1 getRed:&v9 green:&v8 blue:&v7 alpha:&v6];
  v2.f64[0] = v9;
  v2.f64[1] = v8;
  float32x2_t v5 = vcvt_f32_f64(v2);
  *(float *)v2.f64 = v7;
  unsigned __int32 v4 = LODWORD(v2.f64[0]);

  result.n128_u64[0] = (unint64_t)v5;
  result.n128_u32[2] = v4;
  return result;
}

uint64_t __AAUISilverWorkoutAchievement_block_invoke(uint64_t a1, void *a2)
{
  return AAUIIsGoldAchievement(a2) ^ 1;
}

uint64_t AAUIIsGoldAchievement(void *a1)
{
  id v1 = a1;
  float64x2_t v2 = [v1 template];
  float32x2_t v3 = [v2 uniqueName];
  if ([v3 containsString:@"Best"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    float32x2_t v5 = [v1 template];
    uint64_t v6 = [v5 uniqueName];
    if ([v6 containsString:@"Longest"])
    {
      uint64_t v4 = 1;
    }
    else
    {
      double v7 = [v1 template];
      float64_t v8 = [v7 uniqueName];
      if ([v8 containsString:@"Fastest"])
      {
        uint64_t v4 = 1;
      }
      else
      {
        float64_t v9 = [v1 template];
        double v10 = [v9 uniqueName];
        uint64_t v4 = [v10 isEqualToString:@"7WorkoutWeek"];
      }
    }
  }
  return v4;
}

void sub_22929DC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

id __AAUIAchievementBadgeCacheKey_block_invoke_2(uint64_t a1, void *a2)
{
  float64x2_t v2 = [a2 template];
  float32x2_t v3 = [v2 uniqueName];

  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_22929F5A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_22929FD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t AAUIMonthlyChallengeIsEarnable(void *a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  float32x2_t v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  uint64_t v6 = [v5 components:*MEMORY[0x263F234C0] fromDate:v4];
  double v7 = [v3 template];
  float64_t v8 = [v7 uniqueName];
  float64_t v9 = [v8 componentsSeparatedByString:@"_"];

  if ([v9 count] != 3) {
    goto LABEL_11;
  }
  uint64_t v10 = [v9 objectAtIndexedSubscript:1];
  uint64_t v11 = [v10 integerValue];

  char v12 = [v9 objectAtIndexedSubscript:2];
  uint64_t v13 = [v12 integerValue];

  if (v11 != [v6 year] || v13 != objc_msgSend(v6, "month")) {
    goto LABEL_11;
  }
  v14 = [v3 template];
  v15 = [v14 uniqueName];
  unint64_t v16 = ACHMonthlyChallengeTypeFromTemplateUniqueName();

  uint64_t v17 = 0;
  if (v16 <= 0x1C)
  {
    if (((1 << v16) & 0x5FFFE0) == 0)
    {
      if (((1 << v16) & 0x1EA0001E) != 0)
      {
        uint64_t v18 = [v3 progress];
        uint64_t v19 = [MEMORY[0x263F0A830] countUnit];
        [v18 doubleValueForUnit:v19];
        uint64_t v21 = (uint64_t)v20;

        v22 = [v3 goal];
        long long v23 = [MEMORY[0x263F0A830] countUnit];
        [v22 doubleValueForUnit:v23];
        uint64_t v25 = (uint64_t)v24;

        uint64_t v26 = [v5 rangeOfUnit:16 inUnit:8 forDate:v4];
        uint64_t v28 = v26 + v27 - [v6 day];
        if (v25 - v21 > v28)
        {
          long long v29 = ACHLogMonthlyChallenges();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
LABEL_10:

LABEL_11:
            uint64_t v17 = 0;
            goto LABEL_12;
          }
LABEL_9:
          v40 = [v3 template];
          v39 = [v40 uniqueName];
          *(_DWORD *)buf = 138413314;
          id v42 = v39;
          __int16 v43 = 2048;
          uint64_t v44 = v21;
          __int16 v45 = 2048;
          uint64_t v46 = v25;
          __int16 v47 = 2048;
          uint64_t v48 = v25 - v21;
          __int16 v49 = 2048;
          uint64_t v50 = v28;
          _os_log_impl(&dword_229290000, v29, OS_LOG_TYPE_DEFAULT, "[%@] not earnable anymore, daysEarned = %ld, daysRequired = %ld, daysLeftToEarn = %ld, numberOfDaysLeftThisMonth = %ld", buf, 0x34u);

          goto LABEL_10;
        }
      }
      else
      {
        if (v16 != 24) {
          goto LABEL_12;
        }
        v31 = [v3 progress];
        v32 = [MEMORY[0x263F0A830] countUnit];
        [v31 doubleValueForUnit:v32];
        uint64_t v21 = (uint64_t)v33;

        v34 = [v3 goal];
        v35 = [MEMORY[0x263F0A830] countUnit];
        [v34 doubleValueForUnit:v35];
        uint64_t v25 = (uint64_t)v36;

        uint64_t v37 = [v5 rangeOfUnit:16 inUnit:8 forDate:v4];
        uint64_t v28 = v37 + v38 - [v6 day];
        if (v25 - v21 > v28)
        {
          long long v29 = ACHLogMonthlyChallenges();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
    }
    uint64_t v17 = 1;
  }
LABEL_12:

  return v17;
}

__CFString *AAUILocalizedModalityForAchievement(void *a1)
{
  id v1 = a1;
  float64x2_t v2 = [v1 template];
  id v3 = [v2 uniqueName];
  id v4 = [v3 componentsSeparatedByString:@"-"];

  if ((unint64_t)[v4 count] < 2)
  {
    float64_t v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      AAUILocalizedModalityForAchievement_cold_1(v1);
    }

    double v7 = &stru_26DD6AF88;
  }
  else
  {
    float32x2_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v4 objectAtIndexedSubscript:1];
    double v7 = [v5 localizedStringForKey:v6 value:&stru_26DD6AF88 table:@"Localizable"];
  }
  return v7;
}

uint64_t AAUISortAchievementsByMostRecentEarnedDate(void *a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v3[3] = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  char v4 = a2;
  return [a1 sortUsingComparator:v3];
}

uint64_t __AAUISortAchievementsByMostRecentEarnedDate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 unearned] & 1) != 0 || (objc_msgSend(v6, "unearned"))
  {
    uint64_t v7 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 32))
    {
      float64_t v9 = v5;
      uint64_t v10 = v6;
    }
    else
    {
      float64_t v9 = v6;
      uint64_t v10 = v5;
    }
    uint64_t v7 = AAUICompareAchievementsByMostRecentEarnedDate(v9, v10);
    if (!v7)
    {
      uint64_t v11 = NSNumber;
      char v12 = [v5 template];
      uint64_t v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "displayOrder"));
      v14 = NSNumber;
      v15 = [v6 template];
      unint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "displayOrder"));
      uint64_t v7 = [v13 compare:v16];
    }
  }

  return v7;
}

void sub_2292A0AAC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

uint64_t __AAUISortSubAchievementsByModality_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = AAUILocalizedModalityForAchievement(a2);
  id v6 = AAUILocalizedModalityForAchievement(v4);

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __AAUIBadgeShapeFromName_block_invoke()
{
  uint64_t v0 = (void *)AAUIBadgeShapeFromName_shapeNameMappings;
  AAUIBadgeShapeFromName_shapeNameMappings = (uint64_t)&unk_26DD6F658;
}

uint64_t AAUIShouldUseNewTrophyCase()
{
  return 1;
}

uint64_t AAUIFormatCount()
{
  return MEMORY[0x270F0A620]();
}

uint64_t AAUIFormatOrdinal()
{
  return MEMORY[0x270F0A680]();
}

uint64_t AAUIFormatPercent()
{
  return MEMORY[0x270F0A688]();
}

uint64_t AAUIFormatDuration()
{
  return MEMORY[0x270F0A648]();
}

uint64_t AAUIFormatMinutes()
{
  return MEMORY[0x270F0A668]();
}

uint64_t AAUIFormatNumberOfDays()
{
  return MEMORY[0x270F0A678]();
}

uint64_t AAUIFormatDateWithStyle()
{
  return MEMORY[0x270F0A628]();
}

uint64_t AAUIFormatDistance()
{
  return MEMORY[0x270F0A630]();
}

uint64_t AAUIFormatDistanceWithUserUnit()
{
  return MEMORY[0x270F0A638]();
}

uint64_t AAUIFormatDistanceWithUserUnitAndUnitStyle()
{
  return MEMORY[0x270F0A640]();
}

uint64_t AAUIFormatEnergyWithUserUnit()
{
  return MEMORY[0x270F0A658]();
}

uint64_t AAUIFormatEnergyWithUserUnitAndFormatterUnit()
{
  return MEMORY[0x270F0A660]();
}

uint64_t AAUIFormatEnergyUnit()
{
  return MEMORY[0x270F0A650]();
}

uint64_t AAUIFormatMoveMinutes()
{
  return MEMORY[0x270F0A670]();
}

void sub_2292A5178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2292A551C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2292A5A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AAUITrophyCaseShouldShowPerfectWeekAchievement(void *a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = ACHStartOfFitnessWeekBeforeDateInCalendar();
  float64_t v8 = [v6 components:16 fromDate:v7 toDate:v5 options:0];

  uint64_t v9 = [v8 day];
  BOOL v10 = a3 >= 5.0;
  BOOL v11 = a3 >= 6.0;
  if (v9 != 6) {
    BOOL v11 = 0;
  }
  if (v9 != 5) {
    BOOL v10 = v11;
  }
  if (v9 == 4) {
    uint64_t v12 = a3 >= 4.0;
  }
  else {
    uint64_t v12 = v10;
  }

  return v12;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AAUIAwardsDataProvider.activate()()
{
  id v1 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x250))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v1 & *v0) + 0x258))(1);
    uint64_t v2 = (*(uint64_t (**)(void))((*v1 & *v0) + 0x270))(0);
    id v3 = *(uint64_t (**)(void))((*v1 & *v0) + 0x238);
    id v4 = (void *)((uint64_t (*)(uint64_t))v3)(v2);
    if (v4)
    {
      id v5 = v4;
      (*(void (**)(void))((*v1 & *v4) + 0x68))();
    }
    id v6 = (void *)v3();
    if (v6)
    {
      uint64_t v7 = v6;
      (*(void (**)(void))((*v1 & *v6) + 0x60))();
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AAUIAwardsDataProvider.activate(isFitnessPlusSubscriber:)(Swift::Bool isFitnessPlusSubscriber)
{
  id v3 = (void *)MEMORY[0x263F8EED0];
  if (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x250))() & 1) == 0)
  {
    (*(void (**)(uint64_t))((*v3 & *v1) + 0x258))(1);
    uint64_t v4 = (*(uint64_t (**)(Swift::Bool))((*v3 & *v1) + 0x270))(isFitnessPlusSubscriber);
    id v5 = *(uint64_t (**)(void))((*v3 & *v1) + 0x238);
    id v6 = (void *)((uint64_t (*)(uint64_t))v5)(v4);
    if (v6)
    {
      uint64_t v7 = v6;
      (*(void (**)(void))((*v3 & *v6) + 0x68))();
    }
    float64_t v8 = (void *)v5();
    if (v8)
    {
      uint64_t v9 = v8;
      (*(void (**)(void))((*v3 & *v8) + 0x60))();
    }
  }
}

void AAUIAwardsDataProvider.add(observer:)(uint64_t a1, uint64_t a2)
{
}

void AAUIAwardsDataProvider.remove(observer:)(uint64_t a1, uint64_t a2)
{
}

void sub_2292A9EEC(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  objc_msgSend(*(id *)(v6 + 16), *a3, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
}

Swift::Int __swiftcall AAUIAwardsDataProvider.achievementCount(forSection:)(ActivityAchievementsUI::AAUIAwardsDataProviderSection forSection)
{
  char v2 = *(unsigned char *)forSection;
  Swift::Int v12 = 0;
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = &v12;
  *(void *)(v4 + 32) = v1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2292AA100;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2292AA38C;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  Swift::Int result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    Swift::Int v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t sub_2292AA0C8()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_2292AA100()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 16);
  char v2 = *(uint64_t **)(v0 + 24);
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 32)) + 0x1D8))();
  uint64_t v4 = *(void *)(v3 + 16);
  if (v1)
  {
    if (v4)
    {
      unint64_t v5 = sub_2292AC8D4(v1);
      if (v6)
      {
        unint64_t v7 = *(void *)(*(void *)(v3 + 56) + 8 * v5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        uint64_t v18 = MEMORY[0x263F8EE78];
        if (v7 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_2292CC638();
          swift_bridgeObjectRelease();
          if (v8) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v8)
          {
LABEL_6:
            if (v8 >= 1)
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if ((v7 & 0xC000000000000001) != 0) {
                  id v10 = (id)MEMORY[0x22A6B4140](i, v7);
                }
                else {
                  id v10 = *(id *)(v7 + 8 * i + 32);
                }
                BOOL v11 = v10;
                if (objc_msgSend(v10, sel_unearned))
                {
                }
                else
                {
                  sub_2292CC5B8();
                  sub_2292CC5E8();
                  sub_2292CC5F8();
                  sub_2292CC5C8();
                }
              }
              swift_bridgeObjectRelease();
              uint64_t v17 = v18;
              if (v18 < 0) {
                goto LABEL_27;
              }
LABEL_24:
              if ((v17 & 0x4000000000000000) == 0)
              {
                uint64_t v15 = *(void *)(v17 + 16);
                uint64_t result = swift_release();
                goto LABEL_26;
              }
LABEL_27:
              swift_bridgeObjectRetain();
              uint64_t v15 = sub_2292CC638();
              uint64_t result = swift_release_n();
              goto LABEL_26;
            }
            __break(1u);
LABEL_29:
            swift_bridgeObjectRetain();
            uint64_t v15 = sub_2292CC638();
            uint64_t result = swift_bridgeObjectRelease_n();
            goto LABEL_26;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v17 = MEMORY[0x263F8EE78];
        if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
          goto LABEL_27;
        }
        goto LABEL_24;
      }
    }
    goto LABEL_19;
  }
  if (!v4 || (unint64_t v12 = sub_2292AC8D4(0), (v13 & 1) == 0))
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v15 = 0;
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(*(void *)(v3 + 56) + 8 * v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v14 >> 62) {
    goto LABEL_29;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRelease();
LABEL_26:
  *char v2 = v15;
  return result;
}

uint64_t sub_2292AA37C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292AA38C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2292AA3B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t AAUIAwardsDataProvider.topThreeAchievements()()
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = &v10;
  *(void *)(v2 + 24) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_2292AA584;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_13;
  uint64_t v4 = _Block_copy(aBlock);
  unint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v10;
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_2292AA54C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292AA584()
{
  uint64_t v1 = *(void **)(v0 + 16);
  *uint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 24)) + 0x1C0))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292AA5FC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AAUIAwardsDataProvider.topAchievement(forSection:)(char *a1)
{
  char v2 = *a1;
  uint64_t v12 = 0;
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = v2;
  *(void *)(v4 + 32) = &v12;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2292AAD50;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_23;
  char v6 = _Block_copy(aBlock);
  unint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

void sub_2292AA780(void *a1, uint64_t a2, void **a3)
{
  unint64_t v5 = (unint64_t)a1;
  char v6 = (char **)MEMORY[0x263F8EED0];
  unint64_t v7 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x1F0);
  uint64_t v8 = v7();
  if (*(void *)(v8 + 16))
  {
    unint64_t v9 = sub_2292AC8D4(a2);
    if (v10)
    {
      unint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v11 >> 62) {
        goto LABEL_51;
      }
      if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_5;
      }
    }
  }
  while (2)
  {
    uint64_t v15 = swift_bridgeObjectRelease();
    char v6 = *(char ***)(((unint64_t)*v6 & *(void *)v5) + 0x1D8);
    uint64_t v16 = ((uint64_t (*)(uint64_t))v6)(v15);
    if (*(void *)(v16 + 16))
    {
      unint64_t v17 = sub_2292AC8D4(a2);
      if (v18)
      {
        unint64_t v11 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v11 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v46 = sub_2292CC638();
          swift_bridgeObjectRelease();
          if (v46) {
            goto LABEL_15;
          }
        }
        else if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_15:
          if ((v11 & 0xC000000000000001) != 0) {
            goto LABEL_57;
          }
          if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v19 = *(id *)(v11 + 32);
            goto LABEL_18;
          }
          __break(1u);
          return;
        }
      }
    }
    swift_bridgeObjectRelease();
    id v20 = 0;
LABEL_20:
    uint64_t v21 = *a3;
    *a3 = v20;

    sub_2292ABC1C();
    sub_2292CC3A8();
    sub_2292CC3A8();
    if (v52 == v50 && v53 == v51)
    {
      uint64_t v22 = swift_bridgeObjectRelease_n();
    }
    else
    {
      char v23 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
      uint64_t v22 = swift_bridgeObjectRelease();
      if ((v23 & 1) == 0) {
        return;
      }
    }
    uint64_t v24 = ((uint64_t (*)(uint64_t))v7)(v22);
    unint64_t v11 = (unint64_t)sub_2292AC9B8(v24);
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void *)(v11 + 16);
    if (!v25)
    {
      uint64_t v26 = (char *)MEMORY[0x263F8EE78];
LABEL_44:
      uint64_t v36 = swift_release();
      uint64_t v37 = ((uint64_t (*)(uint64_t))v6)(v36);
      if (*(void *)(v37 + 16) && (unint64_t v38 = sub_2292AC8D4(a2), (v39 & 1) != 0))
      {
        v40 = a3;
        unint64_t v41 = *(void *)(*(void *)(v37 + 56) + 8 * v38);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2292AD584(v41, v26);
        __int16 v43 = v42;
        a3 = v40;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __int16 v43 = 0;
      }
      uint64_t v44 = *a3;
      *a3 = v43;

      return;
    }
    __int16 v47 = v6;
    unsigned int v48 = a2;
    __int16 v49 = a3;
    swift_retain();
    a2 = 0;
    uint64_t v26 = (char *)MEMORY[0x263F8EE78];
    char v6 = &selRef_setNeedsDisplay;
    a3 = (void **)&selRef_setNeedsDisplay;
    while (1)
    {
      unint64_t v27 = *(void *)(v11 + 8 * a2 + 32);
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v7 = (uint64_t (*)(void))sub_2292CC638();
        if (!v7) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v7 = *(uint64_t (**)(void))((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v7) {
          goto LABEL_26;
        }
      }
      if ((v27 & 0xC000000000000001) == 0) {
        break;
      }
      id v28 = (id)MEMORY[0x22A6B4140](0, v27);
LABEL_33:
      long long v29 = v28;
      id v30 = objc_msgSend(v28, sel_template);

      unint64_t v5 = (unint64_t)objc_msgSend(v30, sel_uniqueName);
      if (v5)
      {
        uint64_t v31 = sub_2292CC308();
        uint64_t v33 = v32;
        swift_bridgeObjectRelease();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v26 = sub_2292AD284(0, *((void *)v26 + 2) + 1, 1, v26);
        }
        unint64_t v5 = *((void *)v26 + 2);
        unint64_t v34 = *((void *)v26 + 3);
        if (v5 >= v34 >> 1) {
          uint64_t v26 = sub_2292AD284((char *)(v34 > 1), v5 + 1, 1, v26);
        }
        *((void *)v26 + 2) = v5 + 1;
        v35 = &v26[16 * v5];
        *((void *)v35 + 4) = v31;
        *((void *)v35 + 5) = v33;
        goto LABEL_27;
      }
LABEL_26:
      swift_bridgeObjectRelease();
LABEL_27:
      if (v25 == ++a2)
      {
        swift_release();
        a3 = v49;
        a2 = v48;
        char v6 = v47;
        goto LABEL_44;
      }
    }
    if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v28 = *(id *)(v27 + 32);
      goto LABEL_33;
    }
    __break(1u);
LABEL_51:
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (!v45) {
      continue;
    }
    break;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) == 0)
  {
    if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v12 = *(id *)(v11 + 32);
      goto LABEL_8;
    }
    __break(1u);
LABEL_57:
    id v19 = (id)MEMORY[0x22A6B4140](0, v11);
LABEL_18:
    id v20 = v19;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  id v12 = (id)MEMORY[0x22A6B4140](0, v11);
LABEL_8:
  id v13 = v12;
  swift_bridgeObjectRelease();
  unint64_t v14 = *a3;
  *a3 = v13;
}

uint64_t sub_2292AAD18()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2292AAD50()
{
  sub_2292AA780(*(void **)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void ***)(v0 + 32));
}

uint64_t sub_2292AAD60()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AAUIAwardsDataProvider.achievementStack(forSection:)(unsigned __int8 *a1)
{
  unsigned int v52 = *a1;
  LOBYTE(v53) = 7;
  char v2 = &OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue;
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = &v53;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2292ABBAC;
  *(void *)(v5 + 24) = v4;
  v61 = sub_2292AD970;
  v62 = (uint64_t *)v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v58 = 1107296256;
  v59 = sub_2292AA3B4;
  v60 = &block_descriptor_33;
  char v6 = _Block_copy(&aBlock);
  unint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  int v9 = v53;
  swift_release();
  uint64_t v10 = *(uint64_t *)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode);
  if (v10 == 1)
  {
    char v11 = 1;
    uint64_t v12 = 3;
    uint64_t v13 = v52;
  }
  else
  {
    uint64_t v13 = v52;
    if (v10) {
      goto LABEL_49;
    }
    LOBYTE(aBlock) = v52;
    if (v9 == 7 || (LOBYTE(v53) = v9, sub_2292ABC70(), (sub_2292CC2E8() & 1) == 0))
    {
      char v11 = 0;
      uint64_t v12 = 3;
    }
    else
    {
      char v11 = 0;
      uint64_t v12 = 5;
    }
  }
  LOBYTE(v63) = v13;
  char v56 = 0;
  sub_2292ABC1C();
  sub_2292CC3A8();
  sub_2292CC3A8();
  uint64_t v50 = v12;
  if ((void *)aBlock == v53 && v58 == v54) {
    char v51 = 1;
  }
  else {
    char v51 = sub_2292CC6F8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v63 = MEMORY[0x263F8EE78];
  uint64_t v53 = 0;
  unint64_t v14 = *(NSObject **)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  *(unsigned char *)(v15 + 24) = v13;
  *(void *)(v15 + 32) = &v53;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_2292AD9C8;
  *(void *)(v16 + 24) = v15;
  v61 = sub_2292AD970;
  v62 = (uint64_t *)v16;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v58 = 1107296256;
  v59 = sub_2292AA3B4;
  v60 = &block_descriptor_95;
  uint64_t v17 = v13;
  char v18 = _Block_copy(&aBlock);
  char v2 = v62;
  id v19 = v7;
  swift_retain();
  swift_release();
  unint64_t v7 = v14;
  dispatch_sync(v14, v18);
  _Block_release(v18);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v18) {
    goto LABEL_41;
  }
  id v20 = v53;
  swift_release();
  char v56 = v17;
  char v55 = 0;
  sub_2292CC3A8();
  sub_2292CC3A8();
  uint64_t v21 = v17;
  if ((void *)aBlock == v53 && v58 == v54)
  {
    uint64_t v22 = swift_bridgeObjectRelease_n();
    uint64_t v23 = v50;
    char v24 = v51;
    uint64_t v25 = v7;
  }
  else
  {
    char v26 = sub_2292CC6F8();
    swift_bridgeObjectRelease();
    uint64_t v22 = swift_bridgeObjectRelease();
    uint64_t v23 = v50;
    char v24 = v51;
    uint64_t v25 = v7;
    if ((v26 & 1) == 0)
    {
      unint64_t v7 = v19;
      uint64_t v27 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v19->isa) + 0x1F0))(v22);
      if (!*(void *)(v27 + 16)) {
        goto LABEL_24;
      }
      unint64_t v28 = sub_2292AC8D4(v21);
      if ((v30 & 1) == 0) {
        goto LABEL_24;
      }
LABEL_23:
      uint64_t v31 = v25;
      uint64_t v32 = *(void *)(*(void *)(v27 + 56) + 8 * v28);
      swift_bridgeObjectRetain();
      goto LABEL_25;
    }
  }
  unint64_t v7 = v19;
  uint64_t v27 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v19->isa) + 0x1D8))(v22);
  if (*(void *)(v27 + 16))
  {
    unint64_t v28 = sub_2292AC8D4(0);
    if (v29) {
      goto LABEL_23;
    }
  }
LABEL_24:
  uint64_t v31 = v25;
  uint64_t v32 = 0;
LABEL_25:
  swift_bridgeObjectRelease();
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = &v63;
  *(void *)(v33 + 24) = v32;
  *(unsigned char *)(v33 + 32) = v11;
  *(void *)(v33 + 40) = v20;
  *(unsigned char *)(v33 + 48) = v24 & 1;
  *(void *)(v33 + 56) = v23;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_2292ACE88;
  *(void *)(v34 + 24) = v33;
  v61 = sub_2292AD970;
  v62 = (uint64_t *)v34;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v58 = 1107296256;
  v59 = sub_2292AA3B4;
  v60 = &block_descriptor_105;
  v35 = _Block_copy(&aBlock);
  char v2 = v20;
  swift_retain();
  swift_release();
  dispatch_sync(v31, v35);
  _Block_release(v35);
  char v36 = swift_isEscapingClosureAtFileLocation();
  uint64_t v37 = swift_release();
  if (v36)
  {
LABEL_42:
    __break(1u);
LABEL_43:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2292CC638();
    uint64_t v37 = swift_bridgeObjectRelease();
    uint64_t v38 = v52;
    if (v10) {
      goto LABEL_38;
    }
    goto LABEL_28;
  }
  if (v63 >> 62) {
    goto LABEL_43;
  }
  uint64_t v10 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v38 = v52;
  if (v10)
  {
LABEL_38:

    goto LABEL_39;
  }
LABEL_28:
  if (*(Class *)((char *)&v7->isa + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode) != (Class)1) {
    goto LABEL_38;
  }
  uint64_t v39 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)v7->isa) + 0x1D8))(v37);
  if (!*(void *)(v39 + 16)) {
    goto LABEL_37;
  }
  unint64_t v40 = sub_2292AC8D4(v38);
  if ((v41 & 1) == 0) {
    goto LABEL_37;
  }
  unint64_t v42 = *(void *)(*(void *)(v39 + 56) + 8 * v40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v42 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (v49) {
      goto LABEL_33;
    }
    goto LABEL_37;
  }
  if (!*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
LABEL_33:
  if ((v42 & 0xC000000000000001) != 0)
  {
    id v43 = (id)MEMORY[0x22A6B4140](0, v42);
    goto LABEL_36;
  }
  if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v43 = *(id *)(v42 + 32);
LABEL_36:
    id v44 = v43;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
    uint64_t v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_2292CEF00;
    *(void *)(v45 + 32) = v44;
    uint64_t aBlock = v45;
    sub_2292CC3F8();
    uint64_t v46 = aBlock;

    unint64_t v63 = v46;
    swift_bridgeObjectRelease();
LABEL_39:
    unint64_t v47 = v63;
    swift_release();
    return v47;
  }
  __break(1u);
LABEL_49:
  uint64_t aBlock = 0;
  unint64_t v58 = 0xE000000000000000;
  sub_2292CC558();
  sub_2292CC358();
  uint64_t v53 = (void *)v10;
  type metadata accessor for AAUIAchievementsDataProviderLayoutMode();
  sub_2292CC608();
  uint64_t result = sub_2292CC628();
  __break(1u);
  return result;
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProvider.mostRecentSection()()
{
  char v2 = v0;
  char v12 = 7;
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(void *)(v4 + 24) = &v12;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2292AD974;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_44;
  char v6 = _Block_copy(aBlock);
  unint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result.value = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    char v10 = v12;
    result.value = swift_release();
    *char v2 = v10;
  }
  return result;
}

uint64_t AAUIAwardsDataProvider.achievements(forSection:)(char *a1)
{
  char v2 = *a1;
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v3 = *(NSObject **)&v1[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = &v12;
  *(void *)(v4 + 24) = v1;
  *(unsigned char *)(v4 + 32) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_2292ABD0C;
  *(void *)(v5 + 24) = v4;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_54;
  char v6 = _Block_copy(aBlock);
  unint64_t v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

uint64_t AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  char v6 = (void *)swift_allocObject();
  v6[2] = &v14;
  v6[3] = v2;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2292ABE1C;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_64;
  uint64_t v8 = _Block_copy(aBlock);
  int v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = v14;
    swift_release();
    return v12;
  }
  return result;
}

uint64_t sub_2292ABACC(void *a1, unsigned char *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a1) + 0x220);
  unint64_t v4 = *(void *)(v3() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 >= 2)
  {
    uint64_t result = ((uint64_t (*)(uint64_t))v3)(result);
    if (*(void *)(result + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      char v6 = *(unsigned char *)(result + 33);
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = v6;
    }
  }
  return result;
}

uint64_t sub_2292ABB74()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292ABBAC()
{
  return sub_2292ABACC(*(void **)(v0 + 16), *(unsigned char **)(v0 + 24));
}

uint64_t sub_2292ABBB4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void type metadata accessor for AAUIAchievementsDataProviderLayoutMode()
{
  if (!qword_26830F9A8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26830F9A8);
    }
  }
}

unint64_t sub_2292ABC1C()
{
  unint64_t result = qword_26AF36A08;
  if (!qword_26AF36A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF36A08);
  }
  return result;
}

unint64_t sub_2292ABC70()
{
  unint64_t result = qword_26AF36A00;
  if (!qword_26AF36A00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF36A00);
  }
  return result;
}

uint64_t sub_2292ABCC4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292ABCD4()
{
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_2292ABD0C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v3 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 24)) + 0x1D8))();
  if (*(void *)(v3 + 16) && (unint64_t v4 = sub_2292AC8D4(v2), (v5 & 1) != 0))
  {
    uint64_t v6 = *(void *)(*(void *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  *uint64_t v1 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292ABDCC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292ABDDC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2292ABE1C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  unint64_t v4 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 24)) + 0x208);
  uint64_t v5 = swift_bridgeObjectRetain();
  uint64_t v6 = v4(v5);
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_2292AC940(v3, v2), (v8 & 1) != 0))
  {
    uint64_t v9 = *(void *)(*(void *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *uint64_t v1 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292ABF00()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProvider.sections(atIndex:)(Swift::Int atIndex)
{
  unint64_t v4 = v1;
  char v14 = 7;
  uint64_t v5 = *(NSObject **)&v2[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = atIndex;
  v6[4] = &v14;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2292AC090;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_74;
  char v8 = _Block_copy(aBlock);
  uint64_t v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result.value = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    char v12 = v14;
    result.value = swift_release();
    *unint64_t v4 = v12;
  }
  return result;
}

uint64_t sub_2292AC090()
{
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(unsigned char **)(v0 + 32);
  uint64_t v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x220);
  uint64_t v4 = *(void *)(v3() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v4 > (uint64_t)v2)
  {
    uint64_t result = ((uint64_t (*)(uint64_t))v3)(result);
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(result + 16) > v2)
    {
      char v6 = *(unsigned char *)(result + v2 + 32);
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v1 = v6;
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2292AC148()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AAUIAwardsDataProvider.otherSections()()
{
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v1 = *(NSObject **)&v0[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue];
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  *(void *)(v2 + 24) = &v10;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_2292AC2C8;
  *(void *)(v3 + 24) = v2;
  aBlock[4] = sub_2292AD970;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292AA3B4;
  aBlock[3] = &block_descriptor_84;
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = v10;
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_2292AC2C8()
{
  uint64_t v1 = *(uint64_t **)(v0 + 24);
  uint64_t v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **(void **)(v0 + 16)) + 0x220);
  unint64_t v3 = *(void *)(v2() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 < 3) {
    return result;
  }
  uint64_t v5 = ((uint64_t (*)(uint64_t))v2)(result);
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 < 2)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = (uint64_t (*)(void))v5;
    sub_2292CC708();
    swift_unknownObjectRetain_n();
    uint64_t v7 = swift_dynamicCastClass();
    if (!v7)
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = MEMORY[0x263F8EE78];
    }
    uint64_t v8 = *(void *)(v7 + 16);
    swift_release();
    if (v8 == v6 - 2)
    {
      uint64_t v9 = swift_dynamicCastClass();
      if (!v9)
      {
        swift_bridgeObjectRelease();
        uint64_t v9 = MEMORY[0x263F8EE78];
      }
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRelease();
  sub_2292ACB80((uint64_t)v2, (uint64_t)v2 + 32, 2, (2 * v6) | 1);
  uint64_t v9 = v10;
LABEL_8:
  swift_bridgeObjectRelease();
  *uint64_t v1 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292AC434()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t AAUIAwardsDataProvider.shouldShowProgressBar(for:)(void *a1)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_unearned);
  if (result)
  {
    id v4 = objc_msgSend(a1, sel_goal);

    if (v4 && (id v5 = objc_msgSend(a1, sel_progress), v5, v5))
    {
      if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x280))()) {
        return objc_msgSend(a1, sel_isRingsBased) ^ 1;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_2292AC528()
{
}

void sub_2292AC54C(Swift::Bool a1)
{
}

void sub_2292AC570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2292AC57C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2292AC588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8 = *(void *)(*v5 + OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  objc_msgSend(*(id *)(v8 + 16), *a5, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
}

uint64_t sub_2292AC5F8()
{
  return AAUIAwardsDataProvider.topThreeAchievements()();
}

Swift::Int sub_2292AC61C(ActivityAchievementsUI::AAUIAwardsDataProviderSection a1)
{
  return AAUIAwardsDataProvider.achievementCount(forSection:)(a1);
}

uint64_t sub_2292AC640(char *a1)
{
  return AAUIAwardsDataProvider.topAchievement(forSection:)(a1);
}

uint64_t sub_2292AC664(unsigned __int8 *a1)
{
  return AAUIAwardsDataProvider.achievementStack(forSection:)(a1);
}

uint64_t sub_2292AC688(char *a1)
{
  return AAUIAwardsDataProvider.achievements(forSection:)(a1);
}

uint64_t sub_2292AC6AC(uint64_t a1, uint64_t a2)
{
  return AAUIAwardsDataProvider.achievements(forWorkoutIdentifier:)(a1, a2);
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_2292AC6D0()
{
  return AAUIAwardsDataProvider.mostRecentSection()();
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_2292AC6F4(Swift::Int a1)
{
  return AAUIAwardsDataProvider.sections(atIndex:)(a1);
}

uint64_t sub_2292AC718()
{
  return AAUIAwardsDataProvider.otherSections()();
}

uint64_t sub_2292AC73C(void *a1)
{
  return AAUIAwardsDataProvider.shouldShowProgressBar(for:)(a1) & 1;
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.activate(isFitnessPlusSubscriber:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.add(observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.remove(observer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topThreeAchievements()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementCount(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.topAchievement(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievementStack(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forSection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.achievements(forWorkoutIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.mostRecentSection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.sections(atIndex:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.otherSections()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviding.shouldShowProgressBar(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of AAUIAwardsDataProviderObserver.didUpdate(updatedAchievements:deletedAchievements:updatedSections:deletedSections:sectionOrderChanged:topAchievementsChanged:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 8))();
}

void *sub_2292AC8B8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_2292AC8C8(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_2292AC8D4(uint64_t a1)
{
  sub_2292ACDE4();
  uint64_t v2 = sub_2292CC2B8();
  return sub_2292ACC38(a1, v2);
}

unint64_t sub_2292AC940(uint64_t a1, uint64_t a2)
{
  sub_2292CC748();
  sub_2292CC338();
  uint64_t v4 = sub_2292CC758();
  return sub_2292ACD00(a1, a2, v4);
}

void *sub_2292AC9B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AB0);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_2292AD388((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2292AD968();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void sub_2292ACAA0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        sub_2292AD928();
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
      uint64_t v7 = (void *)swift_allocObject();
      int64_t v8 = _swift_stdlib_malloc_size(v7);
      uint64_t v9 = v8 - 32;
      if (v8 < 32) {
        uint64_t v9 = v8 - 25;
      }
      v7[2] = v5;
      v7[3] = (2 * (v9 >> 3)) | 1;
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_2292ACB80(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_9:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      int64_t v8 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A98);
      int64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3)
      {
LABEL_5:
        memcpy(v8 + 4, (const void *)(a2 + a3), v5);
        return;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
}

unint64_t sub_2292ACC38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    sub_2292ABC70();
    do
    {
      if (sub_2292CC2E8()) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2292ACD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2292CC6F8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2292CC6F8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2292ACDE4()
{
  unint64_t result = qword_26AF369F8;
  if (!qword_26AF369F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF369F8);
  }
  return result;
}

uint64_t sub_2292ACE38()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292ACE48()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2292ACE88()
{
  uint64_t v38 = *(uint64_t **)(v0 + 16);
  uint64_t v1 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  uint64_t v3 = *(unsigned __int8 *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  if (*(void *)(v0 + 24)) {
    unint64_t v5 = *(void *)(v0 + 24);
  }
  else {
    unint64_t v5 = MEMORY[0x263F8EE78];
  }
  unint64_t v44 = MEMORY[0x263F8EE78];
  if (v5 >> 62) {
    goto LABEL_39;
  }
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v6)
  {
    while (1)
    {
      uint64_t v37 = v4;
      uint64_t v42 = v5 & 0xFFFFFFFFFFFFFF8;
      unint64_t v43 = v5 & 0xC000000000000001;
      uint64_t v7 = 4;
      uint64_t v39 = v6;
      unint64_t v40 = v2;
      while (1)
      {
        unint64_t v8 = v7 - 4;
        if (!v43) {
          break;
        }
        id v9 = (id)MEMORY[0x22A6B4140](v7 - 4, v5);
LABEL_12:
        uint64_t v10 = v9;
        uint64_t v4 = v7 - 3;
        if (__OFADD__(v8, 1)) {
          goto LABEL_38;
        }
        if (v1) {
          goto LABEL_30;
        }
        id v11 = objc_msgSend(v9, sel_template);
        id v12 = objc_msgSend(v11, sel_uniqueName);

        if (v12)
        {
          uint64_t v13 = sub_2292CC308();
          uint64_t v15 = v14;

          if (!v2) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v15 = 0;
          if (!v2)
          {
LABEL_19:
            uint64_t v22 = 0;
            if (!v15) {
              goto LABEL_20;
            }
            goto LABEL_24;
          }
        }
        uint64_t v41 = v13;
        unint64_t v16 = v5;
        uint64_t v17 = v3;
        uint64_t v18 = v1;
        id v19 = objc_msgSend(v2, sel_template, v37);
        id v20 = objc_msgSend(v19, sel_uniqueName);

        if (v20)
        {
          uint64_t v2 = (void *)sub_2292CC308();
          uint64_t v22 = v21;
        }
        else
        {
          uint64_t v2 = 0;
          uint64_t v22 = 0;
        }
        uint64_t v1 = v18;
        uint64_t v3 = v17;
        unint64_t v5 = v16;
        uint64_t v13 = v41;
        if (!v15)
        {
LABEL_20:
          if (!v22) {
            goto LABEL_28;
          }
LABEL_29:
          swift_bridgeObjectRelease();
          uint64_t v6 = v39;
          uint64_t v2 = v40;
          goto LABEL_30;
        }
LABEL_24:
        if (!v22) {
          goto LABEL_29;
        }
        if ((void *)v13 == v2 && v15 == v22)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_28:

          uint64_t v6 = v39;
          uint64_t v2 = v40;
          goto LABEL_8;
        }
        char v23 = sub_2292CC6F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v6 = v39;
        uint64_t v2 = v40;
        if (v23) {
          goto LABEL_32;
        }
LABEL_30:
        if ((v3 & 1) == 0 && objc_msgSend(v10, sel_unearned))
        {
LABEL_32:

          goto LABEL_8;
        }
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        sub_2292CC5C8();
LABEL_8:
        ++v7;
        if (v4 == v6)
        {
          unint64_t v24 = v44;
          uint64_t v4 = v37;
          goto LABEL_41;
        }
      }
      if (v8 < *(void *)(v42 + 16)) {
        break;
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_2292CC638();
      swift_bridgeObjectRelease();
      if (!v6) {
        goto LABEL_40;
      }
    }
    id v9 = *(id *)(v5 + 8 * v7);
    goto LABEL_12;
  }
LABEL_40:
  unint64_t v24 = MEMORY[0x263F8EE78];
LABEL_41:
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_2292AD794(v4, v24);
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  unint64_t v31 = v30;
  swift_release();
  if ((v31 & 1) == 0) {
    goto LABEL_42;
  }
  sub_2292CC708();
  swift_unknownObjectRetain_n();
  uint64_t v34 = swift_dynamicCastClass();
  if (!v34)
  {
    swift_unknownObjectRelease();
    uint64_t v34 = MEMORY[0x263F8EE78];
  }
  uint64_t v35 = *(void *)(v34 + 16);
  swift_release();
  if (__OFSUB__(v31 >> 1, v29))
  {
    __break(1u);
    goto LABEL_53;
  }
  if (v35 != (v31 >> 1) - v29)
  {
LABEL_53:
    swift_unknownObjectRelease();
LABEL_42:
    sub_2292ACAA0(v25, v27, v29, v31);
    uint64_t v33 = v32;
    goto LABEL_49;
  }
  uint64_t v33 = swift_dynamicCastClass();
  if (!v33)
  {
    swift_unknownObjectRelease();
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
LABEL_49:
  swift_unknownObjectRelease();
  uint64_t *v38 = v33;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292AD274()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

char *sub_2292AD284(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AA0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2292AD388(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    void *v11 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    unint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_2292AD584(unint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_29:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_2292CC638();
  if (!v3) {
    goto LABEL_30;
  }
LABEL_3:
  uint64_t v4 = 0;
  uint64_t v19 = v2;
  unint64_t v20 = v2 & 0xC000000000000001;
  uint64_t v18 = v2 + 32;
  while (1)
  {
    if (v20) {
      id v5 = (id)MEMORY[0x22A6B4140](v4, v19);
    }
    else {
      id v5 = *(id *)(v18 + 8 * v4);
    }
    uint64_t v6 = v5;
    if (__OFADD__(v4++, 1)) {
      goto LABEL_28;
    }
    id v8 = objc_msgSend(v5, sel_template);
    id v9 = objc_msgSend(v8, sel_uniqueName);

    if (!v9) {
      break;
    }
    uint64_t v10 = sub_2292CC308();
    uint64_t v12 = v11;

    uint64_t v13 = a2[2];
    if (!v13) {
      goto LABEL_25;
    }
    BOOL v14 = a2[4] == v10 && a2[5] == v12;
    if (!v14 && (sub_2292CC6F8() & 1) == 0)
    {
      if (v13 == 1)
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      unint64_t v15 = a2 + 7;
      uint64_t v16 = 1;
      while (1)
      {
        uint64_t v2 = v16 + 1;
        if (__OFADD__(v16, 1)) {
          break;
        }
        BOOL v17 = *(v15 - 1) == v10 && *v15 == v12;
        if (v17 || (sub_2292CC6F8() & 1) != 0) {
          goto LABEL_4;
        }
        v15 += 2;
        ++v16;
        if (v2 == v13) {
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
LABEL_4:

    swift_bridgeObjectRelease();
    if (v4 == v3) {
      goto LABEL_30;
    }
  }
  __break(1u);
}

uint64_t sub_2292AD794(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2292CC638();
  unint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2292CC638();
    unint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2292CC638();
    unint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_2292AD928();
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = v10 + 1;
      sub_2292CC578();
      uint64_t v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2292CC648();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

unint64_t sub_2292AD928()
{
  unint64_t result = qword_26AF369A8;
  if (!qword_26AF369A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26AF369A8);
  }
  return result;
}

uint64_t sub_2292AD968()
{
  return swift_release();
}

uint64_t sub_2292AD9CC(uint64_t a1)
{
  return sub_2292ADA58(a1, qword_26830FB30);
}

uint64_t sub_2292AD9EC()
{
  return sub_2292ADAF4(qword_26830FAA0, (uint64_t)qword_26830FB30);
}

uint64_t sub_2292ADA10@<X0>(uint64_t a1@<X8>)
{
  return sub_2292ADB6C(qword_26830FAA0, (uint64_t)qword_26830FB30, a1);
}

uint64_t sub_2292ADA34(uint64_t a1)
{
  return sub_2292ADA58(a1, qword_26AF36D48);
}

uint64_t sub_2292ADA58(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2292CC258();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2292CC248();
}

uint64_t sub_2292ADAD0()
{
  return sub_2292ADAF4(&qword_26AF36C70, (uint64_t)qword_26AF36D48);
}

uint64_t sub_2292ADAF4(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_2292CC258();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_2292ADB48@<X0>(uint64_t a1@<X8>)
{
  return sub_2292ADB6C(&qword_26AF36C70, (uint64_t)qword_26AF36D48, a1);
}

uint64_t sub_2292ADB6C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_2292CC258();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

void sub_2292ADC04(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = sub_2292ADD90(a1, a2, a3, a4);
  unint64_t v6 = v5;
  swift_bridgeObjectRetain();
  oslog = sub_2292CC238();
  os_log_type_t v7 = sub_2292CC468();
  if (os_log_type_enabled(oslog, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v11 = v9;
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_bridgeObjectRetain();
    sub_2292AE150(v4, v6, &v11);
    sub_2292CC4C8();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_229290000, oslog, v7, "%{public}s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6B5100](v9, -1, -1);
    MEMORY[0x22A6B5100](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2292ADD90(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_2292AE7A8();
  uint64_t v8 = sub_2292CC4E8();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    uint64_t v10 = v8 + 16 * v9;
    a1 = *(void *)(v10 + 16);
    a2 = *(void *)(v10 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  sub_2292AE018(46, 0xE100000000000000, a1, a2);
  uint64_t v11 = sub_2292CC398();
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  MEMORY[0x22A6B3EE0](v11, v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_2292AE018(40, 0xE100000000000000, a3, a4);
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_2292CC398();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  swift_bridgeObjectRelease();
  MEMORY[0x22A6B3EE0](v18, v20, v22, v24);
  swift_bridgeObjectRelease();
  uint64_t v25 = pthread_self();
  pthread_mach_thread_np(v25);
  sub_2292CC6C8();
  sub_2292CC358();
  swift_bridgeObjectRelease();
  sub_2292CC358();
  sub_2292CC358();
  swift_bridgeObjectRelease();
  sub_2292CC358();
  sub_2292CC358();
  swift_bridgeObjectRelease();
  return 91;
}

unint64_t sub_2292AE018(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_2292CC388() != a1 || v9 != a2)
  {
    char v10 = sub_2292CC6F8();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_2292CC348();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2292AE10C()
{
  return 0;
}

uint64_t sub_2292AE150(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2292AE224(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2292AE820((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2292AE820((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2292AE224(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2292CC4D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2292AE3E0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2292CC5A8();
  if (!v8)
  {
    sub_2292CC618();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2292CC688();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2292AE3E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2292AE478(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2292AE658(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2292AE658(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2292AE478(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2292AE5F0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2292CC568();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2292CC618();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2292CC368();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2292CC688();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2292CC618();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2292AE5F0(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26830F9B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2292AE658(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830F9B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

unint64_t sub_2292AE7A8()
{
  unint64_t result = qword_26AF36A28;
  if (!qword_26AF36A28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF36A28);
  }
  return result;
}

ValueMetadata *type metadata accessor for AAUILog()
{
  return &type metadata for AAUILog;
}

uint64_t sub_2292AE80C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2292AE820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL sub_2292AE87C()
{
  id v1 = objc_msgSend(v0, sel_goalExpression);
  if (v1 || (id v1 = objc_msgSend(v0, sel_graceGoalExpression)) != 0)
  {

    int v2 = 1;
  }
  else
  {
    int v2 = 0;
  }
  id v3 = objc_msgSend(v0, sel_progressExpression);
  if (v3 || (id v3 = objc_msgSend(v0, sel_graceProgressExpression)) != 0)
  {

    return 1;
  }
  return v2 != 0;
}

Swift::String __swiftcall AAUIAwardsDataProviderSection.localized()()
{
  type metadata accessor for AAUIAwardsDataProvider();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  int v2 = (void *)sub_2292CC2F8();
  swift_bridgeObjectRelease();
  id v3 = (void *)sub_2292CC2F8();
  id v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  uint64_t v5 = sub_2292CC308();
  int64_t v7 = v6;

  uint64_t v8 = v5;
  int64_t v9 = v7;
  result._object = v9;
  result._countAndFlagsBits = v8;
  return result;
}

unint64_t AAUIAwardsDataProviderSection.rawValue.getter()
{
  unint64_t result = 0x495F524F465F4F47;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x5954495649544341;
      break;
    case 2:
      unint64_t result = 0x5354554F4B524F57;
      break;
    case 3:
      unint64_t result = 0x5F5353454E544946;
      break;
    case 4:
      unint64_t result = 0x5F444554494D494CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
      unint64_t result = 0x54495445504D4F43;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t type metadata accessor for AAUIAwardsDataProvider()
{
  uint64_t result = qword_26AF36AE0;
  if (!qword_26AF36AE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional __swiftcall AAUIAwardsDataProviderSection.init(rawValue:)(Swift::String rawValue)
{
  int v2 = v1;
  unint64_t v3 = sub_2292CC698();
  result.value = swift_bridgeObjectRelease();
  char v5 = 7;
  if (v3 < 7) {
    char v5 = v3;
  }
  *int v2 = v5;
  return result;
}

void *static AAUIAwardsDataProviderSection.allCases.getter()
{
  return &unk_26DD69F90;
}

uint64_t sub_2292AECD4(unsigned __int8 *a1, char *a2)
{
  return sub_2292AECE0(*a1, *a2);
}

uint64_t sub_2292AECE0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xE900000000000054;
  unint64_t v3 = 0x495F524F465F4F47;
  uint64_t v4 = a1;
  unint64_t v5 = 0x495F524F465F4F47;
  unint64_t v6 = 0xE900000000000054;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x5954495649544341;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v5 = 0x5354554F4B524F57;
      break;
    case 3:
      unint64_t v5 = 0x5F5353454E544946;
      uint64_t v7 = 1398099024;
      goto LABEL_8;
    case 4:
      unint64_t v5 = 0x5F444554494D494CLL;
      unint64_t v6 = 0xEF4E4F4954494445;
      break;
    case 5:
      unint64_t v6 = 0x80000002292CFE80;
      unint64_t v5 = 0xD000000000000012;
      break;
    case 6:
      unint64_t v5 = 0x54495445504D4F43;
      uint64_t v7 = 1397641033;
LABEL_8:
      unint64_t v6 = v7 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x5954495649544341) {
        goto LABEL_22;
      }
      goto LABEL_24;
    case 2:
      unint64_t v2 = 0xE800000000000000;
      if (v5 != 0x5354554F4B524F57) {
        goto LABEL_24;
      }
      goto LABEL_22;
    case 3:
      uint64_t v8 = 0x5F5353454E544946;
      uint64_t v9 = 1398099024;
      goto LABEL_21;
    case 4:
      unint64_t v2 = 0xEF4E4F4954494445;
      if (v5 != 0x5F444554494D494CLL) {
        goto LABEL_24;
      }
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0x80000002292CFE80;
      unint64_t v3 = 0xD000000000000012;
      goto LABEL_18;
    case 6:
      uint64_t v8 = 0x54495445504D4F43;
      uint64_t v9 = 1397641033;
LABEL_21:
      unint64_t v2 = v9 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v5 == v8) {
        goto LABEL_22;
      }
      goto LABEL_24;
    default:
LABEL_18:
      if (v5 != v3) {
        goto LABEL_24;
      }
LABEL_22:
      if (v6 == v2) {
        char v10 = 1;
      }
      else {
LABEL_24:
      }
        char v10 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10 & 1;
  }
}

uint64_t sub_2292AEF68()
{
  return sub_2292AF0C4();
}

uint64_t sub_2292AEF74()
{
  return sub_2292AEF7C();
}

uint64_t sub_2292AEF7C()
{
  sub_2292CC338();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292AF0BC()
{
  return sub_2292AF0C4();
}

uint64_t sub_2292AF0C4()
{
  return sub_2292CC758();
}

ActivityAchievementsUI::AAUIAwardsDataProviderSection_optional sub_2292AF214(Swift::String *a1)
{
  return AAUIAwardsDataProviderSection.init(rawValue:)(*a1);
}

unint64_t sub_2292AF220@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AAUIAwardsDataProviderSection.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2292AF248(void *a1@<X8>)
{
  *a1 = &unk_26DD69F90;
}

uint64_t sub_2292AF258@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
  uint64_t v4 = sub_2292CC1A8();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t sub_2292AF2CC()
{
  return *(void *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_layoutMode);
}

id sub_2292AF2DC()
{
  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator);
}

id sub_2292AF2EC()
{
  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
}

uint64_t sub_2292AF2FC()
{
  return 0;
}

uint64_t sub_2292AF304()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2292AF34C(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_2292AF398())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF3F4()
{
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2292AF400()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF40C(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_topAchievements);
}

uint64_t (*sub_2292AF418())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_2292AF474()
{
  return sub_2292AF480(MEMORY[0x263F8EE78]);
}

unint64_t sub_2292AF480(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A80);
  unint64_t v2 = (void *)sub_2292CC678();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((unsigned __int8 *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2292AC8D4(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2292AF584(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A88);
  unint64_t v2 = (void *)sub_2292CC678();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_2292AC940(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2292AF6A0()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF6AC(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerSection);
}

uint64_t (*sub_2292AF6B8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF714()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF720(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_mostRecentlyEarnedAchievementsPerSection);
}

uint64_t (*sub_2292AF72C())()
{
  return j__swift_endAccess;
}

unint64_t sub_2292AF78C()
{
  return sub_2292AF584(MEMORY[0x263F8EE78]);
}

uint64_t sub_2292AF798()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF7A4(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerWorkoutIdentifier);
}

uint64_t (*sub_2292AF7B0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF80C()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF818(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_orderedSections);
}

uint64_t (*sub_2292AF824())()
{
  return j_j__swift_endAccess;
}

id sub_2292AF880()
{
  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
}

uint64_t sub_2292AF890()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF89C(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientTopAchievements);
}

uint64_t (*sub_2292AF8A8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF904()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF910(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerSection);
}

uint64_t (*sub_2292AF91C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF978()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF984(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientMostRecentlyEarnedAchievementsPerSection);
}

uint64_t (*sub_2292AF990())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AF9EC()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AF9F8(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerWorkoutIdentifier);
}

uint64_t (*sub_2292AFA04())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AFA60()
{
  return sub_2292B07FC();
}

uint64_t sub_2292AFA6C(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_clientOrderedSections);
}

uint64_t (*sub_2292AFA78())()
{
  return j_j__swift_endAccess;
}

id sub_2292AFAD4()
{
  return *(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue);
}

uint64_t sub_2292AFAE4()
{
  return swift_retain();
}

uint64_t sub_2292AFAF4()
{
  return 0;
}

void *sub_2292AFAFC()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_2292AFB4C(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_2292AFBA0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AFBFC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_isActivated);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2292AFC44(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_isActivated);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_2292AFC90())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292AFCEC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_2292AFD34(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_2292AFD80())()
{
  return j_j__swift_endAccess;
}

id sub_2292AFDDC()
{
  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator), sel_isPaused);
}

uint64_t AAUIAwardsDataProvider.__allocating_init(healthStore:layoutMode:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F3D168]), sel_initWithHealthStore_, a1);
  uint64_t v6 = *(uint64_t (**)(uint64_t, id, uint64_t))(v2 + 648);
  return v6(a1, v5, a2);
}

void *AAUIAwardsDataProvider.__allocating_init(healthStore:pauseRingsCoordinator:layoutMode:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)(a1, a2, a3);
}

void *AAUIAwardsDataProvider.init(healthStore:pauseRingsCoordinator:layoutMode:)(void *a1, void *a2, void *a3)
{
  id v53 = a3;
  uint64_t v54 = a2;
  uint64_t v5 = sub_2292CC488();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  uint64_t v57 = v6;
  MEMORY[0x270FA5388](v5);
  char v55 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2292CC478();
  MEMORY[0x270FA5388](v8);
  char v51 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2292CC288();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_2292CC1A8();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3[OBJC_IVAR___AAUIAwardsDataProvider_initialAwardsBatchDelivered] = 0;
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR___AAUIAwardsDataProvider_topAchievements] = MEMORY[0x263F8EE78];
  uint64_t v16 = OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerSection;
  uint64_t v17 = v3;
  *(void *)&v3[v16] = sub_2292AF480(v15);
  uint64_t v18 = OBJC_IVAR___AAUIAwardsDataProvider_mostRecentlyEarnedAchievementsPerSection;
  *(void *)&v17[v18] = sub_2292AF480(v15);
  uint64_t v19 = OBJC_IVAR___AAUIAwardsDataProvider_achievementsPerWorkoutIdentifier;
  *(void *)&v17[v19] = sub_2292AF584(v15);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_orderedSections] = v15;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_clientTopAchievements] = v15;
  uint64_t v20 = OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerSection;
  *(void *)&v17[v20] = sub_2292AF480(v15);
  uint64_t v21 = OBJC_IVAR___AAUIAwardsDataProvider_clientMostRecentlyEarnedAchievementsPerSection;
  *(void *)&v17[v21] = sub_2292AF480(v15);
  uint64_t v22 = OBJC_IVAR___AAUIAwardsDataProvider_clientAchievementsPerWorkoutIdentifier;
  *(void *)&v17[v22] = sub_2292AF584(v15);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_clientOrderedSections] = v15;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_query] = 0;
  v17[OBJC_IVAR___AAUIAwardsDataProvider_isActivated] = 0;
  v17[OBJC_IVAR___AAUIAwardsDataProvider_isFitnessPlusSubscriber] = 0;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_observers] = v15;
  uint64_t v23 = v15;
  uint64_t v24 = v54;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_layoutMode] = v53;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_healthStore] = a1;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_pauseRingsCoordinator] = v24;
  id v25 = objc_allocWithZone(MEMORY[0x263F236E0]);
  id v53 = a1;
  id v52 = v24;
  id v26 = objc_msgSend(v25, sel_init);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator] = v26;
  id v27 = objc_msgSend(self, sel_hk_gregorianCalendar);
  sub_2292CC158();

  (*(void (**)(unsigned char *, char *, uint64_t))(v12 + 32))(&v17[OBJC_IVAR___AAUIAwardsDataProvider_calendar], v14, v11);
  uint64_t v50 = sub_2292BC624(0, &qword_26AF36A68);
  sub_2292CC278();
  uint64_t v58 = v23;
  uint64_t v49 = sub_2292B19D0(&qword_26AF36A60, MEMORY[0x263F8F0F8]);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A48);
  sub_2292BD688(&qword_26AF36A50, &qword_26AF36A48);
  v46[1] = v28;
  uint64_t v48 = v8;
  sub_2292CC518();
  LODWORD(v54) = *MEMORY[0x263F8F130];
  uint64_t v29 = v56;
  unint64_t v47 = *(void (**)(char *))(v57 + 104);
  v57 += 104;
  v47(v55);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue] = sub_2292CC4A8();
  sub_2292CC278();
  uint64_t v58 = MEMORY[0x263F8EE78];
  sub_2292CC518();
  unint64_t v30 = v55;
  uint64_t v31 = v29;
  uint64_t v32 = v47;
  ((void (*)(char *, void, uint64_t))v47)(v55, v54, v31);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_awardQueue] = sub_2292CC4A8();
  sub_2292CC278();
  uint64_t v58 = MEMORY[0x263F8EE78];
  sub_2292CC518();
  ((void (*)(char *, void, uint64_t))v32)(v30, v54, v56);
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue] = sub_2292CC4A8();
  id v33 = objc_msgSend(self, sel_weakObjectsHashTable);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A78);
  uint64_t v34 = swift_allocObject();
  *(_DWORD *)(v34 + 24) = 0;
  *(void *)(v34 + 16) = v33;
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers] = v34;
  uint64_t v35 = (__CFString *)sub_2292CC2F8();
  id v36 = objc_msgSend(self, sel_mainBundle);
  uint64_t v37 = (__CFString *)objc_msgSend(v36, sel_bundleIdentifier);

  if (v37)
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v35, v37, 0);
  }
  else
  {
    CFIndex AppIntegerValue = 0;
  }
  *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState] = AppIntegerValue;

  uint64_t v39 = (objc_class *)type metadata accessor for AAUIAwardsDataProvider();
  v59.receiver = v17;
  v59.super_class = v39;
  id v40 = objc_msgSendSuper2(&v59, sel_init);
  type metadata accessor for AAUIAwardsQuery();
  *(void *)(swift_allocObject() + 16) = v40;
  *(void *)(swift_allocObject() + 16) = v40;
  *(void *)(swift_allocObject() + 16) = v40;
  *(void *)(swift_allocObject() + 16) = v40;
  uint64_t v41 = v40;
  id v42 = AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)();
  unint64_t v43 = (void **)((char *)v41 + OBJC_IVAR___AAUIAwardsDataProvider_query);
  swift_beginAccess();
  unint64_t v44 = *v43;
  *unint64_t v43 = v42;

  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v41) + 0x2A8))();
  return v41;
}

uint64_t sub_2292B074C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2292B0784(unint64_t a1)
{
  return sub_2292B29F4(a1);
}

uint64_t sub_2292B07A8(unint64_t a1)
{
  return sub_2292B2A24(a1);
}

uint64_t sub_2292B07CC(unint64_t a1)
{
  return sub_2292B2EFC(a1);
}

uint64_t sub_2292B07F0()
{
  return sub_2292B07FC();
}

uint64_t sub_2292B07FC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2292B0844(uint64_t a1)
{
  return sub_2292B0850(a1, &OBJC_IVAR___AAUIAwardsDataProvider_observers);
}

uint64_t sub_2292B0850(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2292B08A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2292B08FC()
{
  uint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v3 = *MEMORY[0x263F83390];
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_mainQueue);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v48 = sub_2292B102C;
  uint64_t v49 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_2292B1050;
  unint64_t v47 = &block_descriptor_0;
  uint64_t v7 = _Block_copy(&aBlock);
  swift_release();
  id v43 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v3, 0, v5, v7);
  _Block_release(v7);

  id v8 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v9 = *MEMORY[0x263F833B8];
  id v10 = [v4 (SEL)0x264862F4BLL];
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v0;
  swift_unknownObjectWeakInit();
  uint64_t v48 = sub_2292B1144;
  uint64_t v49 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_2292B1050;
  unint64_t v47 = &block_descriptor_26;
  uint64_t v13 = _Block_copy(&aBlock);
  swift_release();
  id v42 = objc_msgSend(v8, sel_addObserverForName_object_queue_usingBlock_, v9, 0, v10, v13);
  _Block_release(v13);

  uint64_t v14 = v1;
  id v40 = v1;
  id v15 = objc_msgSend(v1, sel_defaultCenter);
  uint64_t v16 = *MEMORY[0x263F83330];
  uint64_t v17 = v4;
  id v18 = objc_msgSend(v4, sel_mainQueue);
  uint64_t v19 = swift_allocObject();
  uint64_t v20 = v12;
  swift_unknownObjectWeakInit();
  uint64_t v48 = sub_2292B1340;
  uint64_t v49 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_2292B1050;
  unint64_t v47 = &block_descriptor_30;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_release();
  id v41 = objc_msgSend(v15, sel_addObserverForName_object_queue_usingBlock_, v16, 0, v18, v21);
  _Block_release(v21);

  id v22 = objc_msgSend(v14, sel_defaultCenter);
  uint64_t v23 = self;
  id v24 = objc_msgSend(v23, sel_didUpdatePauseStateNotification);
  id v25 = v17;
  id v26 = objc_msgSend(v17, sel_mainQueue);
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v20;
  swift_unknownObjectWeakInit();
  uint64_t v48 = sub_2292B1348;
  uint64_t v49 = v27;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_2292B1050;
  unint64_t v47 = &block_descriptor_34;
  uint64_t v29 = _Block_copy(&aBlock);
  swift_release();
  id v30 = objc_msgSend(v22, sel_addObserverForName_object_queue_usingBlock_, v24, 0, v26, v29);
  _Block_release(v29);

  id v31 = objc_msgSend(v40, sel_defaultCenter);
  id v32 = objc_msgSend(v23, sel_initialPauseStateLoadedNotification);
  id v33 = objc_msgSend(v25, sel_mainQueue);
  uint64_t v34 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v48 = sub_2292B1544;
  uint64_t v49 = v34;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v45 = 1107296256;
  uint64_t v46 = sub_2292B1050;
  unint64_t v47 = &block_descriptor_38;
  uint64_t v35 = _Block_copy(&aBlock);
  swift_release();
  id v36 = objc_msgSend(v31, sel_addObserverForName_object_queue_usingBlock_, v32, 0, v33, v35);
  _Block_release(v35);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC8);
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_2292CF050;
  *(void *)(v37 + 56) = swift_getObjectType();
  *(void *)(v37 + 32) = v43;
  *(void *)(v37 + 88) = swift_getObjectType();
  *(void *)(v37 + 64) = v42;
  *(void *)(v37 + 120) = swift_getObjectType();
  *(void *)(v37 + 96) = v41;
  *(void *)(v37 + 152) = swift_getObjectType();
  *(void *)(v37 + 128) = v30;
  *(void *)(v37 + 184) = swift_getObjectType();
  *(void *)(v37 + 160) = v36;
  uint64_t v38 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v28) + 0x298);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v38(v37);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_2292B0FF4()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2292B102C()
{
  sub_2292B136C(v0, "[AAUIAwardsDataProvider] Significant time change, cycling data provider.");
}

uint64_t sub_2292B1050(uint64_t a1)
{
  uint64_t v2 = sub_2292CC078();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_2292CC068();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_2292B1144()
{
  sub_2292B136C(v0, "[AAUIAwardsDataProvider] App entered foreground, cycling data provider.");
}

void sub_2292B1168(uint64_t a1)
{
  uint64_t v2 = sub_2292CC258();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x22A6B5170](a1 + 16);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = sub_2292ADAD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    uint64_t v9 = sub_2292CC238();
    os_log_type_t v10 = sub_2292CC468();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_229290000, v9, v10, "[AAUIAwardsDataProvider] App entered background, stopping data provider query.", v11, 2u);
      MEMORY[0x22A6B5100](v11, -1, -1);
    }

    uint64_t v12 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v7) + 0x2B0))(v12);
  }
}

void sub_2292B1340()
{
  sub_2292B1168(v0);
}

void sub_2292B1348()
{
  sub_2292B136C(v0, "[AAUIAwardsDataProvider] pause rings coordinator updated, cycling data provider.");
}

void sub_2292B136C(uint64_t a1, const char *a2)
{
  uint64_t v4 = sub_2292CC258();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = MEMORY[0x22A6B5170](a1 + 16);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = sub_2292ADAD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    uint64_t v11 = sub_2292CC238();
    os_log_type_t v12 = sub_2292CC468();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_229290000, v11, v12, a2, v13, 2u);
      MEMORY[0x22A6B5100](v13, -1, -1);
    }

    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v9) + 0x2B8))(v14);
  }
}

void sub_2292B1544()
{
  sub_2292B136C(v0, "[AAUIAwardsDataProvider] pause rings coordinator initial notification, cycling data provider.");
}

id AAUIAwardsDataProvider.__deallocating_deinit()
{
  uint64_t v1 = &v0[OBJC_IVAR___AAUIAwardsDataProvider_observers];
  swift_beginAccess();
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v4 = self;
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_2292AE820(v5, (uint64_t)v9);
      id v6 = objc_msgSend(v4, sel_defaultCenter);
      __swift_project_boxed_opaque_existential_0(v9, v9[3]);
      objc_msgSend(v6, sel_removeObserver_, sub_2292CC6E8());

      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      v5 += 32;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for AAUIAwardsDataProvider();
  return objc_msgSendSuper2(&v8, sel_dealloc);
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2292B189C()
{
  return sub_2292B1A38((uint64_t)sub_2292B18BC, (uint64_t)&block_descriptor_42);
}

void sub_2292B18BC()
{
  swift_beginAccess();
  uint64_t v1 = (void *)MEMORY[0x22A6B5170](v0 + 16);
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = (void *)MEMORY[0x263F8EED0];
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x238))();
    if (v4)
    {
      uint64_t v5 = v4;
      (*(void (**)(void))((*v3 & *v4) + 0x68))();
    }
  }
}

uint64_t sub_2292B198C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2292B19D0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2292B1A18()
{
  return sub_2292B1A38((uint64_t)sub_2292B2298, (uint64_t)&block_descriptor_46);
}

uint64_t sub_2292B1A38(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_2292CC268();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  objc_super v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2292CC288();
  uint64_t v9 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15[1] = *(void *)(v2 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = a1;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292B198C;
  aBlock[3] = a2;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  sub_2292CC278();
  uint64_t v17 = MEMORY[0x263F8EE78];
  sub_2292B19D0(&qword_26AF36A10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A38);
  sub_2292BD688(&qword_26AF36A40, &qword_26AF36A38);
  sub_2292CC518();
  MEMORY[0x22A6B4050](0, v11, v8, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v16);
  swift_release();
  return swift_release();
}

void sub_2292B1D04(uint64_t a1)
{
  uint64_t v2 = sub_2292CC258();
  MEMORY[0x270FA5388](v2);
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x22A6B5170](a1 + 16);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void *)MEMORY[0x263F8EED0];
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x138))(0);
    uint64_t v6 = MEMORY[0x263F8EE78];
    (*(void (**)(void))((*v5 & *v4) + 0x150))(MEMORY[0x263F8EE78]);
    unint64_t v7 = sub_2292AF480(v6);
    (*(void (**)(unint64_t))((*v5 & *v4) + 0x168))(v7);
    unint64_t v8 = sub_2292AF480(v6);
    (*(void (**)(unint64_t))((*v5 & *v4) + 0x180))(v8);
    unint64_t v9 = sub_2292AF584(v6);
    (*(void (**)(unint64_t))((*v5 & *v4) + 0x198))(v9);
    (*(void (**)(uint64_t))((*v5 & *v4) + 0x1B0))(v6);
    uint64_t v10 = (__CFString *)sub_2292CC2F8();
    id v11 = objc_msgSend(self, sel_mainBundle);
    uint64_t v12 = (__CFString *)objc_msgSend(v11, sel_bundleIdentifier);

    if (v12)
    {
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v10, v12, 0);
    }
    else
    {
      CFIndex AppIntegerValue = 0;
    }
    *(void *)((char *)v4 + OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState) = AppIntegerValue;
    uint64_t v14 = *(uint64_t (**)(void))((*v5 & *v4) + 0x238);
    uint64_t v15 = (void *)v14();
    if (v15)
    {
      uint64_t v16 = v15;
      (*(void (**)(void))((*v5 & *v15) + 0x68))();
    }
    uint64_t v17 = (void *)v14();
    if (v17)
    {
      id v18 = v17;
      (*(void (**)(void))((*v5 & *v17) + 0x60))();
    }
  }
}

void sub_2292B2298()
{
  sub_2292B1D04(v0);
}

uint64_t sub_2292B22A0()
{
  uint64_t v1 = *(NSObject **)(v0 + OBJC_IVAR___AAUIAwardsDataProvider_propertyQueue);
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_2292B29DC;
  *(void *)(v3 + 24) = v2;
  v6[4] = sub_2292AA38C;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_2292AA3B4;
  v6[3] = &block_descriptor_53;
  uint64_t v4 = _Block_copy(v6);
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v1) {
    __break(1u);
  }
  return result;
}

void sub_2292B23FC(uint64_t a1)
{
  uint64_t v2 = sub_2292CC258();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x22A6B5170](a1 + 16);
  if (v6)
  {
    unint64_t v7 = (void *)v6;
    uint64_t v8 = sub_2292ADAD0();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    unint64_t v9 = v7;
    uint64_t v10 = sub_2292CC238();
    os_log_type_t v11 = sub_2292CC468();
    int v12 = v11;
    BOOL v13 = os_log_type_enabled(v10, v11);
    uint64_t v14 = (void *)MEMORY[0x263F8EED0];
    if (v13)
    {
      uint64_t v15 = swift_slowAlloc();
      int v43 = v12;
      uint64_t v16 = v15;
      uint64_t v17 = swift_slowAlloc();
      uint64_t v44 = v17;
      uint64_t v47 = v17;
      *(_DWORD *)uint64_t v16 = 136315394;
      uint64_t v41 = v16 + 4;
      os_log_t v42 = v10;
      uint64_t v18 = *v14 & *v9;
      uint64_t v45 = v2;
      uint64_t v19 = (*(uint64_t (**)(uint64_t))(v18 + 424))(v17);
      uint64_t v20 = MEMORY[0x22A6B3FA0](v19);
      unint64_t v22 = v21;
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_2292AE150(v20, v22, &v47);
      sub_2292CC4C8();

      uint64_t v23 = swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      uint64_t v41 = v16 + 14;
      uint64_t v24 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x148))(v23);
      uint64_t v25 = sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
      uint64_t v26 = MEMORY[0x22A6B3FA0](v24, v25);
      unint64_t v28 = v27;
      swift_bridgeObjectRelease();
      uint64_t v46 = sub_2292AE150(v26, v28, &v47);
      sub_2292CC4C8();

      swift_bridgeObjectRelease();
      os_log_t v29 = v42;
      _os_log_impl(&dword_229290000, v42, (os_log_type_t)v43, "[AAUIAwardsDataProvider] Updating client properties:\norderedSections = %s,\ntopAchievements = %s", (uint8_t *)v16, 0x16u);
      uint64_t v30 = v44;
      swift_arrayDestroy();
      MEMORY[0x22A6B5100](v30, -1, -1);
      MEMORY[0x22A6B5100](v16, -1, -1);

      uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v45);
    }
    else
    {

      uint64_t v31 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    uint64_t v32 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x1A8))(v31);
    uint64_t v33 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x228))(v32);
    uint64_t v34 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x160))(v33);
    uint64_t v35 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x1E0))(v34);
    uint64_t v36 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x148))(v35);
    uint64_t v37 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x1C8))(v36);
    uint64_t v38 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x190))(v37);
    uint64_t v39 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x210))(v38);
    uint64_t v40 = (*(uint64_t (**)(uint64_t))((*v14 & *v9) + 0x178))(v39);
    (*(void (**)(uint64_t))((*v14 & *v9) + 0x1F8))(v40);
  }
}

void sub_2292B29DC()
{
  sub_2292B23FC(v0);
}

uint64_t sub_2292B29E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2292B29F4(unint64_t a1)
{
  return sub_2292B2A54(a1, "[AAUIAwardsDataProvider] Received initial %ld achievements", (uint64_t)&unk_26DD6A488, (uint64_t)sub_2292BD5BC, (uint64_t)&block_descriptor_90);
}

uint64_t sub_2292B2A24(unint64_t a1)
{
  return sub_2292B2A54(a1, "[AAUIAwardsDataProvider] Received %ld updated achievements", (uint64_t)&unk_26DD6A438, (uint64_t)sub_2292BD4F4, (uint64_t)&block_descriptor_83);
}

uint64_t sub_2292B2A54(unint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  unint64_t v28 = a2;
  uint64_t v7 = sub_2292CC268();
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2292CC288();
  uint64_t v31 = *(void *)(v10 - 8);
  uint64_t v32 = v10;
  MEMORY[0x270FA5388]();
  int v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2292CC258();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2292ADAD0();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_2292CC238();
  os_log_type_t v19 = sub_2292CC468();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v26 = a5;
    uint64_t v27 = v7;
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_2292CC638();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v21;
    sub_2292CC4C8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_229290000, v18, v19, v28, v20, 0xCu);
    MEMORY[0x22A6B5100](v20, -1, -1);

    a5 = v26;
    uint64_t v7 = v27;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v22;
  *(void *)(v23 + 24) = a1;
  aBlock[4] = v30;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292B198C;
  aBlock[3] = a5;
  uint64_t v24 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2292CC278();
  uint64_t v34 = MEMORY[0x263F8EE78];
  sub_2292B19D0(&qword_26AF36A10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A38);
  sub_2292BD688(&qword_26AF36A40, &qword_26AF36A38);
  sub_2292CC518();
  MEMORY[0x22A6B4050](0, v12, v9, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v32);
  swift_release();
  return swift_release();
}

uint64_t sub_2292B2EFC(unint64_t a1)
{
  return sub_2292B2A54(a1, "[AAUIAwardsDataProvider] Received %ld deleted achievements", (uint64_t)&unk_26DD6A3E8, (uint64_t)sub_2292BD4D8, (uint64_t)&block_descriptor_76);
}

uint64_t sub_2292B2F2C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_2292CC298();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (unint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)((char *)v2 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *(void *)unint64_t v7 = v8;
  (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F0E0], v4);
  id v9 = v8;
  LOBYTE(v8) = sub_2292CC2A8();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    __break(1u);
LABEL_17:
    uint64_t v11 = sub_2292CC638();
    if (!v11) {
      goto LABEL_18;
    }
    goto LABEL_4;
  }
  uint64_t v41 = MEMORY[0x263F8EE78];
  uint64_t v42 = MEMORY[0x263F8EE78];
  unint64_t v10 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x2F0))(a1);
  unint64_t v7 = v10;
  uint64_t v39 = a1;
  if (v10 >> 62) {
    goto LABEL_17;
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v11) {
    goto LABEL_18;
  }
LABEL_4:
  if (v11 < 1) {
    __break(1u);
  }
  for (uint64_t i = 0; i != v11; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x22A6B4140](i, v7);
    }
    else {
      id v13 = *(id *)(v7 + 8 * i + 32);
    }
    if (objc_msgSend(v13, sel_unearned))
    {
      MEMORY[0x22A6B3F70]();
      if (*(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2292CC408();
      }
    }
    else
    {
      MEMORY[0x22A6B3F70]();
      if (*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2292CC408();
      }
    }
    sub_2292CC428();
    sub_2292CC3F8();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void **)((char *)v2 + OBJC_IVAR___AAUIAwardsDataProvider_healthStore);
  id v40 = 0;
  id v15 = objc_msgSend(v14, sel_activityMoveModeWithError_, &v40);
  if (v15)
  {
    id v16 = v40;
    uint64_t v17 = (uint64_t)objc_msgSend(v15, sel_activityMoveMode);
  }
  else
  {
    id v18 = v40;
    os_log_type_t v19 = (void *)sub_2292CC0C8();

    swift_willThrow();
    uint64_t v17 = 1;
  }
  unint64_t v20 = FIExperienceTypeWithHealthStore();
  id v40 = 0;
  id v21 = objc_msgSend(v14, sel_wheelchairUseWithError_, &v40);
  id v37 = v21;
  id v38 = v15;
  if (v21)
  {
    uint64_t v22 = v21;
    id v23 = v40;
    BOOL v24 = objc_msgSend(v22, sel_wheelchairUse, v37, v38) == (id)2;
  }
  else
  {
    id v25 = v40;
    uint64_t v26 = (void *)sub_2292CC0C8();

    swift_willThrow();
    BOOL v24 = 0;
  }
  if (v20 <= 1) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = v20;
  }
  unint64_t v28 = (void *)MEMORY[0x263F8EED0];
  uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL))((*MEMORY[0x263F8EED0] & *v2) + 0x300);
  uint64_t v30 = swift_bridgeObjectRetain();
  uint64_t v31 = (void *)v29(v30, v17, v27, v24);
  swift_bridgeObjectRelease();
  id v40 = v31;
  uint64_t v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL))((*v28 & *v2) + 0x308);
  uint64_t v33 = swift_bridgeObjectRetain();
  uint64_t v34 = v32(v33, v17, v27, v24);
  swift_bridgeObjectRelease();
  sub_2292B82A4(v34);
  sub_2292C3A34();
  LOBYTE(v34) = sub_2292C43EC();
  char v35 = (*(uint64_t (**)(void))((*v28 & *v2) + 0x2F8))();
  (*(void (**)(void))((*v28 & *v2) + 0x2C0))();
  (*(void (**)(uint64_t, void, id, void, uint64_t, void))((*v28 & *v2) + 0x318))(v39, MEMORY[0x263F8EE78], v40, MEMORY[0x263F8EE78], v34 & 1, v35 & 1);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292B34F8(uint64_t a1)
{
  uint64_t v3 = sub_2292CC298();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F0E0], v3);
  id v8 = v7;
  LOBYTE(v7) = sub_2292CC2A8();
  uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if (v7)
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EED0];
    uint64_t v11 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x310))(a1);
    uint64_t v13 = v12;
    sub_2292C3A34();
    char v14 = sub_2292C43EC();
    char v15 = (*(uint64_t (**)(void))((*v10 & *v1) + 0x2F8))();
    (*(void (**)(void))((*v10 & *v1) + 0x2C0))();
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, void, void))((*v10 & *v1) + 0x318))(MEMORY[0x263F8EE78], a1, v11, v13, v14 & 1, v15 & 1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2292B3758(unint64_t a1)
{
  unint64_t v2 = a1;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___AAUIAwardsDataProvider_overrideDisplayState);
  if (v3 == 2)
  {
    if (!(a1 >> 62))
    {
      uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_6;
    }
  }
  else
  {
    if (v3 != 1)
    {
      swift_bridgeObjectRetain();
      return v2;
    }
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_2292CC638();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v5 = MEMORY[0x263F8EE78];
    if (!v11) {
      return v5;
    }
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2292CC5D8();
    if (v11 < 0) {
      goto LABEL_30;
    }
    uint64_t v12 = 0;
    while (v11 != v12)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x22A6B4140](v12, v2);
      }
      else {
        id v13 = *(id *)(v2 + 8 * v12 + 32);
      }
      char v14 = v13;
      ++v12;
      id v15 = v13;
      sub_2292B39B4(&v15, &v16);

      sub_2292CC5B8();
      sub_2292CC5E8();
      sub_2292CC5F8();
      sub_2292CC5C8();
      if (v11 == v12) {
        return v17;
      }
    }
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2292CC638();
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t result = sub_2292CC5D8();
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x22A6B4140](v7, v2);
      }
      else {
        id v8 = *(id *)(v2 + 8 * v7 + 32);
      }
      id v9 = v8;
      ++v7;
      id v10 = objc_msgSend(v8, sel_shallowCopyWithRelevantEarnedInstance_, 0);

      sub_2292CC5B8();
      sub_2292CC5E8();
      sub_2292CC5F8();
      sub_2292CC5C8();
    }
    while (v4 != v7);
    return v17;
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void sub_2292B39B4(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_2292CC128();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2292CC0A8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v29 = *a1;
  if (objc_msgSend(v29, sel_unearned))
  {
    uint64_t v27 = v4;
    unint64_t v28 = a2;
    id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F236B8]), sel_init);
    id v13 = objc_msgSend(v29, sel_template);
    id v14 = objc_msgSend(v13, sel_canonicalUnit);

    if (!v14)
    {
LABEL_5:
      id v18 = (id)ACHDateComponentsForYearMonthDay();
      sub_2292CC098();

      os_log_type_t v19 = (void *)sub_2292CC088();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      objc_msgSend(v12, sel_setEarnedDateComponents_, v19);

      sub_2292CC118();
      unint64_t v20 = (void *)sub_2292CC0E8();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v27);
      objc_msgSend(v12, sel_setCreatedDate_, v20);

      objc_msgSend(v12, sel_setCreatorDevice_, 2);
      id v21 = objc_msgSend(v29, sel_template);
      id v22 = objc_msgSend(v21, sel_uniqueName);

      objc_msgSend(v12, sel_setTemplateUniqueName_, v22);
      id v23 = objc_msgSend(v29, sel_shallowCopyWithRelevantEarnedInstance_, v12);

      *unint64_t v28 = v23;
      return;
    }
    id v15 = objc_msgSend(v29, sel_template);
    id v16 = objc_msgSend(v15, sel_canonicalUnit);

    if (v16)
    {
      id v17 = objc_msgSend(self, sel_quantityWithUnit_doubleValue_, v16, 20.0);

      objc_msgSend(v12, sel_setValue_, v17);
      goto LABEL_5;
    }
    __break(1u);
  }
  else
  {
    id v24 = v29;
    *a2 = v29;
    id v25 = v24;
  }
}

uint64_t sub_2292B3D50()
{
  uint64_t v4 = (uint64_t)v0;
  uint64_t v5 = sub_2292CC298();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v4 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *(void *)uint64_t v8 = v9;
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F8F0E0], v5);
  id v10 = v9;
  unint64_t v11 = sub_2292CC2A8();
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v13 = MEMORY[0x263F8EED0];
  id v14 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v4) + 0x148);
  uint64_t v93 = (*MEMORY[0x263F8EED0] & *(void *)v4) + 328;
  uint64_t v15 = v14(v12);
  unint64_t v16 = v15;
  v94 = v14;
  if (v15 < 0 || (v15 & 0x4000000000000000) != 0)
  {
LABEL_108:
    unint64_t v92 = (unint64_t)sub_2292B8654(v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v92 = v15 & 0xFFFFFFFFFFFFFF8;
  }
  id v17 = *(uint64_t (**)(void))((*(void *)v13 & *(void *)v4) + 0x160);
  uint64_t v18 = v17();
  unint64_t v19 = MEMORY[0x263F8EE78];
  if (*(void *)(v18 + 16))
  {
    unint64_t v20 = sub_2292AC8D4(0);
    if (v21)
    {
      unint64_t v2 = *(void *)(*(void *)(v18 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v2 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    unint64_t v2 = MEMORY[0x263F8EE78];
  }
  uint64_t v22 = swift_bridgeObjectRelease();
  uint64_t v8 = v4;
  uint64_t v23 = ((uint64_t (*)(uint64_t))v17)(v22);
  id v24 = sub_2292AC9B8(v23);
  swift_bridgeObjectRelease();
  unint64_t v98 = v19;
  uint64_t v25 = v24[2];
  if (v25)
  {
    swift_retain();
    uint64_t v26 = 0;
    do
    {
      ++v26;
      unint64_t v27 = swift_bridgeObjectRetain();
      uint64_t v8 = (uint64_t)&v98;
      sub_2292B80D8(v27);
    }
    while (v25 != v26);
    swift_release_n();
    unint64_t v11 = v98;
  }
  else
  {
    swift_release();
    unint64_t v11 = MEMORY[0x263F8EE78];
  }
  unint64_t v98 = v19;
  if (v11 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_17;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    unint64_t v31 = MEMORY[0x263F8EE78];
    goto LABEL_27;
  }
  uint64_t v28 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v28) {
    goto LABEL_26;
  }
LABEL_17:
  if (v28 < 1) {
    goto LABEL_118;
  }
  for (uint64_t i = 0; i != v28; ++i)
  {
    id v30 = *(id *)(v11 + 8 * i + 32);
    if (objc_msgSend(v30, sel_unearned))
    {
    }
    else
    {
      sub_2292CC5B8();
      sub_2292CC5E8();
      sub_2292CC5F8();
      sub_2292CC5C8();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v31 = v98;
LABEL_27:
  uint64_t v32 = (id)v4;
  swift_retain();
  if ((v31 & 0x8000000000000000) != 0 || (uint64_t v33 = (void *)v31, (v31 & 0x4000000000000000) != 0))
  {
    uint64_t v33 = sub_2292B8654(v31);
    swift_release();
  }
  unint64_t v98 = (unint64_t)v33;
  uint64_t v1 = v32;
  unint64_t v11 = 0;
  sub_2292BC584((uint64_t *)&v98, v1);
  swift_release();

  uint64_t v8 = v98;
  if ((v98 & 0x8000000000000000) != 0) {
    unint64_t v34 = 1;
  }
  else {
    unint64_t v34 = (v98 >> 62) & 1;
  }
  if (v34)
  {
    swift_retain();
    uint64_t v13 = sub_2292CC638();
    swift_release();
  }
  else
  {
    uint64_t v13 = *(void *)(v98 + 16);
  }
  v91 = v1;
  uint64_t v95 = 0;
  unint64_t v96 = v2;
  if (!v13)
  {
    swift_release();
    goto LABEL_60;
  }
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 >= 3) {
      uint64_t v35 = 3;
    }
    else {
      uint64_t v35 = v13;
    }
    if (v34) {
      goto LABEL_40;
    }
LABEL_44:
    uint64_t v37 = *(void *)(v8 + 16);
    goto LABEL_45;
  }
  uint64_t v35 = 3;
  if ((v34 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_40:
  swift_bridgeObjectRetain();
  uint64_t v36 = sub_2292CC638();
  swift_release();
  if (v36 < 0) {
    goto LABEL_119;
  }
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_2292CC638();
  swift_release();
LABEL_45:
  if (v37 < v35) {
    goto LABEL_120;
  }
  if ((v8 & 0xC000000000000001) != 0)
  {
    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    uint64_t v38 = 0;
    do
    {
      uint64_t v13 = v38 + 1;
      sub_2292CC578();
      uint64_t v38 = v13;
    }
    while (v35 != v13);
  }
  if (!v34)
  {
    unint64_t v2 = 0;
    uint64_t v41 = v8 + 32;
    unint64_t v44 = (2 * v35) | 1;
    if (v44) {
      goto LABEL_54;
    }
LABEL_53:
    sub_2292ACAA0(v8, v41, v2, v44);
    unint64_t v46 = v45;
    swift_unknownObjectRelease();
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  uint64_t v39 = sub_2292CC648();
  uint64_t v41 = v40;
  unint64_t v2 = v42;
  unint64_t v44 = v43;
  swift_release_n();
  uint64_t v8 = v39;
  if ((v44 & 1) == 0) {
    goto LABEL_53;
  }
LABEL_54:
  uint64_t v13 = sub_2292CC708();
  swift_unknownObjectRetain_n();
  uint64_t v47 = swift_dynamicCastClass();
  if (!v47)
  {
    swift_unknownObjectRelease();
    uint64_t v47 = MEMORY[0x263F8EE78];
  }
  uint64_t v48 = *(void *)(v47 + 16);
  swift_release();
  if (__OFSUB__(v44 >> 1, v2))
  {
    __break(1u);
    goto LABEL_127;
  }
  if (v48 != (v44 >> 1) - v2)
  {
LABEL_127:
    swift_unknownObjectRelease();
    goto LABEL_53;
  }
  unint64_t v46 = swift_dynamicCastClass();
  swift_unknownObjectRelease();
  if (v46) {
    goto LABEL_61;
  }
  swift_unknownObjectRelease();
LABEL_60:
  unint64_t v46 = MEMORY[0x263F8EE78];
LABEL_61:
  unint64_t v97 = v46;
  if (v46 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2292CC638();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v49 = 3 - v3;
  if (__OFSUB__(3, v3))
  {
    __break(1u);
    goto LABEL_113;
  }
  if (v49 <= 1) {
    uint64_t v50 = 1;
  }
  else {
    uint64_t v50 = 3 - v3;
  }
  uint64_t v8 = MEMORY[0x263F8EE78];
  if (!v3)
  {
LABEL_79:
    sub_2292BC660(v96, (void *)v8);
    unint64_t v59 = v58;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = sub_2292AD794(v50, v59);
    unint64_t v11 = v60;
    uint64_t v1 = v61;
    unint64_t v2 = v62;
    swift_bridgeObjectRelease();
    uint64_t v3 = MEMORY[0x263F8EED0];
    if (v2)
    {
      sub_2292CC708();
      swift_unknownObjectRetain_n();
      uint64_t v65 = swift_dynamicCastClass();
      if (!v65)
      {
        swift_unknownObjectRelease();
        uint64_t v65 = MEMORY[0x263F8EE78];
      }
      uint64_t v66 = *(void *)(v65 + 16);
      swift_release();
      if (__OFSUB__(v2 >> 1, v1)) {
        goto LABEL_122;
      }
      if (v66 != (v2 >> 1) - (void)v1) {
        goto LABEL_123;
      }
      uint64_t v64 = swift_dynamicCastClass();
      if (!v64)
      {
        swift_unknownObjectRelease();
        uint64_t v64 = MEMORY[0x263F8EE78];
      }
      goto LABEL_87;
    }
    while (1)
    {
      sub_2292ACAA0(v8, v11, (uint64_t)v1, v2);
      uint64_t v64 = v63;
LABEL_87:
      swift_unknownObjectRelease();
      unint64_t v98 = v64;
      sub_2292B80D8(v97);
      uint64_t v8 = v98;
      uint64_t v49 = v98 & 0xFFFFFFFFFFFFFF8;
      unint64_t v34 = v98 >> 62;
      if (!(v98 >> 62)) {
        break;
      }
LABEL_113:
      if (v8 < 0) {
        unint64_t v11 = v8;
      }
      else {
        unint64_t v11 = v49;
      }
      swift_bridgeObjectRetain();
      uint64_t v52 = sub_2292CC638();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_2292CC638();
      swift_bridgeObjectRelease();
      if ((v85 & 0x8000000000000000) == 0) {
        goto LABEL_129;
      }
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      swift_unknownObjectRelease();
    }
    if (*(uint64_t *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3) {
      uint64_t v67 = 3;
    }
    else {
      uint64_t v67 = *(void *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    goto LABEL_91;
  }
  unint64_t v98 = MEMORY[0x263F8EE78];
  unint64_t v16 = v3 & ~(v3 >> 63);
  unint64_t v11 = v97;
  swift_bridgeObjectRetain();
  uint64_t v8 = (uint64_t)&v98;
  sub_2292B83F0(0, v16, 0);
  if (v3 < 0) {
    goto LABEL_121;
  }
  uint64_t v89 = v50;
  uint64_t v90 = v4;
  uint64_t v4 = 0;
  uint64_t v8 = v98;
  while (1)
  {
    if (v3 == v4)
    {
      __break(1u);
      goto LABEL_108;
    }
    id v51 = (v11 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A6B4140](v4, v97) : *(id *)(v97 + 8 * v4 + 32);
    uint64_t v52 = (uint64_t)v51;
    unint64_t v34 = (unint64_t)objc_msgSend(v51, sel_template);
    id v53 = objc_msgSend((id)v34, sel_uniqueName);

    if (!v53) {
      break;
    }
    uint64_t v1 = (void *)sub_2292CC308();
    uint64_t v55 = v54;

    unint64_t v98 = v8;
    unint64_t v16 = *(void *)(v8 + 16);
    unint64_t v56 = *(void *)(v8 + 24);
    uint64_t v13 = v16 + 1;
    if (v16 >= v56 >> 1)
    {
      sub_2292B83F0(v56 > 1, v16 + 1, 1);
      uint64_t v8 = v98;
    }
    ++v4;
    *(void *)(v8 + 16) = v13;
    unint64_t v57 = v8 + 16 * v16;
    *(void *)(v57 + 32) = v1;
    *(void *)(v57 + 40) = v55;
    if (v3 == v4)
    {
      swift_bridgeObjectRelease();
      uint64_t v50 = v89;
      goto LABEL_79;
    }
  }
  __break(1u);

  swift_release();
  __break(1u);
LABEL_129:
  if (v52 >= 3) {
    uint64_t v86 = 3;
  }
  else {
    uint64_t v86 = v52;
  }
  if (v52 >= 0) {
    uint64_t v67 = v86;
  }
  else {
    uint64_t v67 = 3;
  }
  swift_bridgeObjectRetain();
  uint64_t v87 = sub_2292CC638();
  uint64_t result = swift_bridgeObjectRelease();
  if (v87 >= v67)
  {
LABEL_91:
    if ((v8 & 0xC000000000000001) != 0 && v67)
    {
      sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
      uint64_t v68 = 0;
      do
      {
        uint64_t v69 = v68 + 1;
        sub_2292CC578();
        uint64_t v68 = v69;
      }
      while (v67 != v69);
    }
    if (v34)
    {
      swift_bridgeObjectRetain();
      uint64_t v71 = sub_2292CC648();
      uint64_t v72 = v74;
      uint64_t v70 = v75;
      unint64_t v73 = v76;
      swift_bridgeObjectRelease_n();
      if ((v73 & 1) == 0) {
        goto LABEL_99;
      }
    }
    else
    {
      uint64_t v70 = 0;
      uint64_t v71 = v8 & 0xFFFFFFFFFFFFFF8;
      uint64_t v72 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
      unint64_t v73 = (2 * v67) | 1;
      if ((v73 & 1) == 0) {
        goto LABEL_99;
      }
    }
    sub_2292CC708();
    swift_unknownObjectRetain_n();
    uint64_t v79 = swift_dynamicCastClass();
    if (!v79)
    {
      swift_unknownObjectRelease();
      uint64_t v79 = MEMORY[0x263F8EE78];
    }
    uint64_t v80 = *(void *)(v79 + 16);
    swift_release();
    if (__OFSUB__(v73 >> 1, v70))
    {
      __break(1u);
    }
    else if (v80 == (v73 >> 1) - v70)
    {
      uint64_t v78 = swift_dynamicCastClass();
      if (!v78)
      {
        swift_unknownObjectRelease();
        uint64_t v78 = MEMORY[0x263F8EE78];
      }
      goto LABEL_106;
    }
    swift_unknownObjectRelease();
LABEL_99:
    sub_2292ACAA0(v71, v72, v70, v73);
    uint64_t v78 = v77;
LABEL_106:
    swift_unknownObjectRelease();
    uint64_t v81 = (*(uint64_t (**)(uint64_t))((*(void *)v3 & *v91) + 0x150))(v78);
    uint64_t v82 = v94(v81);
    unsigned __int8 v83 = sub_2292B7CB8(v92, v82);
    swift_bridgeObjectRelease();
    swift_release();
    return (v83 & 1) == 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_2292B4838(unint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_2292CC298();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (uint64_t *)((char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v14 = *(void **)((char *)v5 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  void *v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F8F0E0], v10);
  id v15 = v14;
  LOBYTE(v14) = sub_2292CC2A8();
  id v17 = *(uint64_t (**)(void *, uint64_t))(v11 + 8);
  unint64_t v16 = (void *)(v11 + 8);
  uint64_t v18 = v17(v13, v10);
  if (v14)
  {
    uint64_t v39 = MEMORY[0x263F8EE88];
    unint64_t v16 = (void *)MEMORY[0x263F8EED0];
    uint64_t v19 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v5) + 0x160))(v18);
    if (*(void *)(v19 + 16) && (unint64_t v20 = sub_2292AC8D4(0), (v21 & 1) != 0))
    {
      uint64_t v13 = *(void **)(*(void *)(v19 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
    uint64_t v38 = v13;
    if (!(a1 >> 62))
    {
      uint64_t v22 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v22) {
        goto LABEL_8;
      }
LABEL_17:
      swift_bridgeObjectRelease();
LABEL_18:
      uint64_t v28 = *(uint64_t (**)(id *))((*v16 & *v5) + 0x170);
      swift_bridgeObjectRetain();
      id v29 = (void (*)(id *, void))v28(v37);
      unint64_t v31 = v30;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v36 = *v31;
      uint64_t *v31 = 0x8000000000000000;
      sub_2292B92F0((uint64_t)v13, 0, isUniquelyReferenced_nonNull_native);
      uint64_t *v31 = v36;
      swift_bridgeObjectRelease();
      v29(v37, 0);
      uint64_t v33 = swift_bridgeObjectRetain();
      uint64_t v34 = sub_2292B857C(v33);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v34;
    }
  }
  else
  {
    __break(1u);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2292CC638();
  uint64_t v22 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_8:
  if (v22 >= 1)
  {
    uint64_t v24 = 0;
    char v25 = a4 & 1;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v26 = (id)MEMORY[0x22A6B4140](v24, a1);
      }
      else {
        id v26 = *(id *)(a1 + 8 * v24 + 32);
      }
      unint64_t v27 = v26;
      ++v24;
      v37[0] = v26;
      sub_2292B4B9C(v37, a2, a3, v5, v25, (unint64_t *)&v38, (uint64_t)&v39);
    }
    while (v22 != v24);
    swift_bridgeObjectRelease();
    uint64_t v13 = v38;
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_2292B4B9C(id *a1, uint64_t a2, uint64_t a3, void *a4, char a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v87 = a7;
  unint64_t v89 = a3;
  uint64_t v12 = sub_2292CC258();
  uint64_t v86 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v85 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = *a1;
  id v15 = objc_msgSend(*a1, sel_section);
  uint64_t v16 = sub_2292CC308();
  uint64_t v18 = v17;

  v19._countAndFlagsBits = v16;
  v19._object = v18;
  LOBYTE(v20) = AAUIAwardsDataProviderSection.init(rawValue:)(v19);
  if (LOBYTE(v91[0]) == 7) {
    return;
  }
  unsigned int v88 = LOBYTE(v91[0]);
  uint64_t v21 = v12;
  uint64_t v22 = a6;
  uint64_t v23 = *(void **)((char *)a4 + OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator);
  uint64_t v24 = (void *)MEMORY[0x263F8EED0];
  char v25 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a4) + 0x268))(v20);
  id v26 = v23;
  unint64_t v27 = v14;
  sub_2292BE728(a2, v89, v26, v25 & 1, a5 & 1);
  char v29 = v28;
  id v30 = a4;
  uint64_t v84 = v21;
  if (v28)
  {
    unint64_t v31 = v24;
    if ((*(uint64_t (**)(void))((*v24 & *a4) + 0x280))())
    {
      id v32 = v27;
      unsigned int v33 = objc_msgSend(v27, sel_isRingsBased);
      uint64_t v34 = v22;
    }
    else
    {
      unsigned int v33 = 0;
      uint64_t v34 = v22;
      id v32 = v27;
    }
    LODWORD(v89) = v33 ^ 1;
  }
  else
  {
    LODWORD(v89) = 0;
    unint64_t v31 = v24;
    uint64_t v34 = v22;
    id v32 = v27;
  }
  uint64_t v35 = *(uint64_t (**)(void))((*v31 & *v30) + 0x160);
  uint64_t v36 = v35();
  uint64_t v37 = v88;
  if (*(void *)(v36 + 16) && (unint64_t v38 = sub_2292AC8D4(v88), (v39 & 1) != 0))
  {
    unint64_t v40 = *(void *)(*(void *)(v36 + 56) + 8 * v38);
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v40 = MEMORY[0x263F8EE78];
  }
  uint64_t v41 = swift_bridgeObjectRelease();
  unint64_t v92 = v40;
  if (*(void *)(((uint64_t (*)(uint64_t))v35)(v41) + 16) && (sub_2292AC8D4(v37), (v42 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v43 = objc_msgSend(v32, sel_template);
    id v44 = objc_msgSend(v43, sel_uniqueName);

    if (!v44)
    {
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    sub_2292CC308();

    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    unint64_t v45 = sub_2292C2894();
    char v47 = v46;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0) {
  }
    }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  id v48 = objc_msgSend(v32, sel_template);
  id v49 = objc_msgSend(v48, sel_uniqueName);

  if (!v49)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  sub_2292CC308();

  sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
  unint64_t v50 = sub_2292C2894();
  char v52 = v51;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v29 & 1) == 0)
  {
    uint64_t v53 = v88;
    if (v52) {
      goto LABEL_41;
    }
    unint64_t v59 = v50;
    goto LABEL_40;
  }
  id v32 = v32;
  MEMORY[0x22A6B3F70]();
  if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2292CC408();
  }
  sub_2292CC428();
  sub_2292CC3F8();
  if (!v89)
  {
    unint64_t v89 = v50;
    uint64_t v60 = sub_2292ADAD0();
    unint64_t v62 = v85;
    uint64_t v61 = v86;
    uint64_t v63 = v84;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v85, v60, v84);
    id v32 = v32;
    uint64_t v64 = sub_2292CC238();
    int v82 = sub_2292CC468();
    unsigned __int8 v83 = v64;
    if (os_log_type_enabled(v64, (os_log_type_t)v82))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      uint64_t v81 = swift_slowAlloc();
      v91[0] = v81;
      *(_DWORD *)uint64_t v65 = 136315138;
      id v66 = objc_msgSend(v32, byte_264862A2C);
      id v67 = objc_msgSend(v66, (SEL)&selRef_setResourceBundleURL_);

      if (!v67)
      {
LABEL_52:

        __break(1u);
        return;
      }
      uint64_t v68 = sub_2292CC308();
      unint64_t v70 = v69;

      uint64_t v90 = sub_2292AE150(v68, v70, v91);
      sub_2292CC4C8();

      swift_bridgeObjectRelease();
      uint64_t v71 = v83;
      _os_log_impl(&dword_229290000, v83, (os_log_type_t)v82, "[%s] we're currently paused, not showing in go for it", v65, 0xCu);
      uint64_t v72 = v81;
      swift_arrayDestroy();
      MEMORY[0x22A6B5100](v72, -1, -1);
      MEMORY[0x22A6B5100](v65, -1, -1);

      (*(void (**)(char *, uint64_t))(v86 + 8))(v85, v84);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v63);
    }
    uint64_t v53 = v88;
    unint64_t v59 = v89;
    if (v52) {
      goto LABEL_41;
    }
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v53 = v88;
  if (v52)
  {
    id v73 = v32;
    MEMORY[0x22A6B3F70]();
    if (*(void *)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v34 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_37:
      sub_2292CC428();
      sub_2292CC3F8();
      sub_2292B98F4(v91, 0);
      goto LABEL_41;
    }
LABEL_48:
    sub_2292CC408();
    goto LABEL_37;
  }
  unint64_t v54 = *v34;
  id v55 = v32;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v34 = v54;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v54 & 0x8000000000000000) != 0
    || (v54 & 0x4000000000000000) != 0)
  {
    sub_2292B9C8C(v54);
    unint64_t v54 = v57;
    unint64_t *v34 = v57;
  }
  if ((v50 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v50 >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_50;
  }
  unint64_t v58 = *(void **)((v54 & 0xFFFFFFFFFFFFFF8) + 8 * v50 + 0x20);
  *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 8 * v50 + 0x20) = v55;

  sub_2292CC3F8();
LABEL_41:
  uint64_t v74 = v92;
  if (v92 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v79 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (v79) {
      goto LABEL_43;
    }
  }
  else if (*(void *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_43:
    sub_2292B98F4(v91, v53);
    uint64_t v75 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *v30)
                                                                                       + 0x170))(v91);
    uint64_t v77 = v76;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = *v77;
    *uint64_t v77 = 0x8000000000000000;
    sub_2292B92F0(v74, v53, isUniquelyReferenced_nonNull_native);
    *uint64_t v77 = v90;
    swift_bridgeObjectRelease();
    v75(v91, 0);
    return;
  }
  swift_bridgeObjectRelease();
}

uint64_t sub_2292B5430(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_2292B9C8C(v3);
    unint64_t v3 = v5;
    *uint64_t v1 = v5;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v7 = *(void *)(v6 + 16);
  if (v7 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v8 = v7 - 1;
    uint64_t v9 = v7 - 1 - a1;
    if (v9 >= 0)
    {
      uint64_t v10 = v6 + 8 * a1;
      uint64_t v11 = *(void *)(v10 + 32);
      memmove((void *)(v10 + 32), (const void *)(v10 + 40), 8 * v9);
      *(void *)(v6 + 16) = v8;
      sub_2292CC3F8();
      return v11;
    }
  }
  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

uint64_t sub_2292B5514(unint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v5 = v4;
  int v188 = a4;
  uint64_t v186 = a2;
  uint64_t v187 = a3;
  uint64_t v7 = sub_2292CC298();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = *(void **)((char *)v5 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  void *v10 = v11;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F0E0], v7);
  id v12 = v11;
  LOBYTE(v11) = sub_2292CC2A8();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  if ((v11 & 1) == 0) {
    goto LABEL_183;
  }
  uint64_t v192 = MEMORY[0x263F8EE88];
  if (a1 >> 62)
  {
LABEL_184:
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2292CC638();
    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
    {
LABEL_4:
      unint64_t v14 = 0;
      uint64_t v171 = 0;
      id v15 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x268);
      uint64_t v184 = (*MEMORY[0x263F8EED0] & *v5) + 616;
      v185 = v15;
      uint64_t v177 = (uint64_t)v5 + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
      unint64_t v16 = a1 & 0xC000000000000001;
      uint64_t v179 = a1 & 0xFFFFFFFFFFFFFF8;
      unint64_t v178 = a1 + 32;
      uint64_t v182 = OBJC_IVAR___AAUIAwardsDataProvider_visibilityEvaluator;
      long long v172 = xmmword_2292CEF00;
      unint64_t v174 = (unint64_t)"ESS_PLUS";
      unint64_t v173 = a1;
      uint64_t v176 = v13;
      unint64_t v175 = a1 & 0xC000000000000001;
      while (1)
      {
        while (1)
        {
          if (v16)
          {
            id v17 = (id)MEMORY[0x22A6B4140](v14, a1);
          }
          else
          {
            if (v14 >= *(void *)(v179 + 16)) {
              goto LABEL_179;
            }
            id v17 = *(id *)(v178 + 8 * v14);
          }
          uint64_t v18 = v17;
          BOOL v19 = __OFADD__(v14++, 1);
          if (v19)
          {
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
            goto LABEL_184;
          }
          uint64_t v20 = *(void **)((char *)v5 + v182);
          char v21 = v185();
          v183 = v20;
          sub_2292BE728(v186, v187, v20, v21 & 1, v188 & 1);
          char v23 = v22;
          id v24 = objc_msgSend(v18, sel_section);
          uint64_t v25 = sub_2292CC308();
          unint64_t v27 = v26;

          v28._countAndFlagsBits = v25;
          v28._object = v27;
          AAUIAwardsDataProviderSection.init(rawValue:)(v28);
          uint64_t v29 = v189[0];
          if (v189[0] != 7 && (v23 & 1) != 0) {
            break;
          }

          if (v14 == v13) {
            goto LABEL_177;
          }
        }
        id v30 = objc_msgSend(v18, sel_relevantEarnedInstance);
        if (v30)
        {
          unint64_t v31 = v30;
          id v32 = objc_msgSend(v30, sel_externalIdentifier);

          if (v32)
          {
            uint64_t v33 = sub_2292CC308();
            uint64_t v35 = v34;

            uint64_t v36 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v5) + 0x190);
            uint64_t v37 = swift_bridgeObjectRetain();
            uint64_t v38 = v36(v37);
            if (*(void *)(v38 + 16))
            {
              uint64_t v39 = v33;
              unint64_t v40 = sub_2292AC940(v33, v35);
              int64_t v41 = MEMORY[0x263F8EE78];
              if (v42)
              {
                int64_t v41 = *(void *)(*(void *)(v38 + 56) + 8 * v40);
                swift_bridgeObjectRetain();
              }
            }
            else
            {
              uint64_t v39 = v33;
              int64_t v41 = MEMORY[0x263F8EE78];
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v190[0] = v41;
            swift_bridgeObjectRetain();
            id v43 = objc_msgSend(v18, sel_template);
            id v44 = objc_msgSend(v43, sel_uniqueName);

            if (!v44) {
              goto LABEL_195;
            }
            sub_2292CC308();

            sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
            unint64_t v45 = sub_2292C2894();
            char v47 = v46;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v47)
            {
              id v51 = v18;
              MEMORY[0x22A6B3F70]();
              if (*(void *)((v190[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v190[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                sub_2292CC408();
              sub_2292CC428();
            }
            else
            {
              unint64_t v48 = v190[0];
              int64_t v41 = v18;
              if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                || (v48 & 0x8000000000000000) != 0
                || (v48 & 0x4000000000000000) != 0)
              {
                sub_2292B9C8C(v48);
                unint64_t v48 = v49;
                v190[0] = v49;
              }
              if ((v45 & 0x8000000000000000) != 0)
              {
                __break(1u);
LABEL_188:
                __break(1u);
LABEL_189:
                __break(1u);
LABEL_190:
                __break(1u);
LABEL_191:
                __break(1u);
LABEL_192:
                __break(1u);
LABEL_193:
                __break(1u);
LABEL_194:
                __break(1u);
LABEL_195:
                __break(1u);
LABEL_196:
                __break(1u);
LABEL_197:
                __break(1u);
LABEL_198:
                __break(1u);
LABEL_199:
                swift_bridgeObjectRelease();
LABEL_200:
                sub_2292CC718();
                __break(1u);
LABEL_201:

                swift_release();
                __break(1u);
                JUMPOUT(0x2292B6ED0);
              }
              if (v45 >= *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                goto LABEL_188;
              }
              unint64_t v50 = *(void **)((v48 & 0xFFFFFFFFFFFFFF8) + 8 * v45 + 0x20);
              *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 8 * v45 + 0x20) = v41;
            }
            sub_2292CC3F8();
            uint64_t v52 = v190[0];
            uint64_t v53 = (void (*)(unsigned __int8 *, void))(*(uint64_t (**)(unsigned __int8 *))((*MEMORY[0x263F8EED0] & *v5) + 0x1A0))(v189);
            id v55 = v54;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            unint64_t v191 = *v55;
            *id v55 = 0x8000000000000000;
            sub_2292B9428(v52, v39, v35, isUniquelyReferenced_nonNull_native);
            *id v55 = v191;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v53(v189, 0);
            a1 = v173;
          }
        }
        uint64_t v57 = (*MEMORY[0x263F8EED0] & *v5) + 352;
        v181 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x160);
        uint64_t v180 = v57;
        uint64_t v58 = v181();
        if (*(void *)(v58 + 16))
        {
          unint64_t v59 = sub_2292AC8D4(v29);
          unint64_t v60 = MEMORY[0x263F8EE78];
          if (v61)
          {
            unint64_t v60 = *(void *)(*(void *)(v58 + 56) + 8 * v59);
            swift_bridgeObjectRetain();
          }
        }
        else
        {
          unint64_t v60 = MEMORY[0x263F8EE78];
        }
        uint64_t v62 = swift_bridgeObjectRelease();
        unint64_t v191 = v60;
        uint64_t v63 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v5) + 0x178))(v62);
        if (!*(void *)(v63 + 16) || (unint64_t v64 = sub_2292AC8D4(v29), (v65 & 1) == 0))
        {
          swift_bridgeObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
          uint64_t v74 = swift_allocObject();
          *(_OWORD *)(v74 + 16) = v172;
          *(void *)(v74 + 32) = v18;
          *(void *)v189 = v74;
          sub_2292CC3F8();
          uint64_t v75 = *(void *)v189;
          id v76 = v18;
          goto LABEL_78;
        }
        int64_t v41 = *(void *)(*(void *)(v63 + 56) + 8 * v64);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *(void *)v189 = v41;
        swift_bridgeObjectRetain();
        id v66 = objc_msgSend(v18, sel_template);
        id v67 = objc_msgSend(v66, sel_uniqueName);

        if (!v67) {
          goto LABEL_196;
        }
        sub_2292CC308();

        sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
        unint64_t v68 = sub_2292C2894();
        char v70 = v69;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v70)
        {
          id v77 = v18;
          MEMORY[0x22A6B3F70]();
          if (*(void *)((*(void *)v189 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v189 & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
            sub_2292CC408();
          sub_2292CC428();
        }
        else
        {
          unint64_t v71 = *(void *)v189;
          int64_t v41 = v18;
          if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
            || (v71 & 0x8000000000000000) != 0
            || (v71 & 0x4000000000000000) != 0)
          {
            sub_2292B9C8C(v71);
            unint64_t v71 = v72;
            *(void *)v189 = v72;
          }
          if ((v68 & 0x8000000000000000) != 0) {
            goto LABEL_189;
          }
          if (v68 >= *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_190;
          }
          id v73 = *(void **)((v71 & 0xFFFFFFFFFFFFFF8) + 8 * v68 + 0x20);
          *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 8 * v68 + 0x20) = v41;
        }
        sub_2292CC3F8();
        unint64_t v78 = *(void *)v189;
        if ((*(void *)v189 & 0x8000000000000000) != 0 || (*(void *)v189 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain_n();
          v166 = v5;
          uint64_t v79 = (uint64_t)sub_2292B8654(v78);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v79 = *(void *)v189 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
          uint64_t v80 = v5;
        }
        v190[0] = v79;
        int64_t v41 = v5;
        uint64_t v81 = v171;
        sub_2292BC584(v190, (void *)v41);
        uint64_t v171 = v81;
        if (v81) {
          goto LABEL_201;
        }
        swift_bridgeObjectRelease();

        int64_t v41 = v190[0];
        swift_bridgeObjectRelease();
        BOOL v82 = v41 < 0 || (v41 & 0x4000000000000000) != 0;
        if (v82)
        {
          swift_bridgeObjectRetain();
          uint64_t v162 = sub_2292CC638();
          swift_release();
          swift_bridgeObjectRetain();
          uint64_t v163 = sub_2292CC638();
          swift_release();
          if (v163 < 0) {
            goto LABEL_198;
          }
          if (v162 >= 6) {
            uint64_t v164 = 6;
          }
          else {
            uint64_t v164 = v162;
          }
          if (v162 >= 0) {
            uint64_t v83 = v164;
          }
          else {
            uint64_t v83 = 6;
          }
          swift_bridgeObjectRetain();
          uint64_t v165 = sub_2292CC638();
          swift_release();
          if (v165 < v83) {
            goto LABEL_182;
          }
        }
        else if (*(uint64_t *)(v41 + 16) >= 6)
        {
          uint64_t v83 = 6;
        }
        else
        {
          uint64_t v83 = *(void *)(v41 + 16);
        }
        if ((v41 & 0xC000000000000001) != 0 && v83)
        {
          uint64_t v84 = 0;
          do
          {
            uint64_t v85 = v84 + 1;
            sub_2292CC578();
            uint64_t v84 = v85;
          }
          while (v83 != v85);
        }
        if (v82)
        {
          swift_bridgeObjectRetain();
          uint64_t v86 = sub_2292CC648();
          uint64_t v88 = v87;
          uint64_t v90 = v89;
          unint64_t v92 = v91;
          swift_release_n();
          int64_t v41 = v86;
          if ((v92 & 1) == 0) {
            goto LABEL_70;
          }
        }
        else
        {
          uint64_t v90 = 0;
          uint64_t v88 = v41 + 32;
          unint64_t v92 = (2 * v83) | 1;
          if ((v92 & 1) == 0) {
            goto LABEL_70;
          }
        }
        sub_2292CC708();
        swift_unknownObjectRetain_n();
        uint64_t v94 = swift_dynamicCastClass();
        if (!v94)
        {
          swift_unknownObjectRelease();
          uint64_t v94 = MEMORY[0x263F8EE78];
        }
        uint64_t v95 = *(void *)(v94 + 16);
        swift_release();
        if (__OFSUB__(v92 >> 1, v90)) {
          goto LABEL_191;
        }
        if (v95 == (v92 >> 1) - v90)
        {
          uint64_t v75 = swift_dynamicCastClass();
          a1 = v173;
          if (!v75)
          {
            swift_unknownObjectRelease();
            uint64_t v75 = MEMORY[0x263F8EE78];
          }
          goto LABEL_77;
        }
        swift_unknownObjectRelease();
        a1 = v173;
LABEL_70:
        sub_2292ACAA0(v41, v88, v90, v92);
        uint64_t v75 = v93;
LABEL_77:
        swift_unknownObjectRelease();
LABEL_78:
        unint64_t v96 = (void (*)(unsigned __int8 *, void))(*(uint64_t (**)(unsigned __int8 *))((*MEMORY[0x263F8EED0] & *v5) + 0x188))(v189);
        unint64_t v98 = v97;
        char v99 = swift_isUniquelyReferenced_nonNull_native();
        v190[0] = *v98;
        *unint64_t v98 = 0x8000000000000000;
        sub_2292B92F0(v75, v29, v99);
        *unint64_t v98 = v190[0];
        swift_bridgeObjectRelease();
        v96(v189, 0);
        int64_t v41 = v191;
        swift_bridgeObjectRetain();
        id v100 = objc_msgSend(v18, sel_template);
        id v101 = objc_msgSend(v100, sel_uniqueName);

        if (!v101) {
          goto LABEL_194;
        }
        sub_2292CC308();

        sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
        unint64_t v102 = sub_2292C2894();
        char v104 = v103;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v104)
        {
          id v109 = v18;
          MEMORY[0x22A6B3F70]();
          if (*(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v191 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2292CC408();
          }
          sub_2292CC428();
        }
        else
        {
          unint64_t v105 = v191;
          id v106 = v18;
          if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
            || (v105 & 0x8000000000000000) != 0
            || (v105 & 0x4000000000000000) != 0)
          {
            sub_2292B9C8C(v105);
            unint64_t v105 = v107;
            unint64_t v191 = v107;
          }
          if ((v102 & 0x8000000000000000) != 0) {
            goto LABEL_180;
          }
          if (v102 >= *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_181;
          }
          v108 = *(void **)((v105 & 0xFFFFFFFFFFFFFF8) + 8 * v102 + 0x20);
          *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 8 * v102 + 0x20) = v106;
        }
        uint64_t v110 = sub_2292CC3F8();
        uint64_t v111 = ((uint64_t (*)(uint64_t))v181)(v110);
        if (*(void *)(v111 + 16))
        {
          unint64_t v112 = sub_2292AC8D4(0);
          if (v113)
          {
            int64_t v41 = *(void *)(*(void *)(v111 + 56) + 8 * v112);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            id v114 = objc_msgSend(v18, sel_template);
            id v115 = objc_msgSend(v114, sel_uniqueName);

            if (!v115) {
              goto LABEL_197;
            }
            sub_2292CC308();

            unint64_t v116 = sub_2292C2894();
            char v118 = v117;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (v118) {
              goto LABEL_97;
            }
            v119 = (void (*)(unsigned __int8 *, void))(*(uint64_t (**)(unsigned __int8 *))((*MEMORY[0x263F8EED0] & *v5) + 0x170))(v189);
            v120 = sub_2292B6F40(v190, 0);
            if (*v121)
            {
              v122 = (void *)sub_2292B5430(v116);
              ((void (*)(uint64_t *, void))v120)(v190, 0);
              v119(v189, 0);
            }
            else
            {
              ((void (*)(uint64_t *, void))v120)(v190, 0);
              v119(v189, 0);
            }
            uint64_t v138 = v192;
            sub_2292CC748();
            swift_bridgeObjectRetain();
            sub_2292CC338();
            int64_t v41 = (int64_t)v189;
            uint64_t v139 = sub_2292CC758();
            uint64_t v140 = -1 << *(unsigned char *)(v138 + 32);
            unint64_t v141 = v139 & ~v140;
            if ((*(void *)(v138 + 56 + ((v141 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v141))
            {
              uint64_t v142 = ~v140;
              while (2)
              {
                int64_t v41 = 0xE800000000000000;
                switch(*(unsigned char *)(*(void *)(v138 + 48) + v141))
                {
                  case 1:
                  case 2:
                    goto LABEL_127;
                  case 3:
                    int64_t v41 = 0xEC00000053554C50;
                    goto LABEL_127;
                  case 4:
                    int64_t v41 = 0xEF4E4F4954494445;
                    goto LABEL_127;
                  case 5:
                    int64_t v41 = v174 | 0x8000000000000000;
                    goto LABEL_127;
                  case 6:
                    int64_t v41 = 0xEC000000534E4F49;
LABEL_127:
                    char v143 = sub_2292CC6F8();
                    swift_bridgeObjectRelease();
                    if (v143) {
                      goto LABEL_135;
                    }
                    unint64_t v141 = (v141 + 1) & v142;
                    if (((*(void *)(v138 + 56 + ((v141 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v141) & 1) == 0) {
                      break;
                    }
                    continue;
                  default:
                    swift_bridgeObjectRelease();
LABEL_135:
                    swift_bridgeObjectRelease();
                    a1 = v173;
                    goto LABEL_97;
                }
                break;
              }
            }
            swift_bridgeObjectRelease();
            int v144 = swift_isUniquelyReferenced_nonNull_native();
            v190[0] = v138;
            if (*(void *)(v138 + 24) <= *(void *)(v138 + 16))
            {
              if (v144) {
                sub_2292B9D08();
              }
              else {
                sub_2292BA5FC();
              }
              uint64_t v138 = v190[0];
              sub_2292CC748();
              sub_2292CC338();
              int64_t v41 = (int64_t)v189;
              uint64_t v156 = sub_2292CC758();
              uint64_t v157 = -1 << *(unsigned char *)(v138 + 32);
              unint64_t v141 = v156 & ~v157;
              if ((*(void *)(v138 + 56 + ((v141 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v141))
              {
                uint64_t v158 = ~v157;
                while (2)
                {
                  int64_t v41 = 0xE800000000000000;
                  switch(*(unsigned char *)(*(void *)(v138 + 48) + v141))
                  {
                    case 1:
                    case 2:
                      goto LABEL_159;
                    case 3:
                      int64_t v41 = 0xEC00000053554C50;
                      goto LABEL_159;
                    case 4:
                      int64_t v41 = 0xEF4E4F4954494445;
                      goto LABEL_159;
                    case 5:
                      int64_t v41 = v174 | 0x8000000000000000;
                      goto LABEL_159;
                    case 6:
                      int64_t v41 = 0xEC000000534E4F49;
LABEL_159:
                      char v159 = sub_2292CC6F8();
                      swift_bridgeObjectRelease();
                      if (v159) {
                        goto LABEL_200;
                      }
                      unint64_t v141 = (v141 + 1) & v158;
                      if (((*(void *)(v138 + 56 + ((v141 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v141) & 1) == 0) {
                        break;
                      }
                      continue;
                    default:
                      goto LABEL_199;
                  }
                  break;
                }
              }
              a1 = v173;
            }
            else
            {
              a1 = v173;
              if ((v144 & 1) == 0)
              {
                int64_t v41 = (int64_t)v190;
                sub_2292BA468();
                uint64_t v138 = v190[0];
              }
            }
            *(void *)(v138 + ((v141 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v141;
            *(unsigned char *)(*(void *)(v138 + 48) + v141) = 0;
            uint64_t v160 = *(void *)(v138 + 16);
            BOOL v19 = __OFADD__(v160, 1);
            uint64_t v161 = v160 + 1;
            if (v19) {
              goto LABEL_193;
            }
            *(void *)(v138 + 16) = v161;
            uint64_t v192 = v138;
          }
        }
        swift_bridgeObjectRelease();
LABEL_97:
        id v123 = objc_msgSend(v18, sel_shallowCopyWithRelevantEarnedInstance_, 0);
        if (sub_2292BF0EC(v177)
          && (((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x280))() & 1) == 0
           || (objc_msgSend(v18, sel_isRingsBased) & 1) == 0))
        {
          char v124 = v185();
          sub_2292BE728(v186, v187, v183, v124 & 1, v188 & 1);
          if (v125)
          {
            v126 = (void (*)(unsigned __int8 *, void))(*(uint64_t (**)(unsigned __int8 *))((*MEMORY[0x263F8EED0] & *v5) + 0x170))(v189);
            v128 = sub_2292B6F40(v190, 0);
            if (*v127)
            {
              v129 = v127;
              id v130 = v123;
              MEMORY[0x22A6B3F70]();
              if (*(void *)((*v129 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v129 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_2292CC408();
              }
              sub_2292CC428();
              sub_2292CC3F8();
            }
            ((void (*)(uint64_t *, void))v128)(v190, 0);
            v126(v189, 0);
            v183 = v123;
            uint64_t v131 = v192;
            sub_2292CC748();
            swift_bridgeObjectRetain();
            sub_2292CC338();
            int64_t v41 = (int64_t)v189;
            uint64_t v132 = sub_2292CC758();
            uint64_t v133 = -1 << *(unsigned char *)(v131 + 32);
            unint64_t v134 = v132 & ~v133;
            if ((*(void *)(v131 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134))
            {
              uint64_t v135 = ~v133;
              while (2)
              {
                int64_t v41 = 0xE800000000000000;
                switch(*(unsigned char *)(*(void *)(v131 + 48) + v134))
                {
                  case 1:
                  case 2:
                    goto LABEL_112;
                  case 3:
                    int64_t v41 = 0xEC00000053554C50;
                    goto LABEL_112;
                  case 4:
                    int64_t v41 = 0xEF4E4F4954494445;
                    goto LABEL_112;
                  case 5:
                    int64_t v41 = v174 | 0x8000000000000000;
                    goto LABEL_112;
                  case 6:
                    int64_t v41 = 0xEC000000534E4F49;
LABEL_112:
                    char v136 = sub_2292CC6F8();
                    swift_bridgeObjectRelease();
                    if (v136) {
                      goto LABEL_132;
                    }
                    unint64_t v134 = (v134 + 1) & v135;
                    if (((*(void *)(v131 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134) & 1) == 0) {
                      break;
                    }
                    continue;
                  default:
                    swift_bridgeObjectRelease();
LABEL_132:
                    swift_bridgeObjectRelease();
                    a1 = v173;
                    id v123 = v183;
                    goto LABEL_149;
                }
                break;
              }
            }
            swift_bridgeObjectRelease();
            int v137 = swift_isUniquelyReferenced_nonNull_native();
            v190[0] = v131;
            if (*(void *)(v131 + 24) <= *(void *)(v131 + 16))
            {
              id v123 = v183;
              if (v137) {
                sub_2292B9D08();
              }
              else {
                sub_2292BA5FC();
              }
              uint64_t v131 = v190[0];
              sub_2292CC748();
              sub_2292CC338();
              int64_t v41 = (int64_t)v189;
              uint64_t v145 = sub_2292CC758();
              uint64_t v146 = -1 << *(unsigned char *)(v131 + 32);
              unint64_t v134 = v145 & ~v146;
              if ((*(void *)(v131 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134))
              {
                uint64_t v147 = ~v146;
                while (2)
                {
                  int64_t v41 = 0xE800000000000000;
                  switch(*(unsigned char *)(*(void *)(v131 + 48) + v134))
                  {
                    case 1:
                    case 2:
                      goto LABEL_144;
                    case 3:
                      int64_t v41 = 0xEC00000053554C50;
                      goto LABEL_144;
                    case 4:
                      int64_t v41 = 0xEF4E4F4954494445;
                      goto LABEL_144;
                    case 5:
                      int64_t v41 = v174 | 0x8000000000000000;
                      goto LABEL_144;
                    case 6:
                      int64_t v41 = 0xEC000000534E4F49;
LABEL_144:
                      char v148 = sub_2292CC6F8();
                      swift_bridgeObjectRelease();
                      if (v148) {
                        goto LABEL_200;
                      }
                      unint64_t v134 = (v134 + 1) & v147;
                      if ((*(void *)(v131 + 56 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v134)) {
                        continue;
                      }
                      id v123 = v183;
                      break;
                    default:
                      goto LABEL_199;
                  }
                  break;
                }
              }
            }
            else
            {
              id v123 = v183;
              if ((v137 & 1) == 0)
              {
                int64_t v41 = (int64_t)v190;
                sub_2292BA468();
                uint64_t v131 = v190[0];
              }
            }
            *(void *)(v131 + ((v134 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v134;
            *(unsigned char *)(*(void *)(v131 + 48) + v134) = 0;
            uint64_t v149 = *(void *)(v131 + 16);
            BOOL v19 = __OFADD__(v149, 1);
            uint64_t v150 = v149 + 1;
            if (v19) {
              goto LABEL_192;
            }
            *(void *)(v131 + 16) = v150;
            uint64_t v192 = v131;
            swift_bridgeObjectRelease();
            a1 = v173;
          }
        }
LABEL_149:
        uint64_t v151 = v191;
        v152 = (void (*)(unsigned __int8 *, void))(*(uint64_t (**)(unsigned __int8 *))((*MEMORY[0x263F8EED0] & *v5) + 0x170))(v189);
        v154 = v153;
        char v155 = swift_isUniquelyReferenced_nonNull_native();
        v190[0] = *v154;
        uint64_t *v154 = 0x8000000000000000;
        sub_2292B92F0(v151, v29, v155);
        uint64_t *v154 = v190[0];
        swift_bridgeObjectRelease();
        v152(v189, 0);
        sub_2292B98F4(v189, v29);

        uint64_t v13 = v176;
        unint64_t v16 = v175;
        if (v14 == v176)
        {
LABEL_177:
          swift_bridgeObjectRelease();
          uint64_t v167 = v192;
          goto LABEL_186;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v167 = MEMORY[0x263F8EE88];
LABEL_186:
  uint64_t v168 = sub_2292B857C(v167);
  swift_bridgeObjectRelease();
  return v168;
}

void (*sub_2292B6F40(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_2292BA998(v4, a2);
  return sub_2292B6FA0;
}

void sub_2292B6FA0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_2292B6FEC(SEL *a1)
{
  uint64_t v3 = sub_2292CC298();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (void **)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *uint64_t v6 = v7;
  (*(void (**)(void *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F8F0E0], v3);
  id v8 = v7;
  LOBYTE(v7) = sub_2292CC2A8();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v6, v3);
  if ((v7 & 1) == 0) {
    goto LABEL_33;
  }
  uint64_t v48 = MEMORY[0x263F8EE88];
  uint64_t v49 = MEMORY[0x263F8EE88];
  char v47 = (void *)MEMORY[0x263F8EE80];
  if ((unint64_t)a1 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2292CC638();
    if (v9) {
      goto LABEL_4;
    }
LABEL_35:
    uint64_t v38 = swift_bridgeObjectRelease();
    uint64_t v39 = MEMORY[0x263F8EE80];
LABEL_36:
    MEMORY[0x270FA5388](v38);
    *(&v44 - 4) = v1;
    *(&v44 - 3) = &v49;
    *(&v44 - 2) = &v48;
    sub_2292BCF3C(v39, (void (*)(unsigned char *, uint64_t))sub_2292BC898);
    swift_bridgeObjectRelease();
    uint64_t v40 = swift_bridgeObjectRetain();
    uint64_t v41 = sub_2292B857C(v40);
    swift_bridgeObjectRelease();
    uint64_t v42 = swift_bridgeObjectRetain();
    sub_2292B857C(v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    return v41;
  }
  uint64_t v9 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_35;
  }
LABEL_4:
  if (v9 >= 1)
  {
    id v44 = v1;
    uint64_t v45 = v9;
    uint64_t v10 = 0;
    unint64_t v11 = (unint64_t)a1 & 0xC000000000000001;
    id v12 = (SEL *)&_swift_FORCE_LOAD___swiftUIKit___ActivityAchievementsUI;
    while (1)
    {
      uint64_t v13 = v11 ? (char *)MEMORY[0x22A6B4140](v10, a1) : (char *)(id)a1[v10 + 4];
      unint64_t v14 = v13;
      id v15 = objc_msgSend(v13, v12[453], v44);
      sub_2292CC308();

      unint64_t v16 = sub_2292CC698();
      swift_bridgeObjectRelease();
      if (v16 <= 6) {
        break;
      }
LABEL_8:

      if (v9 == ++v10)
      {
        uint64_t v38 = swift_bridgeObjectRelease();
        uint64_t v39 = (uint64_t)v47;
        uint64_t v1 = v44;
        goto LABEL_36;
      }
    }
    uint64_t v1 = v47;
    if (v47[2])
    {
      sub_2292AC8D4(v16);
      if (v17)
      {
LABEL_27:
        uint64_t v35 = sub_2292B6F40(v46, v16);
        if (*v34)
        {
          uint64_t v36 = v34;
          uint64_t v37 = v14;
          MEMORY[0x22A6B3F70]();
          if (*(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2292CC408();
          }
          sub_2292CC428();
          sub_2292CC3F8();
        }
        ((void (*)(void *, void))v35)(v46, 0);
        goto LABEL_8;
      }
    }
    unint64_t v18 = v11;
    BOOL v19 = a1;
    a1 = v12;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46[0] = v1;
    unint64_t v22 = sub_2292AC8D4(v16);
    uint64_t v23 = v1[2];
    BOOL v24 = (v21 & 1) == 0;
    uint64_t v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    char v26 = v21;
    if (v1[3] < v25)
    {
      sub_2292B8918(v25, isUniquelyReferenced_nonNull_native);
      uint64_t v1 = (void *)v46[0];
      unint64_t v27 = sub_2292AC8D4(v16);
      if ((v26 & 1) != (v28 & 1)) {
        goto LABEL_38;
      }
      unint64_t v22 = v27;
      uint64_t v29 = (void *)v46[0];
      if ((v26 & 1) == 0) {
        goto LABEL_24;
      }
LABEL_22:
      uint64_t v30 = v29[7];
      swift_bridgeObjectRelease();
      *(void *)(v30 + 8 * v22) = MEMORY[0x263F8EE78];
LABEL_26:
      char v47 = v29;
      swift_bridgeObjectRelease();
      id v12 = a1;
      a1 = v19;
      unint64_t v11 = v18;
      uint64_t v9 = v45;
      goto LABEL_27;
    }
    if (isUniquelyReferenced_nonNull_native)
    {
      uint64_t v29 = (void *)v46[0];
      if (v21) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v1 = v46;
      sub_2292B9598();
      uint64_t v29 = (void *)v46[0];
      if (v26) {
        goto LABEL_22;
      }
    }
LABEL_24:
    v29[(v22 >> 6) + 8] |= 1 << v22;
    *(unsigned char *)(v29[6] + v22) = v16;
    *(void *)(v29[7] + 8 * v22) = MEMORY[0x263F8EE78];
    uint64_t v31 = v29[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_32;
    }
    v29[2] = v33;
    goto LABEL_26;
  }
  __break(1u);
LABEL_38:
  uint64_t result = sub_2292CC728();
  __break(1u);
  return result;
}

uint64_t sub_2292B74AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6)
{
  int v23 = a6;
  uint64_t v12 = sub_2292CC268();
  uint64_t v27 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_2292CC288();
  uint64_t v25 = *(void *)(v15 - 8);
  uint64_t v26 = v15;
  MEMORY[0x270FA5388](v15);
  char v17 = &v22[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = *(void *)(v6 + OBJC_IVAR___AAUIAwardsDataProvider_notifyQueue);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = a1;
  *(void *)(v19 + 32) = a2;
  *(void *)(v19 + 40) = a3;
  *(void *)(v19 + 48) = a4;
  *(unsigned char *)(v19 + 56) = a5;
  *(unsigned char *)(v19 + 57) = v23;
  aBlock[4] = sub_2292BD12C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2292B198C;
  aBlock[3] = &block_descriptor_60;
  uint64_t v20 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2292CC278();
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_2292B19D0(&qword_26AF36A10, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A38);
  sub_2292BD688(&qword_26AF36A40, &qword_26AF36A38);
  sub_2292CC518();
  MEMORY[0x22A6B4050](0, v17, v14, v20);
  _Block_release(v20);
  (*(void (**)(unsigned char *, uint64_t))(v27 + 8))(v14, v12);
  (*(void (**)(unsigned char *, uint64_t))(v25 + 8))(v17, v26);
  swift_release();
  return swift_release();
}

void sub_2292B77EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, int a7)
{
  uint64_t v57 = a2;
  uint64_t v13 = sub_2292CC258();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  char v17 = (char *)MEMORY[0x22A6B5170](a1 + 16);
  if (v17)
  {
    LODWORD(v59) = a7;
    uint64_t v60 = v13;
    id v44 = v17;
    uint64_t v18 = *(void *)&v17[OBJC_IVAR___AAUIAwardsDataProvider_protectedObservers];
    uint64_t v19 = (os_unfair_lock_s *)(v18 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(v18 + 24));
    id v20 = objc_msgSend(*(id *)(v18 + 16), sel_allObjects);
    uint64_t v21 = MEMORY[0x263F8EE50];
    unint64_t v22 = sub_2292CC3D8();

    unint64_t v23 = v22;
    os_unfair_lock_unlock(v19);
    unint64_t v56 = v16;
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2292CC638();
      swift_bridgeObjectRelease();
      if (v25) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v25)
      {
LABEL_4:
        if (v25 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v26 = 0;
        uint64_t v53 = (void (**)(char *, uint64_t))(v14 + 8);
        unint64_t v54 = (void (**)(char *, uint64_t, uint64_t))(v14 + 16);
        unint64_t v27 = v23 & 0xC000000000000001;
        *(void *)&long long v24 = 136315138;
        long long v47 = v24;
        uint64_t v46 = v21 + 8;
        uint64_t v45 = MEMORY[0x263F8EE58] + 8;
        unsigned int v51 = v59 & 1;
        unsigned int v52 = a6 & 1;
        uint64_t v58 = v25;
        uint64_t v49 = a5;
        uint64_t v50 = a4;
        unint64_t v55 = v23;
        unint64_t v48 = v23 & 0xC000000000000001;
        do
        {
          if (v27)
          {
            uint64_t v29 = MEMORY[0x22A6B4140](v26, v23);
          }
          else
          {
            uint64_t v29 = *(void *)(v23 + 8 * v26 + 32);
            swift_unknownObjectRetain();
          }
          swift_unknownObjectRetain();
          swift_getObjectType();
          uint64_t v30 = swift_conformsToProtocol2();
          if (v30) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = 0;
          }
          if (v30) {
            uint64_t v32 = v29;
          }
          else {
            uint64_t v32 = 0;
          }
          if (v32)
          {
            uint64_t v59 = v31;
            uint64_t v33 = sub_2292ADAD0();
            uint64_t v34 = v56;
            (*v54)(v56, v33, v60);
            swift_unknownObjectRetain_n();
            uint64_t v35 = sub_2292CC238();
            os_log_type_t v36 = sub_2292CC468();
            if (os_log_type_enabled(v35, v36))
            {
              uint64_t v37 = swift_slowAlloc();
              uint64_t v38 = swift_slowAlloc();
              uint64_t v61 = v29;
              uint64_t v62 = v38;
              *(_DWORD *)uint64_t v37 = v47;
              swift_unknownObjectRetain();
              uint64_t v39 = sub_2292CC318();
              *(void *)(v37 + 4) = sub_2292AE150(v39, v40, &v62);
              swift_unknownObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_229290000, v35, v36, "[AAUIAwardsDataProvider] Notifying observer of update: %s", (uint8_t *)v37, 0xCu);
              swift_arrayDestroy();
              uint64_t v41 = v38;
              a5 = v49;
              a4 = v50;
              MEMORY[0x22A6B5100](v41, -1, -1);
              uint64_t v42 = v37;
              unint64_t v27 = v48;
              MEMORY[0x22A6B5100](v42, -1, -1);
            }
            else
            {

              swift_unknownObjectRelease_n();
            }
            (*v53)(v34, v60);
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))(v59 + 8))(v57, a3, a4, a5, v52, v51, ObjectType);
            unint64_t v23 = v55;
          }
          ++v26;
          swift_unknownObjectRelease_n();
        }
        while (v58 != v26);
      }
    }

    swift_bridgeObjectRelease();
  }
}

id AAUIAwardsDataProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AAUIAwardsDataProvider.init()()
{
}

id sub_2292B7CB8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = sub_2292CC638();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)MEMORY[0x22A6B4140](0, v3))
  {
    unint64_t v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)MEMORY[0x22A6B4140](0, a2);
LABEL_22:
    uint64_t v13 = v12;
    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    char v14 = sub_2292CC4B8();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)MEMORY[0x22A6B4140](v16 + 1, v3);
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)MEMORY[0x22A6B4140](v16 + 1, a2);
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = sub_2292CC4B8();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      uint64_t v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        unint64_t v27 = *v25++;
        uint64_t v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = sub_2292CC4B8();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

char *sub_2292B7FA4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        JUMPOUT(0x2292B80A0);
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
    id v12 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (a1) {
      goto LABEL_13;
    }
LABEL_21:
    sub_2292BB82C(0, v8, v12, (uint64_t)a4);
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A98);
  uint64_t v10 = (char *)swift_allocObject();
  size_t v11 = _swift_stdlib_malloc_size(v10);
  *((void *)v10 + 2) = v8;
  *((void *)v10 + 3) = 2 * v11 - 64;
  id v12 = v10 + 32;
  if ((a1 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_13:
  if (v10 != a4 || v12 >= &a4[v8 + 32]) {
    memmove(v12, a4 + 32, v8);
  }
  *((void *)a4 + 2) = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2292B80D8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_2292CC638();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2292CC638();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x22A6B4150](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *id v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_2292BB450(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_2292CC638();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();
  return sub_2292CC3F8();
}

uint64_t sub_2292B82A4(uint64_t a1)
{
  size_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    size_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_2292B7FA4(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  size_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[v8] && (unint64_t)v10 < a1 + 32 + v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  size_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *id v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

uint64_t sub_2292B83F0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2292B8410(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2292B8410(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AA0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

uint64_t sub_2292B857C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A98);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  int64_t v5 = sub_2292BB684(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_2292AD968();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_2292B8654(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_2292BB450((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

char *sub_2292B874C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26830F9E8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2292B8848(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_2292CC688();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_2292B8904(uint64_t a1)
{
  return sub_2292B874C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2292B8918(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A80);
  uint64_t v6 = sub_2292CC668();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v20 >= v31) {
      break;
    }
    unint64_t v21 = v32[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v31) {
        break;
      }
      unint64_t v21 = v32[v12];
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v22 >= v31) {
          break;
        }
        unint64_t v21 = v32[v22];
        if (!v21)
        {
          while (1)
          {
            int64_t v12 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_41;
            }
            if (v12 >= v31) {
              goto LABEL_34;
            }
            unint64_t v21 = v32[v12];
            ++v22;
            if (v21) {
              goto LABEL_30;
            }
          }
        }
        int64_t v12 = v22;
      }
    }
LABEL_30:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_31:
    char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
    if ((a2 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2292CC748();
    sub_2292CC338();
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_2292CC758();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v14) >> 6;
    do
    {
      if (++v16 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x2292B8CECLL);
      }
      BOOL v25 = v16 == v24;
      if (v16 == v24) {
        unint64_t v16 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v11 + 8 * v16);
    }
    while (v26 == -1);
    unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
LABEL_8:
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
    ++*(void *)(v7 + 16);
  }
LABEL_34:
  swift_release();
  uint64_t v3 = v2;
  if (a2)
  {
    uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
    if (v29 >= 64) {
      bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      void *v32 = -1 << v29;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_2292B8D08(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A88);
  char v36 = a2;
  uint64_t v6 = sub_2292CC668();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2292CC748();
    sub_2292CC338();
    uint64_t result = sub_2292CC758();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_2292B9020(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2292CC528();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2292CC748();
        sub_2292CC338();
        swift_bridgeObjectRelease();
        uint64_t result = sub_2292CC758();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (unsigned char *)(v10 + v3);
          int64_t v12 = (unsigned char *)(v10 + v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            unsigned char *v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          unint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            void *v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
    JUMPOUT(0x2292B92D4);
  }
  *(void *)(a2 + 16) = v21;
  ++*(_DWORD *)(a2 + 36);
  return result;
}

uint64_t sub_2292B92F0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2292AC8D4(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_2292B9598();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_2292B8918(result, a3 & 1);
  uint64_t result = sub_2292AC8D4(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_2292CC728();
  __break(1u);
  return result;
}

uint64_t sub_2292B9428(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2292AC940(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2292B973C();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_2292B8D08(v15, a4 & 1);
  unint64_t v21 = sub_2292AC940(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_2292CC728();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;
  return swift_bridgeObjectRetain();
}

void *sub_2292B9598()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A80);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2292CC658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2292B973C()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2292CC658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2292B98F4(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2292AF0C4();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_2292BA0D8(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v21;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_31;
  }
  uint64_t v9 = ~v7;
  while (2)
  {
    unint64_t v10 = 0xE900000000000054;
    unint64_t v11 = 0x495F524F465F4F47;
    switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
    {
      case 1:
        unint64_t v10 = 0xE800000000000000;
        unint64_t v11 = 0x5954495649544341;
        break;
      case 2:
        unint64_t v10 = 0xE800000000000000;
        unint64_t v11 = 0x5354554F4B524F57;
        break;
      case 3:
        unint64_t v11 = 0x5F5353454E544946;
        uint64_t v12 = 1398099024;
        goto LABEL_10;
      case 4:
        unint64_t v11 = 0x5F444554494D494CLL;
        unint64_t v10 = 0xEF4E4F4954494445;
        break;
      case 5:
        unint64_t v10 = 0x80000002292CFE80;
        unint64_t v11 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v11 = 0x54495445504D4F43;
        uint64_t v12 = 1397641033;
LABEL_10:
        unint64_t v10 = v12 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        break;
      default:
        break;
    }
    unint64_t v13 = 0x495F524F465F4F47;
    unint64_t v14 = 0xE900000000000054;
    switch((char)a2)
    {
      case 1:
        unint64_t v14 = 0xE800000000000000;
        if (v11 == 0x5954495649544341) {
          goto LABEL_24;
        }
        goto LABEL_25;
      case 2:
        unint64_t v14 = 0xE800000000000000;
        if (v11 != 0x5354554F4B524F57) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 3:
        uint64_t v15 = 0x5F5353454E544946;
        uint64_t v16 = 1398099024;
        goto LABEL_23;
      case 4:
        unint64_t v14 = 0xEF4E4F4954494445;
        if (v11 != 0x5F444554494D494CLL) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 5:
        unint64_t v14 = 0x80000002292CFE80;
        unint64_t v13 = 0xD000000000000012;
        goto LABEL_20;
      case 6:
        uint64_t v15 = 0x54495445504D4F43;
        uint64_t v16 = 1397641033;
LABEL_23:
        unint64_t v14 = v16 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v11 == v15) {
          goto LABEL_24;
        }
        goto LABEL_25;
      default:
LABEL_20:
        if (v11 != v13) {
          goto LABEL_25;
        }
LABEL_24:
        if (v10 == v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_30;
        }
LABEL_25:
        char v17 = sub_2292CC6F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
          unint64_t v8 = (v8 + 1) & v9;
          if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
            goto LABEL_27;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_30:
        uint64_t result = 0;
        LOBYTE(a2) = *(unsigned char *)(*(void *)(*v3 + 48) + v8);
LABEL_31:
        *a1 = a2;
        return result;
    }
  }
}

void sub_2292B9C8C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2292CC638();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x22A6B4150);
}

uint64_t sub_2292B9D08()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A70);
  uint64_t v3 = sub_2292CC548();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_38;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = (void *)(v2 + 56);
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v11 << 6);
      goto LABEL_33;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v19 >= v9) {
      break;
    }
    unint64_t v20 = v6[v19];
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v9) {
        break;
      }
      unint64_t v20 = v6[v11];
      if (!v20)
      {
        int64_t v11 = v19 + 2;
        if (v19 + 2 >= v9) {
          break;
        }
        unint64_t v20 = v6[v11];
        if (!v20)
        {
          int64_t v21 = v19 + 3;
          if (v21 >= v9) {
            break;
          }
          unint64_t v20 = v6[v21];
          if (!v20)
          {
            while (1)
            {
              int64_t v11 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_40;
              }
              if (v11 >= v9) {
                goto LABEL_34;
              }
              unint64_t v20 = v6[v11];
              ++v21;
              if (v20) {
                goto LABEL_32;
              }
            }
          }
          int64_t v11 = v21;
        }
      }
    }
LABEL_32:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_33:
    char v26 = *(unsigned char *)(*(void *)(v2 + 48) + v18);
    sub_2292CC748();
    sub_2292CC338();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_2292CC758();
    uint64_t v13 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v14 = v12 & ~v13;
    unint64_t v15 = v14 >> 6;
    if (((-1 << v14) & ~*(void *)(v10 + 8 * (v14 >> 6))) != 0)
    {
      unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v10 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v13) >> 6;
    do
    {
      if (++v15 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        JUMPOUT(0x2292BA0BCLL);
      }
      BOOL v24 = v15 == v23;
      if (v15 == v23) {
        unint64_t v15 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v10 + 8 * v15);
    }
    while (v25 == -1);
    unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
LABEL_8:
    *(void *)(v10 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    *(unsigned char *)(*(void *)(v4 + 48) + v16) = v26;
    ++*(void *)(v4 + 16);
  }
LABEL_34:
  swift_release();
  unint64_t v1 = v0;
  uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
  if (v27 > 63) {
    bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v6 = -1 << v27;
  }
  *(void *)(v2 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_2292BA0D8(uint64_t result, unint64_t a2, char a3)
{
  char v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  char v23 = result;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if (a3)
    {
      sub_2292B9D08();
    }
    else
    {
      if (v7 > v6)
      {
        uint64_t result = (uint64_t)sub_2292BA468();
        goto LABEL_34;
      }
      sub_2292BA5FC();
    }
    uint64_t v8 = *v3;
    uint64_t result = sub_2292AF0C4();
    uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
    a2 = result & ~v9;
    if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v10 = ~v9;
      while (2)
      {
        unint64_t v11 = 0xE900000000000054;
        unint64_t v12 = 0x495F524F465F4F47;
        switch(*(unsigned char *)(*(void *)(v8 + 48) + a2))
        {
          case 1:
            unint64_t v11 = 0xE800000000000000;
            unint64_t v12 = 0x5954495649544341;
            break;
          case 2:
            unint64_t v11 = 0xE800000000000000;
            unint64_t v12 = 0x5354554F4B524F57;
            break;
          case 3:
            unint64_t v12 = 0x5F5353454E544946;
            uint64_t v13 = 1398099024;
            goto LABEL_17;
          case 4:
            unint64_t v12 = 0x5F444554494D494CLL;
            unint64_t v11 = 0xEF4E4F4954494445;
            break;
          case 5:
            unint64_t v11 = 0x80000002292CFE80;
            unint64_t v12 = 0xD000000000000012;
            break;
          case 6:
            unint64_t v12 = 0x54495445504D4F43;
            uint64_t v13 = 1397641033;
LABEL_17:
            unint64_t v11 = v13 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            break;
          default:
            break;
        }
        unint64_t v14 = 0x495F524F465F4F47;
        unint64_t v15 = 0xE900000000000054;
        switch(v5)
        {
          case 1:
            unint64_t v15 = 0xE800000000000000;
            if (v12 != 0x5954495649544341) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 2:
            unint64_t v15 = 0xE800000000000000;
            if (v12 != 0x5354554F4B524F57) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 3:
            uint64_t v16 = 0x5F5353454E544946;
            uint64_t v17 = 1398099024;
            goto LABEL_30;
          case 4:
            unint64_t v15 = 0xEF4E4F4954494445;
            if (v12 != 0x5F444554494D494CLL) {
              goto LABEL_32;
            }
            goto LABEL_31;
          case 5:
            unint64_t v15 = 0x80000002292CFE80;
            unint64_t v14 = 0xD000000000000012;
            goto LABEL_27;
          case 6:
            uint64_t v16 = 0x54495445504D4F43;
            uint64_t v17 = 1397641033;
LABEL_30:
            unint64_t v15 = v17 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
            if (v12 == v16) {
              goto LABEL_31;
            }
            goto LABEL_32;
          default:
LABEL_27:
            if (v12 != v14) {
              goto LABEL_32;
            }
LABEL_31:
            if (v11 == v15) {
              goto LABEL_37;
            }
LABEL_32:
            char v18 = sub_2292CC6F8();
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (v18) {
              goto LABEL_38;
            }
            a2 = (a2 + 1) & v10;
            if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
              break;
            }
            continue;
        }
        break;
      }
    }
  }
LABEL_34:
  uint64_t v19 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v19 + 48) + a2) = v23;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
    __break(1u);
LABEL_37:
    swift_bridgeObjectRelease_n();
LABEL_38:
    sub_2292CC718();
    __break(1u);
    JUMPOUT(0x2292BA430);
  }
  *(void *)(v19 + 16) = v22;
  return result;
}

void *sub_2292BA468()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A70);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2292CC538();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2292BA5FC()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A70);
  uint64_t v3 = sub_2292CC548();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_36;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v11 << 6);
      goto LABEL_33;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_37;
    }
    if (v19 >= v9) {
      break;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v9) {
        break;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v11);
      if (!v20)
      {
        int64_t v11 = v19 + 2;
        if (v19 + 2 >= v9) {
          break;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v11);
        if (!v20)
        {
          int64_t v21 = v19 + 3;
          if (v21 >= v9) {
            break;
          }
          unint64_t v20 = *(void *)(v6 + 8 * v21);
          if (!v20)
          {
            while (1)
            {
              int64_t v11 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                goto LABEL_38;
              }
              if (v11 >= v9) {
                goto LABEL_34;
              }
              unint64_t v20 = *(void *)(v6 + 8 * v11);
              ++v21;
              if (v20) {
                goto LABEL_32;
              }
            }
          }
          int64_t v11 = v21;
        }
      }
    }
LABEL_32:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_33:
    char v26 = *(unsigned char *)(*(void *)(v2 + 48) + v18);
    sub_2292CC748();
    sub_2292CC338();
    swift_bridgeObjectRelease();
    uint64_t v12 = sub_2292CC758();
    uint64_t v13 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v14 = v12 & ~v13;
    unint64_t v15 = v14 >> 6;
    if (((-1 << v14) & ~*(void *)(v10 + 8 * (v14 >> 6))) != 0)
    {
      unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v10 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v22 = 0;
    unint64_t v23 = (unint64_t)(63 - v13) >> 6;
    do
    {
      if (++v15 == v23 && (v22 & 1) != 0)
      {
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        JUMPOUT(0x2292BA97CLL);
      }
      BOOL v24 = v15 == v23;
      if (v15 == v23) {
        unint64_t v15 = 0;
      }
      v22 |= v24;
      uint64_t v25 = *(void *)(v10 + 8 * v15);
    }
    while (v25 == -1);
    unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
LABEL_8:
    *(void *)(v10 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    *(unsigned char *)(*(void *)(v4 + 48) + v16) = v26;
    ++*(void *)(v4 + 16);
  }
LABEL_34:
  uint64_t result = swift_release_n();
  unint64_t v1 = v0;
LABEL_36:
  *unint64_t v1 = v4;
  return result;
}

void (*sub_2292BA998(void *a1, uint64_t a2))(uint64_t a1)
{
  uint64_t v4 = malloc(0x50uLL);
  *a1 = v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_2292BAC84(v4);
  v4[9] = sub_2292BAA88((uint64_t)(v4 + 4), a2, isUniquelyReferenced_nonNull_native);
  return sub_2292BAA28;
}

void sub_2292BAA28(uint64_t a1)
{
  unint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64);
  (*(void (**)(void))(*(void *)a1 + 72))();
  v2(v1, 0);
  free(v1);
}

unint64_t (*sub_2292BAA88(uint64_t a1, uint64_t a2, char a3))(unint64_t result, char a2)
{
  uint64_t v4 = v3;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 24) = a2;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2292AC8D4(a2);
  *(unsigned char *)(a1 + 25) = v9 & 1;
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    char v14 = v9;
    uint64_t v15 = *(void *)(v8 + 24);
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      *(void *)(a1 + 16) = v10;
      if (v14)
      {
LABEL_8:
        uint64_t v16 = *(void *)(*(void *)(*v4 + 56) + 8 * v10);
LABEL_12:
        *(void *)a1 = v16;
        return sub_2292BABAC;
      }
LABEL_11:
      uint64_t v16 = 0;
      goto LABEL_12;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2292B9598();
      goto LABEL_7;
    }
    sub_2292B8918(v13, a3 & 1);
    unint64_t v17 = sub_2292AC8D4(a2);
    if ((v14 & 1) == (v18 & 1))
    {
      unint64_t v10 = v17;
      *(void *)(a1 + 16) = v17;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }
  uint64_t result = (unint64_t (*)(unint64_t, char))sub_2292CC728();
  __break(1u);
  return result;
}

unint64_t sub_2292BABAC(unint64_t result, char a2)
{
  uint64_t v2 = *(void *)result;
  LOBYTE(v3) = *(unsigned char *)(result + 25);
  if (a2)
  {
    if (!v2) {
      goto LABEL_10;
    }
    unint64_t v4 = *(void *)(result + 16);
    uint64_t v5 = **(void ***)(result + 8);
    if (*(unsigned char *)(result + 25))
    {
LABEL_9:
      *(void *)(v5[7] + 8 * v4) = v2;
      return result;
    }
    char v6 = *(unsigned char *)(result + 24);
    v5[(v4 >> 6) + 8] |= 1 << v4;
    *(unsigned char *)(v5[6] + v4) = v6;
    uint64_t v3 = v5[7];
    *(void *)(v3 + 8 * v4) = v2;
    uint64_t v7 = v5[2];
    BOOL v8 = __OFADD__(v7, 1);
    uint64_t v2 = v7 + 1;
    if (!v8) {
      goto LABEL_14;
    }
    __break(1u);
  }
  if (!v2)
  {
LABEL_10:
    if (v3) {
      return sub_2292B9020(*(void *)(result + 16), **(void **)(result + 8));
    }
    return result;
  }
  unint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = **(void ***)(result + 8);
  if (v3) {
    goto LABEL_9;
  }
  char v9 = *(unsigned char *)(result + 24);
  v5[(v4 >> 6) + 8] |= 1 << v4;
  *(unsigned char *)(v5[6] + v4) = v9;
  *(void *)(v5[7] + 8 * v4) = v2;
  uint64_t v10 = v5[2];
  BOOL v8 = __OFADD__(v10, 1);
  uint64_t v2 = v10 + 1;
  if (!v8)
  {
LABEL_14:
    v5[2] = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*sub_2292BAC84(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *unint64_t v1 = 0x8000000000000000;
  return sub_2292BACB4;
}

uint64_t sub_2292BACB4(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

uint64_t sub_2292BACC0@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2292AF0C4();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_27:
    uint64_t result = swift_bridgeObjectRelease();
    *a2 = 7;
    return result;
  }
  uint64_t v9 = ~v7;
  while (2)
  {
    unint64_t v10 = 0xE900000000000054;
    unint64_t v11 = 0x495F524F465F4F47;
    switch(*(unsigned char *)(*(void *)(v5 + 48) + v8))
    {
      case 1:
        unint64_t v10 = 0xE800000000000000;
        unint64_t v11 = 0x5954495649544341;
        break;
      case 2:
        unint64_t v10 = 0xE800000000000000;
        unint64_t v11 = 0x5354554F4B524F57;
        break;
      case 3:
        unint64_t v11 = 0x5F5353454E544946;
        uint64_t v12 = 1398099024;
        goto LABEL_10;
      case 4:
        unint64_t v11 = 0x5F444554494D494CLL;
        unint64_t v10 = 0xEF4E4F4954494445;
        break;
      case 5:
        unint64_t v10 = 0x80000002292CFE80;
        unint64_t v11 = 0xD000000000000012;
        break;
      case 6:
        unint64_t v11 = 0x54495445504D4F43;
        uint64_t v12 = 1397641033;
LABEL_10:
        unint64_t v10 = v12 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        break;
      default:
        break;
    }
    unint64_t v13 = 0x495F524F465F4F47;
    unint64_t v14 = 0xE900000000000054;
    switch(a1)
    {
      case 1:
        unint64_t v14 = 0xE800000000000000;
        if (v11 == 0x5954495649544341) {
          goto LABEL_24;
        }
        goto LABEL_25;
      case 2:
        unint64_t v14 = 0xE800000000000000;
        if (v11 != 0x5354554F4B524F57) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 3:
        uint64_t v15 = 0x5F5353454E544946;
        uint64_t v16 = 1398099024;
        goto LABEL_23;
      case 4:
        unint64_t v14 = 0xEF4E4F4954494445;
        if (v11 != 0x5F444554494D494CLL) {
          goto LABEL_25;
        }
        goto LABEL_24;
      case 5:
        unint64_t v14 = 0x80000002292CFE80;
        unint64_t v13 = 0xD000000000000012;
        goto LABEL_20;
      case 6:
        uint64_t v15 = 0x54495445504D4F43;
        uint64_t v16 = 1397641033;
LABEL_23:
        unint64_t v14 = v16 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v11 == v15) {
          goto LABEL_24;
        }
        goto LABEL_25;
      default:
LABEL_20:
        if (v11 != v13) {
          goto LABEL_25;
        }
LABEL_24:
        if (v10 == v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_30;
        }
LABEL_25:
        char v17 = sub_2292CC6F8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
          unint64_t v8 = (v8 + 1) & v9;
          if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
            goto LABEL_27;
          }
          continue;
        }
        swift_bridgeObjectRelease();
LABEL_30:
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v20 = *v3;
        uint64_t v22 = *v3;
        *uint64_t v3 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2292BA468();
          uint64_t v20 = v22;
        }
        *a2 = *(unsigned char *)(*(void *)(v20 + 48) + v8);
        sub_2292BB058(v8);
        *uint64_t v3 = v22;
        return swift_bridgeObjectRelease();
    }
  }
}

unint64_t sub_2292BB058(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_2292CC528();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        sub_2292CC748();
        sub_2292CC338();
        swift_bridgeObjectRelease();
        unint64_t v10 = sub_2292CC758() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(v3 + 48);
          uint64_t v12 = (unsigned char *)(v11 + v2);
          unint64_t v13 = (unsigned char *)(v11 + v6);
          if (v2 != v6 || (int64_t v2 = v6, v12 >= v13 + 1))
          {
            *uint64_t v12 = *v13;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v14 = *(void *)(v3 + 16);
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
    JUMPOUT(0x2292BB2FCLL);
  }
  *(void *)(v3 + 16) = v16;
  ++*(_DWORD *)(v3 + 36);
  return result;
}

void (*sub_2292BB318(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_2292BB3C8(v6, a2, a3);
  return sub_2292BB380;
}

void sub_2292BB380(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2292BB3C8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x22A6B4140](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_2292BB448;
  }
  __break(1u);
  return result;
}

void sub_2292BB448(id *a1)
{
}

uint64_t sub_2292BB450(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2292CC638();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2292BD688((unint64_t *)&qword_26830F9F8, &qword_26830F9F0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26830F9F0);
          uint64_t v12 = sub_2292BB318(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

void *sub_2292BB684(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

void sub_2292BB818()
{
}

char *sub_2292BB82C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_2292CC688();
  __break(1u);
  return result;
}

uint64_t sub_2292BB914(id *a1, id *__src, unint64_t a3, char *a4, void *a5)
{
  uint64_t v6 = __src;
  uint64_t v7 = (char *)__src - (char *)a1;
  uint64_t v8 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v8 = (char *)__src - (char *)a1;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v35 = a1;
  int64_t v34 = (void **)a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 >= -7)
    {
      if (a4 != (char *)__src || &__src[v12] <= (id *)a4) {
        memmove(a4, __src, 8 * v12);
      }
      uint64_t v22 = &a4[8 * v12];
      uint64_t v33 = v22;
      uint64_t v35 = v6;
      if (a1 < v6 && v10 >= 8)
      {
        unint64_t v23 = (id *)(a3 - 8);
        BOOL v24 = v6;
        do
        {
          uint64_t v25 = v23 + 1;
          char v26 = *--v24;
          id v27 = *((id *)v22 - 1);
          id v28 = v26;
          uint64_t v29 = sub_2292C2C04(v27, v28);

          if (v29 == -1)
          {
            if (v25 != v6 || v23 >= v6) {
              *unint64_t v23 = *v24;
            }
            uint64_t v35 = v24;
          }
          else
          {
            uint64_t v33 = v22 - 8;
            if (v25 < (id *)v22 || v23 >= (id *)v22 || v25 != (id *)v22) {
              *unint64_t v23 = (id)*((void *)v22 - 1);
            }
            BOOL v24 = v6;
            v22 -= 8;
          }
          if (v24 <= a1) {
            break;
          }
          --v23;
          uint64_t v6 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v7 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v9] <= (id *)a4) {
      memmove(a4, a1, 8 * v9);
    }
    int64_t v13 = (void **)&a4[8 * v9];
    uint64_t v33 = (char *)v13;
    if ((unint64_t)v6 < a3 && v7 >= 8)
    {
      unint64_t v14 = (void **)a4;
      int64_t v15 = a1;
      do
      {
        unint64_t v16 = *v14;
        id v17 = *v6;
        id v18 = v16;
        int64_t v19 = v6;
        uint64_t v20 = sub_2292C2C04(v17, v18);

        if (v20 == -1)
        {
          int64_t v21 = v19 + 1;
          if (v15 < v19 || v15 >= v21 || v15 != v19) {
            void *v15 = *v19;
          }
        }
        else
        {
          if (v15 != v14) {
            void *v15 = *v14;
          }
          int64_t v34 = ++v14;
          int64_t v21 = v19;
        }
        ++v15;
        if (v14 >= v13) {
          break;
        }
        uint64_t v6 = v21;
      }
      while ((unint64_t)v21 < a3);
      uint64_t v35 = v15;
    }
LABEL_43:
    sub_2292B8848((void **)&v35, (const void **)&v34, &v33);
    return 1;
  }

  uint64_t result = sub_2292CC688();
  __break(1u);
  return result;
}

void sub_2292BBC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    while (1)
    {
      uint64_t v10 = *(void **)v9;
      id v11 = v7;
      id v12 = v10;
      uint64_t v13 = sub_2292C2C04(v11, v12);

      if (v13 != -1)
      {
LABEL_4:
        ++v4;
        v6 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      unint64_t v14 = *(void **)v9;
      uint64_t v7 = *(void **)(v9 + 8);
      *(void *)uint64_t v9 = v7;
      *(void *)(v9 + 8) = v14;
      v9 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

void sub_2292BBCE0(uint64_t *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1[1];
  id v131 = a2;
  uint64_t v6 = sub_2292CC6B8();
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_136;
    }
    if (v5)
    {
      id v10 = v131;
      uint64_t v11 = v5;
      id v12 = v10;
      sub_2292BBC00(0, v11, 1, a1);
    }
    else
    {
    }
    return;
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_144;
  }
  id v115 = a1;
  uint64_t v116 = v6;
  uint64_t v118 = v5;
  if (v5 < 2)
  {
    uint64_t v13 = (char *)MEMORY[0x263F8EE78];
    uint64_t v132 = MEMORY[0x263F8EE78];
    v122 = (char *)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v5 != 1)
    {
      unint64_t v17 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_101:
      if (v17 >= 2)
      {
        uint64_t v103 = *v115;
        uint64_t v125 = *v115;
        do
        {
          unint64_t v104 = v17 - 2;
          if (v17 < 2) {
            goto LABEL_131;
          }
          if (!v103) {
            goto LABEL_143;
          }
          uint64_t v105 = v3;
          uint64_t v106 = (uint64_t)v13;
          uint64_t v107 = *(void *)&v13[16 * v104 + 32];
          uint64_t v108 = *(void *)&v13[16 * v17 + 24];
          id v130 = (id *)(v103 + 8 * v107);
          __srcb = (id *)(v103 + 8 * *(void *)&v13[16 * v17 + 16]);
          unint64_t v109 = v103 + 8 * v108;
          id v110 = v131;
          sub_2292BB914(v130, __srcb, v109, v122, v110);
          uint64_t v3 = v105;
          if (v105) {
            goto LABEL_98;
          }

          if (v108 < v107) {
            goto LABEL_132;
          }
          uint64_t v13 = (char *)v106;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v13 = sub_2292B8904(v106);
          }
          if (v104 >= *((void *)v13 + 2)) {
            goto LABEL_133;
          }
          uint64_t v111 = &v13[16 * v104 + 32];
          *(void *)uint64_t v111 = v107;
          *((void *)v111 + 1) = v108;
          unint64_t v112 = *((void *)v13 + 2);
          if (v17 > v112) {
            goto LABEL_134;
          }
          memmove(&v13[16 * v17 + 16], &v13[16 * v17 + 32], 16 * (v112 - v17));
          *((void *)v13 + 2) = v112 - 1;
          unint64_t v17 = v112 - 1;
          uint64_t v103 = v125;
        }
        while (v112 > 2);
      }
      swift_bridgeObjectRelease();
      *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2292CC3F8();
      unint64_t v102 = v131;
LABEL_113:

      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v8 = v7 >> 1;
    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    uint64_t v9 = sub_2292CC418();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v122 = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v132 = v9;
  }
  unint64_t v14 = 0;
  uint64_t v15 = *a1;
  uint64_t v113 = *a1 - 8;
  uint64_t v114 = *a1 + 16;
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  uint64_t v16 = v118;
  uint64_t v129 = *v115;
  while (1)
  {
    uint64_t v18 = (uint64_t)v14;
    uint64_t v19 = (uint64_t)(v14 + 1);
    __src = v14;
    if ((uint64_t)(v14 + 1) < v16)
    {
      uint64_t v20 = v15;
      int64_t v21 = v13;
      uint64_t v22 = v3;
      unint64_t v23 = *(void **)(v20 + 8 * v18);
      id v24 = *(id *)(v20 + 8 * v19);
      id v25 = v23;
      uint64_t v16 = v118;
      uint64_t v26 = sub_2292C2C04(v24, v25);

      uint64_t v19 = v18 + 2;
      if (v18 + 2 < v118)
      {
        id v27 = (id *)(v114 + 8 * v18);
        while (1)
        {
          uint64_t v28 = v19;
          uint64_t v29 = *(v27 - 1);
          id v30 = *v27;
          id v31 = v29;
          uint64_t v32 = sub_2292C2C04(v30, v31);

          if ((v26 == -1) == (v32 != -1)) {
            break;
          }
          uint64_t v19 = v28 + 1;
          ++v27;
          uint64_t v16 = v118;
          if (v118 == v28 + 1)
          {
            uint64_t v19 = v118;
            goto LABEL_22;
          }
        }
        uint64_t v16 = v118;
        uint64_t v19 = v28;
LABEL_22:
        uint64_t v18 = (uint64_t)__src;
      }
      uint64_t v3 = v22;
      uint64_t v13 = v21;
      if (v26 == -1)
      {
        uint64_t v15 = v129;
        if (v19 < v18) {
          goto LABEL_139;
        }
        if (v18 < v19)
        {
          uint64_t v33 = (uint64_t *)(v113 + 8 * v19);
          uint64_t v34 = v19;
          uint64_t v35 = v18;
          char v36 = (uint64_t *)(v129 + 8 * v18);
          do
          {
            if (v35 != --v34)
            {
              if (!v129) {
                goto LABEL_142;
              }
              uint64_t v37 = *v36;
              uint64_t *v36 = *v33;
              *uint64_t v33 = v37;
            }
            ++v35;
            --v33;
            ++v36;
          }
          while (v35 < v34);
        }
      }
      else
      {
        uint64_t v15 = v129;
      }
    }
    if (v19 < v16)
    {
      if (__OFSUB__(v19, v18)) {
        goto LABEL_135;
      }
      if (v19 - v18 < v116) {
        break;
      }
    }
LABEL_50:
    if (v19 < v18) {
      goto LABEL_130;
    }
    char v117 = (char *)v19;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v13 = sub_2292B874C(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v50 = *((void *)v13 + 2);
    unint64_t v49 = *((void *)v13 + 3);
    unint64_t v17 = v50 + 1;
    if (v50 >= v49 >> 1) {
      uint64_t v13 = sub_2292B874C((char *)(v49 > 1), v50 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v17;
    unsigned int v51 = v13 + 32;
    unsigned int v52 = &v13[16 * v50 + 32];
    *(void *)unsigned int v52 = v18;
    *((void *)v52 + 1) = v117;
    if (v50)
    {
      v119 = v13 + 32;
      v121 = v13;
      while (1)
      {
        unint64_t v53 = v17 - 1;
        if (v17 >= 4)
        {
          uint64_t v58 = &v51[16 * v17];
          uint64_t v59 = *((void *)v58 - 8);
          uint64_t v60 = *((void *)v58 - 7);
          BOOL v64 = __OFSUB__(v60, v59);
          uint64_t v61 = v60 - v59;
          if (v64) {
            goto LABEL_119;
          }
          uint64_t v63 = *((void *)v58 - 6);
          uint64_t v62 = *((void *)v58 - 5);
          BOOL v64 = __OFSUB__(v62, v63);
          uint64_t v56 = v62 - v63;
          char v57 = v64;
          if (v64) {
            goto LABEL_120;
          }
          unint64_t v65 = v17 - 2;
          id v66 = &v51[16 * v17 - 32];
          uint64_t v68 = *(void *)v66;
          uint64_t v67 = *((void *)v66 + 1);
          BOOL v64 = __OFSUB__(v67, v68);
          uint64_t v69 = v67 - v68;
          if (v64) {
            goto LABEL_122;
          }
          BOOL v64 = __OFADD__(v56, v69);
          uint64_t v70 = v56 + v69;
          if (v64) {
            goto LABEL_125;
          }
          if (v70 >= v61)
          {
            uint64_t v88 = &v51[16 * v53];
            uint64_t v90 = *(void *)v88;
            uint64_t v89 = *((void *)v88 + 1);
            BOOL v64 = __OFSUB__(v89, v90);
            uint64_t v91 = v89 - v90;
            if (v64) {
              goto LABEL_129;
            }
            BOOL v81 = v56 < v91;
            goto LABEL_88;
          }
        }
        else
        {
          if (v17 != 3)
          {
            uint64_t v82 = *((void *)v13 + 4);
            uint64_t v83 = *((void *)v13 + 5);
            BOOL v64 = __OFSUB__(v83, v82);
            uint64_t v75 = v83 - v82;
            char v76 = v64;
            goto LABEL_82;
          }
          uint64_t v55 = *((void *)v13 + 4);
          uint64_t v54 = *((void *)v13 + 5);
          BOOL v64 = __OFSUB__(v54, v55);
          uint64_t v56 = v54 - v55;
          char v57 = v64;
        }
        if (v57) {
          goto LABEL_121;
        }
        unint64_t v65 = v17 - 2;
        unint64_t v71 = &v51[16 * v17 - 32];
        uint64_t v73 = *(void *)v71;
        uint64_t v72 = *((void *)v71 + 1);
        BOOL v74 = __OFSUB__(v72, v73);
        uint64_t v75 = v72 - v73;
        char v76 = v74;
        if (v74) {
          goto LABEL_124;
        }
        id v77 = &v51[16 * v53];
        uint64_t v79 = *(void *)v77;
        uint64_t v78 = *((void *)v77 + 1);
        BOOL v64 = __OFSUB__(v78, v79);
        uint64_t v80 = v78 - v79;
        if (v64) {
          goto LABEL_127;
        }
        if (__OFADD__(v75, v80)) {
          goto LABEL_128;
        }
        if (v75 + v80 >= v56)
        {
          BOOL v81 = v56 < v80;
LABEL_88:
          if (v81) {
            unint64_t v53 = v65;
          }
          goto LABEL_90;
        }
LABEL_82:
        if (v76) {
          goto LABEL_123;
        }
        uint64_t v84 = &v51[16 * v53];
        uint64_t v86 = *(void *)v84;
        uint64_t v85 = *((void *)v84 + 1);
        BOOL v64 = __OFSUB__(v85, v86);
        uint64_t v87 = v85 - v86;
        if (v64) {
          goto LABEL_126;
        }
        if (v87 < v75) {
          goto LABEL_14;
        }
LABEL_90:
        unint64_t v92 = v53 - 1;
        if (v53 - 1 >= v17)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
          goto LABEL_138;
        }
        if (!v15) {
          goto LABEL_141;
        }
        uint64_t v93 = v51;
        uint64_t v94 = &v51[16 * v92];
        uint64_t v95 = *(void *)v94;
        unint64_t v96 = v53;
        unint64_t v97 = &v93[16 * v53];
        uint64_t v98 = *((void *)v97 + 1);
        char v124 = (id *)(v15 + 8 * *(void *)v97);
        __srca = (id *)(v15 + 8 * *(void *)v94);
        id v99 = v131;
        sub_2292BB914(__srca, v124, v15 + 8 * v98, v122, v99);
        if (v3)
        {
LABEL_98:
          swift_bridgeObjectRelease();
          unint64_t v102 = v131;

          *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_2292CC3F8();
          goto LABEL_113;
        }

        if (v98 < v95) {
          goto LABEL_116;
        }
        if (v96 > *((void *)v121 + 2)) {
          goto LABEL_117;
        }
        *(void *)uint64_t v94 = v95;
        unsigned int v51 = v119;
        *(void *)&v119[16 * v92 + 8] = v98;
        unint64_t v100 = *((void *)v121 + 2);
        if (v96 >= v100) {
          goto LABEL_118;
        }
        unint64_t v17 = v100 - 1;
        size_t v101 = 16 * (v100 - 1 - v96);
        uint64_t v13 = v121;
        memmove(v97, v97 + 16, v101);
        *((void *)v121 + 2) = v100 - 1;
        uint64_t v15 = v129;
        if (v100 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v17 = 1;
LABEL_14:
    unint64_t v14 = v117;
    uint64_t v16 = v118;
    if ((uint64_t)v117 >= v118) {
      goto LABEL_101;
    }
  }
  if (__OFADD__(v18, v116)) {
    goto LABEL_137;
  }
  if (v18 + v116 >= v16) {
    uint64_t v38 = (char *)v16;
  }
  else {
    uint64_t v38 = (char *)(v18 + v116);
  }
  if ((uint64_t)v38 >= v18)
  {
    if ((char *)v19 != v38)
    {
      v120 = v13;
      uint64_t v123 = v3;
      uint64_t v39 = v113 + 8 * v19;
      do
      {
        unint64_t v40 = *(void **)(v15 + 8 * v19);
        uint64_t v41 = v18;
        uint64_t v42 = v39;
        while (1)
        {
          uint64_t v43 = v19;
          id v44 = *(void **)v42;
          id v45 = v40;
          id v46 = v44;
          uint64_t v47 = sub_2292C2C04(v45, v46);

          if (v47 != -1) {
            break;
          }
          uint64_t v15 = v129;
          if (!v129) {
            goto LABEL_140;
          }
          uint64_t v19 = v43;
          unint64_t v48 = *(void **)v42;
          unint64_t v40 = *(void **)(v42 + 8);
          *(void *)uint64_t v42 = v40;
          *(void *)(v42 + 8) = v48;
          v42 -= 8;
          if (v43 == ++v41) {
            goto LABEL_43;
          }
        }
        uint64_t v15 = v129;
        uint64_t v19 = v43;
LABEL_43:
        ++v19;
        v39 += 8;
        uint64_t v18 = (uint64_t)__src;
      }
      while ((char *)v19 != v38);
      uint64_t v19 = (uint64_t)v38;
      uint64_t v3 = v123;
      uint64_t v13 = v120;
    }
    goto LABEL_50;
  }
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:

  __break(1u);
LABEL_141:

  __break(1u);
LABEL_142:

  __break(1u);
LABEL_143:

  __break(1u);
LABEL_144:

  sub_2292CC618();
  __break(1u);
}

void sub_2292BC584(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2292BB818();
  }
  uint64_t v6 = *(void *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  id v7 = v4;
  sub_2292BBCE0(v8, v7);

  sub_2292CC5C8();
}

uint64_t sub_2292BC624(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void sub_2292BC660(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  uint64_t v23 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_32:
    uint64_t v3 = sub_2292CC638();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3)
    {
LABEL_3:
      unint64_t v18 = v2;
      unint64_t v4 = 0;
      uint64_t v20 = v2 & 0xFFFFFFFFFFFFFF8;
      unint64_t v21 = v2 & 0xC000000000000001;
      uint64_t v19 = (void *)(v2 + 32);
      while (1)
      {
        if (v21)
        {
          id v5 = (id)MEMORY[0x22A6B4140](v4, v18);
        }
        else
        {
          if (v4 >= *(void *)(v20 + 16))
          {
            __break(1u);
LABEL_30:
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          id v5 = (id)v19[v4];
        }
        uint64_t v6 = v5;
        if (__OFADD__(v4++, 1)) {
          goto LABEL_30;
        }
        id v8 = objc_msgSend(v5, sel_template);
        id v9 = objc_msgSend(v8, sel_uniqueName);

        if (!v9)
        {
          __break(1u);
          return;
        }
        uint64_t v10 = sub_2292CC308();
        unint64_t v2 = (unint64_t)v11;

        uint64_t v12 = a2[2];
        if (!v12) {
          goto LABEL_26;
        }
        BOOL v13 = a2[4] == v10 && a2[5] == v2;
        if (!v13 && (sub_2292CC6F8() & 1) == 0) {
          break;
        }
LABEL_4:

        swift_bridgeObjectRelease();
LABEL_5:
        if (v4 == v3) {
          return;
        }
      }
      if (v12 != 1)
      {
        unint64_t v14 = a2 + 7;
        uint64_t v15 = 1;
        do
        {
          uint64_t v16 = v15 + 1;
          if (__OFADD__(v15, 1)) {
            goto LABEL_31;
          }
          BOOL v17 = *(v14 - 1) == v10 && *v14 == v2;
          if (v17 || (sub_2292CC6F8() & 1) != 0) {
            goto LABEL_4;
          }
          v14 += 2;
          ++v15;
        }
        while (v16 != v12);
      }
LABEL_26:
      swift_bridgeObjectRelease();
      sub_2292CC5B8();
      sub_2292CC5E8();
      sub_2292CC5F8();
      unint64_t v2 = (unint64_t)&v23;
      sub_2292CC5C8();
      goto LABEL_5;
    }
  }
}

void sub_2292BC898(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v3 = a2;
  unint64_t v4 = *(void **)(v2 + 16);
  uint64_t v5 = *a1;
  if (a2 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2292CC638();
    if (v6) {
      goto LABEL_3;
    }
LABEL_39:
LABEL_41:
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6) {
    goto LABEL_39;
  }
LABEL_3:
  unint64_t v52 = v3 & 0xC000000000000001;
  uint64_t v7 = 4;
  unint64_t v53 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v4) + 0x160);
  unint64_t v49 = v3;
  unsigned int v50 = v5;
  uint64_t v51 = v6;
  while (1)
  {
    if (v52) {
      id v8 = (id)MEMORY[0x22A6B4140](v7 - 4, v3);
    }
    else {
      id v8 = *(id *)(v3 + 8 * v7);
    }
    id v9 = v8;
    uint64_t v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (!*(void *)(v53() + 16) || (sub_2292AC8D4(v5), (v11 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v12 = objc_msgSend(v9, sel_template);
    id v13 = objc_msgSend(v12, sel_uniqueName);

    if (!v13) {
      break;
    }
    sub_2292CC308();

    sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
    unint64_t v14 = sub_2292C2894();
    char v16 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      BOOL v17 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*MEMORY[0x263F8EED0] & *v4)
                                                                                     + 0x170))(v56);
      unint64_t v18 = sub_2292B6F40(v54, v5);
      if (!*v19)
      {
        ((void (*)(void *, void))v18)(v54, 0);
        v17(v56, 0);
        goto LABEL_22;
      }
      uint64_t v20 = (void *)sub_2292B5430(v14);
      ((void (*)(void *, void))v18)(v54, 0);
      v17(v56, 0);

      uint64_t v21 = sub_2292B98F4(v56, v5);
      uint64_t v22 = ((uint64_t (*)(uint64_t))v53)(v21);
      if (!*(void *)(v22 + 16) || (unint64_t v23 = sub_2292AC8D4(v5), (v24 & 1) == 0))
      {
        swift_bridgeObjectRelease();
LABEL_31:
        sub_2292B98F4(v56, v5);
        sub_2292BACC0(v5, v56);
        goto LABEL_22;
      }
      unint64_t v25 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_2292CC638();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (!v26) {
        goto LABEL_31;
      }
    }
LABEL_22:
    id v27 = objc_msgSend(v9, sel_relevantEarnedInstance);
    if (v27
      && (uint64_t v28 = v27,
          id v29 = objc_msgSend(v27, sel_externalIdentifier),
          v28,
          v29))
    {
      uint64_t v30 = sub_2292CC308();
      uint64_t v32 = v31;

      uint64_t v33 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x190);
      uint64_t v34 = swift_bridgeObjectRetain();
      uint64_t v35 = v33(v34);
      if (*(void *)(v35 + 16) && (unint64_t v36 = sub_2292AC940(v30, v32), (v37 & 1) != 0))
      {
        uint64_t v38 = *(void *)(*(void *)(v35 + 56) + 8 * v36);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v54[0] = v38;
        swift_bridgeObjectRetain();
        id v39 = objc_msgSend(v9, sel_template);
        id v40 = objc_msgSend(v39, sel_uniqueName);

        if (!v40) {
          goto LABEL_43;
        }
        sub_2292CC308();

        sub_2292BC624(0, (unint64_t *)&qword_26AF369A8);
        unint64_t v41 = sub_2292C2894();
        char v43 = v42;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v43)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {

          uint64_t v44 = v54[0];
          id v45 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))((*MEMORY[0x263F8EED0] & *v4)
                                                                                         + 0x1A0))(v56);
          uint64_t v47 = v46;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v55 = *v47;
          *uint64_t v47 = 0x8000000000000000;
          sub_2292B9428(v44, v30, v32, isUniquelyReferenced_nonNull_native);
          *uint64_t v47 = v55;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v45(v56, 0);
        }
        unint64_t v3 = v49;
        uint64_t v5 = v50;
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        uint64_t v5 = v50;
      }
    }
    else
    {
    }
    ++v7;
    if (v10 == v51) {
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
}

uint64_t sub_2292BCF3C(uint64_t a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v15 = *(void *)(v4 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v15 = *(void *)(v4 + 8 * v10);
        if (!v15)
        {
          int64_t v10 = v14 + 3;
          if (v14 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v15 = *(void *)(v4 + 8 * v10);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v12 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    v17[0] = *(unsigned char *)(*(void *)(a1 + 48) + v12);
    uint64_t v18 = v13;
    swift_bridgeObjectRetain();
    a2(v17, v13);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v8) {
    return swift_release();
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v15 = *(void *)(v4 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2292BD0D4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 58, 7);
}

void sub_2292BD12C()
{
  sub_2292B77EC(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56), *(unsigned __int8 *)(v0 + 57));
}

uint64_t sub_2292BD148()
{
  return sub_2292BD688(&qword_26830F9D0, &qword_26830F9D8);
}

uint64_t getEnumTagSinglePayload for AAUIAwardsDataProviderSection(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AAUIAwardsDataProviderSection(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2292BD2E0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_2292BD308(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2292BD314(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AAUIAwardsDataProviderSection()
{
  return &type metadata for AAUIAwardsDataProviderSection;
}

uint64_t sub_2292BD32C()
{
  return type metadata accessor for AAUIAwardsDataProvider();
}

uint64_t sub_2292BD334()
{
  uint64_t result = sub_2292CC1A8();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for AAUIAwardsDataProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AAUIAwardsDataProvider);
}

uint64_t dispatch thunk of AAUIAwardsDataProvider.__allocating_init(healthStore:pauseRingsCoordinator:layoutMode:)()
{
  return (*(uint64_t (**)(void))(v0 + 648))();
}

void type metadata accessor for ACHAchievementDisplayOverrideState(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_2292BD48C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_2292BD4D8()
{
}

void sub_2292BD4F4()
{
}

void sub_2292BD50C(void (*a1)(uint64_t))
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 16) + 16;
  swift_beginAccess();
  uint64_t v5 = (void *)MEMORY[0x22A6B5170](v4);
  if (v5)
  {
    unsigned int v6 = v5;
    if ((*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x130))()) {
      a1(v3);
    }
  }
}

void sub_2292BD5BC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 16) + 16;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x22A6B5170](v2);
  if (v3)
  {
    uint64_t v4 = v3;
    (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v3) + 0x138))(1);
  }
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x22A6B5170](v2);
  if (v5)
  {
    unsigned int v6 = (void *)v5;
    sub_2292B2F2C(v1);
  }
}

uint64_t sub_2292BD688(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_2292BD6CC()
{
}

id sub_2292BD714()
{
  return *(id *)(v0 + OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query);
}

id AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  id v1 = objc_allocWithZone(v0);
  id v2 = objc_allocWithZone((Class)sub_2292CC1E8());
  uint64_t v3 = (char *)v1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)&v3[OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query] = sub_2292CC1B8();

  v6.receiver = v3;
  v6.super_class = v0;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v4;
}

id AAUIAwardsQuery.init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  objc_allocWithZone((Class)sub_2292CC1E8());
  id v1 = v0;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)&v1[OBJC_IVAR____TtC22ActivityAchievementsUI15AAUIAwardsQuery_query] = sub_2292CC1B8();

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  id v2 = objc_msgSendSuper2(&v4, sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v2;
}

uint64_t type metadata accessor for AAUIAwardsQuery()
{
  return self;
}

void sub_2292BDB54(uint64_t a1, uint64_t a2)
{
  sub_2292AD928();
  id v3 = (id)sub_2292CC3C8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

uint64_t sub_2292BDBC0()
{
  return sub_2292CC1D8();
}

uint64_t sub_2292BDC74()
{
  return sub_2292CC1C8();
}

id AAUIAwardsQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AAUIAwardsQuery.init()()
{
}

id AAUIAwardsQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAUIAwardsQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AAUIAwardsQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AAUIAwardsQuery);
}

uint64_t dispatch thunk of AAUIAwardsQuery.__allocating_init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AAUIAwardsQuery.activate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AAUIAwardsQuery.deactivate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_2292BDE70()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2292BDEA8(uint64_t a1)
{
  sub_2292BDB54(a1, *(void *)(v1 + 16));
}

id sub_2292BDEC0()
{
  return *(id *)(v0 + OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query);
}

id AAUIActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v6 = sub_2292CC0A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone(v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  objc_allocWithZone((Class)sub_2292CC228());
  unint64_t v11 = (char *)v10;
  swift_retain();
  swift_retain();
  *(void *)&v11[OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query] = sub_2292CC208();

  v15.receiver = v11;
  v15.super_class = v4;
  id v12 = objc_msgSendSuper2(&v15, sel_init);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v12;
}

id AAUIActivityAwardsDateQuery.init(dateComponents:initialAwardsHandler:updateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[1] = a4;
  uint64_t v6 = sub_2292CC0A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  objc_allocWithZone((Class)sub_2292CC228());
  id v9 = v4;
  swift_retain();
  swift_retain();
  *(void *)&v9[OBJC_IVAR____TtC22ActivityAchievementsUI27AAUIActivityAwardsDateQuery_query] = sub_2292CC208();

  id v10 = (objc_class *)type metadata accessor for AAUIActivityAwardsDateQuery();
  v14.receiver = v9;
  v14.super_class = v10;
  id v11 = objc_msgSendSuper2(&v14, sel_init);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v11;
}

uint64_t type metadata accessor for AAUIActivityAwardsDateQuery()
{
  return self;
}

uint64_t sub_2292BE43C()
{
  return sub_2292CC218();
}

uint64_t sub_2292BE4F0()
{
  return sub_2292CC1F8();
}

id AAUIActivityAwardsDateQuery.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AAUIActivityAwardsDateQuery.init()()
{
}

id AAUIActivityAwardsDateQuery.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AAUIActivityAwardsDateQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AAUIActivityAwardsDateQuery(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AAUIActivityAwardsDateQuery);
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.__allocating_init(dateComponents:initialAwardsHandler:updateHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.activate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AAUIActivityAwardsDateQuery.deactivate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t sub_2292BE6EC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2292BE728(uint64_t a1, uint64_t a2, void *a3, int a4, int a5)
{
  uint64_t v6 = v5;
  int v80 = a5;
  int v78 = a4;
  uint64_t v79 = a3;
  uint64_t v81 = a2;
  uint64_t v8 = sub_2292CC128();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = &v77[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_2292CC258();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  int64_t v16 = &v77[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = &v77[-v18];
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = &v77[-v20];
  if (([v6 hasClientRequiredURLs] & 1) == 0)
  {
    uint64_t v44 = sub_2292ADAD0();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v13 + 16))(v21, v44, v12);
    int64_t v16 = v6;
    uint64_t v6 = sub_2292CC238();
    os_log_type_t v45 = sub_2292CC468();
    if (!os_log_type_enabled(v6, v45))
    {

      (*(void (**)(unsigned char *, uint64_t))(v13 + 8))(v21, v12);
      return;
    }
    uint64_t v82 = v12;
    uint64_t v83 = v13;
    id v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v86[0] = v47;
    *(_DWORD *)id v46 = 136315138;
    id v48 = [v16 template];
    id v49 = objc_msgSend(v48, sel_uniqueName);

    if (v49)
    {
      uint64_t v50 = sub_2292CC308();
      unint64_t v52 = v51;

      uint64_t v84 = sub_2292AE150(v50, v52, v86);
      sub_2292CC4C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_229290000, v6, v45, "[%s] is missing client required URLs, not showing", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6B5100](v47, -1, -1);
      MEMORY[0x22A6B5100](v46, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v83 + 8))(v21, v82);
      return;
    }
    goto LABEL_32;
  }
  uint64_t v82 = v12;
  uint64_t v83 = v13;
  id v22 = [v6 template];
  id v23 = objc_msgSend(v22, sel_uniqueName);

  if (!v23)
  {
    __break(1u);
LABEL_32:

    __break(1u);
LABEL_33:

    __break(1u);
LABEL_34:

    __break(1u);
    return;
  }
  uint64_t v24 = sub_2292CC308();
  uint64_t v26 = v25;

  v86[0] = v24;
  v86[1] = v26;
  uint64_t v84 = 0xD000000000000010;
  unint64_t v85 = 0x80000002292D0420;
  sub_2292AE7A8();
  LOBYTE(v24) = sub_2292CC508();
  swift_bridgeObjectRelease();
  if (v24)
  {
    if ([v6 unearned])
    {
      sub_2292CC118();
      id v27 = (void *)sub_2292CC0E8();
      (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
      char IsEarnable = AAUIMonthlyChallengeIsEarnable(v6, v27);

      if ((IsEarnable & 1) == 0)
      {
        uint64_t v65 = sub_2292ADAD0();
        uint64_t v67 = v82;
        uint64_t v66 = v83;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v83 + 16))(v19, v65, v82);
        uint64_t v6 = v6;
        uint64_t v68 = sub_2292CC238();
        os_log_type_t v69 = sub_2292CC468();
        if (!os_log_type_enabled(v68, v69))
        {

          (*(void (**)(unsigned char *, uint64_t))(v66 + 8))(v19, v67);
          return;
        }
        uint64_t v70 = (uint8_t *)swift_slowAlloc();
        uint64_t v71 = swift_slowAlloc();
        v86[0] = v71;
        *(_DWORD *)uint64_t v70 = 136315138;
        id v72 = [v6 template];
        id v73 = objc_msgSend(v72, sel_uniqueName);

        if (v73)
        {
          uint64_t v74 = sub_2292CC308();
          unint64_t v76 = v75;

          uint64_t v84 = sub_2292AE150(v74, v76, v86);
          sub_2292CC4C8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_229290000, v68, v69, "[%s] is not earnable anymore, not showing", v70, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22A6B5100](v71, -1, -1);
          MEMORY[0x22A6B5100](v70, -1, -1);

          (*(void (**)(unsigned char *, uint64_t))(v83 + 8))(v19, v82);
          return;
        }
        goto LABEL_34;
      }
    }
  }
  id v29 = [v6 section];
  uint64_t v30 = sub_2292CC308();
  unint64_t v32 = v31;

  swift_bridgeObjectRelease();
  uint64_t v33 = HIBYTE(v32) & 0xF;
  if ((v32 & 0x2000000000000000) == 0) {
    uint64_t v33 = v30 & 0xFFFFFFFFFFFFLL;
  }
  if (!v33)
  {
    uint64_t v53 = sub_2292ADAD0();
    uint64_t v55 = v82;
    uint64_t v54 = v83;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v83 + 16))(v16, v53, v82);
    uint64_t v6 = v6;
    uint64_t v56 = sub_2292CC238();
    os_log_type_t v57 = sub_2292CC468();
    if (!os_log_type_enabled(v56, v57))
    {

      (*(void (**)(NSObject *, uint64_t))(v54 + 8))(v16, v55);
      return;
    }
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    uint64_t v59 = swift_slowAlloc();
    v86[0] = v59;
    *(_DWORD *)uint64_t v58 = 136315138;
    id v60 = [v6 template];
    id v61 = objc_msgSend(v60, sel_uniqueName);

    if (v61)
    {
      uint64_t v62 = sub_2292CC308();
      unint64_t v64 = v63;

      uint64_t v84 = sub_2292AE150(v62, v64, v86);
      sub_2292CC4C8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_229290000, v56, v57, "[%s] has no section set, not showing", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22A6B5100](v59, -1, -1);
      MEMORY[0x22A6B5100](v58, -1, -1);

      (*(void (**)(NSObject *, uint64_t))(v83 + 8))(v16, v82);
      return;
    }
    goto LABEL_33;
  }
  if ([v6 unearned])
  {
    id v34 = [v6 template];
    BOOL v35 = sub_2292AE87C();

    if (v35)
    {
      id v36 = [v6 progress];
      uint64_t v37 = v81;
      char v38 = v80;
      id v39 = v79;
      char v40 = v78;
      if (v36)
      {
        unint64_t v41 = v36;
        objc_msgSend(v36, sel__value);
      }
      id v42 = [v6 goal];
      if (v42)
      {
        char v43 = v42;
        objc_msgSend(v42, sel__value);
      }
    }
    else
    {
      uint64_t v37 = v81;
      char v38 = v80;
      id v39 = v79;
      char v40 = v78;
    }
    objc_msgSend(v39, sel_unearnedAchievementIsVisibleNow_activityMoveMode_experienceType_isFitnessPlusSubscriber_isWheelchairUser_, v6, a1, v37, v40 & 1, v38 & 1);
  }
}

BOOL sub_2292BF044()
{
  id v1 = objc_msgSend(v0, sel_template);
  unsigned int v2 = objc_msgSend(v1, sel_earnLimit);

  if (!v2) {
    return 0;
  }
  id v3 = objc_msgSend(v0, sel_template);
  unsigned int v4 = objc_msgSend(v3, sel_earnLimit);

  return (unint64_t)objc_msgSend(v0, sel_earnedInstanceCount) >= v4;
}

BOOL sub_2292BF0EC(uint64_t a1)
{
  id v3 = objc_msgSend(v1, sel_progress);
  BOOL v4 = (BOOL)v3;
  if (v3)
  {
    objc_msgSend(v3, sel__value);
    double v6 = v5;

    id v7 = objc_msgSend(v1, sel_goal);
    BOOL v4 = (BOOL)v7;
    if (v7)
    {
      objc_msgSend(v7, sel__value);
      double v9 = v8;

      if (v9 <= 0.0) {
        return 0;
      }
      sub_2292BF310(a1);
      int v11 = v10;
      id v12 = objc_msgSend(v1, sel_template);
      unsigned int v13 = objc_msgSend(v12, sel_earnLimit);

      if (v13)
      {
        id v14 = objc_msgSend(v1, sel_template);
        unsigned int v15 = objc_msgSend(v14, sel_earnLimit);

        BOOL v16 = (unint64_t)objc_msgSend(v1, sel_earnedInstanceCount) >= v15;
      }
      else
      {
        BOOL v16 = 0;
      }
      BOOL v4 = v6 / v9 >= 0.75;
      id v17 = objc_msgSend(v1, sel_template, v6 / v9);
      id v18 = objc_msgSend(v17, sel_uniqueName);

      if (!v18)
      {
        if (((v11 | v16) & 1) == 0) {
          return v4;
        }
        return 0;
      }
      uint64_t v19 = sub_2292CC308();
      uint64_t v21 = v20;

      if (v19 == 0xD000000000000019 && v21 == 0x80000002292D0400)
      {
        swift_bridgeObjectRelease();
        return ((v11 | v16) & 1) == 0;
      }
      char v22 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
      if ((v11 | v16)) {
        return 0;
      }
      if (v22) {
        return 1;
      }
    }
  }
  return v4;
}

void sub_2292BF310(uint64_t a1)
{
  unsigned int v2 = v1;
  uint64_t v97 = a1;
  uint64_t v3 = sub_2292CC198();
  uint64_t v92 = *(void *)(v3 - 8);
  uint64_t v93 = v3;
  MEMORY[0x270FA5388](v3);
  double v5 = (char *)v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369E8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v91 = (char *)v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v94 = (char *)v82 - v10;
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)v82 - v11;
  uint64_t v13 = sub_2292CC128();
  id v99 = *(void (**)(char *, char *, uint64_t))(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v89 = (char *)v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v88 = (char *)v82 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v86 = (char *)v82 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v87 = (char *)v82 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v90 = (char *)v82 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v95 = (char *)v82 - v25;
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  unint64_t v96 = (char *)v82 - v27;
  MEMORY[0x270FA5388](v26);
  id v29 = (char *)v82 - v28;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369D8);
  MEMORY[0x270FA5388](v30 - 8);
  unint64_t v32 = (char *)v82 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_2292CC0A8();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)v82 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v98 = (char *)v82 - v38;
  id v39 = objc_msgSend(v2, sel_relevantEarnedInstance);
  if (v39)
  {
    char v40 = v39;
    unint64_t v85 = v29;
    id v41 = objc_msgSend(v39, sel_earnedDateComponents);
    if (v41)
    {
      id v42 = v41;
      uint64_t v84 = v13;
      sub_2292CC098();

      char v43 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
      v43(v32, v37, v33);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v32, 0, 1, v33);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33) != 1)
      {
        uint64_t v44 = v98;
        v43(v98, v32, v33);
        sub_2292CC168();
        os_log_type_t v45 = v99;
        uint64_t v46 = v84;
        uint64_t v83 = (unsigned int (*)(char *, uint64_t, uint64_t))*((void *)v99 + 6);
        if (v83(v12, 1, v84) == 1)
        {
          (*(void (**)(char *, uint64_t))(v34 + 8))(v44, v33);

          uint64_t v47 = &qword_26AF369E8;
          uint64_t v48 = (uint64_t)v12;
LABEL_8:
          sub_2292C2930(v48, v47);
          return;
        }
        v82[0] = *((void *)v45 + 4);
        v82[1] = (char *)v45 + 32;
        ((void (*)(char *, char *, uint64_t))v82[0])(v85, v12, v46);
        id v49 = objc_msgSend(v2, sel_template);
        id v50 = objc_msgSend(v49, sel_uniqueName);

        if (!v50)
        {
          __break(1u);
          return;
        }
        uint64_t v51 = sub_2292CC308();
        uint64_t v53 = v52;

        LOBYTE(v51) = sub_2292BFE28(v51, v53, qword_26DD6A5B8);
        swift_bridgeObjectRelease();
        swift_arrayDestroy();
        if (v51)
        {

          (*((void (**)(char *, uint64_t))v99 + 1))(v85, v46);
LABEL_16:
          (*(void (**)(char *, uint64_t))(v34 + 8))(v98, v33);
          return;
        }
        sub_2292CC118();
        id v54 = objc_msgSend(v2, sel_template);
        id v55 = objc_msgSend(v54, sel_duplicateRemovalCalendarUnit);

        if (v55 != (id)0x2000)
        {
          if (v55 == (id)16)
          {
            uint64_t v56 = v85;
            os_log_type_t v57 = v96;
            sub_2292CC188();

            uint64_t v58 = (void (*)(char *, uint64_t))*((void *)v99 + 1);
            uint64_t v59 = v57;
            uint64_t v60 = v84;
            v58(v59, v84);
            v58(v56, v60);
          }
          else
          {

            uint64_t v70 = (void (*)(char *, uint64_t))*((void *)v99 + 1);
            uint64_t v71 = v84;
            v70(v96, v84);
            v70(v85, v71);
          }
          goto LABEL_16;
        }
        id v61 = (void *)sub_2292CC0E8();
        uint64_t v62 = (void *)sub_2292CC148();
        id v63 = (id)ACHStartOfFitnessWeekBeforeDateInCalendar();

        sub_2292CC0F8();
        uint64_t v65 = v92;
        uint64_t v64 = v93;
        (*(void (**)(char *, void, uint64_t))(v92 + 104))(v5, *MEMORY[0x263F07870], v93);
        uint64_t v66 = (uint64_t)v91;
        sub_2292CC178();
        (*(void (**)(char *, uint64_t))(v65 + 8))(v5, v64);
        if (v83((char *)v66, 1, v46) == 1)
        {
          sub_2292C2930(v66, &qword_26AF369E8);
          uint64_t v67 = v99;
          uint64_t v68 = (uint64_t)v94;
          (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v99 + 7))(v94, 1, 1, v46);

          os_log_type_t v69 = (void (*)(char *, uint64_t))*((void *)v67 + 1);
          v69(v95, v46);
LABEL_22:
          v69(v96, v46);
          v69(v85, v46);
          (*(void (**)(char *, uint64_t))(v34 + 8))(v98, v33);
          sub_2292C2930(v68, &qword_26AF369E8);
          return;
        }
        uint64_t v68 = (uint64_t)v94;
        sub_2292CC0D8();
        id v72 = v99;
        os_log_type_t v69 = (void (*)(char *, uint64_t))*((void *)v99 + 1);
        v69((char *)v66, v46);
        (*((void (**)(uint64_t, void, uint64_t, uint64_t))v72 + 7))(v68, 0, 1, v46);
        if (v83((char *)v68, 1, v46) == 1)
        {

          v69(v95, v46);
          goto LABEL_22;
        }
        ((void (*)(char *, uint64_t, uint64_t))v82[0])(v90, v68, v46);
        unint64_t v73 = sub_2292C298C();
        uint64_t v74 = v85;
        uint64_t v94 = (char *)v73;
        LODWORD(v97) = sub_2292CC2D8();
        unint64_t v75 = (void (*)(char *, char *, uint64_t))*((void *)v72 + 2);
        unint64_t v76 = v87;
        v75(v87, v74, v46);
        id v77 = v86;
        v75(v86, v95, v46);
        if (v97)
        {
          v69(v77, v46);
          v69(v76, v46);
          v75(v88, v85, v46);
          v75(v89, v90, v46);
        }
        else
        {
          id v99 = v75;
          char v78 = sub_2292CC2D8();
          v69(v77, v46);
          v69(v76, v46);
          uint64_t v79 = v99;
          v99(v88, v85, v46);
          v79(v89, v90, v46);
          if ((v78 & 1) == 0)
          {
            sub_2292CC2D8();

            goto LABEL_28;
          }
        }

LABEL_28:
        int v80 = v95;
        uint64_t v81 = v84;
        v69(v89, v84);
        v69(v88, v81);
        v69(v90, v81);
        v69(v80, v81);
        v69(v96, v81);
        v69(v85, v81);
        goto LABEL_16;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))(v32, 1, 1, v33);
    }

    uint64_t v47 = &qword_26AF369D8;
    uint64_t v48 = (uint64_t)v32;
    goto LABEL_8;
  }
}

uint64_t sub_2292BFE28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_2292CC6F8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2292CC6F8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_2292BFEF0()
{
  id v1 = v0;
  sub_2292C29E4((uint64_t)&unk_26DD6A5E8, (uint64_t)v1);
  char v3 = v2;

  if (v3)
  {
    os_log_type_t v4 = sub_2292CC458();
    double v5 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v4))
    {
      id v6 = v1;
      uint64_t v7 = v5;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v10 = objc_msgSend(v6, sel_template);
      id v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        uint64_t v12 = sub_2292CC308();
        unint64_t v14 = v13;

        sub_2292AE150(v12, v14, &v15);
        sub_2292CC4C8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_229290000, v7, v4, "[AAUIAwardsDataProvider] Could not find unearned priority for template: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A6B5100](v9, -1, -1);
        MEMORY[0x22A6B5100](v8, -1, -1);
      }
      else
      {

        __break(1u);
      }
    }
  }
}

void sub_2292C00C8(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C00E0(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C00F8(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0110(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C012C(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0150(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C016C(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C01A0(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C01D0(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C01F0(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C020C(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0228(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0248(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0264(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C029C(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C02B8(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C02D8()
{
  id v1 = v0;
  sub_2292C29E4((uint64_t)&unk_26DD6A818, (uint64_t)v1);
  char v3 = v2;

  if (v3)
  {
    os_log_type_t v4 = sub_2292CC458();
    double v5 = (void *)*MEMORY[0x263F098C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], v4))
    {
      id v6 = v1;
      uint64_t v7 = v5;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v9 = swift_slowAlloc();
      uint64_t v15 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v10 = objc_msgSend(v6, sel_template);
      id v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        uint64_t v12 = sub_2292CC308();
        unint64_t v14 = v13;

        sub_2292AE150(v12, v14, &v15);
        sub_2292CC4C8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_229290000, v7, v4, "[AAUIAwardsDataProvider] Could not find earned priority for template: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22A6B5100](v9, -1, -1);
        MEMORY[0x22A6B5100](v8, -1, -1);
      }
      else
      {

        __break(1u);
      }
    }
  }
}

void sub_2292C04B0(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001ELL && v7 == 0x80000002292D0920)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C05A0(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x80000002292D0900)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0690(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x80000002292D08E0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0780(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C0798(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x6E6F68746172614DLL && v7 == 0xEF74756F6B726F57)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C08A4(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x80000002292D08C0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0994(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x80000002292D08A0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0A84(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x80000002292D0880)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0B74(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000016 && v7 == 0x80000002292D0860)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0C64(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x6E6F6C6874617544 && v7 == 0xEF74756F6B726F57)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C0D70(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x80000002292D0840)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0E60(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000022 && v7 == 0x80000002292D0810)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C0F50(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x80000002292D07F0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1040(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x80000002292D07D0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1130(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000014 && v7 == 0x80000002292D07B0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1220(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001ELL && v7 == 0x80000002292D0790)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1310(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x80000002292D0770)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1400(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001DLL && v7 == 0x80000002292D0750)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C14F0(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x80000002292D0400)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C15E0(id *a1@<X0>, uint64_t (*a2)(void)@<X1>, unsigned char *a3@<X8>)
{
  id v5 = objc_msgSend(*a1, sel_template);
  LOBYTE(a2) = a2();

  *a3 = (_BYTE)a2;
}

void sub_2292C163C(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C1658(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x444B303174736542 && v7 == 0xEF6E6F6974617275)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C1764(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000019 && v7 == 0x80000002292D0710)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1854(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x75444B3574736542 && v7 == 0xEE006E6F69746172)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C1960(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x80000002292D06F0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1A50(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C1A6C(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    sub_2292CC308();

    char v5 = sub_2292CC378();
    swift_bridgeObjectRelease();
    *a2 = v5 & 1;
  }
  else
  {
    __break(1u);
  }
}

void sub_2292C1B20(id *a1@<X0>, unsigned char *a2@<X8>)
{
}

void sub_2292C1B40(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x80000002292D05D0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1C30(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x80000002292D05B0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C1D20(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x5774636566726550 && v7 == 0xEE006C6C416B6565)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C1E2C(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x5774636566726550 && v7 == 0xEF65766F4D6B6565)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C1F38(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x80000002292D0570)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C2028(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000023 && v7 == 0x80000002292D0540)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C2118(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0x74756F6B726F5737 && v7 == 0xEC0000006B656557)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  *a2 = v4 & 1;
}

void sub_2292C2218(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000012 && v7 == 0x80000002292D0520)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C2308(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000013 && v7 == 0x80000002292D0500)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C23F8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000017 && v7 == 0x80000002292D04E0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C24E8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000010 && v7 == 0x80000002292D04A0)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C25D8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD00000000000001CLL && v7 == 0x80000002292D0480)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

void sub_2292C26C8(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    sub_2292CC308();

    sub_2292C2B5C();
    sub_2292C2BB0();
    char v5 = sub_2292CC2C8();
    swift_bridgeObjectRelease();
    *a2 = v5 & 1;
  }
  else
  {
    __break(1u);
  }
}

void sub_2292C27A4(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id v3 = objc_msgSend(*a1, sel_template);
  id v4 = objc_msgSend(v3, sel_uniqueName);

  if (v4)
  {
    uint64_t v5 = sub_2292CC308();
    uint64_t v7 = v6;

    if (v5 == 0xD000000000000018 && v7 == 0x80000002292D0440)
    {
      swift_bridgeObjectRelease();
      char v8 = 1;
    }
    else
    {
      char v8 = sub_2292CC6F8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v8 = 0;
  }
  *a2 = v8 & 1;
}

uint64_t sub_2292C2894()
{
  sub_2292CC438();
  swift_getWitnessTable();
  sub_2292CC448();
  return v1;
}

uint64_t sub_2292C2930(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2292C298C()
{
  unint64_t result = qword_26AF369E0;
  if (!qword_26AF369E0)
  {
    sub_2292CC128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF369E0);
  }
  return result;
}

uint64_t sub_2292C29E4(uint64_t a1, uint64_t a2)
{
  void (*v6)(char *__return_ptr, uint64_t *);
  char v8;
  uint64_t v9;

  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  for (uint64_t i = a1 + 40; ; i += 16)
  {
    uint64_t v6 = *(void (**)(char *__return_ptr, uint64_t *))(i - 8);
    uint64_t v9 = a2;
    swift_retain();
    v6(&v8, &v9);
    swift_release();
    if (v8) {
      break;
    }
    if (v2 == ++v4) {
      return 0;
    }
  }
  return v4;
}

uint64_t sub_2292C2A8C(id *a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = *(void *)(v1 + 32);
  id v4 = objc_msgSend(*a1, sel_template);
  id v5 = objc_msgSend(v4, sel_uniqueName);

  if (v5)
  {
    uint64_t v6 = sub_2292CC308();
    uint64_t v8 = v7;

    if (v6 == v3 && v8 == v2) {
      char v10 = 1;
    }
    else {
      char v10 = sub_2292CC6F8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

unint64_t sub_2292C2B5C()
{
  unint64_t result = qword_26AF36A20;
  if (!qword_26AF36A20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF36A20);
  }
  return result;
}

unint64_t sub_2292C2BB0()
{
  unint64_t result = qword_26AF36A18;
  if (!qword_26AF36A18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AF36A18);
  }
  return result;
}

uint64_t sub_2292C2C04(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369E8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v132 = (char *)&v126 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v134 = (char *)&v126 - v6;
  uint64_t v7 = sub_2292CC128();
  uint64_t v135 = *(void *)(v7 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  id v131 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v133 = (char *)&v126 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369D8);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  unint64_t v14 = (char *)&v126 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v126 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v126 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v126 - v21;
  uint64_t v23 = sub_2292CC0A8();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  char v136 = (char *)&v126 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v138 = (char *)&v126 - v27;
  uint64_t v139 = a1;
  id v28 = objc_msgSend(a1, sel_relevantEarnedInstance);
  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v22, 1, 1, v23);
LABEL_7:
    uint64_t v34 = &qword_26AF369D8;
    uint64_t v35 = (uint64_t)v22;
LABEL_16:
    sub_2292C2930(v35, v34);
    id v42 = v139;
    goto LABEL_17;
  }
  id v29 = v28;
  int v137 = a2;
  id v30 = objc_msgSend(v28, sel_earnedDateComponents);

  uint64_t v130 = v7;
  if (v30)
  {
    sub_2292CC098();

    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    v31(v20, 0, 1, v23);
  }
  else
  {
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    v31(v20, 1, 1, v23);
  }
  sub_2292C9BB8((uint64_t)v20, (uint64_t)v22);
  unint64_t v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v33 = v32(v22, 1, v23);
  a2 = v137;
  if (v33 == 1) {
    goto LABEL_7;
  }
  v127 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
  v127(v138, v22, v23);
  id v36 = objc_msgSend(a2, sel_relevantEarnedInstance);
  if (!v36)
  {
    v31(v17, 1, 1, v23);
LABEL_14:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v138, v23);
    uint64_t v34 = &qword_26AF369D8;
LABEL_15:
    uint64_t v35 = (uint64_t)v17;
    goto LABEL_16;
  }
  uint64_t v37 = v36;
  uint64_t v129 = v24;
  uint64_t v128 = v23;
  id v38 = objc_msgSend(v36, sel_earnedDateComponents);

  if (v38)
  {
    sub_2292CC098();

    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v39 = 1;
  }
  char v40 = v136;
  uint64_t v24 = v129;
  uint64_t v23 = v128;
  v31(v14, v39, 1, v128);
  sub_2292C9BB8((uint64_t)v14, (uint64_t)v17);
  int v41 = v32(v17, 1, v23);
  a2 = v137;
  if (v41 == 1) {
    goto LABEL_14;
  }
  v127(v40, v17, v23);
  uint64_t v17 = v134;
  char v78 = v138;
  sub_2292CC168();
  uint64_t v79 = v135;
  uint64_t v80 = v23;
  uint64_t v81 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v135 + 48);
  uint64_t v82 = v130;
  if (v81(v17, 1, v130) == 1)
  {
    uint64_t v83 = *(void (**)(char *, uint64_t))(v129 + 8);
    v83(v40, v80);
    v83(v78, v80);
    uint64_t v34 = &qword_26AF369E8;
    goto LABEL_15;
  }
  uint64_t v93 = v133;
  unint64_t v134 = *(char **)(v79 + 32);
  ((void (*)(char *, char *, uint64_t))v134)(v133, v17, v82);
  uint64_t v94 = (uint64_t)v132;
  sub_2292CC168();
  unsigned int v95 = v81((char *)v94, 1, v82);
  id v42 = v139;
  if (v95 != 1)
  {
    uint64_t v98 = v131;
    ((void (*)(char *, uint64_t, uint64_t))v134)(v131, v94, v82);
    uint64_t v99 = sub_2292CC108();
    uint64_t v100 = v128;
    size_t v101 = v93;
    uint64_t v102 = v129;
    if (v99)
    {
      uint64_t v77 = v99;
      uint64_t v103 = *(void (**)(char *, uint64_t))(v79 + 8);
      v103(v98, v82);
      v103(v101, v82);
      unint64_t v104 = *(void (**)(char *, uint64_t))(v102 + 8);
      v104(v136, v100);
      v104(v138, v100);
      return v77;
    }
    sub_2292C02D8();
    uint64_t v106 = v105;
    uint64_t v107 = v137;
    sub_2292C02D8();
    uint64_t v108 = v138;
    if (v106 == v109)
    {
      id v110 = objc_msgSend(v42, sel_template);
      id v111 = objc_msgSend(v110, sel_displayOrder);

      id v112 = objc_msgSend(v107, sel_template);
      id v113 = objc_msgSend(v112, sel_displayOrder);

      uint64_t v114 = *(void (**)(char *, uint64_t))(v79 + 8);
      v114(v131, v82);
      v114(v133, v82);
      id v115 = *(void (**)(char *, uint64_t))(v102 + 8);
      uint64_t v116 = v128;
      v115(v136, v128);
      v115(v108, v116);
      if (v111 < v113) {
        return 1;
      }
      else {
        return -1;
      }
    }
    sub_2292C02D8();
    uint64_t v118 = v117;
    sub_2292C02D8();
    uint64_t v120 = v119;
    v121 = *(void (**)(char *, uint64_t))(v79 + 8);
    v121(v131, v82);
    v121(v133, v82);
    v122 = *(void (**)(char *, uint64_t))(v102 + 8);
    uint64_t v123 = v128;
    v122(v136, v128);
    v122(v108, v123);
    BOOL v76 = v118 < v120;
LABEL_41:
    if (v76) {
      return -1;
    }
    else {
      return 1;
    }
  }
  (*(void (**)(char *, uint64_t))(v79 + 8))(v93, v82);
  unint64_t v96 = *(void (**)(char *, uint64_t))(v129 + 8);
  uint64_t v97 = v128;
  v96(v136, v128);
  v96(v138, v97);
  sub_2292C2930(v94, &qword_26AF369E8);
  a2 = v137;
LABEL_17:
  if (objc_msgSend(v42, sel_unearned) && !objc_msgSend(a2, sel_unearned)) {
    return 1;
  }
  if ((objc_msgSend(v42, sel_unearned) & 1) == 0
    && (objc_msgSend(a2, sel_unearned) & 1) != 0)
  {
    return -1;
  }
  id v43 = objc_msgSend(v42, sel_progress);
  double v44 = 0.0;
  if (v43)
  {
    os_log_type_t v45 = v43;
    id v46 = objc_msgSend(v42, sel_goal);
    if (v46)
    {
      uint64_t v47 = v46;
      objc_msgSend(v45, sel__value);
      double v49 = v48;
      objc_msgSend(v47, sel__value);
      double v51 = v50;

      double v44 = v49 / v51;
    }
    else
    {
    }
  }
  id v52 = objc_msgSend(a2, sel_progress);
  if (v52)
  {
    uint64_t v53 = v52;
    id v54 = objc_msgSend(a2, sel_goal);
    if (v54)
    {
      id v55 = v54;
      objc_msgSend(v53, sel__value);
      double v57 = v56;
      objc_msgSend(v55, sel__value);
      double v59 = v58;

      if (v57 / v59 != v44)
      {
        if (v57 / v59 >= v44) {
          return 1;
        }
        return -1;
      }
      goto LABEL_32;
    }
  }
  if (v44 != 0.0)
  {
    if (v44 <= 0.0) {
      return 1;
    }
    return -1;
  }
LABEL_32:
  sub_2292BFEF0();
  uint64_t v61 = v60;
  sub_2292BFEF0();
  if (v61 != v62)
  {
LABEL_40:
    sub_2292BFEF0();
    uint64_t v74 = v73;
    sub_2292BFEF0();
    BOOL v76 = v74 < v75;
    goto LABEL_41;
  }
  id v63 = objc_msgSend(v42, sel_section);
  uint64_t v64 = sub_2292CC308();
  uint64_t v66 = v65;

  v67._countAndFlagsBits = v64;
  v67._object = v66;
  AAUIAwardsDataProviderSection.init(rawValue:)(v67);
  if (v141 != 2)
  {
    if (v141 != 3) {
      return -1;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2292CF310;
    *(void *)(inited + 32) = v42;
    *(void *)(inited + 40) = a2;
    unint64_t v140 = inited;
    sub_2292CC3F8();
    unint64_t v69 = v140;
    id v70 = v42;
    id v71 = a2;
    unint64_t v72 = sub_2292C92FC(v69);
    swift_bridgeObjectRelease();
    if (v72 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v124 = sub_2292CC638();
      swift_bridgeObjectRelease();
      if (v124)
      {
LABEL_37:
        if ((v72 & 0xC000000000000001) == 0)
        {
          if (!*(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_40;
          }
          goto LABEL_52;
        }
LABEL_64:
        id v88 = (id)MEMORY[0x22A6B4140](0, v72);
LABEL_53:
        uint64_t v89 = v88;
        swift_bridgeObjectRelease();
        sub_2292AD928();
        id v90 = v70;
        id v91 = v89;
        char v92 = sub_2292CC4B8();

        if (v92) {
          return -1;
        }
        return 1;
      }
    }
    else if (*(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_37;
    }
LABEL_68:
    swift_bridgeObjectRelease();
    return 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AC0);
  uint64_t v84 = swift_initStackObject();
  *(_OWORD *)(v84 + 16) = xmmword_2292CF310;
  *(void *)(v84 + 32) = v42;
  *(void *)(v84 + 40) = a2;
  unint64_t v140 = v84;
  sub_2292CC3F8();
  unint64_t v85 = v140;
  id v70 = v42;
  id v86 = a2;
  unint64_t v72 = sub_2292C9838(v85);
  uint64_t result = swift_bridgeObjectRelease();
  if (v72 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v125 = sub_2292CC638();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v125) {
      goto LABEL_68;
    }
  }
  else if (!*(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_68;
  }
  if ((v72 & 0xC000000000000001) != 0) {
    goto LABEL_64;
  }
  if (*(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_52:
    id v88 = *(id *)(v72 + 32);
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t sub_2292C38B4(void **a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = AAUILocalizedActivityTypeForAchievement(*a1);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_2292CC308();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0xE000000000000000;
  }
  uint64_t v9 = *a2;
  if (*(void *)(*a2 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_2292AC940(v6, v8);
    if (v11)
    {
      uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 8 * v10);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v12 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
  id v13 = v3;
  MEMORY[0x22A6B3F70]();
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2292CC408();
  }
  sub_2292CC428();
  sub_2292CC3F8();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *a2;
  *a2 = 0x8000000000000000;
  sub_2292B9428(v12, v6, v8, isUniquelyReferenced_nonNull_native);
  *a2 = v16;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2292C3A34()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2292CC298();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = *(void **)((char *)v1 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *uint64_t v5 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F0E0], v2);
  id v7 = v6;
  LOBYTE(v6) = sub_2292CC2A8();
  uint64_t v9 = *(uint64_t (**)(void *, uint64_t))(v3 + 8);
  uint64_t v8 = v3 + 8;
  uint64_t v10 = v9(v5, v2);
  if ((v6 & 1) == 0) {
    goto LABEL_92;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x160))(v10);
  int64_t v12 = 0;
  uint64_t v13 = *(void *)(v11 + 64);
  uint64_t v70 = v11 + 64;
  uint64_t v14 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v71 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v72 = v11;
  uint64_t v17 = MEMORY[0x263F8EE78];
  unint64_t v69 = v1;
  while (1)
  {
    if (v16)
    {
      uint64_t v74 = (v16 - 1) & v16;
      unint64_t v24 = __clz(__rbit64(v16)) | (v12 << 6);
    }
    else
    {
      if (__OFADD__(v12++, 1)) {
        goto LABEL_90;
      }
      if (v12 >= v71) {
        return swift_release();
      }
      unint64_t v26 = *(void *)(v70 + 8 * v12);
      if (!v26)
      {
        int64_t v27 = v12 + 1;
        if (v12 + 1 >= v71) {
          return swift_release();
        }
        unint64_t v26 = *(void *)(v70 + 8 * v27);
        if (!v26)
        {
          int64_t v27 = v12 + 2;
          if (v12 + 2 >= v71) {
            return swift_release();
          }
          unint64_t v26 = *(void *)(v70 + 8 * v27);
          if (!v26)
          {
            int64_t v27 = v12 + 3;
            if (v12 + 3 >= v71) {
              return swift_release();
            }
            unint64_t v26 = *(void *)(v70 + 8 * v27);
            if (!v26)
            {
              while (1)
              {
                int64_t v12 = v27 + 1;
                if (__OFADD__(v27, 1)) {
                  goto LABEL_91;
                }
                if (v12 >= v71) {
                  return swift_release();
                }
                unint64_t v26 = *(void *)(v70 + 8 * v12);
                ++v27;
                if (v26) {
                  goto LABEL_20;
                }
              }
            }
          }
        }
        int64_t v12 = v27;
      }
LABEL_20:
      uint64_t v74 = (v26 - 1) & v26;
      unint64_t v24 = __clz(__rbit64(v26)) + (v12 << 6);
    }
    int64_t v75 = v12;
    uint64_t v8 = *(unsigned __int8 *)(*(void *)(v72 + 48) + v24);
    unint64_t v28 = *(void *)(*(void *)(v72 + 56) + 8 * v24);
    v79[0] = v17;
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v29 = sub_2292CC638();
      unsigned int v76 = v8;
      if (!v29)
      {
LABEL_38:
        swift_bridgeObjectRelease();
        unint64_t v33 = v17;
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      unsigned int v76 = v8;
      if (!v29) {
        goto LABEL_38;
      }
    }
    if (v29 < 1) {
      break;
    }
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v31 = (id)MEMORY[0x22A6B4140](i, v28);
      }
      else {
        id v31 = *(id *)(v28 + 8 * i + 32);
      }
      unint64_t v32 = v31;
      if (objc_msgSend(v31, sel_unearned))
      {
      }
      else
      {
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        sub_2292CC5C8();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v33 = v79[0];
    LODWORD(v8) = v76;
LABEL_39:
    switch(v8)
    {
      case 1:
        swift_bridgeObjectRetain();
        if ((v33 & 0x8000000000000000) != 0 || (char v40 = (void *)v33, (v33 & 0x4000000000000000) != 0))
        {
          char v40 = sub_2292B8654(v33);
          swift_release();
        }
        v79[0] = (uint64_t)v40;
        sub_2292C4FF0(v79);
        swift_release();
        break;
      case 2:
        uint64_t v34 = sub_2292C9C20(v33);
LABEL_44:
        unint64_t v35 = v34;
        swift_release();
        v79[0] = v17;
        if (!v29) {
          goto LABEL_61;
        }
        goto LABEL_45;
      case 3:
        uint64_t v34 = sub_2292C92FC(v33);
        goto LABEL_44;
      default:
        swift_retain();
        int v41 = v1;
        if ((v33 & 0x8000000000000000) != 0 || (id v42 = (void *)v33, (v33 & 0x4000000000000000) != 0))
        {
          id v42 = sub_2292B8654(v33);
          swift_release();
        }
        v79[0] = (uint64_t)v42;
        id v43 = v41;
        sub_2292CABF4(v79, v43);
        swift_release();

        break;
    }
    unint64_t v35 = v79[0];
    v79[0] = v17;
    if (!v29)
    {
LABEL_61:
      swift_bridgeObjectRelease();
      unint64_t v39 = v17;
      goto LABEL_62;
    }
LABEL_45:
    for (uint64_t j = 0; j != v29; ++j)
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v37 = (id)MEMORY[0x22A6B4140](j, v28);
      }
      else {
        id v37 = *(id *)(v28 + 8 * j + 32);
      }
      id v38 = v37;
      if (objc_msgSend(v37, sel_unearned))
      {
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        sub_2292CC5C8();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v39 = v79[0];
LABEL_62:
    double v44 = v1;
    swift_retain();
    if ((v39 & 0x8000000000000000) != 0 || (os_log_type_t v45 = (void *)v39, (v39 & 0x4000000000000000) != 0))
    {
      os_log_type_t v45 = sub_2292B8654(v39);
      swift_release();
    }
    v79[0] = (uint64_t)v45;
    uint64_t v8 = v44;
    sub_2292CABF4(v79, (void *)v8);
    swift_release();

    uint64_t v77 = v79[0];
    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_2292CC638();
      if (!v46)
      {
LABEL_79:
        swift_bridgeObjectRelease();
        uint64_t v17 = MEMORY[0x263F8EE78];
        uint64_t v48 = MEMORY[0x263F8EE78];
        goto LABEL_80;
      }
    }
    else
    {
      uint64_t v46 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v46) {
        goto LABEL_79;
      }
    }
    v79[0] = MEMORY[0x263F8EE78];
    sub_2292C896C(0, v46 & ~(v46 >> 63), 0);
    if (v46 < 0) {
      goto LABEL_89;
    }
    uint64_t v73 = v8;
    uint64_t v47 = 0;
    uint64_t v48 = v79[0];
    do
    {
      if ((v35 & 0xC000000000000001) != 0) {
        id v49 = (id)MEMORY[0x22A6B4140](v47, v35);
      }
      else {
        id v49 = *(id *)(v35 + 8 * v47 + 32);
      }
      double v50 = v49;
      id v51 = objc_msgSend(v49, sel_template);
      id v52 = objc_msgSend(v51, sel_uniqueName);

      if (v52)
      {
        uint64_t v53 = sub_2292CC308();
        uint64_t v55 = v54;
      }
      else
      {

        uint64_t v53 = 0;
        uint64_t v55 = 0;
      }
      v79[0] = v48;
      unint64_t v57 = *(void *)(v48 + 16);
      unint64_t v56 = *(void *)(v48 + 24);
      if (v57 >= v56 >> 1)
      {
        sub_2292C896C((void *)(v56 > 1), v57 + 1, 1);
        uint64_t v48 = v79[0];
      }
      ++v47;
      *(void *)(v48 + 16) = v57 + 1;
      uint64_t v58 = v48 + 16 * v57;
      *(void *)(v58 + 32) = v53;
      *(void *)(v58 + 40) = v55;
    }
    while (v46 != v47);
    swift_bridgeObjectRelease();
    uint64_t v1 = v69;
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t v8 = v73;
LABEL_80:
    unint64_t v59 = swift_retain();
    unint64_t v60 = sub_2292C9EE4(v59, v48);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v61 = v76;
    if (((1 << v76) & 0x4E) != 0)
    {
      swift_release();
      v79[0] = v35;
      sub_2292B80D8(v60);
      uint64_t v18 = v79[0];
      uint64_t v8 = (*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *(void *)v8) + 0x170))(v79);
      uint64_t v20 = v19;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v78 = *v20;
      uint64_t *v20 = 0x8000000000000000;
      uint64_t v22 = v18;
      uint64_t v23 = v61;
LABEL_6:
      sub_2292B92F0(v22, v23, isUniquelyReferenced_nonNull_native);
      uint64_t *v20 = v78;
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t *, void))v8)(v79, 0);
      goto LABEL_7;
    }
    if (((1 << v76) & 0x30) != 0)
    {
      swift_bridgeObjectRelease();
      v79[0] = v77;
      sub_2292B80D8(v35);
      uint64_t v62 = v79[0];
      uint64_t v8 = (*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *(void *)v8) + 0x170))(v79);
      uint64_t v20 = v63;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v78 = *v20;
      uint64_t *v20 = 0x8000000000000000;
      uint64_t v22 = v62;
      uint64_t v23 = v76;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v64 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *))((*MEMORY[0x263F8EED0] & *(void *)v8)
                                                                                       + 0x170))(v79);
    uint64_t v8 = v65;
    char v66 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v78 = *(void *)v8;
    *(void *)uint64_t v8 = 0x8000000000000000;
    sub_2292B92F0(v77, 0, v66);
    *(void *)uint64_t v8 = v78;
    swift_bridgeObjectRelease();
    v64(v79, 0);
LABEL_7:
    unint64_t v16 = v74;
    int64_t v12 = v75;
  }
  __break(1u);
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);

  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_2292C43EC()
{
  uint64_t v1 = sub_2292CC298();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (uint64_t *)((char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = *(void **)((char *)v0 + OBJC_IVAR___AAUIAwardsDataProvider_awardQueue);
  *uint64_t v4 = v5;
  (*(void (**)(void *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F0E0], v1);
  id v6 = v5;
  LOBYTE(v5) = sub_2292CC2A8();
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t))(v2 + 8);
  id v7 = (void *)(v2 + 8);
  uint64_t v9 = v8(v4, v1);
  if (v5)
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EED0];
    uint64_t v11 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8);
    uint64_t v12 = v11(v9);
    uint64_t v13 = (__CFString *)sub_2292CC2F8();
    id v14 = objc_msgSend(self, sel_mainBundle);
    uint64_t v15 = (__CFString *)objc_msgSend(v14, sel_bundleIdentifier);

    if (v15)
    {
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(v13, v15, 0);

      LOBYTE(v15) = AppBooleanValue != 0;
    }
    uint64_t v17 = (*(uint64_t (**)(void))((*v10 & *v0) + 0x160))();
    uint64_t v18 = (char *)sub_2292C52C0(v17);
    swift_bridgeObjectRelease();
    uint64_t v25 = v18;
    uint64_t v19 = v0;
    swift_retain();
    sub_2292CB504(&v25, (char)v15, v19);
    swift_release();

    uint64_t v20 = (*(uint64_t (**)(char *))((*v10 & *v19) + 0x1B0))(v25);
    uint64_t v21 = v11(v20);
    uint64_t v22 = sub_2292C4E7C(v12, v21);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return (v22 & 1) == 0;
  }
  else
  {
    __break(1u);

    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

uint64_t sub_2292C46EC(unsigned __int8 *a1, unsigned __int8 *a2, char a3, void *a4)
{
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  sub_2292ABC1C();
  sub_2292CC3A8();
  sub_2292CC3A8();
  if (v55 == v53 && v56 == v54) {
    goto LABEL_13;
  }
  char v9 = sub_2292CC6F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9) {
    return 1;
  }
  sub_2292CC3A8();
  sub_2292CC3A8();
  if (v55 == v53 && v56 == v54) {
    goto LABEL_8;
  }
  char v11 = sub_2292CC6F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  if ((v11 & 1) == 0)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_20;
    }
    sub_2292CC3A8();
    sub_2292CC3A8();
    if (v55 == v53 && v56 == v54)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return 1;
    }
    char v12 = sub_2292CC6F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12) {
      return 1;
    }
    sub_2292CC3A8();
    sub_2292CC3A8();
    if (v55 == v53 && v56 == v54)
    {
LABEL_8:
      swift_bridgeObjectRelease_n();
      return 0;
    }
    char v13 = sub_2292CC6F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = 0;
    if ((v13 & 1) == 0)
    {
LABEL_20:
      id v14 = (void *)MEMORY[0x263F8EED0];
      uint64_t v15 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *a4) + 0x178);
      uint64_t v16 = v15(0);
      if (*(void *)(v16 + 16))
      {
        unint64_t v17 = sub_2292AC8D4(v6);
        if (v18)
        {
          unint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (v19 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v49 = sub_2292CC638();
            swift_bridgeObjectRelease();
            if (!v49) {
              goto LABEL_27;
            }
          }
          else if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_27;
          }
          if ((v19 & 0xC000000000000001) != 0) {
            goto LABEL_69;
          }
          if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_33:
            id v24 = *(id *)(v19 + 32);
LABEL_34:
            uint64_t v25 = v24;
            uint64_t v26 = swift_bridgeObjectRelease();
LABEL_36:
            uint64_t v27 = v15(v26);
            if (*(void *)(v27 + 16))
            {
              unint64_t v28 = sub_2292AC8D4(v7);
              if (v29)
              {
                unint64_t v30 = *(void *)(*(void *)(v27 + 56) + 8 * v28);
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
                if (v30 >> 62)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v50 = sub_2292CC638();
                  swift_bridgeObjectRelease();
                  if (!v50) {
                    goto LABEL_43;
                  }
                }
                else if (!*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  goto LABEL_43;
                }
                if ((v30 & 0xC000000000000001) != 0) {
                  goto LABEL_70;
                }
                if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
LABEL_49:
                  id v35 = *(id *)(v30 + 32);
LABEL_50:
                  id v36 = v35;
                  swift_bridgeObjectRelease();
LABEL_52:
                  if (v25)
                  {
                    if (!v36)
                    {

                      return 1;
                    }
                    id v37 = v25;
                    id v36 = v36;
                    if (!objc_msgSend(v37, sel_unearned)
                      || (objc_msgSend(v36, sel_unearned) & 1) == 0)
                    {
                      uint64_t v38 = sub_2292C2C04(v37, v36);

                      return v38 == -1;
                    }
                  }
                  else
                  {
                    if (v36)
                    {

                      return 0;
                    }
                    id v37 = 0;
                  }
                  unint64_t v39 = static AAUIAwardsDataProviderSection.allCases.getter();
                  uint64_t v40 = sub_2292C4DDC(v6, (uint64_t)v39);
                  char v42 = v41;
                  swift_bridgeObjectRelease();
                  if (v42) {
                    uint64_t v43 = 0;
                  }
                  else {
                    uint64_t v43 = v40;
                  }
                  double v44 = static AAUIAwardsDataProviderSection.allCases.getter();
                  uint64_t v45 = sub_2292C4DDC(v7, (uint64_t)v44);
                  char v47 = v46;
                  swift_bridgeObjectRelease();

                  if (v47) {
                    uint64_t v48 = 0;
                  }
                  else {
                    uint64_t v48 = v45;
                  }
                  return v43 < v48;
                }
                __break(1u);
              }
            }
LABEL_43:
            uint64_t v31 = swift_bridgeObjectRelease();
            uint64_t v32 = (*(uint64_t (**)(uint64_t))((*v14 & *a4) + 0x160))(v31);
            if (*(void *)(v32 + 16))
            {
              unint64_t v33 = sub_2292AC8D4(v7);
              if (v34)
              {
                unint64_t v30 = *(void *)(*(void *)(v32 + 56) + 8 * v33);
                swift_bridgeObjectRetain();
                uint64_t result = swift_bridgeObjectRelease();
                if (v30 >> 62)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v52 = sub_2292CC638();
                  uint64_t result = swift_bridgeObjectRelease();
                  if (v52)
                  {
LABEL_47:
                    if ((v30 & 0xC000000000000001) == 0)
                    {
                      if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                        goto LABEL_49;
                      }
LABEL_80:
                      __break(1u);
                      return result;
                    }
LABEL_70:
                    id v35 = (id)MEMORY[0x22A6B4140](0, v30);
                    goto LABEL_50;
                  }
                }
                else if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  goto LABEL_47;
                }
              }
            }
            swift_bridgeObjectRelease();
            id v36 = 0;
            goto LABEL_52;
          }
          __break(1u);
        }
      }
LABEL_27:
      uint64_t v20 = swift_bridgeObjectRelease();
      uint64_t v21 = (*(uint64_t (**)(uint64_t))((*v14 & *a4) + 0x160))(v20);
      if (*(void *)(v21 + 16))
      {
        unint64_t v22 = sub_2292AC8D4(v6);
        if (v23)
        {
          unint64_t v19 = *(void *)(*(void *)(v21 + 56) + 8 * v22);
          swift_bridgeObjectRetain();
          uint64_t result = swift_bridgeObjectRelease();
          if (v19 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v51 = sub_2292CC638();
            uint64_t result = swift_bridgeObjectRelease();
            if (v51)
            {
LABEL_31:
              if ((v19 & 0xC000000000000001) == 0)
              {
                if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
                {
                  __break(1u);
                  goto LABEL_80;
                }
                goto LABEL_33;
              }
LABEL_69:
              id v24 = (id)MEMORY[0x22A6B4140](0, v19);
              goto LABEL_34;
            }
          }
          else if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_31;
          }
        }
      }
      uint64_t v26 = swift_bridgeObjectRelease();
      uint64_t v25 = 0;
      goto LABEL_36;
    }
  }
  return result;
}

uint64_t sub_2292C4DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  sub_2292ABC70();
  uint64_t v3 = 0;
  while ((sub_2292CC2E8() & 1) == 0)
  {
    if (v2 == ++v3) {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_2292C4E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v6 = 1;
    }
    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      sub_2292ABC70();
      uint64_t v5 = v2 - 1;
      do
      {
        ++v3;
        ++v4;
        char v6 = sub_2292CC2E8();
        BOOL v8 = v5-- != 0;
      }
      while ((v6 & 1) != 0 && v8);
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

unint64_t sub_2292C4F30(uint64_t a1)
{
  uint64_t v2 = sub_2292CC738();
  return sub_2292C8490(a1, v2);
}

uint64_t sub_2292C4F74(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2292BB818();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_2292C59E0(v6);
  return sub_2292CC5C8();
}

uint64_t sub_2292C4FF0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2292BB818();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_2292C6570(v6);
  return sub_2292CC5C8();
}

uint64_t sub_2292C506C(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

void *sub_2292C50F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AB8);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  uint64_t v6 = sub_2292C8C98(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2292AD968();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *sub_2292C51D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AA0);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_2292C8E2C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2292AD968();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2292C52C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A98);
  uint64_t v3 = swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  uint64_t v5 = sub_2292C902C(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_2292AD968();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2292C5398(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_2292CC6B8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_138;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v76 = 0;
      uint64_t v77 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        unint64_t v79 = *(void *)(v77 + 8 * i);
        uint64_t v80 = v76;
        do
        {
          unint64_t v81 = *(void *)(v77 + v80);
          if (v79 >= v81) {
            break;
          }
          if (!v77) {
            goto LABEL_142;
          }
          *(void *)(v77 + v80 + 8) = v81;
          *(void *)(v77 + v80) = v79;
          v80 -= 8;
        }
        while (v80 != -8);
        v76 += 8;
      }
    }
  }
  else
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1) {
      goto LABEL_137;
    }
    uint64_t v93 = result;
    uint64_t v94 = v3;
    if (v3 > 1)
    {
      uint64_t v6 = v5 >> 1;
      uint64_t result = sub_2292CC418();
      *(void *)(result + 16) = v6;
      uint64_t v3 = v94;
      uint64_t v92 = result;
      unint64_t v96 = (char *)(result + 32);
LABEL_13:
      uint64_t v8 = 0;
      uint64_t v9 = *v2;
      id v90 = v2;
      uint64_t v91 = *v2 - 8;
      uint64_t v10 = MEMORY[0x263F8EE78];
      uint64_t v95 = *v2;
      while (1)
      {
        uint64_t v12 = v8++;
        if (v8 < v3)
        {
          unint64_t v13 = *(void *)(v9 + 8 * v8);
          unint64_t v14 = *(void *)(v9 + 8 * v12);
          uint64_t v8 = v12 + 2;
          if (v12 + 2 < v3)
          {
            unint64_t v15 = v13;
            while (1)
            {
              unint64_t v16 = *(void *)(v9 + 8 * v8);
              if (v13 < v14 == v16 >= v15) {
                break;
              }
              ++v8;
              unint64_t v15 = v16;
              if (v3 == v8)
              {
                uint64_t v8 = v3;
                break;
              }
            }
          }
          if (v13 < v14)
          {
            if (v8 < v12) {
              goto LABEL_139;
            }
            if (v12 < v8)
            {
              uint64_t v17 = v8 - 1;
              uint64_t v18 = v12;
              do
              {
                if (v18 != v17)
                {
                  if (!v9) {
                    goto LABEL_145;
                  }
                  uint64_t v19 = *(void *)(v9 + 8 * v18);
                  *(void *)(v9 + 8 * v18) = *(void *)(v9 + 8 * v17);
                  *(void *)(v9 + 8 * v17) = v19;
                }
                BOOL v58 = ++v18 < v17--;
              }
              while (v58);
            }
          }
        }
        if (v8 < v3)
        {
          if (__OFSUB__(v8, v12)) {
            goto LABEL_136;
          }
          if (v8 - v12 < v93)
          {
            uint64_t v20 = v12 + v93;
            if (__OFADD__(v12, v93)) {
              goto LABEL_140;
            }
            if (v20 >= v3) {
              uint64_t v20 = v3;
            }
            if (v20 < v12)
            {
LABEL_141:
              __break(1u);
LABEL_142:
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
              return result;
            }
            if (v8 != v20)
            {
              uint64_t v21 = (unint64_t *)(v91 + 8 * v8);
              do
              {
                unint64_t v22 = *(void *)(v9 + 8 * v8);
                uint64_t v23 = v12;
                id v24 = v21;
                do
                {
                  unint64_t v25 = *v24;
                  if (v22 >= *v24) {
                    break;
                  }
                  if (!v9) {
                    goto LABEL_143;
                  }
                  *id v24 = v22;
                  v24[1] = v25;
                  --v24;
                  ++v23;
                }
                while (v8 != v23);
                ++v8;
                ++v21;
              }
              while (v8 != v20);
              uint64_t v8 = v20;
            }
          }
        }
        if (v8 < v12) {
          goto LABEL_131;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_2292B874C(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
          uint64_t v10 = result;
        }
        unint64_t v27 = *(void *)(v10 + 16);
        unint64_t v26 = *(void *)(v10 + 24);
        unint64_t v11 = v27 + 1;
        uint64_t v9 = v95;
        if (v27 >= v26 >> 1)
        {
          uint64_t result = (uint64_t)sub_2292B874C((char *)(v26 > 1), v27 + 1, 1, (char *)v10);
          uint64_t v9 = v95;
          uint64_t v10 = result;
        }
        *(void *)(v10 + 16) = v11;
        uint64_t v28 = v10 + 32;
        char v29 = (uint64_t *)(v10 + 32 + 16 * v27);
        *char v29 = v12;
        v29[1] = v8;
        if (v27)
        {
          while (1)
          {
            unint64_t v30 = v11 - 1;
            if (v11 >= 4)
            {
              unint64_t v35 = v28 + 16 * v11;
              uint64_t v36 = *(void *)(v35 - 64);
              uint64_t v37 = *(void *)(v35 - 56);
              BOOL v41 = __OFSUB__(v37, v36);
              uint64_t v38 = v37 - v36;
              if (v41) {
                goto LABEL_120;
              }
              uint64_t v40 = *(void *)(v35 - 48);
              uint64_t v39 = *(void *)(v35 - 40);
              BOOL v41 = __OFSUB__(v39, v40);
              uint64_t v33 = v39 - v40;
              char v34 = v41;
              if (v41) {
                goto LABEL_121;
              }
              unint64_t v42 = v11 - 2;
              uint64_t v43 = (uint64_t *)(v28 + 16 * (v11 - 2));
              uint64_t v45 = *v43;
              uint64_t v44 = v43[1];
              BOOL v41 = __OFSUB__(v44, v45);
              uint64_t v46 = v44 - v45;
              if (v41) {
                goto LABEL_122;
              }
              BOOL v41 = __OFADD__(v33, v46);
              uint64_t v47 = v33 + v46;
              if (v41) {
                goto LABEL_124;
              }
              if (v47 >= v38)
              {
                uint64_t v65 = (uint64_t *)(v28 + 16 * v30);
                uint64_t v67 = *v65;
                uint64_t v66 = v65[1];
                BOOL v41 = __OFSUB__(v66, v67);
                uint64_t v68 = v66 - v67;
                if (v41) {
                  goto LABEL_130;
                }
                BOOL v58 = v33 < v68;
                goto LABEL_84;
              }
            }
            else
            {
              if (v11 != 3)
              {
                uint64_t v59 = *(void *)(v10 + 32);
                uint64_t v60 = *(void *)(v10 + 40);
                BOOL v41 = __OFSUB__(v60, v59);
                uint64_t v52 = v60 - v59;
                char v53 = v41;
                goto LABEL_78;
              }
              uint64_t v32 = *(void *)(v10 + 32);
              uint64_t v31 = *(void *)(v10 + 40);
              BOOL v41 = __OFSUB__(v31, v32);
              uint64_t v33 = v31 - v32;
              char v34 = v41;
            }
            if (v34) {
              goto LABEL_123;
            }
            unint64_t v42 = v11 - 2;
            uint64_t v48 = (uint64_t *)(v28 + 16 * (v11 - 2));
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            BOOL v51 = __OFSUB__(v49, v50);
            uint64_t v52 = v49 - v50;
            char v53 = v51;
            if (v51) {
              goto LABEL_125;
            }
            uint64_t v54 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v56 = *v54;
            uint64_t v55 = v54[1];
            BOOL v41 = __OFSUB__(v55, v56);
            uint64_t v57 = v55 - v56;
            if (v41) {
              goto LABEL_127;
            }
            if (__OFADD__(v52, v57)) {
              goto LABEL_129;
            }
            if (v52 + v57 >= v33)
            {
              BOOL v58 = v33 < v57;
LABEL_84:
              if (v58) {
                unint64_t v30 = v42;
              }
              goto LABEL_86;
            }
LABEL_78:
            if (v53) {
              goto LABEL_126;
            }
            uint64_t v61 = (uint64_t *)(v28 + 16 * v30);
            uint64_t v63 = *v61;
            uint64_t v62 = v61[1];
            BOOL v41 = __OFSUB__(v62, v63);
            uint64_t v64 = v62 - v63;
            if (v41) {
              goto LABEL_128;
            }
            if (v64 < v52) {
              goto LABEL_15;
            }
LABEL_86:
            unint64_t v69 = v30 - 1;
            if (v30 - 1 >= v11)
            {
              __break(1u);
LABEL_117:
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
              goto LABEL_141;
            }
            if (!v9) {
              goto LABEL_144;
            }
            uint64_t v70 = (uint64_t *)(v28 + 16 * v69);
            uint64_t v71 = *v70;
            uint64_t v72 = v28;
            uint64_t v73 = (void *)(v28 + 16 * v30);
            uint64_t v74 = v73[1];
            uint64_t result = sub_2292C75B4((char *)(v9 + 8 * *v70), (char *)(v9 + 8 * *v73), v9 + 8 * v74, v96);
            if (v1) {
              goto LABEL_114;
            }
            if (v74 < v71) {
              goto LABEL_117;
            }
            if (v30 > *(void *)(v10 + 16)) {
              goto LABEL_118;
            }
            uint64_t *v70 = v71;
            *(void *)(v72 + 16 * v69 + 8) = v74;
            unint64_t v75 = *(void *)(v10 + 16);
            if (v30 >= v75) {
              goto LABEL_119;
            }
            unint64_t v11 = v75 - 1;
            uint64_t result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v30));
            uint64_t v28 = v72;
            *(void *)(v10 + 16) = v75 - 1;
            uint64_t v9 = v95;
            if (v75 <= 2) {
              goto LABEL_15;
            }
          }
        }
        unint64_t v11 = 1;
LABEL_15:
        uint64_t v3 = v94;
        if (v8 >= v94)
        {
          uint64_t v7 = v92;
          uint64_t v2 = v90;
          goto LABEL_103;
        }
      }
    }
    uint64_t v7 = MEMORY[0x263F8EE78];
    unint64_t v96 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 == 1)
    {
      uint64_t v92 = MEMORY[0x263F8EE78];
      goto LABEL_13;
    }
    unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_103:
    uint64_t v92 = v7;
    if (v11 >= 2)
    {
      uint64_t v82 = *v2;
      do
      {
        unint64_t v83 = v11 - 2;
        if (v11 < 2) {
          goto LABEL_132;
        }
        if (!v82) {
          goto LABEL_146;
        }
        uint64_t v84 = v10;
        uint64_t v85 = v10 + 32;
        uint64_t v86 = *(void *)(v10 + 32 + 16 * v83);
        uint64_t v87 = *(void *)(v10 + 32 + 16 * (v11 - 1) + 8);
        uint64_t result = sub_2292C75B4((char *)(v82 + 8 * v86), (char *)(v82 + 8 * *(void *)(v85 + 16 * (v11 - 1))), v82 + 8 * v87, v96);
        if (v1) {
          break;
        }
        if (v87 < v86) {
          goto LABEL_133;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_2292B8904(v84);
          uint64_t v84 = result;
        }
        if (v83 >= *(void *)(v84 + 16)) {
          goto LABEL_134;
        }
        id v88 = (void *)(v84 + 32 + 16 * v83);
        *id v88 = v86;
        v88[1] = v87;
        unint64_t v89 = *(void *)(v84 + 16);
        if (v11 > v89) {
          goto LABEL_135;
        }
        uint64_t result = (uint64_t)memmove((void *)(v84 + 32 + 16 * (v11 - 1)), (const void *)(v84 + 32 + 16 * v11), 16 * (v89 - v11));
        uint64_t v10 = v84;
        *(void *)(v84 + 16) = v89 - 1;
        unint64_t v11 = v89 - 1;
      }
      while (v89 > 2);
    }
LABEL_114:
    swift_bridgeObjectRelease();
    *(void *)(v92 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2292C59E0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369F0);
  MEMORY[0x270FA5388]();
  uint64_t v162 = (char *)&v147 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = a1[1];
  uint64_t result = sub_2292CC6B8();
  if (result < v5)
  {
    if (v5 >= 0) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 + 1;
    }
    if (v5 < -1) {
      goto LABEL_150;
    }
    uint64_t v8 = result;
    char v148 = a1;
    if (v5 <= 1)
    {
      uint64_t v32 = MEMORY[0x263F8EE78];
      uint64_t v167 = MEMORY[0x263F8EE78];
      uint64_t v158 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
      if (v5 != 1)
      {
        unint64_t v36 = *(void *)(MEMORY[0x263F8EE78] + 16);
        if (v36 < 2) {
          goto LABEL_127;
        }
        goto LABEL_115;
      }
    }
    else
    {
      uint64_t v9 = a1;
      uint64_t v10 = v7 >> 1;
      sub_2292AD928();
      uint64_t result = sub_2292CC418();
      *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v10;
      a1 = v9;
      uint64_t v158 = (void **)((result & 0xFFFFFFFFFFFFFF8) + 32);
      uint64_t v167 = result;
    }
    uint64_t v152 = v8;
    uint64_t v160 = v1;
    uint64_t v33 = 0;
    uint64_t v34 = *a1;
    uint64_t v35 = *a1 + 16;
    uint64_t v149 = *a1 - 8;
    uint64_t v150 = v35;
    uint64_t v32 = MEMORY[0x263F8EE78];
    uint64_t v161 = v34;
    char v159 = (void **)v5;
    while (1)
    {
      uint64_t v37 = v33++;
      uint64_t v156 = v37;
      if (v33 < v5)
      {
        uint64_t v38 = *(void **)(v34 + 8 * v37);
        id v39 = *(id *)(v34 + 8 * v33);
        id v40 = v38;
        uint64_t result = AAUILocalizedModalityForAchievement(v39);
        if (!result) {
          goto LABEL_166;
        }
        BOOL v41 = (void *)result;
        uint64_t v42 = sub_2292CC308();
        uint64_t v44 = v43;

        uint64_t v165 = v42;
        uint64_t v166 = v44;
        uint64_t result = AAUILocalizedModalityForAchievement(v40);
        if (!result) {
          goto LABEL_167;
        }
        uint64_t v45 = (void *)result;
        uint64_t v46 = sub_2292CC308();
        uint64_t v48 = v47;

        uint64_t v163 = v46;
        uint64_t v164 = v48;
        uint64_t v49 = sub_2292CC138();
        uint64_t v50 = *(void *)(v49 - 8);
        uint64_t v51 = (uint64_t)v162;
        v154 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 56);
        uint64_t v155 = v49;
        uint64_t v153 = v50 + 56;
        v154(v162, 1, 1);
        sub_2292AE7A8();
        uint64_t v157 = sub_2292CC4F8();
        sub_2292C2930(v51, &qword_26AF369F0);
        swift_bridgeObjectRelease();

        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v37 = v156;
        uint64_t v33 = v156 + 2;
        if (v156 + 2 < (uint64_t)v159)
        {
          uint64_t v151 = v32;
          uint64_t v52 = (id *)(v150 + 8 * v156);
          do
          {
            char v53 = *(v52 - 1);
            id v54 = *v52;
            id v55 = v53;
            uint64_t result = AAUILocalizedModalityForAchievement(v54);
            if (!result) {
              goto LABEL_162;
            }
            uint64_t v56 = (void *)result;
            uint64_t v57 = sub_2292CC308();
            uint64_t v59 = v58;

            uint64_t v165 = v57;
            uint64_t v166 = v59;
            uint64_t result = AAUILocalizedModalityForAchievement(v55);
            if (!result) {
              goto LABEL_163;
            }
            uint64_t v60 = (void *)result;
            BOOL v61 = v157 == -1;
            uint64_t v62 = sub_2292CC308();
            uint64_t v64 = v63;

            uint64_t v163 = v62;
            uint64_t v164 = v64;
            uint64_t v65 = (uint64_t)v162;
            ((void (*)(char *, uint64_t, uint64_t, uint64_t))v154)(v162, 1, 1, v155);
            uint64_t v66 = sub_2292CC4F8();
            sub_2292C2930(v65, &qword_26AF369F0);
            swift_bridgeObjectRelease();

            uint64_t result = swift_bridgeObjectRelease();
            if (v61 == (v66 != -1)) {
              goto LABEL_34;
            }
            ++v33;
            ++v52;
          }
          while (v159 != (void **)v33);
          uint64_t v33 = (uint64_t)v159;
LABEL_34:
          uint64_t v32 = v151;
          uint64_t v37 = v156;
        }
        uint64_t v34 = v161;
        if (v157 == -1)
        {
          if (v33 < v37) {
            goto LABEL_157;
          }
          if (v37 < v33)
          {
            uint64_t v67 = (uint64_t *)(v149 + 8 * v33);
            uint64_t v68 = v33;
            uint64_t v69 = v37;
            uint64_t v70 = (uint64_t *)(v161 + 8 * v37);
            do
            {
              if (v69 != --v68)
              {
                if (!v34) {
                  goto LABEL_164;
                }
                uint64_t v71 = *v70;
                uint64_t *v70 = *v67;
                uint64_t *v67 = v71;
              }
              ++v69;
              --v67;
              ++v70;
            }
            while (v69 < v68);
            uint64_t v37 = v156;
          }
        }
      }
      if (v33 < (uint64_t)v159)
      {
        if (__OFSUB__(v33, v37)) {
          goto LABEL_149;
        }
        if (v33 - v37 >= v152)
        {
          uint64_t v37 = v156;
        }
        else
        {
          if (__OFADD__(v156, v152)) {
            goto LABEL_152;
          }
          uint64_t v72 = v159;
          if (v156 + v152 < (uint64_t)v159) {
            uint64_t v72 = (void **)(v156 + v152);
          }
          uint64_t v37 = v156;
          if ((uint64_t)v72 < v156)
          {
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
            return result;
          }
          if ((void **)v33 != v72)
          {
            uint64_t v151 = v32;
            uint64_t v73 = v149 + 8 * v33;
            uint64_t v155 = (uint64_t)v72;
            do
            {
              uint64_t v74 = *(void **)(v34 + 8 * v33);
              uint64_t v157 = v73;
              while (1)
              {
                unint64_t v75 = *(void **)v73;
                id v76 = v74;
                id v77 = v75;
                uint64_t result = AAUILocalizedModalityForAchievement(v76);
                if (!result) {
                  goto LABEL_158;
                }
                uint64_t v78 = (void *)result;
                uint64_t v79 = sub_2292CC308();
                uint64_t v81 = v80;

                uint64_t v165 = v79;
                uint64_t v166 = v81;
                uint64_t result = AAUILocalizedModalityForAchievement(v77);
                if (!result) {
                  goto LABEL_159;
                }
                uint64_t v82 = (void *)result;
                uint64_t v83 = sub_2292CC308();
                uint64_t v85 = v84;

                uint64_t v163 = v83;
                uint64_t v164 = v85;
                uint64_t v86 = sub_2292CC138();
                uint64_t v87 = (uint64_t)v162;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v86 - 8) + 56))(v162, 1, 1, v86);
                sub_2292AE7A8();
                uint64_t v88 = sub_2292CC4F8();
                sub_2292C2930(v87, &qword_26AF369F0);
                swift_bridgeObjectRelease();

                uint64_t result = swift_bridgeObjectRelease();
                if (v88 != -1) {
                  break;
                }
                uint64_t v34 = v161;
                if (!v161) {
                  goto LABEL_160;
                }
                unint64_t v89 = *(void **)v73;
                uint64_t v74 = *(void **)(v73 + 8);
                *(void *)uint64_t v73 = v74;
                *(void *)(v73 + 8) = v89;
                v73 -= 8;
                if (v33 == ++v37) {
                  goto LABEL_54;
                }
              }
              uint64_t v34 = v161;
LABEL_54:
              ++v33;
              uint64_t v37 = v156;
              uint64_t v73 = v157 + 8;
            }
            while (v33 != v155);
            uint64_t v33 = v155;
            uint64_t v32 = v151;
            if (v155 < v156) {
              goto LABEL_144;
            }
            goto LABEL_64;
          }
        }
      }
      if (v33 < v37) {
        goto LABEL_144;
      }
LABEL_64:
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_2292B874C(0, *(void *)(v32 + 16) + 1, 1, (char *)v32);
        uint64_t v32 = result;
      }
      unint64_t v91 = *(void *)(v32 + 16);
      unint64_t v90 = *(void *)(v32 + 24);
      unint64_t v36 = v91 + 1;
      uint64_t v34 = v161;
      uint64_t v92 = v156;
      if (v91 >= v90 >> 1)
      {
        uint64_t result = (uint64_t)sub_2292B874C((char *)(v90 > 1), v91 + 1, 1, (char *)v32);
        uint64_t v92 = v156;
        uint64_t v34 = v161;
        uint64_t v32 = result;
      }
      *(void *)(v32 + 16) = v36;
      uint64_t v93 = v32 + 32;
      uint64_t v94 = (uint64_t *)(v32 + 32 + 16 * v91);
      *uint64_t v94 = v92;
      v94[1] = v33;
      if (v91)
      {
        while (1)
        {
          unint64_t v95 = v36 - 1;
          if (v36 >= 4)
          {
            unint64_t v100 = v93 + 16 * v36;
            uint64_t v101 = *(void *)(v100 - 64);
            uint64_t v102 = *(void *)(v100 - 56);
            BOOL v106 = __OFSUB__(v102, v101);
            uint64_t v103 = v102 - v101;
            if (v106) {
              goto LABEL_133;
            }
            uint64_t v105 = *(void *)(v100 - 48);
            uint64_t v104 = *(void *)(v100 - 40);
            BOOL v106 = __OFSUB__(v104, v105);
            uint64_t v98 = v104 - v105;
            char v99 = v106;
            if (v106) {
              goto LABEL_134;
            }
            unint64_t v107 = v36 - 2;
            uint64_t v108 = (uint64_t *)(v93 + 16 * (v36 - 2));
            uint64_t v110 = *v108;
            uint64_t v109 = v108[1];
            BOOL v106 = __OFSUB__(v109, v110);
            uint64_t v111 = v109 - v110;
            if (v106) {
              goto LABEL_135;
            }
            BOOL v106 = __OFADD__(v98, v111);
            uint64_t v112 = v98 + v111;
            if (v106) {
              goto LABEL_137;
            }
            if (v112 >= v103)
            {
              uint64_t v130 = (uint64_t *)(v93 + 16 * v95);
              uint64_t v132 = *v130;
              uint64_t v131 = v130[1];
              BOOL v106 = __OFSUB__(v131, v132);
              uint64_t v133 = v131 - v132;
              if (v106) {
                goto LABEL_143;
              }
              BOOL v123 = v98 < v133;
              goto LABEL_100;
            }
          }
          else
          {
            if (v36 != 3)
            {
              uint64_t v124 = *(void *)(v32 + 32);
              uint64_t v125 = *(void *)(v32 + 40);
              BOOL v106 = __OFSUB__(v125, v124);
              uint64_t v117 = v125 - v124;
              char v118 = v106;
              goto LABEL_94;
            }
            uint64_t v97 = *(void *)(v32 + 32);
            uint64_t v96 = *(void *)(v32 + 40);
            BOOL v106 = __OFSUB__(v96, v97);
            uint64_t v98 = v96 - v97;
            char v99 = v106;
          }
          if (v99) {
            goto LABEL_136;
          }
          unint64_t v107 = v36 - 2;
          id v113 = (uint64_t *)(v93 + 16 * (v36 - 2));
          uint64_t v115 = *v113;
          uint64_t v114 = v113[1];
          BOOL v116 = __OFSUB__(v114, v115);
          uint64_t v117 = v114 - v115;
          char v118 = v116;
          if (v116) {
            goto LABEL_138;
          }
          uint64_t v119 = (uint64_t *)(v93 + 16 * v95);
          uint64_t v121 = *v119;
          uint64_t v120 = v119[1];
          BOOL v106 = __OFSUB__(v120, v121);
          uint64_t v122 = v120 - v121;
          if (v106) {
            goto LABEL_140;
          }
          if (__OFADD__(v117, v122)) {
            goto LABEL_142;
          }
          if (v117 + v122 >= v98)
          {
            BOOL v123 = v98 < v122;
LABEL_100:
            if (v123) {
              unint64_t v95 = v107;
            }
            goto LABEL_102;
          }
LABEL_94:
          if (v118) {
            goto LABEL_139;
          }
          uint64_t v126 = (uint64_t *)(v93 + 16 * v95);
          uint64_t v128 = *v126;
          uint64_t v127 = v126[1];
          BOOL v106 = __OFSUB__(v127, v128);
          uint64_t v129 = v127 - v128;
          if (v106) {
            goto LABEL_141;
          }
          if (v129 < v117) {
            goto LABEL_23;
          }
LABEL_102:
          unint64_t v134 = v95 - 1;
          if (v95 - 1 >= v36)
          {
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
            goto LABEL_153;
          }
          if (!v34) {
            goto LABEL_161;
          }
          uint64_t v135 = (uint64_t *)(v93 + 16 * v134);
          uint64_t v136 = *v135;
          int v137 = (void *)(v93 + 16 * v95);
          uint64_t v138 = v137[1];
          uint64_t v139 = v160;
          uint64_t result = (uint64_t)sub_2292C77B8((void **)(v34 + 8 * *v135), (id *)(v34 + 8 * *v137), v34 + 8 * v138, v158);
          uint64_t v160 = v139;
          if (v139) {
            goto LABEL_127;
          }
          if (v138 < v136) {
            goto LABEL_130;
          }
          if (v95 > *(void *)(v32 + 16)) {
            goto LABEL_131;
          }
          *uint64_t v135 = v136;
          *(void *)(v93 + 16 * v134 + 8) = v138;
          unint64_t v140 = *(void *)(v32 + 16);
          if (v95 >= v140) {
            goto LABEL_132;
          }
          unint64_t v36 = v140 - 1;
          uint64_t result = (uint64_t)memmove((void *)(v93 + 16 * v95), v137 + 2, 16 * (v140 - 1 - v95));
          *(void *)(v32 + 16) = v140 - 1;
          uint64_t v34 = v161;
          if (v140 <= 2) {
            goto LABEL_23;
          }
        }
      }
      unint64_t v36 = 1;
LABEL_23:
      uint64_t v5 = (uint64_t)v159;
      if (v33 >= (uint64_t)v159)
      {
        uint64_t v2 = v160;
        if (v36 < 2)
        {
LABEL_127:
          swift_bridgeObjectRelease();
          *(void *)((v167 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_2292CC3F8();
          return swift_bridgeObjectRelease();
        }
LABEL_115:
        uint64_t v141 = *v148;
        while (1)
        {
          unint64_t v142 = v36 - 2;
          if (v36 < 2) {
            goto LABEL_145;
          }
          if (!v141) {
            goto LABEL_165;
          }
          uint64_t v143 = *(void *)(v32 + 32 + 16 * v142);
          uint64_t v144 = *(void *)(v32 + 32 + 16 * (v36 - 1) + 8);
          uint64_t result = (uint64_t)sub_2292C77B8((void **)(v141 + 8 * v143), (id *)(v141 + 8 * *(void *)(v32 + 32 + 16 * (v36 - 1))), v141 + 8 * v144, v158);
          if (v2) {
            goto LABEL_127;
          }
          if (v144 < v143) {
            goto LABEL_146;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_2292B8904(v32);
            uint64_t v32 = result;
          }
          if (v142 >= *(void *)(v32 + 16)) {
            goto LABEL_147;
          }
          uint64_t v145 = (void *)(v32 + 32 + 16 * v142);
          *uint64_t v145 = v143;
          v145[1] = v144;
          unint64_t v146 = *(void *)(v32 + 16);
          if (v36 > v146) {
            goto LABEL_148;
          }
          uint64_t result = (uint64_t)memmove((void *)(v32 + 32 + 16 * (v36 - 1)), (const void *)(v32 + 32 + 16 * v36), 16 * (v146 - v36));
          *(void *)(v32 + 16) = v146 - 1;
          unint64_t v36 = v146 - 1;
          if (v146 <= 2) {
            goto LABEL_127;
          }
        }
      }
    }
  }
  if (v5 < 0) {
    goto LABEL_151;
  }
  if ((unint64_t)v5 >= 2)
  {
    char v159 = (void **)v5;
    uint64_t v160 = v1;
    uint64_t v11 = *a1;
    uint64_t v12 = -1;
    uint64_t v13 = 1;
    uint64_t v14 = *a1;
LABEL_12:
    uint64_t v157 = v14;
    uint64_t v158 = (void **)v13;
    unint64_t v15 = *(void **)(v11 + 8 * v13);
    uint64_t v161 = v12;
    while (1)
    {
      unint64_t v16 = *(void **)v14;
      id v17 = v15;
      id v18 = v16;
      uint64_t result = AAUILocalizedModalityForAchievement(v17);
      if (!result) {
        goto LABEL_154;
      }
      uint64_t v19 = (void *)result;
      uint64_t v20 = sub_2292CC308();
      uint64_t v22 = v21;

      uint64_t v165 = v20;
      uint64_t v166 = v22;
      uint64_t result = AAUILocalizedModalityForAchievement(v18);
      if (!result) {
        goto LABEL_155;
      }
      uint64_t v23 = (void *)result;
      uint64_t v24 = sub_2292CC308();
      uint64_t v26 = v25;

      uint64_t v163 = v24;
      uint64_t v164 = v26;
      uint64_t v27 = sub_2292CC138();
      uint64_t v28 = (uint64_t)v162;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v162, 1, 1, v27);
      sub_2292AE7A8();
      uint64_t v29 = sub_2292CC4F8();
      sub_2292C2930(v28, &qword_26AF369F0);
      swift_bridgeObjectRelease();

      uint64_t result = swift_bridgeObjectRelease();
      if (v29 == -1)
      {
        if (!v11) {
          goto LABEL_156;
        }
        unint64_t v30 = *(void **)v14;
        unint64_t v15 = *(void **)(v14 + 8);
        *(void *)uint64_t v14 = v15;
        *(void *)(v14 + 8) = v30;
        v14 -= 8;
        if (!__CFADD__(v12++, 1)) {
          continue;
        }
      }
      uint64_t v13 = (uint64_t)v158 + 1;
      uint64_t v14 = v157 + 8;
      uint64_t v12 = v161 - 1;
      if ((void **)((char *)v158 + 1) == v159) {
        return result;
      }
      goto LABEL_12;
    }
  }
  return result;
}

void sub_2292C6570(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_2292CC6B8();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_2292C73AC(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_131;
  }
  uint64_t v102 = v4;
  char v99 = a1;
  if (v3 > 1)
  {
    uint64_t v6 = v5 >> 1;
    sub_2292AD928();
    uint64_t v7 = sub_2292CC418();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    uint64_t v111 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v113 = v7;
LABEL_12:
    uint64_t v9 = 0;
    uint64_t v10 = *a1;
    uint64_t v100 = *a1 - 8;
    uint64_t v101 = *a1 + 16;
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    uint64_t v107 = v3;
    uint64_t v112 = *a1;
    while (1)
    {
      uint64_t v12 = v9++;
      uint64_t v108 = v12;
      if (v9 < v3)
      {
        uint64_t v103 = v8;
        uint64_t v13 = *(void **)(v10 + 8 * v12);
        id v14 = *(id *)(v10 + 8 * v9);
        id v15 = v13;
        id v16 = objc_msgSend(v14, sel_template);
        id v109 = objc_msgSend(v16, sel_displayOrder);

        id v17 = objc_msgSend(v15, sel_template);
        id v105 = objc_msgSend(v17, sel_displayOrder);

        uint64_t v9 = v12 + 2;
        if (v12 + 2 < v3)
        {
          id v18 = (id *)(v101 + 8 * v12);
          while (1)
          {
            uint64_t v19 = *(v18 - 1);
            id v20 = *v18;
            id v21 = v19;
            id v22 = objc_msgSend(v20, sel_template);
            id v23 = objc_msgSend(v22, sel_displayOrder);

            id v24 = objc_msgSend(v21, sel_template);
            id v25 = objc_msgSend(v24, sel_displayOrder);

            if (v109 < v105 == v23 >= v25) {
              break;
            }
            ++v9;
            ++v18;
            uint64_t v3 = v107;
            if (v107 == v9)
            {
              uint64_t v9 = v107;
              goto LABEL_22;
            }
          }
          uint64_t v3 = v107;
LABEL_22:
          uint64_t v12 = v108;
        }
        uint64_t v8 = v103;
        uint64_t v10 = v112;
        if (v109 < v105)
        {
          if (v9 < v12) {
            goto LABEL_133;
          }
          if (v12 < v9)
          {
            uint64_t v26 = (uint64_t *)(v100 + 8 * v9);
            uint64_t v27 = v9;
            uint64_t v28 = v12;
            uint64_t v29 = (uint64_t *)(v112 + 8 * v12);
            do
            {
              if (v28 != --v27)
              {
                if (!v112) {
                  goto LABEL_138;
                }
                uint64_t v30 = *v29;
                *uint64_t v29 = *v26;
                *uint64_t v26 = v30;
              }
              ++v28;
              --v26;
              ++v29;
            }
            while (v28 < v27);
          }
        }
      }
      if (v9 < v3)
      {
        if (__OFSUB__(v9, v12)) {
          goto LABEL_130;
        }
        if (v9 - v12 < v102)
        {
          if (__OFADD__(v12, v102)) {
            goto LABEL_134;
          }
          if (v12 + v102 >= v3) {
            uint64_t v31 = v3;
          }
          else {
            uint64_t v31 = v12 + v102;
          }
          if (v31 < v12)
          {
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
            return;
          }
          if (v9 != v31)
          {
            uint64_t v104 = v8;
            uint64_t v106 = v31;
            uint64_t v32 = v100 + 8 * v9;
            do
            {
              uint64_t v33 = *(void **)(v10 + 8 * v9);
              uint64_t v34 = v12;
              uint64_t v110 = v32;
              while (1)
              {
                uint64_t v35 = *(void **)v32;
                id v36 = v33;
                id v37 = v35;
                id v38 = objc_msgSend(v36, sel_template);
                id v39 = objc_msgSend(v38, sel_displayOrder);

                id v40 = objc_msgSend(v37, sel_template);
                id v41 = objc_msgSend(v40, sel_displayOrder);

                if (v39 >= v41) {
                  break;
                }
                uint64_t v10 = v112;
                if (!v112) {
                  goto LABEL_136;
                }
                uint64_t v42 = *(void **)v32;
                uint64_t v33 = *(void **)(v32 + 8);
                *(void *)uint64_t v32 = v33;
                *(void *)(v32 + 8) = v42;
                v32 -= 8;
                if (v9 == ++v34) {
                  goto LABEL_42;
                }
              }
              uint64_t v10 = v112;
LABEL_42:
              ++v9;
              uint64_t v12 = v108;
              uint64_t v32 = v110 + 8;
            }
            while (v9 != v106);
            uint64_t v9 = v106;
            uint64_t v8 = v104;
          }
        }
      }
      if (v9 < v12) {
        goto LABEL_125;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_2292B874C(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v44 = *((void *)v8 + 2);
      unint64_t v43 = *((void *)v8 + 3);
      unint64_t v11 = v44 + 1;
      uint64_t v10 = v112;
      if (v44 >= v43 >> 1)
      {
        uint64_t v92 = sub_2292B874C((char *)(v43 > 1), v44 + 1, 1, v8);
        uint64_t v10 = v112;
        uint64_t v8 = v92;
      }
      *((void *)v8 + 2) = v11;
      uint64_t v45 = v8 + 32;
      uint64_t v46 = &v8[16 * v44 + 32];
      *(void *)uint64_t v46 = v12;
      *((void *)v46 + 1) = v9;
      if (v44)
      {
        while (1)
        {
          unint64_t v47 = v11 - 1;
          if (v11 >= 4)
          {
            uint64_t v52 = &v45[16 * v11];
            uint64_t v53 = *((void *)v52 - 8);
            uint64_t v54 = *((void *)v52 - 7);
            BOOL v58 = __OFSUB__(v54, v53);
            uint64_t v55 = v54 - v53;
            if (v58) {
              goto LABEL_114;
            }
            uint64_t v57 = *((void *)v52 - 6);
            uint64_t v56 = *((void *)v52 - 5);
            BOOL v58 = __OFSUB__(v56, v57);
            uint64_t v50 = v56 - v57;
            char v51 = v58;
            if (v58) {
              goto LABEL_115;
            }
            unint64_t v59 = v11 - 2;
            uint64_t v60 = &v45[16 * v11 - 32];
            uint64_t v62 = *(void *)v60;
            uint64_t v61 = *((void *)v60 + 1);
            BOOL v58 = __OFSUB__(v61, v62);
            uint64_t v63 = v61 - v62;
            if (v58) {
              goto LABEL_116;
            }
            BOOL v58 = __OFADD__(v50, v63);
            uint64_t v64 = v50 + v63;
            if (v58) {
              goto LABEL_118;
            }
            if (v64 >= v55)
            {
              uint64_t v82 = &v45[16 * v47];
              uint64_t v84 = *(void *)v82;
              uint64_t v83 = *((void *)v82 + 1);
              BOOL v58 = __OFSUB__(v83, v84);
              uint64_t v85 = v83 - v84;
              if (v58) {
                goto LABEL_124;
              }
              BOOL v75 = v50 < v85;
              goto LABEL_86;
            }
          }
          else
          {
            if (v11 != 3)
            {
              uint64_t v76 = *((void *)v8 + 4);
              uint64_t v77 = *((void *)v8 + 5);
              BOOL v58 = __OFSUB__(v77, v76);
              uint64_t v69 = v77 - v76;
              char v70 = v58;
              goto LABEL_80;
            }
            uint64_t v49 = *((void *)v8 + 4);
            uint64_t v48 = *((void *)v8 + 5);
            BOOL v58 = __OFSUB__(v48, v49);
            uint64_t v50 = v48 - v49;
            char v51 = v58;
          }
          if (v51) {
            goto LABEL_117;
          }
          unint64_t v59 = v11 - 2;
          uint64_t v65 = &v45[16 * v11 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v68 = __OFSUB__(v66, v67);
          uint64_t v69 = v66 - v67;
          char v70 = v68;
          if (v68) {
            goto LABEL_119;
          }
          uint64_t v71 = &v45[16 * v47];
          uint64_t v73 = *(void *)v71;
          uint64_t v72 = *((void *)v71 + 1);
          BOOL v58 = __OFSUB__(v72, v73);
          uint64_t v74 = v72 - v73;
          if (v58) {
            goto LABEL_121;
          }
          if (__OFADD__(v69, v74)) {
            goto LABEL_123;
          }
          if (v69 + v74 >= v50)
          {
            BOOL v75 = v50 < v74;
LABEL_86:
            if (v75) {
              unint64_t v47 = v59;
            }
            goto LABEL_88;
          }
LABEL_80:
          if (v70) {
            goto LABEL_120;
          }
          uint64_t v78 = &v45[16 * v47];
          uint64_t v80 = *(void *)v78;
          uint64_t v79 = *((void *)v78 + 1);
          BOOL v58 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          if (v58) {
            goto LABEL_122;
          }
          if (v81 < v69) {
            goto LABEL_14;
          }
LABEL_88:
          unint64_t v86 = v47 - 1;
          if (v47 - 1 >= v11)
          {
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
            goto LABEL_135;
          }
          if (!v10) {
            goto LABEL_137;
          }
          uint64_t v87 = &v45[16 * v86];
          uint64_t v88 = *(void *)v87;
          unint64_t v89 = &v45[16 * v47];
          uint64_t v90 = *((void *)v89 + 1);
          sub_2292C7CC0((void **)(v10 + 8 * *(void *)v87), (id *)(v10 + 8 * *(void *)v89), v10 + 8 * v90, v111);
          if (v1) {
            goto LABEL_108;
          }
          if (v90 < v88) {
            goto LABEL_111;
          }
          if (v47 > *((void *)v8 + 2)) {
            goto LABEL_112;
          }
          *(void *)uint64_t v87 = v88;
          *(void *)&v45[16 * v86 + 8] = v90;
          unint64_t v91 = *((void *)v8 + 2);
          if (v47 >= v91) {
            goto LABEL_113;
          }
          unint64_t v11 = v91 - 1;
          memmove(&v45[16 * v47], v89 + 16, 16 * (v91 - 1 - v47));
          *((void *)v8 + 2) = v91 - 1;
          uint64_t v10 = v112;
          if (v91 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v11 = 1;
LABEL_14:
      uint64_t v3 = v107;
      if (v9 >= v107) {
        goto LABEL_97;
      }
    }
  }
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  uint64_t v113 = MEMORY[0x263F8EE78];
  uint64_t v111 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v3 == 1) {
    goto LABEL_12;
  }
  unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_97:
  if (v11 >= 2)
  {
    uint64_t v93 = *v99;
    do
    {
      unint64_t v94 = v11 - 2;
      if (v11 < 2) {
        goto LABEL_126;
      }
      if (!v93) {
        goto LABEL_139;
      }
      uint64_t v95 = *(void *)&v8[16 * v94 + 32];
      uint64_t v96 = *(void *)&v8[16 * v11 + 24];
      sub_2292C7CC0((void **)(v93 + 8 * v95), (id *)(v93 + 8 * *(void *)&v8[16 * v11 + 16]), v93 + 8 * v96, v111);
      if (v1) {
        break;
      }
      if (v96 < v95) {
        goto LABEL_127;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_2292B8904((uint64_t)v8);
      }
      if (v94 >= *((void *)v8 + 2)) {
        goto LABEL_128;
      }
      uint64_t v97 = &v8[16 * v94 + 32];
      *(void *)uint64_t v97 = v95;
      *((void *)v97 + 1) = v96;
      unint64_t v98 = *((void *)v8 + 2);
      if (v11 > v98) {
        goto LABEL_129;
      }
      memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
      *((void *)v8 + 2) = v98 - 1;
      unint64_t v11 = v98 - 1;
    }
    while (v98 > 2);
  }
LABEL_108:
  swift_bridgeObjectRelease();
  *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_2292CC3F8();
  swift_bridgeObjectRelease();
}

uint64_t sub_2292C6D04(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_2292CC6B8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_2292C74E4(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_151;
  }
  uint64_t v101 = result;
  unint64_t v98 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v104 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_117:
      uint64_t result = v10;
      uint64_t v100 = v7;
      if (v11 >= 2)
      {
        uint64_t v91 = *v98;
        do
        {
          unint64_t v92 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_146;
          }
          if (!v91) {
            goto LABEL_159;
          }
          uint64_t v93 = result;
          uint64_t v94 = *(void *)(result + 32 + 16 * v92);
          uint64_t v95 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_2292C8014((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(void *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1) {
            break;
          }
          if (v95 < v94) {
            goto LABEL_147;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_2292B8904(v93);
            uint64_t v93 = result;
          }
          if (v92 >= *(void *)(v93 + 16)) {
            goto LABEL_148;
          }
          uint64_t v96 = (void *)(v93 + 32 + 16 * v92);
          *uint64_t v96 = v94;
          v96[1] = v95;
          unint64_t v97 = *(void *)(v93 + 16);
          if (v11 > v97) {
            goto LABEL_149;
          }
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          uint64_t result = v93;
          *(void *)(v93 + 16) = v97 - 1;
          unint64_t v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(void *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v100 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_2292CC418();
    *(void *)(result + 16) = v6;
    uint64_t v100 = result;
    uint64_t v104 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v99 = v9 + 8;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v102 = v3;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_45;
    }
    uint64_t v13 = (uint64_t *)(v9 + 16 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    id v15 = (void *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_44;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_2292CC6F8();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v19 = (void *)(v99 + 16 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      id v21 = (void *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_2292CC6F8();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 2;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_155;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 16 * v18;
        uint64_t v24 = 16 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_158;
            }
            uint64_t v27 = v9 + v23;
            uint64_t v28 = *(void *)(v9 + v24);
            uint64_t v29 = *(void *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(void *)(v27 - 16) = v28;
            *(void *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      uint64_t v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_150;
      }
      if (v8 - v12 < v101) {
        break;
      }
    }
LABEL_66:
    if (v8 < v12) {
      goto LABEL_145;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_2292B874C(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v38 = *(void *)(v10 + 16);
    unint64_t v37 = *(void *)(v10 + 24);
    unint64_t v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      uint64_t result = (uint64_t)sub_2292B874C((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v39 = v10 + 32;
    id v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    uint64_t *v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      uint64_t v103 = v8;
      while (1)
      {
        unint64_t v41 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v46 = v39 + 16 * v11;
          uint64_t v47 = *(void *)(v46 - 64);
          uint64_t v48 = *(void *)(v46 - 56);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_134;
          }
          uint64_t v51 = *(void *)(v46 - 48);
          uint64_t v50 = *(void *)(v46 - 40);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_135;
          }
          unint64_t v53 = v11 - 2;
          uint64_t v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          uint64_t v56 = *v54;
          uint64_t v55 = v54[1];
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_136;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_138;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = (uint64_t *)(v39 + 16 * v41);
            uint64_t v78 = *v76;
            uint64_t v77 = v76[1];
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_144;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v70 = *(void *)(v10 + 32);
            uint64_t v71 = *(void *)(v10 + 40);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_98;
          }
          uint64_t v43 = *(void *)(v10 + 32);
          uint64_t v42 = *(void *)(v10 + 40);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_137;
        }
        unint64_t v53 = v11 - 2;
        unint64_t v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        uint64_t v61 = *v59;
        uint64_t v60 = v59[1];
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_139;
        }
        uint64_t v65 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v67 = *v65;
        uint64_t v66 = v65[1];
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_141;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_143;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_104:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_106;
        }
LABEL_98:
        if (v64) {
          goto LABEL_140;
        }
        uint64_t v72 = (uint64_t *)(v39 + 16 * v41);
        uint64_t v74 = *v72;
        uint64_t v73 = v72[1];
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_142;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_106:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v81 = v9;
        if (!v9) {
          goto LABEL_157;
        }
        uint64_t v82 = v10;
        uint64_t v83 = (uint64_t *)(v39 + 16 * v80);
        uint64_t v84 = *v83;
        uint64_t v85 = v39;
        unint64_t v86 = v41;
        uint64_t v87 = (void *)(v39 + 16 * v41);
        uint64_t v88 = v87[1];
        uint64_t v89 = v81;
        uint64_t result = sub_2292C8014((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1) {
          goto LABEL_114;
        }
        if (v88 < v84) {
          goto LABEL_131;
        }
        if (v86 > *(void *)(v82 + 16)) {
          goto LABEL_132;
        }
        *uint64_t v83 = v84;
        *(void *)(v85 + 16 * v80 + 8) = v88;
        unint64_t v90 = *(void *)(v82 + 16);
        if (v86 >= v90) {
          goto LABEL_133;
        }
        uint64_t v10 = v82;
        unint64_t v11 = v90 - 1;
        uint64_t result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        uint64_t v39 = v85;
        *(void *)(v82 + 16) = v90 - 1;
        uint64_t v9 = v89;
        uint64_t v8 = v103;
        if (v90 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    uint64_t v3 = v102;
    if (v8 >= v102)
    {
      uint64_t v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101)) {
    goto LABEL_153;
  }
  if (v12 + v101 >= v3) {
    uint64_t v30 = v3;
  }
  else {
    uint64_t v30 = v12 + v101;
  }
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      uint64_t v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        uint64_t v32 = (uint64_t *)(v9 + 16 * v8);
        uint64_t result = *v32;
        uint64_t v33 = v32[1];
        uint64_t v34 = v12;
        uint64_t v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1)) {
            break;
          }
          uint64_t result = sub_2292CC6F8();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_156;
          }
          uint64_t result = *v35;
          uint64_t v33 = v35[1];
          *(_OWORD *)uint64_t v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      uint64_t v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

void sub_2292C73AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v19 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v6 = *(void **)(v19 + 8 * v4);
    uint64_t v7 = a1;
    uint64_t v18 = v5;
    while (1)
    {
      uint64_t v8 = *(void **)v5;
      id v9 = v6;
      id v10 = v8;
      id v11 = objc_msgSend(v9, sel_template);
      id v12 = objc_msgSend(v11, sel_displayOrder);

      id v13 = objc_msgSend(v10, sel_template);
      id v14 = objc_msgSend(v13, sel_displayOrder);

      if (v12 >= v14)
      {
LABEL_4:
        ++v4;
        uint64_t v5 = v18 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v19) {
        break;
      }
      id v15 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)uint64_t v5 = v6;
      *(void *)(v5 + 8) = v15;
      v5 -= 8;
      if (v4 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_2292C74E4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    id v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    id v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_2292CC6F8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)id v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2292C75B4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    id v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_39;
    }
    int v17 = (char *)(a3 - 8);
    uint64_t v18 = v6;
    while (1)
    {
      uint64_t v19 = v17 + 8;
      unint64_t v21 = *((void *)v18 - 1);
      v18 -= 8;
      unint64_t v20 = v21;
      if (*((void *)v14 - 1) < v21) {
        break;
      }
      unint64_t v20 = *((void *)v14 - 1);
      uint64_t v18 = v6;
      if (v19 != v14)
      {
        v14 -= 8;
LABEL_35:
        *(void *)int v17 = v20;
        goto LABEL_36;
      }
      BOOL v22 = v17 >= v14;
      v14 -= 8;
      if (v22) {
        goto LABEL_35;
      }
LABEL_36:
      if (v18 > v7)
      {
        v17 -= 8;
        uint64_t v6 = v18;
        if (v14 > v4) {
          continue;
        }
      }
      uint64_t v6 = v18;
      goto LABEL_39;
    }
    if (v19 == v6 && v17 < v6) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  id v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v15 = *(void *)v6;
      if (*(void *)v6 >= *(void *)v4) {
        break;
      }
      BOOL v16 = v7 == v6;
      v6 += 8;
      if (!v16) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v15 = *(void *)v4;
    BOOL v16 = v7 == v4;
    v4 += 8;
    if (v16) {
      goto LABEL_17;
    }
LABEL_16:
    *(void *)uint64_t v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_39:
  int64_t v23 = v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0);
  if (v6 != v4 || v6 >= &v4[v23 & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * (v23 >> 3));
  }
  return 1;
}

__CFString *sub_2292C77B8(void **a1, id *a2, unint64_t a3, void **a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369F0);
  MEMORY[0x270FA5388]();
  char v64 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v10 = (char *)a2 - (char *)a1;
  }
  uint64_t v11 = v10 >> 3;
  unint64_t v59 = a3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = v12 / 8;
  if (v10 >> 3 >= v12 / 8)
  {
    uint64_t v57 = a1;
    if (a4 != a2 || &a2[v13] <= a4) {
      memmove(a4, a2, 8 * v13);
    }
    uint64_t v15 = &a4[v13];
    if (v12 < 8 || v57 >= a2) {
      goto LABEL_44;
    }
    uint64_t v55 = v4;
    uint64_t v56 = a4;
    uint64_t v35 = (id *)(v59 - 8);
    while (1)
    {
      unint64_t v59 = (unint64_t)v15;
      id v36 = v15 - 1;
      unint64_t v37 = a2;
      uint64_t v39 = a2 - 1;
      unint64_t v38 = *(a2 - 1);
      id v40 = *(v15 - 1);
      id v41 = v38;
      uint64_t result = AAUILocalizedModalityForAchievement(v40);
      if (!result) {
        goto LABEL_50;
      }
      uint64_t v42 = result;
      uint64_t v43 = sub_2292CC308();
      uint64_t v45 = v44;

      uint64_t v62 = v43;
      uint64_t v63 = v45;
      uint64_t result = AAUILocalizedModalityForAchievement(v41);
      if (!result)
      {
LABEL_51:
        __break(1u);
        return result;
      }
      unint64_t v46 = result;
      uint64_t v58 = v35 + 1;
      uint64_t v47 = sub_2292CC308();
      uint64_t v49 = v48;

      uint64_t v60 = v47;
      uint64_t v61 = v49;
      uint64_t v50 = sub_2292CC138();
      uint64_t v51 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v64, 1, 1, v50);
      sub_2292AE7A8();
      uint64_t v52 = sub_2292CC4F8();
      sub_2292C2930(v51, &qword_26AF369F0);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v52 == -1)
      {
        uint64_t v15 = (void **)v59;
        if (v58 == v37)
        {
          a2 = v39;
          unint64_t v53 = (unint64_t)v57;
          if (v35 < v37) {
            goto LABEL_39;
          }
          goto LABEL_38;
        }
        a2 = v39;
      }
      else
      {
        a2 = v37;
        uint64_t v39 = v36;
        if (v58 == (id *)v59)
        {
          uint64_t v15 = v36;
          unint64_t v53 = (unint64_t)v57;
          if ((unint64_t)v35 < v59) {
            goto LABEL_39;
          }
          goto LABEL_38;
        }
        uint64_t v15 = v36;
      }
      unint64_t v53 = (unint64_t)v57;
LABEL_38:
      id *v35 = *v39;
LABEL_39:
      a4 = v56;
      if (v15 > v56)
      {
        --v35;
        if ((unint64_t)a2 > v53) {
          continue;
        }
      }
      goto LABEL_44;
    }
  }
  id v14 = a1;
  if (a4 != a1 || &a1[v11] <= a4) {
    memmove(a4, a1, 8 * v11);
  }
  uint64_t v15 = &a4[v11];
  if ((char *)a2 - (char *)a1 >= 8 && (unint64_t)a2 < v59)
  {
    uint64_t v55 = v4;
    while (1)
    {
      unint64_t v16 = (unint64_t)v15;
      int v17 = a2;
      uint64_t v18 = *a4;
      id v19 = *a2;
      id v20 = v18;
      uint64_t result = AAUILocalizedModalityForAchievement(v19);
      if (!result)
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      BOOL v22 = result;
      uint64_t v23 = sub_2292CC308();
      uint64_t v25 = v24;

      uint64_t v62 = v23;
      uint64_t v63 = v25;
      uint64_t result = AAUILocalizedModalityForAchievement(v20);
      if (!result) {
        goto LABEL_49;
      }
      uint64_t v26 = result;
      uint64_t v27 = sub_2292CC308();
      uint64_t v29 = v28;

      uint64_t v60 = v27;
      uint64_t v61 = v29;
      uint64_t v30 = sub_2292CC138();
      uint64_t v31 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v64, 1, 1, v30);
      sub_2292AE7A8();
      uint64_t v32 = sub_2292CC4F8();
      sub_2292C2930(v31, &qword_26AF369F0);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (v32 != -1) {
        break;
      }
      uint64_t v33 = v17;
      a2 = v17 + 1;
      if (v14 != v17) {
        goto LABEL_14;
      }
LABEL_15:
      ++v14;
      uint64_t v15 = (void **)v16;
      if ((unint64_t)a4 >= v16 || (unint64_t)a2 >= v59)
      {
        a2 = v14;
        goto LABEL_44;
      }
    }
    uint64_t v33 = a4;
    BOOL v34 = v14 == a4++;
    a2 = v17;
    if (v34) {
      goto LABEL_15;
    }
LABEL_14:
    id *v14 = *v33;
    goto LABEL_15;
  }
  a2 = a1;
LABEL_44:
  if (a2 != a4
    || a2 >= (void **)((char *)a4
                     + (((char *)v15 - (char *)a4 + ((char *)v15 - (char *)a4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(a2, a4, 8 * (v15 - a4));
  }
  return (__CFString *)1;
}

uint64_t sub_2292C7CC0(void **__dst, id *__src, unint64_t a3, void **a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = (char *)__src - (char *)__dst;
  int64_t v8 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v8 = (char *)__src - (char *)__dst;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    id v14 = a4;
    if (a4 != __src || &__src[v12] <= a4) {
      memmove(a4, __src, 8 * v12);
    }
    uint64_t v13 = (char *)&a4[v12];
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_40;
    }
    uint64_t v25 = (id *)(a3 - 8);
    id v40 = v6;
    id v41 = a4;
    while (1)
    {
      uint64_t v45 = v13;
      uint64_t v43 = v25 + 1;
      uint64_t v26 = v13 - 8;
      uint64_t v27 = v5 - 1;
      uint64_t v28 = *(v5 - 1);
      id v29 = *((id *)v13 - 1);
      id v30 = v28;
      id v31 = objc_msgSend(v29, sel_template);
      id v32 = objc_msgSend(v31, sel_displayOrder);

      id v33 = objc_msgSend(v30, sel_template);
      id v34 = objc_msgSend(v33, sel_displayOrder);

      if (v32 >= v34) {
        break;
      }
      uint64_t v13 = v45;
      unint64_t v35 = (unint64_t)v40;
      if (v43 != v5)
      {
        --v5;
        goto LABEL_36;
      }
      BOOL v36 = v25 >= v5--;
      id v14 = v41;
      if (v36) {
        goto LABEL_37;
      }
LABEL_38:
      if ((unint64_t)v5 > v35)
      {
        --v25;
        if (v13 > (char *)v14) {
          continue;
        }
      }
      goto LABEL_40;
    }
    unint64_t v35 = (unint64_t)v40;
    if (v43 == (id *)v45)
    {
      uint64_t v27 = (id *)v26;
      uint64_t v13 = v26;
      id v14 = v41;
      if (v25 < (id *)v45) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v27 = (id *)v26;
      uint64_t v13 = v26;
LABEL_36:
      id v14 = v41;
    }
LABEL_37:
    *uint64_t v25 = *v27;
    goto LABEL_38;
  }
  if (a4 != __dst || &__dst[v9] <= a4) {
    memmove(a4, __dst, 8 * v9);
  }
  uint64_t v13 = (char *)&a4[v9];
  id v14 = a4;
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    uint64_t v44 = v13;
    while (1)
    {
      uint64_t v15 = *v14;
      id v16 = *v5;
      int v17 = v5;
      id v18 = v15;
      id v19 = objc_msgSend(v16, sel_template);
      id v20 = objc_msgSend(v19, sel_displayOrder);

      id v21 = objc_msgSend(v18, sel_template);
      id v22 = objc_msgSend(v21, sel_displayOrder);

      if (v20 >= v22) {
        break;
      }
      uint64_t v23 = v17;
      uint64_t v5 = v17 + 1;
      if (v6 != v17) {
        goto LABEL_16;
      }
LABEL_17:
      ++v6;
      uint64_t v13 = v44;
      if (v14 >= (void **)v44 || (unint64_t)v5 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v23 = v14;
    BOOL v24 = v6 == v14++;
    uint64_t v5 = v17;
    if (v24) {
      goto LABEL_17;
    }
LABEL_16:
    *uint64_t v6 = *v23;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v5 = v6;
LABEL_40:
  uint64_t v37 = v13 - (char *)v14;
  uint64_t v38 = v13 - (char *)v14 + 7;
  if (v37 < 0) {
    uint64_t v37 = v38;
  }
  if (v5 != v14 || v5 >= (void **)((char *)v14 + (v37 & 0xFFFFFFFFFFFFFFF8))) {
    memmove(v5, v14, 8 * (v37 >> 3));
  }
  return 1;
}

uint64_t sub_2292C8014(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  int64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 15;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 15;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4) {
      memmove(a4, __src, 16 * v13);
    }
    id v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16) {
      goto LABEL_48;
    }
    int v17 = (char *)(a3 - 16);
    while (1)
    {
      id v18 = v17 + 16;
      id v19 = v6 - 16;
      BOOL v20 = *((void *)v14 - 2) == *((void *)v6 - 2) && *((void *)v14 - 1) == *((void *)v6 - 1);
      if (v20 || (sub_2292CC6F8() & 1) == 0)
      {
        id v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)int v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        BOOL v21 = v17 >= v14;
        v14 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        BOOL v21 = v17 >= v6;
        v6 -= 16;
        if (v21) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4) {
    memmove(a4, __dst, 16 * v10);
  }
  id v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v15 || (sub_2292CC6F8() & 1) == 0) {
        break;
      }
      id v16 = v6;
      BOOL v15 = v7 == v6;
      v6 += 16;
      if (!v15) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    id v16 = v4;
    BOOL v15 = v7 == v4;
    v4 += 16;
    if (v15) {
      goto LABEL_21;
    }
LABEL_20:
    *(_OWORD *)int64_t v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0]) {
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  }
  return 1;
}

uint64_t sub_2292C8244(unsigned __int8 *__dst, unsigned __int8 *__src, unint64_t a3, unsigned __int8 *a4, char a5, void *a6)
{
  int64_t v8 = a4;
  uint64_t v10 = __src;
  uint64_t v11 = __dst;
  int64_t v12 = __src - __dst;
  uint64_t v13 = a3 - (void)__src;
  if (__src - __dst >= (uint64_t)(a3 - (void)__src))
  {
    if (a4 != __src || a3 <= (unint64_t)a4) {
      memmove(a4, __src, a3 - (void)__src);
    }
    id v14 = &v8[v13];
    if (v11 >= v10 || v13 < 1) {
      goto LABEL_38;
    }
    id v18 = (unsigned __int8 *)(a3 - 1);
    while (1)
    {
      unsigned __int8 v30 = *(v14 - 1);
      id v19 = v10 - 1;
      unsigned __int8 v29 = *(v10 - 1);
      char v20 = sub_2292C46EC(&v30, &v29, a5 & 1, a6);
      if (v26) {
        goto LABEL_38;
      }
      BOOL v21 = v18 + 1;
      if (v20)
      {
        if (v21 != v10)
        {
          --v10;
LABEL_35:
          *id v18 = *v19;
          goto LABEL_36;
        }
        BOOL v22 = v18 >= v10--;
        if (v22) {
          goto LABEL_35;
        }
      }
      else
      {
        id v19 = v14 - 1;
        if (v21 != v14)
        {
          --v14;
          goto LABEL_35;
        }
        BOOL v22 = v18 >= v14--;
        if (v22) {
          goto LABEL_35;
        }
      }
LABEL_36:
      if (v10 > v11)
      {
        --v18;
        if (v14 > v8) {
          continue;
        }
      }
      goto LABEL_38;
    }
  }
  if (a4 != __dst || __src <= a4) {
    memmove(a4, __dst, v12);
  }
  id v14 = &v8[v12];
  if ((unint64_t)v10 < a3 && v12 >= 1)
  {
    while (1)
    {
      unsigned __int8 v28 = *v10;
      unsigned __int8 v27 = *v8;
      char v15 = sub_2292C46EC(&v28, &v27, a5 & 1, a6);
      if (v26)
      {
        size_t v23 = v14 - v8;
        if (v11 < v8 || v11 >= v14 || v11 != v8)
        {
          BOOL v24 = v11;
LABEL_42:
          memmove(v24, v8, v23);
        }
        goto LABEL_43;
      }
      if ((v15 & 1) == 0) {
        break;
      }
      id v16 = v10;
      BOOL v17 = v11 == v10++;
      if (!v17) {
        goto LABEL_13;
      }
LABEL_14:
      ++v11;
      if (v8 >= v14 || (unint64_t)v10 >= a3) {
        goto LABEL_16;
      }
    }
    id v16 = v8;
    BOOL v17 = v11 == v8++;
    if (v17) {
      goto LABEL_14;
    }
LABEL_13:
    unsigned __int8 *v11 = *v16;
    goto LABEL_14;
  }
LABEL_16:
  uint64_t v10 = v11;
LABEL_38:
  size_t v23 = v14 - v8;
  if (v10 < v8 || v10 >= v14 || v10 != v8)
  {
    BOOL v24 = v10;
    goto LABEL_42;
  }
LABEL_43:

  return 1;
}

unint64_t sub_2292C8490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2292C852C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A90);
  char v34 = a2;
  uint64_t result = sub_2292CC668();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    id v33 = v3;
    int64_t v8 = 0;
    int64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v20 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v21 = v20 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1)) {
          goto LABEL_40;
        }
        if (v8 >= v13)
        {
LABEL_31:
          if ((v34 & 1) == 0)
          {
            uint64_t result = swift_release();
            uint64_t v3 = v33;
            goto LABEL_38;
          }
          uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
          if (v32 >= 64) {
            bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            void *v9 = -1 << v32;
          }
          uint64_t v3 = v33;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v23 = v9[v8];
        if (!v23)
        {
          int64_t v24 = v8 + 1;
          if (v8 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v23 = v9[v24];
          if (!v23)
          {
            while (1)
            {
              int64_t v8 = v24 + 1;
              if (__OFADD__(v24, 1)) {
                break;
              }
              if (v8 >= v13) {
                goto LABEL_31;
              }
              unint64_t v23 = v9[v8];
              ++v24;
              if (v23) {
                goto LABEL_20;
              }
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_20:
        unint64_t v12 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v8 << 6);
      }
      uint64_t v25 = 8 * v21;
      uint64_t v26 = *(void *)(*(void *)(v5 + 48) + v25);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + v25);
      if ((v34 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_2292CC738();
      uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v17 == v29;
          if (v17 == v29) {
            unint64_t v17 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v17);
        }
        while (v31 == -1);
        unint64_t v18 = __clz(__rbit64(~v31)) + (v17 << 6);
      }
      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v7 + 48) + v19) = v26;
      *(void *)(*(void *)(v7 + 56) + v19) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v3 = v7;
  return result;
}

void *sub_2292C87E0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2292CC658();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    if (!v19) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_2292C896C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_2292C8A88(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_2292C898C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AB8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void *sub_2292C8A88(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36AA8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A30);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2292C8BAC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A98);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

void *sub_2292C8C98(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2292C8E2C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  unint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    int64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_2292C902C(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

char *sub_2292C91C0(uint64_t a1)
{
  return sub_2292C898C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2292C91D4(uint64_t a1)
{
  return sub_2292B8410(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_2292C91E8(uint64_t a1)
{
  return sub_2292C8BAC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_2292C91FC(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AF36A90);
  uint64_t v3 = (void *)sub_2292CC678();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_2292C4F30(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  int64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2292C4F30(v5);
    int64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2292C92FC(unint64_t a1)
{
  uint64_t v54 = MEMORY[0x263F8EE78];
  unint64_t v2 = sub_2292C91FC(MEMORY[0x263F8EE78]);
  if (a1 >> 62) {
    goto LABEL_29;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_2292CC638())
  {
    if (v3 < 1) {
      goto LABEL_58;
    }
    uint64_t v4 = 0;
    unint64_t v48 = a1;
    unint64_t v50 = a1 & 0xC000000000000001;
    uint64_t v5 = &selRef_setNeedsDisplay;
    uint64_t v6 = (SEL *)&_swift_FORCE_LOAD___swiftUIKit___ActivityAchievementsUI;
    uint64_t v47 = v3;
    while (1)
    {
      if (v50) {
        id v7 = (id)MEMORY[0x22A6B4140](v4, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v4 + 32);
      }
      int64_t v8 = v7;
      id v9 = [v7 v5[79]];
      id v10 = [v9 v6[247]];

      if (*(void *)(v2 + 16) && (unint64_t v11 = sub_2292C4F30((uint64_t)v10), (v12 & 1) != 0))
      {
        uint64_t v53 = *(void *)(*(void *)(v2 + 56) + 8 * v11);
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v53 = MEMORY[0x263F8EE78];
      }
      a1 = v8;
      MEMORY[0x22A6B3F70]();
      if (*(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2292CC408();
      }
      sub_2292CC428();
      sub_2292CC3F8();
      int64_t v13 = v5;
      id v14 = [(id)a1 v5[79]];
      char v15 = v6;
      id v16 = [v14 v6[247]];

      uint64_t v17 = v53;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v52 = (void *)v2;
      unint64_t v19 = sub_2292C4F30((uint64_t)v16);
      unint64_t v21 = v2;
      unint64_t v2 = v19;
      uint64_t v22 = *(void *)(v21 + 16);
      BOOL v23 = (v20 & 1) == 0;
      uint64_t v24 = v22 + v23;
      if (__OFADD__(v22, v23)) {
        break;
      }
      char v25 = v20;
      if (*(void *)(v21 + 24) >= v24)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          char v28 = v52;
          if (v20) {
            goto LABEL_5;
          }
        }
        else
        {
          sub_2292C87E0();
          char v28 = v52;
          if (v25) {
            goto LABEL_5;
          }
        }
      }
      else
      {
        sub_2292C852C(v24, isUniquelyReferenced_nonNull_native);
        unint64_t v26 = sub_2292C4F30((uint64_t)v16);
        if ((v25 & 1) != (v27 & 1)) {
          goto LABEL_59;
        }
        unint64_t v2 = v26;
        char v28 = v52;
        if (v25)
        {
LABEL_5:
          *(void *)(v28[7] + 8 * v2) = v53;
          swift_bridgeObjectRelease();
          unint64_t v2 = (unint64_t)v28;
          goto LABEL_6;
        }
      }
      v28[(v2 >> 6) + 8] |= 1 << v2;
      uint64_t v29 = 8 * v2;
      *(void *)(v28[6] + v29) = v16;
      *(void *)(v28[7] + v29) = v17;
      uint64_t v30 = v28[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_28;
      }
      unint64_t v2 = (unint64_t)v28;
      v28[2] = v32;
LABEL_6:

      swift_bridgeObjectRelease();
      ++v4;
      a1 = v48;
      uint64_t v5 = v13;
      uint64_t v6 = v15;
      if (v47 == v4) {
        goto LABEL_30;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_bridgeObjectRetain();
  }
LABEL_30:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  id v33 = sub_2292C50F0(v2);
  swift_bridgeObjectRelease();
  uint64_t v53 = (uint64_t)v33;
  sub_2292C506C(&v53, (uint64_t (*)(uint64_t))sub_2292C91C0, sub_2292C5398);
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void *)(v53 + 16);
  if (!v34)
  {
    swift_release();
    uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_56:
    swift_bridgeObjectRelease();
    return v45;
  }
  uint64_t v35 = v53 + 32;
  swift_retain();
  uint64_t v36 = 0;
  uint64_t v49 = v35;
  uint64_t v51 = v34;
  while (1)
  {
    if (!*(void *)(v2 + 16)) {
      goto LABEL_33;
    }
    unint64_t v37 = sub_2292C4F30(*(void *)(v35 + 8 * v36));
    if ((v38 & 1) == 0) {
      goto LABEL_33;
    }
    unint64_t v39 = *(void *)(*(void *)(v2 + 56) + 8 * v37);
    if ((v39 & 0x8000000000000000) != 0 || (v39 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v40 = (uint64_t)sub_2292B8654(v39);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v40 = v39 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n();
    }
    uint64_t v53 = v40;
    sub_2292C4F74(&v53);
    swift_bridgeObjectRelease();
    uint64_t v41 = v53;
    if (v53 < 0 || (v53 & 0x4000000000000000) != 0) {
      break;
    }
    uint64_t v42 = *(void *)(v53 + 16);
    swift_retain();
    if (v42) {
      goto LABEL_42;
    }
LABEL_32:
    swift_release_n();
    uint64_t v35 = v49;
    uint64_t v34 = v51;
LABEL_33:
    if (++v36 == v34)
    {
      swift_release_n();
      uint64_t v45 = v54;
      goto LABEL_56;
    }
  }
  swift_retain();
  uint64_t v42 = sub_2292CC638();
  if (!v42) {
    goto LABEL_32;
  }
LABEL_42:
  if (v42 >= 1)
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if ((v41 & 0xC000000000000001) != 0) {
        MEMORY[0x22A6B4140](i, v41);
      }
      else {
        id v44 = *(id *)(v41 + 8 * i + 32);
      }
      MEMORY[0x22A6B3F70]();
      if (*(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2292CC408();
      }
      sub_2292CC428();
      sub_2292CC3F8();
    }
    goto LABEL_32;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  sub_2292CC728();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_2292C9838(unint64_t a1)
{
  uint64_t v30 = MEMORY[0x263F8EE78];
  unint64_t v29 = sub_2292AF584(MEMORY[0x263F8EE78]);
  if (a1 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2292CC638();
    if (!v2) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_10;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = 0;
    do
    {
      unint64_t v4 = MEMORY[0x22A6B4140](v3++, a1);
      unint64_t v28 = v4;
      sub_2292C38B4((void **)&v28, (uint64_t *)&v29);
      swift_unknownObjectRelease();
    }
    while (v2 != v3);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      unint64_t v6 = *(void *)(a1 + 8 * i + 32);
      unint64_t v28 = v6;
      sub_2292C38B4((void **)&v28, (uint64_t *)&v29);
    }
  }
LABEL_10:
  swift_bridgeObjectRelease();
  uint64_t v7 = v29;
  swift_bridgeObjectRetain_n();
  int64_t v8 = sub_2292C51D8(v7);
  swift_bridgeObjectRelease();
  unint64_t v28 = (unint64_t)v8;
  sub_2292C506C((uint64_t *)&v28, sub_2292C91D4, sub_2292C6D04);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v28 + 16);
  if (v9)
  {
    id v10 = (char *)(v28 + 32);
    swift_retain();
    uint64_t v11 = 0;
    uint64_t v26 = v9;
    uint64_t v27 = v7;
    char v25 = v10;
    while (1)
    {
      if (!*(void *)(v7 + 16)) {
        goto LABEL_14;
      }
      char v12 = (uint64_t *)&v10[16 * v11];
      uint64_t v13 = *v12;
      uint64_t v14 = v12[1];
      swift_bridgeObjectRetain_n();
      unint64_t v15 = sub_2292AC940(v13, v14);
      if (v16) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_13:
      swift_bridgeObjectRelease();
LABEL_14:
      if (++v11 == v9)
      {
        swift_release_n();
        uint64_t v23 = v30;
        goto LABEL_37;
      }
    }
    a1 = *(void *)(*(void *)(v7 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0)
    {
      unint64_t v22 = swift_bridgeObjectRetain();
      unint64_t v17 = (unint64_t)sub_2292B8654(v22);
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v17 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    unint64_t v28 = v17;
    sub_2292C4FF0((uint64_t *)&v28);
    swift_bridgeObjectRelease();
    unint64_t v18 = v28;
    if ((v28 & 0x8000000000000000) != 0 || (v28 & 0x4000000000000000) != 0)
    {
      swift_retain();
      uint64_t v19 = sub_2292CC638();
      if (v19) {
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v19 = *(void *)(v28 + 16);
      swift_retain();
      if (v19)
      {
LABEL_23:
        if (v19 < 1)
        {
          __break(1u);
          goto LABEL_39;
        }
        for (uint64_t j = 0; j != v19; ++j)
        {
          if ((v18 & 0xC000000000000001) != 0) {
            MEMORY[0x22A6B4140](j, v18);
          }
          else {
            id v21 = *(id *)(v18 + 8 * j + 32);
          }
          MEMORY[0x22A6B3F70]();
          if (*(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2292CC408();
          }
          sub_2292CC428();
          sub_2292CC3F8();
        }
      }
    }
    swift_release_n();
    uint64_t v9 = v26;
    uint64_t v7 = v27;
    id v10 = v25;
    goto LABEL_13;
  }
  swift_release();
  uint64_t v23 = MEMORY[0x263F8EE78];
LABEL_37:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_2292C9BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF369D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2292C9C20(unint64_t a1)
{
  unint64_t v2 = MEMORY[0x263F8EE78];
  unint64_t v15 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2292CC638();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_16;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_32;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      unint64_t v6 = (void *)MEMORY[0x22A6B4140](i, a1);
      if (AAUIIsGoldAchievement(v6))
      {
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        sub_2292CC5C8();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v3; ++j)
    {
      id v8 = *(id *)(a1 + 8 * j + 32);
      if (AAUIIsGoldAchievement(v8))
      {
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        sub_2292CC5C8();
      }
      else
      {
      }
    }
  }
LABEL_16:
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_2292C9838(v15);
  uint64_t result = swift_release();
  unint64_t v16 = v2;
  if (!v3)
  {
LABEL_30:
    unint64_t v14 = sub_2292C9838(v16);
    swift_release();
    sub_2292B80D8(v14);
    return v9;
  }
  if (v3 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      for (uint64_t k = 0; k != v3; ++k)
      {
        uint64_t v11 = (void *)MEMORY[0x22A6B4140](k, a1);
        if (AAUIIsGoldAchievement(v11))
        {
          swift_unknownObjectRelease();
        }
        else
        {
          sub_2292CC5B8();
          sub_2292CC5E8();
          sub_2292CC5F8();
          sub_2292CC5C8();
        }
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      for (uint64_t m = 0; m != v3; ++m)
      {
        id v13 = *(id *)(a1 + 8 * m + 32);
        if (AAUIIsGoldAchievement(v13))
        {
        }
        else
        {
          sub_2292CC5B8();
          sub_2292CC5E8();
          sub_2292CC5F8();
          sub_2292CC5C8();
        }
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2292C9EE4(unint64_t a1, uint64_t a2)
{
  unint64_t v2 = a1;
  uint64_t v21 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_30;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_2292CC638())
  {
    unint64_t v18 = v2;
    unint64_t v4 = 0;
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v6 = (void *)(v2 + 32);
    unint64_t v19 = v2 & 0xC000000000000001;
    while (1)
    {
      if (v19)
      {
        id v7 = (id)MEMORY[0x22A6B4140](v4, v18);
        goto LABEL_9;
      }
      if (v4 >= *(void *)(v5 + 16)) {
        break;
      }
      id v7 = (id)v6[v4];
LABEL_9:
      id v8 = v7;
      if (__OFADD__(v4++, 1)) {
        goto LABEL_29;
      }
      id v10 = objc_msgSend(v7, sel_template);
      id v11 = objc_msgSend(v10, sel_uniqueName);

      if (v11)
      {
        uint64_t v12 = sub_2292CC308();
        unint64_t v2 = (unint64_t)v13;
      }
      else
      {
        uint64_t v12 = 0;
        unint64_t v2 = 0;
      }
      uint64_t v14 = *(void *)(a2 + 16);
      if (!v14)
      {
LABEL_4:
        swift_bridgeObjectRelease();
        sub_2292CC5B8();
        sub_2292CC5E8();
        sub_2292CC5F8();
        unint64_t v2 = (unint64_t)&v21;
        sub_2292CC5C8();
        goto LABEL_5;
      }
      unint64_t v15 = (void *)(a2 + 40);
      while (*v15)
      {
        if (v2)
        {
          BOOL v16 = *(v15 - 1) == v12 && *v15 == v2;
          if (v16 || (sub_2292CC6F8() & 1) != 0)
          {

            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
        }
LABEL_16:
        v15 += 2;
        if (!--v14) {
          goto LABEL_4;
        }
      }
      if (v2) {
        goto LABEL_16;
      }

LABEL_5:
      if (v4 == i) {
        return v21;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    ;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2292CA0F0(void **__src, void **__dst, unint64_t a3, void **a4)
{
  uint64_t v5 = __src;
  int64_t v6 = (char *)__dst - (char *)__src;
  int64_t v7 = (char *)__dst - (char *)__src + 7;
  if ((char *)__dst - (char *)__src >= 0) {
    int64_t v7 = (char *)__dst - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__dst;
  uint64_t v10 = a3 - (void)__dst + 7;
  if ((uint64_t)(a3 - (void)__dst) >= 0) {
    uint64_t v10 = a3 - (void)__dst;
  }
  uint64_t v11 = v10 >> 3;
  if (v8 >= v10 >> 3)
  {
    uint64_t v14 = a4;
    if (a4 != __dst || &__dst[v11] <= a4)
    {
      unint64_t v22 = __dst;
      memmove(a4, __dst, 8 * v11);
      __dst = v22;
    }
    id v13 = (char *)&a4[v11];
    if (v5 >= __dst || v9 < 8) {
      goto LABEL_40;
    }
    uint64_t v23 = (void **)(a3 - 8);
    uint64_t v35 = v5;
    uint64_t v36 = a4;
    while (1)
    {
      char v38 = v23 + 1;
      uint64_t v24 = v13 - 8;
      char v25 = __dst - 1;
      uint64_t v26 = *(__dst - 1);
      uint64_t v27 = __dst;
      unint64_t v28 = v13;
      id v29 = *((id *)v13 - 1);
      id v30 = v26;
      uint64_t v31 = sub_2292C2C04(v29, v30);

      if (v31 == -1) {
        break;
      }
      char v25 = (void **)v24;
      if (v38 != (void **)v28)
      {
        id v13 = v24;
        unint64_t v33 = (unint64_t)v35;
        uint64_t v14 = v36;
        __dst = v27;
LABEL_35:
        *uint64_t v23 = *v25;
        goto LABEL_36;
      }
      BOOL v32 = v23 >= (void **)v28;
      id v13 = v24;
      uint64_t v14 = v36;
      __dst = v27;
      unint64_t v33 = (unint64_t)v35;
      if (v32) {
        goto LABEL_35;
      }
LABEL_36:
      if ((unint64_t)__dst > v33)
      {
        --v23;
        if (v13 > (char *)v14) {
          continue;
        }
      }
      goto LABEL_40;
    }
    if (v38 == v27)
    {
      __dst = v25;
      uint64_t v14 = v36;
      id v13 = v28;
      unint64_t v33 = (unint64_t)v35;
      if (v23 < v27) {
        goto LABEL_36;
      }
    }
    else
    {
      __dst = v25;
      id v13 = v28;
      unint64_t v33 = (unint64_t)v35;
      uint64_t v14 = v36;
    }
    goto LABEL_35;
  }
  if (a4 != __src || &__src[v8] <= a4)
  {
    uint64_t v12 = __dst;
    memmove(a4, __src, 8 * v8);
    __dst = v12;
  }
  id v13 = (char *)&a4[v8];
  uint64_t v14 = a4;
  if ((unint64_t)__dst < a3 && v6 >= 8)
  {
    while (1)
    {
      unint64_t v15 = *v14;
      BOOL v16 = __dst;
      id v17 = *__dst;
      id v18 = v15;
      uint64_t v19 = sub_2292C2C04(v17, v18);

      if (v19 != -1) {
        break;
      }
      char v20 = v16;
      __dst = v16 + 1;
      if (v5 != v16) {
        goto LABEL_13;
      }
LABEL_14:
      ++v5;
      if (v14 >= (void **)v13 || (unint64_t)__dst >= a3) {
        goto LABEL_39;
      }
    }
    char v20 = v14;
    BOOL v21 = v5 == v14++;
    __dst = v16;
    if (v21) {
      goto LABEL_14;
    }
LABEL_13:
    *uint64_t v5 = *v20;
    goto LABEL_14;
  }
LABEL_39:
  __dst = v5;
LABEL_40:
  if (__dst != v14
    || __dst >= (void **)((char *)v14 + ((v13 - (char *)v14 + (v13 - (char *)v14 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8)))
  {
    memmove(__dst, v14, 8 * ((v13 - (char *)v14) / 8));
  }
  return 1;
}

void sub_2292CA3C0(uint64_t *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = a1[1];
  id v131 = a2;
  uint64_t v6 = sub_2292CC6B8();
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_138;
    }
    if (v5)
    {
      id v10 = v131;
      uint64_t v11 = v5;
      id v12 = v10;
      sub_2292BBC00(0, v11, 1, a1);
    }
    else
    {
    }
    return;
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_137;
  }
  uint64_t v115 = a1;
  uint64_t v116 = v6;
  uint64_t v118 = v5;
  if (v5 > 1)
  {
    uint64_t v8 = v7 >> 1;
    sub_2292AD928();
    uint64_t v9 = sub_2292CC418();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v122 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v132 = v9;
    goto LABEL_12;
  }
  id v13 = (char *)MEMORY[0x263F8EE78];
  uint64_t v132 = MEMORY[0x263F8EE78];
  uint64_t v122 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
  if (v5 == 1)
  {
LABEL_12:
    uint64_t v14 = 0;
    uint64_t v15 = *a1;
    uint64_t v113 = *a1 - 8;
    uint64_t v114 = *a1 + 16;
    id v13 = (char *)MEMORY[0x263F8EE78];
    uint64_t v16 = v118;
    uint64_t v129 = *v115;
    while (1)
    {
      uint64_t v18 = v14;
      uint64_t v19 = v14 + 1;
      uint64_t v126 = v14;
      if (v14 + 1 < v16)
      {
        uint64_t v20 = v15;
        BOOL v21 = v13;
        uint64_t v22 = v3;
        uint64_t v23 = *(void **)(v20 + 8 * v18);
        id v24 = *(id *)(v20 + 8 * v19);
        id v25 = v23;
        uint64_t v16 = v118;
        uint64_t v26 = sub_2292C2C04(v24, v25);

        uint64_t v19 = v18 + 2;
        if (v18 + 2 < v118)
        {
          uint64_t v27 = (id *)(v114 + 8 * v18);
          while (1)
          {
            uint64_t v28 = v19;
            id v29 = *(v27 - 1);
            id v30 = *v27;
            id v31 = v29;
            uint64_t v32 = sub_2292C2C04(v30, v31);

            if ((v26 == -1) == (v32 != -1)) {
              break;
            }
            uint64_t v19 = v28 + 1;
            ++v27;
            uint64_t v16 = v118;
            if (v118 == v28 + 1)
            {
              uint64_t v19 = v118;
              goto LABEL_22;
            }
          }
          uint64_t v16 = v118;
          uint64_t v19 = v28;
LABEL_22:
          uint64_t v18 = v126;
        }
        uint64_t v3 = v22;
        id v13 = v21;
        if (v26 == -1)
        {
          uint64_t v15 = v129;
          if (v19 < v18) {
            goto LABEL_141;
          }
          if (v18 < v19)
          {
            unint64_t v33 = (uint64_t *)(v113 + 8 * v19);
            uint64_t v34 = v19;
            uint64_t v35 = v18;
            uint64_t v36 = (uint64_t *)(v129 + 8 * v18);
            do
            {
              if (v35 != --v34)
              {
                if (!v129) {
                  goto LABEL_144;
                }
                uint64_t v37 = *v36;
                uint64_t *v36 = *v33;
                *unint64_t v33 = v37;
              }
              ++v35;
              --v33;
              ++v36;
            }
            while (v35 < v34);
          }
        }
        else
        {
          uint64_t v15 = v129;
        }
      }
      if (v19 < v16)
      {
        if (__OFSUB__(v19, v18)) {
          goto LABEL_136;
        }
        if (v19 - v18 < v116)
        {
          if (__OFADD__(v18, v116)) {
            goto LABEL_139;
          }
          if (v18 + v116 >= v16) {
            uint64_t v38 = v16;
          }
          else {
            uint64_t v38 = v18 + v116;
          }
          if (v38 < v18)
          {
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:

            __break(1u);
LABEL_143:

            __break(1u);
LABEL_144:

            __break(1u);
LABEL_145:

            __break(1u);
            return;
          }
          if (v19 != v38)
          {
            uint64_t v120 = v13;
            uint64_t v123 = v3;
            uint64_t v39 = v113 + 8 * v19;
            do
            {
              uint64_t v40 = *(void **)(v15 + 8 * v19);
              uint64_t v41 = v18;
              uint64_t v42 = v39;
              while (1)
              {
                uint64_t v43 = v19;
                id v44 = *(void **)v42;
                id v45 = v40;
                id v46 = v44;
                uint64_t v47 = sub_2292C2C04(v45, v46);

                if (v47 != -1) {
                  break;
                }
                uint64_t v15 = v129;
                if (!v129) {
                  goto LABEL_142;
                }
                uint64_t v19 = v43;
                unint64_t v48 = *(void **)v42;
                uint64_t v40 = *(void **)(v42 + 8);
                *(void *)uint64_t v42 = v40;
                *(void *)(v42 + 8) = v48;
                v42 -= 8;
                if (v43 == ++v41) {
                  goto LABEL_44;
                }
              }
              uint64_t v15 = v129;
              uint64_t v19 = v43;
LABEL_44:
              ++v19;
              v39 += 8;
              uint64_t v18 = v126;
            }
            while (v19 != v38);
            uint64_t v19 = v38;
            uint64_t v3 = v123;
            id v13 = v120;
          }
        }
      }
      if (v19 < v18) {
        goto LABEL_131;
      }
      uint64_t v117 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v13 = sub_2292B874C(0, *((void *)v13 + 2) + 1, 1, v13);
      }
      unint64_t v50 = *((void *)v13 + 2);
      unint64_t v49 = *((void *)v13 + 3);
      unint64_t v17 = v50 + 1;
      if (v50 >= v49 >> 1) {
        id v13 = sub_2292B874C((char *)(v49 > 1), v50 + 1, 1, v13);
      }
      *((void *)v13 + 2) = v17;
      uint64_t v51 = v13 + 32;
      uint64_t v52 = &v13[16 * v50 + 32];
      *(void *)uint64_t v52 = v18;
      *((void *)v52 + 1) = v117;
      if (v50) {
        break;
      }
      unint64_t v17 = 1;
LABEL_14:
      uint64_t v14 = v117;
      uint64_t v16 = v118;
      if (v117 >= v118) {
        goto LABEL_102;
      }
    }
    uint64_t v119 = v13 + 32;
    uint64_t v121 = v13;
    while (1)
    {
      unint64_t v53 = v17 - 1;
      if (v17 >= 4)
      {
        uint64_t v58 = &v51[16 * v17];
        uint64_t v59 = *((void *)v58 - 8);
        uint64_t v60 = *((void *)v58 - 7);
        BOOL v64 = __OFSUB__(v60, v59);
        uint64_t v61 = v60 - v59;
        if (v64) {
          goto LABEL_120;
        }
        uint64_t v63 = *((void *)v58 - 6);
        uint64_t v62 = *((void *)v58 - 5);
        BOOL v64 = __OFSUB__(v62, v63);
        uint64_t v56 = v62 - v63;
        char v57 = v64;
        if (v64) {
          goto LABEL_121;
        }
        unint64_t v65 = v17 - 2;
        uint64_t v66 = &v51[16 * v17 - 32];
        uint64_t v68 = *(void *)v66;
        uint64_t v67 = *((void *)v66 + 1);
        BOOL v64 = __OFSUB__(v67, v68);
        uint64_t v69 = v67 - v68;
        if (v64) {
          goto LABEL_122;
        }
        BOOL v64 = __OFADD__(v56, v69);
        uint64_t v70 = v56 + v69;
        if (v64) {
          goto LABEL_124;
        }
        if (v70 >= v61)
        {
          uint64_t v88 = &v51[16 * v53];
          uint64_t v90 = *(void *)v88;
          uint64_t v89 = *((void *)v88 + 1);
          BOOL v64 = __OFSUB__(v89, v90);
          uint64_t v91 = v89 - v90;
          if (v64) {
            goto LABEL_130;
          }
          BOOL v81 = v56 < v91;
          goto LABEL_89;
        }
      }
      else
      {
        if (v17 != 3)
        {
          uint64_t v82 = *((void *)v13 + 4);
          uint64_t v83 = *((void *)v13 + 5);
          BOOL v64 = __OFSUB__(v83, v82);
          uint64_t v75 = v83 - v82;
          char v76 = v64;
          goto LABEL_83;
        }
        uint64_t v55 = *((void *)v13 + 4);
        uint64_t v54 = *((void *)v13 + 5);
        BOOL v64 = __OFSUB__(v54, v55);
        uint64_t v56 = v54 - v55;
        char v57 = v64;
      }
      if (v57) {
        goto LABEL_123;
      }
      unint64_t v65 = v17 - 2;
      uint64_t v71 = &v51[16 * v17 - 32];
      uint64_t v73 = *(void *)v71;
      uint64_t v72 = *((void *)v71 + 1);
      BOOL v74 = __OFSUB__(v72, v73);
      uint64_t v75 = v72 - v73;
      char v76 = v74;
      if (v74) {
        goto LABEL_125;
      }
      uint64_t v77 = &v51[16 * v53];
      uint64_t v79 = *(void *)v77;
      uint64_t v78 = *((void *)v77 + 1);
      BOOL v64 = __OFSUB__(v78, v79);
      uint64_t v80 = v78 - v79;
      if (v64) {
        goto LABEL_127;
      }
      if (__OFADD__(v75, v80)) {
        goto LABEL_129;
      }
      if (v75 + v80 >= v56)
      {
        BOOL v81 = v56 < v80;
LABEL_89:
        if (v81) {
          unint64_t v53 = v65;
        }
        goto LABEL_91;
      }
LABEL_83:
      if (v76) {
        goto LABEL_126;
      }
      uint64_t v84 = &v51[16 * v53];
      uint64_t v86 = *(void *)v84;
      uint64_t v85 = *((void *)v84 + 1);
      BOOL v64 = __OFSUB__(v85, v86);
      uint64_t v87 = v85 - v86;
      if (v64) {
        goto LABEL_128;
      }
      if (v87 < v75) {
        goto LABEL_14;
      }
LABEL_91:
      unint64_t v92 = v53 - 1;
      if (v53 - 1 >= v17)
      {
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
        goto LABEL_140;
      }
      if (!v15) {
        goto LABEL_143;
      }
      uint64_t v93 = v51;
      uint64_t v94 = &v51[16 * v92];
      uint64_t v95 = *(void *)v94;
      unint64_t v96 = v53;
      unint64_t v97 = &v93[16 * v53];
      uint64_t v98 = *((void *)v97 + 1);
      uint64_t v124 = (void **)(v15 + 8 * *(void *)v97);
      uint64_t v127 = (void **)(v15 + 8 * *(void *)v94);
      id v99 = v131;
      sub_2292CA0F0(v127, v124, v15 + 8 * v98, v122);
      if (v3)
      {
LABEL_99:
        swift_bridgeObjectRelease();
        uint64_t v102 = v131;

        *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
        sub_2292CC3F8();
        goto LABEL_114;
      }

      if (v98 < v95) {
        goto LABEL_117;
      }
      if (v96 > *((void *)v121 + 2)) {
        goto LABEL_118;
      }
      *(void *)uint64_t v94 = v95;
      uint64_t v51 = v119;
      *(void *)&v119[16 * v92 + 8] = v98;
      unint64_t v100 = *((void *)v121 + 2);
      if (v96 >= v100) {
        goto LABEL_119;
      }
      unint64_t v17 = v100 - 1;
      size_t v101 = 16 * (v100 - 1 - v96);
      id v13 = v121;
      memmove(v97, v97 + 16, v101);
      *((void *)v121 + 2) = v100 - 1;
      uint64_t v15 = v129;
      if (v100 <= 2) {
        goto LABEL_14;
      }
    }
  }
  unint64_t v17 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_102:
  if (v17 >= 2)
  {
    uint64_t v103 = *v115;
    uint64_t v125 = *v115;
    do
    {
      unint64_t v104 = v17 - 2;
      if (v17 < 2) {
        goto LABEL_132;
      }
      if (!v103) {
        goto LABEL_145;
      }
      uint64_t v105 = v3;
      uint64_t v106 = (uint64_t)v13;
      uint64_t v107 = *(void *)&v13[16 * v104 + 32];
      uint64_t v108 = *(void *)&v13[16 * v17 + 24];
      uint64_t v128 = (void **)(v103 + 8 * *(void *)&v13[16 * v17 + 16]);
      uint64_t v130 = (void **)(v103 + 8 * v107);
      unint64_t v109 = v103 + 8 * v108;
      id v110 = v131;
      sub_2292CA0F0(v130, v128, v109, v122);
      uint64_t v3 = v105;
      if (v105) {
        goto LABEL_99;
      }

      if (v108 < v107) {
        goto LABEL_133;
      }
      id v13 = (char *)v106;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v13 = sub_2292B8904(v106);
      }
      if (v104 >= *((void *)v13 + 2)) {
        goto LABEL_134;
      }
      uint64_t v111 = &v13[16 * v104 + 32];
      *(void *)uint64_t v111 = v107;
      *((void *)v111 + 1) = v108;
      unint64_t v112 = *((void *)v13 + 2);
      if (v17 > v112) {
        goto LABEL_135;
      }
      memmove(&v13[16 * v17 + 16], &v13[16 * v17 + 32], 16 * (v112 - v17));
      *((void *)v13 + 2) = v112 - 1;
      unint64_t v17 = v112 - 1;
      uint64_t v103 = v125;
    }
    while (v112 > 2);
  }
  swift_bridgeObjectRelease();
  *(void *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_2292CC3F8();
  uint64_t v102 = v131;
LABEL_114:

  swift_bridgeObjectRelease();
}

void sub_2292CABF4(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  id v4 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_2292BB818();
  }
  uint64_t v6 = *(void *)(v3 + 16);
  v8[0] = v3 + 32;
  v8[1] = v6;
  id v7 = v4;
  sub_2292CA3C0(v8, v7);

  sub_2292CC5C8();
}

uint64_t sub_2292CAC94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, char a5, void *a6)
{
  if (a3 != a2)
  {
    uint64_t v8 = a3;
    uint64_t v10 = *a4;
    uint64_t v11 = (unsigned __int8 *)(*a4 + a3);
    char v12 = a5 & 1;
    uint64_t v16 = result;
LABEL_4:
    unsigned __int8 v13 = *(unsigned char *)(v10 + v8);
    uint64_t v14 = result;
    uint64_t v15 = v11;
    while (1)
    {
      unsigned __int8 v18 = v13;
      unsigned __int8 v17 = *(v15 - 1);
      uint64_t result = sub_2292C46EC(&v18, &v17, v12, a6);
      if (v6) {
        break;
      }
      if (result)
      {
        if (!v10)
        {
          __break(1u);
          return result;
        }
        unsigned __int8 v13 = *v15;
        unsigned __int8 *v15 = *(v15 - 1);
        *(v15 - 1) = v13;
        ++v14;
        --v15;
        if (v8 != v14) {
          continue;
        }
      }
      ++v8;
      ++v11;
      uint64_t result = v16;
      if (v8 != a2) {
        goto LABEL_4;
      }
      return result;
    }
  }
  return result;
}

void sub_2292CAD7C(uint64_t *a1, char a2, void *a3)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = a3;
  uint64_t v7 = sub_2292CC6B8();
  if (v7 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_138;
    }
    if (v5)
    {
      uint64_t v11 = v6;
      sub_2292CAC94(0, v5, 1, a1, a2 & 1, v11);
    }
    else
    {
    }
LABEL_115:

    return;
  }
  if (v5 >= 0) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_137;
  }
  uint64_t v93 = v5;
  uint64_t v91 = v7;
  uint64_t v89 = a1;
  if (v5 > 1)
  {
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = sub_2292CC418();
    *(void *)(v10 + 16) = v9;
    uint64_t v90 = v10;
    unint64_t v97 = (unsigned __int8 *)(v10 + 32);
    goto LABEL_12;
  }
  char v12 = (char *)MEMORY[0x263F8EE78];
  unint64_t v97 = (unsigned __int8 *)(MEMORY[0x263F8EE78] + 32);
  uint64_t v90 = MEMORY[0x263F8EE78];
  if (v5 != 1)
  {
    unint64_t v26 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_102:
    if (v26 >= 2)
    {
      uint64_t v83 = *v89;
      unint64_t v100 = v6;
      uint64_t v98 = *v89;
      do
      {
        unint64_t v84 = v26 - 2;
        if (v26 < 2) {
          goto LABEL_132;
        }
        if (!v83) {
          goto LABEL_146;
        }
        uint64_t v6 = v12;
        uint64_t v85 = *(void *)&v12[16 * v84 + 32];
        uint64_t v86 = *(void *)&v12[16 * v26 + 24];
        sub_2292C8244((unsigned __int8 *)(v83 + v85), (unsigned __int8 *)(v83 + *(void *)&v12[16 * v26 + 16]), v83 + v86, v97, a2 & 1, v100);
        if (v3) {
          goto LABEL_99;
        }
        if (v86 < v85) {
          goto LABEL_133;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v12 = sub_2292B8904((uint64_t)v12);
        }
        uint64_t v6 = v100;
        if (v84 >= *((void *)v12 + 2)) {
          goto LABEL_134;
        }
        uint64_t v87 = &v12[16 * v84 + 32];
        *(void *)uint64_t v87 = v85;
        *((void *)v87 + 1) = v86;
        unint64_t v88 = *((void *)v12 + 2);
        if (v26 > v88) {
          goto LABEL_135;
        }
        memmove(&v12[16 * v26 + 16], &v12[16 * v26 + 32], 16 * (v88 - v26));
        *((void *)v12 + 2) = v88 - 1;
        unint64_t v26 = v88 - 1;
        uint64_t v83 = v98;
      }
      while (v88 > 2);
    }
LABEL_113:
    swift_bridgeObjectRelease();
LABEL_114:
    *(void *)(v90 + 16) = 0;

    swift_bridgeObjectRelease();
    goto LABEL_115;
  }
LABEL_12:
  uint64_t v13 = 0;
  uint64_t v14 = *a1;
  uint64_t v94 = v5 - 2;
  char v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v15 = v5;
  unint64_t v100 = v6;
  uint64_t v95 = *a1;
  while (1)
  {
    uint64_t v16 = v13 + 1;
    if (v13 + 1 >= v15) {
      goto LABEL_31;
    }
    unsigned __int8 v105 = *(unsigned char *)(v14 + v16);
    unsigned __int8 v104 = *(unsigned char *)(v14 + v13);
    int v17 = sub_2292C46EC(&v105, &v104, a2 & 1, v6);
    if (v3) {
      goto LABEL_113;
    }
    int v18 = v17;
    uint64_t v19 = v13;
    uint64_t v16 = v13 + 2;
    if (v13 + 2 >= v93) {
      goto LABEL_19;
    }
    do
    {
      unsigned __int8 v103 = *(unsigned char *)(v14 + v19 + 2);
      unsigned __int8 v102 = *(unsigned char *)(v14 + v19 + 1);
      if ((v18 ^ sub_2292C46EC(&v103, &v102, a2 & 1, v6)))
      {
        uint64_t v16 = v19 + 2;
        if (v18) {
          goto LABEL_20;
        }
LABEL_30:
        uint64_t v15 = v93;
        goto LABEL_31;
      }
      ++v19;
    }
    while (v94 != v19);
    uint64_t v16 = v93;
LABEL_19:
    if ((v18 & 1) == 0) {
      goto LABEL_30;
    }
LABEL_20:
    if (v16 < v13) {
      goto LABEL_142;
    }
    uint64_t v15 = v93;
    if (v13 < v16)
    {
      uint64_t v20 = v16 - 1;
      uint64_t v21 = v13;
      do
      {
        if (v21 != v20)
        {
          if (!v14) {
            goto LABEL_145;
          }
          char v22 = *(unsigned char *)(v14 + v21);
          *(unsigned char *)(v14 + v21) = *(unsigned char *)(v14 + v20);
          *(unsigned char *)(v14 + v20) = v22;
        }
        BOOL v57 = ++v21 < v20--;
      }
      while (v57);
    }
LABEL_31:
    if (v16 >= v15) {
      goto LABEL_39;
    }
    if (__OFSUB__(v16, v13)) {
      goto LABEL_139;
    }
    if (v16 - v13 >= v91)
    {
LABEL_39:
      if (v16 < v13) {
        goto LABEL_136;
      }
      goto LABEL_40;
    }
    uint64_t v23 = v13 + v91;
    if (__OFADD__(v13, v91)) {
      goto LABEL_140;
    }
    if (v23 >= v15) {
      uint64_t v23 = v15;
    }
    if (v23 < v13) {
      break;
    }
    if (v16 == v23) {
      goto LABEL_39;
    }
    uint64_t v77 = (unsigned __int8 *)(v14 + v16);
    *(void *)id v99 = v23;
    do
    {
      uint64_t v78 = v16;
      unsigned __int8 v79 = *(unsigned char *)(v14 + v16);
      uint64_t v80 = v13;
      BOOL v81 = v77;
      do
      {
        unsigned __int8 v107 = v79;
        unsigned __int8 v106 = *(v81 - 1);
        char v82 = sub_2292C46EC(&v107, &v106, a2 & 1, v6);
        if (v3) {
          goto LABEL_113;
        }
        if ((v82 & 1) == 0) {
          break;
        }
        if (!v14) {
          goto LABEL_144;
        }
        unsigned __int8 v79 = *v81;
        *BOOL v81 = *(v81 - 1);
        *(v81 - 1) = v79;
        ++v80;
        --v81;
      }
      while (v78 != v80);
      uint64_t v16 = v78 + 1;
      ++v77;
    }
    while (v78 + 1 != *(void *)v99);
    uint64_t v16 = *(void *)v99;
    if (*(uint64_t *)v99 < v13) {
      goto LABEL_136;
    }
LABEL_40:
    uint64_t v92 = v16;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v12 = sub_2292B874C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v25 = *((void *)v12 + 2);
    unint64_t v24 = *((void *)v12 + 3);
    unint64_t v26 = v25 + 1;
    if (v25 >= v24 >> 1) {
      char v12 = sub_2292B874C((char *)(v24 > 1), v25 + 1, 1, v12);
    }
    *((void *)v12 + 2) = v26;
    unint64_t v96 = v12 + 32;
    uint64_t v27 = &v12[16 * v25 + 32];
    *(void *)uint64_t v27 = v13;
    *((void *)v27 + 1) = v16;
    if (v25)
    {
      uint64_t v28 = v12 + 32;
      while (1)
      {
        unint64_t v29 = v26 - 1;
        if (v26 >= 4)
        {
          uint64_t v34 = &v28[16 * v26];
          uint64_t v35 = *((void *)v34 - 8);
          uint64_t v36 = *((void *)v34 - 7);
          BOOL v40 = __OFSUB__(v36, v35);
          uint64_t v37 = v36 - v35;
          if (v40) {
            goto LABEL_121;
          }
          uint64_t v39 = *((void *)v34 - 6);
          uint64_t v38 = *((void *)v34 - 5);
          BOOL v40 = __OFSUB__(v38, v39);
          uint64_t v32 = v38 - v39;
          char v33 = v40;
          if (v40) {
            goto LABEL_122;
          }
          unint64_t v41 = v26 - 2;
          uint64_t v42 = &v28[16 * v26 - 32];
          uint64_t v44 = *(void *)v42;
          uint64_t v43 = *((void *)v42 + 1);
          BOOL v40 = __OFSUB__(v43, v44);
          uint64_t v45 = v43 - v44;
          if (v40) {
            goto LABEL_123;
          }
          BOOL v40 = __OFADD__(v32, v45);
          uint64_t v46 = v32 + v45;
          if (v40) {
            goto LABEL_125;
          }
          if (v46 >= v37)
          {
            BOOL v64 = &v28[16 * v29];
            uint64_t v66 = *(void *)v64;
            uint64_t v65 = *((void *)v64 + 1);
            BOOL v40 = __OFSUB__(v65, v66);
            uint64_t v67 = v65 - v66;
            if (v40) {
              goto LABEL_131;
            }
            BOOL v57 = v32 < v67;
            goto LABEL_77;
          }
        }
        else
        {
          if (v26 != 3)
          {
            uint64_t v58 = *((void *)v12 + 4);
            uint64_t v59 = *((void *)v12 + 5);
            BOOL v40 = __OFSUB__(v59, v58);
            uint64_t v51 = v59 - v58;
            char v52 = v40;
            goto LABEL_71;
          }
          uint64_t v31 = *((void *)v12 + 4);
          uint64_t v30 = *((void *)v12 + 5);
          BOOL v40 = __OFSUB__(v30, v31);
          uint64_t v32 = v30 - v31;
          char v33 = v40;
        }
        if (v33) {
          goto LABEL_124;
        }
        unint64_t v41 = v26 - 2;
        uint64_t v47 = &v28[16 * v26 - 32];
        uint64_t v49 = *(void *)v47;
        uint64_t v48 = *((void *)v47 + 1);
        BOOL v50 = __OFSUB__(v48, v49);
        uint64_t v51 = v48 - v49;
        char v52 = v50;
        if (v50) {
          goto LABEL_126;
        }
        unint64_t v53 = &v28[16 * v29];
        uint64_t v55 = *(void *)v53;
        uint64_t v54 = *((void *)v53 + 1);
        BOOL v40 = __OFSUB__(v54, v55);
        uint64_t v56 = v54 - v55;
        if (v40) {
          goto LABEL_128;
        }
        if (__OFADD__(v51, v56)) {
          goto LABEL_130;
        }
        if (v51 + v56 >= v32)
        {
          BOOL v57 = v32 < v56;
LABEL_77:
          if (v57) {
            unint64_t v29 = v41;
          }
          goto LABEL_79;
        }
LABEL_71:
        if (v52) {
          goto LABEL_127;
        }
        uint64_t v60 = &v28[16 * v29];
        uint64_t v62 = *(void *)v60;
        uint64_t v61 = *((void *)v60 + 1);
        BOOL v40 = __OFSUB__(v61, v62);
        uint64_t v63 = v61 - v62;
        if (v40) {
          goto LABEL_129;
        }
        if (v63 < v51) {
          goto LABEL_88;
        }
LABEL_79:
        unint64_t v68 = v29 - 1;
        if (v29 - 1 >= v26)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!v14) {
          goto LABEL_143;
        }
        uint64_t v69 = v12;
        uint64_t v70 = v14;
        uint64_t v6 = &v28[16 * v68];
        uint64_t v71 = *(void *)v6;
        unint64_t v72 = v29;
        uint64_t v73 = &v28[16 * v29];
        uint64_t v74 = *((void *)v73 + 1);
        sub_2292C8244((unsigned __int8 *)(v70 + *(void *)v6), (unsigned __int8 *)(v70 + *(void *)v73), v70 + v74, v97, a2 & 1, v100);
        if (v3)
        {
LABEL_99:
          swift_bridgeObjectRelease();
          uint64_t v6 = v100;
          goto LABEL_114;
        }
        if (v74 < v71) {
          goto LABEL_118;
        }
        if (v72 > *((void *)v69 + 2)) {
          goto LABEL_119;
        }
        unint64_t v75 = v72;
        *(void *)uint64_t v6 = v71;
        uint64_t v28 = v96;
        *(void *)&v96[16 * v68 + 8] = v74;
        unint64_t v76 = *((void *)v69 + 2);
        if (v72 >= v76) {
          goto LABEL_120;
        }
        char v12 = v69;
        unint64_t v26 = v76 - 1;
        memmove(v73, v73 + 16, 16 * (v76 - 1 - v75));
        *((void *)v69 + 2) = v76 - 1;
        uint64_t v6 = v100;
        uint64_t v14 = v95;
        if (v76 <= 2) {
          goto LABEL_88;
        }
      }
    }
    unint64_t v26 = 1;
LABEL_88:
    uint64_t v13 = v92;
    uint64_t v15 = v93;
    if (v92 >= v93) {
      goto LABEL_102;
    }
  }
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:

  __break(1u);
LABEL_144:

  __break(1u);
LABEL_145:

  __break(1u);
LABEL_146:

  __break(1u);
}

void sub_2292CB504(char **a1, char a2, void *a3)
{
  uint64_t v5 = *a1;
  id v6 = a3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = sub_2292C91E8((uint64_t)v5);
  }
  uint64_t v7 = *((void *)v5 + 2);
  v9[0] = (uint64_t)(v5 + 32);
  v9[1] = v7;
  id v8 = v6;
  sub_2292CAD7C(v9, a2 & 1, v8);

  *a1 = v5;
}

unint64_t sub_2292CB5AC()
{
  unint64_t result = qword_26830F9F8;
  if (!qword_26830F9F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26830F9F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26830F9F8);
  }
  return result;
}

void AAUILocalizedActivityTypeForAchievement_cold_1(void *a1)
{
  uint64_t v1 = [a1 template];
  uint64_t v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_229290000, v3, v4, "Could not determine Localized activity type for achievement's template: %@", v5, v6, v7, v8, v9);
}

void AAUILocalizedModalityForAchievement_cold_1(void *a1)
{
  uint64_t v1 = [a1 template];
  uint64_t v2 = [v1 uniqueName];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_229290000, v3, v4, "Could not localized Modality for template %@", v5, v6, v7, v8, v9);
}

uint64_t sub_2292CC068()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2292CC078()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2292CC088()
{
  return MEMORY[0x270EEE738]();
}

uint64_t sub_2292CC098()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_2292CC0A8()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_2292CC0B8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2292CC0C8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2292CC0D8()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_2292CC0E8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2292CC0F8()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2292CC108()
{
  return MEMORY[0x270EF0BD0]();
}

uint64_t sub_2292CC118()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2292CC128()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2292CC138()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2292CC148()
{
  return MEMORY[0x270EF12C8]();
}

uint64_t sub_2292CC158()
{
  return MEMORY[0x270EF1350]();
}

uint64_t sub_2292CC168()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_2292CC178()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_2292CC188()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_2292CC198()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_2292CC1A8()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_2292CC1B8()
{
  return MEMORY[0x270F0AAE0]();
}

uint64_t sub_2292CC1C8()
{
  return MEMORY[0x270F0AAE8]();
}

uint64_t sub_2292CC1D8()
{
  return MEMORY[0x270F0AAF0]();
}

uint64_t sub_2292CC1E8()
{
  return MEMORY[0x270F0AAF8]();
}

uint64_t sub_2292CC1F8()
{
  return MEMORY[0x270F0AB00]();
}

uint64_t sub_2292CC208()
{
  return MEMORY[0x270F0AB08]();
}

uint64_t sub_2292CC218()
{
  return MEMORY[0x270F0AB10]();
}

uint64_t sub_2292CC228()
{
  return MEMORY[0x270F0AB18]();
}

uint64_t sub_2292CC238()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2292CC248()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2292CC258()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2292CC268()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2292CC278()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2292CC288()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2292CC298()
{
  return MEMORY[0x270FA0BA8]();
}

uint64_t sub_2292CC2A8()
{
  return MEMORY[0x270FA0BF0]();
}

uint64_t sub_2292CC2B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2292CC2C8()
{
  return MEMORY[0x270FA2B70]();
}

uint64_t sub_2292CC2D8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_2292CC2E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2292CC2F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2292CC308()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2292CC318()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2292CC328()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2292CC338()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2292CC348()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2292CC358()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2292CC368()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2292CC378()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2292CC388()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2292CC398()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2292CC3A8()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2292CC3B8()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2292CC3C8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2292CC3D8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2292CC3E8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2292CC3F8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2292CC408()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2292CC418()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2292CC428()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2292CC438()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2292CC448()
{
  return MEMORY[0x270F9E0F0]();
}

uint64_t sub_2292CC458()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2292CC468()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2292CC478()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2292CC488()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2292CC498()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2292CC4A8()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2292CC4B8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2292CC4C8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2292CC4D8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2292CC4E8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2292CC4F8()
{
  return MEMORY[0x270EF2590]();
}

uint64_t sub_2292CC508()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2292CC518()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2292CC528()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2292CC538()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2292CC548()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2292CC558()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2292CC568()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2292CC578()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_2292CC588()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2292CC598()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2292CC5A8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2292CC5B8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2292CC5C8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2292CC5D8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2292CC5E8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2292CC5F8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2292CC608()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2292CC618()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2292CC628()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2292CC638()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2292CC648()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_2292CC658()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2292CC668()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2292CC678()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2292CC688()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2292CC698()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2292CC6A8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_2292CC6B8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2292CC6C8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2292CC6D8()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_2292CC6E8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2292CC6F8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2292CC708()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2292CC718()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2292CC728()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2292CC738()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2292CC748()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2292CC758()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t ACHApplyBadgePropertiesToAchievement()
{
  return MEMORY[0x270F0A5B8]();
}

uint64_t ACHCompareYearMonthDayDateComponents()
{
  return MEMORY[0x270F0A5F8]();
}

uint64_t ACHDateComponentsForYearMonthDay()
{
  return MEMORY[0x270F0A600]();
}

uint64_t ACHHKQuantityWithValueAndUnit()
{
  return MEMORY[0x270F0A690]();
}

uint64_t ACHLogAssets()
{
  return MEMORY[0x270F0A6C0]();
}

uint64_t ACHLogDefault()
{
  return MEMORY[0x270F0A6E8]();
}

uint64_t ACHLogMonthlyChallenges()
{
  return MEMORY[0x270F0A6F8]();
}

uint64_t ACHLogUI()
{
  return MEMORY[0x270F0A718]();
}

uint64_t ACHMonthlyChallengeTypeFromTemplateUniqueName()
{
  return MEMORY[0x270F0A770]();
}

uint64_t ACHMonthlyChallengeTypeMoveRingTemplate()
{
  return MEMORY[0x270F0A778]();
}

uint64_t ACHMonthlyChallengeTypeStandRingTemplate()
{
  return MEMORY[0x270F0A780]();
}

uint64_t ACHMonthlyChallengeTypeTotalDistanceTemplate()
{
  return MEMORY[0x270F0A788]();
}

uint64_t ACHMonthlyChallengeTypeTotalWorkoutsTemplate()
{
  return MEMORY[0x270F0A790]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHStartOfFitnessWeekBeforeDateInCalendar()
{
  return MEMORY[0x270F0A7C8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x270F126B0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x270F126C0]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x270F126C8]();
}

uint64_t BestWorkoutEnergyBurnedTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A888]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t DailyExerciseRecordTemplate()
{
  return MEMORY[0x270F0A890]();
}

uint64_t DailyMoveRecordTemplate()
{
  return MEMORY[0x270F0A898]();
}

uint64_t FIExperienceTypeWithHealthStore()
{
  return MEMORY[0x270F299C0]();
}

uint64_t FILocalizedNameForIndoorAgnosticActivityType()
{
  return MEMORY[0x270F29AB0]();
}

uint64_t FIUILocaleIsRightToLeft()
{
  return MEMORY[0x270F2CC68]();
}

uint64_t FirstWorkoutTemplateForWorkoutActivityType()
{
  return MEMORY[0x270F0A8F8]();
}

uint64_t FiveHundredMoveGoals()
{
  return MEMORY[0x270F0A908]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x270EF3668]();
}

uint64_t HundredMoveGoals()
{
  return MEMORY[0x270F0A950]();
}

uint64_t LongestMoveStreakTemplate()
{
  return MEMORY[0x270F0A958]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MoveGoal200PercentTemplate()
{
  return MEMORY[0x270F0A968]();
}

uint64_t MoveGoal300PercentTemplate()
{
  return MEMORY[0x270F0A970]();
}

uint64_t MoveGoal400PercentTemplate()
{
  return MEMORY[0x270F0A978]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

uint64_t PerfectWeekAllTemplate()
{
  return MEMORY[0x270F0A9A8]();
}

uint64_t PerfectWeekExerciseTemplate()
{
  return MEMORY[0x270F0A9B0]();
}

uint64_t PerfectWeekMoveTemplate()
{
  return MEMORY[0x270F0A9B8]();
}

uint64_t PerfectWeekStandTemplate()
{
  return MEMORY[0x270F0A9C0]();
}

uint64_t SevenWorkoutWeekTemplate()
{
  return MEMORY[0x270F0A9D0]();
}

uint64_t ThousandMoveGoals()
{
  return MEMORY[0x270F0AA08]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x270F82C48]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F82EF0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x270EF39E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}