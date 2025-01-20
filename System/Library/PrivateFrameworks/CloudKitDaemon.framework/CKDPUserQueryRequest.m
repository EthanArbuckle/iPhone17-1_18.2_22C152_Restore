@interface CKDPUserQueryRequest
+ (Class)sortedByType;
+ (id)options;
- (BOOL)hasAlias;
- (BOOL)hasOBSOLETEPcsServiceType;
- (BOOL)hasPublicKeyRequested;
- (BOOL)isEqual:(id)a3;
- (BOOL)publicKeyRequested;
- (BOOL)readFrom:(id)a3;
- (CKDPUserAlias)alias;
- (Class)responseClass;
- (NSMutableArray)sortedBys;
- (NSString)oBSOLETEPcsServiceType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sortedByAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sortedBysCount;
- (unsigned)requestTypeCode;
- (void)addSortedBy:(id)a3;
- (void)clearSortedBys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlias:(id)a3;
- (void)setHasPublicKeyRequested:(BOOL)a3;
- (void)setOBSOLETEPcsServiceType:(id)a3;
- (void)setPublicKeyRequested:(BOOL)a3;
- (void)setSortedBys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserQueryRequest

+ (id)options
{
  if (qword_1EBBCDDA0 != -1) {
    dispatch_once(&qword_1EBBCDDA0, &unk_1F2043490);
  }
  v2 = (void *)qword_1EBBCDD98;
  return v2;
}

- (BOOL)hasAlias
{
  return self->_alias != 0;
}

- (void)clearSortedBys
{
  objc_msgSend_removeAllObjects(self->_sortedBys, a2, v2);
}

- (void)addSortedBy:(id)a3
{
  v4 = (const char *)a3;
  sortedBys = self->_sortedBys;
  v8 = (char *)v4;
  if (!sortedBys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sortedBys;
    self->_sortedBys = v6;

    v4 = v8;
    sortedBys = self->_sortedBys;
  }
  objc_msgSend_addObject_(sortedBys, v4, (uint64_t)v4);
}

- (unint64_t)sortedBysCount
{
  return objc_msgSend_count(self->_sortedBys, a2, v2);
}

- (id)sortedByAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_sortedBys, a2, a3);
}

+ (Class)sortedByType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOBSOLETEPcsServiceType
{
  return self->_oBSOLETEPcsServiceType != 0;
}

- (BOOL)publicKeyRequested
{
  return (*(unsigned char *)&self->_has & 1) != 0 && self->_publicKeyRequested;
}

- (void)setPublicKeyRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_publicKeyRequested = a3;
}

- (void)setHasPublicKeyRequested:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublicKeyRequested
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserQueryRequest;
  v4 = [(CKDPUserQueryRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  alias = self->_alias;
  if (alias)
  {
    v8 = objc_msgSend_dictionaryRepresentation(alias, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"alias");
  }
  if (objc_msgSend_count(self->_sortedBys, v4, v5))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = objc_msgSend_count(self->_sortedBys, v12, v13);
    v16 = objc_msgSend_initWithCapacity_(v11, v15, v14);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v17 = self->_sortedBys;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v32, v36, 16);
    if (v19)
    {
      uint64_t v22 = v19;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v17);
          }
          v25 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v32 + 1) + 8 * i), v20, v21, (void)v32);
          objc_msgSend_addObject_(v16, v26, (uint64_t)v25);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v32, v36, 16);
      }
      while (v22);
    }

    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v16, @"sortedBy");
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  if (oBSOLETEPcsServiceType) {
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)oBSOLETEPcsServiceType, @"OBSOLETE_pcsServiceType");
  }
  if (*(unsigned char *)&self->_has)
  {
    v29 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v10, self->_publicKeyRequested);
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, @"publicKeyRequested");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E37A78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_alias) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_sortedBys;
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

  if (self->_oBSOLETEPcsServiceType) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (unsigned)requestTypeCode
{
  return 44;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  v16 = a3;
  alias = self->_alias;
  if (alias) {
    objc_msgSend_setAlias_(v16, v4, (uint64_t)alias);
  }
  if (objc_msgSend_sortedBysCount(self, v4, (uint64_t)alias))
  {
    objc_msgSend_clearSortedBys(v16, v6, v7);
    uint64_t v10 = objc_msgSend_sortedBysCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        long long v13 = objc_msgSend_sortedByAtIndex_(self, v6, i);
        objc_msgSend_addSortedBy_(v16, v14, (uint64_t)v13);
      }
    }
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  if (oBSOLETEPcsServiceType) {
    objc_msgSend_setOBSOLETEPcsServiceType_(v16, v6, (uint64_t)oBSOLETEPcsServiceType);
  }
  if (*(unsigned char *)&self->_has)
  {
    v16[32] = self->_publicKeyRequested;
    v16[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_alias, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v14 = self->_sortedBys;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, (void)v27);
        objc_msgSend_addSortedBy_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_oBSOLETEPcsServiceType, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 32) = self->_publicKeyRequested;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_10;
  }
  alias = self->_alias;
  uint64_t v9 = v4[1];
  if ((unint64_t)alias | v9)
  {
    if (!objc_msgSend_isEqual_(alias, v7, v9)) {
      goto LABEL_10;
    }
  }
  sortedBys = self->_sortedBys;
  uint64_t v11 = v4[3];
  if ((unint64_t)sortedBys | v11)
  {
    if (!objc_msgSend_isEqual_(sortedBys, v7, v11)) {
      goto LABEL_10;
    }
  }
  oBSOLETEPcsServiceType = self->_oBSOLETEPcsServiceType;
  uint64_t v13 = v4[2];
  if ((unint64_t)oBSOLETEPcsServiceType | v13)
  {
    if (!objc_msgSend_isEqual_(oBSOLETEPcsServiceType, v7, v13)) {
      goto LABEL_10;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v14 = 0;
      goto LABEL_11;
    }
    if (self->_publicKeyRequested)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v14 = 1;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_alias, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_sortedBys, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_oBSOLETEPcsServiceType, v8, v9);
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_publicKeyRequested;
  }
  else {
    uint64_t v11 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  alias = self->_alias;
  uint64_t v7 = *((void *)v5 + 1);
  if (alias)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(alias, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setAlias_(self, v4, v7);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = *((id *)v5 + 3);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, v21, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addSortedBy_(self, v11, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v17, v21, 16);
    }
    while (v12);
  }

  uint64_t v16 = *((void *)v5 + 2);
  if (v16) {
    objc_msgSend_setOBSOLETEPcsServiceType_(self, v15, v16);
  }
  if (*((unsigned char *)v5 + 36))
  {
    self->_publicKeyRequested = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (CKDPUserAlias)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
}

- (NSMutableArray)sortedBys
{
  return self->_sortedBys;
}

- (void)setSortedBys:(id)a3
{
}

- (NSString)oBSOLETEPcsServiceType
{
  return self->_oBSOLETEPcsServiceType;
}

- (void)setOBSOLETEPcsServiceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedBys, 0);
  objc_storeStrong((id *)&self->_oBSOLETEPcsServiceType, 0);
  objc_storeStrong((id *)&self->_alias, 0);
}

@end