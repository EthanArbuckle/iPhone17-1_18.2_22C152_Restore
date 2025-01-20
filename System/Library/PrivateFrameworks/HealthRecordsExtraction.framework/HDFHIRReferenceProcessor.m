@interface HDFHIRReferenceProcessor
+ (BOOL)reference:(id)a3 matchesIdentifier:(id)a4;
+ (BOOL)referenceIsAbsolute:(id)a3;
+ (BOOL)referenceRequiresContaining:(id)a3;
+ (id)identifierForResource:(id)a3 containedInResource:(id)a4 error:(id *)a5;
+ (id)identifierFromAbsoluteReferenceURL:(id)a3;
+ (id)newResourceFromResource:(id)a3 containingOnlyResources:(id)a4 error:(id *)a5;
+ (id)newResourceFromResource:(id)a3 containingResource:(id)a4 reference:(id)a5 error:(id *)a6;
+ (id)referencesAtKeyPath:(id)a3 resourceDictionary:(id)a4 error:(id *)a5;
+ (id)resourceContainedInResource:(id)a3 reference:(id)a4 error:(id *)a5;
+ (id)resourceReferenceInReference:(id)a3 error:(id *)a4;
+ (id)resourcesContainedInResource:(id)a3 error:(id *)a4;
@end

@implementation HDFHIRReferenceProcessor

+ (id)newResourceFromResource:(id)a3 containingResource:(id)a4 reference:(id)a5 error:(id *)a6
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v70 = a4;
  id v12 = a5;
  if (!v11)
  {
    v61 = [MEMORY[0x263F08690] currentHandler];
    [v61 handleFailureInMethod:a2, a1, @"HDFHIRReferenceProcessor.m", 27, @"Invalid parameter not satisfying: %@", @"parent" object file lineNumber description];
  }
  if (v70)
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v62 = [MEMORY[0x263F08690] currentHandler];
    [v62 handleFailureInMethod:a2, a1, @"HDFHIRReferenceProcessor.m", 28, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v63 = [MEMORY[0x263F08690] currentHandler];
  [v63 handleFailureInMethod:a2, a1, @"HDFHIRReferenceProcessor.m", 29, @"Invalid parameter not satisfying: %@", @"reference" object file lineNumber description];

LABEL_5:
  v13 = [v11 FHIRVersion];
  uint64_t v14 = [v70 FHIRVersion];
  if (v13 == (void *)v14)
  {
  }
  else
  {
    v15 = (void *)v14;
    id v67 = a1;
    uint64_t v16 = [v70 FHIRVersion];
    if (!v16)
    {

LABEL_19:
      objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"You can only contain a resource in another resource with the same FHIR version");
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        if (a6) {
          *a6 = v30;
        }
        else {
          _HKLogDroppedError();
        }
      }

LABEL_43:
      v57 = 0;
      goto LABEL_52;
    }
    v17 = (void *)v16;
    v18 = [v11 FHIRVersion];
    [v70 FHIRVersion];
    v20 = v19 = a6;
    char v21 = [v18 isEqual:v20];

    a6 = v19;
    a1 = v67;
    if ((v21 & 1) == 0) {
      goto LABEL_19;
    }
  }
  v22 = [v70 identifier];
  char v23 = [a1 reference:v12 matchesIdentifier:v22];

  if ((v23 & 1) == 0)
  {
    v27 = NSString;
    v28 = [v70 identifier];
    v29 = [v28 resourceType];
    id v30 = [v27 stringWithFormat:@"Resource %@ cannot be contained with a reference of %@", v29, v12];

    objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a6) {
        *a6 = v31;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_43;
  }
  v24 = [v70 JSONObject];
  v25 = [v24 objectForKeyedSubscript:@"contained"];

  if (v25)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 3, @"You can not contain a resource in another resource that has contained resources itself");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      if (a6) {
        *a6 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v57 = 0;
  }
  else
  {
    v64 = a6;
    id v68 = a1;
    v65 = v11;
    id v66 = v12;
    v32 = [v11 JSONObject];
    v33 = [v32 objectForKeyedSubscript:@"contained"];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v34 = v33;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v72 objects:v78 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v73;
      unint64_t v38 = 0x263F45000uLL;
      while (2)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v73 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v40 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          v41 = *(void **)(v38 + 3088);
          id v71 = 0;
          v42 = [v41 identifierDetectedInJSONObject:v40 error:&v71];
          id v43 = v71;
          if (v42)
          {
            uint64_t v44 = [v70 identifier];
            if (v42 == (void *)v44)
            {

LABEL_47:
              id v11 = v65;
              v57 = (void *)[v65 copy];

              v58 = v34;
              id v12 = v66;
              v25 = 0;
              goto LABEL_50;
            }
            v45 = (void *)v44;
            uint64_t v46 = [v70 identifier];
            if (v46)
            {
              v47 = (void *)v46;
              [v70 identifier];
              uint64_t v48 = v36;
              unint64_t v49 = v38;
              uint64_t v50 = v37;
              v52 = id v51 = v34;
              char v69 = [v42 isEqual:v52];

              id v34 = v51;
              uint64_t v37 = v50;
              unint64_t v38 = v49;
              uint64_t v36 = v48;

              if (v69) {
                goto LABEL_47;
              }
            }
            else
            {
            }
          }
          else
          {
            _HKInitializeLogging();
            v53 = *MEMORY[0x263F09908];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v77 = v43;
              _os_log_impl(&dword_232E63000, v53, OS_LOG_TYPE_DEFAULT, "invalid resource contained, ignoring: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v72 objects:v78 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }

    v54 = (void *)[v34 mutableCopy];
    v55 = v54;
    if (v54) {
      id v56 = v54;
    }
    else {
      id v56 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    }
    v58 = v56;
    v25 = 0;
    id v11 = v65;

    v59 = [v70 JSONObject];
    [v58 addObject:v59];

    v57 = (void *)[v68 newResourceFromResource:v65 containingOnlyResources:v58 error:v64];
    id v12 = v66;
LABEL_50:
  }
LABEL_52:

  return v57;
}

+ (id)newResourceFromResource:(id)a3 containingOnlyResources:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 JSONObject];
  v10 = (void *)[v9 mutableCopy];

  if ([v7 count])
  {
    id v11 = (void *)[v7 copy];
    [v10 setObject:v11 forKeyedSubscript:@"contained"];
  }
  else
  {
    [v10 removeObjectForKey:@"contained"];
  }
  id v12 = (void *)MEMORY[0x263F45C10];
  v13 = [v8 sourceURL];
  uint64_t v14 = [v8 FHIRVersion];
  v15 = [v8 receivedDate];
  uint64_t v16 = [v8 extractionHints];

  v17 = [v12 resourceObjectWithJSONObject:v10 sourceURL:v13 FHIRVersion:v14 receivedDate:v15 extractionHints:v16 error:a5];

  return v17;
}

+ (id)resourcesContainedInResource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 JSONObject];
  int v7 = objc_msgSend(v6, "hk_hasValueForKeyPath:", @"contained");

  if (v7)
  {
    id v8 = [v5 JSONObject];
    v9 = objc_msgSend(v8, "hk_safeArrayForKeyPath:error:", @"contained", a4);
  }
  else
  {
    v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

+ (id)resourceContainedInResource:(id)a3 reference:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v26 = a4;
  v9 = [a1 resourcesContainedInResource:v8 error:a5];
  v10 = v9;
  if (v9)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      v24 = v10;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x263F45C10];
          v17 = [v8 FHIRVersion];
          v18 = [v8 receivedDate];
          v19 = [v16 resourceObjectWithJSONObject:v15 sourceURL:0 FHIRVersion:v17 receivedDate:v18 extractionHints:0 error:a5];

          if (!v19) {
            goto LABEL_15;
          }
          v20 = [v19 identifier];
          int v21 = [a1 reference:v26 matchesIdentifier:v20];

          if (v21)
          {
            id v22 = v19;
LABEL_15:

            v10 = v24;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        v19 = 0;
        v10 = v24;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      v19 = 0;
    }
LABEL_16:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)referencesAtKeyPath:(id)a3 resourceDictionary:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!objc_msgSend(v9, "hk_hasValueForKeyPath:", v8))
  {
    uint64_t v14 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_10;
  }
  id v20 = 0;
  v10 = objc_msgSend(v9, "hk_safeValueForKeyPath:class:error:", v8, objc_opt_class(), &v20);
  id v11 = v20;
  if (!v10)
  {
    uint64_t v15 = objc_msgSend(v9, "hk_safeArrayForKeyPath:error:", v8, a5);
    uint64_t v13 = v15;
    if (v15)
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = __Block_byref_object_copy__5;
      v18[4] = __Block_byref_object_dispose__5;
      id v19 = 0;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __73__HDFHIRReferenceProcessor_referencesAtKeyPath_resourceDictionary_error___block_invoke;
      v17[3] = &unk_264BD9BE0;
      v17[4] = v18;
      v17[5] = a1;
      uint64_t v14 = objc_msgSend(v15, "hk_map:", v17);
      _Block_object_dispose(v18, 8);

      goto LABEL_9;
    }
LABEL_8:
    uint64_t v14 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = [a1 resourceReferenceInReference:v10 error:a5];
  uint64_t v13 = (void *)v12;
  if (!v12) {
    goto LABEL_8;
  }
  v21[0] = v12;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
LABEL_9:

LABEL_10:
  return v14;
}

id __73__HDFHIRReferenceProcessor_referencesAtKeyPath_resourceDictionary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  v4 = [v2 resourceReferenceInReference:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

+ (id)resourceReferenceInReference:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "hk_safeStringForKeyPath:error:", @"reference", a4);
}

+ (BOOL)reference:(id)a3 matchesIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasPrefix:@"#"])
  {
    char v8 = 1;
    id v9 = [v6 substringFromIndex:1];
    id v10 = [v7 identifier];
    if (v9 == v10)
    {
LABEL_14:

      goto LABEL_15;
    }
    id v11 = [v7 identifier];
    if (v11)
    {
      uint64_t v12 = [v6 substringFromIndex:1];
      uint64_t v13 = [v7 identifier];
      char v8 = [v12 isEqualToString:v13];
    }
    else
    {
      char v8 = 0;
    }
LABEL_12:

    goto LABEL_14;
  }
  if ([a1 referenceIsAbsolute:v6])
  {
    uint64_t v14 = (void *)[objc_alloc(NSURL) initWithString:v6];
    uint64_t v15 = [a1 identifierFromAbsoluteReferenceURL:v14];
    uint64_t v16 = [v15 stringValue];

    id v6 = (id)v16;
  }
  id v9 = [v7 stringValue];
  if (v6 != v9)
  {
    id v10 = [v7 stringValue];
    if (!v10)
    {
      char v8 = 0;
      goto LABEL_14;
    }
    id v11 = [v7 stringValue];
    char v8 = [v6 isEqualToString:v11];
    goto LABEL_12;
  }
  char v8 = 1;
LABEL_15:

  return v8;
}

+ (BOOL)referenceRequiresContaining:(id)a3
{
  return [a3 hasPrefix:@"#"];
}

+ (BOOL)referenceIsAbsolute:(id)a3
{
  return [a3 containsString:@"://"];
}

+ (id)identifierForResource:(id)a3 containedInResource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  char v8 = [a4 identifier];
  id v9 = [v7 identifier];

  id v10 = [v8 identifierForContainedResourceWithIdentifier:v9 error:a5];

  return v10;
}

+ (id)identifierFromAbsoluteReferenceURL:(id)a3
{
  uint64_t v3 = [a3 pathComponents];
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = objc_alloc(MEMORY[0x263F0A360]);
    id v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(v3, "count") - 2);
    id v7 = [v3 lastObject];
    v4 = (void *)[v5 initWithResourceType:v6 identifier:v7];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end