@interface MCAirPlayPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAirPlayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)allowListDestinations;
- (NSArray)destinationsWithPasswords;
- (NSArray)titlesAndDescriptions;
- (id)namesOrIdsForAllowedDestinations;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAllowListDestinations:(id)a3;
- (void)setDestinationsWithPasswords:(id)a3;
- (void)setTitlesAndDescriptions:(id)a3;
@end

@implementation MCAirPlayPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.airplay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"AIRPLAY_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"AIRPLAY_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPlayPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v116.receiver = self;
  v116.super_class = (Class)MCAirPlayPayload;
  v10 = [(MCPayload *)&v116 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_92;
  }
  id v115 = 0;
  v11 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"AllowList" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v115];
  id v12 = v115;
  v13 = (os_log_t *)&_MCLogObjects;
  if (v12)
  {
    id v14 = v12;
    goto LABEL_83;
  }
  if (!v11)
  {
    id v114 = 0;
    v11 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Whitelist" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v114];
    id v14 = v114;
    if (v14)
    {
LABEL_83:
      v72 = [(MCPayload *)v10 malformedPayloadErrorWithError:v14];
      v73 = v72;
      if (a5) {
        *a5 = v72;
      }
      os_log_t v74 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v75 = v74;
        v76 = objc_opt_class();
        id v77 = v76;
        [v73 MCVerboseDescription];
        id v78 = v9;
        id v79 = v14;
        v81 = v80 = v11;
        *(_DWORD *)buf = 138543618;
        v118 = v76;
        __int16 v119 = 2114;
        id v120 = v81;
        _os_log_impl(&dword_1A13F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

        v11 = v80;
        id v14 = v79;
        id v9 = v78;

        v13 = (os_log_t *)&_MCLogObjects;
      }

      v10 = 0;
      goto LABEL_88;
    }
  }
  v92 = v10;
  v93 = v11;
  if (![v9 isStub])
  {
    v34 = [MEMORY[0x1E4F73168] sharedConfiguration];
    int v35 = [v34 isSupervised];

    v36 = &off_1E5A65000;
    if (!v35) {
      goto LABEL_39;
    }
    id v88 = v9;
    id v90 = v8;
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v37 = v93;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v101 objects:v122 count:16];
    if (!v38) {
      goto LABEL_38;
    }
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v102;
    v41 = @"DeviceName";
    v87 = a5;
    while (1)
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v102 != v40) {
          objc_enumerationMutation(v37);
        }
        v43 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v14 = +[MCPayload badFieldTypeErrorWithField:@"Whitelist"];
          goto LABEL_72;
        }
        v44 = [v43 objectForKey:@"DeviceID"];
        v45 = [v43 objectForKey:@"DeviceName"];
        if (v45)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_71;
          }
        }
        if (v44)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v41 = @"DeviceID";
LABEL_71:
            id v14 = +[MCPayload badFieldValueErrorWithField:v41];

LABEL_72:
            id v8 = v90;
            v10 = v92;
            goto LABEL_79;
          }
        }
        if ([v45 length])
        {
          v46 = v13;
          v47 = objc_alloc_init(MCAirPlayDestination);
          [(MCAirPlayDestination *)v47 setDeviceName:v45];
        }
        else
        {
          if (![v44 length]) {
            goto LABEL_36;
          }
          v46 = v13;
          v47 = objc_alloc_init(MCAirPlayDestination);
          v48 = [v44 uppercaseString];
          [(MCAirPlayDestination *)v47 setDeviceID:v48];
        }
        [v33 addObject:v47];

        v13 = v46;
        v36 = &off_1E5A65000;
        v41 = @"DeviceName";
LABEL_36:
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v101 objects:v122 count:16];
      a5 = v87;
      if (!v39)
      {
LABEL_38:

        [(MCAirPlayPayload *)v92 setAllowListDestinations:v33];
        id v9 = v88;
        id v8 = v90;
LABEL_39:
        v49 = v36[91];
        id v100 = 0;
        id v33 = [v49 removeOptionalObjectInDictionary:v8 key:@"Passwords" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v100];
        id v50 = v100;
        if (v50)
        {
          id v14 = v50;
          v10 = v92;
          goto LABEL_81;
        }
        v87 = a5;
        id v88 = v9;
        id v37 = [MEMORY[0x1E4F1CA48] array];
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v33 = v33;
        uint64_t v57 = [v33 countByEnumeratingWithState:&v96 objects:v121 count:16];
        if (!v57)
        {
LABEL_68:

          v10 = v92;
          [(MCAirPlayPayload *)v92 setDestinationsWithPasswords:v37];
          id v14 = 0;
          goto LABEL_78;
        }
        uint64_t v58 = v57;
        uint64_t v59 = *(void *)v97;
        unint64_t v60 = 0x1E4F1C000uLL;
        v61 = @"DeviceName";
        unint64_t v62 = 0x1E4F29000uLL;
        id v91 = v8;
LABEL_55:
        uint64_t v63 = 0;
        uint64_t v95 = v58;
        while (1)
        {
          if (*(void *)v97 != v59) {
            objc_enumerationMutation(v33);
          }
          v64 = *(void **)(*((void *)&v96 + 1) + 8 * v63);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          v65 = [v64 objectForKey:v61];
          if (!v65 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            id v14 = +[MCPayload badFieldTypeErrorWithField:@"DeviceName"];
LABEL_75:

            goto LABEL_77;
          }
          v66 = [v64 objectForKey:@"Password"];
          if (!v66 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            id v14 = +[MCPayload badFieldTypeErrorWithField:@"Password"];

            goto LABEL_75;
          }
          if ([v65 length] && objc_msgSend(v66, "length"))
          {
            uint64_t v67 = v59;
            unint64_t v68 = v62;
            v69 = v61;
            unint64_t v70 = v60;
            v71 = objc_alloc_init(MCAirPlayDestination);
            [(MCAirPlayDestination *)v71 setDeviceName:v65];
            [(MCAirPlayDestination *)v71 setPassword:v66];
            [v37 addObject:v71];

            unint64_t v60 = v70;
            v61 = v69;
            unint64_t v62 = v68;
            uint64_t v59 = v67;
            uint64_t v58 = v95;
          }

          if (v58 == ++v63)
          {
            uint64_t v58 = [v33 countByEnumeratingWithState:&v96 objects:v121 count:16];
            id v8 = v91;
            if (!v58) {
              goto LABEL_68;
            }
            goto LABEL_55;
          }
        }
        id v14 = +[MCPayload badFieldTypeErrorWithField:@"Passwords"];
LABEL_77:

        id v8 = v91;
        v10 = v92;
LABEL_78:
        v13 = (os_log_t *)&_MCLogObjects;
LABEL_79:
        a5 = v87;
        goto LABEL_80;
      }
    }
  }
  v86 = a5;
  id v88 = v9;
  id v89 = v8;
  v15 = [MEMORY[0x1E4F1CA48] array];
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v16 = v93;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (!v17) {
    goto LABEL_18;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v111;
  v20 = @"DeviceID";
  v21 = @"DeviceName";
  do
  {
    uint64_t v22 = 0;
    uint64_t v94 = v18;
    do
    {
      if (*(void *)v111 != v19) {
        objc_enumerationMutation(v16);
      }
      v23 = *(void **)(*((void *)&v110 + 1) + 8 * v22);
      v24 = [v23 objectForKey:v20];
      v25 = [v23 objectForKey:v21];
      if (v25)
      {
        v26 = objc_alloc_init(MCAirPlayDestination);
        [(MCAirPlayDestination *)v26 setDeviceName:v25];
      }
      else
      {
        if (!v24) {
          goto LABEL_16;
        }
        [v24 uppercaseString];
        uint64_t v27 = v19;
        v28 = v15;
        v29 = v21;
        v30 = v20;
        v32 = id v31 = v16;

        v26 = objc_alloc_init(MCAirPlayDestination);
        [(MCAirPlayDestination *)v26 setDeviceID:v32];
        v24 = (void *)v32;
        id v16 = v31;
        v20 = v30;
        v21 = v29;
        v15 = v28;
        uint64_t v19 = v27;
        uint64_t v18 = v94;
      }
      [v15 addObject:v26];

LABEL_16:
      ++v22;
    }
    while (v18 != v22);
    uint64_t v18 = [v16 countByEnumeratingWithState:&v110 objects:v124 count:16];
  }
  while (v18);
LABEL_18:

  v10 = v92;
  [(MCAirPlayPayload *)v92 setAllowListDestinations:v15];

  id v109 = 0;
  id v8 = v89;
  id v33 = +[MCProfile removeOptionalObjectInDictionary:v89 key:@"Passwords" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v109];
  id v14 = v109;
  if (v14)
  {
    a5 = v86;
    id v9 = v88;
    v13 = (os_log_t *)&_MCLogObjects;
    goto LABEL_81;
  }
  id v37 = [MEMORY[0x1E4F1CA48] array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v33 = v33;
  uint64_t v51 = [v33 countByEnumeratingWithState:&v105 objects:v123 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v106;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v106 != v53) {
          objc_enumerationMutation(v33);
        }
        v55 = [*(id *)(*((void *)&v105 + 1) + 8 * j) objectForKey:@"DeviceName"];
        if (v55)
        {
          v56 = objc_alloc_init(MCAirPlayDestination);
          [(MCAirPlayDestination *)v56 setDeviceName:v55];
          [v37 addObject:v56];
        }
      }
      uint64_t v52 = [v33 countByEnumeratingWithState:&v105 objects:v123 count:16];
    }
    while (v52);
  }

  v10 = v92;
  [(MCAirPlayPayload *)v92 setDestinationsWithPasswords:v37];
  id v8 = v89;
  v13 = (os_log_t *)&_MCLogObjects;
  a5 = v86;
  id v14 = 0;
LABEL_80:

  id v9 = v88;
LABEL_81:

  if (v14)
  {
    v11 = v93;
    goto LABEL_83;
  }
  v11 = v93;
LABEL_88:
  if ([v8 count])
  {
    os_log_t v82 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      v83 = v82;
      v84 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v118 = v84;
      __int16 v119 = 2114;
      id v120 = v8;
      _os_log_impl(&dword_1A13F0000, v83, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_92:
  return v10;
}

- (id)stubDictionary
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)MCAirPlayPayload;
  uint64_t v3 = [(MCPayload *)&v44 stubDictionary];
  uint64_t v4 = [(MCAirPlayPayload *)self allowListDestinations];

  if (v4)
  {
    int v35 = v3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v6 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v14 = [v13 deviceName];

        if (v14)
        {
          v15 = [MEMORY[0x1E4F1CA60] dictionary];
          id v16 = [v13 deviceName];
          uint64_t v17 = v15;
          uint64_t v18 = v16;
          uint64_t v19 = @"DeviceName";
        }
        else
        {
          v20 = [v13 deviceID];

          if (!v20) {
            continue;
          }
          v15 = [MEMORY[0x1E4F1CA60] dictionary];
          id v16 = [v13 deviceID];
          uint64_t v17 = v15;
          uint64_t v18 = v16;
          uint64_t v19 = @"DeviceID";
        }
        [v17 setObject:v18 forKey:v19];

        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (!v10)
      {
LABEL_14:

        uint64_t v3 = v35;
        [v35 setObject:v7 forKey:@"Whitelist"];

        break;
      }
    }
  }
  v21 = [(MCAirPlayPayload *)self destinationsWithPasswords];

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F1CA48];
    v23 = [(MCAirPlayPayload *)self destinationsWithPasswords];
    v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v25 = [(MCAirPlayPayload *)self destinationsWithPasswords];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          id v31 = [v30 deviceName];

          if (v31)
          {
            uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
            id v33 = [v30 deviceName];
            [v32 setObject:v33 forKey:@"DeviceName"];

            [v24 addObject:v32];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"Passwords"];
  }
  return v3;
}

- (id)namesOrIdsForAllowedDestinations
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  [v3 setObject:v4 forKeyedSubscript:@"DeviceNames"];

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  [v3 setObject:v5 forKeyedSubscript:@"DeviceIDs"];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(MCAirPlayPayload *)self allowListDestinations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 deviceName];

        if (v12)
        {
          v13 = [v3 objectForKeyedSubscript:@"DeviceNames"];
          [v11 deviceName];
        }
        else
        {
          v13 = [v3 objectForKeyedSubscript:@"DeviceIDs"];
          [v11 deviceID];
        id v14 = };
        [v13 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v3;
}

- (NSArray)titlesAndDescriptions
{
  v38[2] = *MEMORY[0x1E4F143B8];
  titlesAndDescriptions = self->_titlesAndDescriptions;
  if (!titlesAndDescriptions)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v5 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v37[0] = @"t";
      uint64_t v7 = MCLocalizedString(@"AIRPLAY_ALLOW_LIST_TITLE_COLON");
      v37[1] = @"d";
      v38[0] = v7;
      uint64_t v8 = [(MCAirPlayPayload *)self allowListDestinations];
      uint64_t v9 = [v8 count];
      long long v17 = MCLocalizedFormat(@"AIRPLAY_DESTINATION_COUNT", v10, v11, v12, v13, v14, v15, v16, v9);
      v38[1] = v17;
      long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
      [(NSArray *)v4 addObject:v18];
    }
    long long v19 = [(MCAirPlayPayload *)self destinationsWithPasswords];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v35[0] = @"t";
      uint64_t v21 = MCLocalizedString(@"AIRPLAY_PASSWORD_TITLE_COLON");
      v35[1] = @"d";
      v36[0] = v21;
      uint64_t v22 = [(MCAirPlayPayload *)self destinationsWithPasswords];
      uint64_t v23 = [v22 count];
      id v31 = MCLocalizedFormat(@"AIRPLAY_DESTINATION_COUNT", v24, v25, v26, v27, v28, v29, v30, v23);
      v36[1] = v31;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
      [(NSArray *)v4 addObject:v32];
    }
    id v33 = self->_titlesAndDescriptions;
    self->_titlesAndDescriptions = v4;

    titlesAndDescriptions = self->_titlesAndDescriptions;
  }
  return titlesAndDescriptions;
}

- (id)subtitle1Label
{
  uint64_t v3 = [(MCAirPlayPayload *)self titlesAndDescriptions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(MCAirPlayPayload *)self titlesAndDescriptions];
    uint64_t v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 objectForKey:@"t"];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCAirPlayPayload *)self titlesAndDescriptions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(MCAirPlayPayload *)self titlesAndDescriptions];
    uint64_t v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 objectForKey:@"d"];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCAirPlayPayload *)self titlesAndDescriptions];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = [(MCAirPlayPayload *)self titlesAndDescriptions];
    uint64_t v6 = [v5 objectAtIndex:1];
    uint64_t v7 = [v6 objectForKey:@"t"];
  }
  return v7;
}

- (id)subtitle2Description
{
  uint64_t v3 = [(MCAirPlayPayload *)self titlesAndDescriptions];
  unint64_t v4 = [v3 count];

  if (v4 < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v5 = [(MCAirPlayPayload *)self titlesAndDescriptions];
    uint64_t v6 = [v5 objectAtIndex:1];
    uint64_t v7 = [v6 objectForKey:@"d"];
  }
  return v7;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  unint64_t v4 = [(MCAirPlayPayload *)self allowListDestinations];
  uint64_t v5 = [v4 count];

  uint64_t v6 = &off_1E5A65000;
  if (v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v8 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v11 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v13 = [(MCAirPlayPayload *)self allowListDestinations];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v19 = [v18 deviceName];

          if (v19)
          {
            uint64_t v20 = [v18 deviceName];
            uint64_t v21 = v9;
          }
          else
          {
            uint64_t v20 = [v18 deviceID];
            uint64_t v21 = v12;
          }
          [v21 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v15);
    }

    uint64_t v6 = &off_1E5A65000;
    if ([v9 count])
    {
      uint64_t v22 = MCLocalizedString(@"ALLOWED_DEVICE_NAMES");
      uint64_t v23 = +[MCKeyValueSection sectionWithLocalizedArray:v9 title:v22 footer:0];

      [v3 addObject:v23];
    }
    if ([v12 count])
    {
      uint64_t v24 = MCLocalizedString(@"ALLOWED_DEVICE_IDS");
      uint64_t v25 = +[MCKeyValueSection sectionWithLocalizedArray:v12 title:v24 footer:0];

      [v3 addObject:v25];
    }
  }
  uint64_t v26 = [(MCAirPlayPayload *)self destinationsWithPasswords];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v29 = [(MCAirPlayPayload *)self destinationsWithPasswords];
    uint64_t v30 = objc_msgSend(v28, "arrayWithCapacity:", objc_msgSend(v29, "count"));

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v31 = [(MCAirPlayPayload *)self destinationsWithPasswords];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = [*(id *)(*((void *)&v41 + 1) + 8 * j) deviceName];
          [v30 addObject:v36];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v33);
    }

    long long v37 = v6[73];
    long long v38 = MCLocalizedString(@"DESTINATIONS_WITH_PASSWORD");
    long long v39 = [v37 sectionWithLocalizedArray:v30 title:v38 footer:0];

    [v3 addObject:v39];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)verboseDescription
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v31.receiver = self;
  v31.super_class = (Class)MCAirPlayPayload;
  unint64_t v4 = [(MCPayload *)&v31 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(MCAirPlayPayload *)self allowListDestinations];
  objc_msgSend(v5, "appendFormat:", @"Allow List   : %d entries\n", objc_msgSend(v6, "count"));

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [(MCAirPlayPayload *)self allowListDestinations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v12 deviceName];

        if (v13)
        {
          uint64_t v14 = [v12 deviceName];
          [v5 appendFormat:@"             %@\n", v14];
        }
        else
        {
          uint64_t v14 = [v12 deviceID];
          [v5 appendFormat:@"              %@\n", v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [(MCAirPlayPayload *)self destinationsWithPasswords];
  objc_msgSend(v5, "appendFormat:", @"Passwords   : %d entries\n", objc_msgSend(v15, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [(MCAirPlayPayload *)self destinationsWithPasswords];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [*(id *)(*((void *)&v23 + 1) + 8 * j) deviceName];
        [v5 appendFormat:@"              %@\n", v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v18);
  }

  return v5;
}

- (NSArray)allowListDestinations
{
  return self->_allowListDestinations;
}

- (void)setAllowListDestinations:(id)a3
{
}

- (NSArray)destinationsWithPasswords
{
  return self->_destinationsWithPasswords;
}

- (void)setDestinationsWithPasswords:(id)a3
{
}

- (void)setTitlesAndDescriptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlesAndDescriptions, 0);
  objc_storeStrong((id *)&self->_destinationsWithPasswords, 0);
  objc_storeStrong((id *)&self->_allowListDestinations, 0);
}

@end