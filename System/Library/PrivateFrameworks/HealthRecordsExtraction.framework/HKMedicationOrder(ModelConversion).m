@interface HKMedicationOrder(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKMedicationOrder(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v148 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v147 = [v5 identifier];

  if (!v147)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v170 = (id)objc_opt_class();
      id v8 = v170;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v148 addObject:v9];
  }
  v119 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v147];
  v10 = [(__CFString *)v4 rulesVersion];
  id v120 = (id)[v10 integerValue];

  if ((uint64_t)v120 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v170 = v13;
      __int16 v171 = 2114;
      v172 = v4;
      id v14 = v13;
      _os_log_impl(&dword_232E63000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v15 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v148 addObject:v15];
  }
  id v162 = 0;
  v134 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v162];
  id v145 = v162;
  if (!v134 && v145)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v18;
      __int16 v171 = 2114;
      v172 = @"locale";
      __int16 v173 = 2114;
      id v174 = v145;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v145];
  }
  v118 = [(__CFString *)v4 country];
  id v161 = 0;
  v133 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v161];
  id v144 = v161;
  if (!v133 && v144)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v22;
      __int16 v171 = 2114;
      v172 = @"note";
      __int16 v173 = 2114;
      id v174 = v144;
      id v23 = v22;
      _os_log_impl(&dword_232E63000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v144];
  }
  id v160 = 0;
  v132 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v160];
  id v143 = v160;
  if (!v132 && v143)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v26;
      __int16 v171 = 2114;
      v172 = @"enteredInError";
      __int16 v173 = 2114;
      id v174 = v143;
      id v27 = v26;
      _os_log_impl(&dword_232E63000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v143];
  }
  v28 = [(__CFString *)v4 representedResource];
  unint64_t v116 = [v28 extractionHints];

  id v159 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"medicationCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v159];
  id v30 = v159;
  v123 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      v35 = [NSString stringWithFormat:@"Required value is nil, not creating valueMedicationCodingCollection instance to avoid throwing exception"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v167[0] = @"propertyName";
      v167[1] = v37;
      v168[0] = @"medicationCodingCollection";
      v168[1] = v35;
      v38 = [NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
      v39 = [v36 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v38];

      [v148 addObject:v39];
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
      id v170 = v33;
      __int16 v171 = 2114;
      v172 = @"medicationCodingCollection";
      __int16 v173 = 2114;
      id v174 = v123;
      id v34 = v33;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v123];
  }
  id v124 = v29;
  id v158 = 0;
  v40 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"prescriber" expectedClass:objc_opt_class() isArray:0 error:&v158];
  id v142 = v158;
  if (!v40 && v142)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v43;
      __int16 v171 = 2114;
      v172 = @"prescriber";
      __int16 v173 = 2114;
      id v174 = v142;
      id v44 = v43;
      _os_log_impl(&dword_232E63000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v142];
  }
  id v125 = v40;
  id v157 = 0;
  v146 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"numberOfFills" expectedClass:objc_opt_class() isArray:0 error:&v157];
  id v141 = v157;
  if (!v146 && v141)
  {
    _HKInitializeLogging();
    v45 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v46 = v45;
      v47 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v47;
      __int16 v171 = 2114;
      v172 = @"numberOfFills";
      __int16 v173 = 2114;
      id v174 = v141;
      id v48 = v47;
      _os_log_impl(&dword_232E63000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v141];
  }
  uint64_t v115 = [v146 integerValue];
  id v156 = 0;
  v49 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"dosages" expectedClass:objc_opt_class() isArray:1 error:&v156];
  id v140 = v156;
  if (!v49 && v140)
  {
    _HKInitializeLogging();
    v50 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v51 = v50;
      v52 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v52;
      __int16 v171 = 2114;
      v172 = @"dosages";
      __int16 v173 = 2114;
      id v174 = v140;
      id v53 = v52;
      _os_log_impl(&dword_232E63000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v140];
  }
  id v126 = v49;
  id v155 = 0;
  v54 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"earliestDosageDate" expectedClass:objc_opt_class() isArray:0 error:&v155];
  id v139 = v155;
  if (!v54 && v139)
  {
    _HKInitializeLogging();
    v55 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v56 = v55;
      v57 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v57;
      __int16 v171 = 2114;
      v172 = @"earliestDosageDate";
      __int16 v173 = 2114;
      id v174 = v139;
      id v58 = v57;
      _os_log_impl(&dword_232E63000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v139];
  }
  id v127 = v54;
  id v154 = 0;
  v59 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"writtenDate" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v138 = v154;
  if (!v59 && v138)
  {
    _HKInitializeLogging();
    v60 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v61 = v60;
      v62 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v62;
      __int16 v171 = 2114;
      v172 = @"writtenDate";
      __int16 v173 = 2114;
      id v174 = v138;
      id v63 = v62;
      _os_log_impl(&dword_232E63000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v138];
  }
  id v128 = v59;
  id v153 = 0;
  v64 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"endedDate" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v137 = v153;
  if (!v64 && v137)
  {
    _HKInitializeLogging();
    v65 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v66 = v65;
      v67 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v67;
      __int16 v171 = 2114;
      v172 = @"endedDate";
      __int16 v173 = 2114;
      id v174 = v137;
      id v68 = v67;
      _os_log_impl(&dword_232E63000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v137];
  }
  id v129 = v64;
  id v152 = 0;
  v69 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v70 = v152;
  v122 = v70;
  if (v69 || !v70)
  {
    if (!v69)
    {
      v75 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v76 = (void *)MEMORY[0x263F087E8];
      uint64_t v77 = *MEMORY[0x263F08320];
      v165[0] = @"propertyName";
      v165[1] = v77;
      v166[0] = @"statusCoding";
      v166[1] = v75;
      v78 = [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];
      v79 = [v76 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v78];

      [v148 addObject:v79];
    }
  }
  else
  {
    _HKInitializeLogging();
    v71 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v72 = v71;
      v73 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v73;
      __int16 v171 = 2114;
      v172 = @"statusCoding";
      __int16 v173 = 2114;
      id v174 = v122;
      id v74 = v73;
      _os_log_impl(&dword_232E63000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v122];
  }
  id v130 = v69;
  id v151 = 0;
  v80 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v151];
  id v136 = v151;
  if (!v80 && v136)
  {
    _HKInitializeLogging();
    v81 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v82 = v81;
      v83 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v83;
      __int16 v171 = 2114;
      v172 = @"reasonCodingCollections";
      __int16 v173 = 2114;
      id v174 = v136;
      id v84 = v83;
      _os_log_impl(&dword_232E63000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v136];
  }
  id v131 = v80;
  id v150 = 0;
  v85 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonEndedCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v150];
  id v135 = v150;
  if (!v85 && v135)
  {
    _HKInitializeLogging();
    v86 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v87 = v86;
      v88 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v88;
      __int16 v171 = 2114;
      v172 = @"reasonEndedCodingCollection";
      __int16 v173 = 2114;
      id v174 = v135;
      id v89 = v88;
      _os_log_impl(&dword_232E63000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v135];
  }
  id v90 = v85;
  id v149 = 0;
  v91 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusReasonCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v92 = v149;
  v93 = v92;
  if (!v91 && v92)
  {
    _HKInitializeLogging();
    v94 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v95 = v94;
      v96 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v170 = v96;
      __int16 v171 = 2114;
      v172 = @"statusReasonCodingCollection";
      __int16 v173 = 2114;
      id v174 = v93;
      id v97 = v96;
      _os_log_impl(&dword_232E63000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v148 addObject:v93];
  }
  id v98 = v91;
  if (![v148 count])
  {
    v105 = [(__CFString *)v4 representedResource];
    v106 = [v105 receivedDate];
    v107 = v106;
    if (v106)
    {
      id v108 = v106;
    }
    else
    {
      id v108 = [MEMORY[0x263EFF910] date];
    }
    v104 = v108;

    uint64_t v109 = [v132 BOOLValue];
    id v103 = [MEMORY[0x263F0A2D8] localDevice];
    v110 = [(__CFString *)v4 medicalRecordMetadata];
    v111 = [MEMORY[0x263F0A530] medicationOrderType];
    objc_msgSend(MEMORY[0x263F0A528], "medicationOrderWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodingCollection:prescriber:numberOfFills:dosages:earliestDosageDate:writtenDate:endedDate:statusCoding:reasonCodingCollections:reasonEndedCodingCollection:statusReasonCodingCollection:", v111, v133, v109, v104, v119, v134, v120, v103, v110, v118, (v116 >> 2) & 1, v124, v125, v115, v126,
      v127,
      v128,
      v129,
      v130,
      v131,
      v90,
      v98);
    id v121 = (id)objc_claimAutoreleasedReturnValue();
    v112 = [(__CFString *)v4 representedResource];
    v113 = [v112 firstSeenDate];
    [v121 _setCreationDate:v113];

    goto LABEL_93;
  }
  v99 = (void *)MEMORY[0x263F087E8];
  v163 = @"conversionErrors";
  id v164 = v148;
  v100 = [NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
  v101 = [v99 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v100];

  id v102 = v101;
  id v103 = v102;
  if (v102)
  {
    if (a4)
    {
      id v103 = v102;
      id v121 = 0;
      *a4 = v103;
      v104 = v103;
      goto LABEL_93;
    }
    _HKLogDroppedError();
  }
  id v121 = 0;
  v104 = v103;
LABEL_93:

  return v121;
}

@end