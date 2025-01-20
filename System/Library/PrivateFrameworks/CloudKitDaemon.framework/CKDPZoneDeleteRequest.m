@interface CKDPZoneDeleteRequest
+ (id)options;
- (BOOL)hasAncestryEtag;
- (BOOL)hasLastMissingManateeIdentityErrorDate;
- (BOOL)hasUserPurge;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userPurge;
- (CKDPAncestryEtag)ancestryEtag;
- (CKDPDate)lastMissingManateeIdentityErrorDate;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (Class)responseClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAncestryEtag:(id)a3;
- (void)setHasUserPurge:(BOOL)a3;
- (void)setLastMissingManateeIdentityErrorDate:(id)a3;
- (void)setUserPurge:(BOOL)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneDeleteRequest

+ (id)options
{
  if (qword_1EBBCDD50 != -1) {
    dispatch_once(&qword_1EBBCDD50, &unk_1F20432B0);
  }
  v2 = (void *)qword_1EBBCDD48;
  return v2;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (void)setUserPurge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_userPurge = a3;
}

- (void)setHasUserPurge:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserPurge
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate != 0;
}

- (BOOL)hasAncestryEtag
{
  return self->_ancestryEtag != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneDeleteRequest;
  v4 = [(CKDPZoneDeleteRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_userPurge);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"userPurge");
  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  if (lastMissingManateeIdentityErrorDate)
  {
    v13 = objc_msgSend_dictionaryRepresentation(lastMissingManateeIdentityErrorDate, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"lastMissingManateeIdentityErrorDate");
  }
  ancestryEtag = self->_ancestryEtag;
  if (ancestryEtag)
  {
    v16 = objc_msgSend_dictionaryRepresentation(ancestryEtag, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"ancestryEtag");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E03198((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_lastMissingManateeIdentityErrorDate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_ancestryEtag)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 10;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v9 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_userPurge;
    v4[36] |= 1u;
  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  if (lastMissingManateeIdentityErrorDate)
  {
    objc_msgSend_setLastMissingManateeIdentityErrorDate_(v9, v5, (uint64_t)lastMissingManateeIdentityErrorDate);
    id v4 = v9;
  }
  ancestryEtag = self->_ancestryEtag;
  if (ancestryEtag)
  {
    objc_msgSend_setAncestryEtag_(v9, v5, (uint64_t)ancestryEtag);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 32) = self->_userPurge;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_lastMissingManateeIdentityErrorDate, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_ancestryEtag, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v18;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_16;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[3];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_userPurge)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    char isEqual = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_12:
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  uint64_t v11 = v4[2];
  if ((unint64_t)lastMissingManateeIdentityErrorDate | v11
    && !objc_msgSend_isEqual_(lastMissingManateeIdentityErrorDate, v7, v11))
  {
    goto LABEL_16;
  }
  ancestryEtag = self->_ancestryEtag;
  uint64_t v13 = v4[1];
  if ((unint64_t)ancestryEtag | v13) {
    char isEqual = objc_msgSend_isEqual_(ancestryEtag, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_17:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_userPurge;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 ^ v4;
  uint64_t v9 = objc_msgSend_hash(self->_lastMissingManateeIdentityErrorDate, v5, v6);
  return v8 ^ v9 ^ objc_msgSend_hash(self->_ancestryEtag, v10, v11);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = *((void *)v4 + 3);
  id v11 = v4;
  if (zoneIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v11;
LABEL_7:
  if (*((unsigned char *)v4 + 36))
  {
    self->_userPurge = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  lastMissingManateeIdentityErrorDate = self->_lastMissingManateeIdentityErrorDate;
  uint64_t v8 = *((void *)v4 + 2);
  if (lastMissingManateeIdentityErrorDate)
  {
    if (!v8) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(lastMissingManateeIdentityErrorDate, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    objc_msgSend_setLastMissingManateeIdentityErrorDate_(self, (const char *)v4, v8);
  }
  id v4 = v11;
LABEL_15:
  ancestryEtag = self->_ancestryEtag;
  uint64_t v10 = *((void *)v4 + 1);
  if (ancestryEtag)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(ancestryEtag, (const char *)v4, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setAncestryEtag_(self, (const char *)v4, v10);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (BOOL)userPurge
{
  return self->_userPurge;
}

- (CKDPDate)lastMissingManateeIdentityErrorDate
{
  return self->_lastMissingManateeIdentityErrorDate;
}

- (void)setLastMissingManateeIdentityErrorDate:(id)a3
{
}

- (CKDPAncestryEtag)ancestryEtag
{
  return self->_ancestryEtag;
}

- (void)setAncestryEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_lastMissingManateeIdentityErrorDate, 0);
  objc_storeStrong((id *)&self->_ancestryEtag, 0);
}

@end