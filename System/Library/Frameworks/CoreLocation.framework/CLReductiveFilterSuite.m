@interface CLReductiveFilterSuite
+ (double)rangeForReductiveFilterOptions:(id)a3;
+ (double)rangeForTransmitPower:(double)a3;
+ (id)applyFilterToLocationObservations:(id)a3 options:(id)a4;
+ (id)applyFilterToLocationTrace:(id)a3 options:(id)a4;
+ (id)deriveLocationFromLocations:(id)a3;
+ (id)deriveLocationFromLocations:(id)a3 options:(id)a4;
+ (id)filterOutliers:(id)a3;
+ (id)filterOutliers:(id)a3 options:(id)a4;
@end

@implementation CLReductiveFilterSuite

+ (double)rangeForReductiveFilterOptions:(id)a3
{
  [a3 applyRangeEstimation];
  if (v4 == 0.0) {
    return 0.0;
  }
  [a3 transmitPower];

  MEMORY[0x1F4181798](CLReductiveFilterSuite, sel_rangeForTransmitPower_);
  return result;
}

+ (double)rangeForTransmitPower:(double)a3
{
  double v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 < 4.0 || a3 > 20.0)
  {
    if (qword_1E929F670 != -1) {
      dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
    }
    v5 = qword_1E929F678;
    if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_FAULT))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2050;
      double v14 = v3;
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"rangeForTransmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\"}", (uint8_t *)&v9, 0x1Cu);
      if (qword_1E929F670 != -1) {
        dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
      }
    }
    v6 = qword_1E929F678;
    if (os_signpost_enabled((os_log_t)qword_1E929F678))
    {
      int v9 = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 2050;
      double v14 = v3;
      _os_signpost_emit_with_name_impl(&dword_1906B8000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "rangeForTransmitPower: invalid range of transmit power", "{\"msg%{public}.0s\":\"rangeForTransmitPower: invalid range of transmit power\", \"transmitPower_dBm\":\"%{public}.6f\"}", (uint8_t *)&v9, 0x1Cu);
    }
    double v7 = 4.0;
    if (v3 >= 4.0) {
      double v7 = v3;
    }
    double v3 = fmin(v7, 20.0);
  }
  return sqrt(__exp10(v3 / 10.0) / 1000.0) * 199.526231;
}

+ (id)filterOutliers:(id)a3
{
  v5 = objc_alloc_init(CLReductiveFilterOptions);

  return (id)[a1 filterOutliers:a3 options:v5];
}

+ (id)filterOutliers:(id)a3 options:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLReductiveFilterSuite.m", 76, @"Invalid parameter not satisfying: %@", @"options");
  }
  [a1 rangeForReductiveFilterOptions:a4];
  double v8 = v7;
  if (![a3 count]) {
    return 0;
  }
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = (void *)[a3 reverseObjectEnumerator];
  uint64_t v9 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v83 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        uint64_t v14 = [v61 countByEnumeratingWithState:&v78 objects:v96 count:16];
        if (!v14) {
          goto LABEL_22;
        }
        uint64_t v15 = v14;
        char v16 = 0;
        uint64_t v17 = *(void *)v79;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v79 != v17) {
              objc_enumerationMutation(v61);
            }
            v19 = *(void **)(*((void *)&v78 + 1) + 8 * j);
            v20 = (void *)[v19 firstObject];
            [v13 distanceFromLocation:v20];
            double v22 = v21;
            [v13 horizontalAccuracy];
            double v24 = v22 - v23;
            [v20 horizontalAccuracy];
            double v26 = v24 - v25;
            objc_msgSend((id)objc_msgSend(v20, "timestamp"), "timeIntervalSince1970");
            double v28 = v27;
            objc_msgSend((id)objc_msgSend(v13, "timestamp"), "timeIntervalSince1970");
            if (v26 <= v8) {
              goto LABEL_18;
            }
            double v30 = v28 - v29;
            if (v30 < 5.0) {
              double v30 = 5.0;
            }
            if (fmax(v26, 0.0) / v30 <= 250.0)
            {
LABEL_18:
              [v19 insertObject:v13 atIndex:0];
              char v16 = 1;
            }
          }
          uint64_t v15 = [v61 countByEnumeratingWithState:&v78 objects:v96 count:16];
        }
        while (v15);
        if ((v16 & 1) == 0)
        {
LABEL_22:
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v31 addObject:v13];
          [v61 addObject:v31];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v82 objects:v97 count:16];
    }
    while (v10);
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v32 = [v61 countByEnumeratingWithState:&v74 objects:v95 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    v34 = 0;
    unint64_t v35 = 0;
    uint64_t v36 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v75 != v36) {
          objc_enumerationMutation(v61);
        }
        v38 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        if ([v38 count] > v35)
        {
          unint64_t v35 = [v38 count];
          v34 = v38;
        }
      }
      uint64_t v33 = [v61 countByEnumeratingWithState:&v74 objects:v95 count:16];
    }
    while (v33);
  }
  else
  {
    v34 = 0;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v57 = [v61 countByEnumeratingWithState:&v70 objects:v94 count:16];
  if (v57)
  {
    uint64_t v56 = *(void *)v71;
    id v59 = v34;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v71 != v56) {
          objc_enumerationMutation(v61);
        }
        uint64_t v58 = v39;
        v40 = *(void **)(*((void *)&v70 + 1) + 8 * v39);
        if (v34 == v40)
        {
          long long v68 = 0uLL;
          long long v69 = 0uLL;
          long long v66 = 0uLL;
          long long v67 = 0uLL;
          uint64_t v48 = [v34 countByEnumeratingWithState:&v66 objects:v93 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v67;
            do
            {
              uint64_t v51 = 0;
              do
              {
                if (*(void *)v67 != v50) {
                  objc_enumerationMutation(v59);
                }
                v52 = *(void **)(*((void *)&v66 + 1) + 8 * v51);
                if (qword_1E929F670 != -1) {
                  dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
                }
                v53 = qword_1E929F678;
                if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v54 = objc_msgSend((id)objc_msgSend(v52, "description"), "UTF8String");
                  *(_DWORD *)buf = 68289283;
                  int v88 = 0;
                  __int16 v89 = 2082;
                  v90 = "";
                  __int16 v91 = 2081;
                  uint64_t v92 = v54;
                  _os_log_impl(&dword_1906B8000, v53, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Selected location\", \"loc\":%{private, location:escape_only}s}", buf, 0x1Cu);
                }
                ++v51;
              }
              while (v49 != v51);
              uint64_t v49 = [v59 countByEnumeratingWithState:&v66 objects:v93 count:16];
            }
            while (v49);
          }
        }
        else
        {
          long long v64 = 0uLL;
          long long v65 = 0uLL;
          long long v62 = 0uLL;
          long long v63 = 0uLL;
          uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v86 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v63;
            do
            {
              uint64_t v44 = 0;
              do
              {
                if (*(void *)v63 != v43) {
                  objc_enumerationMutation(v40);
                }
                v45 = *(void **)(*((void *)&v62 + 1) + 8 * v44);
                if (qword_1E929F670 != -1) {
                  dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
                }
                v46 = qword_1E929F678;
                if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v47 = objc_msgSend((id)objc_msgSend(v45, "description"), "UTF8String");
                  *(_DWORD *)buf = 68289283;
                  int v88 = 0;
                  __int16 v89 = 2082;
                  v90 = "";
                  __int16 v91 = 2081;
                  uint64_t v92 = v47;
                  _os_log_impl(&dword_1906B8000, v46, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Removed location\", \"loc\":%{private, location:escape_only}s}", buf, 0x1Cu);
                }
                ++v44;
              }
              while (v42 != v44);
              uint64_t v42 = [v40 countByEnumeratingWithState:&v62 objects:v86 count:16];
            }
            while (v42);
          }
        }
        uint64_t v39 = v58 + 1;
        v34 = v59;
      }
      while (v58 + 1 != v57);
      uint64_t v57 = [v61 countByEnumeratingWithState:&v70 objects:v94 count:16];
    }
    while (v57);
  }
  return v34;
}

+ (id)deriveLocationFromLocations:(id)a3
{
  v5 = objc_alloc_init(CLReductiveFilterOptions);

  return (id)[a1 deriveLocationFromLocations:a3 options:v5];
}

+ (id)deriveLocationFromLocations:(id)a3 options:(id)a4
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"CLReductiveFilterSuite.m", 179, @"Invalid parameter not satisfying: %@", @"options");
  }
  id result = (id)[a3 count];
  if (!result) {
    return result;
  }
  [a1 rangeForReductiveFilterOptions:a4];
  double v9 = v8;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v10 = (void *)[a3 reverseObjectEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v85 objects:v116 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v86;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v86 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v85 + 1) + 8 * i) horizontalAccuracy];
        if (v15 <= 500.0)
        {
          int v16 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v85 objects:v116 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  int v16 = 0;
LABEL_14:
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v65 = a3;
  obuint64_t j = (id)[a3 reverseObjectEnumerator];
  uint64_t v17 = [obj countByEnumeratingWithState:&v81 objects:v115 count:16];
  if (!v17)
  {
    int v68 = 0;
    int v19 = 0;
    int v20 = 0;
    uint64_t v67 = 0;
    double v24 = 0.0;
    double v73 = 0.0;
    double v74 = 0.0;
    double v71 = 0.0;
    double v72 = 0.0;
    double v25 = 0.0;
    goto LABEL_41;
  }
  uint64_t v18 = v17;
  int v68 = 0;
  int v19 = 0;
  int v20 = 0;
  uint64_t v67 = 0;
  char v21 = 0;
  uint64_t v22 = *(void *)v82;
  char v23 = 1;
  double v24 = 0.0;
  double v73 = 0.0;
  double v74 = 0.0;
  double v71 = 0.0;
  double v72 = 0.0;
  double v25 = 0.0;
  double v66 = v9;
  while (2)
  {
    for (uint64_t j = 0; j != v18; ++j)
    {
      if (*(void *)v82 != v22) {
        objc_enumerationMutation(obj);
      }
      double v27 = *(void **)(*((void *)&v81 + 1) + 8 * j);
      if (v16)
      {
        [*(id *)(*((void *)&v81 + 1) + 8 * j) horizontalAccuracy];
        if (v28 > 500.0)
        {
          ++v68;
          continue;
        }
      }
      double v77 = v25;
      [v27 coordinate];
      double v30 = v29;
      [v27 coordinate];
      double v32 = v31;
      __double2 v33 = __sincos_stret(v30 * 0.0174532925);
      __double2 v34 = __sincos_stret(v32 * 0.0174532925);
      double v35 = 6378137.0 / sqrt(v33.__sinval * -0.00669437999 * v33.__sinval + 1.0);
      double v36 = v33.__cosval * (v35 + 0.0);
      double v37 = v34.__cosval * v36;
      double v75 = v33.__sinval * (v35 * 0.99330562 + 0.0);
      double v76 = v34.__sinval * v36;
      [v27 horizontalAccuracy];
      double v39 = v38;
      [a4 biasRateInMeasurement];
      double v41 = v40;
      [v27 horizontalAccuracy];
      double v43 = v42;
      [a4 biasRateInMeasurement];
      double v45 = v44;
      [v27 horizontalAccuracy];
      if (v23)
      {
        double v47 = v46;
        uint64_t v67 = [v27 timestamp];
LABEL_27:
        char v23 = 0;
        char v21 = 0;
        double v52 = 1.0 / ((v9 + v39) * (v9 + v39));
        ++v20;
        double v71 = v71 + v37 * v52;
        double v72 = v72 + v76 * v52;
        double v73 = v73 + v75 * v52;
        double v74 = v74 + v41 * v43 * v52;
        double v24 = v24 + (1.0 - v45) * v47 * ((1.0 - v45) * v47) * (v52 * v52);
        double v25 = v77 + v52;
        continue;
      }
      if (v77 <= 0.0)
      {
        if (qword_1E929F670 != -1) {
          dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
        }
        v53 = qword_1E929F678;
        if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906B8000, v53, OS_LOG_TYPE_FAULT, "Reductive filtering: Sum of weights <= 0 after at least one point added.", buf, 2u);
        }
        if (sub_1906CB57C(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1E929F670 != -1) {
            dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
          }
          LOWORD(v80[0]) = 0;
          long long v64 = (char *)_os_log_send_and_compose_impl();
          sub_1906D4A28("Generic", 1, 0, 0, "+[CLReductiveFilterSuite deriveLocationFromLocations:options:]", "CoreLocation: %s\n", v64);
          if (v64 != (char *)buf) {
            free(v64);
          }
        }
        return 0;
      }
      double v47 = v46;
      double v70 = v24;
      double v48 = v9 + v74 / v77 + sqrt(v24 / (v77 * v77));
      [v27 horizontalAccuracy];
      double v50 = v49;
      [v27 horizontalAccuracy];
      if ((v76 - v72 / v77) * (v76 - v72 / v77)
         + (v37 - v71 / v77) * (v37 - v71 / v77)
         + (v75 - v73 / v77) * (v75 - v73 / v77) < (v48 * v48 + v50 * v51) * 2.9957)
      {
        double v9 = v66;
        double v24 = v70;
        goto LABEL_27;
      }
      ++v19;
      if (v21)
      {
        double v9 = v66;
        double v24 = v70;
        double v25 = v77;
        goto LABEL_41;
      }
      char v23 = 0;
      char v21 = 1;
      double v9 = v66;
      double v24 = v70;
      double v25 = v77;
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v81 objects:v115 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_41:
  double v79 = 0.0;
  v80[0] = 0.0;
  uint64_t v78 = 0;
  sub_190804D0C(v80, &v79, (double *)&v78, v71 / v25, v72 / v25, v73 / v25);
  double v54 = v25;
  double v56 = v79;
  double v55 = v80[0];
  double v57 = v74 / v54 + sqrt(v24 / (v54 * v54));
  id v58 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v58 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSS"];
  if (qword_1E929F670 != -1) {
    dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
  }
  id v59 = qword_1E929F678;
  if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEBUG))
  {
    int v60 = [v65 count];
    [a4 transmitPower];
    uint64_t v62 = v61;
    uint64_t v63 = objc_msgSend((id)objc_msgSend(v58, "stringFromDate:", v67), "UTF8String");
    *(_DWORD *)buf = 68291843;
    int v90 = 0;
    __int16 v91 = 2082;
    uint64_t v92 = "";
    __int16 v93 = 1026;
    int v94 = v60;
    __int16 v95 = 1026;
    int v96 = v19;
    __int16 v97 = 1026;
    int v98 = v20;
    __int16 v99 = 2050;
    uint64_t v100 = v62;
    __int16 v101 = 2050;
    double v102 = v9;
    __int16 v103 = 2049;
    double v104 = v55;
    __int16 v105 = 2049;
    double v106 = v56;
    __int16 v107 = 2049;
    double v108 = v9 + v57;
    __int16 v109 = 2082;
    uint64_t v110 = v63;
    __int16 v111 = 1026;
    int v112 = v16;
    __int16 v113 = 1026;
    int v114 = v68;
    _os_log_impl(&dword_1906B8000, v59, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Reductive filtering\", \"input\":%{public}d, \"outliers\":%{public}d, \"used\":%{public}d, \"transmitPower\":\"%{public}.6f\", \"rangeOfBeacon\":\"%{public}.6f\", \"lat\":\"%{private}f\", \"lon\":\"%{private}f\", \"hunc\":\"%{private}f\", \"timestamp\":%{public, location:escape_only}s, \"isAccurateLocationAvailable\":%{public}hhd, \"filtered\":%{public}d}", buf, 0x6Cu);
  }
  return -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:]([CLLocation alloc], "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v67, v55, v56, 0.0, v9 + v57, -1.0);
}

+ (id)applyFilterToLocationObservations:(id)a3 options:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return 0;
  }
  v33[0] = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  uint64_t v6 = objc_msgSend(a3, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1));
  uint64_t v7 = [a3 count];
  id v8 = +[CLReductiveFilterSuite filterOutliers:v6 options:a4];
  uint64_t v9 = [v8 count];
  id v10 = +[CLReductiveFilterSuite deriveLocationFromLocations:v8 options:a4];
  if (qword_1E929F670 != -1) {
    dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
  }
  uint64_t v11 = qword_1E929F678;
  if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [a4 beaconType];
    [a4 transmitPower];
    uint64_t v14 = v13;
    [a4 biasRateInMeasurement];
    uint64_t v16 = v15;
    [a4 applyRangeEstimation];
    int v21 = 68290050;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2050;
    uint64_t v26 = v12;
    __int16 v27 = 2050;
    uint64_t v28 = v14;
    __int16 v29 = 2050;
    uint64_t v30 = v16;
    __int16 v31 = 1026;
    BOOL v32 = v17 != 0.0;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - options\", \"beaconType\":%{public}lu, \"transmitPower\":\"%{public}.6f\", \"biasRate\":\"%{public}.6f\", \"applyRangeEstimation\":%{public}hhd}", (uint8_t *)&v21, 0x36u);
    if (qword_1E929F670 != -1) {
      dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
    }
  }
  uint64_t v18 = qword_1E929F678;
  if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    int v21 = 68289795;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2050;
    uint64_t v26 = v7;
    __int16 v27 = 2050;
    uint64_t v28 = v9;
    __int16 v29 = 2081;
    uint64_t v30 = v19;
    _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - location observations\", \"countInput\":%{public}lu, \"countFiltered\":%{public}lu, \"loc\":%{private, location:escape_only}s}", (uint8_t *)&v21, 0x30u);
  }
  return v10;
}

+ (id)applyFilterToLocationTrace:(id)a3 options:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    return 0;
  }
  [a4 setBiasRateInMeasurement:1.0];
  [a4 setApplyRangeEstimation:0.0];
  v33[0] = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  uint64_t v6 = objc_msgSend(a3, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v33, 1));
  uint64_t v7 = [a3 count];
  id v8 = +[CLReductiveFilterSuite filterOutliers:v6 options:a4];
  uint64_t v9 = [v8 count];
  id v10 = +[CLReductiveFilterSuite deriveLocationFromLocations:v8 options:a4];
  if (qword_1E929F670 != -1) {
    dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
  }
  uint64_t v11 = qword_1E929F678;
  if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [a4 beaconType];
    [a4 transmitPower];
    uint64_t v14 = v13;
    [a4 biasRateInMeasurement];
    uint64_t v16 = v15;
    [a4 applyRangeEstimation];
    int v21 = 68290050;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2050;
    uint64_t v26 = v12;
    __int16 v27 = 2050;
    uint64_t v28 = v14;
    __int16 v29 = 2050;
    uint64_t v30 = v16;
    __int16 v31 = 1026;
    BOOL v32 = v17 != 0.0;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - options\", \"beaconType\":%{public}lu, \"transmitPower\":\"%{public}.6f\", \"biasRate\":\"%{public}.6f\", \"applyRangeEstimation\":%{public}hhd}", (uint8_t *)&v21, 0x36u);
    if (qword_1E929F670 != -1) {
      dispatch_once(&qword_1E929F670, &unk_1EE0058C0);
    }
  }
  uint64_t v18 = qword_1E929F678;
  if (os_log_type_enabled((os_log_t)qword_1E929F678, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
    int v21 = 68289795;
    int v22 = 0;
    __int16 v23 = 2082;
    double v24 = "";
    __int16 v25 = 2050;
    uint64_t v26 = v7;
    __int16 v27 = 2050;
    uint64_t v28 = v9;
    __int16 v29 = 2081;
    uint64_t v30 = v19;
    _os_log_impl(&dword_1906B8000, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Reductive filtering - location trace\", \"countInput\":%{public}lu, \"countFiltered\":%{public}lu, \"loc\":%{private, location:escape_only}s}", (uint8_t *)&v21, 0x30u);
  }
  return v10;
}

@end