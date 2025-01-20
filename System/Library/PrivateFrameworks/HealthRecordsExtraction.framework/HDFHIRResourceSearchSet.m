@interface HDFHIRResourceSearchSet
+ (id)searchSetWithFHIRJSONObject:(id)a3 serverBaseURL:(id)a4 error:(id *)a5;
- (NSArray)entries;
- (NSURL)nextPageURL;
- (NSURL)pageURL;
- (NSURL)serverBaseURL;
- (id)_initWithEntries:(id)a3 serverBaseURL:(id)a4 pageURL:(id)a5 nextPageURL:(id)a6;
@end

@implementation HDFHIRResourceSearchSet

- (id)_initWithEntries:(id)a3 serverBaseURL:(id)a4 pageURL:(id)a5 nextPageURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HDFHIRResourceSearchSet;
  v14 = [(HDFHIRResourceSearchSet *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    entries = v14->_entries;
    v14->_entries = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    serverBaseURL = v14->_serverBaseURL;
    v14->_serverBaseURL = (NSURL *)v17;

    uint64_t v19 = [v12 copy];
    pageURL = v14->_pageURL;
    v14->_pageURL = (NSURL *)v19;

    uint64_t v21 = [v13 copy];
    nextPageURL = v14->_nextPageURL;
    v14->_nextPageURL = (NSURL *)v21;
  }
  return v14;
}

+ (id)searchSetWithFHIRJSONObject:(id)a3 serverBaseURL:(id)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v64 = a4;
  v9 = [v8 detectedResourceType];
  char v10 = [v9 isEqualToString:@"Bundle"];

  if ((v10 & 1) == 0)
  {
    v31 = (void *)MEMORY[0x263F087E8];
    v32 = [v8 detectedResourceType];
    objc_msgSend(v31, "hk_assignError:code:format:", a5, 3, @"searchSetWithFHIRJSONObject needs \"Bundle\" resource, but got \"%@\"", v32);

    v33 = 0;
    goto LABEL_61;
  }
  v59 = (objc_class *)a1;
  id v11 = [v8 sourceURL];
  id v12 = [v8 JSONObject];
  uint64_t v13 = objc_msgSend(v12, "hk_safeArrayIfExistsForKeyPath:error:", @"link", 0);

  id v67 = v8;
  v68 = a5;
  v61 = (void *)v13;
  if (!v13)
  {
    v18 = 0;
    goto LABEL_23;
  }
  v14 = (void *)v13;
  uint64_t v15 = v11;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (!v16)
  {
    v18 = 0;
    goto LABEL_22;
  }
  uint64_t v17 = v16;
  v18 = 0;
  uint64_t v19 = *(void *)v81;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v81 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v80 + 1) + 8 * i);
      v22 = NSURL;
      v23 = [v21 objectForKeyedSubscript:@"url"];
      objc_super v24 = objc_msgSend(v22, "hk_safeURLWithString:", v23);

      if (v24)
      {
        v25 = [v21 valueForKeyPath:@"relation"];
        if ([v25 isEqual:@"self"])
        {
          v26 = v15;
          uint64_t v15 = v24;
          goto LABEL_14;
        }
        int v28 = [v25 isEqual:@"next"];
        v29 = v18;
        v26 = v18;
        v18 = v24;
        if (v28)
        {
LABEL_14:
          id v30 = v24;

          v29 = v18;
        }
        v18 = v29;

        goto LABEL_16;
      }
      _HKInitializeLogging();
      v27 = *MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_232E63000, v27, OS_LOG_TYPE_DEFAULT, "Ignoring \"link\" entry missing its \"url\" in Bundle", buf, 2u);
      }
LABEL_16:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:v87 count:16];
  }
  while (v17);
LABEL_22:

  a5 = v68;
  id v11 = v15;
LABEL_23:
  v34 = [MEMORY[0x263EFF980] array];
  v35 = [v8 JSONObject];
  id v79 = 0;
  v36 = objc_msgSend(v35, "hk_safeArrayForKeyPath:error:", @"entry", &v79);
  id v62 = v79;

  v60 = v36;
  if (v36)
  {
    v63 = v34;
    v58 = v11;
    v66 = [MEMORY[0x263EFF910] date];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v65 = v36;
    id obja = (id)[v65 countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (obja)
    {
      uint64_t v69 = *(void *)v76;
      while (2)
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(void *)v76 != v69) {
            objc_enumerationMutation(v65);
          }
          v38 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
          objc_opt_class();
          v33 = HKSafeObject();

          if (!v33)
          {

            id v11 = v58;
            v34 = v63;
            goto LABEL_60;
          }
          v39 = objc_msgSend(v38, "hk_safeStringIfExistsForKeyPath:error:", @"fullURL", 0);
          if (v39)
          {
            v40 = [NSURL URLWithString:v39];
          }
          else
          {
            v40 = 0;
          }
          id v74 = 0;
          v41 = objc_msgSend(v38, "hk_safeDictionaryForKeyPath:error:", @"resource", &v74);
          id v42 = v74;
          if (v41)
          {
            v43 = (void *)MEMORY[0x263F45C10];
            v44 = [v8 FHIRVersion];
            if (v40)
            {
              id v73 = v42;
              v45 = &v73;
              [v43 resourceObjectWithJSONObject:v41 sourceURL:v40 FHIRVersion:v44 receivedDate:v66 extractionHints:0 error:&v73];
            }
            else
            {
              id v72 = v42;
              v45 = &v72;
              [v43 resourceObjectWithJSONObject:v41 serverBaseURL:v64 FHIRVersion:v44 receivedDate:v66 error:&v72];
            v48 = };
            id v47 = *v45;

            if (v48)
            {
              [v63 addObject:v48];
            }
            else
            {
              _HKInitializeLogging();
              v49 = *MEMORY[0x263F09908];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v85 = v47;
                _os_log_error_impl(&dword_232E63000, v49, OS_LOG_TYPE_ERROR, "Failed to create resource object from search set entry: %@", buf, 0xCu);
              }
            }

            id v8 = v67;
          }
          else
          {
            _HKInitializeLogging();
            v46 = *MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v85 = v42;
              _os_log_impl(&dword_232E63000, v46, OS_LOG_TYPE_DEFAULT, "No resource in search set entry: %@", buf, 0xCu);
            }
            id v47 = v42;
          }
        }
        id obja = (id)[v65 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (obja) {
          continue;
        }
        break;
      }
    }

    id v11 = v58;
    v34 = v63;
LABEL_57:
    v33 = (void *)[[v59 alloc] _initWithEntries:v34 serverBaseURL:v64 pageURL:v11 nextPageURL:v18];
  }
  else
  {
    v50 = [v8 JSONObject];
    v51 = [v50 objectForKeyedSubscript:@"entry"];

    _HKInitializeLogging();
    v52 = (void *)*MEMORY[0x263F09908];
    v53 = *MEMORY[0x263F09908];
    if (!v51)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v52;
        v56 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138412290;
        id v85 = v56;
        _os_log_impl(&dword_232E63000, v55, OS_LOG_TYPE_DEFAULT, "There's no \"entry\" key on Bundle obtained from %@", buf, 0xCu);
      }
      goto LABEL_57;
    }
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      +[HDFHIRResourceSearchSet searchSetWithFHIRJSONObject:serverBaseURL:error:](v52);
    }
    id v54 = v62;
    if (v54)
    {
      if (a5) {
        *a5 = v54;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v33 = 0;
  }
LABEL_60:

LABEL_61:
  return v33;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)nextPageURL
{
  return self->_nextPageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPageURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

+ (void)searchSetWithFHIRJSONObject:(void *)a1 serverBaseURL:error:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_232E63000, v1, OS_LOG_TYPE_ERROR, "Invalid \"entry\" key on Bundle obtained from %@", (uint8_t *)&v3, 0xCu);
}

@end