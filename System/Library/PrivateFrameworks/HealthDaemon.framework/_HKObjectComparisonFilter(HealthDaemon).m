@interface _HKObjectComparisonFilter(HealthDaemon)
- (id)filterIgnoringPrivateMetadata;
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKObjectComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a1 keyPath];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A368]];

  if (v7)
  {
    if (a1)
    {
      uint64_t v8 = HDAssociationEntityPredicateForAssociatedObjects([a1 operatorType] == 4);
LABEL_4:
      v9 = (void *)v8;
      goto LABEL_85;
    }
    goto LABEL_113;
  }
  v10 = [a1 keyPath];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F2A378]];

  v122 = a1;
  if (!v11)
  {
    v34 = [a1 keyPath];
    int v35 = [v34 isEqualToString:*MEMORY[0x1E4F2A410]];

    if (v35)
    {
      if (!a1) {
        goto LABEL_113;
      }
      id v36 = v5;
      uint64_t v37 = [a1 operatorType];
      uint64_t v38 = [a1 value];
      v39 = (void *)v38;
      id v117 = v5;
      if (v37 != 10)
      {
        v134[0] = v38;
        uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];

        v39 = (void *)v40;
      }
      id v41 = v36;
      id v42 = v39;
      self;
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id v19 = v42;
      uint64_t v44 = [v19 countByEnumeratingWithState:&v135 objects:buf count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v136;
        while (2)
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v136 != v46) {
              objc_enumerationMutation(v19);
            }
            v48 = [*(id *)(*((void *)&v135 + 1) + 8 * i) bundleIdentifier];
            v49 = [v41 sourceManager];
            *(void *)&long long v128 = 0;
            v50 = [v49 allSourcesForBundleIdentifier:v48 error:&v128];
            id v51 = (id)v128;

            if (!v50)
            {
              _HKInitializeLogging();
              v81 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v144 = 138412546;
                *(void *)&v144[4] = v48;
                *(_WORD *)&v144[12] = 2114;
                *(void *)&v144[14] = v51;
                _os_log_error_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_ERROR, "Failed to retrieve sources for '%@': %{public}@", v144, 0x16u);
              }

              id v52 = 0;
              goto LABEL_71;
            }
            [v43 unionSet:v50];
          }
          uint64_t v45 = [v19 countByEnumeratingWithState:&v135 objects:buf count:16];
          if (v45) {
            continue;
          }
          break;
        }
      }

      id v52 = v43;
LABEL_71:

      if (v52)
      {
        [v122 operatorType];
        uint64_t v82 = HDSQLiteComparisonTypeForPredicateOperator();
        uint64_t v83 = HDDataEntityPredicateForSourceEntitySet(v82, v52);
LABEL_83:
        v9 = (void *)v83;
        id v5 = v117;
LABEL_84:

        goto LABEL_85;
      }
      goto LABEL_82;
    }
    v54 = [a1 keyPath];
    int v55 = [v54 isEqualToString:*MEMORY[0x1E4F2A418]];

    if (v55)
    {
      if (!a1) {
        goto LABEL_113;
      }
      id v56 = v5;
      uint64_t v57 = [a1 operatorType];
      uint64_t v58 = [a1 value];
      v59 = (void *)v58;
      id v117 = v5;
      if (v57 != 10)
      {
        uint64_t v133 = v58;
        uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];

        v59 = (void *)v60;
      }
      id v121 = v56;
      id v61 = v59;
      self;
      id v62 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      memset(v144, 0, sizeof(v144));
      long long v145 = 0u;
      long long v146 = 0u;
      id v19 = v61;
      uint64_t v120 = [v19 countByEnumeratingWithState:v144 objects:buf count:16];
      if (v120)
      {
        v118 = v19;
        uint64_t v119 = **(void **)&v144[16];
        while (2)
        {
          v63 = 0;
          do
          {
            if (**(void **)&v144[16] != v119) {
              objc_enumerationMutation(v19);
            }
            v64 = *(void **)(*(void *)&v144[8] + 8 * (void)v63);
            v65 = [v64 source];
            v66 = [v65 bundleIdentifier];

            v67 = [v121 sourceManager];
            id v132 = 0;
            v68 = [v67 allSourcesForBundleIdentifier:v66 error:&v132];
            id v69 = v132;

            if (!v68)
            {
              _HKInitializeLogging();
              v89 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v139 = 138412546;
                *(void *)&v139[4] = v66;
                __int16 v140 = 2114;
                id v141 = v69;
                _os_log_error_impl(&dword_1BCB7D000, v89, OS_LOG_TYPE_ERROR, "Failed to retrieve sources for '%@': %{public}@", v139, 0x16u);
              }

              id v52 = 0;
              goto LABEL_80;
            }
            v123 = v69;
            obja = v63;
            v127 = v66;
            long long v130 = 0u;
            long long v131 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            id v70 = v68;
            uint64_t v71 = [v70 countByEnumeratingWithState:&v128 objects:&v135 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v129;
              do
              {
                for (uint64_t j = 0; j != v72; ++j)
                {
                  if (*(void *)v129 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  uint64_t v75 = *(void *)(*((void *)&v128 + 1) + 8 * j);
                  v76 = [HDSourceRevision alloc];
                  v77 = [v64 version];
                  v78 = [v64 productType];
                  if (v64) {
                    [v64 operatingSystemVersion];
                  }
                  else {
                    memset(v134, 0, sizeof(v134));
                  }
                  v79 = [(HDSourceRevision *)v76 initWithSource:v75 version:v77 productType:v78 operatingSystemVersion:v134];

                  [v62 addObject:v79];
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v128 objects:&v135 count:16];
              }
              while (v72);
            }

            v63 = obja + 1;
            a1 = v122;
            id v19 = v118;
          }
          while (obja + 1 != (char *)v120);
          uint64_t v120 = [v118 countByEnumeratingWithState:v144 objects:buf count:16];
          if (v120) {
            continue;
          }
          break;
        }
      }

      id v52 = v62;
LABEL_80:

      if (v52)
      {
        [a1 operatorType];
        uint64_t v90 = HDSQLiteComparisonTypeForPredicateOperator();
        [a1 applicationSDKVersionToken];
        int v91 = dyld_version_token_at_least();
        uint64_t v83 = HDDataEntityPredicateForSourceRevisionsSet(v90, v52, v91 ^ 1);
        goto LABEL_83;
      }
LABEL_82:
      uint64_t v83 = [MEMORY[0x1E4F65D58] falsePredicate];
      goto LABEL_83;
    }
    v84 = [a1 keyPath];
    int v85 = [v84 isEqualToString:*MEMORY[0x1E4F2A450]];

    if (v85)
    {
      if (a1)
      {
        uint64_t v86 = [a1 operatorType];
        v87 = [a1 value];
        v88 = v87;
        if (v86 == 10) {
          HDDataEntityPredicateForDataUUIDs(v87);
        }
        else {
        v9 = HDDataEntityPredicateForDataUUID();
        }

        goto LABEL_85;
      }
      goto LABEL_113;
    }
    v93 = [a1 keyPath];
    if ([v93 isEqualToString:*MEMORY[0x1E4F2A478]])
    {
    }
    else
    {
      v94 = [a1 keyPath];
      int v95 = [v94 isEqualToString:*MEMORY[0x1E4F2BA60]];

      if (!v95)
      {
        v99 = [a1 keyPath];
        int v100 = [v99 isEqualToString:*MEMORY[0x1E4F2A4D8]];

        if (!v100)
        {
          v101 = [a1 keyPath];
          int v102 = [v101 isEqualToString:*MEMORY[0x1E4F2BA58]];

          if (v102)
          {
            uint64_t v8 = -[_HKObjectComparisonFilter _appleWatchSourcePredicate](a1);
          }
          else
          {
            v103 = [a1 keyPath];
            int v104 = [v103 isEqualToString:*MEMORY[0x1E4F2BA68]];

            if (v104)
            {
              uint64_t v8 = -[_HKObjectComparisonFilter _OSBuildPredicate](a1);
            }
            else
            {
              v105 = [a1 keyPath];
              int v106 = [v105 isEqualToString:*MEMORY[0x1E4F2BA70]];

              if (v106)
              {
                uint64_t v8 = -[_HKObjectComparisonFilter _contributorPredicateWithProfile:](a1, v5);
              }
              else
              {
                v107 = [a1 keyPath];
                int v108 = [v107 isEqualToString:*MEMORY[0x1E4F2BA78]];

                if (v108)
                {
                  uint64_t v8 = -[_HKObjectComparisonFilter _creationDatePredicate](a1);
                }
                else
                {
                  v109 = [a1 keyPath];
                  int v110 = [v109 isEqualToString:*MEMORY[0x1E4F2BA88]];

                  if (v110)
                  {
                    uint64_t v8 = -[_HKObjectComparisonFilter _productTypePredicate](a1);
                  }
                  else
                  {
                    v111 = [a1 keyPath];
                    int v112 = objc_msgSend(v111, "hk_hasDevicePropertyKeyPathPrefix");

                    if (v112)
                    {
                      uint64_t v8 = -[_HKObjectComparisonFilter _devicePropertyPredicateWithProfile:](a1, v5);
                    }
                    else
                    {
                      v113 = [a1 keyPath];
                      int v114 = objc_msgSend(v113, "hk_hasMetadataKeyPathPrefix");

                      if (v114)
                      {
                        -[_HKObjectComparisonFilter _metadataPredicateWithProfile:](a1, v5);
                      }
                      else
                      {
                        v115 = [MEMORY[0x1E4F28B00] currentHandler];
                        [v115 handleFailureInMethod:a2 object:a1 file:@"_HKObjectComparisonFilter+HealthDaemon.m" lineNumber:67 description:@"Unreachable code has been executed"];

                        [MEMORY[0x1E4F65D58] falsePredicate];
                      uint64_t v8 = };
                    }
                  }
                }
              }
            }
          }
          goto LABEL_4;
        }
        v96 = a1;
        v97 = v5;
        uint64_t v98 = 1;
        goto LABEL_92;
      }
    }
    v96 = a1;
    v97 = v5;
    uint64_t v98 = 0;
LABEL_92:
    uint64_t v8 = -[_HKObjectComparisonFilter _associationPredicateWithProfile:type:](v96, v97, v98);
    goto LABEL_4;
  }
  if (a1)
  {
    id v12 = v5;
    uint64_t v13 = [a1 operatorType];
    uint64_t v14 = [a1 value];
    v15 = (void *)v14;
    id v116 = v5;
    if (v13 != 10)
    {
      v134[0] = v14;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];

      v15 = (void *)v16;
    }
    *(void *)v139 = 0;
    id v126 = v12;
    id v17 = v15;
    self;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    memset(v144, 0, sizeof(v144));
    long long v145 = 0u;
    long long v146 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:v144 objects:buf count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = **(void **)&v144[16];
      obuint64_t j = v19;
      while (2)
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (**(void **)&v144[16] != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*(void *)&v144[8] + 8 * k);
          v25 = [v126 deviceManager];
          v26 = [v25 deviceEntitiesForDevice:v24 error:v139];

          if (!v26)
          {
            id v19 = obj;

            id v33 = 0;
            goto LABEL_39;
          }
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v27 = v26;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v128 objects:&v135 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v129;
            do
            {
              for (uint64_t m = 0; m != v29; ++m)
              {
                if (*(void *)v129 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * m), "persistentID"));
                [v18 addObject:v32];
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v128 objects:&v135 count:16];
            }
            while (v29);
          }
        }
        id v19 = obj;
        uint64_t v21 = [obj countByEnumeratingWithState:v144 objects:buf count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v33 = v18;
LABEL_39:

    id v52 = *(id *)v139;
    if (v33)
    {
      [v122 operatorType];
      uint64_t v53 = HDSQLiteComparisonTypeForPredicateOperator();
      v9 = HDDataEntityPredicateForDeviceIdentifierSet(v53, v33);
      id v5 = v116;
    }
    else
    {
      _HKInitializeLogging();
      v80 = *MEMORY[0x1E4F29F18];
      id v5 = v116;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v143 = v52;
        _os_log_error_impl(&dword_1BCB7D000, v80, OS_LOG_TYPE_ERROR, "Failed to find devices: %{public}@", buf, 0xCu);
      }
      v9 = [MEMORY[0x1E4F65D58] falsePredicate];
    }

    goto LABEL_84;
  }
LABEL_113:
  v9 = 0;
LABEL_85:

  return v9;
}

- (id)filterIgnoringPrivateMetadata
{
  v2 = [a1 keyPath];
  int v3 = objc_msgSend(v2, "hk_hasMetadataKeyPathPrefix");

  if (!v3) {
    goto LABEL_7;
  }
  v4 = -[_HKObjectComparisonFilter _metadataKeyFromMetadataKeyPath](a1);
  if (!_HKMetadataKeyIsPrivate())
  {

LABEL_7:
    id v7 = a1;
    goto LABEL_10;
  }
  if ([a1 operatorType] == 5
    && ([a1 value], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [MEMORY[0x1E4F2B868] trueFilter];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F2B868] falseFilter];
  }
  id v7 = (id)v6;

LABEL_10:

  return v7;
}

@end