@interface HKPIIRedactor(HealthDeamon)
+ (id)redactorWithProfile:()HealthDeamon error:;
@end

@implementation HKPIIRedactor(HealthDeamon)

+ (id)redactorWithProfile:()HealthDeamon error:
{
  v76[16] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_contactStoreWithHealthAppIdentity");
  self;
  uint64_t v9 = *MEMORY[0x1E4F1ADF0];
  v76[0] = *MEMORY[0x1E4F1ADE0];
  v76[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1AEF8];
  v76[2] = *MEMORY[0x1E4F1AEF0];
  v76[3] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1AEC0];
  v76[4] = *MEMORY[0x1E4F1AF30];
  v76[5] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:6];
  id v75 = 0;
  v13 = objc_msgSend(v8, "_ios_meContactWithKeysToFetch:error:", v12, &v75);
  id v14 = v75;

  if (v13 || !v14)
  {
    if (v13)
    {
      id v19 = v7;
      id v20 = v13;
      uint64_t v21 = self;
      [v20 familyName];
      v23 = id v22 = v14;
      +[HKPIIRedactor _addName:toArray:](v21, v23, v19);

      v24 = [v20 givenName];
      +[HKPIIRedactor _addName:toArray:](v21, v24, v19);

      v25 = [v20 phoneticFamilyName];
      +[HKPIIRedactor _addName:toArray:](v21, v25, v19);

      v26 = [v20 phoneticGivenName];
      +[HKPIIRedactor _addName:toArray:](v21, v26, v19);

      v27 = [v20 previousFamilyName];
      +[HKPIIRedactor _addName:toArray:](v21, v27, v19);

      v28 = [v20 nickname];

      +[HKPIIRedactor _addName:toArray:](v21, v28, v19);
      id v14 = v22;
    }
LABEL_11:
    id v16 = +[HDKeyValueDomain healthAppUserDefaultsDomainWithProfile:v5];
    uint64_t v29 = *MEMORY[0x1E4F2BFB0];
    id v74 = 0;
    v30 = [v16 propertyListValueForKey:v29 error:&v74];
    id v31 = v74;
    v18 = v31;
    if (!v30 && v31)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, @"Error getting names to redact", v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        if (a4)
        {
          id v32 = v32;
          id v17 = 0;
          *a4 = v32;
          id v33 = v32;
LABEL_49:

          goto LABEL_50;
        }
        id v33 = v32;
        _HKLogDroppedError();
        id v32 = v33;
      }
      else
      {
        id v33 = 0;
      }
      id v17 = 0;
      goto LABEL_49;
    }
    id v65 = v31;
    if (v30)
    {
      v34 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2BF98]];
      +[HKPIIRedactor _addName:toArray:](v6, v34, v7);

      v35 = [v30 objectForKeyedSubscript:*MEMORY[0x1E4F2BFA0]];
      +[HKPIIRedactor _addName:toArray:](v6, v35, v7);
    }
    v64 = v30;
    v36 = [v5 medicalIDDataManager];
    id v73 = 0;
    v37 = [v36 fetchMedicalIDIfSetUpWithError:&v73];
    id v33 = v73;

    id v63 = v37;
    if (v37 || !v33)
    {
      id v61 = v33;
      v62 = v13;
      if (v37)
      {
        v41 = [v37 name];
        [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v43 = id v42 = v14;
        v44 = [v41 componentsSeparatedByCharactersInSet:v43];

        id v14 = v42;
        +[HKPIIRedactor _addNames:toArray:](v6, v44, v7);
      }
      v45 = [MEMORY[0x1E4F2AB88] accountOwnerType];
      id v72 = 0;
      v46 = +[HDSampleEntity samplesWithType:v45 profile:v5 encodingOptions:MEMORY[0x1E4F1CC08] predicate:0 limit:0 anchor:0 error:&v72];
      id v40 = v72;

      if (v46)
      {
        id v58 = v40;
        id v59 = v14;
        id v60 = v5;
        v66 = a1;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v39 = v46;
        uint64_t v47 = [v39 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v69;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v69 != v49) {
                objc_enumerationMutation(v39);
              }
              v51 = [*(id *)(*((void *)&v68 + 1) + 8 * i) name];
              v52 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              v53 = [v51 componentsSeparatedByCharactersInSet:v52];

              +[HKPIIRedactor _addNames:toArray:](v6, v53, v7);
            }
            uint64_t v48 = [v39 countByEnumeratingWithState:&v68 objects:v76 count:16];
          }
          while (v48);
        }

        id v17 = v7;
        a1 = v66;
        id v14 = v59;
        id v5 = v60;
        v13 = v62;
        id v33 = v61;
        id v40 = v58;
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, @"Error getting names to redact", v40);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      v13 = v62;
      if (v54)
      {
        if (a4) {
          *a4 = v54;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v39 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, @"Error getting names to redact", v33);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = v38;
      if (v38)
      {
        if (a4)
        {
          id v39 = v38;
          id v17 = 0;
          *a4 = v39;
        }
        else
        {
          _HKLogDroppedError();
          id v17 = 0;
        }
        id v40 = v39;
        goto LABEL_48;
      }
      id v40 = 0;
    }
    id v17 = 0;
LABEL_48:

    v30 = v64;
    v18 = v65;
    id v32 = v63;
    goto LABEL_49;
  }
  if ([v14 code] == 2 || objc_msgSend(v14, "code") == 200) {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:underlyingError:", 100, @"Error getting names to redact", v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v15;
  if (v15)
  {
    if (a4)
    {
      id v16 = v15;
      id v17 = 0;
      *a4 = v16;
    }
    else
    {
      _HKLogDroppedError();
      id v17 = 0;
    }
    v18 = v16;
  }
  else
  {
    v18 = 0;
    id v17 = 0;
  }
LABEL_50:

  if (v17)
  {
    v56 = [a1 redactorWithNames:v17 error:a4];
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

@end