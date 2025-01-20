@interface CKDPShareVettingInitiateRequest
+ (id)options;
- (BOOL)hasBaseToken;
- (BOOL)hasEncryptedKey;
- (BOOL)hasParticipantId;
- (BOOL)hasShareId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPShareIdentifier)shareId;
- (Class)responseClass;
- (NSData)encryptedKey;
- (NSString)baseToken;
- (NSString)participantId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setParticipantId:(id)a3;
- (void)setShareId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShareVettingInitiateRequest

+ (id)options
{
  if (qword_1EBBCDF30 != -1) {
    dispatch_once(&qword_1EBBCDF30, &unk_1F2044CD0);
  }
  v2 = (void *)qword_1EBBCDF28;
  return v2;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEncryptedKey
{
  return self->_encryptedKey != 0;
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (BOOL)hasBaseToken
{
  return self->_baseToken != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareVettingInitiateRequest;
  v4 = [(CKDPShareVettingInitiateRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  shareId = self->_shareId;
  if (shareId)
  {
    v8 = objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"shareId");
  }
  encryptedKey = self->_encryptedKey;
  if (encryptedKey) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)encryptedKey, @"encryptedKey");
  }
  participantId = self->_participantId;
  if (participantId) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantId, @"participantId");
  }
  baseToken = self->_baseToken;
  if (baseToken) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)baseToken, @"baseToken");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C503E1D0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shareId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_encryptedKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_participantId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_baseToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 60;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  shareId = self->_shareId;
  id v10 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    id v4 = v10;
  }
  encryptedKey = self->_encryptedKey;
  if (encryptedKey)
  {
    objc_msgSend_setEncryptedKey_(v10, v5, (uint64_t)encryptedKey);
    id v4 = v10;
  }
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v10, v5, (uint64_t)participantId);
    id v4 = v10;
  }
  baseToken = self->_baseToken;
  if (baseToken)
  {
    objc_msgSend_setBaseToken_(v10, v5, (uint64_t)baseToken);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  v13 = (void *)v10[4];
  v10[4] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_encryptedKey, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_participantId, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_baseToken, v20, (uint64_t)a3);
  v22 = (void *)v10[1];
  v10[1] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((shareId = self->_shareId, uint64_t v9 = v4[4], !((unint64_t)shareId | v9))
     || objc_msgSend_isEqual_(shareId, v7, v9))
    && ((encryptedKey = self->_encryptedKey, uint64_t v11 = v4[2], !((unint64_t)encryptedKey | v11))
     || objc_msgSend_isEqual_(encryptedKey, v7, v11))
    && ((participantId = self->_participantId, uint64_t v13 = v4[3], !((unint64_t)participantId | v13))
     || objc_msgSend_isEqual_(participantId, v7, v13)))
  {
    baseToken = self->_baseToken;
    uint64_t v15 = v4[1];
    if ((unint64_t)baseToken | v15) {
      char isEqual = objc_msgSend_isEqual_(baseToken, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_shareId, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_encryptedKey, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_participantId, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_baseToken, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  shareId = self->_shareId;
  uint64_t v6 = v4[4];
  uint64_t v10 = v4;
  if (shareId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(shareId, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setShareId_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v10;
LABEL_7:
  uint64_t v7 = v4[2];
  if (v7)
  {
    objc_msgSend_setEncryptedKey_(self, (const char *)v4, v7);
    uint64_t v4 = v10;
  }
  uint64_t v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setParticipantId_(self, (const char *)v4, v8);
    uint64_t v4 = v10;
  }
  uint64_t v9 = v4[1];
  if (v9) {
    objc_msgSend_setBaseToken_(self, (const char *)v4, v9);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
}

@end