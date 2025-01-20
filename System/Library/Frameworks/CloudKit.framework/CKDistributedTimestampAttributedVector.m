@interface CKDistributedTimestampAttributedVector
+ (BOOL)supportsSecureCoding;
+ (id)attributedVectorFromPDistributedTimestamps:(id)a3 error:(id *)a4;
+ (id)pDistributedTimestampsFromAttributedVector:(id)a3;
+ (id)pVersionVectorFromAttributedVector:(id)a3 siteIdentifier:(id)a4;
+ (int)pClockTypeAndAtomStateFromClockType:(unsigned __int8)a3 atomState:(unsigned __int8)a4;
+ (unsigned)atomStateFromPClockTypeAndAtomState:(int)a3;
+ (unsigned)clockTypeFromPClockTypeAndAtomState:(int)a3;
+ (void)initialize;
- (BOOL)clockVector_hasTimestampsNotInVector:(id)a3 withExpansionState:(unsigned __int8)a4;
- (BOOL)clockVector_includesTimestamp:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampAttributedVector)init;
- (CKDistributedTimestampAttributedVector)initWithCoder:(id)a3;
- (CKDistributedTimestampAttributedVector)vectorWithAttributeReplacementBlock:(id)a3;
- (CKDistributedTimestampAttributedVector)vectorWithoutAttributes;
- (NSDictionary)mutableAttributeToSparseVector;
- (id)allModifiers;
- (id)allSiteIdentifiers;
- (id)clockValuesForSiteIdentifier:(id)a3;
- (id)clockVector__winningLWWTimestampForModifier:(id)a3 winningAttribute:(unsigned __int16 *)a4;
- (id)clockVector_clockTypesForAllModifiers;
- (id)clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3 withExpansionState:(unsigned __int8)a4;
- (id)clockVector_vectorFilteredByAtomState:(unsigned __int8)a3;
- (id)clockVector_vectorFilteredByClockType:(unsigned __int8)a3;
- (id)copy;
- (id)description;
- (id)descriptionWithStringSiteIdentifiers;
- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)vectorFilteredByAttribute:(unsigned __int16)a3;
- (id)vectorFilteredByModifier:(id)a3;
- (id)vectorFilteredBySiteIdentifiers:(id)a3;
- (int64_t)clockVector_compareToVector:(id)a3 withExpansionState:(unsigned __int8)a4;
- (unint64_t)clockVector_timestampCountForAtomState:(unsigned __int8)a3;
- (unint64_t)hash;
- (unint64_t)timestampCount;
- (unint64_t)timestampCountForSiteIdentifier:(id)a3;
- (unsigned)attributeForTimestamp:(id)a3;
- (unsigned)clockVector_clockTypeForModifier:(id)a3;
- (void)__setBackingStateNoCopy:(id)a3;
- (void)_setBackingState:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAllClockValuesUsingBlock:(id)a3;
- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4;
@end

@implementation CKDistributedTimestampAttributedVector

+ (id)pDistributedTimestampsFromAttributedVector:(id)a3
{
  return (id)objc_msgSend_pDistributedTimestampsWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(CKMergeableDeltaVectors, a2, 0, (uint64_t)a3, 0, 0);
}

+ (id)attributedVectorFromPDistributedTimestamps:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend_deltaMetadataVectorsFromPDistributedTimestamps_error_(CKMergeableDeltaVectors, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = v4;
  if (v4)
  {
    v9 = objc_msgSend_contents(v4, v5, v6, v7);
    v13 = objc_msgSend_backingVector(v9, v10, v11, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)pVersionVectorFromAttributedVector:(id)a3 siteIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_sync_enter(v8);
  v9 = objc_opt_new();
  uint64_t v12 = objc_msgSend_clockValuesForSiteIdentifier_(v8, v10, (uint64_t)v7, v11);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_18B0C92EC;
  v26[3] = &unk_1E5462590;
  id v13 = v9;
  id v27 = v13;
  objc_msgSend_enumerateRangesUsingBlock_(v12, v14, (uint64_t)v26, v15);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_18B0C9334;
  v23[3] = &unk_1E5463DB8;
  id v25 = a1;
  id v16 = v13;
  id v24 = v16;
  objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v8, v17, (uint64_t)v7, (uint64_t)v23);
  if (objc_msgSend_clockValuesCount(v16, v18, v19, v20)) {
    id v21 = v16;
  }
  else {
    id v21 = 0;
  }

  objc_sync_exit(v8);

  return v21;
}

+ (int)pClockTypeAndAtomStateFromClockType:(unsigned __int8)a3 atomState:(unsigned __int8)a4
{
  int v4 = a4 + 5;
  if (a4 < 4u)
  {
    int v5 = a4 + 1;
  }
  else
  {
    int v4 = 0;
    int v5 = 0;
  }
  if (a3 != 1) {
    int v5 = 0;
  }
  if (a3 == 2) {
    return v4;
  }
  else {
    return v5;
  }
}

+ (unsigned)clockTypeFromPClockTypeAndAtomState:(int)a3
{
  if ((a3 - 1) >= 8) {
    return -1;
  }
  else {
    return 0x202020201010101uLL >> (8 * (a3 - 1));
  }
}

+ (unsigned)atomStateFromPClockTypeAndAtomState:(int)a3
{
  if ((a3 - 1) >= 8) {
    return -1;
  }
  else {
    return 0x302010003020100uLL >> (8 * (a3 - 1));
  }
}

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  int v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 1);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampAttributedVector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKDistributedTimestampAttributedVector;
  v2 = [(CKDistributedTimestampAttributedVector *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    objc_msgSend__setBackingState_(v2, v4, (uint64_t)v3, v5);
  }
  return v2;
}

- (CKDistributedTimestampAttributedVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDistributedTimestampAttributedVector;
  uint64_t v5 = [(CKDistributedTimestampAttributedVector *)&v21 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v14 = objc_msgSend_setWithObjects_(v6, v12, v7, v13, v8, v9, v10, v11, 0);
    uint64_t v15 = NSStringFromSelector(sel_attributeToSparseVector);
    v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v14, (uint64_t)v15);

    objc_msgSend__setBackingState_(v5, v18, (uint64_t)v17, v19);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  uint64_t v10 = NSStringFromSelector(sel_attributeToSparseVector);
  objc_msgSend_encodeObject_forKey_(v12, v11, (uint64_t)v9, (uint64_t)v10);

  objc_sync_exit(v5);
}

- (void)_setBackingState:(id)a3
{
  objc_msgSend_CKDeepCopy(a3, a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___setBackingStateNoCopy_(self, v5, (uint64_t)v7, v6);
}

- (void)__setBackingStateNoCopy:(id)a3
{
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)mutableCopy
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, void))MEMORY[0x1F4181798])(self, sel_mutableCopyWithZone_, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3 = self;
  objc_sync_enter(v3);
  id v4 = objc_opt_new();
  uint64_t v8 = objc_msgSend_mutableAttributeToSparseVector(v3, v5, v6, v7);
  objc_msgSend__setBackingState_(v4, v9, (uint64_t)v8, v10);

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKDistributedTimestampAttributedVector *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = self;
      objc_sync_enter(v6);
      uint64_t v7 = v5;
      objc_sync_enter(v7);
      uint64_t v11 = objc_msgSend_mutableAttributeToSparseVector(v6, v8, v9, v10);
      v18 = objc_msgSend_mutableAttributeToSparseVector(v7, v12, v13, v14);
      if (v11 == v18)
      {
        char isEqual = 1;
      }
      else
      {
        uint64_t v19 = objc_msgSend_mutableAttributeToSparseVector(v6, v15, v16, v17);
        v23 = objc_msgSend_mutableAttributeToSparseVector(v7, v20, v21, v22);
        char isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);
      }
      objc_sync_exit(v7);

      objc_sync_exit(v6);
    }
    else
    {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v6 = objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B184740;
  v11[3] = &unk_1E5463CD0;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (id)allSiteIdentifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B1848FC;
  v12[3] = &unk_1E54658E8;
  id v8 = v3;
  id v13 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  objc_sync_exit(v2);

  return v8;
}

- (id)allModifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  objc_msgSend_allSiteIdentifiers(self, v4, v5, v6);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = objc_msgSend_modifier(*(void **)(*((void *)&v19 + 1) + 8 * i), v9, v10, v11, (void)v19);
        objc_msgSend_addObject_(v3, v16, (uint64_t)v15, v17);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v12);
  }

  return v3;
}

- (unint64_t)timestampCount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v6 = objc_msgSend_mutableAttributeToSparseVector(v2, v3, v4, v5);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B184BEC;
  v11[3] = &unk_1E5463CD0;
  v11[4] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v11, v8);

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  objc_sync_exit(v2);

  return v9;
}

- (unint64_t)timestampCountForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  unint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B184D98;
  v15[3] = &unk_1E5465BC0;
  uint64_t v17 = &v18;
  id v10 = v4;
  id v16 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v15, v12);

  unint64_t v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  objc_sync_exit(v5);

  return v13;
}

- (unsigned)attributeForTimestamp:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v14)
  {
    id obj = v9;
    uint64_t v15 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_mutableAttributeToSparseVector(v5, v11, v12, v13);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v17, v20);

        uint64_t v25 = objc_msgSend_siteIdentifierObject(v4, v22, v23, v24);
        v28 = objc_msgSend_clockValuesForSiteIdentifier_(v21, v26, (uint64_t)v25, v27);
        uint64_t v32 = objc_msgSend_clockValue(v4, v29, v30, v31);
        int v35 = objc_msgSend_containsIndex_(v28, v33, v32, v34);

        if (v35)
        {
          LOWORD(v14) = objc_msgSend_unsignedShortValue(v17, v36, v37, v38);

          goto LABEL_11;
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v41, (uint64_t)v45, 16);
      if (v14) {
        continue;
      }
      break;
    }
LABEL_11:
    unint64_t v9 = obj;
  }

  objc_sync_exit(v5);
  return v14;
}

- (id)clockValuesForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  id v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_18B185194;
  v18[3] = &unk_1E5465910;
  id v11 = v6;
  id v19 = v11;
  id v12 = v4;
  id v20 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)v18, v14);

  uint64_t v15 = v20;
  id v16 = v11;

  objc_sync_exit(v5);

  return v16;
}

- (void)enumerateClockValuesForSiteIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t, void, unsigned __int8 *))a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  v33 = objc_msgSend_clockValuesForSiteIdentifier_(v8, v9, (uint64_t)v6, v10);
  if (objc_msgSend_count(v33, v11, v12, v13))
  {
    unint64_t Index = objc_msgSend_lastIndex(v33, v14, v15, v16);
    unint64_t v21 = 0;
    do
    {
      if (v21 > Index) {
        break;
      }
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x2020000000;
      char v55 = 1;
      uint64_t v48 = 0;
      v49 = &v48;
      uint64_t v50 = 0x2020000000;
      __int16 v51 = 0;
      uint64_t v42 = 0;
      long long v43 = &v42;
      uint64_t v44 = 0x4012000000;
      v45 = sub_18AF142E0;
      uint64_t v46 = nullsub_1;
      v47 = &unk_18B233E1F;
      long long v22 = objc_msgSend_mutableAttributeToSparseVector(v8, v17, v18, v19);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_18B185550;
      v35[3] = &unk_1E5465960;
      id v23 = v6;
      unint64_t v40 = v21;
      unint64_t v41 = Index + 1 - v21;
      id v36 = v23;
      uint64_t v37 = &v52;
      uint64_t v38 = &v42;
      v39 = &v48;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v22, v24, (uint64_t)v35, v25);

      if (*((unsigned char *)v53 + 24))
      {
        uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v26, v27, v28);
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)v8, @"CKDistributedTimestampVector.mm", 600, @"Range unexpectedly not found");
      }
      unsigned __int8 v34 = 0;
      v7[2](v7, v43[6], v43[7], *((unsigned __int16 *)v49 + 12), &v34);
      int v29 = v34;
      if (!v34) {
        unint64_t v21 = v43[7] + v43[6];
      }

      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v48, 8);
      _Block_object_dispose(&v52, 8);
    }
    while (!v29);
  }

  objc_sync_exit(v8);
}

- (void)enumerateAllClockValuesUsingBlock:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  objc_msgSend_allSiteIdentifiers(v5, v6, v7, v8);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v26 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
      uint64_t v21 = 0;
      long long v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_18B185920;
      v18[3] = &unk_1E5465988;
      id v14 = v4;
      void v18[4] = v13;
      id v19 = v14;
      id v20 = &v21;
      objc_msgSend_enumerateClockValuesForSiteIdentifier_usingBlock_(v5, v15, v13, (uint64_t)v18);
      LOBYTE(v13) = *((unsigned char *)v22 + 24) == 0;

      _Block_object_dispose(&v21, 8);
      if ((v13 & 1) == 0) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v25, (uint64_t)v29, 16);
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (CKDistributedTimestampAttributedVector)vectorWithoutAttributes
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B185AC0;
  v16[3] = &unk_1E54658E8;
  id v8 = v3;
  id v17 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v16, v10);

  id v14 = objc_msgSend_copy(v8, v11, v12, v13);
  objc_sync_exit(v2);

  return (CKDistributedTimestampAttributedVector *)v14;
}

- (id)vectorFilteredBySiteIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = sub_18B185C40;
  uint64_t v23 = &unk_1E5465910;
  id v11 = v4;
  id v24 = v11;
  id v12 = v6;
  id v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  uint64_t v18 = objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (id)vectorFilteredByModifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  long long v22 = sub_18B185E94;
  uint64_t v23 = &unk_1E5465910;
  id v11 = v4;
  id v24 = v11;
  id v12 = v6;
  id v25 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  uint64_t v18 = objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return v18;
}

- (id)vectorFilteredByAttribute:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = objc_opt_new();
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  id v12 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v3, v11);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v9, v13, (uint64_t)v12, v14);
  id v19 = objc_msgSend_mutableCopy(v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_mutableAttributeToSparseVector(v5, v20, v21, v22);
  long long v26 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v24, v3, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v23, v27, (uint64_t)v19, (uint64_t)v26);

  uint64_t v31 = objc_msgSend_copy(v5, v28, v29, v30);
  objc_sync_exit(v4);

  return v31;
}

- (CKDistributedTimestampAttributedVector)vectorWithAttributeReplacementBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_new();
  uint64_t v10 = objc_msgSend_mutableAttributeToSparseVector(v5, v7, v8, v9);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_18B186274;
  uint64_t v23 = &unk_1E54659B0;
  id v11 = v4;
  id v25 = v11;
  id v12 = v6;
  id v24 = v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v13, (uint64_t)&v20, v14);

  uint64_t v18 = objc_msgSend_copy(v12, v15, v16, v17, v20, v21, v22, v23);
  objc_sync_exit(v5);

  return (CKDistributedTimestampAttributedVector *)v18;
}

- (id)descriptionWithStringSiteIdentifiers:(BOOL)a3
{
  return sub_18B186410(self, a3, &unk_1ED7F0A58);
}

- (id)descriptionWithStringSiteIdentifiers
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, uint64_t))MEMORY[0x1F4181798])(self, sel_descriptionWithStringSiteIdentifiers_, 1);
}

- (id)description
{
  return (id)((uint64_t (*)(CKDistributedTimestampAttributedVector *, char *, void))MEMORY[0x1F4181798])(self, sel_descriptionWithStringSiteIdentifiers_, 0);
}

- (NSDictionary)mutableAttributeToSparseVector
{
  return self->_mutableAttributeToSparseVector;
}

- (void).cxx_destruct
{
}

- (id)clockVector_vectorFilteredByClockType:(unsigned __int8)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = objc_opt_new();
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_18B18BB28;
  uint64_t v21 = &unk_1E5465AF8;
  unsigned __int8 v23 = a3;
  id v10 = v5;
  id v22 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)&v18, v12);

  uint64_t v16 = objc_msgSend_copy(v10, v13, v14, v15, v18, v19, v20, v21);
  objc_sync_exit(v4);

  return v16;
}

- (id)clockVector_vectorFilteredByAtomState:(unsigned __int8)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = objc_opt_new();
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v4, v6, v7, v8);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_18B18BD40;
  uint64_t v21 = &unk_1E5465AF8;
  unsigned __int8 v23 = a3;
  id v10 = v5;
  id v22 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)&v18, v12);

  uint64_t v16 = objc_msgSend_copy(v10, v13, v14, v15, v18, v19, v20, v21);
  objc_sync_exit(v4);

  return v16;
}

- (id)clockVector_vectorFillingInImplicitClockValuesUsingSiteIdentifiers:(id)a3 withExpansionState:(unsigned __int8)a4
{
  id v6 = a3;
  id v10 = objc_msgSend_mutableCopy(self, v7, v8, v9);
  uint64_t v13 = objc_msgSend_clockVector_vectorFilteredByClockType_(v10, v11, 2, v12);
  uint64_t v17 = objc_msgSend_allSiteIdentifiers(v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_setByAddingObjectsFromSet_(v17, v18, (uint64_t)v6, v19);
  uint64_t v21 = objc_opt_new();
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = sub_18B18C034;
  v41[3] = &unk_1E5465B20;
  id v22 = v21;
  id v42 = v22;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v23, (uint64_t)v41, v24);
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  id v36 = sub_18B18C138;
  uint64_t v37 = &unk_1E5465B48;
  id v25 = v22;
  id v38 = v25;
  id v26 = v10;
  id v39 = v26;
  unsigned __int8 v40 = a4;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v13, v27, (uint64_t)&v34, v28);
  uint64_t v32 = objc_msgSend_copy(v26, v29, v30, v31, v34, v35, v36, v37);

  return v32;
}

- (unint64_t)clockVector_timestampCountForAtomState:(unsigned __int8)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v8 = objc_msgSend_mutableAttributeToSparseVector(v4, v5, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B18C528;
  v13[3] = &unk_1E5465B70;
  unsigned __int8 v14 = a3;
  v13[4] = &v15;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v8, v9, (uint64_t)v13, v10);

  unint64_t v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  objc_sync_exit(v4);

  return v11;
}

- (BOOL)clockVector_includesTimestamp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_clockVector_vectorFilteredByClockType_(v5, v6, 1, v7);
  uint64_t v12 = objc_msgSend_siteIdentifierObject(v4, v9, v10, v11);
  uint64_t v15 = objc_msgSend_clockValuesForSiteIdentifier_(v8, v13, (uint64_t)v12, v14);

  uint64_t v19 = objc_msgSend_clockValue(v4, v16, v17, v18);
  char v22 = objc_msgSend_containsIndex_(v15, v20, v19, v21);

  if (v22)
  {
    BOOL v26 = 1;
  }
  else
  {
    long long v27 = objc_msgSend_siteIdentifierObject(v4, v23, v24, v25);
    uint64_t v31 = objc_msgSend_modifier(v27, v28, v29, v30);
    v33 = objc_msgSend_clockVector__winningLWWTimestampForModifier_winningAttribute_(v5, v32, (uint64_t)v31, 0);

    if (v33)
    {
      uint64_t v37 = objc_msgSend_siteIdentifierObject(v4, v34, v35, v36);
      unint64_t v41 = objc_msgSend_identifier(v37, v38, v39, v40);
      unint64_t v45 = objc_msgSend_clockValue(v4, v42, v43, v44);
      v49 = objc_msgSend_siteIdentifierObject(v33, v46, v47, v48);
      v53 = objc_msgSend_identifier(v49, v50, v51, v52);
      unint64_t v57 = objc_msgSend_clockValue(v33, v54, v55, v56);
      uint64_t v58 = CKDistributedTimestampLWWCompare(v41, v45, v53, v57);

      BOOL v26 = (unint64_t)(v58 + 1) < 2;
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  objc_sync_exit(v5);

  return v26;
}

- (unsigned)clockVector_clockTypeForModifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = -1;
  uint64_t v9 = objc_msgSend_mutableAttributeToSparseVector(v5, v6, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B18C924;
  v14[3] = &unk_1E5465BC0;
  id v10 = v4;
  id v15 = v10;
  uint64_t v16 = &v17;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)v14, v12);

  LOBYTE(v4) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  objc_sync_exit(v5);

  return v4;
}

- (id)clockVector_clockTypesForAllModifiers
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_mutableAttributeToSparseVector(v2, v4, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B18CBFC;
  v12[3] = &unk_1E54658E8;
  id v8 = v3;
  id v13 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  objc_sync_exit(v2);

  return v8;
}

- (id)clockVector__winningLWWTimestampForModifier:(id)a3 winningAttribute:(unsigned __int16 *)a4
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend_clockVector_vectorFilteredByClockType_(self, v8, 2, v9);
  id v13 = objc_msgSend_vectorFilteredByModifier_(v10, v11, (uint64_t)v7, v12);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_18B187908;
  v33 = sub_18B187918;
  id v34 = 0;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  __int16 v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_18B18D128;
  v20[3] = &unk_1E5465BE8;
  v20[9] = &v21;
  v20[10] = a2;
  v20[4] = self;
  v20[5] = v37;
  v20[6] = v35;
  v20[7] = &v29;
  v20[8] = &v25;
  objc_msgSend_enumerateAllClockValuesUsingBlock_(v13, v14, (uint64_t)v20, v15);
  if (v30[5])
  {
    if (a4) {
      *a4 = *((_WORD *)v22 + 12);
    }
    uint64_t v16 = [CKDistributedTimestamp alloc];
    uint64_t v18 = objc_msgSend_initWithSiteIdentifierObject_clockValue_(v16, v17, v30[5], v26[3]);
  }
  else
  {
    uint64_t v18 = 0;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

  return v18;
}

- (int64_t)clockVector_compareToVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = v6;
  objc_sync_enter(v8);
  int hasTimestampsNotInVector_withExpansionState = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v7, v9, (uint64_t)v8, v4);
  int v12 = objc_msgSend_clockVector_hasTimestampsNotInVector_withExpansionState_(v8, v11, (uint64_t)v7, v4);
  uint64_t v13 = 2;
  if (!(v12 | hasTimestampsNotInVector_withExpansionState)) {
    uint64_t v13 = 0;
  }
  if ((v12 ^ 1 | hasTimestampsNotInVector_withExpansionState) == 1) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = -1;
  }
  if ((hasTimestampsNotInVector_withExpansionState ^ 1 | v12)) {
    int64_t v15 = v14;
  }
  else {
    int64_t v15 = 1;
  }
  objc_sync_exit(v8);

  objc_sync_exit(v7);
  return v15;
}

- (BOOL)clockVector_hasTimestampsNotInVector:(id)a3 withExpansionState:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_mutableCopy(self, v7, v8, v9);
  objc_msgSend_clockVector_minusVector_withExpansionState_(v10, v11, (uint64_t)v6, v4);
  LOBYTE(v4) = objc_msgSend_timestampCount(v10, v12, v13, v14) != 0;

  return v4;
}

@end