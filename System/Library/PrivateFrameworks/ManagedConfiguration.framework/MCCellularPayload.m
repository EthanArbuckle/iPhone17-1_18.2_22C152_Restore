@interface MCCellularPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCAPNConfiguration)attachAPN;
- (MCCellularPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)APNs;
- (id)APNConfigurationDescription;
- (id)APNsDescription;
- (id)APNsLabel;
- (id)attachAPNConfigurationLabel;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAPNs:(id)a3;
- (void)setAttachAPN:(id)a3;
@end

@implementation MCCellularPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.cellular";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"CELLULAR_DESCRIPTION_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"CELLULAR_DESCRIPTION_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCCellularPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v53.receiver = self;
  v53.super_class = (Class)MCCellularPayload;
  uint64_t v9 = [(MCPayload *)&v53 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_13;
  }
  id v52 = 0;
  v10 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"AttachAPN" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v52];
  id v11 = v52;
  if (v11) {
    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_16;
  }
  v23 = [MCAPNConfiguration alloc];
  v24 = a5;
  v25 = (void *)[v10 mutableCopy];
  id v51 = 0;
  v26 = v10;
  uint64_t v27 = [(MCAPNConfiguration *)v23 initWithDictionary:v25 outError:&v51];
  id v11 = v51;
  attachAPN = v9->_attachAPN;
  v9->_attachAPN = (MCAPNConfiguration *)v27;
  v10 = v26;

  a5 = v24;
  if (v11)
  {
LABEL_3:
  }
  else
  {
LABEL_16:
    id v50 = 0;
    v29 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"APNs" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v50];
    id v30 = v50;
    v31 = v30;
    if (v29)
    {
      v42 = v10;
      v43 = a5;
      v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v29, "count"));
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      v41 = v29;
      id v32 = v29;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v47 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            v38 = [MCAPNConfiguration alloc];
            v39 = (void *)[v37 mutableCopy];
            id v45 = v31;
            v40 = [(MCAPNConfiguration *)v38 initWithDictionary:v39 outError:&v45];
            id v11 = v45;

            if (v11)
            {

              goto LABEL_31;
            }
            if (v40) {
              [v44 addObject:v40];
            }

            v31 = 0;
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v46 objects:v58 count:16];
          v31 = 0;
          id v11 = 0;
          if (v34) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v11 = v31;
      }
LABEL_31:

      if ([v44 count]) {
        objc_storeStrong((id *)&v9->_APNs, v44);
      }

      v10 = v42;
      a5 = v43;
      v29 = v41;
    }
    else
    {
      id v11 = v30;
    }

    if (!v11) {
      goto LABEL_9;
    }
  }
  v12 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
  v13 = v12;
  if (a5) {
    *a5 = v12;
  }
  v14 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v15 = v14;
    v16 = objc_opt_class();
    id v17 = v16;
    v18 = [v13 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v55 = v16;
    __int16 v56 = 2114;
    id v57 = v18;
    _os_log_impl(&dword_1A13F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = 0;
LABEL_9:
  if ([v8 count])
  {
    v19 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      v21 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v55 = v21;
      __int16 v56 = 2114;
      id v57 = v8;
      _os_log_impl(&dword_1A13F0000, v20, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_13:
  return v9;
}

- (id)stubDictionary
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MCCellularPayload;
  uint64_t v3 = [(MCPayload *)&v23 stubDictionary];
  uint64_t v4 = [(MCCellularPayload *)self attachAPN];

  if (v4)
  {
    uint64_t v5 = [(MCCellularPayload *)self attachAPN];
    uint64_t v6 = [v5 stubDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"AttachAPN"];
  }
  uint64_t v7 = [(MCCellularPayload *)self APNs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    v10 = [(MCCellularPayload *)self APNs];
    id v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(MCCellularPayload *)self APNs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) stubDictionary];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"APNs"];
  }
  return v3;
}

- (id)verboseDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)MCCellularPayload;
  uint64_t v3 = [(MCPayload *)&v20 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCCellularPayload *)self attachAPN];

  if (v5)
  {
    uint64_t v6 = [(MCCellularPayload *)self attachAPN];
    [v4 appendFormat:@"Attach APN  :\n%@\n", v6];
  }
  uint64_t v7 = [(MCCellularPayload *)self APNs];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(MCCellularPayload *)self APNs];
    objc_msgSend(v4, "appendFormat:", @"%d APN configurations.\n", objc_msgSend(v9, "count"));

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = [(MCCellularPayload *)self APNs];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [v4 appendFormat:@"%@\n", *(void *)(*((void *)&v16 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v4;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = [(MCCellularPayload *)self APNs];
  uint64_t v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  uint64_t v7 = [(MCCellularPayload *)self attachAPN];

  if (v7)
  {
    uint64_t v8 = [(MCCellularPayload *)self attachAPN];
    [v6 addObject:v8];
  }
  uint64_t v9 = [(MCCellularPayload *)self APNs];
  [v6 addObjectsFromArray:v9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v15 = objc_opt_new();
        long long v16 = [v14 name];

        if (v16)
        {
          long long v17 = [MCKeyValue alloc];
          long long v18 = [v14 name];
          long long v19 = MCLocalizedString(@"CELLULAR_CONFIG_NAME");
          objc_super v20 = [(MCKeyValue *)v17 initWithLocalizedString:v18 localizedKey:v19];

          [v15 addObject:v20];
        }
        long long v21 = [v14 authenticationType];

        if (v21)
        {
          uint64_t v22 = [MCKeyValue alloc];
          objc_super v23 = [v14 localizedAuthenticationType];
          v24 = MCLocalizedString(@"AUTHENTICATION_TYPE");
          uint64_t v25 = [(MCKeyValue *)v22 initWithLocalizedString:v23 localizedKey:v24];

          [v15 addObject:v25];
        }
        v26 = [v14 username];

        if (v26)
        {
          uint64_t v27 = [MCKeyValue alloc];
          v28 = [v14 username];
          v29 = MCLocalizedString(@"USERNAME");
          id v30 = [(MCKeyValue *)v27 initWithLocalizedString:v28 localizedKey:v29];

          [v15 addObject:v30];
        }
        v31 = [v14 password];

        if (v31)
        {
          id v32 = [MCKeyValue alloc];
          uint64_t v33 = MCLocalizedString(@"PRESENT");
          uint64_t v34 = MCLocalizedString(@"PASSWORD");
          uint64_t v35 = [(MCKeyValue *)v32 initWithLocalizedString:v33 localizedKey:v34];

          [v15 addObject:v35];
        }
        v36 = [v14 proxyServer];

        if (v36)
        {
          v37 = [MCKeyValue alloc];
          v38 = [v14 proxyServer];
          v39 = MCLocalizedString(@"PROXY");
          v40 = [(MCKeyValue *)v37 initWithLocalizedString:v38 localizedKey:v39];

          [v15 addObject:v40];
        }
        v41 = [v14 proxyPort];

        if (v41)
        {
          v42 = NSString;
          v43 = [v14 proxyPort];
          v44 = objc_msgSend(v42, "stringWithFormat:", @"%d", objc_msgSend(v43, "intValue"));

          id v45 = [MCKeyValue alloc];
          long long v46 = MCLocalizedString(@"PORT");
          long long v47 = [(MCKeyValue *)v45 initWithLocalizedString:v44 localizedKey:v46];

          [v15 addObject:v47];
        }
        long long v48 = [v14 enableXLAT464];

        if (v48)
        {
          long long v49 = [MCKeyValue alloc];
          id v50 = [v14 enableXLAT464];
          id v51 = MCLocalizedStringForBool([v50 BOOLValue]);
          id v52 = MCLocalizedString(@"CELLULAR_ENABLE_XLAT464");
          objc_super v53 = [(MCKeyValue *)v49 initWithLocalizedString:v51 localizedKey:v52];

          [v15 addObject:v53];
        }
        if ([v15 count])
        {
          v54 = +[MCKeyValueSection sectionWithKeyValues:v15];
          [v3 addObject:v54];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v11);
  }

  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (id)attachAPNConfigurationLabel
{
  uint64_t v2 = [(MCCellularPayload *)self attachAPN];

  if (v2)
  {
    uint64_t v3 = MCLocalizedString(@"ATTACH_APN_LABEL_COLON");
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)APNConfigurationDescription
{
  uint64_t v3 = [(MCCellularPayload *)self attachAPN];

  if (v3)
  {
    uint64_t v4 = [(MCCellularPayload *)self attachAPN];
    uint64_t v5 = [v4 name];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)APNsLabel
{
  uint64_t v3 = [(MCCellularPayload *)self APNs];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = @"APN_CONFIG_SINGULAR_COLON";
LABEL_5:
    uint64_t v8 = MCLocalizedString(v5);
    goto LABEL_7;
  }
  uint64_t v6 = [(MCCellularPayload *)self APNs];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    uint64_t v5 = @"APN_CONFIG_COUNT_PLURAL_COLON";
    goto LABEL_5;
  }
  uint64_t v8 = 0;
LABEL_7:
  return v8;
}

- (id)APNsDescription
{
  uint64_t v3 = [(MCCellularPayload *)self APNs];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [(MCCellularPayload *)self APNs];
  uint64_t v6 = v5;
  if (v4 == 1)
  {
    unint64_t v7 = [v5 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 name];
LABEL_5:
    uint64_t v12 = (void *)v8;

    goto LABEL_7;
  }
  unint64_t v9 = [v5 count];

  if (v9 >= 2)
  {
    uint64_t v10 = NSString;
    uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v6 = [(MCCellularPayload *)self APNs];
    unint64_t v7 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    uint64_t v8 = [v10 stringWithFormat:@"%@", v7];
    goto LABEL_5;
  }
  uint64_t v12 = 0;
LABEL_7:
  return v12;
}

- (id)subtitle1Label
{
  uint64_t v3 = [(MCCellularPayload *)self attachAPN];

  if (v3)
  {
    uint64_t v4 = [(MCCellularPayload *)self attachAPNConfigurationLabel];
  }
  else
  {
    uint64_t v5 = [(MCCellularPayload *)self APNs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v4 = [(MCCellularPayload *)self APNsLabel];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCCellularPayload *)self attachAPN];

  if (v3)
  {
    uint64_t v4 = [(MCCellularPayload *)self APNConfigurationDescription];
  }
  else
  {
    uint64_t v5 = [(MCCellularPayload *)self APNs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v4 = [(MCCellularPayload *)self APNsDescription];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)subtitle2Label
{
  uint64_t v3 = [(MCCellularPayload *)self attachAPN];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCellularPayload *)self APNs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v3 = [(MCCellularPayload *)self APNsLabel];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)subtitle2Description
{
  uint64_t v3 = [(MCCellularPayload *)self attachAPN];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(MCCellularPayload *)self APNs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v3 = [(MCCellularPayload *)self APNsDescription];
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (id)installationWarnings
{
  uint64_t v2 = MCLocalizedString(@"INSTALL_WARNING_CELLULAR_TITLE");
  uint64_t v3 = MCLocalizedStringByDevice(@"INSTALL_WARNING_CELLULAR");
  uint64_t v4 = +[MCProfileWarning warningWithLocalizedTitle:v2 localizedBody:v3 isLongForm:1];

  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];

  return v5;
}

- (MCAPNConfiguration)attachAPN
{
  return self->_attachAPN;
}

- (void)setAttachAPN:(id)a3
{
}

- (NSArray)APNs
{
  return self->_APNs;
}

- (void)setAPNs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_APNs, 0);
  objc_storeStrong((id *)&self->_attachAPN, 0);
}

@end