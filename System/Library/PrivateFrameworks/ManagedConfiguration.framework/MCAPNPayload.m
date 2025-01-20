@interface MCAPNPayload
+ (id)apnDomainName;
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4;
- (BOOL)wasInstalled;
- (MCAPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (id)_strippedAPNDefaults;
- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4;
- (id)apnDefaults;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)_finishInitializationWithContents:(id)a3;
- (void)setWasInstalled:(BOOL)a3;
@end

@implementation MCAPNPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.apn.managed"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"APN_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"APN_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)apnDomainName
{
  return @"com.apple.managedCarrier";
}

- (id)_validationErrorType:(int64_t)a3 forInvalidKey:(id)a4
{
  uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
  v10 = MCErrorArray(@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD", (uint64_t)a2, a3, (uint64_t)a4, v4, v5, v6, v7, a4);
  v11 = [v9 MCErrorWithDomain:@"MCPayloadErrorDomain" code:a3 descriptionArray:v10 errorType:@"MCFatalError"];

  return v11;
}

- (BOOL)_checkForValidContents:(id)a3 outError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!a4)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"MCAPNPayload.m" lineNumber:82 description:@"Invalid argument"];
  }
  v26 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (!v7)
  {
    v17 = 0;
    goto LABEL_31;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v34;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v34 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v12 = [v11 objectForKey:@"DefaultsDomainName"];
      if (([v12 isEqualToString:@"com.apple.managedCarrier"] & 1) == 0)
      {
        v21 = @"DefaultsDomainName";
        v22 = self;
        uint64_t v23 = 2004;
LABEL_28:
        v17 = [(MCAPNPayload *)v22 _validationErrorType:v23 forInvalidKey:v21];
LABEL_30:

        goto LABEL_31;
      }
      v13 = [v11 objectForKey:@"DefaultsData"];
      if (!v13)
      {
        v21 = @"DefaultsData";
        v22 = self;
        uint64_t v23 = 2002;
        goto LABEL_28;
      }
      v14 = v13;
      v15 = [v13 objectForKey:@"apns"];
      if (!v15)
      {
        v17 = [(MCAPNPayload *)self _validationErrorType:2002 forInvalidKey:@"apns"];

        goto LABEL_30;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v16 = v15;
      v17 = (void *)[v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v30;
        while (2)
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) objectForKey:@"apn"];
            if (!v20)
            {
              v17 = [(MCAPNPayload *)self _validationErrorType:2002 forInvalidKey:@"apn"];
              goto LABEL_21;
            }
          }
          v17 = (void *)[v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      if (v17) {
        goto LABEL_31;
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    v17 = 0;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_31:

  if (v26) {
    id *v26 = v17;
  }

  return v17 == 0;
}

- (void)_finishInitializationWithContents:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v3;
  uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        id v6 = [*(id *)(*((void *)&v30 + 1) + 8 * v5) objectForKey:@"DefaultsData"];
        uint64_t v7 = [v6 objectForKey:@"apns"];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
              v14 = objc_alloc_init(MCAPNInfo);
              v15 = [v13 objectForKey:@"apn"];
              [(MCAPNInfo *)v14 setApnName:v15];

              id v16 = [v13 objectForKey:@"username"];
              [(MCAPNInfo *)v14 setUsername:v16];

              v17 = [v13 objectForKey:@"password"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v18 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
                [(MCAPNInfo *)v14 setPassword:v18];
              }
              else
              {
                [(MCAPNInfo *)v14 setPassword:v17];
              }
              v19 = [v13 objectForKey:@"proxy"];
              [(MCAPNInfo *)v14 setProxy:v19];

              v20 = [v13 objectForKey:@"proxyPort"];
              [(MCAPNInfo *)v14 setProxyPort:v20];

              [v4 addObject:v14];
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  if ([v4 count]) {
    objc_storeStrong((id *)&self->_apnInfos, v4);
  }
}

- (MCAPNPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MCAPNPayload;
  uint64_t v9 = [(MCPayload *)&v29 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v28 = 0;
    uint64_t v10 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"PayloadContent" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v28];
    id v11 = v28;
    if (!v11 && v10)
    {
      id v27 = 0;
      [(MCAPNPayload *)v9 _checkForValidContents:v10 outError:&v27];
      id v11 = v27;
    }
    uint64_t v12 = [(MCPayload *)v9 profile];
    int v13 = [v12 isStub];

    if (v13)
    {
      if (v11
        || (id v26 = 0,
            +[MCProfile removeOptionalObjectInDictionary:v8 key:@"WasInstalled" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v26], v25 = objc_claimAutoreleasedReturnValue(), id v11 = v26, !v25))
      {
        v9->_wasInstalled = 1;
      }
      else
      {
        v9->_wasInstalled = [v25 BOOLValue];
      }
    }
    else
    {
      v9->_wasInstalled = 0;
    }
    if (v11)
    {
      v14 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v15 = v14;
      if (a5) {
        *a5 = v14;
      }
      id v16 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        uint64_t v18 = objc_opt_class();
        id v19 = v18;
        v20 = [v15 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        long long v31 = v18;
        __int16 v32 = 2114;
        id v33 = v20;
        _os_log_impl(&dword_1A13F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
    }
    if ([v8 count])
    {
      v21 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v22 = v21;
        uint64_t v23 = [(MCPayload *)v9 friendlyName];
        *(_DWORD *)buf = 138543618;
        long long v31 = v23;
        __int16 v32 = 2114;
        id v33 = v8;
        _os_log_impl(&dword_1A13F0000, v22, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
    if (!v11) {
      [(MCAPNPayload *)v9 _finishInitializationWithContents:v10];
    }
  }
  return v9;
}

- (id)apnDefaults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_apnInfos, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_apnInfos;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "defaultsRepresentation", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"apns"];

  return v10;
}

- (id)_strippedAPNDefaults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_apnInfos, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_apnInfos;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "strippedDefaultsRepresentation", (void)v12);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:@"apns"];

  return v10;
}

- (id)stubDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)MCAPNPayload;
  id v3 = [(MCPayload *)&v10 stubDictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = +[MCAPNPayload apnDomainName];
  [v4 setObject:v5 forKey:@"DefaultsDomainName"];

  uint64_t v6 = [(MCAPNPayload *)self _strippedAPNDefaults];
  [v4 setObject:v6 forKey:@"DefaultsData"];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
  [v3 setObject:v7 forKey:@"PayloadContent"];
  id v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_wasInstalled];
  [v3 setObject:v8 forKey:@"WasInstalled"];

  return v3;
}

- (id)verboseDescription
{
  v6.receiver = self;
  v6.super_class = (Class)MCAPNPayload;
  id v3 = [(MCPayload *)&v6 verboseDescription];
  uint64_t v4 = [v3 stringByAppendingFormat:@"\napns: %@", self->_apnInfos];

  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedString(@"NAME_COLON");
}

- (id)subtitle1Description
{
  if ([(NSArray *)self->_apnInfos count])
  {
    id v3 = [(NSArray *)self->_apnInfos firstObject];
    uint64_t v4 = [v3 apnName];
  }
  else
  {
    uint64_t v4 = MCLocalizedString(@"NAME_MISSING");
  }
  return v4;
}

- (id)subtitle2Label
{
  return MCLocalizedString(@"USERNAME_COLON");
}

- (id)subtitle2Description
{
  if ([(NSArray *)self->_apnInfos count])
  {
    id v3 = [(NSArray *)self->_apnInfos firstObject];
    uint64_t v4 = [v3 username];
  }
  else
  {
    uint64_t v4 = MCLocalizedString(@"USERNAME_MISSING");
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = self->_apnInfos;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v9 = objc_opt_new();
        objc_super v10 = [v8 apnName];

        if (v10)
        {
          id v11 = [MCKeyValue alloc];
          long long v12 = [v8 apnName];
          long long v13 = MCLocalizedString(@"APN_NAME");
          long long v14 = [(MCKeyValue *)v11 initWithLocalizedString:v12 localizedKey:v13];

          [v9 addObject:v14];
        }
        long long v15 = [v8 username];

        if (v15)
        {
          id v16 = [MCKeyValue alloc];
          uint64_t v17 = [v8 username];
          uint64_t v18 = MCLocalizedString(@"USERNAME");
          id v19 = [(MCKeyValue *)v16 initWithLocalizedString:v17 localizedKey:v18];

          [v9 addObject:v19];
        }
        v20 = [v8 password];

        if (v20)
        {
          v21 = [MCKeyValue alloc];
          v22 = MCLocalizedString(@"PRESENT");
          uint64_t v23 = MCLocalizedString(@"PASSWORD");
          uint64_t v24 = [(MCKeyValue *)v21 initWithLocalizedString:v22 localizedKey:v23];

          [v9 addObject:v24];
        }
        uint64_t v25 = [v8 proxy];

        if (v25)
        {
          id v26 = [MCKeyValue alloc];
          id v27 = [v8 proxy];
          id v28 = MCLocalizedString(@"PROXY");
          objc_super v29 = [(MCKeyValue *)v26 initWithLocalizedString:v27 localizedKey:v28];

          [v9 addObject:v29];
        }
        long long v30 = [v8 proxyPort];

        if (v30)
        {
          long long v31 = NSString;
          __int16 v32 = [v8 proxyPort];
          id v33 = objc_msgSend(v31, "stringWithFormat:", @"%d", objc_msgSend(v32, "intValue"));

          uint64_t v34 = [MCKeyValue alloc];
          long long v35 = MCLocalizedString(@"PORT");
          uint64_t v36 = [(MCKeyValue *)v34 initWithLocalizedString:v33 localizedKey:v35];

          [v9 addObject:v36];
        }
        if ([v9 count])
        {
          v37 = +[MCKeyValueSection sectionWithKeyValues:v9];
          [v3 addObject:v37];
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v5);
  }

  if (![v3 count])
  {

    id v3 = 0;
  }
  return v3;
}

- (id)installationWarnings
{
  uint64_t v2 = MCLocalizedString(@"INSTALL_WARNING_CELLULAR_TITLE");
  id v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_CELLULAR");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];

  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];

  return v5;
}

- (BOOL)wasInstalled
{
  return self->_wasInstalled;
}

- (void)setWasInstalled:(BOOL)a3
{
  self->_wasInstalled = a3;
}

- (void).cxx_destruct
{
}

@end