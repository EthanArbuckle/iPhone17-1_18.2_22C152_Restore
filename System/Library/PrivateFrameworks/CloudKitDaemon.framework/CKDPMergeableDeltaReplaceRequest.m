@interface CKDPMergeableDeltaReplaceRequest
+ (Class)deltaIdentifiersType;
+ (Class)deltasType;
+ (id)options;
- (BOOL)containsNewData;
- (BOOL)hasContainsNewData;
- (BOOL)hasIdentifier;
- (BOOL)hasIgnoreMissingDeltas;
- (BOOL)ignoreMissingDeltas;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPMergeableValueIdentifier)identifier;
- (Class)responseClass;
- (NSMutableArray)deltaIdentifiers;
- (NSMutableArray)deltas;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltaIdentifiersAtIndex:(unint64_t)a3;
- (id)deltasAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deltaIdentifiersCount;
- (unint64_t)deltasCount;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)addDeltaIdentifiers:(id)a3;
- (void)addDeltas:(id)a3;
- (void)clearDeltaIdentifiers;
- (void)clearDeltas;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainsNewData:(BOOL)a3;
- (void)setDeltaIdentifiers:(id)a3;
- (void)setDeltas:(id)a3;
- (void)setHasContainsNewData:(BOOL)a3;
- (void)setHasIgnoreMissingDeltas:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreMissingDeltas:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPMergeableDeltaReplaceRequest

+ (id)options
{
  if (qword_1EBBCDDE0 != -1) {
    dispatch_once(&qword_1EBBCDDE0, &unk_1F20436B0);
  }
  v2 = (void *)qword_1EBBCDDD8;
  return v2;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)clearDeltaIdentifiers
{
  objc_msgSend_removeAllObjects(self->_deltaIdentifiers, a2, v2);
}

- (void)addDeltaIdentifiers:(id)a3
{
  v4 = (const char *)a3;
  deltaIdentifiers = self->_deltaIdentifiers;
  v8 = (char *)v4;
  if (!deltaIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_deltaIdentifiers;
    self->_deltaIdentifiers = v6;

    v4 = v8;
    deltaIdentifiers = self->_deltaIdentifiers;
  }
  objc_msgSend_addObject_(deltaIdentifiers, v4, (uint64_t)v4);
}

- (unint64_t)deltaIdentifiersCount
{
  return objc_msgSend_count(self->_deltaIdentifiers, a2, v2);
}

- (id)deltaIdentifiersAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_deltaIdentifiers, a2, a3);
}

+ (Class)deltaIdentifiersType
{
  return (Class)objc_opt_class();
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

- (void)setIgnoreMissingDeltas:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ignoreMissingDeltas = a3;
}

- (void)setHasIgnoreMissingDeltas:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIgnoreMissingDeltas
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setContainsNewData:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containsNewData = a3;
}

- (void)setHasContainsNewData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainsNewData
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPMergeableDeltaReplaceRequest;
  v4 = [(CKDPMergeableDeltaReplaceRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  identifier = self->_identifier;
  if (identifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(identifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"identifier");
  }
  deltaIdentifiers = self->_deltaIdentifiers;
  if (deltaIdentifiers) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)deltaIdentifiers, @"deltaIdentifiers");
  }
  if (objc_msgSend_count(self->_deltas, v4, (uint64_t)deltaIdentifiers))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_count(self->_deltas, v13, v14);
    v17 = objc_msgSend_initWithCapacity_(v12, v16, v15);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v18 = self->_deltas;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v35, v39, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v18);
          }
          v26 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v35 + 1) + 8 * i), v21, v22, (void)v35);
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v35, v39, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, @"deltas");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v30 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v11, self->_ignoreMissingDeltas);
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, @"ignoreMissingDeltas");

    char has = (char)self->_has;
  }
  if (has)
  {
    v32 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v11, self->_containsNewData);
    objc_msgSend_setObject_forKey_(v6, v33, (uint64_t)v32, @"containsNewData");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E75F58((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_deltaIdentifiers;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v24, v29, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v24, v29, 16);
    }
    while (v8);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = self->_deltas;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, v28, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v20, v28, 16);
    }
    while (v15);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteBOOLField();
  }
}

- (unsigned)requestTypeCode
{
  return 76;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  long long v26 = a3;
  identifier = self->_identifier;
  if (identifier) {
    objc_msgSend_setIdentifier_(v26, v4, (uint64_t)identifier);
  }
  if (objc_msgSend_deltaIdentifiersCount(self, v4, (uint64_t)identifier))
  {
    objc_msgSend_clearDeltaIdentifiers(v26, v6, v7);
    uint64_t v10 = objc_msgSend_deltaIdentifiersCount(self, v8, v9);
    if (v10)
    {
      uint64_t v11 = v10;
      for (uint64_t i = 0; i != v11; ++i)
      {
        v13 = objc_msgSend_deltaIdentifiersAtIndex_(self, v6, i);
        objc_msgSend_addDeltaIdentifiers_(v26, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_deltasCount(self, v6, v7))
  {
    objc_msgSend_clearDeltas(v26, v15, v16);
    uint64_t v19 = objc_msgSend_deltasCount(self, v17, v18);
    if (v19)
    {
      uint64_t v21 = v19;
      for (uint64_t j = 0; j != v21; ++j)
      {
        long long v23 = objc_msgSend_deltasAtIndex_(self, v20, j);
        objc_msgSend_addDeltas_(v26, v24, (uint64_t)v23);
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v26[33] = self->_ignoreMissingDeltas;
    v26[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v26[32] = self->_containsNewData;
    v26[36] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_identifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = self->_deltaIdentifiers;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v38, v43, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v39 != v19) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v38 + 1) + 8 * i), v17, (uint64_t)a3);
        objc_msgSend_addDeltaIdentifiers_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v38, v43, 16);
    }
    while (v18);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v23 = self->_deltas;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v34, v42, 16);
  if (v25)
  {
    uint64_t v27 = v25;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v23);
        }
        uint64_t v30 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v34 + 1) + 8 * j), v26, (uint64_t)a3, (void)v34);
        objc_msgSend_addDeltas_((void *)v10, v31, (uint64_t)v30);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v34, v42, 16);
    }
    while (v27);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 33) = self->_ignoreMissingDeltas;
    *(unsigned char *)(v10 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v10 + 32) = self->_containsNewData;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)identifier | v9)
  {
    if (!objc_msgSend_isEqual_(identifier, v7, v9)) {
      goto LABEL_18;
    }
  }
  deltaIdentifiers = self->_deltaIdentifiers;
  uint64_t v11 = v4[1];
  if ((unint64_t)deltaIdentifiers | v11)
  {
    if (!objc_msgSend_isEqual_(deltaIdentifiers, v7, v11)) {
      goto LABEL_18;
    }
  }
  deltas = self->_deltas;
  uint64_t v13 = v4[2];
  if ((unint64_t)deltas | v13)
  {
    if (!objc_msgSend_isEqual_(deltas, v7, v13)) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_18;
    }
    if (self->_ignoreMissingDeltas)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v14 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_containsNewData)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)v4 + 32))
      {
        goto LABEL_18;
      }
      BOOL v14 = 1;
      goto LABEL_19;
    }
LABEL_18:
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_identifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_deltaIdentifiers, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_deltas, v8, v9);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_ignoreMissingDeltas;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = 2654435761 * self->_containsNewData;
  return v7 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = *((id *)v5 + 1);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v27, v32, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addDeltaIdentifiers_(self, v11, *(void *)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v27, v32, 16);
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = *((id *)v5 + 2);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, v31, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend_addDeltas_(self, v18, *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v23, v31, 16);
    }
    while (v19);
  }

  char v22 = *((unsigned char *)v5 + 36);
  if ((v22 & 2) != 0)
  {
    self->_ignoreMissingDeltas = *((unsigned char *)v5 + 33);
    *(unsigned char *)&self->_has |= 2u;
    char v22 = *((unsigned char *)v5 + 36);
  }
  if (v22)
  {
    self->_containsNewData = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (CKDPMergeableValueIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)deltaIdentifiers
{
  return self->_deltaIdentifiers;
}

- (void)setDeltaIdentifiers:(id)a3
{
}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
}

- (BOOL)ignoreMissingDeltas
{
  return self->_ignoreMissingDeltas;
}

- (BOOL)containsNewData
{
  return self->_containsNewData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deltas, 0);
  objc_storeStrong((id *)&self->_deltaIdentifiers, 0);
}

@end