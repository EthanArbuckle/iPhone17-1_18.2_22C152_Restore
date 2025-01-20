@interface NSObject(HealthRecordUtils)
- (id)hd_handleExtensionComponent:()HealthRecordUtils error:;
- (id)hd_stringArrayValue;
- (id)hd_stringValue;
- (id)hd_valueForKeyPath:()HealthRecordUtils rootResource:error:;
@end

@implementation NSObject(HealthRecordUtils)

- (id)hd_stringValue
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (void *)[a1 copy];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = [a1 description];
    }
    else if (objc_opt_respondsToSelector())
    {
      v2 = [a1 performSelector:sel_stringValue];
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)hd_stringArrayValue
{
  v5[1] = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (void *)[a1 copy];
    v5[0] = v2;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (id)hd_valueForKeyPath:()HealthRecordUtils rootResource:error:
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  objc_opt_class();
  v81 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v69 = v9;
    v70 = [MEMORY[0x263F08690] currentHandler];
    [v70 handleFailureInMethod:a2, a1, @"NSObject+HealthRecordUtils.m", 65, @"Invalid parameter not satisfying: %@", @"[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]" object file lineNumber description];

    id v9 = v69;
  }
  v78 = a5;
  v79 = v9;
  v80 = +[HDHealthRecordsExtractionRule extractionRuleWithDefinition:v9 error:a5];
  v11 = v80;
  if (!v80)
  {
    v13 = 0;
    goto LABEL_47;
  }
  id v12 = a1;
  v13 = [v80 keyPath];
  id v109 = 0;
  v14 = +[HDHRExtractionRulesKeyPathParser componentsFrom:v13 error:&v109];
  id v77 = v109;
  v15 = (void *)[v14 mutableCopy];

  if (!v15)
  {
    _HKInitializeLogging();
    v30 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[NSObject(HealthRecordUtils) hd_valueForKeyPath:rootResource:error:]((uint64_t)v80, (uint64_t)v77, v30);
    }
    id v31 = v77;
    v32 = v31;
    if (v31)
    {
      if (v78) {
        void *v78 = v31;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_45;
  }
  if (!v12)
  {
LABEL_45:
    v13 = 0;
    goto LABEL_46;
  }
  while (1)
  {
    if (![v15 count])
    {
      v33 = +[HDHealthRecordsExtractionRuleTransformer transformValue:v12 rootResource:v81 extractionRule:v80 error:v78];

      id v12 = v33;
      v13 = v12;
      goto LABEL_46;
    }
    v16 = [v15 firstObject];
    v17 = [v16 name];
    [v15 removeObjectAtIndex:0];
    if ([v17 isEqualToString:@"@contained"])
    {
      uint64_t v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x3032000000;
      v106 = __Block_byref_object_copy__3;
      v107 = __Block_byref_object_dispose__3;
      id v108 = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v100[0] = MEMORY[0x263EF8330];
        v100[1] = 3221225472;
        v100[2] = __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke;
        v100[3] = &unk_264BD9AE8;
        v102 = &v103;
        id v101 = v81;
        v18 = objc_msgSend(v12, "hk_map:", v100);
        uint64_t v19 = [v18 count];
        if (v19 != [v12 count])
        {
          id v26 = (id)v104[5];
          v27 = v26;
          if (v26)
          {
            if (v78) {
              void *v78 = v26;
            }
            else {
              _HKLogDroppedError();
            }
          }

          v13 = 0;
          int v22 = 1;
          goto LABEL_29;
        }
      }
      else
      {
        v24 = (id *)(v104 + 5);
        id obj = (id)v104[5];
        v25 = +[HDHealthRecordsExtractionUtilities resourceReferencedBy:v12 containedIn:v81 error:&obj];
        objc_storeStrong(v24, obj);
        v18 = [v25 JSONObject];

        if (!v18)
        {
          id v12 = 0;
          if (v104[5])
          {
            int v22 = 1;
            v13 = 0;
            goto LABEL_29;
          }
          v18 = 0;
        }
      }
      int v22 = 6;
      id v12 = v18;
LABEL_29:
      _Block_object_dispose(&v103, 8);

      goto LABEL_33;
    }
    if ([v17 hasPrefix:@"@extension"])
    {
      id v98 = 0;
      uint64_t v20 = objc_msgSend(v12, "hd_handleExtensionComponent:error:", v16, &v98);
      id v21 = v98;

      if (v20)
      {
        int v22 = 6;
      }
      else
      {
        id v28 = v21;
        v29 = v28;
        if (v28)
        {
          if (v78) {
            void *v78 = v28;
          }
          else {
            _HKLogDroppedError();
          }
        }

        v13 = 0;
        int v22 = 1;
      }

      id v12 = (id)v20;
LABEL_33:

      if (v22 != 6) {
        goto LABEL_46;
      }
      goto LABEL_34;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v23 = [v12 valueForKey:v17];

    id v12 = (id)v23;
LABEL_34:
    if (!v12) {
      goto LABEL_45;
    }
  }
  v35 = objc_msgSend(v15, "hk_map:", &__block_literal_global_4);
  v72 = [v35 componentsJoinedByString:@"."];

  v76 = [v80 definitionBySubstitutingKeyPathWith:v72];
  id v36 = v12;
  if ([v17 isEqualToString:@"@all"])
  {
    id v37 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v94 objects:v112 count:16];
    id v75 = v37;
    v40 = v38;
    if (v39)
    {
      uint64_t v41 = *(void *)v95;
      v40 = v38;
      id v73 = v38;
      while (2)
      {
        uint64_t v42 = 0;
        v43 = v40;
        do
        {
          if (*(void *)v95 != v41) {
            objc_enumerationMutation(v73);
          }
          v44 = *(void **)(*((void *)&v94 + 1) + 8 * v42);
          id v93 = 0;
          v40 = objc_msgSend(v44, "hd_valueForKeyPath:rootResource:error:", v76, v81, &v93);
          id v45 = v93;

          if (v40)
          {
            [v75 addObject:v40];
          }
          else
          {
            id v46 = v45;
            if (v46)
            {
              v57 = v46;
              if (v78) {
                void *v78 = v46;
              }
              else {
                _HKLogDroppedError();
              }

              goto LABEL_95;
            }
          }

          ++v42;
          v43 = v40;
        }
        while (v39 != v42);
        id v38 = v73;
        uint64_t v39 = [v73 countByEnumeratingWithState:&v94 objects:v112 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    id v47 = v75;
    id v48 = v75;
    goto LABEL_62;
  }
  if (![v17 isEqualToString:@"@any"])
  {
    if (![v17 isEqualToString:@"@concat"])
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", v78, 3, @"keypath %@ at key «%@» needs to handle array", v79, v17);
      v13 = 0;
      v40 = v36;
      goto LABEL_107;
    }
    id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v59 = v36;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v83 objects:v110 count:16];
    id v75 = v58;
    v40 = v59;
    if (v60)
    {
      id v74 = *(id *)v84;
      v40 = v59;
      id v71 = v59;
      do
      {
        uint64_t v61 = 0;
        v62 = v40;
        do
        {
          if (*(id *)v84 != v74) {
            objc_enumerationMutation(v71);
          }
          v63 = *(void **)(*((void *)&v83 + 1) + 8 * v61);
          id v82 = 0;
          v64 = objc_msgSend(v63, "hd_valueForKeyPath:rootResource:error:", v76, v81, &v82);
          id v65 = v82;
          v40 = objc_msgSend(v64, "hd_stringValue");

          if (v40)
          {
            [v75 addObject:v40];
          }
          else if (v65)
          {
            id v67 = v65;
            v68 = v67;
            if (v78) {
              void *v78 = v67;
            }
            else {
              _HKLogDroppedError();
            }

LABEL_95:
            v40 = 0;
            v13 = 0;
            goto LABEL_105;
          }

          ++v61;
          v62 = v40;
        }
        while (v60 != v61);
        id v59 = v71;
        uint64_t v60 = [v71 countByEnumeratingWithState:&v83 objects:v110 count:16];
      }
      while (v60);
    }

    id v47 = v75;
    if (![v75 count])
    {
      v13 = 0;
      goto LABEL_106;
    }
    id v48 = [v75 componentsJoinedByString:@"\n\n"];
LABEL_62:
    v13 = v48;
    goto LABEL_106;
  }
  long long v92 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v89 = 0u;
  id v47 = v36;
  uint64_t v49 = [v47 countByEnumeratingWithState:&v89 objects:v111 count:16];
  if (!v49)
  {
    v13 = 0;
    v40 = v47;
    goto LABEL_106;
  }
  uint64_t v50 = *(void *)v90;
  v13 = v47;
  id v75 = v47;
  while (2)
  {
    uint64_t v51 = 0;
    while (2)
    {
      uint64_t v52 = v49;
      if (*(void *)v90 != v50) {
        objc_enumerationMutation(v75);
      }
      v53 = *(void **)(*((void *)&v89 + 1) + 8 * v51);
      if ([v72 length])
      {
        uint64_t v88 = 0;
        v54 = (id *)&v88;
        objc_msgSend(v53, "hd_valueForKeyPath:rootResource:error:", v76, v81, &v88);
      }
      else
      {
        uint64_t v87 = 0;
        v54 = (id *)&v87;
        +[HDHealthRecordsExtractionRuleTransformer transformValue:v53 rootResource:v81 extractionRule:v80 error:&v87];
      v40 = };
      id v55 = *v54;

      if (v40)
      {
        id v66 = v40;
LABEL_104:

        v13 = v40;
        goto LABEL_105;
      }
      id v56 = v55;
      if (v56)
      {
        id v55 = v56;
        if (v78) {
          void *v78 = v56;
        }
        else {
          _HKLogDroppedError();
        }

        goto LABEL_104;
      }
      v13 = 0;
      ++v51;
      uint64_t v49 = v52;
      if (v52 != v51) {
        continue;
      }
      break;
    }
    uint64_t v49 = [v75 countByEnumeratingWithState:&v89 objects:v111 count:16];
    v13 = 0;
    if (v49) {
      continue;
    }
    break;
  }
  v40 = 0;
LABEL_105:
  id v47 = v75;
LABEL_106:

LABEL_107:
  id v12 = v40;
LABEL_46:

  v11 = v80;
LABEL_47:

  return v13;
}

- (id)hd_handleExtensionComponent:()HealthRecordUtils error:
{
  id v6 = a3;
  v7 = [v6 parenthesisContent];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [v6 parenthesisContent];
      id v9 = +[HDFHIRExtensionProcessor extensionsForURL:v8 inJSONDictionary:a1 error:a4];

      if (v9)
      {
        id v10 = objc_msgSend(v9, "hk_map:", &__block_literal_global_335);
      }
      else
      {
        id v10 = 0;
      }

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a4, 3, @"Extensions can only be found on dictionary instances, not on %@", objc_opt_class());
  }
  else
  {
    v11 = (void *)MEMORY[0x263F087E8];
    id v12 = [v6 name];
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, @"A valid extraction rules component has content between parenthesis, this one doesn't: %@", v12);
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

- (void)hd_valueForKeyPath:()HealthRecordUtils rootResource:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_232E63000, log, OS_LOG_TYPE_ERROR, "Failed to parse key path of extraction rule %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end