@interface HKMedicationDispenseRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKMedicationDispenseRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v143 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v121 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v120 = [v5 identifier];

  if (!v120)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v138 = (id)objc_opt_class();
      id v8 = v138;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v121 addObject:v9];
  }
  v100 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v120];
  v10 = [(__CFString *)v4 rulesVersion];
  uint64_t v11 = [v10 integerValue];

  if (v11 <= 0)
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v138 = v14;
      __int16 v139 = 2114;
      v140 = v4;
      id v15 = v14;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v16 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v121 addObject:v16];
  }
  id v132 = 0;
  v110 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v132];
  id v119 = v132;
  if (!v110 && v119)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v19;
      __int16 v139 = 2114;
      v140 = @"locale";
      __int16 v141 = 2114;
      id v142 = v119;
      id v20 = v19;
      _os_log_impl(&dword_232E63000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v119];
  }
  v99 = [(__CFString *)v4 country];
  id v131 = 0;
  v109 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v131];
  id v118 = v131;
  if (!v109 && v118)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v23;
      __int16 v139 = 2114;
      v140 = @"note";
      __int16 v141 = 2114;
      id v142 = v118;
      id v24 = v23;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v118];
  }
  id v130 = 0;
  v108 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v130];
  id v117 = v130;
  if (!v108 && v117)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v27;
      __int16 v139 = 2114;
      v140 = @"enteredInError";
      __int16 v141 = 2114;
      id v142 = v117;
      id v28 = v27;
      _os_log_impl(&dword_232E63000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v117];
  }
  v29 = [(__CFString *)v4 representedResource];
  unint64_t v97 = [v29 extractionHints];

  id v129 = 0;
  v30 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"medicationCodings" expectedClass:objc_opt_class() isArray:1 error:&v129];
  id v31 = v129;
  v101 = v31;
  if (v30 || !v31)
  {
    if (!v30)
    {
      v36 = [NSString stringWithFormat:@"Required value is nil, not creating valueMedicationCodings instance to avoid throwing exception"];
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08320];
      v135[0] = @"propertyName";
      v135[1] = v38;
      v136[0] = @"medicationCodings";
      v136[1] = v36;
      v39 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
      v40 = [v37 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v39];

      [v121 addObject:v40];
    }
  }
  else
  {
    _HKInitializeLogging();
    v32 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v34;
      __int16 v139 = 2114;
      v140 = @"medicationCodings";
      __int16 v141 = 2114;
      id v142 = v101;
      id v35 = v34;
      _os_log_impl(&dword_232E63000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v101];
  }
  id v102 = v30;
  id v128 = 0;
  v41 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"quantityDispensed" expectedClass:objc_opt_class() isArray:0 error:&v128];
  id v116 = v128;
  if (!v41 && v116)
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v44;
      __int16 v139 = 2114;
      v140 = @"quantityDispensed";
      __int16 v141 = 2114;
      id v142 = v116;
      id v45 = v44;
      _os_log_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v116];
  }
  id v103 = v41;
  id v127 = 0;
  v46 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"preparationDate" expectedClass:objc_opt_class() isArray:0 error:&v127];
  id v115 = v127;
  if (!v46 && v115)
  {
    _HKInitializeLogging();
    v47 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v49;
      __int16 v139 = 2114;
      v140 = @"preparationDate";
      __int16 v141 = 2114;
      id v142 = v115;
      id v50 = v49;
      _os_log_impl(&dword_232E63000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v115];
  }
  id v104 = v46;
  id v126 = 0;
  v51 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"handOverDate" expectedClass:objc_opt_class() isArray:0 error:&v126];
  id v114 = v126;
  if (!v51 && v114)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v54;
      __int16 v139 = 2114;
      v140 = @"handOverDate";
      __int16 v141 = 2114;
      id v142 = v114;
      id v55 = v54;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v114];
  }
  id v105 = v51;
  id v125 = 0;
  v56 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"dosages" expectedClass:objc_opt_class() isArray:1 error:&v125];
  id v113 = v125;
  if (!v56 && v113)
  {
    _HKInitializeLogging();
    v57 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v59;
      __int16 v139 = 2114;
      v140 = @"dosages";
      __int16 v141 = 2114;
      id v142 = v113;
      id v60 = v59;
      _os_log_impl(&dword_232E63000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v113];
  }
  id v106 = v56;
  id v124 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"earliestDosageDate" expectedClass:objc_opt_class() isArray:0 error:&v124];
  id v112 = v124;
  if (!v61 && v112)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v64;
      __int16 v139 = 2114;
      v140 = @"earliestDosageDate";
      __int16 v141 = 2114;
      id v142 = v112;
      id v65 = v64;
      _os_log_impl(&dword_232E63000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v112];
  }
  id v107 = v61;
  id v123 = 0;
  v66 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v123];
  id v111 = v123;
  if (!v66 && v111)
  {
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v68 = v67;
      v69 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v69;
      __int16 v139 = 2114;
      v140 = @"statusCoding";
      __int16 v141 = 2114;
      id v142 = v111;
      id v70 = v69;
      _os_log_impl(&dword_232E63000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v111];
  }
  id v71 = v66;
  id v122 = 0;
  v72 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"daysSupplyQuantity" expectedClass:objc_opt_class() isArray:0 error:&v122];
  id v73 = v122;
  v74 = v73;
  if (!v72 && v73)
  {
    _HKInitializeLogging();
    v75 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v76 = v75;
      v77 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v138 = v77;
      __int16 v139 = 2114;
      v140 = @"daysSupplyQuantity";
      __int16 v141 = 2114;
      id v142 = v74;
      id v78 = v77;
      _os_log_impl(&dword_232E63000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v121 addObject:v74];
  }
  id v79 = v72;
  if (![v121 count])
  {
    v87 = [(__CFString *)v4 representedResource];
    v88 = [v87 receivedDate];
    v89 = v88;
    if (v88)
    {
      id v90 = v88;
    }
    else
    {
      id v90 = [MEMORY[0x263EFF910] date];
    }
    v86 = v90;

    uint64_t v91 = [v108 BOOLValue];
    id v84 = [MEMORY[0x263F0A2D8] localDevice];
    v96 = [(__CFString *)v4 medicalRecordMetadata];
    v92 = [MEMORY[0x263F0A4F8] medicationDispenseRecordType];
    objc_msgSend(MEMORY[0x263F0A4F0], "medicationDispenseRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodings:quantityDispensed:preparationDate:handOverDate:dosages:earliestDosageDate:statusCoding:daysSupplyQuantity:", v92, v109, v91, v86, v100, v110, v11, v84, v96, v99, (v97 >> 2) & 1, v102, v103, v104, v105,
      v106,
      v107,
      v71,
    v85 = v79);
    v93 = [(__CFString *)v4 representedResource];
    v94 = [v93 firstSeenDate];
    [v85 _setCreationDate:v94];

    goto LABEL_76;
  }
  v80 = (void *)MEMORY[0x263F087E8];
  v133 = @"conversionErrors";
  id v134 = v121;
  v81 = [NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
  v82 = [v80 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v81];

  id v83 = v82;
  id v84 = v83;
  if (v83)
  {
    if (a4)
    {
      id v84 = v83;
      v85 = 0;
      *a4 = v84;
      v86 = v84;
      goto LABEL_76;
    }
    _HKLogDroppedError();
  }
  v85 = 0;
  v86 = v84;
LABEL_76:

  return v85;
}

@end