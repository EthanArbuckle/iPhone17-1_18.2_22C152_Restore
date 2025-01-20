@interface MCTVRemotePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCTVRemotePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)allowedRemotes;
- (NSArray)allowedTVIDs;
- (NSArray)allowedTVNames;
- (NSArray)allowedTVs;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)subtitle2Description;
- (id)subtitle2Label;
- (id)verboseDescription;
- (void)setAllowedRemotes:(id)a3;
- (void)setAllowedTVs:(id)a3;
@end

@implementation MCTVRemotePayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.tvremote";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"TVREMOTE_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"TVREMOTE_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCTVRemotePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v52.receiver = self;
  v52.super_class = (Class)MCTVRemotePayload;
  uint64_t v9 = [(MCPayload *)&v52 initWithDictionary:v8 profile:a4 outError:a5];
  if (!v9) {
    goto LABEL_31;
  }
  id v51 = 0;
  v10 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"AllowedTVs" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v51];
  id v11 = v51;
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = [MEMORY[0x1E4F1CA48] array];
    id v40 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obj = v10;
    uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v48;
      v43 = v13;
      v38 = a5;
      v44 = v14;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * v15);
        v17 = [MEMORY[0x1E4F1CA60] dictionary];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v46 = 0;
        v18 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v16 key:@"TVDeviceID" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v46];
        id v19 = v46;
        if (v19)
        {
          v12 = v19;

          goto LABEL_20;
        }
        v20 = [v18 uppercaseString];

        [v17 setObject:v20 forKeyedSubscript:@"TVDeviceID"];
        [v44 addObject:v20];
        id v45 = 0;
        v21 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v16 key:@"TVDeviceName" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v45];
        id v22 = v45;
        if (v22)
        {
          v12 = v22;

          goto LABEL_20;
        }
        if (v21)
        {
          [v17 setObject:v21 forKeyedSubscript:@"TVDeviceName"];
          [v40 addObject:v21];
        }
        [v43 addObject:v17];

        if (v41 == ++v15)
        {
          a5 = v38;
          v13 = v43;
          v14 = v44;
          uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v41) {
            goto LABEL_6;
          }
          goto LABEL_16;
        }
      }
      v12 = +[MCPayload badFieldTypeErrorWithField:@"AllowedTVs"];
LABEL_20:

      v23 = obj;
      v24 = v40;
      allowedTVIDs = obj;
      a5 = v38;
      v13 = v43;
      v14 = v44;
      goto LABEL_21;
    }
LABEL_16:
    v23 = obj;

    objc_storeStrong((id *)&v9->_allowedTVs, v13);
    v24 = v40;
    objc_storeStrong((id *)&v9->_allowedTVNames, v40);
    v25 = v14;
    v12 = 0;
    allowedTVIDs = v9->_allowedTVIDs;
    v9->_allowedTVIDs = v25;
LABEL_21:

    if (!v12) {
      goto LABEL_27;
    }
  }
  v27 = [(MCPayload *)v9 malformedPayloadErrorWithError:v12];
  v28 = v27;
  if (a5) {
    *a5 = v27;
  }
  v29 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v30 = v29;
    v31 = objc_opt_class();
    id v32 = v31;
    v33 = [v28 MCVerboseDescription];
    *(_DWORD *)buf = 138543618;
    v54 = v31;
    __int16 v55 = 2114;
    id v56 = v33;
    _os_log_impl(&dword_1A13F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
  }
  uint64_t v9 = 0;
LABEL_27:
  if ([v8 count])
  {
    v34 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v35 = v34;
      v36 = [(MCPayload *)v9 friendlyName];
      *(_DWORD *)buf = 138543618;
      v54 = v36;
      __int16 v55 = 2114;
      id v56 = v8;
      _os_log_impl(&dword_1A13F0000, v35, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_31:
  return v9;
}

- (id)stubDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)MCTVRemotePayload;
  uint64_t v3 = [(MCPayload *)&v7 stubDictionary];
  uint64_t v4 = [(MCTVRemotePayload *)self allowedTVs];

  if (v4)
  {
    uint64_t v5 = [(MCTVRemotePayload *)self allowedTVs];
    [v3 setObject:v5 forKey:@"AllowedTVs"];
  }
  return v3;
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCTVRemotePayload *)self allowedRemotes];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = MCLocalizedString(@"TVREMOTE_REMOTES_TITLE_COLON");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCTVRemotePayload *)self allowedRemotes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(MCTVRemotePayload *)self allowedRemotes];
    uint64_t v6 = [v5 count];
    v14 = MCLocalizedFormat(@"TVREMOTE_REMOTE_COUNT", v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)subtitle2Label
{
  uint64_t v2 = [(MCTVRemotePayload *)self allowedTVs];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = MCLocalizedString(@"TVREMOTE_TVS_TITLE_COLON");
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)subtitle2Description
{
  uint64_t v3 = [(MCTVRemotePayload *)self allowedTVs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(MCTVRemotePayload *)self allowedTVs];
    uint64_t v6 = [v5 count];
    v14 = MCLocalizedFormat(@"TVREMOTE_TV_COUNT", v7, v8, v9, v10, v11, v12, v13, v6);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)verboseDescription
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v34.receiver = self;
  v34.super_class = (Class)MCTVRemotePayload;
  uint64_t v4 = [(MCPayload *)&v34 description];
  uint64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(MCTVRemotePayload *)self allowedRemotes];

  if (v6)
  {
    uint64_t v7 = [(MCTVRemotePayload *)self allowedRemotes];
    objc_msgSend(v5, "appendFormat:", @"Allowed Remotes   : %lu entries\n", objc_msgSend(v7, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [(MCTVRemotePayload *)self allowedRemotes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          [v5 appendFormat:@"                  %@\n", *(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v10);
    }
  }
  uint64_t v13 = [(MCTVRemotePayload *)self allowedTVs];

  if (v13)
  {
    v14 = [(MCTVRemotePayload *)self allowedTVs];
    objc_msgSend(v5, "appendFormat:", @"Allowed TVs       : %lu entries\n", objc_msgSend(v14, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = [(MCTVRemotePayload *)self allowedTVs];
    uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          v20 = [v19 objectForKeyedSubscript:@"TVDeviceID"];
          uint64_t v21 = [v19 objectForKeyedSubscript:@"TVDeviceName"];
          id v22 = (void *)v21;
          if (v21) {
            v23 = (__CFString *)v21;
          }
          else {
            v23 = &stru_1EF4AAAF8;
          }
          [v5 appendFormat:@"                  %@ (%@)\n", v20, v23];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v16);
    }
  }
  return v5;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MCTVRemotePayload *)self allowedRemotes];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(MCTVRemotePayload *)self allowedRemotes];
    uint64_t v7 = MCLocalizedString(@"TVREMOTE_ALLOWED_REMOTES");
    uint64_t v8 = +[MCKeyValueSection sectionWithLocalizedArray:v6 title:v7 footer:0];

    if (v8) {
      [v3 addObject:v8];
    }
  }
  uint64_t v9 = [(MCTVRemotePayload *)self allowedTVIDs];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(MCTVRemotePayload *)self allowedTVIDs];
    uint64_t v12 = MCLocalizedString(@"TVREMOTE_ALLOWED_TVS");
    uint64_t v13 = +[MCKeyValueSection sectionWithLocalizedArray:v11 title:v12 footer:0];

    if (v13) {
      [v3 addObject:v13];
    }
  }
  v14 = [(MCTVRemotePayload *)self allowedTVNames];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = [(MCTVRemotePayload *)self allowedTVNames];
    uint64_t v17 = MCLocalizedString(@"TVREMOTE_ALLOWED_TV_NAMES");
    v18 = +[MCKeyValueSection sectionWithLocalizedArray:v16 title:v17 footer:0];

    if (v18) {
      [v3 addObject:v18];
    }
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)restrictions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:v4 forKeyedSubscript:@"union"];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [(MCTVRemotePayload *)self allowedRemotes];

  if (v6)
  {
    [v4 setObject:v5 forKeyedSubscript:@"tvRemoteAllowedRemotes"];
    uint64_t v7 = [(MCTVRemotePayload *)self allowedRemotes];
    [v5 setObject:v7 forKeyedSubscript:@"values"];
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = [(MCTVRemotePayload *)self allowedTVIDs];

  if (v9)
  {
    [v4 setObject:v8 forKeyedSubscript:@"tvRemoteAllowedTVs"];
    uint64_t v10 = [(MCTVRemotePayload *)self allowedTVIDs];
    [v8 setObject:v10 forKeyedSubscript:@"values"];
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v12 = [(MCTVRemotePayload *)self allowedTVNames];

  if (v12)
  {
    [v4 setObject:v11 forKeyedSubscript:@"tvRemoteAllowedTVNames"];
    uint64_t v13 = [(MCTVRemotePayload *)self allowedTVNames];
    [v11 setObject:v13 forKeyedSubscript:@"values"];
  }
  return v3;
}

- (NSArray)allowedTVIDs
{
  return self->_allowedTVIDs;
}

- (NSArray)allowedTVNames
{
  return self->_allowedTVNames;
}

- (NSArray)allowedRemotes
{
  return self->_allowedRemotes;
}

- (void)setAllowedRemotes:(id)a3
{
}

- (NSArray)allowedTVs
{
  return self->_allowedTVs;
}

- (void)setAllowedTVs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTVs, 0);
  objc_storeStrong((id *)&self->_allowedRemotes, 0);
  objc_storeStrong((id *)&self->_allowedTVNames, 0);
  objc_storeStrong((id *)&self->_allowedTVIDs, 0);
}

@end