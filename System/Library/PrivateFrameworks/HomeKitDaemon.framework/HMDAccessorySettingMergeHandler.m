@interface HMDAccessorySettingMergeHandler
+ (BOOL)_extractMinMaxStep:(id)a3 minConstraint:(id *)a4 maxConstraint:(id *)a5 stepConstraint:(id *)a6 first:(id)a7;
+ (BOOL)_isNumber:(id)a3 betweenStart:(id)a4 andEnd:(id)a5 first:(id)a6;
+ (BOOL)mergeFirst:(id)a3 second:(id)a4 mergeStrategy:(id)a5 shouldAddMissing:(BOOL)a6;
+ (id)_mergeFirst:(id)a3 second:(id)a4 mergedConstraints:(id)a5 mergeStrategy:(id)a6;
+ (id)_mergeRangeConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5;
+ (id)_mergeValidValueConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5;
@end

@implementation HMDAccessorySettingMergeHandler

+ (id)_mergeValidValueConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = [v7 constraints];
  v11 = [v9 setWithArray:v10];
  v12 = (void *)[v11 mutableCopy];

  v13 = (void *)MEMORY[0x263EFFA08];
  v14 = [v8 constraints];
  v15 = [v13 setWithArray:v14];
  v16 = (void *)[v15 mutableCopy];

  v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = v7;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    int v31 = 138543874;
    v32 = v20;
    __int16 v33 = 2048;
    uint64_t v34 = [v12 count];
    __int16 v35 = 2048;
    uint64_t v36 = [v16 count];
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Valid value constraints: this: %lu, second: %lu", (uint8_t *)&v31, 0x20u);
  }
  if (v5)
  {
    v21 = (void *)MEMORY[0x230FBD990]([v12 unionSet:v16]);
    id v22 = v18;
    v23 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    v24 = HMFGetLogIdentifier();
    uint64_t v25 = [v12 count];
    int v31 = 138543618;
    v32 = v24;
    __int16 v33 = 2048;
    uint64_t v34 = v25;
    v26 = "%{public}@Combined: %lu";
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]([v12 intersectSet:v16]);
    id v27 = v18;
    v23 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    v24 = HMFGetLogIdentifier();
    uint64_t v28 = [v12 count];
    int v31 = 138543618;
    v32 = v24;
    __int16 v33 = 2048;
    uint64_t v34 = v28;
    v26 = "%{public}@Intersected: %lu";
  }
  _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v31, 0x16u);

LABEL_9:
  v29 = [v12 allObjects];

  return v29;
}

+ (BOOL)_extractMinMaxStep:(id)a3 minConstraint:(id *)a4 maxConstraint:(id *)a5 stepConstraint:(id *)a6 first:(id)a7
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a7;
  v12 = v11;
  if (!a4 || !a5 || !a6)
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = v12;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot return result in invalid data", buf, 0xCu);
    }
    goto LABEL_28;
  }
  __int16 v35 = v11;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v19 = [v18 type];
        v20 = a4;
        if (v19 != 1)
        {
          if (v19 == 3)
          {
            v20 = a6;
          }
          else
          {
            v20 = a5;
            if (v19 != 2) {
              continue;
            }
          }
        }
        v21 = [v18 value];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v22 = v21;
        }
        else {
          id v22 = 0;
        }
        id v23 = v22;

        id *v20 = v23;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v15);
  }

  if (!*a4 || !*a5 || !*a6)
  {
    uint64_t v25 = (void *)MEMORY[0x230FBD990]();
    v12 = v35;
    id v29 = v35;
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      id v31 = *a4;
      id v32 = *a5;
      id v33 = *a6;
      *(_DWORD *)buf = 138544130;
      v42 = v30;
      __int16 v43 = 2112;
      id v44 = v31;
      __int16 v45 = 2112;
      id v46 = v32;
      __int16 v47 = 2112;
      id v48 = v33;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find min %@ or max %@ or step %@", buf, 0x2Au);
    }
LABEL_28:

    BOOL v24 = 0;
    goto LABEL_29;
  }
  BOOL v24 = 1;
  v12 = v35;
LABEL_29:

  return v24;
}

+ (id)_mergeRangeConstraintsFirst:(id)a3 second:(id)a4 shouldAddMissing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 constraints];
  id v10 = (void *)[v9 copy];
  id v86 = 0;
  id v87 = 0;
  id v85 = 0;
  BOOL v11 = +[HMDAccessorySettingMergeHandler _extractMinMaxStep:v10 minConstraint:&v87 maxConstraint:&v86 stepConstraint:&v85 first:v7];
  id v81 = v87;
  id v80 = v86;
  id v12 = v85;

  if (!v11)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = v7;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      v17 = [v14 constraints];
      *(_DWORD *)buf = 138543618;
      v89 = v16;
      __int16 v90 = 2112;
      double v91 = *(double *)&v17;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Cannot extract min, max and step from this setting's constraints %@", buf, 0x16u);
    }
    if (!v5)
    {
      v60 = 0;
      id v18 = v8;
      goto LABEL_51;
    }
  }
  id v18 = v8;
  uint64_t v19 = [v8 constraints];
  v20 = (void *)[v19 copy];
  id v83 = 0;
  id v84 = 0;
  id v82 = 0;
  BOOL v21 = +[HMDAccessorySettingMergeHandler _extractMinMaxStep:v20 minConstraint:&v84 maxConstraint:&v83 stepConstraint:&v82 first:v7];
  id v22 = v84;
  id v23 = v83;
  id v79 = v82;

  if (!v21)
  {
    v61 = (void *)MEMORY[0x230FBD990]();
    id v62 = v7;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v89 = v64;
      v65 = "%{public}@Cannot extract min, max and step from second setting's constraints";
LABEL_47:
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, v65, buf, 0xCu);
    }
LABEL_48:

    goto LABEL_49;
  }
  if (!v22 || !v23 || !v79)
  {
    v61 = (void *)MEMORY[0x230FBD990]();
    id v62 = v7;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v89 = v64;
      v65 = "%{public}@second min, max or step is nil";
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  if (v5)
  {
    if (!v81)
    {
      BOOL v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = v7;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v27;
        __int16 v90 = 2112;
        double v91 = *(double *)&v8;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Taking min constraint from %@", buf, 0x16u);
      }
      id v81 = v22;
      id v18 = v8;
    }
    if (!v80)
    {
      uint64_t v28 = (void *)MEMORY[0x230FBD990]();
      id v29 = v7;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v31;
        __int16 v90 = 2112;
        double v91 = *(double *)&v8;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Taking max constraint from %@", buf, 0x16u);
      }
      id v80 = v23;
      id v18 = v8;
    }
    if (!v12)
    {
      id v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = v7;
      uint64_t v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        __int16 v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v35;
        __int16 v90 = 2112;
        double v91 = *(double *)&v18;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Taking step constraint from %@", buf, 0x16u);
      }
      id v12 = v79;
    }
  }
  if (v81 && v80 && v12) {
    goto LABEL_28;
  }
  uint64_t v36 = (void *)MEMORY[0x230FBD990]();
  id v37 = v7;
  long long v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    long long v39 = v75 = v36;
    *(_DWORD *)buf = 138543362;
    v89 = v39;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Min, max or step is nil", buf, 0xCu);

    uint64_t v36 = v75;
  }

  if (v5)
  {
LABEL_28:
    v73 = [MEMORY[0x263EFF980] array];
    if ([v81 compare:v22] == -1) {
      long long v40 = v22;
    }
    else {
      long long v40 = v81;
    }
    id v41 = v40;
    if ([v12 compare:v79] == -1) {
      v42 = v79;
    }
    else {
      v42 = v12;
    }
    id v76 = v42;
    id v74 = v23;
    if ([v80 compare:v23] == -1) {
      __int16 v43 = v80;
    }
    else {
      __int16 v43 = v23;
    }
    id v44 = v43;
    __int16 v45 = (void *)MEMORY[0x230FBD990]();
    id v46 = a1;
    __int16 v47 = HMFGetOSLogHandle();
    v78 = v44;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      id v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v89 = v48;
      __int16 v90 = 2112;
      double v91 = *(double *)&v41;
      __int16 v92 = 2112;
      id v93 = v76;
      __int16 v94 = 2112;
      v95 = v78;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Chosen min: %@, step: %@, max: %@", buf, 0x2Au);

      id v44 = v78;
    }

    [v44 doubleValue];
    double v50 = v49;
    uint64_t v51 = [v41 doubleValue];
    double v53 = v50 - v52;
    if (v53 <= 0.0)
    {
      id v67 = v41;
      v68 = (void *)MEMORY[0x230FBD990](v51);
      id v69 = v46;
      v70 = HMFGetOSLogHandle();
      id v23 = v74;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v71;
        __int16 v90 = 2048;
        double v91 = v53;
        v72 = "%{public}@Chosen max constraint is not compatible with min constraint: %lf";
LABEL_58:
        _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_ERROR, v72, buf, 0x16u);
      }
    }
    else
    {
      v54 = [NSNumber numberWithDouble:v53];
      BOOL v55 = compareCharacteristicValue(v76, v54, (void *)1, &unk_26E476808);

      id v23 = v74;
      if (v55)
      {
        v56 = (void *)[objc_alloc(MEMORY[0x263F0E038]) initWithType:1 value:v41];
        v57 = v73;
        [v73 addObject:v56];

        v58 = (void *)[objc_alloc(MEMORY[0x263F0E038]) initWithType:3 value:v76];
        [v73 addObject:v58];

        id v18 = v8;
        v59 = (void *)[objc_alloc(MEMORY[0x263F0E038]) initWithType:2 value:v78];
        [v73 addObject:v59];

        v60 = (void *)[v73 copy];
LABEL_60:

        goto LABEL_50;
      }
      id v67 = v41;
      v68 = (void *)MEMORY[0x230FBD990]();
      id v69 = v46;
      v70 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v71;
        __int16 v90 = 2048;
        double v91 = v53;
        v72 = "%{public}@New max-min cannot fit in the new step value: %lf";
        goto LABEL_58;
      }
    }

    v60 = 0;
    v57 = v73;
    id v41 = v67;
    goto LABEL_60;
  }
LABEL_49:
  v60 = 0;
LABEL_50:

LABEL_51:
  return v60;
}

+ (BOOL)_isNumber:(id)a3 betweenStart:(id)a4 andEnd:(id)a5 first:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = v12;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Given value is nil, cannot determine whether within the range", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_10;
  }
  if ([v10 compare:v9] != -1 && objc_msgSend(v10, "compare:", v9)
    || [v9 compare:v11] != -1 && objc_msgSend(v9, "compare:", v11))
  {
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

+ (id)_mergeFirst:(id)a3 second:(id)a4 mergedConstraints:(id)a5 mergeStrategy:(id)a6
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  id v14 = [v10 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  __int16 v90 = v15;

  uint64_t v16 = [v11 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  id v94 = 0;
  id v95 = 0;
  id v93 = 0;
  char v19 = [a1 _extractMinMaxStep:v12 minConstraint:&v95 maxConstraint:&v94 stepConstraint:&v93 first:v10];
  v20 = (__CFString *)v95;
  __int16 v92 = (__CFString *)v94;
  id v91 = v93;
  if (v19)
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = v10;
    id v23 = HMFGetOSLogHandle();
    BOOL v24 = v23;
    v89 = v20;
    if (!v20 || !v92 || !v91)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = long long v39 = v18;
        *(_DWORD *)buf = 138543362;
        v97 = v40;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Min, max or step is nil", buf, 0xCu);

        id v18 = v39;
      }

LABEL_20:
      long long v38 = 0;
LABEL_80:
      v20 = v89;
      goto LABEL_81;
    }
    id v25 = v13;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v85 = v18;
      id v26 = v11;
      uint64_t v27 = HMFGetLogIdentifier();
      uint64_t v28 = v25;
      id v29 = (void *)v27;
      v30 = v28;
      unint64_t v31 = [v28 strategy];
      if (v31 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDAccessorySettingMergeStrategyType %tu", v31);
        id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v32 = off_264A1B7D8[v31];
      }
      *(_DWORD *)buf = 138543618;
      v97 = v29;
      __int16 v98 = 2112;
      v99 = v32;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Merge strategy is %@", buf, 0x16u);

      id v25 = v30;
      id v11 = v26;
      id v18 = v85;
    }

    uint64_t v41 = [v25 strategy];
    if (v41 == 4)
    {
      int v62 = [a1 _isNumber:v90 betweenStart:v89 andEnd:v92 first:v22];
      int v63 = [a1 _isNumber:v18 betweenStart:v89 andEnd:v92 first:v22];
      v64 = (void *)MEMORY[0x230FBD990]();
      id v51 = v22;
      double v52 = HMFGetOSLogHandle();
      BOOL v65 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v62 && v63)
      {
        if (v65)
        {
          v66 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v97 = v66;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Current values are within the merged range", buf, 0xCu);
        }
        id v87 = v18;
        uint64_t v67 = [(__CFString *)v90 compare:v18];
        v68 = (void *)MEMORY[0x230FBD990]();
        id v69 = v51;
        v70 = HMFGetOSLogHandle();
        BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
        id v13 = v25;
        if (v67 != -1)
        {
          if (v71)
          {
            v72 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v97 = v72;
            __int16 v98 = 2112;
            v99 = v90;
            _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@Retaining current value %@", buf, 0x16u);
          }
          long long v38 = v90;
          id v18 = v87;
          goto LABEL_80;
        }
        if (v71)
        {
          id v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v97 = v80;
          __int16 v98 = 2112;
          v99 = v87;
          _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@Choosing second setting's value %@", buf, 0x16u);
        }
        id v18 = v87;
        goto LABEL_71;
      }
      if (v62)
      {
        v73 = v64;
        id v13 = v25;
        if (v65)
        {
LABEL_52:
          id v74 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v97 = v74;
          __int16 v98 = 2112;
          v99 = v90;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Only current value %@ is within the merged range", buf, 0x16u);
        }
LABEL_53:

        v75 = v90;
LABEL_78:
        id v81 = v75;
        goto LABEL_79;
      }
      v77 = v64;
      id v13 = v25;
      if (!v63)
      {
        if (v65)
        {
          id v83 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v97 = v83;
          __int16 v98 = 2112;
          v99 = v92;
          _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Neither of the values are within the merged range, choosing the max %@", buf, 0x16u);
        }
        v75 = v92;
        goto LABEL_78;
      }
      if (v65) {
        goto LABEL_63;
      }
      goto LABEL_64;
    }
    if (v41 != 3)
    {
      if (v41 == 1)
      {
        long long v38 = [v25 conflictValue];
        v42 = (void *)MEMORY[0x230FBD990]();
        id v43 = v22;
        id v44 = HMFGetOSLogHandle();
        __int16 v45 = v44;
        if (v38)
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            id v46 = v86 = v18;
            *(_DWORD *)buf = 138543618;
            v97 = v46;
            __int16 v98 = 2112;
            v99 = v38;
            _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Using the conflict value %@ as a merged value", buf, 0x16u);

            id v18 = v86;
          }
          id v13 = v25;

          __int16 v47 = v38;
        }
        else
        {
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v76 = v88 = v18;
            *(_DWORD *)buf = 138543362;
            v97 = v76;
            _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the conflict value", buf, 0xCu);

            id v18 = v88;
          }
          id v13 = v25;
        }

        goto LABEL_80;
      }
      id v13 = v25;
      goto LABEL_20;
    }
    int v48 = [a1 _isNumber:v90 betweenStart:v89 andEnd:v92 first:v22];
    int v49 = [a1 _isNumber:v18 betweenStart:v89 andEnd:v92 first:v22];
    double v50 = (void *)MEMORY[0x230FBD990]();
    id v51 = v22;
    double v52 = HMFGetOSLogHandle();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
    if (v48 && v49)
    {
      if (v53)
      {
        v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v97 = v54;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Current values are within the merged range", buf, 0xCu);
      }
      BOOL v55 = v18;
      uint64_t v56 = [(__CFString *)v90 compare:v18];
      v57 = (void *)MEMORY[0x230FBD990]();
      id v58 = v51;
      v59 = HMFGetOSLogHandle();
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_INFO);
      id v13 = v25;
      if (v56 == -1)
      {
        if (v60)
        {
          id v79 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v97 = v79;
          __int16 v98 = 2112;
          v99 = v90;
          _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Retaining current value %@", buf, 0x16u);
        }
        long long v38 = v90;
        id v18 = v55;
        goto LABEL_80;
      }
      if (v60)
      {
        v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v97 = v61;
        __int16 v98 = 2112;
        v99 = v55;
        _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Choosing second setting's value %@", buf, 0x16u);
      }
      id v18 = v55;
      goto LABEL_71;
    }
    if (v48)
    {
      v73 = v50;
      id v13 = v25;
      if (v53) {
        goto LABEL_52;
      }
      goto LABEL_53;
    }
    v77 = v50;
    id v13 = v25;
    if (v49)
    {
      if (v53)
      {
LABEL_63:
        v78 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v97 = v78;
        __int16 v98 = 2112;
        v99 = v18;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Only second setting's value %@ is within the merged range", buf, 0x16u);
      }
LABEL_64:

LABEL_71:
      id v81 = v18;
LABEL_79:
      long long v38 = v81;
      goto LABEL_80;
    }
    if (v53)
    {
      id v82 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v97 = v82;
      __int16 v98 = 2112;
      v99 = v89;
      _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Neither of the values are within the merged range, choosing the min %@", buf, 0x16u);
    }
    v20 = v89;
    long long v38 = v89;
  }
  else
  {
    id v33 = (void *)MEMORY[0x230FBD990]();
    id v34 = v10;
    __int16 v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = uint64_t v36 = v18;
      *(_DWORD *)buf = 138543618;
      v97 = v37;
      __int16 v98 = 2112;
      v99 = v12;
      _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot extract min, max and step from merged constraints %@", buf, 0x16u);

      id v18 = v36;
    }

    long long v38 = 0;
  }
LABEL_81:

  return v38;
}

+ (BOOL)mergeFirst:(id)a3 second:(id)a4 mergeStrategy:(id)a5 shouldAddMissing:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v207 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 value];
  id v14 = [v11 value];
  uint64_t v15 = [v10 type];
  if (v15 != [v11 type])
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = v10;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      uint64_t v27 = v186 = v13;
      [v21 type];
      HMAccessorySettingTypeToString();
      id v180 = v12;
      v29 = uint64_t v28 = v14;
      [v11 type];
      v30 = HMAccessorySettingTypeToString();
      *(_DWORD *)buf = 138543874;
      id v196 = v27;
      __int16 v197 = 2112;
      id v198 = v29;
      __int16 v199 = 2112;
      id v200 = v30;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Value types are not matching: self %@, second %@", buf, 0x20u);

      id v14 = v28;
      id v12 = v180;

      id v13 = v186;
    }
    goto LABEL_10;
  }
  v185 = v13;
  uint64_t v16 = [v10 name];
  v17 = [v11 name];
  char v18 = [v16 isEqualToString:v17];

  if (v18)
  {
    unint64_t v19 = [v10 type];
    if (!v12 && v19 <= 3)
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v10;
      id v22 = HMFGetOSLogHandle();
      id v13 = v185;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v196 = v23;
        BOOL v24 = "%{public}@No merge strategy, cannot merge";
        id v25 = v22;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
LABEL_7:
        _os_log_impl(&dword_22F52A000, v25, v26, v24, buf, 0xCu);
      }
LABEL_10:

LABEL_11:
      BOOL v31 = 0;
      goto LABEL_15;
    }
    id v13 = v185;
    switch([v10 type])
    {
      case 0:
        v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = v10;
        id v22 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v196 = v23;
        BOOL v24 = "%{public}@Setting type is unknown, cannot merge";
        id v25 = v22;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        goto LABEL_7;
      case 1:
      case 3:
        uint64_t v41 = (void *)MEMORY[0x230FBD990]();
        id v42 = v10;
        id v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          id v44 = HMFGetLogIdentifier();
          [v42 type];
          __int16 v45 = HMAccessorySettingTypeToString();
          *(_DWORD *)buf = 138543618;
          id v196 = v44;
          __int16 v197 = 2112;
          id v198 = v45;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting type is %@, keeping the values", buf, 0x16u);

          id v13 = v185;
        }

        goto LABEL_64;
      case 2:
        id v46 = +[HMDAccessorySettingMergeHandler _mergeRangeConstraintsFirst:v10 second:v11 shouldAddMissing:v6];
        if (v46)
        {
          id v47 = v185;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v48 = v47;
          }
          else {
            int v48 = 0;
          }
          id v49 = v48;

          v170 = v14;
          id v50 = v49;
          id v51 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            double v52 = v51;
          }
          else {
            double v52 = 0;
          }
          id v53 = v52;

          v54 = (void *)MEMORY[0x230FBD990]();
          id v55 = v10;
          uint64_t v56 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            v57 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v196 = v57;
            __int16 v197 = 2112;
            id v198 = v50;
            __int16 v199 = 2112;
            id v200 = v53;
            _os_log_impl(&dword_22F52A000, v56, OS_LOG_TYPE_INFO, "%{public}@Comparing the values: self %@, second %@", buf, 0x20u);
          }
          id obj = v53;
          v181 = v50;
          if ((HMFEqualObjects() & 1) == 0)
          {
            id v58 = (void *)MEMORY[0x230FBD990]();
            id v59 = v55;
            BOOL v60 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              v61 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              id v196 = v61;
              _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_INFO, "%{public}@Values are not matching, going to compute the value", buf, 0xCu);
            }
            uint64_t v62 = +[HMDAccessorySettingMergeHandler _mergeFirst:v59 second:v11 mergedConstraints:v46 mergeStrategy:v12];
            if (!v62)
            {
              v159 = (void *)MEMORY[0x230FBD990]();
              id v160 = v59;
              v161 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
              {
                v162 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                id v196 = v162;
                _os_log_impl(&dword_22F52A000, v161, OS_LOG_TYPE_ERROR, "%{public}@Cannot come up with the merged value", buf, 0xCu);
              }
              BOOL v31 = 0;
              id v14 = v170;
              id v13 = v185;
              goto LABEL_103;
            }
            int v63 = (void *)v62;
            v64 = [v59 value];
            char v65 = HMFEqualObjects();

            if ((v65 & 1) == 0)
            {
              v66 = (void *)MEMORY[0x230FBD990]();
              id v67 = v59;
              v68 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                id v69 = HMFGetLogIdentifier();
                [v67 value];
                v70 = id v173 = v66;
                *(_DWORD *)buf = 138543874;
                id v196 = v69;
                __int16 v197 = 2112;
                id v198 = v70;
                __int16 v199 = 2112;
                id v200 = v63;
                _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Updating the value from %@ to %@", buf, 0x20u);

                v66 = v173;
              }

              [v67 setValue:v63];
            }
          }
          BOOL v71 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
          v72 = (void *)MEMORY[0x263EFFA08];
          v73 = [v55 constraints];
          id v74 = [v72 setWithArray:v73];
          char v75 = [v71 isEqualToSet:v74];

          if (v75)
          {
            BOOL v31 = 1;
            id v13 = v185;
            id v14 = v170;
          }
          else
          {
            v125 = (void *)MEMORY[0x230FBD990]();
            id v126 = v55;
            v127 = HMFGetOSLogHandle();
            id v13 = v185;
            if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
            {
              v163 = HMFGetLogIdentifier();
              v128 = [MEMORY[0x263EFFA08] setWithArray:v46];
              v169 = v125;
              v129 = (void *)MEMORY[0x263EFFA08];
              v165 = [v126 constraints];
              v130 = [v129 setWithArray:v165];
              v131 = (void *)MEMORY[0x263EFFA08];
              v132 = [v11 constraints];
              v133 = [v131 setWithArray:v132];
              *(_DWORD *)buf = 138544130;
              id v196 = v163;
              __int16 v197 = 2112;
              id v198 = v128;
              __int16 v199 = 2112;
              id v200 = v130;
              __int16 v201 = 2112;
              v202 = v133;
              _os_log_impl(&dword_22F52A000, v127, OS_LOG_TYPE_INFO, "%{public}@Numerical Constraints are not matching (merged: %@) (first: %@), (second: %@) updating the constraints", buf, 0x2Au);

              id v13 = v185;
              v125 = v169;
            }
            [v126 setConstraints:v46];
            BOOL v31 = 1;
            id v14 = v170;
          }
LABEL_103:

          goto LABEL_104;
        }
        v117 = (void *)MEMORY[0x230FBD990]();
        id v118 = v10;
        v119 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          v120 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v196 = v120;
          _os_log_impl(&dword_22F52A000, v119, OS_LOG_TYPE_ERROR, "%{public}@Merged constraints is invalid, cannot merge this setting", buf, 0xCu);
        }
        BOOL v31 = 0;
        id v13 = v185;
LABEL_104:

        break;
      case 4:
        id v76 = +[HMDAccessorySettingMergeHandler _mergeValidValueConstraintsFirst:v10 second:v11 shouldAddMissing:v6];
        v77 = (void *)MEMORY[0x230FBD990]();
        id v78 = v10;
        id v79 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          id v80 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v196 = v80;
          __int16 v197 = 2112;
          id v198 = v76;
          _os_log_impl(&dword_22F52A000, v79, OS_LOG_TYPE_INFO, "%{public}@Setting type is selection, merged constraints: %@", buf, 0x16u);
        }
        uint64_t v81 = [v76 count];
        BOOL v31 = v81 != 0;
        v168 = v76;
        if (v81)
        {
          v182 = v78;
          v171 = v14;
          long long v193 = 0u;
          long long v194 = 0u;
          long long v191 = 0u;
          long long v192 = 0u;
          id obja = v76;
          uint64_t v82 = [obja countByEnumeratingWithState:&v191 objects:v206 count:16];
          if (!v82) {
            goto LABEL_53;
          }
          uint64_t v83 = v82;
          uint64_t v84 = *(void *)v192;
          while (1)
          {
            for (uint64_t i = 0; i != v83; ++i)
            {
              if (*(void *)v192 != v84) {
                objc_enumerationMutation(obja);
              }
              id v86 = [*(id *)(*((void *)&v191 + 1) + 8 * i) value];
              id v87 = [v182 value];
              char v88 = HMFEqualObjects();

              if (v88)
              {
                uint64_t v105 = [v182 value];

                if (!v105) {
                  goto LABEL_66;
                }
                goto LABEL_90;
              }
            }
            uint64_t v83 = [obja countByEnumeratingWithState:&v191 objects:v206 count:16];
            if (!v83)
            {
LABEL_53:

LABEL_66:
              v106 = (void *)MEMORY[0x230FBD990]();
              id v107 = v182;
              v108 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
              {
                v109 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                id v196 = v109;
                _os_log_impl(&dword_22F52A000, v108, OS_LOG_TYPE_INFO, "%{public}@Did not find first's selection in merged list", buf, 0xCu);
              }
              v164 = v107;

              long long v189 = 0u;
              long long v190 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              id v175 = obja;
              uint64_t v110 = [v175 countByEnumeratingWithState:&v187 objects:v205 count:16];
              if (!v110)
              {
LABEL_76:

                goto LABEL_87;
              }
              uint64_t v111 = v110;
              uint64_t v112 = *(void *)v188;
LABEL_70:
              uint64_t v113 = 0;
              while (1)
              {
                if (*(void *)v188 != v112) {
                  objc_enumerationMutation(v175);
                }
                v114 = [*(id *)(*((void *)&v187 + 1) + 8 * v113) value];
                v115 = [v11 value];
                char v116 = HMFEqualObjects();

                if (v116) {
                  break;
                }
                if (v111 == ++v113)
                {
                  uint64_t v111 = [v175 countByEnumeratingWithState:&v187 objects:v205 count:16];
                  if (!v111) {
                    goto LABEL_76;
                  }
                  goto LABEL_70;
                }
              }
              uint64_t v105 = [v11 value];

              if (!v105)
              {
LABEL_87:
                v134 = (void *)MEMORY[0x230FBD990]();
                id v135 = v164;
                v136 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
                {
                  v137 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  id v196 = v137;
                  _os_log_impl(&dword_22F52A000, v136, OS_LOG_TYPE_INFO, "%{public}@Did not find second's selection in merged list, updating the selected value to nil", buf, 0xCu);
                }
                uint64_t v105 = 0;
              }
LABEL_90:
              v138 = v182;
              v139 = [v182 value];
              char v140 = HMFEqualObjects();

              id v176 = (id)v105;
              if ((v140 & 1) == 0)
              {
                v141 = (void *)MEMORY[0x230FBD990]();
                id v142 = v182;
                v143 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v144 = v166 = v141;
                  v145 = [v142 value];
                  *(_DWORD *)buf = 138543874;
                  id v196 = v144;
                  __int16 v197 = 2112;
                  id v198 = v145;
                  __int16 v199 = 2112;
                  id v200 = v176;
                  _os_log_impl(&dword_22F52A000, v143, OS_LOG_TYPE_INFO, "%{public}@Updating the value from %@ to %@", buf, 0x20u);

                  uint64_t v105 = (uint64_t)v176;
                  v141 = v166;
                }

                [v142 setValue:v105];
                v138 = v182;
              }
              v146 = [MEMORY[0x263EFFA08] setWithArray:obja];
              v147 = (void *)MEMORY[0x263EFFA08];
              v148 = [v138 constraints];
              v149 = [v147 setWithArray:v148];
              char v150 = [v146 isEqualToSet:v149];

              v151 = v176;
              if ((v150 & 1) == 0)
              {
                v152 = (void *)MEMORY[0x230FBD990]();
                id v153 = v138;
                v154 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
                {
                  v155 = HMFGetLogIdentifier();
                  [MEMORY[0x263EFFA08] setWithArray:obja];
                  v156 = v184 = v152;
                  v157 = (void *)MEMORY[0x263EFFA08];
                  v167 = [v153 constraints];
                  v158 = [v157 setWithArray:v167];
                  *(_DWORD *)buf = 138543874;
                  id v196 = v155;
                  __int16 v197 = 2112;
                  id v198 = v156;
                  __int16 v199 = 2112;
                  id v200 = v158;
                  _os_log_impl(&dword_22F52A000, v154, OS_LOG_TYPE_INFO, "%{public}@Selection Constraints are not matching (merged: %@) (first: %@), updating the constraints", buf, 0x20u);

                  v151 = v176;
                  v152 = v184;
                }
                [v153 setConstraints:obja];
              }

              id v14 = v171;
              goto LABEL_99;
            }
          }
        }
        v121 = (void *)MEMORY[0x230FBD990]();
        id v122 = v78;
        v123 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          v124 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v196 = v124;
          _os_log_impl(&dword_22F52A000, v123, OS_LOG_TYPE_ERROR, "%{public}@There are no elements in the intersection of selection list", buf, 0xCu);
        }
LABEL_99:
        id v13 = v185;

        break;
      case 5:
        if ([v10 isConstraintMergeStrategyReflection]
          && [v11 isConstraintMergeStrategyReflection])
        {
          v89 = (void *)MEMORY[0x230FBD990]();
          id v90 = a1;
          id v91 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            id objb = (id)objc_claimAutoreleasedReturnValue();
            [v10 name];
            v172 = v14;
            id v174 = (id)objc_claimAutoreleasedReturnValue();
            [v10 constraints];
            __int16 v92 = v183 = v89;
            id v93 = [v11 name];
            id v94 = [v11 constraints];
            *(_DWORD *)buf = 138544386;
            id v196 = objb;
            __int16 v197 = 2112;
            id v198 = v174;
            __int16 v199 = 2112;
            id v200 = v92;
            __int16 v201 = 2112;
            v202 = v93;
            __int16 v203 = 2112;
            v204 = v94;
            _os_log_impl(&dword_22F52A000, v91, OS_LOG_TYPE_DEBUG, "%{public}@merge constraints first: %@, %@, second: %@, %@", buf, 0x34u);

            id v13 = v185;
            v89 = v183;

            id v14 = v172;
          }

          id v95 = [v11 constraints];
          [v10 mergeConstraintsFromOther:v95];
        }
        else
        {
          uint64_t v96 = [v10 constraints];
          unint64_t v97 = [v96 count];
          __int16 v98 = [v11 constraints];
          unint64_t v99 = [v98 count];

          if (v97 >= v99) {
            goto LABEL_64;
          }
          uint64_t v100 = (void *)MEMORY[0x230FBD990]();
          id v101 = v10;
          v102 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            v103 = HMFGetLogIdentifier();
            v104 = [v11 constraints];
            *(_DWORD *)buf = 138543618;
            id v196 = v103;
            __int16 v197 = 2112;
            id v198 = v104;
            _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_INFO, "%{public}@Updating constraints to %@", buf, 0x16u);

            id v13 = v185;
          }

          id v95 = [v11 constraints];
          [v101 setConstraints:v95];
        }

LABEL_64:
        BOOL v31 = 1;
        break;
      default:
        goto LABEL_11;
    }
  }
  else
  {
    id v32 = (void *)MEMORY[0x230FBD990]();
    id v33 = v10;
    id v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      __int16 v35 = HMFGetLogIdentifier();
      uint64_t v36 = [v33 name];
      [v11 name];
      id v37 = v12;
      v39 = long long v38 = v14;
      *(_DWORD *)buf = 138543874;
      id v196 = v35;
      __int16 v197 = 2112;
      id v198 = v36;
      __int16 v199 = 2112;
      id v200 = v39;
      _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting names are not matching: self %@, second %@", buf, 0x20u);

      id v14 = v38;
      id v12 = v37;
    }
    BOOL v31 = 0;
    id v13 = v185;
  }
LABEL_15:

  return v31;
}

@end