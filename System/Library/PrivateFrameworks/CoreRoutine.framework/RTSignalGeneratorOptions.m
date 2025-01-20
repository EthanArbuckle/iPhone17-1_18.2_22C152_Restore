@interface RTSignalGeneratorOptions
+ (BOOL)supportsSecureCoding;
+ (BOOL)visitsOverlapping:(id)a3;
+ (id)getVisitsFromVisitsDescriptionData:(id)a3;
+ (id)visitsDescriptionDataAtPath:(id)a3;
- (NSArray)expectedVisits;
- (RTLocation)endLocation;
- (RTLocation)startLocation;
- (RTSignalGeneratorOptions)init;
- (RTSignalGeneratorOptions)initWithCoder:(id)a3;
- (RTSignalGeneratorOptions)initWithStartLocation:(id)a3 endLocation:(id)a4 expectedVisits:(id)a5;
- (RTSignalGeneratorOptions)initWithVisitsDescriptionData:(id)a3;
- (RTSignalGeneratorOptions)initWithVisitsDescriptionPListPath:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSignalGeneratorOptions

+ (id)visitsDescriptionDataAtPath:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v45];

  if (v4)
  {
    os_log_t oslog = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v45];
    if (oslog)
    {
      v5 = [MEMORY[0x1E4F1C9C8] date];
      v6 = [oslog objectForKey:@"Locations"];
      v7 = (void *)[v6 mutableCopy];

      v43 = [oslog objectForKey:@"WeeklyVisits"];
      uint64_t v41 = [v43 count];
      v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v9 = [v8 components:764 fromDate:v5];

      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke;
      v61[3] = &unk_1E5D744A0;
      id v39 = v9;
      id v62 = v39;
      uint64_t v65 = v41;
      id v10 = v5;
      id v63 = v10;
      id v11 = v7;
      id v64 = v11;
      [v43 enumerateObjectsUsingBlock:v61];
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v44 setObject:v11 forKey:@"Locations"];
      v40 = [oslog objectForKey:@"CustomizedVisits"];
      v12 = objc_opt_new();
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_74;
      v57[3] = &unk_1E5D74478;
      id v42 = v12;
      id v58 = v42;
      id v37 = v10;
      id v59 = v37;
      id v13 = v11;
      id v60 = v13;
      [v40 enumerateObjectsUsingBlock:v57];
      if ([(id)objc_opt_class() visitsOverlapping:v42])
      {
        v14 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1A8FEF000, v14, OS_LOG_TYPE_ERROR, "Error: found overlapping customized visits", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v14 = v42;
        uint64_t v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v53, v71, 16, v37, v39);
        if (v16)
        {
          uint64_t v17 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v54 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              v20 = [v13 objectForKeyedSubscript:v19];
              v21 = [v20 objectForKey:@"visits"];
              BOOL v22 = v21 == 0;

              if (v22)
              {
                v23 = [v13 objectForKeyedSubscript:v19];
                v24 = objc_opt_new();
                [v23 setObject:v24 forKey:@"visits"];
              }
              v25 = [v13 objectForKeyedSubscript:v19];
              v26 = [v25 objectForKey:@"visits"];
              v27 = [v14 objectForKey:v19];
              [v26 addObjectsFromArray:v27];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v71 count:16];
          }
          while (v16);
        }
      }

      v28 = [oslog objectForKeyedSubscript:@"LocationFrequency"];

      if (v28)
      {
        v29 = [oslog objectForKeyedSubscript:@"LocationFrequency"];
        [v44 setObject:v29 forKey:@"LocationFrequency"];
      }
      v30 = [oslog objectForKey:@"WeeklyActivities", v37];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v67 = 0x3032000000;
      v68 = __Block_byref_object_copy__0;
      v69 = __Block_byref_object_dispose__0;
      id v70 = 0;
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_78;
      v47[3] = &unk_1E5D744F0;
      id v32 = v39;
      id v48 = v32;
      uint64_t v52 = v41;
      v15 = v38;
      v49 = v15;
      p_long long buf = &buf;
      id v33 = v31;
      id v50 = v33;
      [v30 enumerateObjectsUsingBlock:v47];
      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        v34 = [RTMotionActivity alloc];
        v35 = [(RTMotionActivity *)v34 initWithType:0 confidence:3 startDate:*(void *)(*((void *)&buf + 1) + 40)];
        [v33 addObject:v35];
      }
      [v44 setObject:v33 forKey:@"MotionActivities"];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v15 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v45;
        _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "issue creating dictionary with contents of file, %@", (uint8_t *)&buf, 0xCu);
      }
      id v44 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v45;
      _os_log_error_impl(&dword_1A8FEF000, oslog, OS_LOG_TYPE_ERROR, "file doesn't exist at path, %@", (uint8_t *)&buf, 0xCu);
    }
    id v44 = 0;
  }

  return v44;
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v6, "setDay:", -7 * (*(void *)(a1 + 56) + ~a3) - objc_msgSend(*(id *)(a1 + 32), "weekday") + 2);
  objc_msgSend(v6, "setHour:", -objc_msgSend(*(id *)(a1 + 32), "hour"));
  objc_msgSend(v6, "setMinute:", -objc_msgSend(*(id *)(a1 + 32), "minute"));
  objc_msgSend(v6, "setSecond:", -objc_msgSend(*(id *)(a1 + 32), "second"));
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v7 dateByAddingComponents:v6 toDate:*(void *)(a1 + 40) options:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2;
  v10[3] = &unk_1E5D74478;
  id v11 = v8;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v9 = v8;
  [v5 enumerateObjectsUsingBlock:v10];
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 objectForKeyedSubscript:@"Location"];
  id v5 = [v3 objectForKeyedSubscript:@"Entry"];
  id v6 = [v3 objectForKeyedSubscript:@"Exit"];

  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v7 components:240 fromDate:v5];

  objc_msgSend(v8, "setDay:", objc_msgSend(v8, "day") - 1);
  id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v10 = [v9 components:240 fromDate:v6];

  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 1);
  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v12 = [v11 dateByAddingComponents:v8 toDate:*(void *)(a1 + 32) options:0];

  id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v14 = [v13 dateByAddingComponents:v10 toDate:*(void *)(a1 + 32) options:0];

  if ([v12 compare:*(void *)(a1 + 40)] == 1
    || [v14 compare:*(void *)(a1 + 40)] == 1)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [MEMORY[0x1E4F1C9C8] dateFormatter];
      v53 = uint64_t v52 = v5;
      long long v54 = [v53 stringFromDate:*(void *)(a1 + 40)];
      *(_DWORD *)long long buf = 138412290;
      id v62 = v54;
      _os_log_error_impl(&dword_1A8FEF000, v15, OS_LOG_TYPE_ERROR, "adjusted dates are newer than current date, %@", buf, 0xCu);

      id v5 = v52;
    }
  }
  else
  {
    id v60 = v5;
    uint64_t v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    uint64_t v17 = [v16 objectForKey:@"visits"];

    if (!v17)
    {
      v18 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      uint64_t v19 = objc_opt_new();
      [v18 setObject:v19 forKey:@"visits"];
    }
    if ([v12 compare:v14] == 1)
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v58 = [MEMORY[0x1E4F1C9C8] dateFormatter];
        long long v55 = [v58 stringFromDate:v12];
        long long v56 = [MEMORY[0x1E4F1C9C8] dateFormatter];
        v57 = [v56 stringFromDate:v14];
        *(_DWORD *)long long buf = 138412546;
        id v62 = v55;
        __int16 v63 = 2112;
        id v64 = v57;
        _os_log_error_impl(&dword_1A8FEF000, v20, OS_LOG_TYPE_ERROR, "ERROR: adjusted entry, %@, postdates adjusted exit, %@", buf, 0x16u);
      }
      id v5 = v60;
    }
    else
    {
      v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      BOOL v22 = [v21 objectForKeyedSubscript:@"Latitude"];
      [v22 doubleValue];
      double v24 = v23;

      v25 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      v26 = [v25 objectForKeyedSubscript:@"Longitude"];
      [v26 doubleValue];
      double v28 = v27;

      v29 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      v30 = [v29 objectForKeyedSubscript:@"HorizontalUncertainty"];
      [v30 doubleValue];
      double v32 = v31;

      id v33 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      v34 = [v33 objectForKeyedSubscript:@"Altitude"];
      [v34 doubleValue];
      double v36 = v35;

      id v37 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      id v38 = [v37 objectForKeyedSubscript:@"VerticalUncertainty"];
      [v38 doubleValue];
      double v40 = v39;

      uint64_t v41 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      id v42 = [v41 objectForKey:@"sourceAccuracy"];

      id v59 = v6;
      if (v42)
      {
        v43 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
        id v44 = [v43 objectForKey:@"sourceAccuracy"];
        uint64_t v45 = [v44 unsignedIntValue];
      }
      else
      {
        uint64_t v45 = 1;
      }
      v46 = [[RTLocation alloc] initWithLatitude:0 longitude:0 horizontalUncertainty:v45 altitude:v24 verticalUncertainty:v28 date:v32 referenceFrame:v36 speed:v40 sourceAccuracy:-1.0];
      v47 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      id v48 = [v47 objectForKey:@"visits"];
      v49 = [RTLocationOfInterestVisit alloc];
      id v50 = [MEMORY[0x1E4F29128] UUID];
      v51 = [(RTLocationOfInterestVisit *)v49 initWithIdentifier:v50 entry:v12 exit:v14 location:v46 locationOfInterestConfidence:0 locationOfInterestSource:1.0];
      [v48 addObject:v51];

      id v6 = v59;
      id v5 = v60;
    }
  }
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 objectForKeyedSubscript:@"Location"];
  id v5 = [*(id *)(a1 + 32) objectForKey:v4];

  if (!v5)
  {
    id v6 = *(void **)(a1 + 32);
    v7 = objc_opt_new();
    [v6 setObject:v7 forKey:v4];
  }
  v8 = [v3 objectForKeyedSubscript:@"Entry"];
  id v9 = [v3 objectForKeyedSubscript:@"Exit"];

  if ([v8 compare:*(void *)(a1 + 40)] == 1
    || [v9 compare:*(void *)(a1 + 40)] == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    id v10 = (RTLocation *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v41 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    id v37 = [v41 stringFromDate:*(void *)(a1 + 40)];
    id v42 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    double v39 = [v42 stringFromDate:v8];
    v43 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    id v44 = [v43 stringFromDate:v9];
    int v49 = 138412802;
    id v50 = v37;
    __int16 v51 = 2112;
    uint64_t v52 = v39;
    __int16 v53 = 2112;
    long long v54 = v44;
    _os_log_error_impl(&dword_1A8FEF000, &v10->super, OS_LOG_TYPE_ERROR, "visit entry/exit dates are newer than current date, %@, visit entry, %@, exit, %@", (uint8_t *)&v49, 0x20u);

LABEL_17:
    goto LABEL_6;
  }
  if ([v8 compare:v9] != 1)
  {
    id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    id v13 = [v12 objectForKeyedSubscript:@"Latitude"];
    [v13 doubleValue];
    double v15 = v14;

    uint64_t v16 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"Longitude"];
    [v17 doubleValue];
    double v19 = v18;

    v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    v21 = [v20 objectForKeyedSubscript:@"HorizontalUncertainty"];
    [v21 doubleValue];
    double v23 = v22;

    double v24 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    v25 = [v24 objectForKeyedSubscript:@"Altitude"];
    [v25 doubleValue];
    double v27 = v26;

    double v28 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    v29 = [v28 objectForKeyedSubscript:@"VerticalUncertainty"];
    [v29 doubleValue];
    double v31 = v30;

    double v32 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
    id v33 = [v32 objectForKey:@"sourceAccuracy"];

    if (v33)
    {
      v34 = [*(id *)(a1 + 48) objectForKeyedSubscript:v4];
      double v35 = [v34 objectForKey:@"sourceAccuracy"];
      uint64_t v36 = [v35 unsignedIntValue];
    }
    else
    {
      uint64_t v36 = 1;
    }
    id v10 = [[RTLocation alloc] initWithLatitude:0 longitude:0 horizontalUncertainty:v36 altitude:v15 verticalUncertainty:v19 date:v23 referenceFrame:v27 speed:v31 sourceAccuracy:-1.0];
    id v37 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    id v38 = [RTLocationOfInterestVisit alloc];
    double v39 = [MEMORY[0x1E4F29128] UUID];
    double v40 = [(RTLocationOfInterestVisit *)v38 initWithIdentifier:v39 entry:v8 exit:v9 location:v10 locationOfInterestConfidence:0 locationOfInterestSource:1.0];
    [v37 addObject:v40];

    goto LABEL_17;
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v45 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    v46 = [v45 stringFromDate:v8];
    v47 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    id v48 = [v47 stringFromDate:v9];
    int v49 = 138412546;
    id v50 = v46;
    __int16 v51 = 2112;
    uint64_t v52 = v48;
    _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "ERROR: entry, %@, postdates exit, %@", (uint8_t *)&v49, 0x16u);
  }
LABEL_7:
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_78(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v6, "setDay:", -7 * (*(void *)(a1 + 64) + ~a3) - objc_msgSend(*(id *)(a1 + 32), "weekday") + 2);
  objc_msgSend(v6, "setHour:", -objc_msgSend(*(id *)(a1 + 32), "hour"));
  objc_msgSend(v6, "setMinute:", -objc_msgSend(*(id *)(a1 + 32), "minute"));
  objc_msgSend(v6, "setSecond:", -objc_msgSend(*(id *)(a1 + 32), "second"));
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [v7 dateByAddingComponents:v6 toDate:*(void *)(a1 + 40) options:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2_79;
  v12[3] = &unk_1E5D744C8;
  id v13 = v8;
  id v14 = *(id *)(a1 + 40);
  uint64_t v16 = a3;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v11;
  long long v15 = v11;
  id v10 = v8;
  [v5 enumerateObjectsUsingBlock:v12];
}

void __56__RTSignalGeneratorOptions_visitsDescriptionDataAtPath___block_invoke_2_79(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 objectForKeyedSubscript:@"Mode of Transportation"];
  unint64_t v30 = +[RTMotionActivity motionActivityTypeFromString:v4];

  id v5 = [v3 objectForKeyedSubscript:@"Confidence"];
  unint64_t v29 = +[RTMotionActivity motionActivityConfidenceFromString:v5];

  id v6 = [v3 objectForKeyedSubscript:@"Start"];
  v7 = [v3 objectForKeyedSubscript:@"End"];

  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v9 = [v8 components:240 fromDate:v6];

  objc_msgSend(v9, "setDay:", objc_msgSend(v9, "day") - 1);
  id v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v11 = [v10 components:240 fromDate:v7];

  objc_msgSend(v11, "setDay:", objc_msgSend(v11, "day") - 1);
  id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v13 = [v12 dateByAddingComponents:v9 toDate:*(void *)(a1 + 32) options:0];

  id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v15 = [v14 dateByAddingComponents:v11 toDate:*(void *)(a1 + 32) options:0];

  if ([v13 compare:*(void *)(a1 + 40)] == 1
    || [v15 compare:*(void *)(a1 + 40)] == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    uint64_t v16 = (RTMotionActivity *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
    {
      v21 = [MEMORY[0x1E4F1C9C8] dateFormatter];
      double v22 = [v21 stringFromDate:*(void *)(a1 + 40)];
      *(_DWORD *)long long buf = 138412290;
      id v33 = v22;
      _os_log_error_impl(&dword_1A8FEF000, &v16->super, OS_LOG_TYPE_ERROR, "adjusted dates are newer than current date, %@", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if ([v13 compare:v15] != 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
    uint64_t v26 = *(void *)(a1 + 64);
    double v27 = NSString;
    double v28 = +[RTMotionActivity motionActivityTypeToString:v30];
    double v18 = +[RTMotionActivity motionActivityConfidenceToString:v29];
    id v19 = [v27 stringWithFormat:@"index %d (day), activity type %@, confidence %@, adjustedStart %@, adjustedEnd %@\n", v26, v28, v18, v13, v15];
    v20 = (const char *)[v19 UTF8String];
    fputs(v20, (FILE *)*MEMORY[0x1E4F143C8]);

    uint64_t v16 = [[RTMotionActivity alloc] initWithType:v30 confidence:v29 startDate:v13];
    [*(id *)(a1 + 48) addObject:v16];
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityFramework);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    double v31 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    double v23 = [v31 stringFromDate:v13];
    double v24 = [MEMORY[0x1E4F1C9C8] dateFormatter];
    v25 = [v24 stringFromDate:v15];
    *(_DWORD *)long long buf = 138412546;
    id v33 = v23;
    __int16 v34 = 2112;
    double v35 = v25;
    _os_log_error_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_ERROR, "ERROR: adjusted start, %@, postdates adjusted end, %@", buf, 0x16u);
  }
LABEL_6:
}

+ (BOOL)visitsOverlapping:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * v9)];
        [v4 addObjectsFromArray:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  long long v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:1];
  double v27 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v4 sortUsingDescriptors:v12];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    while (1)
    {
      if (*(void *)v19 != v16) {
        objc_enumerationMutation(v13);
      }
      if (!--v15)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (!v15) {
          break;
        }
      }
    }
  }

  return 0;
}

+ (id)getVisitsFromVisitsDescriptionData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  char v4 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke;
  v10[3] = &unk_1E5D74540;
  id v12 = &v18;
  id v13 = &v14;
  id v5 = v4;
  id v11 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = v19[3];
    uint64_t v8 = v15[3];
    *(_DWORD *)long long buf = 134218240;
    uint64_t v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_INFO, "lois injected, %lu, visits injected, %lu", buf, 0x16u);
  }

  [v5 sortUsingComparator:&__block_literal_global_3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v5;
}

void __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"visits"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_2;
  v12[3] = &unk_1E5D74518;
  id v13 = v5;
  id v14 = v6;
  uint64_t v16 = *(void *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 32);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v12];
}

void __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[4];
      id v8 = (void *)a1[5];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v22 = v7;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_INFO, "%@, %@", buf, 0x16u);
    }

    ++*(void *)(*(void *)(a1[7] + 8) + 24);
  }
  ++*(void *)(*(void *)(a1[8] + 8) + 24);
  id v9 = (void *)a1[6];
  id v10 = [RTVisit alloc];
  long long v11 = [v5 exitDate];
  id v12 = [v5 location];
  id v13 = [v5 entryDate];
  id v14 = [v5 exitDate];
  long long v15 = [(RTVisit *)v10 initWithDate:v11 type:0 location:v12 entry:v13 exit:v14 dataPointCount:0 confidence:0.0 placeInference:0];
  [v9 addObject:v15];

  uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = a3 + 1;
    uint64_t v18 = [v5 exitDate];
    long long v19 = [v5 entryDate];
    [v18 timeIntervalSinceDate:v19];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v22 = v17;
    __int16 v23 = 2112;
    id v24 = v5;
    __int16 v25 = 2048;
    double v26 = v20 / 60.0;
    _os_log_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_INFO, "visit %lu, %@, %f minutes", buf, 0x20u);
  }
}

uint64_t __63__RTSignalGeneratorOptions_getVisitsFromVisitsDescriptionData___block_invoke_93(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 entry];
  id v6 = [v4 entry];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (RTSignalGeneratorOptions)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStartLocation_endLocation_expectedVisits_);
}

- (RTSignalGeneratorOptions)initWithVisitsDescriptionData:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v4 objectForKey:@"Locations"];

  uint64_t v7 = [v5 getVisitsFromVisitsDescriptionData:v6];
  id v8 = [(RTSignalGeneratorOptions *)self initWithStartLocation:0 endLocation:0 expectedVisits:v7];

  return v8;
}

- (RTSignalGeneratorOptions)initWithVisitsDescriptionPListPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() visitsDescriptionDataAtPath:v4];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"Locations"];
  id v8 = [v5 getVisitsFromVisitsDescriptionData:v7];
  id v9 = [(RTSignalGeneratorOptions *)self initWithStartLocation:0 endLocation:0 expectedVisits:v8];

  return v9;
}

- (RTSignalGeneratorOptions)initWithStartLocation:(id)a3 endLocation:(id)a4 expectedVisits:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    long long v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      v46 = "-[RTSignalGeneratorOptions initWithStartLocation:endLocation:expectedVisits:]";
      __int16 v47 = 1024;
      int v48 = 407;
      _os_log_error_impl(&dword_1A8FEF000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: expectedVisits (in %s:%d)", buf, 0x12u);
    }
  }
  v44.receiver = self;
  v44.super_class = (Class)RTSignalGeneratorOptions;
  id v12 = [(RTSignalGeneratorOptions *)&v44 init];
  if (v12)
  {
    if (v8)
    {
      id v13 = (RTLocation *)v8;
      startLocation = v12->_startLocation;
      v12->_startLocation = v13;
    }
    else
    {
      id v38 = [RTLocation alloc];
      startLocation = [v10 firstObject];
      id v42 = [startLocation location];
      [v42 latitude];
      double v16 = v15 + -0.1;
      double v40 = [v10 firstObject];
      uint64_t v17 = [v40 location];
      [v17 longitude];
      double v19 = v18;
      double v20 = [v10 firstObject];
      uint64_t v21 = [v20 entry];
      uint64_t v22 = [v21 dateByAddingTimeInterval:-1800.0];
      uint64_t v23 = [(RTLocation *)v38 initWithLatitude:v22 longitude:v16 horizontalUncertainty:v19 date:10.0];
      id v24 = v12->_startLocation;
      v12->_startLocation = (RTLocation *)v23;
    }
    if (v9)
    {
      __int16 v25 = (RTLocation *)v9;
      endLocation = v12->_endLocation;
      v12->_endLocation = v25;
    }
    else
    {
      double v39 = [RTLocation alloc];
      endLocation = [v10 lastObject];
      v43 = [endLocation location];
      [v43 latitude];
      double v28 = v27 + 0.1;
      uint64_t v41 = [v10 lastObject];
      uint64_t v29 = [v41 location];
      [v29 longitude];
      double v31 = v30;
      double v32 = [v10 lastObject];
      id v33 = [v32 exit];
      __int16 v34 = [v33 dateByAddingTimeInterval:1800.0];
      uint64_t v35 = [(RTLocation *)v39 initWithLatitude:v34 longitude:v28 horizontalUncertainty:v31 date:10.0];
      uint64_t v36 = v12->_endLocation;
      v12->_endLocation = (RTLocation *)v35;
    }
    objc_storeStrong((id *)&v12->_expectedVisits, a5);
  }

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"startLocation, %@, endLocation, %@, expectedVisits, %@", self->_startLocation, self->_endLocation, self->_expectedVisits];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSignalGeneratorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startLocation"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endLocation"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"expectedVisits"];

  long long v11 = [(RTSignalGeneratorOptions *)self initWithStartLocation:v5 endLocation:v6 expectedVisits:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  startLocation = self->_startLocation;
  id v5 = a3;
  [v5 encodeObject:startLocation forKey:@"startLocation"];
  [v5 encodeObject:self->_endLocation forKey:@"endLocation"];
  [v5 encodeObject:self->_expectedVisits forKey:@"expectedVisits"];
}

- (RTLocation)startLocation
{
  return self->_startLocation;
}

- (RTLocation)endLocation
{
  return self->_endLocation;
}

- (NSArray)expectedVisits
{
  return self->_expectedVisits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedVisits, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
}

@end