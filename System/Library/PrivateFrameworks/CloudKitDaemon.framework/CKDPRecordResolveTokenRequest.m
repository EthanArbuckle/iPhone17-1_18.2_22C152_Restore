@interface CKDPRecordResolveTokenRequest
+ (Class)rootRecordDesiredKeysType;
+ (id)options;
- (BOOL)forceFetch;
- (BOOL)hasForceFetch;
- (BOOL)hasParticipantId;
- (BOOL)hasRoutingKey;
- (BOOL)hasShortTokenHash;
- (BOOL)hasShouldFetchRootRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldFetchRootRecord;
- (Class)responseClass;
- (NSData)shortTokenHash;
- (NSMutableArray)rootRecordDesiredKeys;
- (NSString)participantId;
- (NSString)routingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rootRecordDesiredKeysAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rootRecordDesiredKeysCount;
- (unsigned)requestTypeCode;
- (void)addRootRecordDesiredKeys:(id)a3;
- (void)clearRootRecordDesiredKeys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setForceFetch:(BOOL)a3;
- (void)setHasForceFetch:(BOOL)a3;
- (void)setHasShouldFetchRootRecord:(BOOL)a3;
- (void)setParticipantId:(id)a3;
- (void)setRootRecordDesiredKeys:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setShortTokenHash:(id)a3;
- (void)setShouldFetchRootRecord:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordResolveTokenRequest

+ (id)options
{
  if (qword_1EBBCDD70 != -1) {
    dispatch_once(&qword_1EBBCDD70, &unk_1F20433D0);
  }
  v2 = (void *)qword_1EBBCDD68;
  return v2;
}

- (BOOL)hasRoutingKey
{
  return self->_routingKey != 0;
}

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (void)setForceFetch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_forceFetch = a3;
}

- (void)setHasForceFetch:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForceFetch
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)shouldFetchRootRecord
{
  return (*(unsigned char *)&self->_has & 2) == 0 || self->_shouldFetchRootRecord;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldFetchRootRecord = a3;
}

- (void)setHasShouldFetchRootRecord:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldFetchRootRecord
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearRootRecordDesiredKeys
{
  objc_msgSend_removeAllObjects(self->_rootRecordDesiredKeys, a2, v2);
}

- (void)addRootRecordDesiredKeys:(id)a3
{
  v4 = (const char *)a3;
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  v8 = (char *)v4;
  if (!rootRecordDesiredKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rootRecordDesiredKeys;
    self->_rootRecordDesiredKeys = v6;

    v4 = v8;
    rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  }
  objc_msgSend_addObject_(rootRecordDesiredKeys, v4, (uint64_t)v4);
}

- (unint64_t)rootRecordDesiredKeysCount
{
  return objc_msgSend_count(self->_rootRecordDesiredKeys, a2, v2);
}

- (id)rootRecordDesiredKeysAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_rootRecordDesiredKeys, a2, a3);
}

+ (Class)rootRecordDesiredKeysType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordResolveTokenRequest;
  v4 = [(CKDPRecordResolveTokenRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  routingKey = self->_routingKey;
  if (routingKey) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)routingKey, @"routingKey");
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)shortTokenHash, @"shortTokenHash");
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_forceFetch);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"forceFetch");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v12 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_shouldFetchRootRecord);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"shouldFetchRootRecord");
  }
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  if (rootRecordDesiredKeys) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)rootRecordDesiredKeys, @"rootRecordDesiredKeys");
  }
  participantId = self->_participantId;
  if (participantId) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)participantId, @"participantId");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E114E4(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_routingKey) {
    PBDataWriterWriteStringField();
  }
  if (self->_shortTokenHash) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_rootRecordDesiredKeys;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_participantId) {
    PBDataWriterWriteStringField();
  }
}

- (unsigned)requestTypeCode
{
  return 73;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  routingKey = self->_routingKey;
  v19 = v4;
  if (routingKey)
  {
    objc_msgSend_setRoutingKey_(v4, v5, (uint64_t)routingKey);
    id v4 = v19;
  }
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash)
  {
    objc_msgSend_setShortTokenHash_(v19, v5, (uint64_t)shortTokenHash);
    id v4 = v19;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[40] = self->_forceFetch;
    v4[44] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_shouldFetchRootRecord;
    v4[44] |= 2u;
  }
  if (objc_msgSend_rootRecordDesiredKeysCount(self, v5, (uint64_t)shortTokenHash))
  {
    objc_msgSend_clearRootRecordDesiredKeys(v19, v9, v10);
    uint64_t v13 = objc_msgSend_rootRecordDesiredKeysCount(self, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        long long v16 = objc_msgSend_rootRecordDesiredKeysAtIndex_(self, v9, i);
        objc_msgSend_addRootRecordDesiredKeys_(v19, v17, (uint64_t)v16);
      }
    }
  }
  participantId = self->_participantId;
  if (participantId) {
    objc_msgSend_setParticipantId_(v19, v9, (uint64_t)participantId);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_routingKey, v11, (uint64_t)a3);
  uint64_t v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v14, (uint64_t)a3);
  long long v16 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v15;

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v10 + 40) = self->_forceFetch;
    *(unsigned char *)(v10 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 41) = self->_shouldFetchRootRecord;
    *(unsigned char *)(v10 + 44) |= 2u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v18 = self->_rootRecordDesiredKeys;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v31, v35, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v18);
        }
        v25 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v31 + 1) + 8 * i), v21, (uint64_t)a3, (void)v31);
        objc_msgSend_addRootRecordDesiredKeys_((void *)v10, v26, (uint64_t)v25);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v31, v35, 16);
    }
    while (v22);
  }

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_participantId, v27, (uint64_t)a3);
  v29 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v28;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_26;
  }
  routingKey = self->_routingKey;
  uint64_t v9 = v4[3];
  if ((unint64_t)routingKey | v9)
  {
    if (!objc_msgSend_isEqual_(routingKey, v7, v9)) {
      goto LABEL_26;
    }
  }
  shortTokenHash = self->_shortTokenHash;
  uint64_t v11 = v4[4];
  if ((unint64_t)shortTokenHash | v11)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v11)) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0) {
      goto LABEL_26;
    }
    if (self->_forceFetch)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_shouldFetchRootRecord)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_22;
      }
    }
LABEL_26:
    char isEqual = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  uint64_t v13 = v4[2];
  if ((unint64_t)rootRecordDesiredKeys | v13
    && !objc_msgSend_isEqual_(rootRecordDesiredKeys, v7, v13))
  {
    goto LABEL_26;
  }
  participantId = self->_participantId;
  uint64_t v15 = v4[1];
  if ((unint64_t)participantId | v15) {
    char isEqual = objc_msgSend_isEqual_(participantId, v7, v15);
  }
  else {
    char isEqual = 1;
  }
LABEL_27:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_routingKey, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_shortTokenHash, v5, v6);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = 2654435761 * self->_forceFetch;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = 2654435761 * self->_shouldFetchRootRecord;
LABEL_6:
  uint64_t v12 = v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_rootRecordDesiredKeys, v8, v9);
  return v12 ^ objc_msgSend_hash(self->_participantId, v13, v14);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 3);
  if (v6) {
    objc_msgSend_setRoutingKey_(self, v4, v6);
  }
  uint64_t v7 = *((void *)v5 + 4);
  if (v7) {
    objc_msgSend_setShortTokenHash_(self, v4, v7);
  }
  char v8 = *((unsigned char *)v5 + 44);
  if (v8)
  {
    self->_forceFetch = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_has |= 1u;
    char v8 = *((unsigned char *)v5 + 44);
  }
  if ((v8 & 2) != 0)
  {
    self->_shouldFetchRootRecord = *((unsigned char *)v5 + 41);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *((id *)v5 + 2);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v18, v22, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addRootRecordDesiredKeys_(self, v12, *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v18, v22, 16);
    }
    while (v13);
  }

  uint64_t v17 = *((void *)v5 + 1);
  if (v17) {
    objc_msgSend_setParticipantId_(self, v16, v17);
  }
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
}

- (BOOL)forceFetch
{
  return self->_forceFetch;
}

- (NSMutableArray)rootRecordDesiredKeys
{
  return self->_rootRecordDesiredKeys;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
}

@end