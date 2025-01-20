@interface HKCoverageRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKCoverageRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v170 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v138 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v136 = [v5 identifier];

  if (!v136)
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
    [v138 addObject:v8];
  }
  v104 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v136];
  v9 = [(__CFString *)v4 rulesVersion];
  uint64_t v10 = [v9 integerValue];

  if (v10 <= 0)
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v165 = v12;
      __int16 v166 = 2114;
      v167 = v4;
      _os_log_impl(&dword_232E63000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v13 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v138 addObject:v13];
  }
  id v155 = 0;
  v122 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v155];
  id v135 = v155;
  if (!v122 && v135)
  {
    _HKInitializeLogging();
    v14 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v15;
      __int16 v166 = 2114;
      v167 = @"locale";
      __int16 v168 = 2114;
      id v169 = v135;
      _os_log_impl(&dword_232E63000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v135];
  }
  v103 = [(__CFString *)v4 country];
  id v154 = 0;
  v121 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v154];
  id v134 = v154;
  if (!v121 && v134)
  {
    _HKInitializeLogging();
    v16 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v17;
      __int16 v166 = 2114;
      v167 = @"note";
      __int16 v168 = 2114;
      id v169 = v134;
      _os_log_impl(&dword_232E63000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v134];
  }
  id v153 = 0;
  v120 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v153];
  id v133 = v153;
  if (!v120 && v133)
  {
    _HKInitializeLogging();
    v18 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v19;
      __int16 v166 = 2114;
      v167 = @"enteredInError";
      __int16 v168 = 2114;
      id v169 = v133;
      _os_log_impl(&dword_232E63000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v133];
  }
  v20 = [(__CFString *)v4 representedResource];
  unint64_t v101 = [v20 extractionHints];

  id v152 = 0;
  v21 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v152];
  id v22 = v152;
  v107 = v22;
  if (v21 || !v22)
  {
    if (!v21)
    {
      v25 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v162[0] = @"propertyName";
      v162[1] = v27;
      v163[0] = @"statusCoding";
      v163[1] = v25;
      v28 = [NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:2];
      v29 = [v26 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v28];

      [v138 addObject:v29];
    }
  }
  else
  {
    _HKInitializeLogging();
    v23 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v24;
      __int16 v166 = 2114;
      v167 = @"statusCoding";
      __int16 v168 = 2114;
      id v169 = v107;
      _os_log_impl(&dword_232E63000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v107];
  }
  id v108 = v21;
  id v151 = 0;
  v30 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"coverageTypeCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v151];
  id v31 = v151;
  v106 = v31;
  if (v30 || !v31)
  {
    if (!v30)
    {
      v34 = [NSString stringWithFormat:@"Required value is nil, not creating valueCoverageTypeCodingCollection instance to avoid throwing exception"];
      v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F08320];
      v160[0] = @"propertyName";
      v160[1] = v36;
      v161[0] = @"coverageTypeCodingCollection";
      v161[1] = v34;
      v37 = [NSDictionary dictionaryWithObjects:v161 forKeys:v160 count:2];
      v38 = [v35 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v37];

      [v138 addObject:v38];
    }
  }
  else
  {
    _HKInitializeLogging();
    v32 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v33;
      __int16 v166 = 2114;
      v167 = @"coverageTypeCodingCollection";
      __int16 v168 = 2114;
      id v169 = v106;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v106];
  }
  id v109 = v30;
  id v150 = 0;
  v39 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"subscriber" expectedClass:objc_opt_class() isArray:0 error:&v150];
  id v132 = v150;
  if (!v39 && v132)
  {
    _HKInitializeLogging();
    v40 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      id v41 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v41;
      __int16 v166 = 2114;
      v167 = @"subscriber";
      __int16 v168 = 2114;
      id v169 = v132;
      _os_log_impl(&dword_232E63000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v132];
  }
  id v110 = v39;
  id v149 = 0;
  v42 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"subscriberId" expectedClass:objc_opt_class() isArray:0 error:&v149];
  id v43 = v149;
  v105 = v43;
  if (v42 || !v43)
  {
    if (!v42)
    {
      v46 = [NSString stringWithFormat:@"Required value is nil, not creating valueSubscriberId instance to avoid throwing exception"];
      v47 = (void *)MEMORY[0x263F087E8];
      uint64_t v48 = *MEMORY[0x263F08320];
      v158[0] = @"propertyName";
      v158[1] = v48;
      v159[0] = @"subscriberId";
      v159[1] = v46;
      v49 = [NSDictionary dictionaryWithObjects:v159 forKeys:v158 count:2];
      v50 = [v47 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v49];

      [v138 addObject:v50];
    }
  }
  else
  {
    _HKInitializeLogging();
    v44 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      id v45 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v45;
      __int16 v166 = 2114;
      v167 = @"subscriberId";
      __int16 v168 = 2114;
      id v169 = v105;
      _os_log_impl(&dword_232E63000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v105];
  }
  id v111 = v42;
  id v148 = 0;
  v51 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"beneficiary" expectedClass:objc_opt_class() isArray:0 error:&v148];
  id v131 = v148;
  if (!v51 && v131)
  {
    _HKInitializeLogging();
    v52 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      id v53 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v53;
      __int16 v166 = 2114;
      v167 = @"beneficiary";
      __int16 v168 = 2114;
      id v169 = v131;
      _os_log_impl(&dword_232E63000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v131];
  }
  id v112 = v51;
  id v147 = 0;
  v54 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"policyHolder" expectedClass:objc_opt_class() isArray:0 error:&v147];
  id v130 = v147;
  if (!v54 && v130)
  {
    _HKInitializeLogging();
    v55 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      id v56 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v56;
      __int16 v166 = 2114;
      v167 = @"policyHolder";
      __int16 v168 = 2114;
      id v169 = v130;
      _os_log_impl(&dword_232E63000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v130];
  }
  id v113 = v54;
  id v146 = 0;
  v57 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"payor" expectedClass:objc_opt_class() isArray:1 error:&v146];
  id v129 = v146;
  if (!v57 && v129)
  {
    _HKInitializeLogging();
    v58 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      id v59 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v59;
      __int16 v166 = 2114;
      v167 = @"payor";
      __int16 v168 = 2114;
      id v169 = v129;
      _os_log_impl(&dword_232E63000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v129];
  }
  id v114 = v57;
  id v145 = 0;
  v60 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"relationshipCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v145];
  id v128 = v145;
  if (!v60 && v128)
  {
    _HKInitializeLogging();
    v61 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      id v62 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v62;
      __int16 v166 = 2114;
      v167 = @"relationshipCodingCollection";
      __int16 v168 = 2114;
      id v169 = v128;
      _os_log_impl(&dword_232E63000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v128];
  }
  id v115 = v60;
  id v144 = 0;
  v63 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"classification" expectedClass:objc_opt_class() isArray:1 error:&v144];
  id v127 = v144;
  if (!v63 && v127)
  {
    _HKInitializeLogging();
    v64 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      id v65 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v65;
      __int16 v166 = 2114;
      v167 = @"classification";
      __int16 v168 = 2114;
      id v169 = v127;
      _os_log_impl(&dword_232E63000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v127];
  }
  id v116 = v63;
  id v143 = 0;
  v66 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"network" expectedClass:objc_opt_class() isArray:0 error:&v143];
  id v126 = v143;
  if (!v66 && v126)
  {
    _HKInitializeLogging();
    v67 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v68;
      __int16 v166 = 2114;
      v167 = @"network";
      __int16 v168 = 2114;
      id v169 = v126;
      _os_log_impl(&dword_232E63000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v126];
  }
  id v117 = v66;
  id v142 = 0;
  v69 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"periodStartDate" expectedClass:objc_opt_class() isArray:0 error:&v142];
  id v125 = v142;
  if (!v69 && v125)
  {
    _HKInitializeLogging();
    v70 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      id v71 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v71;
      __int16 v166 = 2114;
      v167 = @"periodStartDate";
      __int16 v168 = 2114;
      id v169 = v125;
      _os_log_impl(&dword_232E63000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v125];
  }
  id v118 = v69;
  id v141 = 0;
  v72 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"periodEndDate" expectedClass:objc_opt_class() isArray:0 error:&v141];
  id v124 = v141;
  if (!v72 && v124)
  {
    _HKInitializeLogging();
    v73 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      id v74 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v74;
      __int16 v166 = 2114;
      v167 = @"periodEndDate";
      __int16 v168 = 2114;
      id v169 = v124;
      _os_log_impl(&dword_232E63000, v73, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v124];
  }
  id v119 = v72;
  id v140 = 0;
  v75 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"subscriberIdentifier" expectedClass:objc_opt_class() isArray:0 error:&v140];
  id v123 = v140;
  if (!v75 && v123)
  {
    _HKInitializeLogging();
    v76 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      id v77 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v77;
      __int16 v166 = 2114;
      v167 = @"subscriberIdentifier";
      __int16 v168 = 2114;
      id v169 = v123;
      _os_log_impl(&dword_232E63000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v123];
  }
  id v78 = v75;
  id v139 = 0;
  v79 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"beneficiaryIdentifier" expectedClass:objc_opt_class() isArray:0 error:&v139];
  id v80 = v139;
  v81 = v80;
  if (!v79 && v80)
  {
    _HKInitializeLogging();
    v82 = (id)*MEMORY[0x263F09908];
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      id v83 = (id)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v165 = v83;
      __int16 v166 = 2114;
      v167 = @"beneficiaryIdentifier";
      __int16 v168 = 2114;
      id v169 = v81;
      _os_log_impl(&dword_232E63000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v138 addObject:v81];
  }
  id v84 = v79;
  if (![v138 count])
  {
    v92 = [(__CFString *)v4 representedResource];
    v93 = [v92 receivedDate];
    v94 = v93;
    if (v93)
    {
      id v91 = v93;
    }
    else
    {
      id v91 = [MEMORY[0x263EFF910] date];
    }
    uint64_t v95 = [v120 BOOLValue];
    id v89 = [MEMORY[0x263F0A2D8] localDevice];
    v137 = [(__CFString *)v4 medicalRecordMetadata];
    v96 = [MEMORY[0x263F0A2A0] coverageRecordType];
    objc_msgSend(MEMORY[0x263F0A298], "coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:", v96, v121, v95, v91, v104, v122, v10, v89, v137, v103, (v101 >> 2) & 1, v108, v109, v110, v111,
      v112,
      v113,
      v114,
      v115,
      v116,
      v117,
      v118,
      v119,
      v78,
    v97 = v84);
    v98 = [(__CFString *)v4 representedResource];
    v99 = [v98 firstSeenDate];
    [v97 _setCreationDate:v99];

    id v90 = v97;
    goto LABEL_110;
  }
  v85 = (void *)MEMORY[0x263F087E8];
  v156 = @"conversionErrors";
  id v157 = v138;
  v86 = [NSDictionary dictionaryWithObjects:&v157 forKeys:&v156 count:1];
  v87 = [v85 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v86];

  id v88 = v87;
  id v89 = v88;
  if (v88)
  {
    if (a4)
    {
      id v89 = v88;
      id v90 = 0;
      *a4 = v89;
      id v91 = v89;
      goto LABEL_110;
    }
    _HKLogDroppedError();
  }
  id v90 = 0;
  id v91 = v89;
LABEL_110:

  return v90;
}

@end