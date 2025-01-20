@interface CKDPRequestedListField
+ (Class)rangeType;
- (BOOL)hasFieldId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordFieldIdentifier)fieldId;
- (NSMutableArray)ranges;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rangeAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rangesCount;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)addRange:(id)a3;
- (void)clearRanges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldId:(id)a3;
- (void)setRanges:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRequestedListField

- (BOOL)hasFieldId
{
  return self->_fieldId != 0;
}

- (void)clearRanges
{
  objc_msgSend_removeAllObjects(self->_ranges, a2, v2);
}

- (void)addRange:(id)a3
{
  v4 = (const char *)a3;
  ranges = self->_ranges;
  v8 = (char *)v4;
  if (!ranges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_ranges;
    self->_ranges = v6;

    v4 = v8;
    ranges = self->_ranges;
  }
  objc_msgSend_addObject_(ranges, v4, (uint64_t)v4);
}

- (unint64_t)rangesCount
{
  return objc_msgSend_count(self->_ranges, a2, v2);
}

- (id)rangeAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_ranges, a2, a3);
}

+ (Class)rangeType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRequestedListField;
  v4 = [(CKDPRequestedListField *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  fieldId = self->_fieldId;
  if (fieldId)
  {
    v8 = objc_msgSend_dictionaryRepresentation(fieldId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"field_id");
  }
  if (objc_msgSend_count(self->_ranges, v4, v5))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = objc_msgSend_count(self->_ranges, v11, v12);
    v15 = objc_msgSend_initWithCapacity_(v10, v14, v13);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v16 = self->_ranges;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v28, v32, 16);
    if (v18)
    {
      uint64_t v21 = v18;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v16);
          }
          v24 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v28 + 1) + 8 * i), v19, v20, (void)v28);
          objc_msgSend_addObject_(v15, v25, (uint64_t)v24);
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v28, v32, 16);
      }
      while (v21);
    }

    objc_msgSend_setObject_forKey_(v6, v26, (uint64_t)v15, @"range");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E24338((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_fieldId) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_ranges;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  fieldId = self->_fieldId;
  if (fieldId) {
    objc_msgSend_setFieldId_(v16, v4, (uint64_t)fieldId);
  }
  if (objc_msgSend_rangesCount(self, v4, (uint64_t)fieldId))
  {
    objc_msgSend_clearRanges(v16, v6, v7);
    uint64_t v10 = objc_msgSend_rangesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_rangeAtIndex_(self, v11, i);
        objc_msgSend_addRange_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_fieldId, v11, (uint64_t)a3);
  long long v13 = (void *)v10[1];
  v10[1] = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_ranges;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addRange_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((fieldId = self->_fieldId, uint64_t v9 = v4[1], !((unint64_t)fieldId | v9))
     || objc_msgSend_isEqual_(fieldId, v7, v9)))
  {
    ranges = self->_ranges;
    uint64_t v11 = v4[2];
    if ((unint64_t)ranges | v11) {
      char isEqual = objc_msgSend_isEqual_(ranges, v7, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_fieldId, a2, v2);
  return objc_msgSend_hash(self->_ranges, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  fieldId = self->_fieldId;
  uint64_t v7 = *((void *)v5 + 1);
  if (fieldId)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(fieldId, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setFieldId_(self, v4, v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addRange_(self, v11, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }
}

- (CKDPRecordFieldIdentifier)fieldId
{
  return self->_fieldId;
}

- (void)setFieldId:(id)a3
{
}

- (NSMutableArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_fieldId, 0);
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v9 = objc_msgSend_fieldId(self, v7, v8);
  uint64_t v10 = (a4 + 1);
  objc_msgSend__CKLogToFileHandle_atDepth_(v9, v11, (uint64_t)v6, v10);

  uint64_t v12 = sub_1C4EB74C0();
  objc_msgSend_writeData_(v6, v13, (uint64_t)v12);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_msgSend_ranges(self, v14, v15);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v35, v39, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      uint64_t v33 = v20;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend__CKLogToFileHandle_atDepth_(*(void **)(*((void *)&v35 + 1) + 8 * v22), v18, (uint64_t)v6, v10, v33);
        long long v25 = objc_msgSend_ranges(self, v23, v24);
        unint64_t v28 = objc_msgSend_count(v25, v26, v27);

        if (v20 + 1 + v22 < v28)
        {
          uint64_t v29 = sub_1C4EB61DC();
          objc_msgSend_writeData_(v6, v30, (uint64_t)v29);
        }
        ++v22;
      }
      while (v19 != v22);
      uint64_t v20 = v19 + v33;
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v35, v39, 16);
    }
    while (v19);
  }

  long long v31 = sub_1C4EB7514();
  objc_msgSend_writeData_(v6, v32, (uint64_t)v31);
}

@end