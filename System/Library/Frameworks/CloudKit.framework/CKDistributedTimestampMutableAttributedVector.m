@interface CKDistributedTimestampMutableAttributedVector
- (id)attributeToSparseVector;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_maintainInvariants;
- (void)_setBackingState:(id)a3;
- (void)_swapContentsWithVector:(id)a3;
- (void)addAllClockValuesFromVector:(id)a3;
- (void)addClockValuesInIndexSet:(id)a3 withAttribute:(unsigned __int16)a4 forSiteIdentifier:(id)a5;
- (void)clockVector_checkInvariantsAgainstClockValues:(id)a3 withSiteIdentifier:(id)a4 ofType:(unsigned __int8)a5;
- (void)clockVector_checkInvariantsAgainstVector:(id)a3;
- (void)clockVector_intersectVector:(id)a3 withExpansionState:(unsigned __int8)a4;
- (void)clockVector_maintainInvariants;
- (void)clockVector_minusVector:(id)a3 withExpansionState:(unsigned __int8)a4;
- (void)intersectAttributedVector:(id)a3;
- (void)intersectVector:(id)a3;
- (void)minusVector:(id)a3;
- (void)minusVector:(id)a3 forAttribute:(unsigned __int16)a4;
@end

@implementation CKDistributedTimestampMutableAttributedVector

- (void)_setBackingState:(id)a3
{
  v5 = objc_msgSend_CKDeepCopyWithLeafNodeCopyBlock_(a3, a2, (uint64_t)&unk_1ED7EF898, v3);
  id v11 = (id)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend___setBackingStateNoCopy_(self, v9, (uint64_t)v11, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  v4 = objc_opt_new();
  uint64_t v8 = objc_msgSend_mutableAttributeToSparseVector(v3, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (id)attributeToSparseVector
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  uint64_t v10 = objc_msgSend_CKDeepCopy(v6, v7, v8, v9);

  objc_sync_exit(v2);

  return v10;
}

- (void)_swapContentsWithVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id obj = v4;
  objc_sync_enter(obj);
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v13 = objc_msgSend_mutableAttributeToSparseVector(obj, v10, v11, v12);
  objc_msgSend__setBackingState_(v5, v14, (uint64_t)v13, v15);

  objc_msgSend__setBackingState_(obj, v16, (uint64_t)v9, v17);
  objc_sync_exit(obj);

  objc_sync_exit(v5);
}

- (void)intersectVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B186E74;
  v17[3] = &unk_1E54659F8;
  id v11 = v6;
  id v18 = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v12, (uint64_t)v17, v13);

  objc_sync_exit(v11);
  objc_msgSend__maintainInvariants(v5, v14, v15, v16);
  objc_sync_exit(v5);
}

- (void)minusVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B186FB4;
  v17[3] = &unk_1E54659F8;
  id v11 = v6;
  id v18 = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v12, (uint64_t)v17, v13);

  objc_sync_exit(v11);
  objc_msgSend__maintainInvariants(v5, v14, v15, v16);
  objc_sync_exit(v5);
}

- (void)minusVector:(id)a3 forAttribute:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v22 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v11, v4, v12);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v10, v14, (uint64_t)v13, v15);
  objc_msgSend_minusVector_(v16, v17, (uint64_t)v22, v18);

  objc_msgSend__maintainInvariants(v6, v19, v20, v21);
  objc_sync_exit(v6);
}

- (void)intersectAttributedVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_18B1871FC;
  v17[3] = &unk_1E54659F8;
  id v11 = v6;
  id v18 = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v12, (uint64_t)v17, v13);

  objc_sync_exit(v11);
  objc_msgSend__maintainInvariants(v5, v14, v15, v16);
  objc_sync_exit(v5);
}

- (void)addClockValuesInIndexSet:(id)a3 withAttribute:(unsigned __int16)a4 forSiteIdentifier:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  v14 = objc_msgSend_mutableAttributeToSparseVector(v10, v11, v12, v13);
  uint64_t v42 = MEMORY[0x1E4F143A8];
  uint64_t v43 = 3221225472;
  v44 = sub_18B187544;
  v45 = &unk_1E5465A20;
  id v15 = v8;
  id v46 = v15;
  id v16 = v9;
  id v47 = v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v17, (uint64_t)&v42, v18);

  id v22 = objc_msgSend_mutableAttributeToSparseVector(v10, v19, v20, v21, v42, v43, v44, v45);
  v25 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v23, v6, v24);
  v28 = objc_msgSend_objectForKeyedSubscript_(v22, v26, (uint64_t)v25, v27);

  if (!v28)
  {
    uint64_t v30 = objc_opt_new();
    v34 = objc_msgSend_mutableAttributeToSparseVector(v10, v31, v32, v33);
    v37 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v35, v6, v36);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v38, v30, (uint64_t)v37);

    v28 = (void *)v30;
  }
  objc_msgSend_addClockValuesInIndexSet_forSiteIdentifier_(v28, v29, (uint64_t)v15, (uint64_t)v16);
  objc_msgSend__maintainInvariants(v10, v39, v40, v41);

  objc_sync_exit(v10);
}

- (void)addAllClockValuesFromVector:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  uint64_t v10 = objc_msgSend_vectorWithoutAttributes(v6, v7, v8, v9);
  objc_msgSend_minusVector_(v5, v11, (uint64_t)v10, v12);

  id v16 = objc_msgSend_mutableAttributeToSparseVector(v6, v13, v14, v15);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B187690;
  v22[3] = &unk_1E54658E8;
  v22[4] = v5;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v16, v17, (uint64_t)v22, v18);

  objc_sync_exit(v6);
  objc_msgSend__maintainInvariants(v5, v19, v20, v21);
  objc_sync_exit(v5);
}

- (void)_maintainInvariants
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_18B187908;
  uint64_t v20 = sub_18B187918;
  id v21 = 0;
  id v6 = objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B187920;
  v15[3] = &unk_1E5463CD0;
  v15[4] = &v16;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v15, v8);

  if (v17[5])
  {
    uint64_t v12 = objc_msgSend_mutableAttributeToSparseVector(v2, v9, v10, v11);
    objc_msgSend_removeObjectsForKeys_(v12, v13, v17[5], v14);
  }
  _Block_object_dispose(&v16, 8);

  objc_sync_exit(v2);
}

- (void)clockVector_intersectVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id obj = v6;
  objc_sync_enter(obj);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v7, v8, (uint64_t)obj, v9);
  uint64_t v13 = objc_msgSend_allSiteIdentifiers(obj, v10, v11, v12);
  uint64_t v15 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v7, v14, (uint64_t)v13, v4);
  v19 = objc_msgSend_mutableCopy(v15, v16, v17, v18);

  v23 = objc_msgSend_allSiteIdentifiers(v7, v20, v21, v22);
  v25 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(obj, v24, (uint64_t)v23, v4);

  v29 = objc_msgSend_vectorWithoutAttributes(v25, v26, v27, v28);
  objc_msgSend_intersectVector_(v19, v30, (uint64_t)v29, v31);

  objc_msgSend__swapContentsWithVector_(v7, v32, (uint64_t)v19, v33);
  objc_sync_exit(obj);

  objc_msgSend_clockVector_maintainInvariants(v7, v34, v35, v36);
  objc_sync_exit(v7);
}

- (void)clockVector_minusVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  id obj = v6;
  objc_sync_enter(obj);
  objc_msgSend_clockVector_checkInvariantsAgainstVector_(v7, v8, (uint64_t)obj, v9);
  uint64_t v13 = objc_msgSend_allSiteIdentifiers(obj, v10, v11, v12);
  uint64_t v15 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(v7, v14, (uint64_t)v13, v4);
  v19 = objc_msgSend_mutableCopy(v15, v16, v17, v18);

  v23 = objc_msgSend_allSiteIdentifiers(v7, v20, v21, v22);
  v25 = objc_msgSend_clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers_withExpansionState_(obj, v24, (uint64_t)v23, v4);

  v29 = objc_msgSend_vectorWithoutAttributes(v25, v26, v27, v28);
  objc_msgSend_minusVector_(v19, v30, (uint64_t)v29, v31);

  objc_msgSend__swapContentsWithVector_(v7, v32, (uint64_t)v19, v33);
  objc_sync_exit(obj);

  objc_msgSend_clockVector_maintainInvariants(v7, v34, v35, v36);
  objc_sync_exit(v7);
}

- (void)clockVector_maintainInvariants
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend_allModifiers(v2, v3, v4, v5);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x18C12ADA0]();
        unsigned __int16 v42 = 0;
        uint64_t v15 = objc_msgSend_clockVector__winningLWWTimestampForModifier_winningAttribute_(v2, v12, v10, (uint64_t)&v42);
        if (v15)
        {
          uint64_t v16 = objc_msgSend_vectorFilteredByModifier_(v2, v13, v10, v14);
          if ((unint64_t)objc_msgSend_timestampCount(v16, v17, v18, v19) >= 2)
          {
            v23 = objc_msgSend_vectorWithoutAttributes(v16, v20, v21, v22);
            objc_msgSend_minusVector_(v2, v24, (uint64_t)v23, v25);

            v26 = (void *)MEMORY[0x1E4F28D60];
            uint64_t v30 = objc_msgSend_clockValue(v15, v27, v28, v29);
            uint64_t v33 = objc_msgSend_indexSetWithIndex_(v26, v31, v30, v32);
            uint64_t v34 = v42;
            v38 = objc_msgSend_siteIdentifierObject(v15, v35, v36, v37);
            objc_msgSend_addClockValuesInIndexSet_withAttribute_forSiteIdentifier_(v2, v39, (uint64_t)v33, v34, v38);
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v7);
  }

  objc_sync_exit(v2);
}

- (void)clockVector_checkInvariantsAgainstVector:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v4;
  objc_sync_enter(v6);
  id obj = v6;
  v55 = v5;
  v57 = objc_msgSend_allModifiers(v5, v7, v8, v9);
  v58 = objc_msgSend_allModifiers(v6, v10, v11, v12);
  v56 = objc_msgSend_mutableCopy(v57, v13, v14, v15);
  objc_msgSend_intersectSet_(v56, v16, (uint64_t)v58, v17);
  uint64_t v21 = objc_msgSend_clockVector_clockTypesForAllModifiers(v5, v18, v19, v20);
  uint64_t v25 = objc_msgSend_clockVector_clockTypesForAllModifiers(v6, v22, v23, v24);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v26 = v56;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v60, (uint64_t)v64, 16);
  if (v30)
  {
    uint64_t v31 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v61 != v31) {
          objc_enumerationMutation(v26);
        }
        uint64_t v33 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v34 = objc_msgSend_objectForKeyedSubscript_(v21, v28, v33, v29);
        uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v25, v35, v33, v36);
        uint64_t v41 = (void *)v37;
        if (v34) {
          BOOL v42 = v37 == 0;
        }
        else {
          BOOL v42 = 1;
        }
        if (!v42)
        {
          int v43 = objc_msgSend_unsignedIntValue(v34, v38, v39, v40);
          if (v43 != objc_msgSend_unsignedIntValue(v41, v44, v45, v46))
          {
            v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v47, v48, v49);
            v53 = objc_msgSend_stringWithUTF8String_(NSString, v51, (uint64_t)"-[CKDistributedTimestampMutableAttributedVector(ClockVectorSupport) clockVector_checkInvariantsAgainstVector:]", v52);
            objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v50, v54, (uint64_t)v53, @"CKDistributedTimestampVector.mm", 1919, @"It is not possible to mix and match regular and lwwPerModifier clock types for a given site identifier modifier (rdar://84695941)");
          }
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v60, (uint64_t)v64, 16);
    }
    while (v30);
  }

  objc_sync_exit(obj);
  objc_sync_exit(v55);
}

- (void)clockVector_checkInvariantsAgainstClockValues:(id)a3 withSiteIdentifier:(id)a4 ofType:(unsigned __int8)a5
{
  int v5 = a5;
  id v22 = a4;
  uint64_t v10 = objc_msgSend_modifier(v22, v7, v8, v9);
  int v13 = objc_msgSend_clockVector_clockTypeForModifier_(self, v11, (uint64_t)v10, v12);

  if (v13 != 255 && v13 != v5)
  {
    uint64_t v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v14, v15, v16);
    uint64_t v20 = objc_msgSend_stringWithUTF8String_(NSString, v18, (uint64_t)"-[CKDistributedTimestampMutableAttributedVector(ClockVectorSupport) clockVector_checkInvariantsAgainstClockValues:withSiteIdentifier:ofType:]", v19);
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v17, v21, (uint64_t)v20, @"CKDistributedTimestampVector.mm", 1935, @"It is not possible to mix and match regular and lwwPerModifier clock types for a given site identifier modifier (rdar://84695941)");
  }
}

@end