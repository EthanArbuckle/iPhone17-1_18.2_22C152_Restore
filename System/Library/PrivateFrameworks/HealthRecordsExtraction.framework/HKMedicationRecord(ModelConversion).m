@interface HKMedicationRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKMedicationRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v141 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v139 = [v5 identifier];

  if (!v139)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v164 = (id)objc_opt_class();
      id v7 = v164;
      _os_log_impl(&dword_232E63000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v141 addObject:v8];
  }
  v110 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v139];
  v9 = [(__CFString *)v4 rulesVersion];
  uint64_t v111 = [v9 integerValue];

  if (v111 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v164 = v11;
      __int16 v165 = 2114;
      v166 = v4;
      id v12 = v11;
      _os_log_impl(&dword_232E63000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v13 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v141 addObject:v13];
  }
  id v156 = 0;
  v124 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v156];
  id v136 = v156;
  if (!v124 && v136)
  {
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v15;
      __int16 v165 = 2114;
      v166 = @"locale";
      __int16 v167 = 2114;
      id v168 = v136;
      id v16 = v15;
      _os_log_impl(&dword_232E63000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v136];
  }
  v109 = [(__CFString *)v4 country];
  id v155 = 0;
  v123 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v155];
  id v135 = v155;
  if (!v123 && v135)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v18;
      __int16 v165 = 2114;
      v166 = @"note";
      __int16 v167 = 2114;
      id v168 = v135;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v135];
  }
  id v154 = 0;
  v122 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v134 = v154;
  if (!v122 && v134)
  {
    _HKInitializeLogging();
    v20 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v21;
      __int16 v165 = 2114;
      v166 = @"enteredInError";
      __int16 v167 = 2114;
      id v168 = v134;
      id v22 = v21;
      _os_log_impl(&dword_232E63000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v134];
  }
  v23 = [(__CFString *)v4 representedResource];
  unint64_t v107 = [v23 extractionHints];

  id v153 = 0;
  v24 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"medicationCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v25 = v153;
  v113 = v25;
  if (v24 || !v25)
  {
    if (!v24)
    {
      v30 = [NSString stringWithFormat:@"Required value is nil, not creating valueMedicationCodingCollection instance to avoid throwing exception"];
      v31 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = *MEMORY[0x263F08320];
      v161[0] = @"propertyName";
      v161[1] = v32;
      v162[0] = @"medicationCodingCollection";
      v162[1] = v30;
      v33 = [NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:2];
      v34 = [v31 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v33];

      [v141 addObject:v34];
    }
  }
  else
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v28;
      __int16 v165 = 2114;
      v166 = @"medicationCodingCollection";
      __int16 v167 = 2114;
      id v168 = v113;
      id v29 = v28;
      _os_log_impl(&dword_232E63000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v113];
  }
  id v114 = v24;
  id v152 = 0;
  v138 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"assertionType" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v133 = v152;
  if (!v138 && v133)
  {
    _HKInitializeLogging();
    v35 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v36;
      __int16 v165 = 2114;
      v166 = @"assertionType";
      __int16 v167 = 2114;
      id v168 = v133;
      id v37 = v36;
      _os_log_impl(&dword_232E63000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v133];
  }
  uint64_t v106 = [v138 integerValue];
  id v151 = 0;
  v38 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"asserter" expectedClass:objc_opt_class() isArray:0 error:&v151];
  id v132 = v151;
  if (!v38 && v132)
  {
    _HKInitializeLogging();
    v39 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v40;
      __int16 v165 = 2114;
      v166 = @"asserter";
      __int16 v167 = 2114;
      id v168 = v132;
      id v41 = v40;
      _os_log_impl(&dword_232E63000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v132];
  }
  id v115 = v38;
  id v150 = 0;
  v42 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"assertionDate" expectedClass:objc_opt_class() isArray:0 error:&v150];
  id v131 = v150;
  if (!v42 && v131)
  {
    _HKInitializeLogging();
    v43 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      v44 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v44;
      __int16 v165 = 2114;
      v166 = @"assertionDate";
      __int16 v167 = 2114;
      id v168 = v131;
      id v45 = v44;
      _os_log_impl(&dword_232E63000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v131];
  }
  id v116 = v42;
  id v149 = 0;
  v46 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v47 = v149;
  v112 = v47;
  if (v46 || !v47)
  {
    if (!v46)
    {
      v52 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v53 = (void *)MEMORY[0x263F087E8];
      uint64_t v54 = *MEMORY[0x263F08320];
      v159[0] = @"propertyName";
      v159[1] = v54;
      v160[0] = @"statusCoding";
      v160[1] = v52;
      v55 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:2];
      v56 = [v53 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v55];

      [v141 addObject:v56];
    }
  }
  else
  {
    _HKInitializeLogging();
    v48 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v49 = v48;
      v50 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v50;
      __int16 v165 = 2114;
      v166 = @"statusCoding";
      __int16 v167 = 2114;
      id v168 = v112;
      id v51 = v50;
      _os_log_impl(&dword_232E63000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v112];
  }
  id v117 = v46;
  id v148 = 0;
  v57 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"dosages" expectedClass:objc_opt_class() isArray:1 error:&v148];
  id v130 = v148;
  if (!v57 && v130)
  {
    _HKInitializeLogging();
    v58 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v59;
      __int16 v165 = 2114;
      v166 = @"dosages";
      __int16 v167 = 2114;
      id v168 = v130;
      id v60 = v59;
      _os_log_impl(&dword_232E63000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v130];
  }
  id v118 = v57;
  id v147 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"earliestDosageDate" expectedClass:objc_opt_class() isArray:0 error:&v147];
  id v129 = v147;
  if (!v61 && v129)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v63;
      __int16 v165 = 2114;
      v166 = @"earliestDosageDate";
      __int16 v167 = 2114;
      id v168 = v129;
      id v64 = v63;
      _os_log_impl(&dword_232E63000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v129];
  }
  id v119 = v61;
  id v146 = 0;
  v65 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonForUseCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v146];
  id v128 = v146;
  if (!v65 && v128)
  {
    _HKInitializeLogging();
    v66 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v67;
      __int16 v165 = 2114;
      v166 = @"reasonForUseCodingCollections";
      __int16 v167 = 2114;
      id v168 = v128;
      id v68 = v67;
      _os_log_impl(&dword_232E63000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v128];
  }
  id v120 = v65;
  id v145 = 0;
  v137 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"notTaken" expectedClass:objc_opt_class() isArray:0 error:&v145];
  id v127 = v145;
  if (!v137 && v127)
  {
    _HKInitializeLogging();
    v69 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v70;
      __int16 v165 = 2114;
      v166 = @"notTaken";
      __int16 v167 = 2114;
      id v168 = v127;
      id v71 = v70;
      _os_log_impl(&dword_232E63000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v127];
  }
  char v105 = [v137 BOOLValue];
  id v144 = 0;
  v72 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonsNotTakenCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v144];
  id v126 = v144;
  if (!v72 && v126)
  {
    _HKInitializeLogging();
    v73 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v74;
      __int16 v165 = 2114;
      v166 = @"reasonsNotTakenCodingCollections";
      __int16 v167 = 2114;
      id v168 = v126;
      id v75 = v74;
      _os_log_impl(&dword_232E63000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v126];
  }
  id v121 = v72;
  id v143 = 0;
  v76 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveStartDate" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v125 = v143;
  if (!v76 && v125)
  {
    _HKInitializeLogging();
    v77 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v78;
      __int16 v165 = 2114;
      v166 = @"effectiveStartDate";
      __int16 v167 = 2114;
      id v168 = v125;
      id v79 = v78;
      _os_log_impl(&dword_232E63000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v125];
  }
  id v80 = v76;
  id v142 = 0;
  v81 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveEndDate" expectedClass:objc_opt_class() isArray:0 error:&v142];
  id v82 = v142;
  v83 = v82;
  if (!v81 && v82)
  {
    _HKInitializeLogging();
    v84 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      v85 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v164 = v85;
      __int16 v165 = 2114;
      v166 = @"effectiveEndDate";
      __int16 v167 = 2114;
      id v168 = v83;
      id v86 = v85;
      _os_log_impl(&dword_232E63000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v141 addObject:v83];
  }
  id v87 = v81;
  if (![v141 count])
  {
    v94 = [(__CFString *)v4 representedResource];
    v95 = [v94 receivedDate];
    v96 = v95;
    if (v95)
    {
      id v97 = v95;
    }
    else
    {
      id v97 = [MEMORY[0x263EFF910] date];
    }
    v93 = v97;

    uint64_t v98 = [v122 BOOLValue];
    id v92 = [MEMORY[0x263F0A2D8] localDevice];
    v99 = [(__CFString *)v4 medicalRecordMetadata];
    v100 = [MEMORY[0x263F0A540] medicationRecordType];
    LOBYTE(v104) = v105;
    objc_msgSend(MEMORY[0x263F0A538], "medicationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:medicationCodingCollection:assertionType:asserter:assertionDate:statusCoding:dosages:earliestDosageDate:reasonForUseCodingCollections:notTaken:reasonsNotTakenCodingCollections:effectiveStartDate:effectiveEndDate:", v100, v123, v98, v93, v110, v124, v111, v92, v99, v109, (v107 >> 2) & 1, v114, v106, v115, v116,
      v117,
      v118,
      v119,
      v120,
      v104,
      v121,
      v80,
      v87);
    id v140 = (id)objc_claimAutoreleasedReturnValue();
    v101 = [(__CFString *)v4 representedResource];
    v102 = [v101 firstSeenDate];
    [v140 _setCreationDate:v102];

    goto LABEL_98;
  }
  v88 = (void *)MEMORY[0x263F087E8];
  v157 = @"conversionErrors";
  id v158 = v141;
  v89 = [NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
  v90 = [v88 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v89];

  id v91 = v90;
  id v92 = v91;
  if (v91)
  {
    if (a4)
    {
      id v92 = v91;
      id v140 = 0;
      *a4 = v92;
      v93 = v92;
      goto LABEL_98;
    }
    _HKLogDroppedError();
  }
  id v140 = 0;
  v93 = v92;
LABEL_98:

  return v140;
}

@end