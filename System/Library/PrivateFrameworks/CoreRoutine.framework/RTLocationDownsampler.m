@interface RTLocationDownsampler
+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5;
+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 outputSize:(int64_t)a5;
+ (id)createErrorFunctionWithAbsoluteCrosstrackDistance;
+ (id)createErrorFunctionWithPerpendicularDistance;
+ (id)createErrorFunctionWithPerpendicularDistanceAndSpeed;
+ (id)downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5 outputSize:(unint64_t)a6;
+ (id)downsampleLocations:(id)a3 outputSize:(unint64_t)a4;
+ (id)filterConvergingLocations:(id)a3;
@end

@implementation RTLocationDownsampler

+ (id)filterConvergingLocations:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = objc_msgSend(v3, "reverseObjectEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v6)
  {
    v8 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v28;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
      if (!v8) {
        goto LABEL_10;
      }
      v12 = [v8 timestamp];
      v13 = [v11 timestamp];
      [v12 timeIntervalSinceDate:v13];
      if (v14 > 20.0)
      {

LABEL_10:
        id v19 = v11;

        v8 = v19;
LABEL_11:
        [v4 addObject:v11];
        goto LABEL_12;
      }
      [v8 horizontalAccuracy];
      double v16 = v15;
      [v11 horizontalAccuracy];
      double v18 = v17;

      if (v16 > v18) {
        goto LABEL_10;
      }
      [v8 horizontalAccuracy];
      double v21 = v20 + v20;
      [v11 horizontalAccuracy];
      if (v21 > v22) {
        goto LABEL_11;
      }
LABEL_12:
      ++v10;
    }
    while (v7 != v10);
    uint64_t v23 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    uint64_t v7 = v23;
  }
  while (v23);
LABEL_19:

  v24 = [v4 reverseObjectEnumerator];
  v25 = [v24 allObjects];

  return v25;
}

+ (id)downsampleLocations:(id)a3 outputSize:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[RTLocationDownsampler createErrorFunctionWithPerpendicularDistance];
  uint64_t v7 = +[RTLocationDownsampler downsampleLocations:v5 errorFunction:v6 errorThreshold:a4 outputSize:0.0];

  return v7;
}

+ (id)downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5 outputSize:(unint64_t)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1AD0EBF30](a4);
  if (!a4)
  {
    uint64_t v11 = +[RTLocationDownsampler createErrorFunctionWithPerpendicularDistance];

    uint64_t v10 = (void *)v11;
  }
  v12 = v9;
  if (a5 > 0.0)
  {
    v12 = +[RTLocationDownsampler _downsampleLocations:v9 errorFunction:v10 errorThreshold:a5];
  }
  if (a6)
  {
    uint64_t v13 = +[RTLocationDownsampler _downsampleLocations:v12 errorFunction:v10 outputSize:a6];

    v12 = (void *)v13;
  }
  double v14 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218496;
    unint64_t v17 = a6;
    __int16 v18 = 2048;
    uint64_t v19 = [v9 count];
    __int16 v20 = 2048;
    uint64_t v21 = [v12 count];
    _os_log_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_INFO, "RTLocationDownsampler: desired output size, %lu, input size, %lu, output size, %lu", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (double (**)(void, void, void))v8;
  if (!v7)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)v24 = 0;
    v12 = "Invalid parameter not satisfying: locations";
LABEL_12:
    _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, v12, v24, 2u);
    goto LABEL_13;
  }
  if (!v8)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)v24 = 0;
    v12 = "Invalid parameter not satisfying: errorFunction";
    goto LABEL_12;
  }
  if (a5 <= 0.0)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v12 = "Invalid parameter not satisfying: errorThreshold > 0";
      goto LABEL_12;
    }
LABEL_13:

    id v10 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)[v7 count] >= 3)
  {
    if ((unint64_t)([v7 count] - 3) > 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v14 = 0;
      double v15 = 0.0;
    }
    else
    {
      unint64_t v14 = 0;
      double v15 = 0.0;
      unint64_t v16 = 1;
      do
      {
        unint64_t v17 = [v7 objectAtIndex:v16];
        double v18 = ((double (**)(void, void *, id))v9)[2](v9, v17, v7);
        if (v18 > v15)
        {
          unint64_t v14 = v16;
          double v15 = v18;
        }

        ++v16;
      }
      while (v16 < [v7 count] - 1);
    }
    if (v15 <= a5)
    {
      __int16 v20 = [v7 firstObject];
      v25[0] = v20;
      uint64_t v22 = [v7 lastObject];
      v25[1] = v22;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    }
    else
    {
      uint64_t v19 = objc_msgSend(v7, "subarrayWithRange:", 0, v14 + 1);
      __int16 v20 = +[RTLocationDownsampler _downsampleLocations:v19 errorFunction:v9 errorThreshold:a5];

      uint64_t v21 = objc_msgSend(v7, "subarrayWithRange:", v14, objc_msgSend(v7, "count") - v14);
      uint64_t v22 = +[RTLocationDownsampler _downsampleLocations:v21 errorFunction:v9 errorThreshold:a5];

      id v10 = (id)objc_opt_new();
      uint64_t v23 = objc_msgSend(v20, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - 1);
      [v10 addObjectsFromArray:v23];

      [v10 addObjectsFromArray:v22];
    }
  }
  else
  {
    id v10 = v7;
  }
LABEL_14:

  return v10;
}

+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 outputSize:(int64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    long long v30 = "Invalid parameter not satisfying: locations";
LABEL_30:
    _os_log_error_impl(&dword_1A8FEF000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_31;
  }
  if (!v8)
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    *(_WORD *)buf = 0;
    long long v30 = "Invalid parameter not satisfying: errorFunction";
    goto LABEL_30;
  }
  if (a5 <= 0)
  {
    long long v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v30 = "Invalid parameter not satisfying: outputSize > 0";
      goto LABEL_30;
    }
LABEL_31:

    id v28 = 0;
    goto LABEL_32;
  }
  if ([v7 count] <= (unint64_t)a5)
  {
    id v28 = v7;
  }
  else
  {
    int64_t v32 = a5;
    id v10 = objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v44;
      double v15 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v44 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          [v17 altitude];
          if (v18 >= 0.0 && ([v17 horizontalAccuracy], v19 <= 650.0))
          {
            [v10 addObject:v17];
            [v17 altitude];
            double v15 = v22;
          }
          else
          {
            long long v41 = 0u;
            memset(v42, 0, 28);
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            memset(v36, 0, sizeof(v36));
            *(_OWORD *)buf = 0u;
            if (v17) {
              [v17 clientLocation];
            }
            *(double *)((char *)v36 + 12) = v15;
            id v20 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            v33[6] = v40;
            v33[7] = v41;
            v34[0] = v42[0];
            *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v42 + 12);
            v33[2] = v36[1];
            v33[3] = v37;
            v33[4] = v38;
            v33[5] = v39;
            v33[0] = *(_OWORD *)buf;
            v33[1] = v36[0];
            uint64_t v21 = (void *)[v20 initWithClientLocation:v33];
            [v10 addObject:v21];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v13);
    }

    if ([v10 count])
    {
      uint64_t v23 = [RTLocationDownsamplerTree alloc];
      v24 = (void *)[v10 copy];
      v25 = [(RTLocationDownsamplerTree *)v23 initWithLocations:v24 errorFunction:v9];

      if (v32 >= 3)
      {
        int64_t v26 = v32 - 2;
        do
        {
          [(RTLocationDownsamplerTree *)v25 maximumError];
          if (v27 == 0.0) {
            break;
          }
          [(RTLocationDownsamplerTree *)v25 splitLocationsWithErrorFunction:v9];
          --v26;
        }
        while (v26);
      }
      id v28 = [(RTLocationDownsamplerTree *)v25 sampledLocations];
    }
    else
    {
      id v28 = v11;
    }
  }
LABEL_32:

  return v28;
}

+ (id)createErrorFunctionWithPerpendicularDistance
{
  return &__block_literal_global_7;
}

double __69__RTLocationDownsampler_createErrorFunctionWithPerpendicularDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 firstObject];
  id v7 = [v5 lastObject];

  double v8 = 0.0;
  if (v6 && v7)
  {
    id v9 = v6;
    double v41 = 0.0;
    double v42 = 0.0;
    double v39 = 0.0;
    double v40 = 0.0;
    double v37 = 0.0;
    double v38 = 0.0;
    [v9 coordinate];
    double v11 = v10;
    [v9 coordinate];
    double v13 = v12;
    [v9 altitude];
    double v15 = v14;
    [v4 coordinate];
    double v17 = v16;
    [v4 coordinate];
    double v19 = v18;
    [v4 altitude];
    BOOL v21 = RTCommonConvertGeodeticToLocalFrame(&v42, &v41, &v40, v11, v13, v15, v17, v19, v20);
    double v8 = 0.0;
    if (v21)
    {
      [v9 coordinate];
      double v23 = v22;
      [v9 coordinate];
      double v25 = v24;
      [v9 altitude];
      double v27 = v26;
      [v7 coordinate];
      double v29 = v28;
      [v7 coordinate];
      double v31 = v30;
      [v7 altitude];
      if (RTCommonConvertGeodeticToLocalFrame(&v39, &v38, &v37, v23, v25, v27, v29, v31, v32))
      {
        double v33 = sqrt(v37 * v37 + v38 * v38 + v39 * v39);
        if (v33 != 0.0)
        {
          double v34 = sqrt((v38 * v40 - v37 * v41) * (v38 * v40 - v37 * v41)+ (v37 * v42 - v39 * v40) * (v37 * v42 - v39 * v40)+ (v39 * v41 - v38 * v42) * (v39 * v41 - v38 * v42))/ v33;
          [v4 horizontalAccuracy];
          double v8 = v34 - v35;
        }
      }
    }
  }
  return v8;
}

+ (id)createErrorFunctionWithPerpendicularDistanceAndSpeed
{
  return &__block_literal_global_19;
}

double __77__RTLocationDownsampler_createErrorFunctionWithPerpendicularDistanceAndSpeed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 firstObject];
  id v7 = [v5 lastObject];

  double v8 = 0.0;
  if (v6 && v7)
  {
    id v9 = v6;
    double v57 = 0.0;
    double v58 = 0.0;
    double v55 = 0.0;
    double v56 = 0.0;
    double v53 = 0.0;
    double v54 = 0.0;
    [v9 coordinate];
    double v11 = v10;
    [v9 coordinate];
    double v13 = v12;
    [v9 altitude];
    double v15 = v14;
    [v4 coordinate];
    double v17 = v16;
    [v4 coordinate];
    double v19 = v18;
    [v4 altitude];
    BOOL v21 = RTCommonConvertGeodeticToLocalFrame(&v58, &v57, &v56, v11, v13, v15, v17, v19, v20);
    double v8 = 0.0;
    if (v21)
    {
      [v9 coordinate];
      double v23 = v22;
      [v9 coordinate];
      double v25 = v24;
      [v9 altitude];
      double v27 = v26;
      [v7 coordinate];
      double v29 = v28;
      [v7 coordinate];
      double v31 = v30;
      [v7 altitude];
      if (RTCommonConvertGeodeticToLocalFrame(&v55, &v54, &v53, v23, v25, v27, v29, v31, v32))
      {
        double v33 = sqrt(v53 * v53 + v54 * v54 + v55 * v55);
        if (v33 != 0.0)
        {
          double v34 = v56;
          double v35 = v57;
          double v36 = v58;
          double v37 = sqrt((v54 * v56 - v53 * v57) * (v54 * v56 - v53 * v57)+ (v53 * v58 - v55 * v56) * (v53 * v58 - v55 * v56)+ (v55 * v57 - v54 * v58) * (v55 * v57 - v54 * v58))/ v33;
          [v4 horizontalAccuracy];
          double v52 = v37;
          double v8 = v37 - v38;
          double v39 = [v7 timestamp];
          double v40 = [v9 timestamp];
          [v39 timeIntervalSinceDate:v40];
          double v42 = v41;

          long long v43 = [v4 timestamp];
          [v43 timeIntervalSinceReferenceDate];
          double v45 = v44;
          long long v46 = [v9 timestamp];
          [v46 timeIntervalSinceReferenceDate];
          double v48 = v47;

          if (v42 > 0.0 && v45 - v48 > 0.0)
          {
            double v49 = sqrt(v34 * v34 + v35 * v35 + v36 * v36);
            double v50 = sqrt(v49 * v49 - v52 * v52) - v33 * (v45 - v48) / v42;
            if (v50 < 0.0) {
              double v50 = -v50;
            }
            double v8 = sqrt(v8 * v8 + v50 * v50);
          }
        }
      }
    }
  }
  return v8;
}

+ (id)createErrorFunctionWithAbsoluteCrosstrackDistance
{
  return &__block_literal_global_21;
}

double __74__RTLocationDownsampler_createErrorFunctionWithAbsoluteCrosstrackDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 firstObject];
  id v7 = [v5 lastObject];

  double v8 = 0.0;
  if (v6 && v7 && v6 != v7)
  {
    id v9 = v6;
    double v39 = 0.0;
    double v40 = 0.0;
    double v36 = 0.0;
    double v37 = 0.0;
    [v9 coordinate];
    double v11 = v10;
    [v9 coordinate];
    double v13 = v12;
    [v9 altitude];
    double v15 = v14;
    [v4 coordinate];
    double v17 = v16;
    [v4 coordinate];
    double v19 = v18;
    [v4 altitude];
    BOOL v21 = RTCommonConvertGeodeticToLocalFrame(&v40, &v39, &v38, v11, v13, v15, v17, v19, v20);
    double v8 = 0.0;
    if (v21)
    {
      [v9 coordinate];
      double v23 = v22;
      [v9 coordinate];
      double v25 = v24;
      [v9 altitude];
      double v27 = v26;
      [v7 coordinate];
      double v29 = v28;
      [v7 coordinate];
      double v31 = v30;
      [v7 altitude];
      if (RTCommonConvertGeodeticToLocalFrame(&v37, &v36, &v35, v23, v25, v27, v29, v31, v32))
      {
        if (v37 == 0.0) {
          double v33 = 0.0;
        }
        else {
          double v33 = -v36 / v37;
        }
        double v8 = fabs(v39 + v33 * v40) / sqrt(v33 * v33 + 1.0);
      }
    }
  }
  return v8;
}

@end