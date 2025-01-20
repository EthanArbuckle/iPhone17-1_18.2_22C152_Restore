@interface CKDPRecordRetrieveChangesResponseMergeableDeltaChange
+ (Class)deltasType;
- (BOOL)hasFieldIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)hasRecordIdentifier;
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPMergeableValueIdentifier)identifier;
- (CKDPRecordFieldIdentifier)fieldIdentifier;
- (CKDPRecordIdentifier)recordIdentifier;
- (CKDPRecordType)recordType;
- (NSMutableArray)deltas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltasAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deltasCount;
- (unint64_t)hash;
- (void)addDeltas:(id)a3;
- (void)clearDeltas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeltas:(id)a3;
- (void)setFieldIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setRecordType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveChangesResponseMergeableDeltaChange

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasFieldIdentifier
{
  return self->_fieldIdentifier != 0;
}

- (void)clearDeltas
{
  objc_msgSend_removeAllObjects(self->_deltas, a2, v2);
}

- (void)addDeltas:(id)a3
{
  v4 = (const char *)a3;
  deltas = self->_deltas;
  v8 = (char *)v4;
  if (!deltas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_deltas;
    self->_deltas = v6;

    v4 = v8;
    deltas = self->_deltas;
  }
  objc_msgSend_addObject_(deltas, v4, (uint64_t)v4);
}

- (unint64_t)deltasCount
{
  return objc_msgSend_count(self->_deltas, a2, v2);
}

- (id)deltasAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deltas, a2, a3);
}

+ (Class)deltasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseMergeableDeltaChange;
  v4 = [(CKDPRecordRetrieveChangesResponseMergeableDeltaChange *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"recordIdentifier");
  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier)
  {
    v14 = objc_msgSend_dictionaryRepresentation(fieldIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"fieldIdentifier");
  }
  if (objc_msgSend_count(self->_deltas, v4, v5))
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v21 = objc_msgSend_count(self->_deltas, v19, v20);
    v23 = objc_msgSend_initWithCapacity_(v18, v22, v21);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v24 = self->_deltas;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v39, v43, 16);
    if (v26)
    {
      uint64_t v29 = v26;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v24);
          }
          v32 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v39 + 1) + 8 * i), v27, v28, (void)v39);
          objc_msgSend_addObject_(v23, v33, (uint64_t)v32);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v39, v43, 16);
      }
      while (v29);
    }

    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v23, @"deltas");
  }
  recordType = self->_recordType;
  if (recordType)
  {
    v36 = objc_msgSend_dictionaryRepresentation(recordType, v16, v17);
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, @"recordType");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D5FAD4((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_fieldIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_deltas;
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

  if (self->_recordType) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v18 = a3;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setIdentifier_(v18, v4, (uint64_t)identifier);
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier) {
    objc_msgSend_setRecordIdentifier_(v18, v4, (uint64_t)recordIdentifier);
  }
  fieldIdentifier = self->_fieldIdentifier;
  if (fieldIdentifier) {
    objc_msgSend_setFieldIdentifier_(v18, v4, (uint64_t)fieldIdentifier);
  }
  if (objc_msgSend_deltasCount(self, v4, (uint64_t)fieldIdentifier))
  {
    objc_msgSend_clearDeltas(v18, v8, v9);
    uint64_t v12 = objc_msgSend_deltasCount(self, v10, v11);
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_deltasAtIndex_(self, v8, i);
        objc_msgSend_addDeltas_(v18, v16, (uint64_t)v15);
      }
    }
  }
  recordType = self->_recordType;
  if (recordType) {
    objc_msgSend_setRecordType_(v18, v8, (uint64_t)recordType);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[3];
  v10[3] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_fieldIdentifier, v17, (uint64_t)a3);
  v19 = (void *)v10[2];
  v10[2] = v18;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v20 = self->_deltas;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v33, v37, 16);
  if (v22)
  {
    uint64_t v24 = v22;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v20);
        }
        v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v33 + 1) + 8 * v26), v23, (uint64_t)a3, (void)v33);
        objc_msgSend_addDeltas_(v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v33, v37, 16);
    }
    while (v24);
  }

  uint64_t v30 = objc_msgSend_copyWithZone_(self->_recordType, v29, (uint64_t)a3);
  v31 = (void *)v10[5];
  v10[5] = v30;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_12;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_12;
    }
  }
  if (((recordIdentifier = self->_recordIdentifier, uint64_t v11 = v4[4], !((unint64_t)recordIdentifier | v11))
     || objc_msgSend_isEqual_(recordIdentifier, v7, v11))
    && ((fieldIdentifier = self->_fieldIdentifier, uint64_t v13 = v4[2], !((unint64_t)fieldIdentifier | v13))
     || objc_msgSend_isEqual_(fieldIdentifier, v7, v13))
    && ((deltas = self->_deltas, uint64_t v15 = v4[1], !((unint64_t)deltas | v15))
     || objc_msgSend_isEqual_(deltas, v7, v15)))
  {
    recordType = self->_recordType;
    uint64_t v17 = v4[5];
    if ((unint64_t)recordType | v17) {
      char isEqual = objc_msgSend_isEqual_(recordType, v7, v17);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
LABEL_12:
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_recordIdentifier, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_fieldIdentifier, v8, v9);
  uint64_t v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_deltas, v11, v12);
  return v13 ^ objc_msgSend_hash(self->_recordType, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  identifier = self->_identifier;
  uint64_t v7 = *((void *)v5 + 3);
  if (identifier)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(identifier, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setIdentifier_(self, v4, v7);
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v9 = *((void *)v5 + 4);
  if (recordIdentifier)
  {
    if (v9) {
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v9);
    }
  }
  else if (v9)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v9);
  }
  fieldIdentifier = self->_fieldIdentifier;
  uint64_t v11 = *((void *)v5 + 2);
  if (fieldIdentifier)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(fieldIdentifier, v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setFieldIdentifier_(self, v4, v11);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = *((id *)v5 + 1);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, v26, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend_addDeltas_(self, v15, *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v22, v26, 16);
    }
    while (v16);
  }

  recordType = self->_recordType;
  uint64_t v21 = *((void *)v5 + 5);
  if (recordType)
  {
    if (v21) {
      objc_msgSend_mergeFrom_(recordType, v19, v21);
    }
  }
  else if (v21)
  {
    objc_msgSend_setRecordType_(self, v19, v21);
  }
}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
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

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
}

- (CKDPRecordType)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fieldIdentifier, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
}

@end