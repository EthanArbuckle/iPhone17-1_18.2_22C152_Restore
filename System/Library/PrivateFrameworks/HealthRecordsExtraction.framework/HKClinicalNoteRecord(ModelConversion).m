@interface HKClinicalNoteRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKClinicalNoteRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v151 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v126 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v125 = [v5 identifier];

  if (!v125)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v146 = (id)objc_opt_class();
      id v8 = v146;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v126 addObject:v9];
  }
  v105 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v125];
  v10 = [(__CFString *)v4 rulesVersion];
  uint64_t v106 = [v10 integerValue];

  if (v106 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v146 = v13;
      __int16 v147 = 2114;
      v148 = v4;
      id v14 = v13;
      _os_log_impl(&dword_232E63000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v15 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v126 addObject:v15];
  }
  id v136 = 0;
  v117 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v136];
  id v123 = v136;
  if (!v117 && v123)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v18;
      __int16 v147 = 2114;
      v148 = @"locale";
      __int16 v149 = 2114;
      id v150 = v123;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v123];
  }
  v104 = [(__CFString *)v4 country];
  id v135 = 0;
  v116 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v135];
  id v122 = v135;
  if (!v116 && v122)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v22;
      __int16 v147 = 2114;
      v148 = @"note";
      __int16 v149 = 2114;
      id v150 = v122;
      id v23 = v22;
      _os_log_impl(&dword_232E63000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v122];
  }
  id v134 = 0;
  v115 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v134];
  id v121 = v134;
  if (!v115 && v121)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v26;
      __int16 v147 = 2114;
      v148 = @"enteredInError";
      __int16 v149 = 2114;
      id v150 = v121;
      id v27 = v26;
      _os_log_impl(&dword_232E63000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v121];
  }
  v28 = [(__CFString *)v4 representedResource];
  unint64_t v102 = [v28 extractionHints];

  id v133 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v133];
  id v30 = v133;
  v109 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      v35 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v143[0] = @"propertyName";
      v143[1] = v37;
      v144[0] = @"statusCoding";
      v144[1] = v35;
      v38 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:2];
      v39 = [v36 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v38];

      [v126 addObject:v39];
    }
  }
  else
  {
    _HKInitializeLogging();
    v31 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v33;
      __int16 v147 = 2114;
      v148 = @"statusCoding";
      __int16 v149 = 2114;
      id v150 = v109;
      id v34 = v33;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v109];
  }
  id v110 = v29;
  id v132 = 0;
  v40 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"documentTypeCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v132];
  id v41 = v132;
  v108 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      v46 = [NSString stringWithFormat:@"Required value is nil, not creating valueDocumentTypeCodingCollection instance to avoid throwing exception"];
      v47 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v141[0] = @"propertyName";
      v141[1] = v48;
      v142[0] = @"documentTypeCodingCollection";
      v142[1] = v46;
      v49 = [NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];
      v50 = [v47 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v49];

      [v126 addObject:v50];
    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v44;
      __int16 v147 = 2114;
      v148 = @"documentTypeCodingCollection";
      __int16 v149 = 2114;
      id v150 = v108;
      id v45 = v44;
      _os_log_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v108];
  }
  id v111 = v40;
  id v131 = 0;
  v51 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"noteCreationDate" expectedClass:objc_opt_class() isArray:0 error:&v131];
  id v120 = v131;
  if (!v51 && v120)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v54;
      __int16 v147 = 2114;
      v148 = @"noteCreationDate";
      __int16 v149 = 2114;
      id v150 = v120;
      id v55 = v54;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v120];
  }
  id v112 = v51;
  id v130 = 0;
  v56 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"categoriesCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v130];
  id v57 = v130;
  v107 = v57;
  if (v56 || !v57)
  {
    if (!v56)
    {
      v62 = [NSString stringWithFormat:@"Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"];
      v63 = (void *)MEMORY[0x263F087E8];
      uint64_t v64 = *MEMORY[0x263F08320];
      v139[0] = @"propertyName";
      v139[1] = v64;
      v140[0] = @"categoriesCodingCollections";
      v140[1] = v62;
      v65 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:2];
      v66 = [v63 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v65];

      [v126 addObject:v66];
    }
  }
  else
  {
    _HKInitializeLogging();
    v58 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v59 = v58;
      v60 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v60;
      __int16 v147 = 2114;
      v148 = @"categoriesCodingCollections";
      __int16 v149 = 2114;
      id v150 = v107;
      id v61 = v60;
      _os_log_impl(&dword_232E63000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v107];
  }
  id v113 = v56;
  id v129 = 0;
  v67 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"relevantStartDate" expectedClass:objc_opt_class() isArray:0 error:&v129];
  id v119 = v129;
  if (!v67 && v119)
  {
    _HKInitializeLogging();
    v68 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v69 = v68;
      v70 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v70;
      __int16 v147 = 2114;
      v148 = @"relevantStartDate";
      __int16 v149 = 2114;
      id v150 = v119;
      id v71 = v70;
      _os_log_impl(&dword_232E63000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v119];
  }
  id v114 = v67;
  id v128 = 0;
  v72 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"relevantEndDate" expectedClass:objc_opt_class() isArray:0 error:&v128];
  id v118 = v128;
  if (!v72 && v118)
  {
    _HKInitializeLogging();
    v73 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v74 = v73;
      v75 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v75;
      __int16 v147 = 2114;
      v148 = @"relevantEndDate";
      __int16 v149 = 2114;
      id v150 = v118;
      id v76 = v75;
      _os_log_impl(&dword_232E63000, v74, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v118];
  }
  id v77 = v72;
  id v127 = 0;
  v78 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"authors" expectedClass:objc_opt_class() isArray:1 error:&v127];
  id v79 = v127;
  v80 = v79;
  if (!v78 && v79)
  {
    _HKInitializeLogging();
    v81 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      v83 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v146 = v83;
      __int16 v147 = 2114;
      v148 = @"authors";
      __int16 v149 = 2114;
      id v150 = v80;
      id v84 = v83;
      _os_log_impl(&dword_232E63000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v126 addObject:v80];
  }
  id v85 = v78;
  if (![v126 count])
  {
    v93 = [(__CFString *)v4 representedResource];
    v94 = [v93 receivedDate];
    v95 = v94;
    if (v94)
    {
      id v96 = v94;
    }
    else
    {
      id v96 = [MEMORY[0x263EFF910] date];
    }
    v92 = v96;

    uint64_t v97 = [v115 BOOLValue];
    id v90 = [MEMORY[0x263F0A2D8] localDevice];
    v124 = [(__CFString *)v4 medicalRecordMetadata];
    v98 = [MEMORY[0x263F0A198] clinicalNoteRecordType];
    objc_msgSend(MEMORY[0x263F0A190], "clinicalNoteRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:statusCoding:documentTypeCodingCollection:noteCreationDate:categoriesCodingCollections:relevantStartDate:relevantEndDate:authors:", v98, v116, v97, v92, v105, v117, v106, v90, v124, v104, (v102 >> 2) & 1, v110, v111, v112, v113,
      v114,
      v77,
    v91 = v85);
    v99 = [(__CFString *)v4 representedResource];
    v100 = [v99 firstSeenDate];
    [v91 _setCreationDate:v100];

    goto LABEL_75;
  }
  v86 = (void *)MEMORY[0x263F087E8];
  v137 = @"conversionErrors";
  id v138 = v126;
  v87 = [NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];
  v88 = [v86 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v87];

  id v89 = v88;
  id v90 = v89;
  if (v89)
  {
    if (a4)
    {
      id v90 = v89;
      v91 = 0;
      *a4 = v90;
      v92 = v90;
      goto LABEL_75;
    }
    _HKLogDroppedError();
  }
  v91 = 0;
  v92 = v90;
LABEL_75:

  return v91;
}

@end