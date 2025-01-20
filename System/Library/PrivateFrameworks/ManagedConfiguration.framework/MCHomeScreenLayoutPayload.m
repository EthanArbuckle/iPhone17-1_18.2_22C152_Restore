@interface MCHomeScreenLayoutPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCHomeScreenLayoutPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)layout;
- (id)parseIconsArray:(id)a3 allowFolders:(BOOL)a4 outError:(id *)a5;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (void)setLayout:(id)a3;
@end

@implementation MCHomeScreenLayoutPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.homescreenlayout";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"HOME_SCREEN_LAYOUT_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"HOME_SCREEN_LAYOUT_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCHomeScreenLayoutPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v60.receiver = self;
  v60.super_class = (Class)MCHomeScreenLayoutPayload;
  v10 = [(MCPayload *)&v60 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      id v59 = 0;
      uint64_t v11 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Layout" isRequired:0 outError:&v59];
      v12 = (char *)v59;
      layout = v10->_layout;
      v10->_layout = (NSArray *)v11;
    }
    else
    {
      layout = objc_opt_new();
      id v58 = 0;
      v14 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Dock" isRequired:0 outError:&v58];
      v15 = (char *)v58;
      if (v15)
      {
        v12 = v15;
        v16 = 0;
        v17 = 0;
      }
      else
      {
        id v57 = 0;
        v17 = [(MCHomeScreenLayoutPayload *)v10 parseIconsArray:v14 allowFolders:1 outError:&v57];
        v18 = (char *)v57;
        if (v18)
        {
          v12 = v18;
          v16 = 0;
        }
        else
        {
          [layout addObject:v17];
          id v56 = 0;
          v16 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Pages" isRequired:1 outError:&v56];
          v19 = (char *)v56;
          if (v19)
          {
            v12 = v19;
          }
          else
          {
            v42 = v17;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            obj = v16;
            uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v66 count:16];
            if (v46)
            {
              v44 = layout;
              uint64_t v45 = *(void *)v53;
              v40 = v14;
              v41 = a5;
              while (2)
              {
                for (uint64_t i = 0; i != v46; ++i)
                {
                  if (*(void *)v53 != v45) {
                    objc_enumerationMutation(obj);
                  }
                  v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v51 = 0u;
                  id v22 = v21;
                  v23 = (char *)[v22 countByEnumeratingWithState:&v48 objects:v65 count:16];
                  if (v23)
                  {
                    uint64_t v24 = *(void *)v49;
                    while (2)
                    {
                      for (j = 0; j != v23; ++j)
                      {
                        if (*(void *)v49 != v24) {
                          objc_enumerationMutation(v22);
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v23 = +[MCPayload badFieldTypeErrorWithField:@"Pages"];
                          goto LABEL_25;
                        }
                      }
                      v23 = (char *)[v22 countByEnumeratingWithState:&v48 objects:v65 count:16];
                      if (v23) {
                        continue;
                      }
                      break;
                    }
LABEL_25:
                    layout = v44;
                  }

                  v47 = v23;
                  v26 = [(MCHomeScreenLayoutPayload *)v10 parseIconsArray:v22 allowFolders:1 outError:&v47];
                  v12 = v47;

                  if (v12)
                  {

                    v16 = obj;
                    v28 = obj;
                    v14 = v40;
                    a5 = v41;
                    goto LABEL_31;
                  }
                  [layout addObject:v26];
                }
                v14 = v40;
                a5 = v41;
                uint64_t v46 = [(NSArray *)obj countByEnumeratingWithState:&v52 objects:v66 count:16];
                if (v46) {
                  continue;
                }
                break;
              }
            }
            v16 = obj;

            uint64_t v27 = [layout copy];
            v12 = 0;
            v28 = v10->_layout;
            v10->_layout = (NSArray *)v27;
LABEL_31:

            v17 = v42;
          }
        }
      }
    }
    if (v12)
    {
      v29 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      v30 = v29;
      if (a5) {
        *a5 = v29;
      }
      v31 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        v33 = objc_opt_class();
        id v34 = v33;
        v35 = [v30 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v62 = v33;
        __int16 v63 = 2114;
        id v64 = v35;
        _os_log_impl(&dword_1A13F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }
    if (objc_msgSend(v8, "count", v40, v41))
    {
      v36 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v37 = v36;
        v38 = [(MCPayload *)v10 friendlyName];
        *(_DWORD *)buf = 138543618;
        v62 = v38;
        __int16 v63 = 2114;
        id v64 = v8;
        _os_log_impl(&dword_1A13F0000, v37, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
      }
    }
  }
  return v10;
}

- (id)parseIconsArray:(id)a3 allowFolders:(BOOL)a4 outError:(id *)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (!v9)
  {

    goto LABEL_69;
  }
  uint64_t v10 = v9;
  long long v48 = a5;
  uint64_t v11 = 0;
  uint64_t v54 = *(void *)v76;
  id v49 = v8;
  long long v50 = v7;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v51 = v10;
    do
    {
      if (*(void *)v76 != v54) {
        objc_enumerationMutation(v8);
      }
      uint64_t v55 = v12;
      v13 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * v12) mutableCopy];
      v74 = v11;
      id v58 = v13;
      v14 = [v13 MCValidateAndRemoveNonZeroLengthStringWithKey:@"Type" isRequired:1 outError:&v74];
      v15 = v74;

      id v56 = v14;
      if (v15)
      {
        uint64_t v11 = v15;
        goto LABEL_64;
      }
      if (![v14 isEqualToString:@"Application"])
      {
        if ([v14 isEqualToString:@"Folder"])
        {
          if (a4)
          {
            id v72 = 0;
            v18 = v58;
            v19 = [v58 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DisplayName" isRequired:1 outError:&v72];
            v20 = (char *)v72;
            if (v20)
            {
              uint64_t v11 = v20;
            }
            else
            {
              uint64_t v21 = objc_opt_class();
              id v71 = 0;
              id v22 = [v58 MCValidateAndRemoveArrayOfClass:v21 withKey:@"Pages" isRequired:0 outError:&v71];
              v23 = (char *)v71;
              if (!v23)
              {
                long long v53 = v19;
                uint64_t v24 = objc_opt_new();
                long long v67 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id obj = v22;
                uint64_t v25 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = *(void *)v68;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v26; ++i)
                    {
                      if (*(void *)v68 != v27) {
                        objc_enumerationMutation(obj);
                      }
                      v29 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                      long long v63 = 0u;
                      long long v64 = 0u;
                      long long v65 = 0u;
                      long long v66 = 0u;
                      id v30 = v29;
                      v31 = (char *)[v30 countByEnumeratingWithState:&v63 objects:v85 count:16];
                      if (v31)
                      {
                        uint64_t v32 = *(void *)v64;
                        while (2)
                        {
                          for (j = 0; j != v31; ++j)
                          {
                            if (*(void *)v64 != v32) {
                              objc_enumerationMutation(v30);
                            }
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              v31 = +[MCPayload badFieldTypeErrorWithField:@"Pages"];
                              goto LABEL_29;
                            }
                          }
                          v31 = (char *)[v30 countByEnumeratingWithState:&v63 objects:v85 count:16];
                          if (v31) {
                            continue;
                          }
                          break;
                        }
                      }
LABEL_29:

                      v62 = v31;
                      id v34 = [(MCHomeScreenLayoutPayload *)self parseIconsArray:v30 allowFolders:0 outError:&v62];
                      uint64_t v11 = v62;

                      if (v11)
                      {

                        goto LABEL_40;
                      }
                      [v24 addObject:v34];
                    }
                    uint64_t v26 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
                    if (v26) {
                      continue;
                    }
                    break;
                  }
                  uint64_t v11 = 0;
LABEL_40:
                  id v8 = v49;
                  uint64_t v7 = v50;
                  uint64_t v10 = v51;
                }
                else
                {
                  uint64_t v11 = 0;
                }

                v83[0] = @"displayName";
                v83[1] = @"iconLists";
                v84[0] = v53;
                v84[1] = v24;
                v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];
                [v7 addObject:v41];

                goto LABEL_47;
              }
              uint64_t v11 = v23;
            }
          }
          else
          {
            uint64_t v45 = _MCLogObjects;
            v18 = v58;
            if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A13F0000, v45, OS_LOG_TYPE_ERROR, "Folder isn't allowed at this level. Ignoring.", buf, 2u);
            }
            uint64_t v11 = 0;
          }
LABEL_65:

          goto LABEL_66;
        }
        if (![v14 isEqualToString:@"WebClip"])
        {
          v40 = (void *)_MCLogObjects;
          if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
          {
LABEL_44:
            uint64_t v11 = 0;
            goto LABEL_47;
          }
          v16 = v40;
          v36 = [(MCPayload *)self friendlyName];
          *(_DWORD *)buf = 138543618;
          v80 = v36;
          __int16 v81 = 2114;
          v82 = v56;
          _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "Icon dictionary for payload “%{public}@” is unknown type “%{public}@”. Ignoring.", buf, 0x16u);
LABEL_43:

          goto LABEL_44;
        }
        id v61 = 0;
        v18 = v58;
        v16 = [v58 MCValidateAndRemoveNonZeroLengthStringWithKey:@"URL" isRequired:1 outError:&v61];
        v35 = (char *)v61;
        if (v35)
        {
          uint64_t v11 = v35;

          goto LABEL_65;
        }
        id v60 = 0;
        v36 = [v58 MCValidateAndRemoveNonZeroLengthStringWithKey:@"DisplayName" isRequired:0 outError:&v60];
        v37 = (char *)v60;
        if (!v37)
        {
          v38 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v16 forKey:@"webClipURL"];
          v39 = v38;
          if (v36) {
            [v38 setObject:v36 forKey:@"displayName"];
          }
          [v7 addObject:v39];

          goto LABEL_43;
        }
        uint64_t v11 = v37;

LABEL_63:
LABEL_64:
        v18 = v58;
        goto LABEL_65;
      }
      id v73 = 0;
      v16 = [v58 MCValidateAndRemoveNonZeroLengthStringWithKey:@"BundleID" isRequired:1 outError:&v73];
      uint64_t v11 = (char *)v73;
      if (v11) {
        goto LABEL_63;
      }
      v87 = @"displayIdentifier";
      v88 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      [v7 addObject:v17];

LABEL_47:
      if ([v58 count])
      {
        v42 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v43 = v42;
          v44 = [(MCPayload *)self friendlyName];
          *(_DWORD *)buf = 138543618;
          v80 = v44;
          __int16 v81 = 2114;
          v82 = v58;
          _os_log_impl(&dword_1A13F0000, v43, OS_LOG_TYPE_INFO, "Icon dictionary for payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
        }
      }

      uint64_t v12 = v55 + 1;
    }
    while (v55 + 1 != v10);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v75 objects:v89 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_66:

  a5 = v48;
  if (!v11)
  {
LABEL_69:
    uint64_t v46 = (void *)[v7 copy];
    uint64_t v11 = 0;
    if (!a5) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  uint64_t v46 = 0;
  if (v48) {
LABEL_70:
  }
    *a5 = v11;
LABEL_71:

  return v46;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCHomeScreenLayoutPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCHomeScreenLayoutPayload *)self layout];
  [v3 setObject:v4 forKeyedSubscript:@"Layout"];

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v2 = objc_opt_new();
  if (![v2 count])
  {

    uint64_t v2 = 0;
  }

  return v2;
}

- (NSArray)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end