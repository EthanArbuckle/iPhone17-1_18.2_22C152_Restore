@interface HKAllergyRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKAllergyRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v142 = objc_alloc_init(MEMORY[0x263EFF980]);
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
    [v142 addObject:v9];
  }
  v114 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v140];
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
      id v162 = v14;
      __int16 v163 = 2114;
      v164 = v4;
      id v15 = v14;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v16 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v142 addObject:v16];
  }
  id v156 = 0;
  v127 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v156];
  id v139 = v156;
  if (!v127 && v139)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v19;
      __int16 v163 = 2114;
      v164 = @"locale";
      __int16 v165 = 2114;
      id v166 = v139;
      id v20 = v19;
      _os_log_impl(&dword_232E63000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v139];
  }
  v113 = [(__CFString *)v4 country];
  id v155 = 0;
  v126 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v155];
  id v138 = v155;
  if (!v126 && v138)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v23;
      __int16 v163 = 2114;
      v164 = @"note";
      __int16 v165 = 2114;
      id v166 = v138;
      id v24 = v23;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v138];
  }
  id v154 = 0;
  v125 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v137 = v154;
  if (!v125 && v137)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v27;
      __int16 v163 = 2114;
      v164 = @"enteredInError";
      __int16 v165 = 2114;
      id v166 = v137;
      id v28 = v27;
      _os_log_impl(&dword_232E63000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v137];
  }
  v29 = [(__CFString *)v4 representedResource];
  unint64_t v111 = [v29 extractionHints];

  id v153 = 0;
  v30 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"allergyCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v31 = v153;
  v115 = v31;
  if (v30 || !v31)
  {
    if (!v30)
    {
      v36 = [NSString stringWithFormat:@"Required value is nil, not creating valueAllergyCodingCollection instance to avoid throwing exception"];
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v38 = *MEMORY[0x263F08320];
      v159[0] = @"propertyName";
      v159[1] = v38;
      v160[0] = @"allergyCodingCollection";
      v160[1] = v36;
      v39 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:2];
      v40 = [v37 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v39];

      [v142 addObject:v40];
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
      id v162 = v34;
      __int16 v163 = 2114;
      v164 = @"allergyCodingCollection";
      __int16 v165 = 2114;
      id v166 = v115;
      id v35 = v34;
      _os_log_impl(&dword_232E63000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v115];
  }
  id v116 = v30;
  id v152 = 0;
  v41 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"onsetDate" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v136 = v152;
  if (!v41 && v136)
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
      v164 = @"onsetDate";
      __int16 v165 = 2114;
      id v166 = v136;
      id v45 = v44;
      _os_log_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v136];
  }
  id v117 = v41;
  id v151 = 0;
  v46 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"asserter" expectedClass:objc_opt_class() isArray:0 error:&v151];
  id v135 = v151;
  if (!v46 && v135)
  {
    _HKInitializeLogging();
    v47 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v48 = v47;
      v49 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v162 = v49;
      __int16 v163 = 2114;
      v164 = @"asserter";
      __int16 v165 = 2114;
      id v166 = v135;
      id v50 = v49;
      _os_log_impl(&dword_232E63000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v135];
  }
  id v118 = v46;
  id v150 = 0;
  v51 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reactions" expectedClass:objc_opt_class() isArray:1 error:&v150];
  id v134 = v150;
  if (!v51 && v134)
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
      v164 = @"reactions";
      __int16 v165 = 2114;
      id v166 = v134;
      id v55 = v54;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v134];
  }
  id v119 = v51;
  id v149 = 0;
  v56 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"criticalityCoding" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v133 = v149;
  if (!v56 && v133)
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
      v164 = @"criticalityCoding";
      __int16 v165 = 2114;
      id v166 = v133;
      id v60 = v59;
      _os_log_impl(&dword_232E63000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v133];
  }
  id v120 = v56;
  id v148 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"lastOccurrenceDate" expectedClass:objc_opt_class() isArray:0 error:&v148];
  id v132 = v148;
  if (!v61 && v132)
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
      v164 = @"lastOccurrenceDate";
      __int16 v165 = 2114;
      id v166 = v132;
      id v65 = v64;
      _os_log_impl(&dword_232E63000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v132];
  }
  id v121 = v61;
  id v147 = 0;
  v66 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"recordedDate" expectedClass:objc_opt_class() isArray:0 error:&v147];
  id v131 = v147;
  if (!v66 && v131)
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
      id v166 = v131;
      id v70 = v69;
      _os_log_impl(&dword_232E63000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v131];
  }
  id v122 = v66;
  id v146 = 0;
  v71 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"verificationStatusCoding" expectedClass:objc_opt_class() isArray:0 error:&v146];
  id v130 = v146;
  if (!v71 && v130)
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
      v164 = @"verificationStatusCoding";
      __int16 v165 = 2114;
      id v166 = v130;
      id v75 = v74;
      _os_log_impl(&dword_232E63000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v130];
  }
  id v123 = v71;
  id v145 = 0;
  v76 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"clinicalStatusCoding" expectedClass:objc_opt_class() isArray:0 error:&v145];
  id v129 = v145;
  if (!v76 && v129)
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
      v164 = @"clinicalStatusCoding";
      __int16 v165 = 2114;
      id v166 = v129;
      id v80 = v79;
      _os_log_impl(&dword_232E63000, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v129];
  }
  id v124 = v76;
  id v144 = 0;
  v81 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"allergyTypeCoding" expectedClass:objc_opt_class() isArray:0 error:&v144];
  id v128 = v144;
  if (!v81 && v128)
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
      v164 = @"allergyTypeCoding";
      __int16 v165 = 2114;
      id v166 = v128;
      id v85 = v84;
      _os_log_impl(&dword_232E63000, v83, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v128];
  }
  id v86 = v81;
  id v143 = 0;
  v87 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"categoryCoding" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v88 = v143;
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
      v164 = @"categoryCoding";
      __int16 v165 = 2114;
      id v166 = v89;
      id v93 = v92;
      _os_log_impl(&dword_232E63000, v91, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v142 addObject:v89];
  }
  id v94 = v87;
  if (![v142 count])
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

    uint64_t v105 = [v125 BOOLValue];
    id v99 = [MEMORY[0x263F0A2D8] localDevice];
    v106 = [(__CFString *)v4 medicalRecordMetadata];
    v107 = [MEMORY[0x263F0A0B0] allergyRecordType];
    objc_msgSend(MEMORY[0x263F0A0A8], "allergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:", v107, v126, v105, v100, v114, v127, v11, v99, v106, v113, (v111 >> 2) & 1, v116, v117, v118, v119,
      v120,
      v121,
      v122,
      v123,
      v124,
      v86,
      v94);
    id v141 = (id)objc_claimAutoreleasedReturnValue();
    v108 = [(__CFString *)v4 representedResource];
    v109 = [v108 firstSeenDate];
    [v141 _setCreationDate:v109];

    goto LABEL_91;
  }
  v95 = (void *)MEMORY[0x263F087E8];
  v157 = @"conversionErrors";
  id v158 = v142;
  v96 = [NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
  v97 = [v95 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v96];

  id v98 = v97;
  id v99 = v98;
  if (v98)
  {
    if (a4)
    {
      id v99 = v98;
      id v141 = 0;
      *a4 = v99;
      v100 = v99;
      goto LABEL_91;
    }
    _HKLogDroppedError();
  }
  id v141 = 0;
  v100 = v99;
LABEL_91:

  return v141;
}

@end