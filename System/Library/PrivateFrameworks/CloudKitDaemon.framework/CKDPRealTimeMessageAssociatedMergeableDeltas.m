@interface CKDPRealTimeMessageAssociatedMergeableDeltas
+ (Class)mergeableDeltasType;
- (BOOL)hasFieldIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasRecordIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPMergeableValueIdentifier)identifier;
- (CKDPRecordFieldIdentifier)fieldIdentifier;
- (CKDPRecordIdentifier)recordIdentifier;
- (NSMutableArray)mergeableDeltas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mergeableDeltasAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mergeableDeltasCount;
- (void)addMergeableDeltas:(id)a3;
- (void)clearMergeableDeltas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFieldIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMergeableDeltas:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRealTimeMessageAssociatedMergeableDeltas

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasFieldIdentifier
{
  return self->_fieldIdentifier != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearMergeableDeltas
{
  objc_msgSend_removeAllObjects(self->_mergeableDeltas, a2, v2);
}

- (void)addMergeableDeltas:(id)a3
{
  v4 = (const char *)a3;
  mergeableDeltas = self->_mergeableDeltas;
  v8 = (char *)v4;
  if (!mergeableDeltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_mergeableDeltas;
    self->_mergeableDeltas = v6;

    v4 = v8;
    mergeableDeltas = self->_mergeableDeltas;
  }
  objc_msgSend_addObject_(mergeableDeltas, v4, (uint64_t)v4);
}

- (unint64_t)mergeableDeltasCount
{
  return objc_msgSend_count(self->_mergeableDeltas, a2, v2);
}

- (id)mergeableDeltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_mergeableDeltas, a2, a3);
}

+ (Class)mergeableDeltasType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRealTimeMessageAssociatedMergeableDeltas;
  v4 = [(CKDPRealTimeMessageAssociatedMergeableDeltas *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"record_identifier");
  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(fieldIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"field_identifier");
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v14 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"identifier");
  }
  if (objc_msgSend_count(self->_mergeableDeltas, v4, v5))
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = objc_msgSend_count(self->_mergeableDeltas, v17, v18);
    v21 = objc_msgSend_initWithCapacity_(v16, v20, v19);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v22 = self->_mergeableDeltas;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v34, v38, 16);
    if (v24)
    {
      uint64_t v27 = v24;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v22);
          }
          v30 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v34 + 1) + 8 * i), v25, v26, (void)v34);
          objc_msgSend_addObject_(v21, v31, (uint64_t)v30);
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v34, v38, 16);
      }
      while (v27);
    }

    objc_msgSend_setObject_forKey_(v6, v32, (uint64_t)v21, @"mergeable_deltas");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E2BB28((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_recordIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_fieldIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_mergeableDeltas;
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
  id v18 = a3;
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier) {
    objc_msgSend_setRecordIdentifier_(v18, v4, (uint64_t)recordIdentifier);
  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier) {
    objc_msgSend_setFieldIdentifier_(v18, v4, (uint64_t)fieldIdentifier);
  }
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setIdentifier_(v18, v4, (uint64_t)identifier);
  }
  if (objc_msgSend_mergeableDeltasCount(self, v4, (uint64_t)identifier))
  {
    objc_msgSend_clearMergeableDeltas(v18, v8, v9);
    uint64_t v12 = objc_msgSend_mergeableDeltasCount(self, v10, v11);
    if (v12)
    {
      uint64_t v14 = v12;
      for (uint64_t i = 0; i != v14; ++i)
      {
        id v16 = objc_msgSend_mergeableDeltasAtIndex_(self, v13, i);
        objc_msgSend_addMergeableDeltas_(v18, v17, (uint64_t)v16);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  long long v13 = (void *)v10[4];
  v10[4] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_fieldIdentifier, v14, (uint64_t)a3);
  id v16 = (void *)v10[1];
  v10[1] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_identifier, v17, (uint64_t)a3);
  uint64_t v19 = (void *)v10[2];
  v10[2] = v18;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v20 = self->_mergeableDeltas;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v30, v34, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v20);
        }
        uint64_t v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (void)v30);
        objc_msgSend_addMergeableDeltas_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v34, 16);
    }
    while (v24);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordIdentifier = self->_recordIdentifier, uint64_t v9 = v4[4], !((unint64_t)recordIdentifier | v9))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v9))
    && ((fieldIdentifier = self->_fieldIdentifier, uint64_t v11 = v4[1], !((unint64_t)fieldIdentifier | v11))
     || objc_msgSend_isEqual_(fieldIdentifier, v7, v11))
    && ((identifier = self->_identifier, uint64_t v13 = v4[2], !((unint64_t)identifier | v13))
     || objc_msgSend_isEqual_(identifier, v7, v13)))
  {
    mergeableDeltas = self->_mergeableDeltas;
    uint64_t v15 = v4[3];
    if ((unint64_t)mergeableDeltas | v15) {
      char isEqual = objc_msgSend_isEqual_(mergeableDeltas, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_fieldIdentifier, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_identifier, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_mergeableDeltas, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  recordIdentifier = self->_recordIdentifier;
  uint64_t v7 = *((void *)v5 + 4);
  if (recordIdentifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v7);
  }
  fieldIdentifier = self->_fieldIdentifier;
  uint64_t v9 = *((void *)v5 + 1);
  if (fieldIdentifier)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(fieldIdentifier, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setFieldIdentifier_(self, v4, v9);
  }
  identifier = self->_identifier;
  uint64_t v11 = *((void *)v5 + 2);
  if (identifier)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(identifier, v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setIdentifier_(self, v4, v11);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = *((id *)v5 + 3);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v23, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addMergeableDeltas_(self, v15, *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v19, v23, 16);
    }
    while (v16);
  }
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (CKDPRecordFieldIdentifier)fieldIdentifier
{
  return self->_fieldIdentifier;
}

- (void)setFieldIdentifier:(id)a3
{
}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)mergeableDeltas
{
  return self->_mergeableDeltas;
}

- (void)setMergeableDeltas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_mergeableDeltas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
}

@end