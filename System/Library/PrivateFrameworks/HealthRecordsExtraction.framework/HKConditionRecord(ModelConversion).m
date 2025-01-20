@interface HKConditionRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKConditionRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v141 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v140 = [v5 identifier];

  if (!v140)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v162 = (id)objc_opt_class();
      id v8 = v162;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v141 addObject:v9];
  }
  v114 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v140];
  v10 = [(__CFString *)v4 rulesVersion];
  id v115 = (id)[v10 integerValue];

  if ((uint64_t)v115 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v162 = v13;
      __int16 v163 = 2114;
      v164 = v4;
      id v14 = v13;
      _os_log_impl(&dword_232E63000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v15 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v141 addObject:v15];
  }
  id v154 = 0;
  v129 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v139 = v154;
  if (!v129 && v139)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v18;
      __int16 v163 = 2114;
      v164 = @"locale";
      __int16 v165 = 2114;
      id v166 = v139;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v139];
  }
  v113 = [(__CFString *)v4 country];
  id v153 = 0;
  v128 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v138 = v153;
  if (!v128 && v138)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v22;
      __int16 v163 = 2114;
      v164 = @"note";
      __int16 v165 = 2114;
      id v166 = v138;
      id v23 = v22;
      _os_log_impl(&dword_232E63000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v138];
  }
  id v152 = 0;
  v127 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v137 = v152;
  if (!v127 && v137)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v26;
      __int16 v163 = 2114;
      v164 = @"enteredInError";
      __int16 v165 = 2114;
      id v166 = v137;
      id v27 = v26;
      _os_log_impl(&dword_232E63000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v137];
  }
  v28 = [(__CFString *)v4 representedResource];
  unint64_t v111 = [v28 extractionHints];

  id v151 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"conditionCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v151];
  id v30 = v151;
  v118 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      v35 = [NSString stringWithFormat:@"Required value is nil, not creating valueConditionCodingCollection instance to avoid throwing exception"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v159[0] = @"propertyName";
      v159[1] = v37;
      v160[0] = @"conditionCodingCollection";
      v160[1] = v35;
      v38 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:2];
      v39 = [v36 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v38];

      [v141 addObject:v39];
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
      id v162 = v33;
      __int16 v163 = 2114;
      v164 = @"conditionCodingCollection";
      __int16 v165 = 2114;
      id v166 = v118;
      id v34 = v33;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v118];
  }
  id v119 = v29;
  id v150 = 0;
  v40 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"categoriesCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v150];
  id v41 = v150;
  v117 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      v46 = [NSString stringWithFormat:@"Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"];
      v47 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v157[0] = @"propertyName";
      v157[1] = v48;
      v158[0] = @"categoriesCodingCollections";
      v158[1] = v46;
      v49 = [NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:2];
      v50 = [v47 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v49];

      [v141 addObject:v50];
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
      id v162 = v44;
      __int16 v163 = 2114;
      v164 = @"categoriesCodingCollections";
      __int16 v165 = 2114;
      id v166 = v117;
      id v45 = v44;
      _os_log_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v117];
  }
  id v120 = v40;
  id v149 = 0;
  v51 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"asserter" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v136 = v149;
  if (!v51 && v136)
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v54;
      __int16 v163 = 2114;
      v164 = @"asserter";
      __int16 v165 = 2114;
      id v166 = v136;
      id v55 = v54;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v136];
  }
  id v121 = v51;
  id v148 = 0;
  v56 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"abatement" expectedClass:objc_opt_class() isArray:0 error:&v148];
  id v135 = v148;
  if (!v56 && v135)
  {
    _HKInitializeLogging();
    v57 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v59;
      __int16 v163 = 2114;
      v164 = @"abatement";
      __int16 v165 = 2114;
      id v166 = v135;
      id v60 = v59;
      _os_log_impl(&dword_232E63000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v135];
  }
  id v122 = v56;
  id v147 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"onset" expectedClass:objc_opt_class() isArray:0 error:&v147];
  id v134 = v147;
  if (!v61 && v134)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v64;
      __int16 v163 = 2114;
      v164 = @"onset";
      __int16 v165 = 2114;
      id v166 = v134;
      id v65 = v64;
      _os_log_impl(&dword_232E63000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v134];
  }
  id v123 = v61;
  id v146 = 0;
  v66 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"recordedDate" expectedClass:objc_opt_class() isArray:0 error:&v146];
  id v133 = v146;
  if (!v66 && v133)
  {
    _HKInitializeLogging();
    v67 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v68 = v67;
      v69 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v69;
      __int16 v163 = 2114;
      v164 = @"recordedDate";
      __int16 v165 = 2114;
      id v166 = v133;
      id v70 = v69;
      _os_log_impl(&dword_232E63000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v133];
  }
  id v124 = v66;
  id v145 = 0;
  v71 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"clinicalStatusCoding" expectedClass:objc_opt_class() isArray:0 error:&v145];
  id v132 = v145;
  if (!v71 && v132)
  {
    _HKInitializeLogging();
    v72 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v73 = v72;
      v74 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v74;
      __int16 v163 = 2114;
      v164 = @"clinicalStatusCoding";
      __int16 v165 = 2114;
      id v166 = v132;
      id v75 = v74;
      _os_log_impl(&dword_232E63000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v132];
  }
  id v125 = v71;
  id v144 = 0;
  v76 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"verificationStatusCoding" expectedClass:objc_opt_class() isArray:0 error:&v144];
  id v131 = v144;
  if (!v76 && v131)
  {
    _HKInitializeLogging();
    v77 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v78 = v77;
      v79 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v79;
      __int16 v163 = 2114;
      v164 = @"verificationStatusCoding";
      __int16 v165 = 2114;
      id v166 = v131;
      id v80 = v79;
      _os_log_impl(&dword_232E63000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v131];
  }
  id v126 = v76;
  id v143 = 0;
  v81 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"severityCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v130 = v143;
  if (!v81 && v130)
  {
    _HKInitializeLogging();
    v82 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v83 = v82;
      v84 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v84;
      __int16 v163 = 2114;
      v164 = @"severityCodingCollection";
      __int16 v165 = 2114;
      id v166 = v130;
      id v85 = v84;
      _os_log_impl(&dword_232E63000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v130];
  }
  id v86 = v81;
  id v142 = 0;
  v87 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"bodySitesCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v142];
  id v88 = v142;
  v89 = v88;
  if (!v87 && v88)
  {
    _HKInitializeLogging();
    v90 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v91 = v90;
      v92 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v92;
      __int16 v163 = 2114;
      v164 = @"bodySitesCodingCollections";
      __int16 v165 = 2114;
      id v166 = v89;
      id v93 = v92;
      _os_log_impl(&dword_232E63000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v89];
  }
  id v94 = v87;
  if (![v141 count])
  {
    v101 = [(__CFString *)v4 representedResource];
    v102 = [v101 receivedDate];
    v103 = v102;
    if (v102)
    {
      id v104 = v102;
    }
    else
    {
      id v104 = [MEMORY[0x263EFF910] date];
    }
    v100 = v104;

    uint64_t v105 = [v127 BOOLValue];
    id v99 = [MEMORY[0x263F0A2D8] localDevice];
    v106 = [(__CFString *)v4 medicalRecordMetadata];
    v107 = [MEMORY[0x263F0A238] conditionRecordType];
    objc_msgSend(MEMORY[0x263F0A230], "conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:", v107, v128, v105, v100, v114, v129, v115, v99, v106, v113, (v111 >> 2) & 1, v119, v120, v121, v122,
      v123,
      v124,
      v125,
      v126,
      v86,
      v94);
    id v116 = (id)objc_claimAutoreleasedReturnValue();
    v108 = [(__CFString *)v4 representedResource];
    v109 = [v108 firstSeenDate];
    [v116 _setCreationDate:v109];

    goto LABEL_88;
  }
  v95 = (void *)MEMORY[0x263F087E8];
  v155 = @"conversionErrors";
  id v156 = v141;
  v96 = [NSDictionary dictionaryWithObjects:&v156 forKeys:&v155 count:1];
  v97 = [v95 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v96];

  id v98 = v97;
  id v99 = v98;
  if (v98)
  {
    if (a4)
    {
      id v99 = v98;
      id v116 = 0;
      *a4 = v99;
      v100 = v99;
      goto LABEL_88;
    }
    _HKLogDroppedError();
  }
  id v116 = 0;
  v100 = v99;
LABEL_88:

  return v116;
}

@end