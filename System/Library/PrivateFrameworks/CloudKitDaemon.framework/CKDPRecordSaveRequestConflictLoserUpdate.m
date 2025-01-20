@interface CKDPRecordSaveRequestConflictLoserUpdate
+ (Class)conflictLoserEtagsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)conflictLoserEtags;
- (id)conflictLoserEtagsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)conflictLoserEtagsCount;
- (unint64_t)hash;
- (void)addConflictLoserEtags:(id)a3;
- (void)clearConflictLoserEtags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConflictLoserEtags:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordSaveRequestConflictLoserUpdate

- (void)clearConflictLoserEtags
{
  objc_msgSend_removeAllObjects(self->_conflictLoserEtags, a2, v2);
}

- (void)addConflictLoserEtags:(id)a3
{
  v4 = (const char *)a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  v8 = (char *)v4;
  if (!conflictLoserEtags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  objc_msgSend_addObject_(conflictLoserEtags, v4, (uint64_t)v4);
}

- (unint64_t)conflictLoserEtagsCount
{
  return objc_msgSend_count(self->_conflictLoserEtags, a2, v2);
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLoserEtags, a2, a3);
}

+ (Class)conflictLoserEtagsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordSaveRequestConflictLoserUpdate;
  v4 = [(CKDPRecordSaveRequestConflictLoserUpdate *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)conflictLoserEtags, @"conflictLoserEtags");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FC1D24(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_conflictLoserEtags;
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
        PBDataWriterWriteStringField();
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
  if (objc_msgSend_conflictLoserEtagsCount(self, v4, v5))
  {
    objc_msgSend_clearConflictLoserEtags(v16, v6, v7);
    uint64_t v10 = objc_msgSend_conflictLoserEtagsCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_conflictLoserEtagsAtIndex_(self, v11, i);
        objc_msgSend_addConflictLoserEtags_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  objc_super v11 = self->_conflictLoserEtags;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v21, v25, 16);
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v11);
        }
        v18 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v21 + 1) + 8 * v17), v14, (uint64_t)a3, (void)v21);
        objc_msgSend_addConflictLoserEtags_(v10, v19, (uint64_t)v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v21, v25, 16);
    }
    while (v15);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    conflictLoserEtags = self->_conflictLoserEtags;
    uint64_t v9 = v4[1];
    if ((unint64_t)conflictLoserEtags | v9) {
      char isEqual = objc_msgSend_isEqual_(conflictLoserEtags, v7, v9);
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
  return objc_msgSend_hash(self->_conflictLoserEtags, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *((id *)a3 + 1);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v11, v15, 16);
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_addConflictLoserEtags_(self, v7, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }
}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
}

- (void).cxx_destruct
{
}

@end