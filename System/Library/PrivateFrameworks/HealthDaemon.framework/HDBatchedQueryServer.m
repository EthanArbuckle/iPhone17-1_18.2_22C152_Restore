@interface HDBatchedQueryServer
- (id)_queryCursorWithQueryCursor:(void *)a3 state:;
- (id)unitTest_queryServerObjectEnumerationHandler;
- (id)unitTest_queryServerWillSendBatchHandler;
- (int64_t)batchObjectsWithEnumerator:(id)a3 error:(id *)a4 handler:(id)a5;
- (int64_t)batchObjectsWithEnumerator:(id)a3 includeDeletedObjects:(BOOL)a4 error:(id *)a5 batchHandler:(id)a6;
- (int64_t)batchObjectsWithMultitypeQueryCursor:(id)a3 includeDeletedObjects:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 batchHandler:(id)a7;
- (void)setUnitTest_queryServerObjectEnumerationHandler:(id)a3;
- (void)setUnitTest_queryServerWillSendBatchHandler:(id)a3;
@end

@implementation HDBatchedQueryServer

- (int64_t)batchObjectsWithEnumerator:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDBatchedQueryServer_batchObjectsWithEnumerator_error_handler___block_invoke;
  v12[3] = &unk_1E63090F8;
  id v13 = v8;
  id v9 = v8;
  int64_t v10 = [(HDBatchedQueryServer *)self batchObjectsWithEnumerator:a3 includeDeletedObjects:0 error:a4 batchHandler:v12];

  return v10;
}

- (int64_t)batchObjectsWithEnumerator:(id)a3 includeDeletedObjects:(BOOL)a4 error:(id *)a5 batchHandler:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  v12 = (void (*)(uint64_t))a6;
  SEL v45 = a2;
  if (self)
  {
    id v13 = [(HDQueryServer *)self client];
    v14 = [v13 sourceBundleIdentifier];

    if ([v14 hasPrefix:@"com.appleinternal.health.Lime."]) {
      int v15 = 0;
    }
    else {
      int v15 = [v14 hasPrefix:@"com.apple.Research."] ^ 1;
    }
    v16 = [(HDQueryServer *)self sampleType];
    v17 = [MEMORY[0x1E4F2AFB8] electrocardiogramType];
    if (![v16 isEqual:v17] || v15)
    {
    }
    else
    {
      v43 = a5;
      id v18 = v11;
      BOOL v19 = v8;
      v20 = [(HDQueryServer *)self client];
      v21 = [v20 configuration];
      [v21 applicationSDKVersionToken];
      int v22 = dyld_version_token_at_least();

      if ((v22 & 1) == 0)
      {
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        p_uint64_t aBlock = 3221225472;
        uint64_t v72 = (uint64_t)__68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke;
        v73 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E63090F8;
        v74 = v12;
        v12 = (void (*)(uint64_t))_Block_copy(&aBlock);
      }
      BOOL v8 = v19;
      id v11 = v18;
      a5 = v43;
    }
    id v23 = _Block_copy(v12);
  }
  else
  {
    id v23 = 0;
  }

  v24 = [(HDQueryServer *)self sampleType];
  if (v24)
  {
    v25 = [(HDQueryServer *)self readAuthorizationStatusForType:v24 error:a5];
    v26 = v25;
    if (v25)
    {
      if ([v25 canRead])
      {
        v27 = [v26 restrictedSourceEntities];
        [v11 setRestrictedSourceEntities:v27];

        if (v8)
        {
          v28 = [v26 restrictedBundleIdentifier];

          if (!v28)
          {
            v29 = [v26 deletedObjectBaselineAnchor];
            [v11 setDeletedObjectsAnchor:v29];
          }
        }
        v30 = _Block_copy(self->_unitTest_queryServerWillSendBatchHandler);
        v31 = _Block_copy(self->_unitTest_queryServerObjectEnumerationHandler);
        v80[0] = 0;
        v80[1] = v80;
        v80[2] = 0x2020000000;
        v80[3] = 0;
        if (v30)
        {
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke;
          v76[3] = &unk_1E6309120;
          id v32 = v30;
          v76[4] = self;
          id v77 = v32;
          id v78 = v23;
          v79 = v80;
          id v23 = _Block_copy(v76);
        }
        uint64_t aBlock = 0;
        p_uint64_t aBlock = (uint64_t)&aBlock;
        uint64_t v72 = 0x3032000000;
        v73 = __Block_byref_object_copy__163;
        v74 = __Block_byref_object_dispose__163;
        v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
        v34 = 0;
        id v75 = v33;
        uint64_t v64 = 0;
        v65 = &v64;
        uint64_t v66 = 0x3032000000;
        v67 = __Block_byref_object_copy__163;
        v68 = __Block_byref_object_dispose__163;
        if (v8) {
          v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
        }
        v35 = v31;
        v44 = v30;
        id v69 = v34;
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x2020000000;
        char v63 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        uint64_t v59 = 0;
        v36 = [v11 anchor];
        uint64_t v37 = [v36 longLongValue];

        uint64_t v59 = v37;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke_282;
        v46[3] = &unk_1E6309148;
        v46[4] = self;
        v49 = &aBlock;
        v50 = &v60;
        v51 = &v64;
        BOOL v55 = v8;
        SEL v54 = v45;
        id v23 = v23;
        id v47 = v23;
        v52 = &v56;
        v53 = v80;
        id v38 = v35;
        BOOL v39 = v8;
        id v40 = v38;
        id v48 = v38;
        if ([v11 enumerateIncludingDeletedObjects:v39 error:a5 handler:v46])
        {
          if ([(HDQueryServer *)self _shouldStopProcessingQuery])
          {
            int64_t v41 = 4;
          }
          else if (*((unsigned char *)v61 + 24))
          {
            int64_t v41 = 3;
          }
          else
          {
            (*((void (**)(id, void, uint64_t, uint64_t, uint64_t))v23 + 2))(v23, *(void *)(p_aBlock + 40), v65[5], v57[3], 1);
            int64_t v41 = 0;
          }
        }
        else
        {
          int64_t v41 = 1;
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);

        _Block_object_dispose(&aBlock, 8);
        _Block_object_dispose(v80, 8);
      }
      else
      {
        int64_t v41 = 2;
      }
    }
    else
    {
      int64_t v41 = 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"Missing sample type for query");
    int64_t v41 = 1;
  }

  return v41;
}

uint64_t __65__HDBatchedQueryServer_batchObjectsWithEnumerator_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerWillSendBatchHandler, 0);

  objc_storeStrong(&self->_unitTest_queryServerObjectEnumerationHandler, 0);
}

void __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v10 = *(void *)(*(void *)(a1[7] + 8) + 24);
  id v11 = *(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v8 + 16);
  id v12 = a3;
  id v13 = a2;
  v11(v8, v9, v13, a5, v10);
  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __92__HDBatchedQueryServer_batchObjectsWithEnumerator_includeDeletedObjects_error_batchHandler___block_invoke_282(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  if ([*(id *)(a1 + 32) _shouldStopProcessingQuery])
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_35;
  }
  if (![*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    if (!(v7 | v8))
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:*(void *)(a1 + 96), *(void *)(a1 + 32), @"HDBatchedQueryServer.m", 110, @"Invalid parameter not satisfying: %@", @"sample != nil || deletedObject != nil" object file lineNumber description];

LABEL_34:
      uint64_t v14 = 1;
      goto LABEL_35;
    }
    if (!v7)
    {
      uint64_t v14 = 1;
      if (!v8 || !*(unsigned char *)(a1 + 104)) {
        goto LABEL_35;
      }
    }
    uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    if ((unint64_t)([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] + v16) >= 0xC8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      BOOL v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      int v20 = *(unsigned __int8 *)(a1 + 104);
      if (*(unsigned char *)(a1 + 104)) {
        v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
      }
      else {
        v21 = 0;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v21);
      if (v20) {

      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
    if (v7)
    {
      int v22 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      unint64_t v23 = v7;
    }
    else
    {
      if (!v8 || !*(unsigned char *)(a1 + 104)) {
        goto LABEL_27;
      }
      int v22 = (id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      unint64_t v23 = v8;
    }
    [*v22 addObject:v23];
LABEL_27:
    ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    uint64_t v24 = *(void *)(*(void *)(a1 + 80) + 8);
    if (*(void *)(v24 + 24) < a4) {
      *(void *)(v24 + 24) = a4;
    }
    uint64_t v25 = *(void *)(a1 + 48);
    if (v25)
    {
      if (v7) {
        unint64_t v26 = v7;
      }
      else {
        unint64_t v26 = v8;
      }
      (*(void (**)(uint64_t, void, unint64_t, void))(v25 + 16))(v25, *(void *)(a1 + 32), v26, *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
    }
    goto LABEL_34;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(unsigned __int8 *)(a1 + 104);
  if (*(unsigned char *)(a1 + 104)) {
    int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
  }
  else {
    int v15 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v15);
  if (v14)
  {

    goto LABEL_16;
  }
LABEL_35:

  return v14;
}

void __68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(a2, "hk_map:", &__block_literal_global_199);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __68__HDBatchedQueryServer__processBatchHandlerForResearchAppECGAccess___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 metadata];
  if (v3)
  {
    v4 = [v2 metadata];
    id v5 = (id)[v4 mutableCopy];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "privateClassification"));
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2BAE8]];

  [v2 _setMetadata:v5];

  return v2;
}

- (int64_t)batchObjectsWithMultitypeQueryCursor:(id)a3 includeDeletedObjects:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 batchHandler:(id)a7
{
  BOOL v129 = a4;
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v120 = a7;
  v130 = v10;
  uint64_t v11 = [v10 queryDescriptors];
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = [v11 count];
  uint64_t v14 = v12;
  int v15 = a6;
  v128 = (void *)[v14 initWithCapacity:v13];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v136 objects:v141 count:16];
  id v127 = v16;
  v131 = a6;
  v132 = self;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v137;
    int v20 = &selRef_startFakingWithHKWorkoutActivityType_;
    uint64_t v123 = *(void *)v137;
    do
    {
      uint64_t v21 = 0;
      v121 = v20[385];
      uint64_t v125 = v18;
      do
      {
        if (*(void *)v137 != v19) {
          objc_enumerationMutation(v16);
        }
        int v22 = *(void **)(*((void *)&v136 + 1) + 8 * v21);
        unint64_t v23 = [v22 sampleType];
        uint64_t v24 = [(HDQueryServer *)self readAuthorizationStatusForType:v23 error:v15];

        if (!v24) {
          goto LABEL_49;
        }
        if (![v24 canRead]) {
          goto LABEL_27;
        }
        if (v129
          && ([v24 restrictedBundleIdentifier],
              uint64_t v25 = objc_claimAutoreleasedReturnValue(),
              v25,
              !v25))
        {
          v49 = (void *)MEMORY[0x1E4F65D00];
          +[HDDataEntity disambiguatedSQLForProperty:@"data_id"];
          v51 = v50 = v15;
          v52 = [v24 deletedObjectBaselineAnchor];
          v134 = [v49 predicateWithProperty:v51 greaterThanValue:v52];

          int v15 = v50;
          self = v132;
        }
        else
        {
          v134 = 0;
        }
        unint64_t v26 = [v22 sampleType];
        id v27 = v130;
        if (self)
        {
          id v28 = v26;
          v29 = [(HDQueryServer *)self client];
          v30 = [v29 authorizationOracle];
          v31 = [v30 additionalAuthorizationPredicateForObjectType:v28 error:v15];

          if (v31)
          {
            id v32 = [v27 followingAnchor];

            if (v32)
            {
              v33 = (void *)MEMORY[0x1E4F65D58];
              v34 = (void *)MEMORY[0x1E4F65D00];
              v35 = NSNumber;
              v36 = [v27 followingAnchor];
              uint64_t v37 = objc_msgSend(v35, "numberWithLongLong:", objc_msgSend(v36, "_rowid"));
              id v38 = [v34 predicateWithProperty:@"data_id" greaterThanValue:v37];
              uint64_t v39 = [v33 compoundPredicateWithPredicate:v31 otherPredicate:v38];

              v31 = (void *)v39;
            }
            id v40 = [v27 upToAndIncludingAnchor];

            if (!v40) {
              goto LABEL_25;
            }
            int64_t v41 = (void *)MEMORY[0x1E4F65D58];
            v42 = (void *)MEMORY[0x1E4F65D00];
            v43 = NSNumber;
            v44 = [v27 upToAndIncludingAnchor];
            objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v44, "_rowid") + 1);
            id v45 = (id)objc_claimAutoreleasedReturnValue();
            v46 = [v42 predicateWithProperty:@"data_id" lessThanValue:v45];
            uint64_t v47 = [v41 compoundPredicateWithPredicate:v31 otherPredicate:v46];

            v31 = (void *)v47;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), v121, @"Unable to determine authorization status."");
            id v48 = (id)objc_claimAutoreleasedReturnValue();
            id v45 = v48;
            if (v48)
            {
              if (v131)
              {
                id v45 = v48;
                v31 = 0;
                id *v131 = v45;
              }
              else
              {
                _HKLogDroppedError();
                v31 = 0;
              }
              v44 = v45;
            }
            else
            {
              v44 = 0;
              v31 = 0;
            }
          }
        }
        else
        {
          v31 = 0;
        }
LABEL_25:

        if (!v31)
        {

          id v16 = v127;
LABEL_49:

          int64_t v91 = 1;
          uint64_t v62 = v128;
          goto LABEL_99;
        }
        v53 = [HDQueryDescriptor alloc];
        SEL v54 = (void *)MEMORY[0x1E4F1CAD0];
        BOOL v55 = [v22 sampleType];
        uint64_t v56 = [v54 setWithObject:v55];
        v57 = [v24 restrictedSourceEntities];
        uint64_t v58 = [(HDQueryServer *)v132 sampleAuthorizationFilter];
        uint64_t v59 = [v22 _filter];
        uint64_t v60 = [(HDQueryDescriptor *)v53 initWithSampleTypes:v56 encodingOptions:0 restrictedSourceEntities:v57 authorizationFilter:v58 filter:v59 samplePredicate:v31 deletedObjectsPredicate:v134];
        [v128 addObject:v60];

        int v15 = v131;
        self = v132;

        uint64_t v18 = v125;
        id v16 = v127;
        uint64_t v19 = v123;
LABEL_27:

        ++v21;
      }
      while (v18 != v21);
      uint64_t v61 = [v16 countByEnumeratingWithState:&v136 objects:v141 count:16];
      uint64_t v18 = v61;
      int v20 = &selRef_startFakingWithHKWorkoutActivityType_;
    }
    while (v61);
  }

  uint64_t v62 = v128;
  if (![v128 count])
  {
    int64_t v91 = 2;
    goto LABEL_99;
  }
  id v63 = v128;
  id v64 = v130;
  v135 = (void (**)(id, id, id, uint64_t, void *, void))v120;
  if (!self)
  {
    int64_t v91 = 0;
    id v16 = v127;
    goto LABEL_98;
  }
  v65 = self;
  if ((uint64_t)a5 >= 50) {
    unint64_t v66 = 50;
  }
  else {
    unint64_t v66 = a5;
  }
  if ((uint64_t)a5 >= 1) {
    uint64_t v67 = v66;
  }
  else {
    uint64_t v67 = 50;
  }
  v68 = (void *)MEMORY[0x1E4F2B558];
  uint64_t v69 = [v64 sortDescriptors];
  v70 = (void *)v69;
  if (v69) {
    uint64_t v71 = v69;
  }
  else {
    uint64_t v71 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v72 = [v64 followingAnchor];
  v73 = objc_msgSend(v68, "sortedQueryAnchorWithSortDescriptors:objectID:", v71, objc_msgSend(v72, "_rowid"));

  v74 = [HDMultiTypeSortedSampleIterator alloc];
  id v75 = [v64 sortDescriptors];
  v76 = [(HDQueryServer *)v65 profile];
  v124 = v73;
  id v77 = [(HDMultiTypeSortedSampleIterator *)v74 initWithQueryDescriptors:v63 includeDeletedObjects:v129 anchor:v73 sortDescriptors:v75 bufferSize:v67 profile:v76];

  id v78 = [v64 distinctByKeyPaths];
  uint64_t v79 = [v78 count];

  if (v79)
  {
    v80 = [HDDistinctByKeyPathsIterator alloc];
    v81 = [v64 distinctByKeyPaths];
    uint64_t v82 = [(HDDistinctByKeyPathsIterator *)v80 initWithSourceIterator:v77 keyPaths:v81];

    id v77 = (HDMultiTypeSortedSampleIterator *)v82;
  }
  v83 = [v64 state];

  if (v83)
  {
    v84 = [v64 state];
    BOOL v85 = [(HDMultiTypeSortedSampleIterator *)v77 restoreIteratorStateFromData:v84 error:v131];

    if (!v85)
    {
      int64_t v91 = 1;
      id v16 = v127;
      goto LABEL_97;
    }
  }
  id v122 = v63;
  v86 = _Block_copy(v132->_unitTest_queryServerObjectEnumerationHandler);
  v126 = v64;
  v87 = [v64 followingAnchor];
  uint64_t v88 = [v87 _rowid];

  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v129) {
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v90 = 0;
  }
  id v140 = 0;
  BOOL v92 = [(HDMultiTypeSortedSampleIterator *)v77 advanceWithError:&v140];
  id v93 = v140;
  if (!v92)
  {
LABEL_74:
    uint64_t v133 = v88;
    v110 = v86;
    BOOL v111 = 0;
LABEL_75:
    id v16 = v127;
    v73 = v124;
    goto LABEL_82;
  }
  unint64_t v94 = 1;
  while (1)
  {
    BOOL v95 = [(HDQueryServer *)v132 _shouldStopProcessingQuery];
    if (v95)
    {
      uint64_t v133 = v88;
      v110 = v86;
      id v112 = 0;
      goto LABEL_81;
    }
    if ([(HDQueryServer *)v132 _shouldSuspendQuery]) {
      break;
    }
    uint64_t v96 = [v89 count];
    if ((unint64_t)([v90 count] + v96) >= 0xC8)
    {
      v97 = [(HDMultiTypeSortedSampleIterator *)v77 iteratorStateData];
      v98 = -[HDBatchedQueryServer _queryCursorWithQueryCursor:state:]((uint64_t)v132, v126, v97);

      v135[2](v135, v89, v90, v88, v98, 0);
      id v99 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

      if (v129) {
        id v100 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      else {
        id v100 = 0;
      }

      id v89 = v99;
      id v90 = v100;
      uint64_t v88 = 0;
    }
    v101 = [(HDMultiTypeSortedSampleIterator *)v77 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v103 = [(HDMultiTypeSortedSampleIterator *)v77 sample];
      v104 = v89;
    }
    else
    {
      if (!v129) {
        goto LABEL_67;
      }
      v105 = [(HDMultiTypeSortedSampleIterator *)v77 object];
      objc_opt_class();
      char v106 = objc_opt_isKindOfClass();

      if ((v106 & 1) == 0) {
        goto LABEL_67;
      }
      v103 = [(HDMultiTypeSortedSampleIterator *)v77 deletedObject];
      v104 = v90;
    }
    [v104 addObject:v103];

LABEL_67:
    if ([(HDMultiTypeSortedSampleIterator *)v77 objectID] > v88) {
      uint64_t v88 = [(HDMultiTypeSortedSampleIterator *)v77 objectID];
    }
    if (a5 - 1 < v94) {
      goto LABEL_74;
    }
    if (v86)
    {
      v107 = [(HDMultiTypeSortedSampleIterator *)v77 object];
      (*((void (**)(void *, HDBatchedQueryServer *, void *, unint64_t))v86 + 2))(v86, v132, v107, v94);
    }
    id v140 = v93;
    BOOL v108 = [(HDMultiTypeSortedSampleIterator *)v77 advanceWithError:&v140];
    id v109 = v140;

    ++v94;
    id v93 = v109;
    if (!v108)
    {
      uint64_t v133 = v88;
      v110 = v86;
      BOOL v111 = 0;
      id v93 = v109;
      goto LABEL_75;
    }
  }
  uint64_t v133 = v88;
  v110 = v86;
  id v112 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

  id v89 = v90;
  if (v129) {
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v90 = 0;
  }
LABEL_81:
  id v16 = v127;
  v73 = v124;
  BOOL v111 = !v95;

  id v89 = v112;
LABEL_82:
  char v113 = objc_msgSend(v93, "hk_isHealthKitErrorWithCode:", 900);
  char v114 = v113;
  if (!v93 || (v113 & 1) != 0)
  {
    BOOL v115 = [(HDQueryServer *)v132 _shouldStopProcessingQuery];
    if (v115) {
      int64_t v91 = 4;
    }
    else {
      int64_t v91 = 3;
    }
    if (!v111 && !v115)
    {
      if (v114)
      {
        v116 = 0;
      }
      else
      {
        v117 = [(HDMultiTypeSortedSampleIterator *)v77 iteratorStateData];
        v116 = -[HDBatchedQueryServer _queryCursorWithQueryCursor:state:]((uint64_t)v132, v126, v117);

        if (!v116) {
          goto LABEL_93;
        }
      }
      v135[2](v135, v89, v90, v133, v116, 1);

      int64_t v91 = 0;
    }
  }
  else
  {
    if (v131) {
      id *v131 = v93;
    }
    else {
      _HKLogDroppedError();
    }
LABEL_93:
    int64_t v91 = 1;
  }

  uint64_t v62 = v128;
  id v63 = v122;
  id v64 = v126;
LABEL_97:

LABEL_98:
LABEL_99:

  return v91;
}

- (id)_queryCursorWithQueryCursor:(void *)a3 state:
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__queryCursorWithQueryCursor_state_, a1, @"HDBatchedQueryServer.m", 377, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F2B438]);
  unint64_t v8 = [v5 queryDescriptors];
  uint64_t v9 = [v5 sortDescriptors];
  id v10 = [v5 followingAnchor];
  uint64_t v11 = [v5 upToAndIncludingAnchor];
  id v12 = [v5 distinctByKeyPaths];
  uint64_t v13 = (void *)[v7 initWithQueryDescriptors:v8 sortDescriptors:v9 followingAnchor:v10 upToAndIncludingAnchor:v11 distinctByKeyPaths:v12 state:v6];

  return v13;
}

- (id)unitTest_queryServerObjectEnumerationHandler
{
  return self->_unitTest_queryServerObjectEnumerationHandler;
}

- (void)setUnitTest_queryServerObjectEnumerationHandler:(id)a3
{
}

- (id)unitTest_queryServerWillSendBatchHandler
{
  return self->_unitTest_queryServerWillSendBatchHandler;
}

- (void)setUnitTest_queryServerWillSendBatchHandler:(id)a3
{
}

@end