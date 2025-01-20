@interface CKMergeableDeltaVectors
+ (BOOL)addToAttributedVector:(id)a3 fromPVersionVector:(id)a4 forSiteIdentifier:(id)a5 error:(id *)a6;
+ (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4;
+ (id)mergeableDeltaMetadataVectorsByCombiningVectors:(id)a3;
+ (id)pDistributedTimestampsFromDeltaMetadataVectors:(id)a3;
+ (id)pDistributedTimestampsWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6;
- (BOOL)_validate:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampClockVector)dependencies;
- (CKDistributedTimestampClockVector)previous;
- (CKDistributedTimestampStateVector)contents;
- (CKDistributedTimestampStateVector)removals;
- (CKMergeableDeltaVectors)initWithPreviousStateVector:(id)a3 currentStateVector:(id)a4;
- (CKMergeableDeltaVectors)initWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4;
- (unint64_t)hash;
- (unint64_t)protobufSize;
@end

@implementation CKMergeableDeltaVectors

+ (id)pDistributedTimestampsFromDeltaMetadataVectors:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_previous(v3, v4, v5, v6);
  v11 = objc_msgSend_backingVector(v7, v8, v9, v10);
  v15 = objc_msgSend_contents(v3, v12, v13, v14);
  v19 = objc_msgSend_backingVector(v15, v16, v17, v18);
  v23 = objc_msgSend_removals(v3, v20, v21, v22);
  v27 = objc_msgSend_backingVector(v23, v24, v25, v26);
  v31 = objc_msgSend_dependencies(v3, v28, v29, v30);

  v35 = objc_msgSend_backingVector(v31, v32, v33, v34);
  v37 = objc_msgSend_pDistributedTimestampsWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(CKMergeableDeltaVectors, v36, (uint64_t)v11, (uint64_t)v19, v27, v35);

  return v37;
}

+ (id)pDistributedTimestampsWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v73 = v9;
  objc_sync_enter(v73);
  id v72 = v10;
  objc_sync_enter(v72);
  id v71 = v11;
  objc_sync_enter(v71);
  id v13 = v12;
  objc_sync_enter(v13);
  uint64_t v14 = objc_opt_new();
  v69 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v15, v16, v17);
  if (v73)
  {
    uint64_t v21 = objc_msgSend_allSiteIdentifiers(v73, v18, v19, v20);
    objc_msgSend_unionSet_(v69, v22, (uint64_t)v21, v23);
  }
  if (v72)
  {
    v24 = objc_msgSend_allSiteIdentifiers(v72, v18, v19, v20);
    objc_msgSend_unionSet_(v69, v25, (uint64_t)v24, v26);
  }
  if (v13)
  {
    v27 = objc_msgSend_allSiteIdentifiers(v13, v18, v19, v20);
    objc_msgSend_unionSet_(v69, v28, (uint64_t)v27, v29);
  }
  if (v71)
  {
    uint64_t v30 = objc_msgSend_allSiteIdentifiers(v71, v18, v19, v20);
    objc_msgSend_unionSet_(v69, v31, (uint64_t)v30, v32);
  }
  objc_msgSend_allObjects(v69, v18, v19, v20);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v74, (uint64_t)v78, 16);
  if (v36)
  {
    uint64_t v37 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v75 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void *)(*((void *)&v74 + 1) + 8 * i);
        v40 = objc_msgSend_pSiteIdentifierFromSiteIdentifier_(CKDistributedSiteIdentifier, v34, v39, v35);
        objc_msgSend_addSiteIdentifiers_(v14, v41, (uint64_t)v40, v42);
        v43 = objc_opt_new();
        v45 = objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v44, (uint64_t)v73, v39);
        objc_msgSend_setPreviousVector_(v43, v46, (uint64_t)v45, v47);

        v49 = objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v48, (uint64_t)v72, v39);
        objc_msgSend_setContentsVector_(v43, v50, (uint64_t)v49, v51);

        v53 = objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v52, (uint64_t)v71, v39);
        objc_msgSend_setRemovalsVector_(v43, v54, (uint64_t)v53, v55);

        v57 = objc_msgSend_pVersionVectorFromAttributedVector_siteIdentifier_(CKDistributedTimestampAttributedVector, v56, (uint64_t)v13, v39);
        objc_msgSend_setDependenciesVector_(v43, v58, (uint64_t)v57, v59);

        if ((objc_msgSend_hasPreviousVector(v43, v60, v61, v62) & 1) != 0
          || (objc_msgSend_hasContentsVector(v43, v63, v64, v65) & 1) != 0
          || (objc_msgSend_hasRemovalsVector(v43, v63, v66, v65) & 1) != 0
          || objc_msgSend_hasDependenciesVector(v43, v63, v67, v65))
        {
          objc_msgSend_addSiteVersionVectors_(v14, v63, (uint64_t)v43, v65);
        }
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v74, (uint64_t)v78, 16);
    }
    while (v36);
  }

  objc_sync_exit(v13);
  objc_sync_exit(v71);

  objc_sync_exit(v72);
  objc_sync_exit(v73);

  return v14;
}

+ (id)deltaMetadataVectorsFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v84 = objc_opt_new();
  v83 = objc_opt_new();
  v82 = objc_opt_new();
  v7 = objc_opt_new();
  if (objc_msgSend_siteIdentifiersCount(v6, v8, v9, v10))
  {
    uint64_t v14 = 0;
    while (1)
    {
      v15 = objc_msgSend_siteVersionVectors(v6, v11, v12, v13);
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, v14, v17);

      uint64_t v22 = objc_msgSend_siteIdentifiers(v6, v19, v20, v21);
      uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v22, v23, v14, v24);
      v28 = objc_msgSend_siteIdentifierFromPSiteIdentifier_(CKDistributedSiteIdentifier, v26, (uint64_t)v25, v27);

      if (objc_msgSend_hasPreviousVector(v18, v29, v30, v31))
      {
        uint64_t v35 = objc_msgSend_backingVector(v84, v32, v33, v34);
        uint64_t v39 = objc_msgSend_previousVector(v18, v36, v37, v38);
        int v41 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v40, (uint64_t)v35, (uint64_t)v39, v28, a4);

        if (!v41) {
          break;
        }
      }
      if (objc_msgSend_hasContentsVector(v18, v32, v33, v34))
      {
        v45 = objc_msgSend_backingVector(v83, v42, v43, v44);
        v49 = objc_msgSend_contentsVector(v18, v46, v47, v48);
        int v51 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v50, (uint64_t)v45, (uint64_t)v49, v28, a4);

        if (!v51) {
          break;
        }
      }
      if (objc_msgSend_hasRemovalsVector(v18, v42, v43, v44))
      {
        uint64_t v55 = objc_msgSend_backingVector(v82, v52, v53, v54);
        uint64_t v59 = objc_msgSend_removalsVector(v18, v56, v57, v58);
        int v61 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v60, (uint64_t)v55, (uint64_t)v59, v28, a4);

        if (!v61) {
          break;
        }
      }
      if (objc_msgSend_hasDependenciesVector(v18, v52, v53, v54))
      {
        uint64_t v65 = objc_msgSend_backingVector(v7, v62, v63, v64);
        v69 = objc_msgSend_dependenciesVector(v18, v66, v67, v68);
        char v71 = objc_msgSend_addToAttributedVector_fromPVersionVector_forSiteIdentifier_error_(a1, v70, (uint64_t)v65, (uint64_t)v69, v28, a4);

        if ((v71 & 1) == 0) {
          break;
        }
      }

      if (++v14 >= (unint64_t)objc_msgSend_siteIdentifiersCount(v6, v72, v73, v74)) {
        goto LABEL_12;
      }
    }

    v80 = 0;
    long long v77 = v83;
    long long v76 = v84;
    v78 = v82;
  }
  else
  {
LABEL_12:
    long long v75 = [CKMergeableDeltaVectors alloc];
    long long v77 = v83;
    long long v76 = v84;
    v78 = v82;
    v80 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v75, v79, (uint64_t)v84, (uint64_t)v83, v82, v7);
  }

  return v80;
}

+ (BOOL)addToAttributedVector:(id)a3 fromPVersionVector:(id)a4 forSiteIdentifier:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v70 = a5;
  id obj = v9;
  objc_sync_enter(obj);
  uint64_t v14 = objc_msgSend_clockValuesCount(v10, v11, v12, v13);
  if (v14 == objc_msgSend_clockValueLengthsCount(v10, v15, v16, v17))
  {
    uint64_t v21 = objc_msgSend_stateValuesCount(v10, v18, v19, v20);
    if (v21 == objc_msgSend_stateValueLengthsCount(v10, v22, v23, v24)) {
      goto LABEL_8;
    }
    uint64_t v28 = objc_msgSend_stateValuesCount(v10, v25, v26, v27);
    uint64_t v32 = objc_msgSend_stateValueLengthsCount(v10, v29, v30, v31);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v33, @"CKErrorDomain", 12, @"State values count (%ld) not equal to state values lengths count (%ld)", v28, v32);
  }
  else
  {
    uint64_t v34 = objc_msgSend_clockValuesCount(v10, v18, v19, v20);
    uint64_t v38 = objc_msgSend_clockValueLengthsCount(v10, v35, v36, v37);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v39, @"CKErrorDomain", 12, @"Clock values count (%ld) not equal to clock value lengths count (%ld)", v34, v38);
  v40 = };
  if (v40)
  {
    BOOL v41 = 0;
    if (!a6) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v42 = 0;
  for (unint64_t i = 0; i < objc_msgSend_clockValuesCount(v10, v25, v26, v27); ++i)
  {
    unint64_t v47 = *(void *)(objc_msgSend_clockValues(v10, v44, v45, v46) + 8 * i);
    unint64_t v72 = *(void *)(objc_msgSend_clockValueLengths(v10, v48, v49, v50) + 8 * i) + v47;
    while (v42 < objc_msgSend_stateValuesCount(v10, v51, v52, v53) && v47 < v72)
    {
      uint64_t v54 = *(unsigned int *)(objc_msgSend_stateValueLengths(v10, v25, v26, v27) + 4 * v42);
      uint64_t v58 = *(unsigned int *)(objc_msgSend_stateValues(v10, v55, v56, v57) + 4 * v42);
      int v61 = objc_msgSend_clockTypeFromPClockTypeAndAtomState_(CKDistributedTimestampAttributedVector, v59, v58, v60);
      uint64_t v62 = a6;
      int v65 = objc_msgSend_atomStateFromPClockTypeAndAtomState_(CKDistributedTimestampAttributedVector, v63, v58, v64);
      uint64_t v67 = objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E4F28D60], v66, v47, v54);
      objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(obj, v68, (uint64_t)v67, __rev16(v61 | (v65 << 8)), v70);

      v47 += v54;
      ++v42;
      a6 = v62;
    }
  }
  v40 = 0;
  BOOL v41 = 1;
  if (a6) {
LABEL_16:
  }
    *a6 = v40;
LABEL_17:

  objc_sync_exit(obj);
  return v41;
}

- (unint64_t)protobufSize
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F94098]);
  id v6 = objc_msgSend_pDistributedTimestampsFromDeltaMetadataVectors_(CKMergeableDeltaVectors, v4, (uint64_t)self, v5);
  objc_msgSend_writeTo_(v6, v7, (uint64_t)v3, v8);
  uint64_t v12 = objc_msgSend_immutableData(v3, v9, v10, v11);
  unint64_t v16 = objc_msgSend_length(v12, v13, v14, v15);

  return v16;
}

- (CKMergeableDeltaVectors)initWithPreviousStateVector:(id)a3 currentStateVector:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_clockVector(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_mutableCopy(v11, v12, v13, v14);

  uint64_t v19 = objc_msgSend_mutableCopy(v6, v16, v17, v18);
  uint64_t v23 = objc_msgSend_mutableCopy(v19, v20, v21, v22);
  if ((objc_msgSend_isGreaterThanOrEqualToVector_(v19, v24, (uint64_t)v15, v25) & 1) == 0) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v26, *MEMORY[0x1E4F1C3C8], @"currentStateVector must be greater than or equal to previousStateVector");
  }
  id v27 = v19;
  objc_msgSend_minusVector_(v27, v28, (uint64_t)v15, v29);
  id v30 = v23;
  objc_msgSend_intersectVector_(v30, v31, (uint64_t)v15, v32);
  objc_msgSend_minusStateVector_(v30, v33, (uint64_t)v7, v34);

  uint64_t v35 = objc_opt_new();
  uint64_t v37 = (CKMergeableDeltaVectors *)objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(self, v36, (uint64_t)v15, (uint64_t)v27, v30, v35);

  return v37;
}

- (CKMergeableDeltaVectors)initWithPreviousVector:(id)a3 contentsVector:(id)a4 removalsVector:(id)a5 dependenciesVector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = v13;
  unint64_t v16 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (!v10 || !v11 || !v12 || !v13) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v14, *MEMORY[0x1E4F1C3C8], @"Vectors must not be nil");
  }
  v53.receiver = self;
  v53.super_class = (Class)CKMergeableDeltaVectors;
  uint64_t v20 = [(CKMergeableDeltaVectors *)&v53 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend_mutableCopy(v11, v17, v18, v19);
    contents = v20->_contents;
    v20->_contents = (CKDistributedTimestampStateVector *)v21;

    uint64_t v26 = objc_msgSend_mutableCopy(v12, v23, v24, v25);
    removals = v20->_removals;
    v20->_removals = (CKDistributedTimestampStateVector *)v26;

    uint64_t v31 = objc_msgSend_mutableCopy(v10, v28, v29, v30);
    previous = v20->_previous;
    v20->_previous = (CKDistributedTimestampClockVector *)v31;

    uint64_t v36 = objc_msgSend_mutableCopy(v15, v33, v34, v35);
    dependencies = v20->_dependencies;
    v20->_dependencies = (CKDistributedTimestampClockVector *)v36;
  }
  id v52 = 0;
  char v38 = objc_msgSend__validate_(v20, v17, (uint64_t)&v52, v19);
  id v39 = v52;
  uint64_t v43 = v39;
  if ((v38 & 1) == 0)
  {
    uint64_t v44 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v45 = *v16;
    uint64_t v46 = objc_msgSend_userInfo(v39, v40, v41, v42);
    uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v46, v47, *MEMORY[0x1E4F28568], v48);
    objc_msgSend_raise_format_(v44, v50, v45, @"%@", v49);
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKMergeableDeltaVectors alloc];
  uint64_t v8 = objc_msgSend_previous(self, v5, v6, v7);
  id v12 = objc_msgSend_contents(self, v9, v10, v11);
  unint64_t v16 = objc_msgSend_removals(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_dependencies(self, v17, v18, v19);
  uint64_t v22 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v4, v21, (uint64_t)v8, (uint64_t)v12, v16, v20);

  return v22;
}

+ (id)mergeableDeltaMetadataVectorsByCombiningVectors:(id)a3
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [CKMergeableDeltaVectors alloc];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v10 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v4, v9, (uint64_t)v5, (uint64_t)v6, v7, v8);

  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v11 = v3;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v137, (uint64_t)v141, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v138 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_previous(v10, v14, v15, v16, (void)v137);
        uint64_t v25 = objc_msgSend_previous(v20, v22, v23, v24);
        objc_msgSend_unionVector_(v21, v26, (uint64_t)v25, v27);

        uint64_t v31 = objc_msgSend_contents(v10, v28, v29, v30);
        uint64_t v35 = objc_msgSend_contents(v20, v32, v33, v34);
        objc_msgSend_unionStateVector_(v31, v36, (uint64_t)v35, v37);

        uint64_t v41 = objc_msgSend_removals(v10, v38, v39, v40);
        uint64_t v45 = objc_msgSend_removals(v20, v42, v43, v44);
        objc_msgSend_unionStateVector_(v41, v46, (uint64_t)v45, v47);

        int v51 = objc_msgSend_dependencies(v10, v48, v49, v50);
        uint64_t v55 = objc_msgSend_dependencies(v20, v52, v53, v54);
        objc_msgSend_unionVector_(v51, v56, (uint64_t)v55, v57);
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v137, (uint64_t)v141, 16);
    }
    while (v17);
  }

  int v61 = objc_msgSend_previous(v10, v58, v59, v60);
  int v65 = objc_msgSend_contents(v10, v62, v63, v64);
  v69 = objc_msgSend_clockVector(v65, v66, v67, v68);
  objc_msgSend_minusVector_(v61, v70, (uint64_t)v69, v71);

  long long v75 = objc_msgSend_contents(v10, v72, v73, v74);
  uint64_t v79 = objc_msgSend_copy(v75, v76, v77, v78);

  v83 = objc_msgSend_contents(v10, v80, v81, v82);
  v87 = objc_msgSend_removals(v10, v84, v85, v86);
  objc_msgSend_unionStateVector_(v83, v88, (uint64_t)v87, v89);

  v93 = objc_msgSend_contents(v10, v90, v91, v92);
  v97 = objc_msgSend_clockVector(v79, v94, v95, v96);
  objc_msgSend_intersectVector_(v93, v98, (uint64_t)v97, v99);

  v103 = objc_msgSend_removals(v10, v100, v101, v102);
  v107 = objc_msgSend_contents(v10, v104, v105, v106);
  v111 = objc_msgSend_clockVector(v107, v108, v109, v110);
  objc_msgSend_minusVector_(v103, v112, (uint64_t)v111, v113);

  v117 = objc_msgSend_dependencies(v10, v114, v115, v116);
  v121 = objc_msgSend_contents(v10, v118, v119, v120);
  v125 = objc_msgSend_clockVector(v121, v122, v123, v124);
  char hasTimestampsNotInVector = objc_msgSend_hasTimestampsNotInVector_(v117, v126, (uint64_t)v125, v127);

  if ((hasTimestampsNotInVector & 1) == 0)
  {
    v132 = objc_msgSend_dependencies(v10, v129, v130, v131);
    v133 = objc_opt_new();
    objc_msgSend_intersectVector_(v132, v134, (uint64_t)v133, v135);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKMergeableDeltaVectors *)a3;
  if (v4 == self)
  {
    char v37 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v9 = objc_msgSend_previous(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_previous(v5, v10, v11, v12);
      if (CKObjectsAreBothNilOrEqual(v9, v13))
      {
        uint64_t v17 = objc_msgSend_contents(self, v14, v15, v16);
        uint64_t v21 = objc_msgSend_contents(v5, v18, v19, v20);
        if (CKObjectsAreBothNilOrEqual(v17, v21))
        {
          uint64_t v25 = objc_msgSend_removals(self, v22, v23, v24);
          uint64_t v29 = objc_msgSend_removals(v5, v26, v27, v28);
          if (CKObjectsAreBothNilOrEqual(v25, v29))
          {
            uint64_t v39 = objc_msgSend_dependencies(self, v30, v31, v32);
            uint64_t v36 = objc_msgSend_dependencies(v5, v33, v34, v35);
            char v37 = CKObjectsAreBothNilOrEqual(v39, v36);
          }
          else
          {
            char v37 = 0;
          }
        }
        else
        {
          char v37 = 0;
        }
      }
      else
      {
        char v37 = 0;
      }
    }
    else
    {
      char v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_previous(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_contents(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_removals(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_dependencies(self, v26, v27, v28);
  unint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  return v33;
}

- (BOOL)_validate:(id *)a3
{
  uint64_t v6 = objc_msgSend_previous(self, a2, (uint64_t)a3, v3);
  int isGreaterThanOrEqualToVector = 1;
  uint64_t v10 = objc_msgSend_vectorFilteredByClockType_(v6, v8, 1, v9);

  uint64_t v14 = objc_msgSend_contents(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_vectorFilteredByClockType_(v14, v15, 1, v16);

  uint64_t v21 = objc_msgSend_mutableCopy(v10, v18, v19, v20);
  uint64_t v25 = objc_msgSend_clockVector(v17, v22, v23, v24);
  objc_msgSend_intersectVector_(v21, v26, (uint64_t)v25, v27);

  uint64_t v31 = objc_msgSend_timestampCount(v21, v28, v29, v30);
  uint64_t v35 = objc_msgSend_previous(self, v32, v33, v34);
  char v38 = objc_msgSend_vectorFilteredByClockType_(v35, v36, 2, v37);

  uint64_t v42 = objc_msgSend_contents(self, v39, v40, v41);
  uint64_t v45 = objc_msgSend_vectorFilteredByClockType_(v42, v43, 2, v44);

  if (!v31)
  {
    if (!objc_msgSend_timestampCount(v38, v46, v47, v48) || !objc_msgSend_timestampCount(v45, v50, v51, v52))
    {
      LOBYTE(isGreaterThanOrEqualToVector) = 0;
      BOOL v49 = a3 == 0;
      goto LABEL_9;
    }
    uint64_t v56 = objc_msgSend_clockVector(v45, v53, v54, v55);
    int isGreaterThanOrEqualToVector = objc_msgSend_isGreaterThanOrEqualToVector_(v38, v57, (uint64_t)v56, v58);
  }
  BOOL v49 = a3 == 0;
  if (a3 && isGreaterThanOrEqualToVector)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v46, @"CKErrorDomain", 12, @"previousVector and contentsVector must not overlap (intesection is %@)", v21);
    BOOL v49 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  if (isGreaterThanOrEqualToVector) {
    return 0;
  }
  uint64_t v63 = objc_msgSend_contents(self, v59, v60, v61);
  int v64 = 1;
  uint64_t v67 = objc_msgSend_vectorFilteredByClockType_(v63, v65, 1, v66);

  uint64_t v71 = objc_msgSend_removals(self, v68, v69, v70);
  uint64_t v74 = objc_msgSend_vectorFilteredByClockType_(v71, v72, 1, v73);

  uint64_t v78 = objc_msgSend_mutableCopy(v67, v75, v76, v77);
  uint64_t v82 = objc_msgSend_clockVector(v74, v79, v80, v81);
  objc_msgSend_intersectVector_(v78, v83, (uint64_t)v82, v84);

  uint64_t v88 = objc_msgSend_timestampCount(v78, v85, v86, v87);
  uint64_t v92 = objc_msgSend_contents(self, v89, v90, v91);
  uint64_t v95 = objc_msgSend_vectorFilteredByClockType_(v92, v93, 2, v94);

  uint64_t v99 = objc_msgSend_removals(self, v96, v97, v98);
  uint64_t v102 = objc_msgSend_vectorFilteredByClockType_(v99, v100, 2, v101);

  if (v88) {
    goto LABEL_15;
  }
  if (objc_msgSend_timestampCount(v102, v103, v104, v105) && objc_msgSend_timestampCount(v95, v106, v107, v108))
  {
    v112 = objc_msgSend_clockVector(v95, v109, v110, v111);
    int v64 = objc_msgSend_isGreaterThanOrEqualToVector_(v102, v113, (uint64_t)v112, v114);

LABEL_15:
    if (((v49 | v64 ^ 1) & 1) == 0)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v103, @"CKErrorDomain", 12, @"contentsVector and removalsVector must not overlap (intesection is %@)", v78);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  LOBYTE(v64) = 0;
LABEL_18:

  return v64 ^ 1;
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3 usingSuperscripts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = objc_opt_new();
  objc_msgSend_appendString_(v7, v8, @"{\n", v9);
  uint64_t v13 = objc_msgSend_previous(self, v10, v11, v12);
  uint64_t v15 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v13, v14, v5, v4);
  objc_msgSend_appendFormat_(v7, v16, @"  Previous: %@\n", v17, v15);

  uint64_t v21 = objc_msgSend_contents(self, v18, v19, v20);
  uint64_t v23 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v21, v22, v5, v4);
  objc_msgSend_appendFormat_(v7, v24, @"  Contents: %@\n", v25, v23);

  uint64_t v29 = objc_msgSend_removals(self, v26, v27, v28);
  uint64_t v31 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v29, v30, v5, v4);
  objc_msgSend_appendFormat_(v7, v32, @"  Removals: %@\n", v33, v31);

  uint64_t v37 = objc_msgSend_dependencies(self, v34, v35, v36);
  uint64_t v39 = objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v37, v38, v5, v4);
  objc_msgSend_appendFormat_(v7, v40, @"  Dependencies: %@\n", v41, v39);

  objc_msgSend_appendString_(v7, v42, @"}", v43);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 0, 0);
}

- (id)debugDescription
{
  return (id)objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(self, a2, 1, 1);
}

- (CKDistributedTimestampClockVector)previous
{
  return self->_previous;
}

- (CKDistributedTimestampStateVector)contents
{
  return self->_contents;
}

- (CKDistributedTimestampStateVector)removals
{
  return self->_removals;
}

- (CKDistributedTimestampClockVector)dependencies
{
  return self->_dependencies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_removals, 0);
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_previous, 0);
}

@end