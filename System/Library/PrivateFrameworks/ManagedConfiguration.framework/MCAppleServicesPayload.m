@interface MCAppleServicesPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAppleServicesPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)hashDictionaries;
- (id)stubDictionary;
- (id)subtitle1Label;
- (id)verboseDescription;
@end

@implementation MCAppleServicesPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.security.appleservices";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"APPLE_SERVICES_DESCRIPTION_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"APPLE_SERVICES_DESCRIPTION_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAppleServicesPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MCAppleServicesPayload;
  uint64_t v9 = [(MCPayload *)&v50 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_40;
  }
  v10 = [MEMORY[0x1E4F1CA48] array];
  id v49 = 0;
  v11 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"PinningAdditions" isRequired:0 outError:&v49];
  id v12 = v49;
  if (v12) {
    goto LABEL_31;
  }
  if (!v11)
  {
    id v12 = 0;
    goto LABEL_30;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (!v13)
  {
    id v12 = 0;
    goto LABEL_29;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v46;
  uint64_t v42 = *MEMORY[0x1E4F3BCD8];
  uint64_t v41 = *MEMORY[0x1E4F3BCE0];
  v40 = v11;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v46 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      id v18 = [v17 objectForKeyedSubscript:@"Algorithm"];
      if (!v18)
      {
        uint64_t v26 = [(id)objc_opt_class() missingFieldErrorWithField:@"Algorithm" underlyingError:0];
LABEL_24:
        id v12 = (id)v26;
        goto LABEL_28;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v26 = +[MCPayload badFieldTypeErrorWithField:@"Algorithm"];
        goto LABEL_24;
      }
      id v18 = v18;
      if ([v18 isEqualToString:@"sha256"])
      {
        v19 = [v17 objectForKeyedSubscript:@"Hash"];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v51[0] = v42;
            v51[1] = v41;
            v52[0] = v18;
            v52[1] = v19;
            v20 = (void *)MEMORY[0x1E4F1C9E8];
            id v21 = v19;
            v22 = [v20 dictionaryWithObjects:v52 forKeys:v51 count:2];

            [v10 addObject:v22];
            goto LABEL_17;
          }
          uint64_t v27 = +[MCPayload badFieldTypeErrorWithField:@"Hash"];
        }
        else
        {
          uint64_t v27 = [(id)objc_opt_class() missingFieldErrorWithField:@"Hash" underlyingError:0];
        }
        id v12 = (id)v27;

LABEL_28:
        v11 = v40;

        goto LABEL_29;
      }
      v23 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138412546;
        v54 = v25;
        __int16 v55 = 2112;
        id v56 = v18;
        _os_log_impl(&dword_1A13F0000, v24, OS_LOG_TYPE_DEFAULT, "Payload \"%@\" has an unsupported hash algorithm \"%@\". The hash will be ignored.", buf, 0x16u);
      }
LABEL_17:
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    id v12 = 0;
    v11 = v40;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_29:

LABEL_30:
  objc_storeStrong((id *)&v9->_hashDictionaries, v10);
  if (v12)
  {
LABEL_31:
    v28 = [(MCPayload *)v9 malformedPayloadErrorWithError:v12];
    v29 = v28;
    if (a5) {
      *a5 = v28;
    }
    v30 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v31 = v30;
      v32 = objc_opt_class();
      id obja = v32;
      [v29 MCVerboseDescription];
      id v33 = v8;
      v35 = v34 = v11;
      *(_DWORD *)buf = 138412546;
      v54 = v32;
      __int16 v55 = 2112;
      id v56 = v35;
      _os_log_impl(&dword_1A13F0000, v31, OS_LOG_TYPE_ERROR, "%@ Can't parse payload: %@", buf, 0x16u);

      v11 = v34;
      id v8 = v33;
    }
    uint64_t v9 = 0;
  }
  if ([v8 count])
  {
    v36 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      v38 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138412546;
      v54 = v38;
      __int16 v55 = 2112;
      id v56 = v8;
      _os_log_impl(&dword_1A13F0000, v37, OS_LOG_TYPE_INFO, "Payload “%@” contains ignored fields. They are: %@", buf, 0x16u);
    }
  }

LABEL_40:
  return v9;
}

- (id)stubDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MCAppleServicesPayload;
  uint64_t v15 = [(MCPayload *)&v21 stubDictionary];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_hashDictionaries, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_hashDictionaries;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F3BCD8];
    uint64_t v8 = *MEMORY[0x1E4F3BCE0];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v22[0] = @"Algorithm";
        v11 = [v10 objectForKeyedSubscript:v7];
        v22[1] = @"Hash";
        v23[0] = v11;
        id v12 = [v10 objectForKeyedSubscript:v8];
        v23[1] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
        [v3 addObject:v13];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v5);
  }

  [v15 setObject:v3 forKeyedSubscript:@"PinningAdditions"];
  return v15;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCAppleServicesPayload;
  uint64_t v3 = [(MCPayload *)&v6 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_hashDictionaries) {
    [v4 appendFormat:@"\nhashDictionaries:\n%@", self->_hashDictionaries];
  }
  return v4;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(NSArray *)self->_hashDictionaries count];
  if (v2)
  {
    if (v2 == (void *)1) {
      uint64_t v3 = @"APPLE_SERVICES_PINNING_ADDITION_SINGULAR";
    }
    else {
      uint64_t v3 = @"APPLE_SERVICES_PINNING_ADDITION_PLURAL";
    }
    uint64_t v2 = MCLocalizedString(v3);
  }
  return v2;
}

- (NSArray)hashDictionaries
{
  return self->_hashDictionaries;
}

- (void).cxx_destruct
{
}

@end