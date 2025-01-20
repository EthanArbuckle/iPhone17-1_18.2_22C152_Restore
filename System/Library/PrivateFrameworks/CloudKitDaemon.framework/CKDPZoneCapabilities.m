@interface CKDPZoneCapabilities
- (BOOL)atomicSaves;
- (BOOL)ckql;
- (BOOL)fetchChanges;
- (BOOL)hasAtomicSaves;
- (BOOL)hasCkql;
- (BOOL)hasFetchChanges;
- (BOOL)hasHierarchicalSharing;
- (BOOL)hasSharingType;
- (BOOL)hasZoneSharing;
- (BOOL)hierarchicalSharing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)zoneSharing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sharingTypeAsString:(int)a3;
- (int)StringAsSharingType:(id)a3;
- (int)sharingType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAtomicSaves:(BOOL)a3;
- (void)setCkql:(BOOL)a3;
- (void)setFetchChanges:(BOOL)a3;
- (void)setHasAtomicSaves:(BOOL)a3;
- (void)setHasCkql:(BOOL)a3;
- (void)setHasFetchChanges:(BOOL)a3;
- (void)setHasHierarchicalSharing:(BOOL)a3;
- (void)setHasSharingType:(BOOL)a3;
- (void)setHasZoneSharing:(BOOL)a3;
- (void)setHierarchicalSharing:(BOOL)a3;
- (void)setSharingType:(int)a3;
- (void)setZoneSharing:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneCapabilities

- (void)setAtomicSaves:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_atomicSaves = a3;
}

- (void)setHasAtomicSaves:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAtomicSaves
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFetchChanges:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_fetchChanges = a3;
}

- (void)setHasFetchChanges:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFetchChanges
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCkql:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_ckql = a3;
}

- (void)setHasCkql:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCkql
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)sharingType
{
  if (*(unsigned char *)&self->_has) {
    return self->_sharingType;
  }
  else {
    return 1;
  }
}

- (void)setSharingType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sharingType = a3;
}

- (void)setHasSharingType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSharingType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)sharingTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F7400[a3 - 1];
  }
  return v3;
}

- (int)StringAsSharingType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"none"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"hierarchical"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"zoneWide"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)setZoneSharing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_zoneSharing = a3;
}

- (void)setHasZoneSharing:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasZoneSharing
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHierarchicalSharing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hierarchicalSharing = a3;
}

- (void)setHasHierarchicalSharing:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHierarchicalSharing
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneCapabilities;
  v4 = [(CKDPZoneCapabilities *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_atomicSaves);
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)v10, @"atomicSaves");

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v12 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_fetchChanges);
  objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, @"fetchChanges");

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v14 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_ckql);
  objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, @"ckql");

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_14:
  unsigned int v16 = self->_sharingType - 1;
  if (v16 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_sharingType);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_1E64F7400[v16];
  }
  objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v17, @"sharingType");

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  v18 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_zoneSharing);
  objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, @"zoneSharing");

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v7 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_hierarchicalSharing);
    objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"hierarchicalSharing");
  }
LABEL_8:
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F8113C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_atomicSaves;
    v4[20] |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[14] = self->_fetchChanges;
  v4[20] |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[13] = self->_ckql;
  v4[20] |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 2) = self->_sharingType;
  v4[20] |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[16] = self->_zoneSharing;
  v4[20] |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v4[15] = self->_hierarchicalSharing;
    v4[20] |= 0x10u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_atomicSaves;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 14) = self->_fetchChanges;
  *((unsigned char *)result + 20) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 13) = self->_ckql;
  *((unsigned char *)result + 20) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 2) = self->_sharingType;
  *((unsigned char *)result + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 16) = self->_zoneSharing;
  *((unsigned char *)result + 20) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_7:
  *((unsigned char *)result + 15) = self->_hierarchicalSharing;
  *((unsigned char *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_41;
    }
    if (self->_atomicSaves)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) == 0) {
      goto LABEL_41;
    }
    if (self->_fetchChanges)
    {
      if (!*((unsigned char *)v4 + 14)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 14))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_41;
    }
    if (self->_ckql)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sharingType != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x20) == 0) {
      goto LABEL_41;
    }
    if (self->_zoneSharing)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  BOOL v7 = (*((unsigned char *)v4 + 20) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
    {
      if (self->_hierarchicalSharing)
      {
        if (!*((unsigned char *)v4 + 15)) {
          goto LABEL_41;
        }
      }
      else if (*((unsigned char *)v4 + 15))
      {
        goto LABEL_41;
      }
      BOOL v7 = 1;
      goto LABEL_42;
    }
LABEL_41:
    BOOL v7 = 0;
  }
LABEL_42:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_atomicSaves;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_fetchChanges;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_ckql;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_sharingType;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_zoneSharing;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_hierarchicalSharing;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_atomicSaves = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_fetchChanges = *((unsigned char *)v4 + 14);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_ckql = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_sharingType = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_zoneSharing = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
  {
LABEL_7:
    self->_hierarchicalSharing = *((unsigned char *)v4 + 15);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_8:
}

- (BOOL)atomicSaves
{
  return self->_atomicSaves;
}

- (BOOL)fetchChanges
{
  return self->_fetchChanges;
}

- (BOOL)ckql
{
  return self->_ckql;
}

- (BOOL)zoneSharing
{
  return self->_zoneSharing;
}

- (BOOL)hierarchicalSharing
{
  return self->_hierarchicalSharing;
}

@end