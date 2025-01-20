@interface CSStingrayRecordClientMetadataICloudDataProtection
- (BOOL)hasDerivedTokenID;
- (BOOL)hasEscrowedKeys;
- (BOOL)hasIcdp;
- (BOOL)hasIcdpArmed;
- (BOOL)hasIcdpDrop;
- (BOOL)hasIcdpGF;
- (BOOL)hasIcdpWalrus;
- (BOOL)hasWrappedKeys;
- (BOOL)icdp;
- (BOOL)icdpArmed;
- (BOOL)icdpDrop;
- (BOOL)icdpGF;
- (BOOL)icdpWalrus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)derivedTokenID;
- (NSData)escrowedKeys;
- (NSData)wrappedKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDerivedTokenID:(id)a3;
- (void)setEscrowedKeys:(id)a3;
- (void)setHasIcdp:(BOOL)a3;
- (void)setHasIcdpArmed:(BOOL)a3;
- (void)setHasIcdpDrop:(BOOL)a3;
- (void)setHasIcdpGF:(BOOL)a3;
- (void)setHasIcdpWalrus:(BOOL)a3;
- (void)setIcdp:(BOOL)a3;
- (void)setIcdpArmed:(BOOL)a3;
- (void)setIcdpDrop:(BOOL)a3;
- (void)setIcdpGF:(BOOL)a3;
- (void)setIcdpWalrus:(BOOL)a3;
- (void)setWrappedKeys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSStingrayRecordClientMetadataICloudDataProtection

- (void)setIcdp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_icdp = a3;
}

- (void)setHasIcdp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIcdp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIcdpArmed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_icdpArmed = a3;
}

- (void)setHasIcdpArmed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIcdpArmed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIcdpWalrus:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_icdpWalrus = a3;
}

- (void)setHasIcdpWalrus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIcdpWalrus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIcdpDrop:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_icdpDrop = a3;
}

- (void)setHasIcdpDrop:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIcdpDrop
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasEscrowedKeys
{
  return self->_escrowedKeys != 0;
}

- (void)setIcdpGF:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_icdpGF = a3;
}

- (void)setHasIcdpGF:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIcdpGF
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasWrappedKeys
{
  return self->_wrappedKeys != 0;
}

- (BOOL)hasDerivedTokenID
{
  return self->_derivedTokenID != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CSStingrayRecordClientMetadataICloudDataProtection;
  v4 = [(CSStingrayRecordClientMetadataICloudDataProtection *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  char has = (char)self->_has;
  if (has)
  {
    v15 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_icdp);
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, @"icdp");

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v17 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_icdpArmed);
  objc_msgSend_setObject_forKey_(v5, v18, (uint64_t)v17, @"icdpArmed");

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  v19 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_icdpWalrus);
  objc_msgSend_setObject_forKey_(v5, v20, (uint64_t)v19, @"icdpWalrus");

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v7 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_icdpDrop);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"icdpDrop");
  }
LABEL_6:
  escrowedKeys = self->_escrowedKeys;
  if (escrowedKeys) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)escrowedKeys, @"escrowedKeys");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = objc_msgSend_numberWithBool_(NSNumber, v4, self->_icdpGF);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"icdpGF");
  }
  wrappedKeys = self->_wrappedKeys;
  if (wrappedKeys) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)wrappedKeys, @"wrappedKeys");
  }
  derivedTokenID = self->_derivedTokenID;
  if (derivedTokenID) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)derivedTokenID, @"derivedTokenID");
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CSStingrayRecordClientMetadataICloudDataProtectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_escrowedKeys)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_wrappedKeys)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_derivedTokenID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[32] = self->_icdp;
    v4[40] |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[33] = self->_icdpArmed;
  v4[40] |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  v4[36] = self->_icdpWalrus;
  v4[40] |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[34] = self->_icdpDrop;
    v4[40] |= 4u;
  }
LABEL_6:
  escrowedKeys = self->_escrowedKeys;
  v10 = v4;
  if (escrowedKeys)
  {
    objc_msgSend_setEscrowedKeys_(v4, v5, (uint64_t)escrowedKeys);
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[35] = self->_icdpGF;
    v4[40] |= 8u;
  }
  wrappedKeys = self->_wrappedKeys;
  if (wrappedKeys)
  {
    objc_msgSend_setWrappedKeys_(v10, v5, (uint64_t)wrappedKeys);
    id v4 = v10;
  }
  derivedTokenID = self->_derivedTokenID;
  if (derivedTokenID)
  {
    objc_msgSend_setDerivedTokenID_(v10, v5, (uint64_t)derivedTokenID);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (unsigned char *)objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  char has = (char)self->_has;
  if (has)
  {
    v10[32] = self->_icdp;
    v10[40] |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10[33] = self->_icdpArmed;
  v10[40] |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v10[36] = self->_icdpWalrus;
  v10[40] |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v10[34] = self->_icdpDrop;
    v10[40] |= 4u;
  }
LABEL_6:
  uint64_t v14 = objc_msgSend_copyWithZone_(self->_escrowedKeys, v11, (uint64_t)a3);
  v15 = (void *)*((void *)v12 + 2);
  *((void *)v12 + 2) = v14;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v12[35] = self->_icdpGF;
    v12[40] |= 8u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_wrappedKeys, v16, (uint64_t)a3);
  v18 = (void *)*((void *)v12 + 3);
  *((void *)v12 + 3) = v17;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_derivedTokenID, v19, (uint64_t)a3);
  v21 = (void *)*((void *)v12 + 1);
  *((void *)v12 + 1) = v20;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_49;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((v4[5] & 1) == 0) {
      goto LABEL_49;
    }
    if (self->_icdp)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_49;
    }
  }
  else if (v4[5])
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[5] & 2) == 0) {
      goto LABEL_49;
    }
    if (self->_icdpArmed)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_49;
    }
  }
  else if ((v4[5] & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[5] & 0x10) == 0) {
      goto LABEL_49;
    }
    if (self->_icdpWalrus)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_49;
    }
  }
  else if ((v4[5] & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[5] & 4) == 0) {
      goto LABEL_49;
    }
    if (self->_icdpDrop)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_49;
    }
  }
  else if ((v4[5] & 4) != 0)
  {
    goto LABEL_49;
  }
  escrowedKeys = self->_escrowedKeys;
  uint64_t v10 = v4[2];
  if ((unint64_t)escrowedKeys | v10)
  {
    if (!objc_msgSend_isEqual_(escrowedKeys, v7, v10)) {
      goto LABEL_49;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((v4[5] & 8) != 0)
    {
      if (self->_icdpGF)
      {
        if (!*((unsigned char *)v4 + 35)) {
          goto LABEL_49;
        }
        goto LABEL_45;
      }
      if (!*((unsigned char *)v4 + 35)) {
        goto LABEL_45;
      }
    }
LABEL_49:
    char isEqual = 0;
    goto LABEL_50;
  }
  if ((v4[5] & 8) != 0) {
    goto LABEL_49;
  }
LABEL_45:
  wrappedKeys = self->_wrappedKeys;
  uint64_t v12 = v4[3];
  if ((unint64_t)wrappedKeys | v12 && !objc_msgSend_isEqual_(wrappedKeys, v7, v12)) {
    goto LABEL_49;
  }
  derivedTokenID = self->_derivedTokenID;
  uint64_t v14 = v4[1];
  if ((unint64_t)derivedTokenID | v14) {
    char isEqual = objc_msgSend_isEqual_(derivedTokenID, v7, v14);
  }
  else {
    char isEqual = 1;
  }
LABEL_50:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_icdp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_icdpArmed;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_icdpWalrus;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_icdpDrop;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v7 = 0;
LABEL_10:
  uint64_t v8 = objc_msgSend_hash(self->_escrowedKeys, a2, v2);
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_icdpGF;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v5 ^ v4 ^ v6 ^ v7 ^ v11 ^ v8;
  uint64_t v13 = objc_msgSend_hash(self->_wrappedKeys, v9, v10);
  return v12 ^ v13 ^ objc_msgSend_hash(self->_derivedTokenID, v14, v15);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_icdp = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_icdpArmed = *((unsigned char *)v4 + 33);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 0x10) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_19:
  self->_icdpWalrus = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_5:
    self->_icdpDrop = *((unsigned char *)v4 + 34);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  uint64_t v7 = *((void *)v4 + 2);
  id v10 = v4;
  if (v7)
  {
    objc_msgSend_setEscrowedKeys_(self, v5, v7);
    id v4 = v10;
  }
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    self->_icdpGF = *((unsigned char *)v4 + 35);
    *(unsigned char *)&self->_has |= 8u;
  }
  uint64_t v8 = *((void *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setWrappedKeys_(self, v5, v8);
    id v4 = v10;
  }
  uint64_t v9 = *((void *)v4 + 1);
  if (v9)
  {
    objc_msgSend_setDerivedTokenID_(self, v5, v9);
    id v4 = v10;
  }
}

- (BOOL)icdp
{
  return self->_icdp;
}

- (BOOL)icdpArmed
{
  return self->_icdpArmed;
}

- (BOOL)icdpWalrus
{
  return self->_icdpWalrus;
}

- (BOOL)icdpDrop
{
  return self->_icdpDrop;
}

- (NSData)escrowedKeys
{
  return self->_escrowedKeys;
}

- (void)setEscrowedKeys:(id)a3
{
}

- (BOOL)icdpGF
{
  return self->_icdpGF;
}

- (NSData)wrappedKeys
{
  return self->_wrappedKeys;
}

- (void)setWrappedKeys:(id)a3
{
}

- (NSData)derivedTokenID
{
  return self->_derivedTokenID;
}

- (void)setDerivedTokenID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedKeys, 0);
  objc_storeStrong((id *)&self->_escrowedKeys, 0);

  objc_storeStrong((id *)&self->_derivedTokenID, 0);
}

@end