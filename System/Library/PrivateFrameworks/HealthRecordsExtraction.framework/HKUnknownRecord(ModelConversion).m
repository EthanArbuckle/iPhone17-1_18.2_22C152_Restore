@interface HKUnknownRecord(ModelConversion)
+ (id)medicalRecordFromClinicalItem:()ModelConversion error:;
@end

@implementation HKUnknownRecord(ModelConversion)

+ (id)medicalRecordFromClinicalItem:()ModelConversion error:
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v4 = a3;
  id v67 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = [(__CFString *)v4 representedResource];
  v66 = [v5 identifier];

  if (!v66)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      *(_DWORD *)buf = 138543362;
      id v75 = (id)objc_opt_class();
      id v8 = v75;
      _os_log_impl(&dword_232E63000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ missing FHIR identifier on clinical item's represented resource", buf, 0xCu);
    }
    v9 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item is missing a represented resource");
    [v67 addObject:v9];
  }
  v59 = (void *)[objc_alloc(MEMORY[0x263F0A4D8]) initWithFHIRIdentifier:v66];
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
      id v75 = v14;
      __int16 v76 = 2114;
      v77 = v4;
      id v15 = v14;
      _os_log_impl(&dword_232E63000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ invalid rules version on %{public}@", buf, 0x16u);
    }
    v16 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"clinical item has invalid rules version");
    [v67 addObject:v16];
  }
  id v71 = 0;
  v62 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"locale" expectedClass:objc_opt_class() isArray:0 error:&v71];
  id v65 = v71;
  if (!v62 && v65)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v75 = v19;
      __int16 v76 = 2114;
      v77 = @"locale";
      __int16 v78 = 2114;
      id v79 = v65;
      id v20 = v19;
      _os_log_impl(&dword_232E63000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v67 addObject:v65];
  }
  v58 = [(__CFString *)v4 country];
  id v70 = 0;
  v61 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"note" expectedClass:objc_opt_class() isArray:0 error:&v70];
  id v64 = v70;
  if (!v61 && v64)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v22 = v21;
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v75 = v23;
      __int16 v76 = 2114;
      v77 = @"note";
      __int16 v78 = 2114;
      id v79 = v64;
      id v24 = v23;
      _os_log_impl(&dword_232E63000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v67 addObject:v64];
  }
  id v69 = 0;
  v60 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"enteredInError" expectedClass:objc_opt_class() isArray:0 error:&v69];
  id v63 = v69;
  if (!v60 && v63)
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v75 = v27;
      __int16 v76 = 2114;
      v77 = @"enteredInError";
      __int16 v78 = 2114;
      id v79 = v63;
      id v28 = v27;
      _os_log_impl(&dword_232E63000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v67 addObject:v63];
  }
  v29 = [(__CFString *)v4 representedResource];
  unint64_t v30 = [v29 extractionHints];

  id v68 = 0;
  v31 = [(__CFString *)v4 medicalRecordPropertyValueForKey:@"displayName" expectedClass:objc_opt_class() isArray:0 error:&v68];
  id v32 = v68;
  v33 = v32;
  if (!v31 && v32)
  {
    _HKInitializeLogging();
    uint64_t v34 = v11;
    v35 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v75 = v37;
      __int16 v76 = 2114;
      v77 = @"displayName";
      __int16 v78 = 2114;
      id v79 = v33;
      id v38 = v37;
      _os_log_impl(&dword_232E63000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ error retrieving medical record property %{public}@ : %{public}@", buf, 0x20u);
    }
    [v67 addObject:v33];
    uint64_t v11 = v34;
  }
  id v39 = v31;
  if (![v67 count])
  {
    v47 = [(__CFString *)v4 representedResource];
    v48 = [v47 receivedDate];
    v49 = v48;
    if (v48)
    {
      id v50 = v48;
    }
    else
    {
      id v50 = [MEMORY[0x263EFF910] date];
    }
    v46 = v50;

    uint64_t v51 = [v60 BOOLValue];
    id v44 = [MEMORY[0x263F0A2D8] localDevice];
    v52 = [(__CFString *)v4 medicalRecordMetadata];
    v53 = [MEMORY[0x263F0A840] unknownRecordType];
    v45 = [MEMORY[0x263F0A838] unknownRecordWithType:v53 note:v61 enteredInError:v51 modifiedDate:v46 originIdentifier:v59 locale:v62 extractionVersion:v11 device:v44 metadata:v52 country:v58 state:(v30 >> 2) & 1 displayName:v39];
    v54 = [(__CFString *)v4 representedResource];
    v55 = [v54 firstSeenDate];
    [v45 _setCreationDate:v55];

    goto LABEL_39;
  }
  v40 = (void *)MEMORY[0x263F087E8];
  v72 = @"conversionErrors";
  id v73 = v67;
  v41 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v42 = [v40 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:201 userInfo:v41];

  id v43 = v42;
  id v44 = v43;
  if (v43)
  {
    if (a4)
    {
      id v44 = v43;
      v45 = 0;
      *a4 = v44;
      v46 = v44;
      goto LABEL_39;
    }
    _HKLogDroppedError();
  }
  v45 = 0;
  v46 = v44;
LABEL_39:

  return v45;
}

@end