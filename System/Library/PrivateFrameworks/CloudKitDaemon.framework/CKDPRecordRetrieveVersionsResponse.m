@interface CKDPRecordRetrieveVersionsResponse
+ (Class)recordVersionsType;
- (BOOL)hasIsDeleted;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recordVersions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recordVersionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recordVersionsCount;
- (void)addRecordVersions:(id)a3;
- (void)clearRecordVersions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsDeleted:(BOOL)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setRecordVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveVersionsResponse

- (void)setIsDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isDeleted = a3;
}

- (void)setHasIsDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsDeleted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearRecordVersions
{
  objc_msgSend_removeAllObjects(self->_recordVersions, a2, v2);
}

- (void)addRecordVersions:(id)a3
{
  v4 = (const char *)a3;
  recordVersions = self->_recordVersions;
  v8 = (char *)v4;
  if (!recordVersions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_recordVersions;
    self->_recordVersions = v6;

    v4 = v8;
    recordVersions = self->_recordVersions;
  }
  objc_msgSend_addObject_(recordVersions, v4, (uint64_t)v4);
}

- (unint64_t)recordVersionsCount
{
  return objc_msgSend_count(self->_recordVersions, a2, v2);
}

- (id)recordVersionsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_recordVersions, a2, a3);
}

+ (Class)recordVersionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveVersionsResponse;
  v4 = [(CKDPRecordRetrieveVersionsResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_isDeleted);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"isDeleted");
  }
  if (objc_msgSend_count(self->_recordVersions, v4, v5))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(self->_recordVersions, v10, v11);
    v14 = objc_msgSend_initWithCapacity_(v9, v13, v12);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v15 = self->_recordVersions;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v27, v31, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v27 + 1) + 8 * i), v18, v19, (void)v27);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v27, v31, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v14, @"recordVersions");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E57B78(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_recordVersions;
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
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_isDeleted;
    v4[20] |= 1u;
  }
  id v17 = v4;
  if (objc_msgSend_recordVersionsCount(self, v5, v6))
  {
    objc_msgSend_clearRecordVersions(v17, v7, v8);
    uint64_t v11 = objc_msgSend_recordVersionsCount(self, v9, v10);
    if (v11)
    {
      uint64_t v13 = v11;
      for (uint64_t i = 0; i != v13; ++i)
      {
        long long v15 = objc_msgSend_recordVersionsAtIndex_(self, v12, i);
        objc_msgSend_addRecordVersions_(v17, v16, (uint64_t)v15);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v11 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 16) = self->_isDeleted;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v12 = self->_recordVersions;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v22, v26, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v22 + 1) + 8 * v18), v15, (uint64_t)a3, (void)v22);
        objc_msgSend_addRecordVersions_(v11, v20, (uint64_t)v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v22, v26, 16);
    }
    while (v16);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_isDeleted)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char isEqual = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  recordVersions = self->_recordVersions;
  uint64_t v11 = v4[1];
  if ((unint64_t)recordVersions | v11) {
    char isEqual = objc_msgSend_isEqual_(recordVersions, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_7:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isDeleted;
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_recordVersions, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_isDeleted = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend_addRecordVersions_(self, v9, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v13, v17, 16);
    }
    while (v10);
  }
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (NSMutableArray)recordVersions
{
  return self->_recordVersions;
}

- (void)setRecordVersions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end