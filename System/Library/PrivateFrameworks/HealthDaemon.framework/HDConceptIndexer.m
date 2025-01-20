@interface HDConceptIndexer
+ (BOOL)indexSamplesForProfile:(id)a3 limit:(unint64_t)a4 outIndexedSamplesCount:(int64_t *)a5 error:(id *)a6;
+ (BOOL)resetIndexManagerStateForProfile:(id)a3 withError:(id *)a4;
+ (BOOL)storeState:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (HDConceptIndexState)_stateWithKeyValueDomain:(uint64_t)a1 transaction:(void *)a2 error:(void *)a3;
+ (HDKeyValueDomain)_keyValueDomainWithProfile:(uint64_t)a1;
+ (id)stateWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (uint64_t)_storeState:(uint64_t)a1 keyValueDomain:(void *)a2 transaction:(void *)a3 error:(uint64_t)a4;
- (HDConceptIndexer)init;
@end

@implementation HDConceptIndexer

- (HDConceptIndexer)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (BOOL)indexSamplesForProfile:(id)a3 limit:(unint64_t)a4 outIndexedSamplesCount:(int64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [v10 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__HDConceptIndexer_indexSamplesForProfile_limit_outIndexedSamplesCount_error___block_invoke;
  v14[3] = &unk_1E6309578;
  unint64_t v17 = a4;
  v18 = a5;
  id v15 = v10;
  id v16 = a1;
  id v12 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a6 block:v14];

  return (char)a6;
}

BOOL __78__HDConceptIndexer_indexSamplesForProfile_limit_outIndexedSamplesCount_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  uint64_t v117 = a1[6];
  v108 = (void *)a1[7];
  uint64_t v4 = (void *)a1[4];
  id v5 = a2;
  id v6 = v4;
  self;
  id v7 = v6;
  id v8 = v5;
  v9 = v7;
  uint64_t v10 = self;
  v11 = +[HDConceptIndexer _keyValueDomainWithProfile:](v10, v7);
  id v12 = +[HDConceptIndexer _stateWithKeyValueDomain:transaction:error:](v10, v11, a3);
  if (!v12)
  {

LABEL_97:
    BOOL v103 = 0;
    goto LABEL_98;
  }
  v110 = a3;
  v111 = v11;
  id v114 = v8;
  v120 = v12;
  v13 = [v12 anchor];
  v119 = v9;
  v14 = [v9 daemon];
  id v15 = [v14 behavior];
  uint64_t v16 = [v15 futureMigrationsEnabled];
  id v17 = v13;
  uint64_t v115 = v10;
  self;
  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F65D00];
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v17, "_rowid"));
    v20 = [v18 predicateWithProperty:@"data_id" greaterThanValue:v19];
  }
  else
  {
    v20 = 0;
  }
  v21 = [MEMORY[0x1E4F2B3D0] medicalRecordDescriptionsWithPredicate:0 futureMigrationsEnabled:v16];
  *(void *)&long long v168 = MEMORY[0x1E4F143A8];
  *((void *)&v168 + 1) = 3221225472;
  v169 = __76__HDConceptIndexer__queryDescriptorsFollowingAnchor_futureMigrationEnabled___block_invoke;
  v170 = &unk_1E63095A0;
  id v171 = v20;
  id v22 = v20;
  uint64_t v23 = objc_msgSend(v21, "hk_map:", &v168);

  v109 = (void *)v23;
  v24 = [[HDMultiTypeSortedSampleIterator alloc] initWithQueryDescriptors:v23 includeDeletedObjects:0 anchor:0 sortDescriptors:0 bufferSize:v117 profile:v119];
  id v113 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v139 = 0;
  BOOL v25 = [(HDMultiTypeSortedSampleIterator *)v24 advanceWithError:&v139];
  id v26 = v139;
  id v27 = v26;
  v116 = v24;
  if (v25)
  {
    v118 = 0;
    uint64_t v123 = 0;
    id v28 = v26;
    id v8 = v114;
    while (1)
    {
      if (v117 && v123 >= v117)
      {
        id v27 = v28;
        goto LABEL_79;
      }
      v122 = v28;
      v29 = [(HDMultiTypeSortedSampleIterator *)v24 sample];
      id v138 = 0;
      id v30 = v29;
      id v31 = v119;
      id v121 = v8;
      self;
      if ([v30 conformsToProtocol:&unk_1F186D738])
      {
        id v112 = v30;
        id v32 = v30;
        v33 = [v31 ontologyDatabase];
        id v34 = [v33 ontologyContentVersionWithError:&v138];

        v136 = v34;
        if (v34)
        {
          id v135 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v35 = [HDConceptResolutionConfiguration alloc];
          v36 = [v32 country];
          v37 = HKCurrentLocaleCountryCodeIfUnknown();
          v124 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v35, "initWithCountryCode:recordCategoryType:options:", v37, [v32 recordCategoryType], 0);

          long long v160 = 0u;
          long long v161 = 0u;
          long long v158 = 0u;
          long long v159 = 0u;
          obid j = [(id)objc_opt_class() indexableConceptKeyPaths];
          uint64_t v38 = [obj countByEnumeratingWithState:&v158 objects:&v168 count:16];
          id v137 = v31;
          v129 = v32;
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v159;
            char v126 = 1;
            while (2)
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v159 != v40) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v42 = *(void *)(*((void *)&v158 + 1) + 8 * i);
                id v157 = 0;
                v43 = [v32 codingsForKeyPath:v42 error:&v157];
                id v44 = v157;
                if (!v43)
                {
                  _HKInitializeLogging();
                  v57 = HKLogConceptIndex();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    v92 = HKSensitiveLogItem();
                    *(_DWORD *)buf = 138543362;
                    *(void *)&buf[4] = v92;
                    _os_log_error_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_ERROR, "Failed to index sample with error %{public}@", buf, 0xCu);
                  }
                  char v126 = 0;
                  goto LABEL_33;
                }
                v154[0] = MEMORY[0x1E4F143A8];
                v154[1] = 3221225472;
                v154[2] = __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke;
                v154[3] = &unk_1E63095C8;
                v155 = v124;
                id v156 = v31;
                v45 = objc_msgSend(v43, "hk_map:", v154);
                id v153 = 0;
                int v46 = [v32 applyConcepts:v45 forKeyPath:v42 error:&v153];
                id v47 = v153;
                v48 = v32;
                id v49 = v47;
                if (v46)
                {
                  v149[0] = MEMORY[0x1E4F143A8];
                  v149[1] = 3221225472;
                  v149[2] = __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke_381;
                  v149[3] = &unk_1E63095F0;
                  v150 = v48;
                  uint64_t v151 = v42;
                  id v152 = v136;
                  v50 = objc_msgSend(v45, "hk_map:", v149);
                  [v135 addObjectsFromArray:v50];

                  v51 = v150;
                }
                else
                {
                  _HKInitializeLogging();
                  v51 = HKLogConceptIndex();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                  {
                    v52 = [v129 UUID];
                    v131 = HKSensitiveLogItem();
                    *(_DWORD *)buf = 138543618;
                    *(void *)&buf[4] = v52;
                    __int16 v166 = 2114;
                    v167 = v131;
                    _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, "Failed to apply concepts to sample with UUID %{public}@ with error %{public}@", buf, 0x16u);
                  }
                  char v126 = 0;
                }

                if (!v46)
                {
                  id v32 = v129;
                  goto LABEL_33;
                }
                id v31 = v137;
                id v32 = v129;
              }
              uint64_t v39 = [obj countByEnumeratingWithState:&v158 objects:&v168 count:16];
              if (v39) {
                continue;
              }
              break;
            }
          }
          else
          {
            char v126 = 1;
          }
LABEL_33:

          long long v148 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          long long v145 = 0u;
          id v125 = [(id)objc_opt_class() cachedConceptRelationshipKeyPaths];
          uint64_t v128 = [v125 countByEnumeratingWithState:&v145 objects:buf count:16];
          if (v128)
          {
            uint64_t v127 = *(void *)v146;
            while (2)
            {
              for (id j = 0; j != (id)v128; id j = (char *)j + 1)
              {
                if (*(void *)v146 != v127) {
                  objc_enumerationMutation(v125);
                }
                v59 = *(void **)(*((void *)&v145 + 1) + 8 * (void)j);
                v60 = [v59 componentsSeparatedByString:@"."];
                id v61 = v32;
                long long v141 = 0u;
                long long v142 = 0u;
                long long v143 = 0u;
                long long v144 = 0u;
                id v62 = v60;
                uint64_t v63 = [v62 countByEnumeratingWithState:&v141 objects:v164 count:16];
                if (v63)
                {
                  uint64_t v64 = v63;
                  v132 = v59;
                  id obja = j;
                  v65 = v61;
                  uint64_t v66 = *(void *)v142;
                  v130 = v65;
                  while (2)
                  {
                    for (uint64_t k = 0; k != v64; ++k)
                    {
                      if (*(void *)v142 != v66) {
                        objc_enumerationMutation(v62);
                      }
                      uint64_t v68 = *(void *)(*((void *)&v141 + 1) + 8 * k);
                      v69 = (void *)MEMORY[0x1C187C0E0]();
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v70 = v65;
                        v65 = v70;
                        if (([v70 relationshipsAreLoaded] & 1) == 0)
                        {
                          v71 = [v70 identifier];
                          id v140 = 0;
                          v72 = +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:v71 profile:v137 error:&v140];
                          id v73 = v140;

                          if (!v72)
                          {
                            _HKInitializeLogging();
                            v75 = HKLogConceptIndex();
                            if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                            {
                              v80 = HKSensitiveLogItem();
                              *(_DWORD *)v162 = 138543362;
                              v163 = v80;
                              _os_log_error_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_ERROR, "error loading relationships for concept: %{public}@", v162, 0xCu);
                            }
                            char v126 = 0;
                            goto LABEL_54;
                          }
                          v65 = (void *)[v70 copyWithRelationships:v72];
                        }
                      }
                      v74 = v65;
                      v65 = [v65 valueForKey:v68];
                    }
                    uint64_t v64 = [v62 countByEnumeratingWithState:&v141 objects:v164 count:16];
                    if (v64) {
                      continue;
                    }
                    break;
                  }
                  id v70 = v65;
LABEL_54:
                  id v32 = v129;
                  id v61 = v130;
                  v59 = v132;
                  id j = obja;
                }
                else
                {
                  id v70 = v61;
                }

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  _HKInitializeLogging();
                  v81 = HKLogConceptIndex();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
                  {
                    v90 = (objc_class *)objc_opt_class();
                    v91 = NSStringFromClass(v90);
                    *(_DWORD *)v162 = 138543362;
                    v163 = v91;
                    _os_log_error_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_ERROR, "Encountered an unsupported class %{public}@ when generating concept relationship cache", v162, 0xCu);
                  }
                  id v8 = v114;
                  goto LABEL_64;
                }
                v76 = [HDConceptIndexEntry alloc];
                v77 = [v61 UUID];
                v78 = [v70 identifier];
                v79 = -[HDConceptIndexEntry initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:](v76, "initWithSampleUUID:conceptIdentifier:conceptVersion:keyPath:compoundIndex:type:ontologyVersion:", v77, [v78 rawIdentifier], objc_msgSend(v70, "version"), v59, 0, 1, v136);
                [v135 addObject:v79];
              }
              uint64_t v128 = [v125 countByEnumeratingWithState:&v145 objects:buf count:16];
              if (v128) {
                continue;
              }
              break;
            }
          }

          id v8 = v114;
          if (v126)
          {
            id v34 = v135;
            id v31 = v137;
          }
          else
          {
LABEL_64:
            _HKInitializeLogging();
            v82 = HKLogConceptIndex();
            id v31 = v137;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v89 = [v32 UUID];
              *(_DWORD *)v162 = 138412290;
              v163 = v89;
              _os_log_error_impl(&dword_1BCB7D000, v82, OS_LOG_TYPE_ERROR, "Failed to index sample with UUID %@", v162, 0xCu);
            }
            id v34 = 0;
          }
        }
        v56 = v121;

        v55 = v112;
      }
      else
      {
        v53 = (void *)MEMORY[0x1E4F28C58];
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "hk_assignError:code:format:", &v138, 3, @"Unsupported sample class (%@) when generating concept index", v32);
        v55 = v30;
        id v34 = 0;
        v56 = v121;
      }

      id v83 = v138;
      if (v34)
      {
        [v113 addObjectsFromArray:v34];
        v24 = v116;
        uint64_t v84 = objc_msgSend(MEMORY[0x1E4F2B3C8], "_anchorWithRowid:", -[HDMultiTypeSortedSampleIterator objectID](v116, "objectID"));

        v85 = v120;
        uint64_t v86 = [v120 copyWithAnchor:v84];
        v118 = (void *)v84;
        id v8 = v114;
        v120 = v86;
      }
      else
      {
        if (objc_msgSend(v83, "hk_isDatabaseAccessibilityError"))
        {

          int v99 = 0;
          id v27 = v122;
          goto LABEL_94;
        }
        _HKInitializeLogging();
        v85 = HKLogConceptIndex();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          v88 = HKSensitiveLogItem();
          LODWORD(v168) = 138543362;
          *(void *)((char *)&v168 + 4) = v88;
          _os_log_error_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_ERROR, "Failed to index sample with error %{public}@", (uint8_t *)&v168, 0xCu);

          id v8 = v114;
        }
        v24 = v116;
      }
      ++v123;

      id v139 = v122;
      BOOL v87 = [(HDMultiTypeSortedSampleIterator *)v24 advanceWithError:&v139];
      id v27 = v139;

      id v28 = v27;
      if (!v87) {
        goto LABEL_79;
      }
    }
  }
  uint64_t v123 = 0;
  v118 = 0;
  id v8 = v114;
LABEL_79:
  id v93 = v119;
  id v94 = v113;
  self;
  *(void *)buf = 0;
  BOOL v95 = +[HDConceptIndexEntity insertConceptIndexEntries:v94 profile:v93 error:buf];

  id v96 = *(id *)buf;
  v97 = v96;
  if (!v95)
  {
    _HKInitializeLogging();
    v100 = HKLogConceptIndex();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
    {
      v106 = HKSensitiveLogItem();
      LODWORD(v168) = 138543362;
      *(void *)((char *)&v168 + 4) = v106;
      _os_log_error_impl(&dword_1BCB7D000, v100, OS_LOG_TYPE_ERROR, "Failed to store concept index entries with error %{public}@", (uint8_t *)&v168, 0xCu);
    }
    id v101 = v97;
    v102 = v101;
    if (v101)
    {
      if (v110) {
        void *v110 = v101;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_93;
  }

  if (!+[HDConceptIndexer _storeState:keyValueDomain:transaction:error:](v115, v120, v111, (uint64_t)v110))
  {
LABEL_93:
    int v99 = 0;
    goto LABEL_94;
  }
  if (v108) {
    void *v108 = v123;
  }
  v98 = v116;
  if (!v27 || (objc_msgSend(v27, "hk_isHealthKitErrorWithCode:", 900) & 1) != 0)
  {
    int v99 = 1;
    goto LABEL_95;
  }
  _HKInitializeLogging();
  v105 = HKLogConceptIndex();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    v107 = HKSensitiveLogItem();
    LODWORD(v168) = 138543362;
    *(void *)((char *)&v168 + 4) = v107;
    _os_log_error_impl(&dword_1BCB7D000, v105, OS_LOG_TYPE_ERROR, "Failed to index samples with error %{public}@", (uint8_t *)&v168, 0xCu);
  }
  if (!v110)
  {
    _HKLogDroppedError();
    goto LABEL_93;
  }
  id v27 = v27;
  int v99 = 0;
  void *v110 = v27;
LABEL_94:
  v98 = v116;
LABEL_95:

  if (!v99) {
    goto LABEL_97;
  }
  BOOL v103 = +[HDAdHocConceptEntity deleteNonIndexedConceptsWithTransaction:v8 error:v110];
LABEL_98:

  return v103;
}

+ (BOOL)resetIndexManagerStateForProfile:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(HDConceptIndexResetOperation);
  LOBYTE(a4) = [(HDJournalableOperation *)v6 performOrJournalWithProfile:v5 error:a4];

  return (char)a4;
}

+ (id)stateWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = +[HDConceptIndexer _keyValueDomainWithProfile:]((uint64_t)a1, a3);
  uint64_t v10 = +[HDConceptIndexer _stateWithKeyValueDomain:transaction:error:]((uint64_t)a1, v9, a5);

  return v10;
}

+ (HDKeyValueDomain)_keyValueDomainWithProfile:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [[HDKeyValueDomain alloc] initWithCategory:0 domainName:@"com.apple.health.records" profile:v2];

  return v3;
}

+ (HDConceptIndexState)_stateWithKeyValueDomain:(uint64_t)a1 transaction:(void *)a2 error:(void *)a3
{
  id v4 = a2;
  self;
  id v11 = 0;
  id v5 = [v4 dataForKey:@"Indexer-State" error:&v11];

  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:a3];
    [v8 setClass:objc_opt_class() forClassName:@"HDConceptIndexManagerState"];
    v9 = [v8 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  }
  else if (v6)
  {
    if (a3)
    {
      v9 = 0;
      *a3 = v6;
    }
    else
    {
      _HKLogDroppedError();
      v9 = 0;
    }
  }
  else
  {
    v9 = objc_alloc_init(HDConceptIndexState);
  }

  return v9;
}

+ (BOOL)storeState:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = +[HDConceptIndexer _keyValueDomainWithProfile:]((uint64_t)a1, a4);
  LOBYTE(a6) = +[HDConceptIndexer _storeState:keyValueDomain:transaction:error:]((uint64_t)a1, v11, v12, (uint64_t)a6);

  return (char)a6;
}

+ (uint64_t)_storeState:(uint64_t)a1 keyValueDomain:(void *)a2 transaction:(void *)a3 error:(uint64_t)a4
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a4];

  if (v8) {
    uint64_t v9 = [v6 setData:v8 forKey:@"Indexer-State" error:a4];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

HDQueryDescriptor *__76__HDConceptIndexer__queryDescriptorsFollowingAnchor_futureMigrationEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [HDQueryDescriptor alloc];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v3 sampleType];
  id v7 = [v5 setWithObject:v6];
  id v8 = [v3 _filter];

  uint64_t v9 = [(HDQueryDescriptor *)v4 initWithSampleTypes:v7 encodingOptions:0 restrictedSourceEntities:0 authorizationFilter:0 filter:v8 samplePredicate:*(void *)(a1 + 32) deletedObjectsPredicate:0];

  return v9;
}

id __59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 object];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0;
  id v7 = +[HDOntologyConceptManager conceptForCodingCollection:v4 configuration:v5 profile:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F2B110], "indexableObjectWithObject:compoundIndex:", v7, objc_msgSend(v3, "compoundIndex"));
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogConceptIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = HKSensitiveLogItem();
      v13 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to resolve concept for coding collection %{public}@ with error %{public}@", buf, 0x16u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

HDConceptIndexEntry *__59__HDConceptIndexer__indexSample_profile_transaction_error___block_invoke_381(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = [HDConceptIndexEntry alloc];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 object];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v6 rawIdentifier];
  id v8 = [v3 object];
  uint64_t v9 = [v8 version];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = [v3 compoundIndex];

  id v12 = [(HDConceptIndexEntry *)v14 initWithSampleUUID:v4 conceptIdentifier:v7 conceptVersion:v9 keyPath:v10 compoundIndex:v11 type:0 ontologyVersion:*(void *)(a1 + 48)];

  return v12;
}

@end