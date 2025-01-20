@interface CKDPRecordRetrieveChangesResponseShareChange
- (BOOL)hasChangeType;
- (BOOL)hasShare;
- (BOOL)hasShareIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPShare)share;
- (CKDPShareIdentifier)shareIdentifier;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChangeType:(id)a3;
- (int)changeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setHasChangeType:(BOOL)a3;
- (void)setShare:(id)a3;
- (void)setShareIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveChangesResponseShareChange

- (BOOL)hasShareIdentifier
{
  return self->_shareIdentifier != 0;
}

- (int)changeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_changeType;
  }
  else {
    return 1;
  }
}

- (void)setChangeType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F6658[a3 - 1];
  }
  return v3;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"idAndEtag"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"fullRecord"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"recordDeleted"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasShare
{
  return self->_share != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveChangesResponseShareChange;
  v4 = [(CKDPRecordRetrieveChangesResponseShareChange *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(shareIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"shareIdentifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v10 = self->_changeType - 1;
    if (v10 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_changeType);
      objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v11 = off_1E64F6658[v10];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v11, @"changeType");
  }
  share = self->_share;
  if (share)
  {
    v13 = objc_msgSend_dictionaryRepresentation(share, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"share");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F2EA74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_shareIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_share)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  shareIdentifier = self->_shareIdentifier;
  id v8 = v4;
  if (shareIdentifier)
  {
    objc_msgSend_setShareIdentifier_(v4, v5, (uint64_t)shareIdentifier);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_changeType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  share = self->_share;
  if (share)
  {
    objc_msgSend_setShare_(v8, v5, (uint64_t)share);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_shareIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 8) = self->_changeType;
    *(unsigned char *)(v10 + 32) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_share, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_11;
  }
  shareIdentifier = self->_shareIdentifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)shareIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(shareIdentifier, v7, v9)) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_changeType != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (v4[4])
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  share = self->_share;
  uint64_t v11 = v4[2];
  if ((unint64_t)share | v11) {
    char isEqual = objc_msgSend_isEqual_(share, v7, v11);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_shareIdentifier, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_changeType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ objc_msgSend_hash(self->_share, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  shareIdentifier = self->_shareIdentifier;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (shareIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(shareIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setShareIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 32))
  {
    self->_changeType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  share = self->_share;
  uint64_t v8 = *((void *)v4 + 2);
  if (share)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(share, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setShare_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPShareIdentifier)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (CKDPShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end