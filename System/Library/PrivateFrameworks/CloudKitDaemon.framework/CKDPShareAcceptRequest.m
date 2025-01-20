@interface CKDPShareAcceptRequest
+ (id)options;
- (BOOL)acceptedInProcess;
- (BOOL)hasAcceptedInProcess;
- (BOOL)hasEtag;
- (BOOL)hasParticipantId;
- (BOOL)hasProtectionInfo;
- (BOOL)hasPublicKey;
- (BOOL)hasPublicKeyVersion;
- (BOOL)hasSelfAddedPcs;
- (BOOL)hasShareId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPProtectionInfo)protectionInfo;
- (CKDPProtectionInfo)publicKey;
- (CKDPProtectionInfo)selfAddedPcs;
- (CKDPShareIdentifier)shareId;
- (Class)responseClass;
- (NSString)etag;
- (NSString)participantId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)publicKeyVersion;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAcceptedInProcess:(BOOL)a3;
- (void)setEtag:(id)a3;
- (void)setHasAcceptedInProcess:(BOOL)a3;
- (void)setHasPublicKeyVersion:(BOOL)a3;
- (void)setParticipantId:(id)a3;
- (void)setProtectionInfo:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyVersion:(int)a3;
- (void)setSelfAddedPcs:(id)a3;
- (void)setShareId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShareAcceptRequest

+ (id)options
{
  if (qword_1EBBCDE10 != -1) {
    dispatch_once(&qword_1EBBCDE10, &unk_1F20437D0);
  }
  v2 = (void *)qword_1EBBCDE08;
  return v2;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasSelfAddedPcs
{
  return self->_selfAddedPcs != 0;
}

- (BOOL)hasPublicKey
{
  return self->_publicKey != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasParticipantId
{
  return self->_participantId != 0;
}

- (int)publicKeyVersion
{
  if (*(unsigned char *)&self->_has) {
    return self->_publicKeyVersion;
  }
  else {
    return 1;
  }
}

- (void)setPublicKeyVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_publicKeyVersion = a3;
}

- (void)setHasPublicKeyVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPublicKeyVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAcceptedInProcess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_acceptedInProcess = a3;
}

- (void)setHasAcceptedInProcess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAcceptedInProcess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareAcceptRequest;
  v4 = [(CKDPShareAcceptRequest *)&v11 description];
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
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, @"etag");
  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    v12 = objc_msgSend_dictionaryRepresentation(selfAddedPcs, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"selfAddedPcs");
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v15 = objc_msgSend_dictionaryRepresentation(publicKey, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"publicKey");
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    v18 = objc_msgSend_dictionaryRepresentation(protectionInfo, v4, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"protectionInfo");
  }
  participantId = self->_participantId;
  if (participantId) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantId, @"participantId");
  }
  char has = (char)self->_has;
  if (has)
  {
    v22 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_publicKeyVersion);
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, @"publicKeyVersion");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v24 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_acceptedInProcess);
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, @"acceptedInProcess");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E8D980((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_shareId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_selfAddedPcs)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_publicKey)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_protectionInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_participantId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (unsigned)requestTypeCode
{
  return 56;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  shareId = self->_shareId;
  id v13 = v4;
  if (shareId)
  {
    objc_msgSend_setShareId_(v4, v5, (uint64_t)shareId);
    id v4 = v13;
  }
  etag = self->_etag;
  if (etag)
  {
    objc_msgSend_setEtag_(v13, v5, (uint64_t)etag);
    id v4 = v13;
  }
  selfAddedPcs = self->_selfAddedPcs;
  if (selfAddedPcs)
  {
    objc_msgSend_setSelfAddedPcs_(v13, v5, (uint64_t)selfAddedPcs);
    id v4 = v13;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend_setPublicKey_(v13, v5, (uint64_t)publicKey);
    id v4 = v13;
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_setProtectionInfo_(v13, v5, (uint64_t)protectionInfo);
    id v4 = v13;
  }
  participantId = self->_participantId;
  if (participantId)
  {
    objc_msgSend_setParticipantId_(v13, v5, (uint64_t)participantId);
    id v4 = v13;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = self->_publicKeyVersion;
    *((unsigned char *)v4 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_acceptedInProcess;
    *((unsigned char *)v4 + 68) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_shareId, v11, (uint64_t)a3);
  id v13 = *(void **)(v10 + 56);
  *(void *)(v10 + 56) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_selfAddedPcs, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_publicKey, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_protectionInfo, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v24;

  uint64_t v27 = objc_msgSend_copyWithZone_(self->_participantId, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v27;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 40) = self->_publicKeyVersion;
    *(unsigned char *)(v10 + 68) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 64) = self->_acceptedInProcess;
    *(unsigned char *)(v10 + 68) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  shareId = self->_shareId;
  uint64_t v9 = v4[7];
  if ((unint64_t)shareId | v9)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v9)) {
      goto LABEL_21;
    }
  }
  etag = self->_etag;
  uint64_t v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11)) {
      goto LABEL_21;
    }
  }
  selfAddedPcs = self->_selfAddedPcs;
  uint64_t v13 = v4[6];
  if ((unint64_t)selfAddedPcs | v13)
  {
    if (!objc_msgSend_isEqual_(selfAddedPcs, v7, v13)) {
      goto LABEL_21;
    }
  }
  publicKey = self->_publicKey;
  uint64_t v15 = v4[4];
  if ((unint64_t)publicKey | v15)
  {
    if (!objc_msgSend_isEqual_(publicKey, v7, v15)) {
      goto LABEL_21;
    }
  }
  protectionInfo = self->_protectionInfo;
  uint64_t v17 = v4[3];
  if ((unint64_t)protectionInfo | v17)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v17)) {
      goto LABEL_21;
    }
  }
  participantId = self->_participantId;
  uint64_t v19 = v4[2];
  if ((unint64_t)participantId | v19)
  {
    if (!objc_msgSend_isEqual_(participantId, v7, v19)) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_publicKeyVersion != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_21;
  }
  BOOL v20 = (*((unsigned char *)v4 + 68) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0)
    {
LABEL_21:
      BOOL v20 = 0;
      goto LABEL_22;
    }
    if (self->_acceptedInProcess)
    {
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 64))
    {
      goto LABEL_21;
    }
    BOOL v20 = 1;
  }
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_shareId, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_etag, v5, v6);
  uint64_t v10 = objc_msgSend_hash(self->_selfAddedPcs, v8, v9);
  uint64_t v13 = objc_msgSend_hash(self->_publicKey, v11, v12);
  uint64_t v16 = objc_msgSend_hash(self->_protectionInfo, v14, v15);
  uint64_t v19 = objc_msgSend_hash(self->_participantId, v17, v18);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v20 = 2654435761 * self->_publicKeyVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v20 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v21 = 2654435761 * self->_acceptedInProcess;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  shareId = self->_shareId;
  uint64_t v6 = *((void *)v4 + 7);
  id v16 = v4;
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
  id v4 = v16;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v7);
    id v4 = v16;
  }
  selfAddedPcs = self->_selfAddedPcs;
  uint64_t v9 = *((void *)v4 + 6);
  if (selfAddedPcs)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(selfAddedPcs, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setSelfAddedPcs_(self, (const char *)v4, v9);
  }
  id v4 = v16;
LABEL_15:
  publicKey = self->_publicKey;
  uint64_t v11 = *((void *)v4 + 4);
  if (publicKey)
  {
    if (!v11) {
      goto LABEL_21;
    }
    objc_msgSend_mergeFrom_(publicKey, (const char *)v4, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    objc_msgSend_setPublicKey_(self, (const char *)v4, v11);
  }
  id v4 = v16;
LABEL_21:
  protectionInfo = self->_protectionInfo;
  uint64_t v13 = *((void *)v4 + 3);
  if (protectionInfo)
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_mergeFrom_(protectionInfo, (const char *)v4, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_setProtectionInfo_(self, (const char *)v4, v13);
  }
  id v4 = v16;
LABEL_27:
  uint64_t v14 = *((void *)v4 + 2);
  if (v14)
  {
    objc_msgSend_setParticipantId_(self, (const char *)v4, v14);
    id v4 = v16;
  }
  char v15 = *((unsigned char *)v4 + 68);
  if (v15)
  {
    self->_publicKeyVersion = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v15 = *((unsigned char *)v4 + 68);
  }
  if ((v15 & 2) != 0)
  {
    self->_acceptedInProcess = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 2u;
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

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPProtectionInfo)selfAddedPcs
{
  return self->_selfAddedPcs;
}

- (void)setSelfAddedPcs:(id)a3
{
}

- (CKDPProtectionInfo)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
}

- (BOOL)acceptedInProcess
{
  return self->_acceptedInProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_selfAddedPcs, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_participantId, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end