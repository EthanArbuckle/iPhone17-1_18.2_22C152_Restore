@interface CKDistributedTimestampVector
+ (BOOL)supportsSecureCoding;
- (BOOL)_isGreaterThanOrEqualToTimestamp:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CKDistributedTimestampVector)initWithCoder:(id)a3;
- (CKDistributedTimestampVector)initWithTimestampClockVector:(id)a3 fillingInGaps:(BOOL)a4;
- (CKDistributedTimestampVector)initWithTimestamps:(id)a3;
- (NSMutableArray)timestampArray;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)minimalTimestampWith:(id)a3;
- (id)sequentialSiteIdentifiers;
- (id)timestampAtIndex:(unint64_t)a3;
- (id)timestampForSiteIdentifier:(id)a3;
- (id)timestamps;
- (int64_t)compareToTimestampVector:(id)a3;
- (int64_t)indexForTimestampForSiteIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)timestampCount;
- (void)addTimestamp:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTimestampArray:(id)a3;
@end

@implementation CKDistributedTimestampVector

- (CKDistributedTimestampVector)initWithTimestamps:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDistributedTimestampVector;
  v5 = [(CKDistributedTimestampVector *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    timestampArray = v5->_timestampArray;
    v5->_timestampArray = (NSMutableArray *)v6;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_18B1168D0;
    v11[3] = &unk_1E5464CE8;
    v12 = v5;
    objc_msgSend_enumerateObjectsUsingBlock_(v4, v8, (uint64_t)v11, v9);
  }
  return v5;
}

- (CKDistributedTimestampVector)initWithTimestampClockVector:(id)a3 fillingInGaps:(BOOL)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v44 = (CKDistributedTimestampVector *)objc_msgSend_initWithTimestamps_(self, v7, 0, v8);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v9 = v6;
  objc_super v13 = objc_msgSend_allSiteIdentifiers(v6, v10, v11, v12);
  id obj = v13;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    uint64_t v42 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        v21 = objc_msgSend_clockValuesForSiteIdentifier_(v9, v15, v20, v16);
        v25 = v21;
        if (!a4 && objc_msgSend_count(v21, v22, v23, v24))
        {
          uint64_t Index = objc_msgSend_firstIndex(v25, v26, v27, v28);
          uint64_t v33 = objc_msgSend_lastIndex(v25, v30, v31, v32);
          if (v33 != objc_msgSend_count(v25, v34, v35, v36) - 1 || Index != 0) {
            objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v37, v42, @"Sparse timestamp vector is discontiguous and incompatible with conventional timestamp vector");
          }
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = sub_18B116B70;
        v45[3] = &unk_1E5462740;
        v45[4] = v20;
        v46 = v44;
        objc_msgSend_enumerateRangesUsingBlock_(v25, v39, (uint64_t)v45, v40);
      }
      objc_super v13 = obj;
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v17);
  }

  return v44;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDistributedTimestampVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDistributedTimestampVector;
  v5 = [(CKDistributedTimestampVector *)&v20 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v11 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v8, 0);
    uint64_t v12 = NSStringFromSelector(sel_timestamps);
    v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v11, (uint64_t)v12);

    uint64_t v17 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1CA48], v15, (uint64_t)v14, v16);
    timestampArray = v5->_timestampArray;
    v5->_timestampArray = (NSMutableArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_timestampArray(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_timestamps);
  objc_msgSend_encodeObject_forKey_(v11, v10, (uint64_t)v8, (uint64_t)v9);
}

- (unint64_t)timestampCount
{
  id v4 = objc_msgSend_timestampArray(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (id)timestampAtIndex:(unint64_t)a3
{
  v5 = objc_msgSend_timestampArray(self, a2, a3, v3);
  unint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(v5, v6, a3, v7);

  return v8;
}

- (int64_t)indexForTimestampForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v8 = objc_msgSend_timestampArray(self, v5, v6, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B117004;
  v14[3] = &unk_1E5464D10;
  id v9 = v4;
  id v15 = v9;
  uint64_t v16 = &v17;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v10, (uint64_t)v14, v11);

  int64_t v12 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)timestampForSiteIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_indexForTimestampForSiteIdentifier_(self, v5, (uint64_t)v4, v6);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    int64_t v12 = objc_msgSend_timestampArray(self, v7, v8, v9);
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v12, v13, v10, v14);
  }

  return v11;
}

- (id)sequentialSiteIdentifiers
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_timestampArray(self, v4, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B117220;
  v12[3] = &unk_1E5464CE8;
  id v8 = v3;
  id v13 = v8;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v9, (uint64_t)v12, v10);

  return v8;
}

- (id)timestamps
{
  id v4 = objc_msgSend_timestampArray(self, a2, v2, v3);
  id v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (BOOL)_isGreaterThanOrEqualToTimestamp:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_sequentialSiteIdentifiers(self, v5, v6, v7);
  int64_t v12 = objc_msgSend_sequentialSiteIdentifiers(v4, v9, v10, v11);
  if (objc_msgSend_isSubsetOfSet_(v12, v13, (uint64_t)v8, v14))
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    uint64_t v18 = objc_msgSend_timestamps(v4, v15, v16, v17);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_18B117448;
    v23[3] = &unk_1E5464D10;
    v23[4] = self;
    v23[5] = &v24;
    objc_msgSend_enumerateObjectsUsingBlock_(v18, v19, (uint64_t)v23, v20);

    BOOL v21 = *((unsigned char *)v25 + 24) == 0;
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (int64_t)compareToTimestampVector:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__isGreaterThanOrEqualToTimestamp_(v4, v5, (uint64_t)self, v6)
    && (objc_msgSend__isGreaterThanOrEqualToTimestamp_(self, v7, (uint64_t)v4, v8) & 1) != 0)
  {
    int64_t v9 = 0;
  }
  else if (objc_msgSend__isGreaterThanOrEqualToTimestamp_(v4, v7, (uint64_t)self, v8))
  {
    int64_t v9 = -1;
  }
  else if (objc_msgSend__isGreaterThanOrEqualToTimestamp_(self, v10, (uint64_t)v4, v11))
  {
    int64_t v9 = 1;
  }
  else
  {
    int64_t v9 = 2;
  }

  return v9;
}

- (void)addTimestamp:(id)a3
{
  id v39 = a3;
  if (objc_msgSend_modifier(v39, v5, v6, v7))
  {
    v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9, v10);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)self, @"CKDistributedTime.mm", 373, @"Non-zero modifiers for ordered timestamps not yet supported");
  }
  uint64_t v11 = objc_msgSend_siteIdentifier(v39, v8, v9, v10);
  uint64_t v14 = objc_msgSend_indexForTimestampForSiteIdentifier_(self, v12, (uint64_t)v11, v13);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = objc_msgSend_timestampArray(self, v15, v16, v17);
    objc_msgSend_addObject_(v18, v19, (uint64_t)v39, v20);
  }
  else
  {
    unint64_t v21 = objc_msgSend_clockValue(v39, v15, v16, v17);
    v25 = objc_msgSend_timestampArray(self, v22, v23, v24);
    uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(v25, v26, v14, v27);
    unint64_t v32 = objc_msgSend_clockValue(v28, v29, v30, v31);

    if (v21 <= v32) {
      goto LABEL_8;
    }
    uint64_t v18 = objc_msgSend_timestampArray(self, v33, v34, v35);
    objc_msgSend_setObject_atIndexedSubscript_(v18, v36, (uint64_t)v39, v14);
  }

LABEL_8:
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_timestamps(v4, v5, v6, v7);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_18B117824;
    v12[3] = &unk_1E5464D38;
    void v12[4] = self;
    id v13 = v8;
    objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v12, v11);
  }
}

- (id)minimalTimestampWith:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [CKDistributedTimestampVector alloc];
  uint64_t v9 = objc_msgSend_initWithTimestamps_(v6, v7, 0, v8);
  id v13 = objc_msgSend_timestamps(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_count(v13, v14, v15, v16);

  if (v17)
  {
    v29 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v18, v19, v20);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v29, v30, (uint64_t)a2, (uint64_t)self, @"CKDistributedTime.mm", 399, @"Didn't expect non-zero timestamps");
  }
  unint64_t v21 = objc_msgSend_timestampArray(self, v18, v19, v20);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_18B117A2C;
  v31[3] = &unk_1E5464D38;
  id v22 = v5;
  id v32 = v22;
  id v23 = v9;
  id v33 = v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v21, v24, (uint64_t)v31, v25);

  uint64_t v26 = v33;
  id v27 = v23;

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v12 = ((v4 != 0) & objc_opt_isKindOfClass()) != 0
     && (uint64_t v7 = objc_msgSend_compareToTimestampVector_(self, v5, (uint64_t)v4, v6),
         v7 == objc_msgSend_compareToTimestampVector_(v4, v8, (uint64_t)self, v9))
     && objc_msgSend_compareToTimestampVector_(self, v10, (uint64_t)v4, v11) == 0;

  return v12;
}

- (unint64_t)hash
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v4 = objc_msgSend_timestampArray(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_18B117C90;
  v9[3] = &unk_1E5464D60;
  v9[4] = &v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v9, v6);

  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (id)description
{
  id v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  uint64_t v9 = objc_msgSend_timestampArray(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

  if (v13)
  {
    objc_msgSend_timestampArray(self, v14, v15, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = objc_msgSend_sortedArrayUsingComparator_(v17, v18, (uint64_t)&unk_1ED7EF878, v19);
    uint64_t v24 = objc_msgSend_string(MEMORY[0x1E4F28E78], v21, v22, v23);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_18B117F5C;
    v34[3] = &unk_1E5464D38;
    id v25 = v24;
    id v35 = v25;
    uint64_t v36 = v20;
    id v26 = v20;
    objc_msgSend_enumerateObjectsUsingBlock_(v26, v27, (uint64_t)v34, v28);
    v29 = v36;
    id v30 = v25;

    objc_msgSend_appendFormat_(v5, v31, @"[%@]", v32, v30);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend_timestampArray(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v4, v5, v6, v7);

  id v9 = objc_alloc((Class)objc_opt_class());
  uint64_t v12 = objc_msgSend_initWithTimestamps_(v9, v10, (uint64_t)v8, v11);

  return v12;
}

- (NSMutableArray)timestampArray
{
  return self->_timestampArray;
}

- (void)setTimestampArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end