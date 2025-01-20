@interface CKDPRecordOneTimeStableUrl
+ (Class)participantIdType;
- (BOOL)hasCreatedTime;
- (BOOL)hasEncryptedFullTokenInfo;
- (BOOL)hasProtectedFullToken;
- (BOOL)hasShortTokenHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedFullTokenInfo;
- (NSData)protectedFullToken;
- (NSData)shortTokenHash;
- (NSMutableArray)participantIds;
- (double)createdTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)participantIdAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)participantIdsCount;
- (void)addParticipantId:(id)a3;
- (void)clearParticipantIds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreatedTime:(double)a3;
- (void)setEncryptedFullTokenInfo:(id)a3;
- (void)setHasCreatedTime:(BOOL)a3;
- (void)setParticipantIds:(id)a3;
- (void)setProtectedFullToken:(id)a3;
- (void)setShortTokenHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordOneTimeStableUrl

- (BOOL)hasShortTokenHash
{
  return self->_shortTokenHash != 0;
}

- (BOOL)hasProtectedFullToken
{
  return self->_protectedFullToken != 0;
}

- (BOOL)hasEncryptedFullTokenInfo
{
  return self->_encryptedFullTokenInfo != 0;
}

- (void)clearParticipantIds
{
  objc_msgSend_removeAllObjects(self->_participantIds, a2, v2);
}

- (void)addParticipantId:(id)a3
{
  v4 = (const char *)a3;
  participantIds = self->_participantIds;
  v8 = (char *)v4;
  if (!participantIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_participantIds;
    self->_participantIds = v6;

    v4 = v8;
    participantIds = self->_participantIds;
  }
  objc_msgSend_addObject_(participantIds, v4, (uint64_t)v4);
}

- (unint64_t)participantIdsCount
{
  return objc_msgSend_count(self->_participantIds, a2, v2);
}

- (id)participantIdAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_participantIds, a2, a3);
}

+ (Class)participantIdType
{
  return (Class)objc_opt_class();
}

- (void)setCreatedTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_createdTime = a3;
}

- (void)setHasCreatedTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordOneTimeStableUrl;
  v4 = [(CKDPRecordOneTimeStableUrl *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)shortTokenHash, @"shortTokenHash");
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)protectedFullToken, @"protectedFullToken");
  }
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  if (encryptedFullTokenInfo) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)encryptedFullTokenInfo, @"encryptedFullTokenInfo");
  }
  participantIds = self->_participantIds;
  if (participantIds) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)participantIds, @"participantId");
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v11 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v5, (uint64_t)participantIds, self->_createdTime);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"createdTime");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordOneTimeStableUrlReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_shortTokenHash) {
    PBDataWriterWriteDataField();
  }
  if (self->_protectedFullToken) {
    PBDataWriterWriteDataField();
  }
  if (self->_encryptedFullTokenInfo) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_participantIds;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v18 = a3;
  shortTokenHash = self->_shortTokenHash;
  if (shortTokenHash) {
    objc_msgSend_setShortTokenHash_(v18, v4, (uint64_t)shortTokenHash);
  }
  protectedFullToken = self->_protectedFullToken;
  if (protectedFullToken) {
    objc_msgSend_setProtectedFullToken_(v18, v4, (uint64_t)protectedFullToken);
  }
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  if (encryptedFullTokenInfo) {
    objc_msgSend_setEncryptedFullTokenInfo_(v18, v4, (uint64_t)encryptedFullTokenInfo);
  }
  if (objc_msgSend_participantIdsCount(self, v4, (uint64_t)encryptedFullTokenInfo))
  {
    objc_msgSend_clearParticipantIds(v18, v8, v9);
    uint64_t v12 = objc_msgSend_participantIdsCount(self, v10, v11);
    if (v12)
    {
      uint64_t v14 = v12;
      for (uint64_t i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_participantIdAtIndex_(self, v13, i);
        objc_msgSend_addParticipantId_(v18, v17, (uint64_t)v16);
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v18 + 1) = *(void *)&self->_createdTime;
    *((unsigned char *)v18 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_shortTokenHash, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_protectedFullToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_encryptedFullTokenInfo, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v18;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v20 = self->_participantIds;
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
        v27 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v30 + 1) + 8 * v26), v23, (uint64_t)a3, (void)v30);
        objc_msgSend_addParticipantId_((void *)v10, v28, (uint64_t)v27);

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v30, v34, 16);
    }
    while (v24);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v10 + 8) = self->_createdTime;
    *(unsigned char *)(v10 + 48) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_14;
  }
  shortTokenHash = self->_shortTokenHash;
  uint64_t v9 = v4[5];
  if ((unint64_t)shortTokenHash | v9)
  {
    if (!objc_msgSend_isEqual_(shortTokenHash, v7, v9)) {
      goto LABEL_14;
    }
  }
  protectedFullToken = self->_protectedFullToken;
  uint64_t v11 = v4[4];
  if ((unint64_t)protectedFullToken | v11)
  {
    if (!objc_msgSend_isEqual_(protectedFullToken, v7, v11)) {
      goto LABEL_14;
    }
  }
  encryptedFullTokenInfo = self->_encryptedFullTokenInfo;
  uint64_t v13 = v4[2];
  if ((unint64_t)encryptedFullTokenInfo | v13)
  {
    if (!objc_msgSend_isEqual_(encryptedFullTokenInfo, v7, v13)) {
      goto LABEL_14;
    }
  }
  participantIds = self->_participantIds;
  uint64_t v15 = v4[3];
  if ((unint64_t)participantIds | v15)
  {
    if (!objc_msgSend_isEqual_(participantIds, v7, v15)) {
      goto LABEL_14;
    }
  }
  BOOL v16 = (v4[6] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[6] & 1) != 0 && self->_createdTime == *((double *)v4 + 1))
    {
      BOOL v16 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v16 = 0;
  }
LABEL_15:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_shortTokenHash, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_protectedFullToken, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_encryptedFullTokenInfo, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_participantIds, v11, v12);
  if (*(unsigned char *)&self->_has)
  {
    double createdTime = self->_createdTime;
    double v16 = -createdTime;
    if (createdTime >= 0.0) {
      double v16 = self->_createdTime;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v7 ^ v4 ^ v10 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 5);
  if (v6) {
    objc_msgSend_setShortTokenHash_(self, v4, v6);
  }
  uint64_t v7 = *((void *)v5 + 4);
  if (v7) {
    objc_msgSend_setProtectedFullToken_(self, v4, v7);
  }
  uint64_t v8 = *((void *)v5 + 2);
  if (v8) {
    objc_msgSend_setEncryptedFullTokenInfo_(self, v4, v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *((id *)v5 + 3);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v16, v20, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend_addParticipantId_(self, v12, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v16, v20, 16);
    }
    while (v13);
  }

  if (*((unsigned char *)v5 + 48))
  {
    self->_double createdTime = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)shortTokenHash
{
  return self->_shortTokenHash;
}

- (void)setShortTokenHash:(id)a3
{
}

- (NSData)protectedFullToken
{
  return self->_protectedFullToken;
}

- (void)setProtectedFullToken:(id)a3
{
}

- (NSData)encryptedFullTokenInfo
{
  return self->_encryptedFullTokenInfo;
}

- (void)setEncryptedFullTokenInfo:(id)a3
{
}

- (NSMutableArray)participantIds
{
  return self->_participantIds;
}

- (void)setParticipantIds:(id)a3
{
}

- (double)createdTime
{
  return self->_createdTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortTokenHash, 0);
  objc_storeStrong((id *)&self->_protectedFullToken, 0);
  objc_storeStrong((id *)&self->_participantIds, 0);
  objc_storeStrong((id *)&self->_encryptedFullTokenInfo, 0);
}

@end