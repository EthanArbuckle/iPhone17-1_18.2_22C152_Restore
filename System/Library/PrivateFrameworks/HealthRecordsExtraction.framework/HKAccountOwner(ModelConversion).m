@interface HKAccountOwner(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKAccountOwner(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v79 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v78 = [v5 identifier];

  if (!v78)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v90 = (id)objc_opt_class();
      id v8 = v90;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v79 addObject:v9];
  }
  v69 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v78];
  v10 = [(__CFString *)v4 rulesVersion];
  uint64_t v70 = [v10 integerValue];

  if (v70 <= 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v90 = v13;
      __int16 v91 = 2114;
      v92 = v4;
      id v14 = v13;
      _os_log_impl(&dword_232E63000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v15 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v79 addObject:v15];
  }
  id v84 = 0;
  v74 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v84];
  id v77 = v84;
  if (!v74 && v77)
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v90 = v18;
      __int16 v91 = 2114;
      v92 = @"locale";
      __int16 v93 = 2114;
      id v94 = v77;
      id v19 = v18;
      _os_log_impl(&dword_232E63000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v79 addObject:v77];
  }
  v68 = [(__CFString *)v4 country];
  id v83 = 0;
  v73 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v83];
  id v76 = v83;
  if (!v73 && v76)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v90 = v22;
      __int16 v91 = 2114;
      v92 = @"note";
      __int16 v93 = 2114;
      id v94 = v76;
      id v23 = v22;
      _os_log_impl(&dword_232E63000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v79 addObject:v76];
  }
  id v82 = 0;
  v72 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v82];
  id v75 = v82;
  if (!v72 && v75)
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v90 = v26;
      __int16 v91 = 2114;
      v92 = @"enteredInError";
      __int16 v93 = 2114;
      id v94 = v75;
      id v27 = v26;
      _os_log_impl(&dword_232E63000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v79 addObject:v75];
  }
  v28 = [(__CFString *)v4 representedResource];
  unint64_t v66 = [v28 extractionHints];

  id v81 = 0;
  v29 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"name" expectedClass:objc_opt_class() isArray:0 error:&v81];
  id v30 = v81;
  v71 = v30;
  if (v29 || !v30)
  {
    if (!v29)
    {
      v35 = [NSString stringWithFormat:@"Required value is nil, not creating valueName instance to avoid throwing exception"];
      v36 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08320];
      v87[0] = @"propertyName";
      v87[1] = v37;
      v88[0] = @"name";
      v88[1] = v35;
      v38 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
      v39 = [v36 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:204 userInfo:v38];

      [v79 addObject:v39];
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
      id v90 = v33;
      __int16 v91 = 2114;
      v92 = @"name";
      __int16 v93 = 2114;
      id v94 = v71;
      id v34 = v33;
      _os_log_impl(&dword_232E63000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v79 addObject:v71];
  }
  id v40 = v29;
  id v80 = 0;
  v41 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"birthDate" expectedClass:objc_opt_class() isArray:0 error:&v80];
  id v42 = v80;
  v43 = v42;
  if (!v41 && v42)
  {
    _HKInitializeLogging();
    v44 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v90 = v46;
      __int16 v91 = 2114;
      v92 = @"birthDate";
      __int16 v93 = 2114;
      id v94 = v43;
      id v47 = v46;
      _os_log_impl(&dword_232E63000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v79 addObject:v43];
  }
  id v48 = v41;
  if (![v79 count])
  {
    v56 = [(__CFString *)v4 representedResource];
    v57 = [v56 receivedDate];
    v58 = v57;
    if (v57)
    {
      id v59 = v57;
    }
    else
    {
      id v59 = [MEMORY[0x263EFF910] date];
    }
    v55 = v59;

    uint64_t v60 = [v72 BOOLValue];
    id v53 = [MEMORY[0x263F0A2D8] localDevice];
    v65 = [(__CFString *)v4 medicalRecordMetadata];
    v61 = [MEMORY[0x263F0A088] accountOwnerType];
    v54 = [MEMORY[0x263F0A080] accountOwnerWithType:v61 note:v73 enteredInError:v60 modifiedDate:v55 originIdentifier:v69 locale:v74 extractionVersion:v70 device:v53 metadata:v65 country:v68 state:(v66 >> 2) & 1 name:v40 birthDate:v48];
    v62 = [(__CFString *)v4 representedResource];
    v63 = [v62 firstSeenDate];
    [v54 _setCreationDate:v63];

    goto LABEL_46;
  }
  v49 = (void *)MEMORY[0x263F087E8];
  v85 = @"conversionErrors";
  id v86 = v79;
  v50 = [NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  v51 = [v49 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v50];

  id v52 = v51;
  id v53 = v52;
  if (v52)
  {
    if (a4)
    {
      id v53 = v52;
      v54 = 0;
      *a4 = v53;
      v55 = v53;
      goto LABEL_46;
    }
    _HKLogDroppedError();
  }
  v54 = 0;
  v55 = v53;
LABEL_46:

  return v54;
}

@end