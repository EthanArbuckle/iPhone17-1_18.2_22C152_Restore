@interface HKDiagnosticTestReport(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKDiagnosticTestReport(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v118 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v117 = [v5 identifier];

  if (!v117)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v137 = (id)objc_opt_class();
      id v8 = v137;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v118 addObject:v9];
  }
  v99 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v117];
  v10 = [(__CFString *)v4 rulesVersion];
  uint64_t v100 = [v10 integerValue];

  if (v100 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v137 = v13;
      __int16 v138 = 2114;
      v139 = v4;
      id v14 = v13;
      _os_log_impl(&dword_232E63000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v15 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v118 addObject:v15];
  }
  id v127 = 0;
  v110 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v127];
  id v116 = v127;
  if (!v110 && v116)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v18;
      __int16 v138 = 2114;
      v139 = @"locale";
      __int16 v140 = 2114;
      id v141 = v116;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v116];
  }
  v98 = [(__CFString *)v4 country];
  id v126 = 0;
  v109 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v126];
  id v115 = v126;
  if (!v109 && v115)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v22;
      __int16 v138 = 2114;
      v139 = @"note";
      __int16 v140 = 2114;
      id v141 = v115;
      id v23 = v22;
      _os_log_impl(&dword_232E63000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v115];
  }
  id v125 = 0;
  v108 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v125];
  id v114 = v125;
  if (!v108 && v114)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v26;
      __int16 v138 = 2114;
      v139 = @"enteredInError";
      __int16 v140 = 2114;
      id v141 = v114;
      id v27 = v26;
      _os_log_impl(&dword_232E63000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v114];
  }
  v28 = [(__CFString *)v4 representedResource];
  unint64_t v96 = [v28 extractionHints];

  id v124 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"diagnosticTestCodingCollection" expectedClass:objc_opt_class() isArray:0 error:&v124];
  id v30 = v124;
  v102 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      v35 = [NSString stringWithFormat:@"Required value is nil, not creating valueDiagnosticTestCodingCollection instance to avoid throwing exception"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v134[0] = @"propertyName";
      v134[1] = v37;
      v135[0] = @"diagnosticTestCodingCollection";
      v135[1] = v35;
      v38 = [NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:2];
      v39 = [v36 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v38];

      [v118 addObject:v39];
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
      id v137 = v33;
      __int16 v138 = 2114;
      v139 = @"diagnosticTestCodingCollection";
      __int16 v140 = 2114;
      id v141 = v102;
      id v34 = v33;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v102];
  }
  id v103 = v29;
  id v123 = 0;
  v40 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"results" expectedClass:objc_opt_class() isArray:1 error:&v123];
  id v113 = v123;
  if (!v40 && v113)
  {
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      v43 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v43;
      __int16 v138 = 2114;
      v139 = @"results";
      __int16 v140 = 2114;
      id v141 = v113;
      id v44 = v43;
      _os_log_impl(&dword_232E63000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v113];
  }
  id v104 = v40;
  id v122 = 0;
  v45 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveStartDate" expectedClass:objc_opt_class() isArray:0 error:&v122];
  id v112 = v122;
  if (!v45 && v112)
  {
    _HKInitializeLogging();
    v46 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      v48 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v48;
      __int16 v138 = 2114;
      v139 = @"effectiveStartDate";
      __int16 v140 = 2114;
      id v141 = v112;
      id v49 = v48;
      _os_log_impl(&dword_232E63000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v112];
  }
  id v105 = v45;
  id v121 = 0;
  v50 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"statusCoding" expectedClass:objc_opt_class() isArray:0 error:&v121];
  id v51 = v121;
  v101 = v51;
  if (v50 || !v51)
  {
    if (!v50)
    {
      v56 = [NSString stringWithFormat:@"Required value is nil, not creating valueStatusCoding instance to avoid throwing exception"];
      v57 = (void *)MEMORY[0x263F087E8];
      uint64_t v58 = *MEMORY[0x263F08320];
      v132[0] = @"propertyName";
      v132[1] = v58;
      v133[0] = @"statusCoding";
      v133[1] = v56;
      v59 = [NSDictionary dictionaryWithObjects:v133 forKeys:v132 count:2];
      v60 = [v57 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v59];

      [v118 addObject:v60];
    }
  }
  else
  {
    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v53 = v52;
      v54 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v54;
      __int16 v138 = 2114;
      v139 = @"statusCoding";
      __int16 v140 = 2114;
      id v141 = v101;
      id v55 = v54;
      _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v101];
  }
  id v106 = v50;
  id v120 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"effectiveEndDate" expectedClass:objc_opt_class() isArray:0 error:&v120];
  id v111 = v120;
  if (!v61 && v111)
  {
    _HKInitializeLogging();
    v62 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v63 = v62;
      v64 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v64;
      __int16 v138 = 2114;
      v139 = @"effectiveEndDate";
      __int16 v140 = 2114;
      id v141 = v111;
      id v65 = v64;
      _os_log_impl(&dword_232E63000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v111];
  }
  id v107 = v61;
  id v119 = 0;
  v66 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"issueDate" expectedClass:objc_opt_class() isArray:0 error:&v119];
  id v67 = v119;
  v68 = v67;
  if (v66 || !v67)
  {
    if (!v66)
    {
      v73 = [NSString stringWithFormat:@"Required value is nil, not creating valueIssueDate instance to avoid throwing exception"];
      v74 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F08320];
      v130[0] = @"propertyName";
      v130[1] = v75;
      v131[0] = @"issueDate";
      v131[1] = v73;
      v76 = [NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
      v77 = [v74 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v76];

      [v118 addObject:v77];
    }
  }
  else
  {
    _HKInitializeLogging();
    v69 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v70 = v69;
      v71 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v137 = v71;
      __int16 v138 = 2114;
      v139 = @"issueDate";
      __int16 v140 = 2114;
      id v141 = v68;
      id v72 = v71;
      _os_log_impl(&dword_232E63000, v70, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v118 addObject:v68];
  }
  id v78 = v66;
  if (![v118 count])
  {
    v86 = [(__CFString *)v4 representedResource];
    v87 = [v86 receivedDate];
    v88 = v87;
    if (v87)
    {
      id v89 = v87;
    }
    else
    {
      id v89 = [MEMORY[0x263EFF910] date];
    }
    v85 = v89;

    uint64_t v90 = [v108 BOOLValue];
    id v83 = [MEMORY[0x263F0A2D8] localDevice];
    v91 = [(__CFString *)v4 medicalRecordMetadata];
    v92 = [MEMORY[0x263F0A318] diagnosticTestReportType];
    objc_msgSend(MEMORY[0x263F0A310], "diagnosticTestReportWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:country:state:diagnosticTestCodingCollection:results:effectiveStartDate:statusCoding:effectiveEndDate:issueDate:", v92, v109, v90, v85, v99, v110, v100, v83, v91, v98, (v96 >> 2) & 1, v103, v104, v105, v106, v107,
    v84 = v78);
    v93 = [(__CFString *)v4 representedResource];
    v94 = [v93 firstSeenDate];
    [v84 _setCreationDate:v94];

    goto LABEL_70;
  }
  v79 = (void *)MEMORY[0x263F087E8];
  v128 = @"conversionErrors";
  id v129 = v118;
  v80 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  v81 = [v79 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v80];

  id v82 = v81;
  id v83 = v82;
  if (v82)
  {
    if (a4)
    {
      id v83 = v82;
      v84 = 0;
      *a4 = v83;
      v85 = v83;
      goto LABEL_70;
    }
    _HKLogDroppedError();
  }
  v84 = 0;
  v85 = v83;
LABEL_70:

  return v84;
}

@end