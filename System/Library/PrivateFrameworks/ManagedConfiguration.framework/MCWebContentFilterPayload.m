@interface MCWebContentFilterPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)pluginFilterKeysAndClasses;
+ (id)typeStrings;
- (BOOL)_BOOLFromDict:(id)a3 key:(id)a4 outError:(id *)a5;
- (BOOL)autoFilterEnabled;
- (BOOL)filterBrowsers;
- (BOOL)filterSockets;
- (BOOL)hideDenyListURLs;
- (MCWebContentFilterPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)allowListBookmarks;
- (NSArray)denyListURLStrings;
- (NSArray)permittedURLStrings;
- (NSDictionary)pluginConfiguration;
- (NSString)contentFilterUUID;
- (NSString)filterType;
- (NSString)name;
- (NSString)pluginBundleID;
- (id)_dictsFromDict:(id)a3 key:(id)a4 outError:(id *)a5;
- (id)_stringFromDict:(id)a3 key:(id)a4 outError:(id *)a5;
- (id)_stringsFromDict:(id)a3 key:(id)a4 outError:(id *)a5;
- (id)installationWarnings;
- (id)payloadDescriptionKeyValueSections;
- (id)restrictions;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)title;
- (id)verboseDescription;
- (void)setAllowListBookmarks:(id)a3;
- (void)setAutoFilterEnabled:(BOOL)a3;
- (void)setContentFilterUUID:(id)a3;
- (void)setDenyListURLStrings:(id)a3;
- (void)setFilterBrowsers:(BOOL)a3;
- (void)setFilterSockets:(BOOL)a3;
- (void)setFilterType:(id)a3;
- (void)setHideDenyListURLs:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPermittedURLStrings:(id)a3;
- (void)setPluginBundleID:(id)a3;
- (void)setPluginConfiguration:(id)a3;
@end

@implementation MCWebContentFilterPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.webcontent-filter";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"WEB_FILTER_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"WEB_FILTER_", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)pluginFilterKeysAndClasses
{
  if (pluginFilterKeysAndClasses_onceToken != -1) {
    dispatch_once(&pluginFilterKeysAndClasses_onceToken, &__block_literal_global_50);
  }
  uint64_t v2 = (void *)pluginFilterKeysAndClasses_dict;
  return v2;
}

void __55__MCWebContentFilterPayload_pluginFilterKeysAndClasses__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"UserDefinedName";
  v3[0] = objc_opt_class();
  v2[1] = @"PluginBundleID";
  v3[1] = objc_opt_class();
  v2[2] = @"ServerAddress";
  v3[2] = objc_opt_class();
  v2[3] = @"UserName";
  v3[3] = objc_opt_class();
  v2[4] = @"Password";
  v3[4] = objc_opt_class();
  v2[5] = @"PayloadCertificateUUID";
  v3[5] = objc_opt_class();
  v2[6] = @"Organization";
  v3[6] = objc_opt_class();
  v2[7] = @"VendorConfig";
  v3[7] = objc_opt_class();
  v2[8] = @"FilterBrowsers";
  v3[8] = objc_opt_class();
  v2[9] = @"FilterSockets";
  v3[9] = objc_opt_class();
  v2[10] = @"ApplicationCreated";
  v3[10] = objc_opt_class();
  v2[11] = @"Enabled";
  v3[11] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)pluginFilterKeysAndClasses_dict;
  pluginFilterKeysAndClasses_dict = v0;
}

- (MCWebContentFilterPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v115.receiver = self;
  v115.super_class = (Class)MCWebContentFilterPayload;
  v10 = [(MCPayload *)&v115 initWithDictionary:v8 profile:v9 outError:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_13;
  }
  id v114 = 0;
  uint64_t v12 = [(MCWebContentFilterPayload *)v10 _stringFromDict:v8 key:@"ContentFilterUUID" outError:&v114];
  id v13 = v114;
  contentFilterUUID = v11->_contentFilterUUID;
  v11->_contentFilterUUID = (NSString *)v12;

  if (v13) {
    goto LABEL_3;
  }
  uint64_t v26 = [(MCWebContentFilterPayload *)v11 _stringFromDict:v8 key:@"FilterType" outError:0];
  v27 = (void *)v26;
  if (v26) {
    v28 = (__CFString *)v26;
  }
  else {
    v28 = @"BuiltIn";
  }
  p_filterType = (id *)&v11->_filterType;
  objc_storeStrong((id *)&v11->_filterType, v28);

  v11->_hideDenyListURLs = [(MCWebContentFilterPayload *)v11 _BOOLFromDict:v8 key:@"HideDenyListURLs" outError:0];
  int v30 = [v9 isStub];
  BOOL v31 = [(NSString *)v11->_filterType isEqualToString:@"Plugin"];
  if (v30)
  {
    if (v31)
    {
      uint64_t v32 = [(MCWebContentFilterPayload *)v11 _stringFromDict:v8 key:@"PluginBundleID" outError:0];
      pluginBundleID = v11->_pluginBundleID;
      v11->_pluginBundleID = (NSString *)v32;

      uint64_t v34 = [(MCWebContentFilterPayload *)v11 _stringFromDict:v8 key:@"UserDefinedName" outError:0];
      id v13 = 0;
      name = v11->_name;
      v11->_name = (NSString *)v34;
LABEL_8:

      goto LABEL_9;
    }
    BOOL v39 = [(MCWebContentFilterPayload *)v11 _BOOLFromDict:v8 key:@"AutoFilterEnabled" outError:0];
    v11->_autoFilterEnabled = v39;
    if (v39)
    {
      uint64_t v40 = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"PermittedURLs" outError:0];
      v41 = (void *)v40;
      if (v40) {
        v42 = (void *)v40;
      }
      else {
        v42 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v11->_permittedURLStrings, v42);
    }
    v43 = [(MCWebContentFilterPayload *)v11 _dictsFromDict:v8 key:@"AllowListBookmarks" outError:0];
    v44 = v43;
    if (!v43)
    {
      v44 = [(MCWebContentFilterPayload *)v11 _dictsFromDict:v8 key:@"WhitelistedBookmarks" outError:0];
    }
    objc_storeStrong((id *)&v11->_allowListBookmarks, v44);
    if (!v43) {

    }
    name = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"DenyListURLs" outError:0];
    v38 = name;
    if (!name)
    {
      v38 = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"BlacklistedURLs" outError:0];
    }
    objc_storeStrong((id *)&v11->_denyListURLStrings, v38);
    if (name)
    {
LABEL_45:
      id v13 = 0;
      goto LABEL_8;
    }
LABEL_44:

    goto LABEL_45;
  }
  if (!v31 && ([*p_filterType isEqualToString:@"BuiltIn"] & 1) == 0)
  {
    id v13 = +[MCPayload badFieldTypeErrorWithField:@"FilterType"];
    goto LABEL_111;
  }
  if ([*p_filterType isEqualToString:@"Plugin"])
  {
    v35 = +[MCWebContentFilterPayload pluginFilterKeysAndClasses];
    id v113 = 0;
    uint64_t v36 = [v8 MCMutableDictionaryContainingValidatedKeysAndClasses:v35 removeKeys:1 outError:&v113];
    id v13 = v113;
    pluginConfiguration = v11->_pluginConfiguration;
    v11->_pluginConfiguration = (NSDictionary *)v36;

    if (!v13)
    {
      name = [(NSDictionary *)v11->_pluginConfiguration objectForKeyedSubscript:@"PluginBundleID"];
      if (name)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([name length]) {
            objc_storeStrong((id *)&v11->_pluginBundleID, name);
          }
        }
      }
      v38 = [(NSDictionary *)v11->_pluginConfiguration objectForKeyedSubscript:@"UserDefinedName"];
      if (v38)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v38 length]) {
            objc_storeStrong((id *)&v11->_name, v38);
          }
        }
      }
      goto LABEL_44;
    }
LABEL_3:
    v15 = [(MCPayload *)v11 malformedPayloadErrorWithError:v13];
    name = v15;
    if (a5) {
      *a5 = v15;
    }
    v17 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = objc_opt_class();
      id v20 = v19;
      v21 = [name MCVerboseDescription];
      *(_DWORD *)buf = 138543618;
      v117 = v19;
      __int16 v118 = 2114;
      id v119 = v21;
      _os_log_impl(&dword_1A13F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
    }
    v11 = 0;
    goto LABEL_8;
  }
  id v112 = 0;
  BOOL v45 = [(MCWebContentFilterPayload *)v11 _BOOLFromDict:v8 key:@"AutoFilterEnabled" outError:&v112];
  id v13 = v112;
  v11->_autoFilterEnabled = v45;
  if (v13) {
    goto LABEL_3;
  }
  if (v45)
  {
    id v111 = 0;
    v46 = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"PermittedURLs" outError:&v111];
    id v13 = v111;
    if (v46) {
      v47 = v46;
    }
    else {
      v47 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_permittedURLStrings, v47);

    if (v13) {
      goto LABEL_3;
    }
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    obuint64_t j = v11->_permittedURLStrings;
    uint64_t v48 = [(NSArray *)obj countByEnumeratingWithState:&v107 objects:v122 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v108 != v50) {
            objc_enumerationMutation(obj);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v13 = +[MCPayload badFieldValueErrorWithField:@"PermittedURLs"];

            goto LABEL_111;
          }
        }
        uint64_t v49 = [(NSArray *)obj countByEnumeratingWithState:&v107 objects:v122 count:16];
      }
      while (v49);
    }
  }
  id v106 = 0;
  uint64_t v52 = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"DenyListURLs" outError:&v106];
  id v13 = v106;
  denyListURLStrings = v11->_denyListURLStrings;
  v11->_denyListURLStrings = (NSArray *)v52;

  if (v13) {
    goto LABEL_111;
  }
  v54 = v11->_denyListURLStrings;
  if (v54)
  {
    v55 = @"DenyListURLs";
  }
  else
  {
    id v105 = 0;
    uint64_t v78 = [(MCWebContentFilterPayload *)v11 _stringsFromDict:v8 key:@"BlacklistedURLs" outError:&v105];
    id v13 = v105;
    v79 = v11->_denyListURLStrings;
    v11->_denyListURLStrings = (NSArray *)v78;

    if (v13) {
      goto LABEL_111;
    }
    v54 = v11->_denyListURLStrings;
    v55 = @"BlacklistedURLs";
  }
  v91 = v55;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  obja = v54;
  uint64_t v56 = [(NSArray *)obja countByEnumeratingWithState:&v101 objects:v121 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v102 != v58) {
          objc_enumerationMutation(obja);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = +[MCPayload badFieldValueErrorWithField:v91];
          goto LABEL_115;
        }
      }
      uint64_t v57 = [(NSArray *)obja countByEnumeratingWithState:&v101 objects:v121 count:16];
    }
    while (v57);
  }

  if (![(NSArray *)v11->_denyListURLStrings count])
  {
    v60 = v11->_denyListURLStrings;
    v11->_denyListURLStrings = 0;
  }
  id v100 = 0;
  uint64_t v61 = [(MCWebContentFilterPayload *)v11 _dictsFromDict:v8 key:@"AllowListBookmarks" outError:&v100];
  id v13 = v100;
  allowListBookmarks = v11->_allowListBookmarks;
  v11->_allowListBookmarks = (NSArray *)v61;

  if (!v13)
  {
    v63 = v11->_allowListBookmarks;
    if (!v63)
    {
      id v99 = 0;
      uint64_t v80 = [(MCWebContentFilterPayload *)v11 _dictsFromDict:v8 key:@"WhitelistedBookmarks" outError:&v99];
      id v13 = v99;
      v81 = v11->_allowListBookmarks;
      v11->_allowListBookmarks = (NSArray *)v80;

      if (v13) {
        goto LABEL_111;
      }
      v63 = v11->_allowListBookmarks;
    }
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v63, "count"));
    obja = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v83 = v11->_allowListBookmarks;
    uint64_t v87 = [(NSArray *)v83 countByEnumeratingWithState:&v95 objects:v120 count:16];
    id v13 = 0;
    if (!v87) {
      goto LABEL_106;
    }
    uint64_t v88 = *(void *)v96;
LABEL_78:
    uint64_t v64 = 0;
    while (1)
    {
      if (*(void *)v96 != v88) {
        objc_enumerationMutation(v83);
      }
      v65 = *(void **)(*((void *)&v95 + 1) + 8 * v64);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v82 = +[MCPayload badFieldValueErrorWithField:@"WhitelistedBookmarks"];
LABEL_122:

        id v13 = (id)v82;
LABEL_123:

        goto LABEL_115;
      }
      v92 = [MEMORY[0x1E4F1CA60] dictionary];
      v66 = [v65 objectForKeyedSubscript:@"URL"];
      if (v66)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v82 = +[MCPayload badFieldTypeErrorWithField:@"address"];

          id v13 = v92;
          goto LABEL_122;
        }
        [v92 setObject:v66 forKeyedSubscript:@"address"];
      }
      uint64_t v89 = v64;
      uint64_t v67 = [v65 objectForKeyedSubscript:@"BookmarkPath"];
      v90 = v66;
      if (v67)
      {
        v68 = (void *)v67;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[MCPayload badFieldTypeErrorWithField:@"bookmarkPath"];
          int v70 = 0;
          v71 = v13;
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_103;
        }
        if ([v68 rangeOfString:@"/" options:8] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v85 = [NSString stringWithFormat:@"/%@", v68];

          v69 = (void *)v85;
        }
        else
        {
          v69 = v68;
        }
        v68 = v69;
        objc_msgSend(v92, "setObject:forKeyedSubscript:");
      }
      else
      {
        [v92 setObject:@"/" forKeyedSubscript:@"bookmarkPath"];
        v68 = 0;
      }
      v71 = [v65 objectForKeyedSubscript:@"Title"];
      if (v71)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v86 = +[MCPayload badFieldTypeErrorWithField:@"pageTitle"];

          int v70 = 0;
          id v13 = (id)v86;
          goto LABEL_103;
        }
        [v92 setObject:v71 forKeyedSubscript:@"pageTitle"];
      }
      v72 = [v92 objectForKeyedSubscript:@"address"];

      if (!v72)
      {
        v74 = @"address";
LABEL_102:
        uint64_t v75 = +[MCPayload missingFieldErrorWithField:v74 underlyingError:0];

        int v70 = 0;
        id v13 = (id)v75;
        goto LABEL_103;
      }
      v73 = [v92 objectForKeyedSubscript:@"pageTitle"];

      if (!v73)
      {
        v74 = @"pageTitle";
        goto LABEL_102;
      }
      [(NSArray *)obja addObject:v92];
      int v70 = 1;
LABEL_103:

      if (!v70) {
        goto LABEL_123;
      }
      uint64_t v64 = v89 + 1;
      if (v87 == v89 + 1)
      {
        uint64_t v87 = [(NSArray *)v83 countByEnumeratingWithState:&v95 objects:v120 count:16];
        if (v87) {
          goto LABEL_78;
        }
LABEL_106:

        if ([(NSArray *)obja count]) {
          v76 = obja;
        }
        else {
          v76 = 0;
        }
        v77 = v76;
        v84 = v11->_allowListBookmarks;
        v11->_allowListBookmarks = v77;

LABEL_115:
        break;
      }
    }
  }
LABEL_111:
  if (v13) {
    goto LABEL_3;
  }
LABEL_9:
  if ([v8 count])
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      v24 = [(MCPayload *)v11 friendlyName];
      *(_DWORD *)buf = 138543618;
      v117 = v24;
      __int16 v118 = 2114;
      id v119 = v8;
      _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_13:
  return v11;
}

- (BOOL)_BOOLFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 MCValidateAndRemoveObjectOfClass:objc_opt_class() withKey:v7 isRequired:0 outError:a5];

  LOBYTE(v8) = [v9 BOOLValue];
  return (char)v8;
}

- (id)_stringFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  return (id)[a3 MCValidateAndRemoveNonZeroLengthStringWithKey:a4 isRequired:0 outError:a5];
}

- (id)_stringsFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:v7 isRequired:0 outError:a5];

  return v9;
}

- (id)_dictsFromDict:(id)a3 key:(id)a4 outError:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:v7 isRequired:0 outError:a5];

  return v9;
}

- (id)stubDictionary
{
  v23.receiver = self;
  v23.super_class = (Class)MCWebContentFilterPayload;
  uint64_t v3 = [(MCPayload *)&v23 stubDictionary];
  uint64_t v4 = [(MCWebContentFilterPayload *)self contentFilterUUID];

  if (v4)
  {
    uint64_t v5 = [(MCWebContentFilterPayload *)self contentFilterUUID];
    [v3 setObject:v5 forKeyedSubscript:@"ContentFilterUUID"];
  }
  uint64_t v6 = [(MCWebContentFilterPayload *)self filterType];

  if (v6)
  {
    id v7 = [(MCWebContentFilterPayload *)self filterType];
    [v3 setObject:v7 forKeyedSubscript:@"FilterType"];
  }
  if ([(MCWebContentFilterPayload *)self hideDenyListURLs])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWebContentFilterPayload hideDenyListURLs](self, "hideDenyListURLs"));
    [v3 setObject:v8 forKeyedSubscript:@"HideDenyListURLs"];
  }
  id v9 = [(MCWebContentFilterPayload *)self filterType];
  int v10 = [v9 isEqualToString:@"Plugin"];

  if (v10)
  {
    v11 = [(MCWebContentFilterPayload *)self pluginBundleID];

    if (v11)
    {
      uint64_t v12 = [(MCWebContentFilterPayload *)self pluginBundleID];
      [v3 setObject:v12 forKeyedSubscript:@"PluginBundleID"];
    }
    id v13 = [(MCWebContentFilterPayload *)self name];

    if (v13)
    {
      v14 = [(MCWebContentFilterPayload *)self name];
      v15 = @"UserDefinedName";
LABEL_18:
      [v3 setObject:v14 forKeyedSubscript:v15];
    }
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[MCWebContentFilterPayload autoFilterEnabled](self, "autoFilterEnabled"));
    [v3 setObject:v16 forKeyedSubscript:@"AutoFilterEnabled"];

    v17 = [(MCWebContentFilterPayload *)self permittedURLStrings];

    if (v17)
    {
      v18 = [(MCWebContentFilterPayload *)self permittedURLStrings];
      [v3 setObject:v18 forKeyedSubscript:@"PermittedURLs"];
    }
    v19 = [(MCWebContentFilterPayload *)self allowListBookmarks];

    if (v19)
    {
      id v20 = [(MCWebContentFilterPayload *)self allowListBookmarks];
      [v3 setObject:v20 forKeyedSubscript:@"AllowListBookmarks"];
    }
    v21 = [(MCWebContentFilterPayload *)self denyListURLStrings];

    if (v21)
    {
      v14 = [(MCWebContentFilterPayload *)self denyListURLStrings];
      v15 = @"DenyListURLs";
      goto LABEL_18;
    }
  }
  return v3;
}

- (id)restrictions
{
  v42[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MCWebContentFilterPayload *)self filterType];
  char v4 = [v3 isEqualToString:@"Plugin"];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v6 forKeyedSubscript:@"restrictedBool"];
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v7 forKeyedSubscript:@"intersection"];
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setObject:v8 forKeyedSubscript:@"union"];
    if ([(MCWebContentFilterPayload *)self autoFilterEnabled])
    {
      v41[0] = @"value";
      v41[1] = @"preference";
      v42[0] = MEMORY[0x1E4F1CC38];
      v42[1] = MEMORY[0x1E4F1CC38];
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      [v6 setObject:v9 forKeyedSubscript:@"forceWebContentFilterAuto"];
    }
    int v10 = [(MCWebContentFilterPayload *)self permittedURLStrings];

    if (v10)
    {
      BOOL v39 = @"values";
      v11 = [(MCWebContentFilterPayload *)self permittedURLStrings];
      uint64_t v40 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      [v7 setObject:v12 forKeyedSubscript:@"webContentFilterAutoPermittedURLs"];
    }
    id v13 = [(MCWebContentFilterPayload *)self allowListBookmarks];

    if (v13)
    {
      v28 = v8;
      v29 = v6;
      v14 = (void *)MEMORY[0x1E4F1CA48];
      v15 = [(MCWebContentFilterPayload *)self allowListBookmarks];
      v16 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v17 = [(MCWebContentFilterPayload *)self allowListBookmarks];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = [*(id *)(*((void *)&v30 + 1) + 8 * i) objectForKeyedSubscript:@"address"];
            [v16 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v19);
      }

      uint64_t v36 = @"values";
      v37 = v16;
      objc_super v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v7 setObject:v23 forKeyedSubscript:@"webContentFilterWhitelistedURLs"];

      id v8 = v28;
      uint64_t v6 = v29;
    }
    v24 = [(MCWebContentFilterPayload *)self denyListURLStrings];

    if (v24)
    {
      uint64_t v34 = @"values";
      v25 = [(MCWebContentFilterPayload *)self denyListURLStrings];
      v35 = v25;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [v8 setObject:v26 forKeyedSubscript:@"webContentFilterBlacklistedURLs"];
    }
  }
  return v5;
}

- (id)verboseDescription
{
  v18.receiver = self;
  v18.super_class = (Class)MCWebContentFilterPayload;
  uint64_t v3 = [(MCPayload *)&v18 verboseDescription];
  char v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCWebContentFilterPayload *)self filterType];
  [v4 appendFormat:@"Type : %@\n", v5];

  uint64_t v6 = [(MCWebContentFilterPayload *)self filterType];
  char v7 = [v6 isEqualToString:@"Plugin"];

  if ((v7 & 1) == 0)
  {
    BOOL v8 = [(MCWebContentFilterPayload *)self autoFilterEnabled];
    id v9 = @"No";
    if (v8) {
      id v9 = @"Yes";
    }
    [v4 appendFormat:@"Auto Filter    : %@\n", v9];
    int v10 = [(MCWebContentFilterPayload *)self permittedURLStrings];

    if (v10)
    {
      v11 = [(MCWebContentFilterPayload *)self permittedURLStrings];
      [v4 appendFormat:@"Permitted URLs:\n%@\n", v11];
    }
    uint64_t v12 = [(MCWebContentFilterPayload *)self allowListBookmarks];

    if (v12)
    {
      id v13 = [(MCWebContentFilterPayload *)self allowListBookmarks];
      [v4 appendFormat:@"Allowed bookmarks:\n%@\n", v13];
    }
    v14 = [(MCWebContentFilterPayload *)self denyListURLStrings];

    if (v14)
    {
      v15 = [(MCWebContentFilterPayload *)self denyListURLStrings];
      [v4 appendFormat:@"Denied URLs:\n%@\n", v15];
    }
  }
  v16 = [(MCWebContentFilterPayload *)self contentFilterUUID];
  [v4 appendFormat:@"ContentFilterUUID     : %@\n", v16];

  return v4;
}

- (id)title
{
  return MCLocalizedFormat(@"WEB_FILTER_TITLE", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Label
{
  return MCLocalizedFormat(@"WEB_FILTER_DESC_1_COLON", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Description
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(MCWebContentFilterPayload *)self autoFilterEnabled])
  {
    v11 = MCLocalizedFormat(@"WEB_FILTER_DESC_AUTOFILTER", v4, v5, v6, v7, v8, v9, v10, v45);
    [v3 addObject:v11];
  }
  uint64_t v12 = [(MCWebContentFilterPayload *)self allowListBookmarks];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v21 = MCLocalizedFormat(@"WEB_FILTER_DESC_ALLOW_LIST", v14, v15, v16, v17, v18, v19, v20, v45);
    [v3 addObject:v21];
  }
  v22 = [(MCWebContentFilterPayload *)self denyListURLStrings];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    long long v31 = MCLocalizedFormat(@"WEB_FILTER_DESC_DENY_LIST", v24, v25, v26, v27, v28, v29, v30, v45);
    [v3 addObject:v31];
  }
  long long v32 = [(MCWebContentFilterPayload *)self filterType];
  int v33 = [v32 isEqualToString:@"Plugin"];

  if (v33)
  {
    uint64_t v34 = MCLocalizedString(@"WEB_FILTER_DESC_PLUGIN");
    [v3 addObject:v34];
  }
  if ([v3 count])
  {
    v42 = MCLocalizedFormat(@"WEB_FILTER_SEPARATOR", v35, v36, v37, v38, v39, v40, v41, v45);
    v43 = [v3 componentsJoinedByString:v42];
  }
  else
  {
    v43 = MCLocalizedFormat(@"WEB_FILTER_DESC_NONE", v35, v36, v37, v38, v39, v40, v41, v45);
  }

  return v43;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [MCKeyValue alloc];
  uint64_t v6 = MCLocalizedStringForBool([(MCWebContentFilterPayload *)self autoFilterEnabled]);
  uint64_t v7 = MCLocalizedString(@"AUTO_FILTER_ENABLED");
  uint64_t v8 = [(MCKeyValue *)v5 initWithLocalizedString:v6 localizedKey:v7];
  [v4 addObject:v8];

  uint64_t v9 = [(MCWebContentFilterPayload *)self pluginBundleID];

  if (v9)
  {
    uint64_t v10 = [MCKeyValue alloc];
    v11 = [(MCWebContentFilterPayload *)self pluginBundleID];
    uint64_t v12 = MCLocalizedString(@"PLUGIN_BUNDLE_ID");
    uint64_t v13 = [(MCKeyValue *)v10 initWithLocalizedString:v11 localizedKey:v12];

    [v4 addObject:v13];
  }
  uint64_t v14 = [(MCWebContentFilterPayload *)self contentFilterUUID];

  if (v14)
  {
    uint64_t v15 = [MCKeyValue alloc];
    uint64_t v16 = [(MCWebContentFilterPayload *)self contentFilterUUID];
    uint64_t v17 = MCLocalizedString(@"WEB_FILTER_CONTENTFILTERUUID");
    uint64_t v18 = [(MCKeyValue *)v15 initWithLocalizedString:v16 localizedKey:v17];

    [v4 addObject:v18];
  }
  if ([v4 count])
  {
    uint64_t v19 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v19];
  }
  uint64_t v20 = [(MCWebContentFilterPayload *)self permittedURLStrings];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    v22 = [(MCWebContentFilterPayload *)self permittedURLStrings];
    uint64_t v23 = MCLocalizedString(@"PERMITTED_URLS");
    uint64_t v24 = +[MCKeyValueSection sectionWithLocalizedArray:v22 title:v23 footer:0];

    [v3 addObject:v24];
  }
  v44 = v3;
  uint64_t v25 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v26 = [(MCWebContentFilterPayload *)self allowListBookmarks];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        long long v32 = [v31 objectForKeyedSubscript:@"pageTitle"];
        if (!v32)
        {
          long long v32 = [v31 objectForKeyedSubscript:@"address"];
          if (!v32) {
            continue;
          }
        }
        [v25 addObject:v32];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v28);
  }

  int v33 = v44;
  if ([v25 count])
  {
    uint64_t v34 = MCLocalizedString(@"ALLOWED_BOOKMARKS");
    uint64_t v35 = +[MCKeyValueSection sectionWithLocalizedArray:v25 title:v34 footer:0];

    [v44 addObject:v35];
  }
  uint64_t v36 = [(MCWebContentFilterPayload *)self denyListURLStrings];
  uint64_t v37 = [v36 count];

  if (v37)
  {
    if ([(MCWebContentFilterPayload *)self hideDenyListURLs]) {
      uint64_t v38 = @"PROHIBITED_URLS_HIDDEN";
    }
    else {
      uint64_t v38 = @"PROHIBITED_URLS";
    }
    uint64_t v39 = MCLocalizedString(v38);
    if ([(MCWebContentFilterPayload *)self hideDenyListURLs])
    {
      uint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v40 = [(MCWebContentFilterPayload *)self denyListURLStrings];
    }
    uint64_t v41 = +[MCKeyValueSection sectionWithLocalizedArray:v40 title:v39 footer:0];
    [v44 addObject:v41];
  }
  if (![v44 count])
  {

    int v33 = 0;
  }

  return v33;
}

- (id)installationWarnings
{
  uint64_t v2 = [(MCWebContentFilterPayload *)self filterType];
  int v3 = [v2 isEqualToString:@"BuiltIn"];

  if (v3)
  {
    uint64_t v4 = MCLocalizedString(@"INSTALL_WARNING_WEB_CONTENT_FILTER_TITLE");
    uint64_t v5 = @"INSTALL_WARNING_WEB_CONTENT_FILTER";
  }
  else
  {
    uint64_t v4 = MCLocalizedString(@"INSTALL_WARNING_PLUGIN_CONTENT_FILTER_TITLE");
    uint64_t v5 = @"INSTALL_WARNING_PLUGIN_CONTENT_FILTER";
  }
  uint64_t v6 = MCLocalizedStringByDevice(v5);
  uint64_t v7 = +[MCProfileWarning warningWithLocalizedTitle:v4 localizedBody:v6 isLongForm:1];

  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];

  return v8;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
}

- (NSString)contentFilterUUID
{
  return self->_contentFilterUUID;
}

- (void)setContentFilterUUID:(id)a3
{
}

- (BOOL)hideDenyListURLs
{
  return self->_hideDenyListURLs;
}

- (void)setHideDenyListURLs:(BOOL)a3
{
  self->_hideDenyListURLs = a3;
}

- (BOOL)autoFilterEnabled
{
  return self->_autoFilterEnabled;
}

- (void)setAutoFilterEnabled:(BOOL)a3
{
  self->_autoFilterEnabled = a3;
}

- (NSArray)permittedURLStrings
{
  return self->_permittedURLStrings;
}

- (void)setPermittedURLStrings:(id)a3
{
}

- (NSArray)allowListBookmarks
{
  return self->_allowListBookmarks;
}

- (void)setAllowListBookmarks:(id)a3
{
}

- (NSArray)denyListURLStrings
{
  return self->_denyListURLStrings;
}

- (void)setDenyListURLStrings:(id)a3
{
}

- (NSDictionary)pluginConfiguration
{
  return self->_pluginConfiguration;
}

- (void)setPluginConfiguration:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)pluginBundleID
{
  return self->_pluginBundleID;
}

- (void)setPluginBundleID:(id)a3
{
}

- (BOOL)filterBrowsers
{
  return self->_filterBrowsers;
}

- (void)setFilterBrowsers:(BOOL)a3
{
  self->_filterBrowsers = a3;
}

- (BOOL)filterSockets
{
  return self->_filterSockets;
}

- (void)setFilterSockets:(BOOL)a3
{
  self->_filterSockets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginBundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pluginConfiguration, 0);
  objc_storeStrong((id *)&self->_denyListURLStrings, 0);
  objc_storeStrong((id *)&self->_allowListBookmarks, 0);
  objc_storeStrong((id *)&self->_permittedURLStrings, 0);
  objc_storeStrong((id *)&self->_contentFilterUUID, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

@end