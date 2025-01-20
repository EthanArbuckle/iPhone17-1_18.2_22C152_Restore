@interface HKProcedureRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKProcedureRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v156 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v127 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v125 = [v5 identifier];

  if (!v125)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v151 = v7;
      _os_log_impl(&dword_232E63000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v127 addObject:v8];
  }
  v94 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v125];
  v9 = [(__CFString *)v4 rulesVersion];
  uint64_t v95 = [v9 integerValue];

  if (v95 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v151 = v11;
      __int16 v152 = 2114;
      v153 = v4;
      _os_log_impl(&dword_232E63000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v12 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v127 addObject:v12];
  }
  id v143 = 0;
  v110 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v123 = v143;
  if (!v110 && v123)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v14;
      __int16 v152 = 2114;
      v153 = @"locale";
      __int16 v154 = 2114;
      id v155 = v123;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v123];
  }
  v93 = [(__CFString *)v4 country];
  id v142 = 0;
  v109 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v142];
  id v122 = v142;
  if (!v109 && v122)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v16;
      __int16 v152 = 2114;
      v153 = @"note";
      __int16 v154 = 2114;
      id v155 = v122;
      _os_log_impl(&dword_232E63000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v122];
  }
  id v141 = 0;
  v108 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v141];
  id v121 = v141;
  if (!v108 && v121)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v18;
      __int16 v152 = 2114;
      v153 = @"enteredInError";
      __int16 v154 = 2114;
      id v155 = v121;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v121];
  }
  v19 = [(__CFString *)v4 representedResource];
  unint64_t v91 = [v19 extractionHints];

  id v140 = 0;
  v20 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"procedureCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v140];
  id v21 = v140;
  v97 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      v24 = [NSString stringWithFormat:@"Required value is nil, not creating valueProcedureCodingCollection instance to avoid throwing exception"];
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v148[0] = @"propertyName";
      v148[1] = v26;
      v149[0] = @"procedureCodingCollection";
      v149[1] = v24;
      v27 = [NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:2];
      v28 = [v25 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v27];

      [v127 addObject:v28];
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
      id v151 = v23;
      __int16 v152 = 2114;
      v153 = @"procedureCodingCollection";
      __int16 v154 = 2114;
      id v155 = v97;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v97];
  }
  id v98 = v20;
  id v139 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"performers" expectedClass:objc_opt_class() isArray:1 error:&v139];
  id v120 = v139;
  if (!v29 && v120)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v31;
      __int16 v152 = 2114;
      v153 = @"performers";
      __int16 v154 = 2114;
      id v155 = v120;
      _os_log_impl(&dword_232E63000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v120];
  }
  id v99 = v29;
  id v138 = 0;
  v32 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"executionStartDate" expectedClass:objc_opt_class() isArray:0 error:&v138];
  id v119 = v138;
  if (!v32 && v119)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v34;
      __int16 v152 = 2114;
      v153 = @"executionStartDate";
      __int16 v154 = 2114;
      id v155 = v119;
      _os_log_impl(&dword_232E63000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v119];
  }
  id v100 = v32;
  id v137 = 0;
  v35 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"executionEndDate" expectedClass:objc_opt_class() isArray:0 error:&v137];
  id v118 = v137;
  if (!v35 && v118)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v37;
      __int16 v152 = 2114;
      v153 = @"executionEndDate";
      __int16 v154 = 2114;
      id v155 = v118;
      _os_log_impl(&dword_232E63000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v118];
  }
  id v102 = v35;
  id v136 = 0;
  v124 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"notPerformed" expectedClass:objc_opt_class() isArray:0 error:&v136];
  id v117 = v136;
  if (!v124 && v117)
  {
    _HKInitializeLogging();
    v38 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v39;
      __int16 v152 = 2114;
      v153 = @"notPerformed";
      __int16 v154 = 2114;
      id v155 = v117;
      _os_log_impl(&dword_232E63000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v117];
  }
  char v90 = [v124 BOOLValue];
  id v135 = 0;
  v40 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v135];
  id v41 = v135;
  v96 = v41;
  if (v40 || !v41)
  {
    if (!v40)
    {
      v44 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v45 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v146[0] = @"propertyName";
      v146[1] = v46;
      v147[0] = @"statusCoding";
      v147[1] = v44;
      v47 = [NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:2];
      v48 = [v45 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v47];

      [v127 addObject:v48];
    }
  }
  else
  {
    _HKInitializeLogging();
    v42 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v43;
      __int16 v152 = 2114;
      v153 = @"statusCoding";
      __int16 v154 = 2114;
      id v155 = v96;
      _os_log_impl(&dword_232E63000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v96];
  }
  id v101 = v40;
  id v134 = 0;
  v49 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"categoryCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v134];
  id v116 = v134;
  if (!v49 && v116)
  {
    _HKInitializeLogging();
    v50 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v51;
      __int16 v152 = 2114;
      v153 = @"categoryCodingCollection";
      __int16 v154 = 2114;
      id v155 = v116;
      _os_log_impl(&dword_232E63000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v116];
  }
  id v103 = v49;
  id v133 = 0;
  v52 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v133];
  id v115 = v133;
  if (!v52 && v115)
  {
    _HKInitializeLogging();
    v53 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      id v54 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v54;
      __int16 v152 = 2114;
      v153 = @"reasonCodingCollections";
      __int16 v154 = 2114;
      id v155 = v115;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v115];
  }
  id v104 = v52;
  id v132 = 0;
  v55 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonsNotPerformedCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v132];
  id v114 = v132;
  if (!v55 && v114)
  {
    _HKInitializeLogging();
    v56 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      id v57 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v57;
      __int16 v152 = 2114;
      v153 = @"reasonsNotPerformedCodingCollections";
      __int16 v154 = 2114;
      id v155 = v114;
      _os_log_impl(&dword_232E63000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v114];
  }
  id v105 = v55;
  id v131 = 0;
  v58 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"outcomeCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v131];
  id v113 = v131;
  if (!v58 && v113)
  {
    _HKInitializeLogging();
    v59 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      id v60 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v60;
      __int16 v152 = 2114;
      v153 = @"outcomeCodingCollection";
      __int16 v154 = 2114;
      id v155 = v113;
      _os_log_impl(&dword_232E63000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v113];
  }
  id v106 = v58;
  id v130 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"complicationsCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v130];
  id v112 = v130;
  if (!v61 && v112)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v63;
      __int16 v152 = 2114;
      v153 = @"complicationsCodingCollections";
      __int16 v154 = 2114;
      id v155 = v112;
      _os_log_impl(&dword_232E63000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v112];
  }
  id v107 = v61;
  id v129 = 0;
  v64 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"followUpsCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v129];
  id v111 = v129;
  if (!v64 && v111)
  {
    _HKInitializeLogging();
    v65 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      id v66 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v66;
      __int16 v152 = 2114;
      v153 = @"followUpsCodingCollections";
      __int16 v154 = 2114;
      id v155 = v111;
      _os_log_impl(&dword_232E63000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v111];
  }
  id v67 = v64;
  id v128 = 0;
  v68 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"bodySitesCodingCollections" expectedClass:objc_opt_class() isArray:1 error:&v128];
  id v69 = v128;
  v70 = v69;
  if (!v68 && v69)
  {
    _HKInitializeLogging();
    v71 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      id v72 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v151 = v72;
      __int16 v152 = 2114;
      v153 = @"bodySitesCodingCollections";
      __int16 v154 = 2114;
      id v155 = v70;
      _os_log_impl(&dword_232E63000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v127 addObject:v70];
  }
  id v73 = v68;
  if (![v127 count])
  {
    v80 = [(__CFString *)v4 representedResource];
    v81 = [v80 receivedDate];
    v82 = v81;
    if (v81)
    {
      id v79 = v81;
    }
    else
    {
      id v79 = [MEMORY[0x263EFF910] date];
    }
    uint64_t v83 = [v108 BOOLValue];
    id v78 = [MEMORY[0x263F0A2D8] localDevice];
    v84 = [(__CFString *)v4 medicalRecordMetadata];
    v85 = [MEMORY[0x263F0A610] procedureRecordType];
    LOBYTE(v89) = v90;
    objc_msgSend(MEMORY[0x263F0A608], "procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:", v85, v109, v83, v79, v94, v110, v95, v78, v84, v93, (v91 >> 2) & 1, v98, v99, v100,
      v102,
      v89,
      v101,
      v103,
      v104,
      v105,
      v106,
      v107,
      v67,
      v73);
    id v126 = (id)objc_claimAutoreleasedReturnValue();
    v86 = [(__CFString *)v4 representedResource];
    v87 = [v86 firstSeenDate];
    [v126 _setCreationDate:v87];

    goto LABEL_103;
  }
  v74 = (void *)MEMORY[0x263F087E8];
  v144 = @"conversionErrors";
  id v145 = v127;
  v75 = [NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
  v76 = [v74 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v75];

  id v77 = v76;
  id v78 = v77;
  if (v77)
  {
    if (a4)
    {
      id v78 = v77;
      id v126 = 0;
      *a4 = v78;
      id v79 = v78;
      goto LABEL_103;
    }
    _HKLogDroppedError();
  }
  id v126 = 0;
  id v79 = v78;
LABEL_103:

  return v126;
}

@end