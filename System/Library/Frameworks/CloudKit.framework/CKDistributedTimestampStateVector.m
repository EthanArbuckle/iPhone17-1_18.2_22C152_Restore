@interface CKDistributedTimestampStateVector
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setBackingState:(id)a3;
- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4;
- (void)addClockValuesInIndexSet:(id)a3 withAtomState:(unsigned __int8)a4 forSiteIdentifier:(id)a5;
- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 atomState:(unsigned __int8)a5 forSiteIdentifier:(id)a6;
- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5;
- (void)intersectStateVector:(id)a3;
- (void)intersectVector:(id)a3;
- (void)minusStateVector:(id)a3;
- (void)minusVector:(id)a3;
- (void)unionStateVector:(id)a3;
@end

@implementation CKDistributedTimestampStateVector

- (void)_setBackingState:(id)a3
{
  id v7 = (id)objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, v3);
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v8 = objc_msgSend_backingVector(self, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  return v4;
}

- (void)intersectVector:(id)a3
{
  id v17 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  v11 = objc_msgSend_backingVector(v17, v8, v9, v10);
  uint64_t v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_intersectVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);
}

- (void)minusVector:(id)a3
{
  id v17 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  v11 = objc_msgSend_backingVector(v17, v8, v9, v10);
  uint64_t v15 = objc_msgSend_vectorExpansionState(self, v12, v13, v14);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v7, v16, (uint64_t)v11, v15);
}

- (void)unionStateVector:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_backingVector(self, v5, v6, v7);
  id v105 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v105);
  objc_msgSend_backingVector(v4, v8, v9, v10);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v14 = objc_msgSend_backingVector(self, v11, v12, v13);
  v18 = objc_msgSend_backingVector(v4, v15, v16, v17);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v14, v19, (uint64_t)v18, v20);

  v21 = objc_opt_new();
  v107 = objc_opt_new();
  v25 = objc_msgSend_backingVector(self, v22, v23, v24);
  v29 = objc_msgSend_mutableAttributeToSparseVector(v25, v26, v27, v28);
  v33 = objc_msgSend_allKeys(v29, v30, v31, v32);
  objc_msgSend_addObjectsFromArray_(v107, v34, (uint64_t)v33, v35);

  v39 = objc_msgSend_backingVector(v4, v36, v37, v38);
  v43 = objc_msgSend_mutableAttributeToSparseVector(v39, v40, v41, v42);
  v47 = objc_msgSend_allKeys(v43, v44, v45, v46);
  objc_msgSend_addObjectsFromArray_(v107, v48, (uint64_t)v47, v49);

  v53 = objc_msgSend_allObjects(v107, v50, v51, v52);
  v57 = objc_msgSend_mutableCopy(v53, v54, v55, v56);

  objc_msgSend_sortUsingComparator_(v57, v58, (uint64_t)&unk_1ED7EFAB8, v59);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v60 = v57;
  uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v61, (uint64_t)&v108, (uint64_t)v112, 16);
  if (v65)
  {
    uint64_t v66 = *(void *)v109;
    do
    {
      uint64_t v67 = 0;
      do
      {
        if (*(void *)v109 != v66) {
          objc_enumerationMutation(v60);
        }
        v68 = *(void **)(*((void *)&v108 + 1) + 8 * v67);
        v69 = objc_msgSend_backingVector(self, v62, v63, v64, v105);
        unsigned __int16 v73 = objc_msgSend_shortValue(v68, v70, v71, v72);
        v76 = objc_msgSend_vectorFilteredByAttribute_(v69, v74, v73, v75);

        v80 = objc_msgSend_backingVector(v4, v77, v78, v79);
        unsigned __int16 v84 = objc_msgSend_shortValue(v68, v81, v82, v83);
        v87 = objc_msgSend_vectorFilteredByAttribute_(v80, v85, v84, v86);

        objc_msgSend_addAllClockValuesFromVector_(v21, v88, (uint64_t)v76, v89);
        objc_msgSend_addAllClockValuesFromVector_(v21, v90, (uint64_t)v87, v91);

        ++v67;
      }
      while (v65 != v67);
      uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v60, v62, (uint64_t)&v108, (uint64_t)v112, 16);
    }
    while (v65);
  }

  v95 = objc_msgSend_backingVector(self, v92, v93, v94);
  objc_msgSend__swapContentsWithVector_(v95, v96, (uint64_t)v21, v97);

  objc_sync_exit(obj);
  v101 = objc_msgSend_backingVector(self, v98, v99, v100);
  objc_msgSend_clockVector_maintainInvariants(v101, v102, v103, v104);

  objc_sync_exit(v105);
}

- (void)minusStateVector:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  objc_msgSend_backingVector(self, v4, v5, v6);
  id v107 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v107);
  objc_msgSend_backingVector(v110, v7, v8, v9);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  uint64_t v13 = objc_msgSend_backingVector(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_backingVector(v110, v14, v15, v16);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v13, v18, (uint64_t)v17, v19);

  uint64_t v23 = objc_msgSend_backingVector(v110, v20, v21, v22);
  uint64_t v27 = objc_msgSend_allSiteIdentifiers(self, v24, v25, v26);
  uint64_t v31 = objc_msgSend_vectorExpansionState(self, v28, v29, v30);
  v33 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v23, v32, (uint64_t)v27, v31);

  long long v111 = objc_opt_new();
  uint64_t v37 = objc_msgSend_backingVector(self, v34, v35, v36);
  uint64_t v41 = objc_msgSend_mutableAttributeToSparseVector(v37, v38, v39, v40);
  uint64_t v45 = objc_msgSend_allKeys(v41, v42, v43, v44);
  objc_msgSend_addObjectsFromArray_(v111, v46, (uint64_t)v45, v47);

  uint64_t v51 = objc_msgSend_mutableAttributeToSparseVector(v33, v48, v49, v50);
  uint64_t v55 = objc_msgSend_allKeys(v51, v52, v53, v54);
  objc_msgSend_addObjectsFromArray_(v111, v56, (uint64_t)v55, v57);

  v61 = objc_msgSend_allObjects(v111, v58, v59, v60);
  uint64_t v65 = objc_msgSend_mutableCopy(v61, v62, v63, v64);

  long long v109 = v65;
  objc_msgSend_sortUsingComparator_(v65, v66, (uint64_t)&unk_1ED7EFAD8, v67);
  v68 = objc_opt_new();
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  uint64_t v72 = objc_msgSend_reverseObjectEnumerator(v65, v69, v70, v71);
  uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v112, (uint64_t)v116, 16);
  if (v77)
  {
    uint64_t v78 = *(void *)v113;
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v113 != v78) {
          objc_enumerationMutation(v72);
        }
        v80 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        unsigned __int16 v81 = objc_msgSend_shortValue(v80, v74, v75, v76);
        unsigned __int16 v84 = objc_msgSend_vectorFilteredByAttribute_(v33, v82, v81, v83);
        v88 = objc_msgSend_vectorWithoutAttributes(v84, v85, v86, v87);
        objc_msgSend_unionVector_(v68, v89, (uint64_t)v88, v90);

        uint64_t v94 = objc_msgSend_backingVector(self, v91, v92, v93);
        unsigned __int16 v98 = objc_msgSend_shortValue(v80, v95, v96, v97);
        objc_msgSend_minusVector_forAttribute_(v94, v99, (uint64_t)v68, v98);
      }
      uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v74, (uint64_t)&v112, (uint64_t)v116, 16);
    }
    while (v77);
  }

  objc_sync_exit(obj);
  uint64_t v103 = objc_msgSend_backingVector(self, v100, v101, v102);
  objc_msgSend_clockVector_maintainInvariants(v103, v104, v105, v106);

  objc_sync_exit(v107);
}

- (void)intersectStateVector:(id)a3
{
  id v69 = a3;
  uint64_t v7 = objc_msgSend_backingVector(self, v4, v5, v6);
  objc_sync_enter(v7);
  uint64_t v11 = objc_msgSend_backingVector(v69, v8, v9, v10);
  objc_sync_enter(v11);
  uint64_t v15 = objc_msgSend_backingVector(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_backingVector(v69, v16, v17, v18);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v15, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_backingVector(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_allSiteIdentifiers(v69, v26, v27, v28);
  uint64_t v33 = objc_msgSend_vectorExpansionState(self, v30, v31, v32);
  uint64_t v35 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v25, v34, (uint64_t)v29, v33);
  uint64_t v39 = objc_msgSend_mutableCopy(v35, v36, v37, v38);

  uint64_t v43 = objc_msgSend_backingVector(v69, v40, v41, v42);
  uint64_t v47 = objc_msgSend_allSiteIdentifiers(self, v44, v45, v46);
  uint64_t v51 = objc_msgSend_vectorExpansionState(self, v48, v49, v50);
  uint64_t v53 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v43, v52, (uint64_t)v47, v51);

  objc_msgSend_intersectAttributedVector_(v39, v54, (uint64_t)v53, v55);
  uint64_t v59 = objc_msgSend_backingVector(self, v56, v57, v58);
  objc_msgSend__swapContentsWithVector_(v59, v60, (uint64_t)v39, v61);

  objc_sync_exit(v11);
  uint64_t v65 = objc_msgSend_backingVector(self, v62, v63, v64);
  objc_msgSend_clockVector_maintainInvariants(v65, v66, v67, v68);

  objc_sync_exit(v7);
}

- (void)addClockValuesInIndexSet:(id)a3 forSiteIdentifier:(id)a4
{
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
}

- (void)addClockValuesInIndexSet:(id)a3 withAtomState:(unsigned __int8)a4 forSiteIdentifier:(id)a5
{
}

- (void)addClockValuesInIndexSet:(id)a3 withClockType:(unsigned __int8)a4 atomState:(unsigned __int8)a5 forSiteIdentifier:(id)a6
{
  int v7 = a5;
  uint64_t v8 = a4;
  id v28 = a3;
  id v10 = a6;
  uint64_t v14 = objc_msgSend_backingVector(self, v11, v12, v13);
  objc_msgSend_clockVector_checkInvariantsAgainstClockValues_withSiteIdentifier_ofType_(v14, v15, (uint64_t)v28, (uint64_t)v10, v8);

  uint64_t v19 = objc_msgSend_backingVector(self, v16, v17, v18);
  objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v19, v20, (uint64_t)v28, __rev16(v8 | (v7 << 8)), v10);

  uint64_t v24 = objc_msgSend_backingVector(self, v21, v22, v23);
  objc_msgSend_clockVector_maintainInvariants(v24, v25, v26, v27);
}

@end