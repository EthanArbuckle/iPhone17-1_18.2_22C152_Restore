@interface HKVaccinationRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKVaccinationRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v139 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v137 = [v5 identifier];

  if (!v137)
  {
    _HKInitializeLogging();
    v6 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v165 = v7;
      _os_log_impl(&dword_232E63000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v139 addObject:v8];
  }
  v102 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v137];
  v9 = [(__CFString *)v4 rulesVersion];
  uint64_t v103 = [v9 integerValue];

  if (v103 <= 0)
  {
    _HKInitializeLogging();
    v10 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v165 = v11;
      __int16 v166 = 2114;
      v167 = v4;
      _os_log_impl(&dword_232E63000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v12 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v139 addObject:v12];
  }
  id v157 = 0;
  v119 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v157];
  id v134 = v157;
  if (!v119 && v134)
  {
    _HKInitializeLogging();
    v13 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v14;
      __int16 v166 = 2114;
      v167 = @"locale";
      __int16 v168 = 2114;
      id v169 = v134;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v134];
  }
  v101 = [(__CFString *)v4 country];
  id v156 = 0;
  v118 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v156];
  id v133 = v156;
  if (!v118 && v133)
  {
    _HKInitializeLogging();
    v15 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v16;
      __int16 v166 = 2114;
      v167 = @"note";
      __int16 v168 = 2114;
      id v169 = v133;
      _os_log_impl(&dword_232E63000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v133];
  }
  id v155 = 0;
  v117 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v155];
  id v132 = v155;
  if (!v117 && v132)
  {
    _HKInitializeLogging();
    v17 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v18;
      __int16 v166 = 2114;
      v167 = @"enteredInError";
      __int16 v168 = 2114;
      id v169 = v132;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v132];
  }
  v19 = [(__CFString *)v4 representedResource];
  unint64_t v99 = [v19 extractionHints];

  id v154 = 0;
  v20 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"vaccinationCodings" expectedClass:objc_opt_class() isArray:1 error:&v154];
  id v21 = v154;
  v105 = v21;
  if (v20 || !v21)
  {
    if (!v20)
    {
      v24 = [NSString stringWithFormat:@"Required value is nil, not creating valueVaccinationCodings instance to avoid throwing exception"];
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v162[0] = @"propertyName";
      v162[1] = v26;
      v163[0] = @"vaccinationCodings";
      v163[1] = v24;
      v27 = [NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:2];
      v28 = [v25 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v27];

      [v139 addObject:v28];
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
      id v165 = v23;
      __int16 v166 = 2114;
      v167 = @"vaccinationCodings";
      __int16 v168 = 2114;
      id v169 = v105;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v105];
  }
  id v106 = v20;
  id v153 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"expirationDate" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v131 = v153;
  if (!v29 && v131)
  {
    _HKInitializeLogging();
    v30 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v31;
      __int16 v166 = 2114;
      v167 = @"expirationDate";
      __int16 v168 = 2114;
      id v169 = v131;
      _os_log_impl(&dword_232E63000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v131];
  }
  id v107 = v29;
  id v152 = 0;
  v32 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"doseNumber" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v130 = v152;
  if (!v32 && v130)
  {
    _HKInitializeLogging();
    v33 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v34;
      __int16 v166 = 2114;
      v167 = @"doseNumber";
      __int16 v168 = 2114;
      id v169 = v130;
      _os_log_impl(&dword_232E63000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v130];
  }
  id v108 = v32;
  id v151 = 0;
  v35 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"doseQuantity" expectedClass:objc_opt_class() isArray:0 error:&v151];
  id v129 = v151;
  if (!v35 && v129)
  {
    _HKInitializeLogging();
    v36 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v37;
      __int16 v166 = 2114;
      v167 = @"doseQuantity";
      __int16 v168 = 2114;
      id v169 = v129;
      _os_log_impl(&dword_232E63000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v129];
  }
  id v109 = v35;
  id v150 = 0;
  v38 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"lotNumber" expectedClass:objc_opt_class() isArray:0 error:&v150];
  id v128 = v150;
  if (!v38 && v128)
  {
    _HKInitializeLogging();
    v39 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v40;
      __int16 v166 = 2114;
      v167 = @"lotNumber";
      __int16 v168 = 2114;
      id v169 = v128;
      _os_log_impl(&dword_232E63000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v128];
  }
  id v110 = v38;
  id v149 = 0;
  v41 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"performer" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v127 = v149;
  if (!v41 && v127)
  {
    _HKInitializeLogging();
    v42 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v43;
      __int16 v166 = 2114;
      v167 = @"performer";
      __int16 v168 = 2114;
      id v169 = v127;
      _os_log_impl(&dword_232E63000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v127];
  }
  id v111 = v41;
  id v148 = 0;
  v44 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"bodySiteCodings" expectedClass:objc_opt_class() isArray:1 error:&v148];
  id v126 = v148;
  if (!v44 && v126)
  {
    _HKInitializeLogging();
    v45 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      id v46 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v46;
      __int16 v166 = 2114;
      v167 = @"bodySiteCodings";
      __int16 v168 = 2114;
      id v169 = v126;
      _os_log_impl(&dword_232E63000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v126];
  }
  id v112 = v44;
  id v147 = 0;
  v47 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reaction" expectedClass:objc_opt_class() isArray:0 error:&v147];
  id v125 = v147;
  if (!v47 && v125)
  {
    _HKInitializeLogging();
    v48 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      id v49 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v49;
      __int16 v166 = 2114;
      v167 = @"reaction";
      __int16 v168 = 2114;
      id v169 = v125;
      _os_log_impl(&dword_232E63000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v125];
  }
  id v114 = v47;
  id v146 = 0;
  v136 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"notGiven" expectedClass:objc_opt_class() isArray:0 error:&v146];
  id v124 = v146;
  if (!v136 && v124)
  {
    _HKInitializeLogging();
    v50 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      id v51 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v51;
      __int16 v166 = 2114;
      v167 = @"notGiven";
      __int16 v168 = 2114;
      id v169 = v124;
      _os_log_impl(&dword_232E63000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v124];
  }
  char v98 = [v136 BOOLValue];
  id v145 = 0;
  v52 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"administrationDate" expectedClass:objc_opt_class() isArray:0 error:&v145];
  id v53 = v145;
  v104 = v53;
  if (v52 || !v53)
  {
    if (!v52)
    {
      v56 = [NSString stringWithFormat:@"Required value is nil, not creating valueAdministrationDate instance to avoid throwing exception"];
      v57 = (void *)MEMORY[0x263F087E8];
      uint64_t v58 = *MEMORY[0x263F08320];
      v160[0] = @"propertyName";
      v160[1] = v58;
      v161[0] = @"administrationDate";
      v161[1] = v56;
      v59 = [NSDictionary dictionaryWithObjects:v161 forKeys:v160 count:2];
      v60 = [v57 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v59];

      [v139 addObject:v60];
    }
  }
  else
  {
    _HKInitializeLogging();
    v54 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      id v55 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v55;
      __int16 v166 = 2114;
      v167 = @"administrationDate";
      __int16 v168 = 2114;
      id v169 = v104;
      _os_log_impl(&dword_232E63000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v104];
  }
  id v113 = v52;
  id v144 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v144];
  id v123 = v144;
  if (!v61 && v123)
  {
    _HKInitializeLogging();
    v62 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v63;
      __int16 v166 = 2114;
      v167 = @"statusCoding";
      __int16 v168 = 2114;
      id v169 = v123;
      _os_log_impl(&dword_232E63000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v123];
  }
  id v115 = v61;
  id v143 = 0;
  v135 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"patientReported" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v122 = v143;
  if (!v135 && v122)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v65;
      __int16 v166 = 2114;
      v167 = @"patientReported";
      __int16 v168 = 2114;
      id v169 = v122;
      _os_log_impl(&dword_232E63000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v122];
  }
  char v66 = [v135 BOOLValue];
  id v142 = 0;
  v67 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"routeCodings" expectedClass:objc_opt_class() isArray:1 error:&v142];
  id v121 = v142;
  if (!v67 && v121)
  {
    _HKInitializeLogging();
    v68 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      id v69 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v69;
      __int16 v166 = 2114;
      v167 = @"routeCodings";
      __int16 v168 = 2114;
      id v169 = v121;
      _os_log_impl(&dword_232E63000, v68, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v121];
  }
  id v116 = v67;
  id v141 = 0;
  v70 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonsCodings" expectedClass:objc_opt_class() isArray:1 error:&v141];
  id v120 = v141;
  if (!v70 && v120)
  {
    _HKInitializeLogging();
    v71 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      id v72 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v72;
      __int16 v166 = 2114;
      v167 = @"reasonsCodings";
      __int16 v168 = 2114;
      id v169 = v120;
      _os_log_impl(&dword_232E63000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v120];
  }
  id v73 = v70;
  id v140 = 0;
  v74 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"reasonsNotGivenCodings" expectedClass:objc_opt_class() isArray:1 error:&v140];
  id v75 = v140;
  v76 = v75;
  if (!v74 && v75)
  {
    _HKInitializeLogging();
    v77 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      id v78 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v78;
      __int16 v166 = 2114;
      v167 = @"reasonsNotGivenCodings";
      __int16 v168 = 2114;
      id v169 = v76;
      _os_log_impl(&dword_232E63000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v139 addObject:v76];
  }
  id v79 = v74;
  if (![v139 count])
  {
    v87 = [(__CFString *)v4 representedResource];
    v88 = [v87 receivedDate];
    v89 = v88;
    if (v88)
    {
      id v86 = v88;
    }
    else
    {
      id v86 = [MEMORY[0x263EFF910] date];
    }
    uint64_t v90 = [v117 BOOLValue];
    id v84 = [MEMORY[0x263F0A2D8] localDevice];
    v138 = [(__CFString *)v4 medicalRecordMetadata];
    v91 = [MEMORY[0x263F0A8A0] vaccinationRecordType];
    LOBYTE(v97) = v66;
    LOBYTE(v96) = v98;
    objc_msgSend(MEMORY[0x263F0A898], "vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:", v91, v118, v90, v86, v102, v119, v103, v84, v138, v101, (v99 >> 2) & 1, v106, v107, v108, v109,
      v110,
      v111,
      v112,
      v114,
      v96,
      v113,
      v115,
      v97,
      v116,
      v73,
    v92 = v79);
    v93 = [(__CFString *)v4 representedResource];
    v94 = [v93 firstSeenDate];
    [v92 _setCreationDate:v94];

    id v85 = v92;
    goto LABEL_113;
  }
  v80 = (void *)MEMORY[0x263F087E8];
  v158 = @"conversionErrors";
  id v159 = v139;
  v81 = [NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
  v82 = [v80 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v81];

  id v83 = v82;
  id v84 = v83;
  if (v83)
  {
    if (a4)
    {
      id v84 = v83;
      id v85 = 0;
      *a4 = v84;
      id v86 = v84;
      goto LABEL_113;
    }
    _HKLogDroppedError();
  }
  id v85 = 0;
  id v86 = v84;
LABEL_113:

  return v85;
}

@end