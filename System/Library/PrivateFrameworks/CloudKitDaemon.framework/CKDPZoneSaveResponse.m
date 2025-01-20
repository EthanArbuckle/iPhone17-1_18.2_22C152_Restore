@interface CKDPZoneSaveResponse
- (BOOL)expired;
- (BOOL)hasCapabilities;
- (BOOL)hasExpirationTime;
- (BOOL)hasExpired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)expirationTime;
- (CKDPZoneCapabilities)capabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setExpirationTime:(id)a3;
- (void)setExpired:(BOOL)a3;
- (void)setHasExpired:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneSaveResponse

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpired
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneSaveResponse;
  v4 = [(CKDPZoneSaveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  capabilities = self->_capabilities;
  if (capabilities)
  {
    v8 = objc_msgSend_dictionaryRepresentation(capabilities, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"capabilities");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_expired);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"expired");
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    v13 = objc_msgSend_dictionaryRepresentation(expirationTime, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"expirationTime");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C504C168((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  capabilities = self->_capabilities;
  v8 = v4;
  if (capabilities)
  {
    objc_msgSend_setCapabilities_(v4, v5, (uint64_t)capabilities);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_expired;
    v4[28] |= 1u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v8, v5, (uint64_t)expirationTime);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_capabilities, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 24) = self->_expired;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_expirationTime, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  capabilities = self->_capabilities;
  uint64_t v9 = v4[1];
  if ((unint64_t)capabilities | v9)
  {
    if (!objc_msgSend_isEqual_(capabilities, v7, v9)) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_expired)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char isEqual = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  expirationTime = self->_expirationTime;
  uint64_t v13 = v4[2];
  if ((unint64_t)expirationTime | v13) {
    char isEqual = objc_msgSend_isEqual_(expirationTime, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_9:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_capabilities, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_expired;
  }
  else {
    uint64_t v7 = 0;
  }
  return v7 ^ objc_msgSend_hash(self->_expirationTime, v4, v5) ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  capabilities = self->_capabilities;
  uint64_t v6 = *((void *)v4 + 1);
  id v9 = v4;
  if (capabilities)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(capabilities, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setCapabilities_(self, (const char *)v4, v6);
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 28))
  {
    self->_expired = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  expirationTime = self->_expirationTime;
  uint64_t v8 = *((void *)v4 + 2);
  if (expirationTime)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPZoneCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)expired
{
  return self->_expired;
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end