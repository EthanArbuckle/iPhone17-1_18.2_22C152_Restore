@interface _WKWebExtensionWebNavigationURLFilter
- (BOOL)matchesURL:(id)a3;
- (_WKWebExtensionWebNavigationURLFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4;
@end

@implementation _WKWebExtensionWebNavigationURLFilter

- (_WKWebExtensionWebNavigationURLFilter)initWithDictionary:(id)a3 outErrorMessage:(id *)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  if ((byte_1EB358A42 & 1) == 0)
  {
    v43[0] = @"url";
    qword_1EB358A58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    byte_1EB358A42 = 1;
  }
  if ((byte_1EB358A43 & 1) == 0)
  {
    v41 = @"url";
    uint64_t v40 = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    v42 = v16;
    qword_1EB358A60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

    byte_1EB358A43 = 1;
  }
  if (WebKit::validateDictionary(v21, @"filters", (void *)qword_1EB358A58, (void *)qword_1EB358A60, a4))
  {
    if ((byte_1EB358A44 & 1) == 0)
    {
      v38[0] = @"hostContains";
      v39[0] = objc_opt_class();
      v38[1] = @"hostEquals";
      v39[1] = objc_opt_class();
      v38[2] = @"hostPrefix";
      v39[2] = objc_opt_class();
      v38[3] = @"hostSuffix";
      v39[3] = objc_opt_class();
      v38[4] = @"pathContains";
      v39[4] = objc_opt_class();
      v38[5] = @"pathEquals";
      v39[5] = objc_opt_class();
      v38[6] = @"pathPrefix";
      v39[6] = objc_opt_class();
      v38[7] = @"pathSuffix";
      v39[7] = objc_opt_class();
      v38[8] = @"queryContains";
      v39[8] = objc_opt_class();
      v38[9] = @"queryEquals";
      v39[9] = objc_opt_class();
      v38[10] = @"queryPrefix";
      v39[10] = objc_opt_class();
      v38[11] = @"querySuffix";
      v39[11] = objc_opt_class();
      v38[12] = @"urlContains";
      v39[12] = objc_opt_class();
      v38[13] = @"urlEquals";
      v39[13] = objc_opt_class();
      v38[14] = @"urlMatches";
      v39[14] = objc_opt_class();
      v38[15] = @"originAndPathMatches";
      v39[15] = objc_opt_class();
      v38[16] = @"urlPrefix";
      v39[16] = objc_opt_class();
      v38[17] = @"urlSuffix";
      v39[17] = objc_opt_class();
      v38[18] = @"schemes";
      uint64_t v37 = objc_opt_class();
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      v39[18] = v17;
      v38[19] = @"ports";
      v39[19] = objc_opt_class();
      qword_1EB358A68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:20];

      byte_1EB358A44 = 1;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v5 = [v21 objectForKeyedSubscript:@"url"];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v33;
      id obj = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (!WebKit::validateDictionary(v9, @"url", 0, (void *)qword_1EB358A68, a4)) {
            goto LABEL_26;
          }
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v26 = 0;
          v27 = &v26;
          uint64_t v28 = 0x3032000000;
          v29 = __Block_byref_object_copy_;
          v30 = __Block_byref_object_dispose_;
          id v31 = 0;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __76___WKWebExtensionWebNavigationURLFilter_initWithDictionary_outErrorMessage___block_invoke;
          v23[3] = &unk_1E58111C8;
          v25 = &v26;
          id v11 = v10;
          id v24 = v11;
          [v9 enumerateKeysAndObjectsUsingBlock:v23];
          v12 = (void *)v27[5];
          if (v12) {
            *a4 = v12;
          }
          else {
            [v19 addObject:v11];
          }

          _Block_object_dispose(&v26, 8);
          if (v12)
          {
LABEL_26:

            v13 = 0;
            goto LABEL_27;
          }
        }
        v5 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    v22.receiver = self;
    v22.super_class = (Class)_WKWebExtensionWebNavigationURLFilter;
    v13 = [(_WKWebExtensionWebNavigationURLFilter *)&v22 init];
    if (v13)
    {
      if ([v19 count]) {
        v14 = v19;
      }
      else {
        v14 = 0;
      }
      objc_storeStrong((id *)&v13->_predicateGroups, v14);
      v13 = v13;
      self = v13;
    }
    else
    {
      self = 0;
    }
LABEL_27:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)matchesURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  predicateGroups = self->_predicateGroups;
  if (predicateGroups)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = predicateGroups;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      while (1)
      {
        uint64_t v9 = 0;
LABEL_5:
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (!v12) {
          break;
        }
        uint64_t v13 = *(void *)v18;
LABEL_9:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          if (([*(id *)(*((void *)&v17 + 1) + 8 * v14) matchesURL:v4] & 1) == 0) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              goto LABEL_9;
            }
            goto LABEL_19;
          }
        }

        if (++v9 != v7) {
          goto LABEL_5;
        }
        uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
        BOOL v15 = 0;
        if (!v7) {
          goto LABEL_22;
        }
      }
LABEL_19:

      BOOL v15 = 1;
    }
    else
    {
      BOOL v15 = 0;
    }
LABEL_22:
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end