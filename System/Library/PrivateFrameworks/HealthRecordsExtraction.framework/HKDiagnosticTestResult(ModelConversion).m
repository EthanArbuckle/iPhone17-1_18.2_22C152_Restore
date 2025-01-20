@interface HKDiagnosticTestResult(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKDiagnosticTestResult(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v184 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v149 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v147 = [v5 identifier];

  if (!v147)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v179 = v7;
      _os_log_impl(&dword_232E63000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v149 addObject:v8];
  }
  v112 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v147];
  v9 = [(__CFString *)v4 rulesVersion];
  uint64_t v113 = [v9 integerValue];

  if (v113 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v179 = v11;
      __int16 v180 = 2114;
      v181 = v4;
      _os_log_impl(&dword_232E63000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v12 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v149 addObject:v12];
  }
  id v167 = 0;
  v133 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v167];
  id v146 = v167;
  if (!v133 && v146)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v14;
      __int16 v180 = 2114;
      v181 = @"locale";
      __int16 v182 = 2114;
      id v183 = v146;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v146];
  }
  v111 = [(__CFString *)v4 country];
  id v166 = 0;
  v132 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v166];
  id v145 = v166;
  if (!v132 && v145)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v16;
      __int16 v180 = 2114;
      v181 = @"note";
      __int16 v182 = 2114;
      id v183 = v145;
      _os_log_impl(&dword_232E63000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v145];
  }
  id v165 = 0;
  v131 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v165];
  id v144 = v165;
  if (!v131 && v144)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v18;
      __int16 v180 = 2114;
      v181 = @"enteredInError";
      __int16 v182 = 2114;
      id v183 = v144;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v144];
  }
  v19 = [(__CFString *)v4 representedResource];
  unint64_t v109 = [v19 extractionHints];

  id v164 = 0;
  v20 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"diagnosticTestCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v164];
  id v21 = v164;
  v117 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      v24 = [NSString stringWithFormat:@"Required value is nil, not creating valueDiagnosticTestCodingCollection instance to avoid throwing exception"];
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v176[0] = @"propertyName";
      v176[1] = v26;
      v177[0] = @"diagnosticTestCodingCollection";
      v177[1] = v24;
      v27 = [NSDictionary dictionaryWithObjects:v177 forKeys:v176 count:2];
      v28 = [v25 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v27];

      [v149 addObject:v28];
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v23;
      __int16 v180 = 2114;
      v181 = @"diagnosticTestCodingCollection";
      __int16 v182 = 2114;
      id v183 = v117;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v117];
  }
  id v118 = v20;
  id v163 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"value" expectedClass:objc_opt_class() isArray:0 error:&v163];
  id v143 = v163;
  if (!v29 && v143)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v31;
      __int16 v180 = 2114;
      v181 = @"value";
      __int16 v182 = 2114;
      id v183 = v143;
      _os_log_impl(&dword_232E63000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v143];
  }
  id v119 = v29;
  id v162 = 0;
  v32 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"referenceRanges" expectedClass:objc_opt_class() isArray:1 error:&v162];
  id v142 = v162;
  if (!v32 && v142)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v34;
      __int16 v180 = 2114;
      v181 = @"referenceRanges";
      __int16 v182 = 2114;
      id v183 = v142;
      _os_log_impl(&dword_232E63000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v142];
  }
  id v120 = v32;
  id v161 = 0;
  v35 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveStartDate" expectedClass:objc_opt_class() isArray:0 error:&v161];
  id v141 = v161;
  if (!v35 && v141)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v37;
      __int16 v180 = 2114;
      v181 = @"effectiveStartDate";
      __int16 v182 = 2114;
      id v183 = v141;
      _os_log_impl(&dword_232E63000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v141];
  }
  id v121 = v35;
  id v160 = 0;
  v38 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"category" expectedClass:objc_opt_class() isArray:0 error:&v160];
  id v39 = v160;
  v116 = v39;
  if (v38 || !v39)
  {
    if (!v38)
    {
      v42 = [NSString stringWithFormat:@"Required value is nil, not creating valueCategory instance to avoid throwing exception"];
      v43 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v174[0] = @"propertyName";
      v174[1] = v44;
      v175[0] = @"category";
      v175[1] = v42;
      v45 = [NSDictionary dictionaryWithObjects:v175 forKeys:v174 count:2];
      v46 = [v43 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v45];

      [v149 addObject:v46];
    }
  }
  else
  {
    _HKInitializeLogging();
    v40 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v41;
      __int16 v180 = 2114;
      v181 = @"category";
      __int16 v182 = 2114;
      id v183 = v116;
      _os_log_impl(&dword_232E63000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v116];
  }
  id v122 = v38;
  id v159 = 0;
  v47 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"categoriesCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v159];
  id v48 = v159;
  v115 = v48;
  if (v47 || !v48)
  {
    if (!v47)
    {
      v51 = [NSString stringWithFormat:@"Required value is nil, not creating valueCategoriesCodingCollections instance to avoid throwing exception"];
      v52 = (void *)MEMORY[0x263F087E8];
      uint64_t v53 = *MEMORY[0x263F08320];
      v172[0] = @"propertyName";
      v172[1] = v53;
      v173[0] = @"categoriesCodingCollections";
      v173[1] = v51;
      v54 = [NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];
      v55 = [v52 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v54];

      [v149 addObject:v55];
    }
  }
  else
  {
    _HKInitializeLogging();
    v49 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v50;
      __int16 v180 = 2114;
      v181 = @"categoriesCodingCollections";
      __int16 v182 = 2114;
      id v183 = v115;
      _os_log_impl(&dword_232E63000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v115];
  }
  id v123 = v47;
  id v158 = 0;
  v56 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"issueDate" expectedClass:objc_opt_class() isArray:0 error:&v158];
  id v140 = v158;
  if (!v56 && v140)
  {
    _HKInitializeLogging();
    v57 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      id v58 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v58;
      __int16 v180 = 2114;
      v181 = @"issueDate";
      __int16 v182 = 2114;
      id v183 = v140;
      _os_log_impl(&dword_232E63000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v140];
  }
  id v124 = v56;
  id v157 = 0;
  v59 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveEndDate" expectedClass:objc_opt_class() isArray:0 error:&v157];
  id v139 = v157;
  if (!v59 && v139)
  {
    _HKInitializeLogging();
    v60 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      id v61 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v61;
      __int16 v180 = 2114;
      v181 = @"effectiveEndDate";
      __int16 v182 = 2114;
      id v183 = v139;
      _os_log_impl(&dword_232E63000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v139];
  }
  id v125 = v59;
  id v156 = 0;
  v62 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v156];
  id v63 = v156;
  v114 = v63;
  if (v62 || !v63)
  {
    if (!v62)
    {
      v66 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v67 = (void *)MEMORY[0x263F087E8];
      uint64_t v68 = *MEMORY[0x263F08320];
      v170[0] = @"propertyName";
      v170[1] = v68;
      v171[0] = @"statusCoding";
      v171[1] = v66;
      v69 = [NSDictionary dictionaryWithObjects:v171 forKeys:v170 count:2];
      v70 = [v67 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v69];

      [v149 addObject:v70];
    }
  }
  else
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v65;
      __int16 v180 = 2114;
      v181 = @"statusCoding";
      __int16 v182 = 2114;
      id v183 = v114;
      _os_log_impl(&dword_232E63000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v114];
  }
  id v126 = v62;
  id v155 = 0;
  v71 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"interpretationCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v155];
  id v138 = v155;
  if (!v71 && v138)
  {
    _HKInitializeLogging();
    v72 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      id v73 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v73;
      __int16 v180 = 2114;
      v181 = @"interpretationCodingCollections";
      __int16 v182 = 2114;
      id v183 = v138;
      _os_log_impl(&dword_232E63000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v138];
  }
  id v127 = v71;
  id v154 = 0;
  v74 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"comments" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v137 = v154;
  if (!v74 && v137)
  {
    _HKInitializeLogging();
    v75 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      id v76 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v76;
      __int16 v180 = 2114;
      v181 = @"comments";
      __int16 v182 = 2114;
      id v183 = v137;
      _os_log_impl(&dword_232E63000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v137];
  }
  id v128 = v74;
  id v153 = 0;
  v77 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"bodySiteCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v136 = v153;
  if (!v77 && v136)
  {
    _HKInitializeLogging();
    v78 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      id v79 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v79;
      __int16 v180 = 2114;
      v181 = @"bodySiteCodingCollection";
      __int16 v182 = 2114;
      id v183 = v136;
      _os_log_impl(&dword_232E63000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v136];
  }
  id v129 = v77;
  id v152 = 0;
  v80 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"methodCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v135 = v152;
  if (!v80 && v135)
  {
    _HKInitializeLogging();
    v81 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      id v82 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v82;
      __int16 v180 = 2114;
      v181 = @"methodCodingCollection";
      __int16 v182 = 2114;
      id v183 = v135;
      _os_log_impl(&dword_232E63000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v135];
  }
  id v130 = v80;
  id v151 = 0;
  v83 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"performers" expectedClass:objc_opt_class() isArray:1 error:&v151];
  id v134 = v151;
  if (!v83 && v134)
  {
    _HKInitializeLogging();
    v84 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      id v85 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v85;
      __int16 v180 = 2114;
      v181 = @"performers";
      __int16 v182 = 2114;
      id v183 = v134;
      _os_log_impl(&dword_232E63000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v134];
  }
  id v86 = v83;
  id v150 = 0;
  v87 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"referenceRangeStatus" expectedClass:objc_opt_class() isArray:0 error:&v150];
  id v88 = v150;
  v89 = v88;
  if (!v87 && v88)
  {
    _HKInitializeLogging();
    v90 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      id v91 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v179 = v91;
      __int16 v180 = 2114;
      v181 = @"referenceRangeStatus";
      __int16 v182 = 2114;
      id v183 = v89;
      _os_log_impl(&dword_232E63000, v90, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v149 addObject:v89];
  }
  uint64_t v92 = [v87 integerValue];
  if (![v149 count])
  {
    v100 = [(__CFString *)v4 representedResource];
    v101 = [v100 receivedDate];
    v102 = v101;
    if (v101)
    {
      id v99 = v101;
    }
    else
    {
      id v99 = [MEMORY[0x263EFF910] date];
    }
    uint64_t v103 = [v131 BOOLValue];
    id v97 = [MEMORY[0x263F0A2D8] localDevice];
    v148 = [(__CFString *)v4 medicalRecordMetadata];
    v104 = [MEMORY[0x263F0A328] diagnosticTestResultType];
    objc_msgSend(MEMORY[0x263F0A320], "diagnosticTestResultWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:diagnosticTestCodingCollection:value:referenceRanges:effectiveStartDate:category:categoriesCodingCollections:issueDate:effectiveEndDate:statusCoding:interpretationCodingCollections:comments:bodySiteCodingCollection:methodCodingCollection:performers:referenceRangeStatus:", v104, v132, v103, v99, v112, v133, v113, v97, v148, v111, (v109 >> 2) & 1, v118, v119, v120,
      v121,
      v122,
      v123,
      v124,
      v125,
      v126,
      v127,
      v128,
      v129,
      v130,
      v86,
    v105 = v92);
    v106 = [(__CFString *)v4 representedResource];
    v107 = [v106 firstSeenDate];
    [v105 _setCreationDate:v107];

    id v98 = v105;
    goto LABEL_117;
  }
  v93 = (void *)MEMORY[0x263F087E8];
  v168 = @"conversionErrors";
  id v169 = v149;
  v94 = [NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
  v95 = [v93 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v94];

  id v96 = v95;
  id v97 = v96;
  if (v96)
  {
    if (a4)
    {
      id v97 = v96;
      id v98 = 0;
      *a4 = v97;
      id v99 = v97;
      goto LABEL_117;
    }
    _HKLogDroppedError();
  }
  id v98 = 0;
  id v99 = v97;
LABEL_117:

  return v98;
}

@end