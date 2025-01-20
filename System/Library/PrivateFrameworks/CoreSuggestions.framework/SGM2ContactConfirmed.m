@interface SGM2ContactConfirmed
- (BOOL)firstNameAdj;
- (BOOL)hasApp;
- (BOOL)hasExtracted;
- (BOOL)hasExtractionModelVersion;
- (BOOL)hasFirstNameAdj;
- (BOOL)hasIsUpdate;
- (BOOL)hasKey;
- (BOOL)hasLastNameAdj;
- (BOOL)hasMiddleNameAdj;
- (BOOL)hasSelfId;
- (BOOL)hasType;
- (BOOL)hasUiType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdate;
- (BOOL)lastNameAdj;
- (BOOL)middleNameAdj;
- (BOOL)readFrom:(id)a3;
- (BOOL)selfId;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (id)uiTypeAsString:(int)a3;
- (int)StringAsApp:(id)a3;
- (int)StringAsExtracted:(id)a3;
- (int)StringAsType:(id)a3;
- (int)StringAsUiType:(id)a3;
- (int)app;
- (int)extracted;
- (int)type;
- (int)uiType;
- (unint64_t)hash;
- (unsigned)extractionModelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setExtracted:(int)a3;
- (void)setExtractionModelVersion:(unsigned int)a3;
- (void)setFirstNameAdj:(BOOL)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasExtracted:(BOOL)a3;
- (void)setHasExtractionModelVersion:(BOOL)a3;
- (void)setHasFirstNameAdj:(BOOL)a3;
- (void)setHasIsUpdate:(BOOL)a3;
- (void)setHasLastNameAdj:(BOOL)a3;
- (void)setHasMiddleNameAdj:(BOOL)a3;
- (void)setHasSelfId:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUiType:(BOOL)a3;
- (void)setIsUpdate:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLastNameAdj:(BOOL)a3;
- (void)setMiddleNameAdj:(BOOL)a3;
- (void)setSelfId:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setUiType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactConfirmed

- (void).cxx_destruct
{
}

- (BOOL)selfId
{
  return self->_selfId;
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (BOOL)middleNameAdj
{
  return self->_middleNameAdj;
}

- (BOOL)lastNameAdj
{
  return self->_lastNameAdj;
}

- (BOOL)firstNameAdj
{
  return self->_firstNameAdj;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[SGM2ContactConfirmed setKey:](self, "setKey:");
    id v4 = v6;
  }
  __int16 v5 = *((_WORD *)v4 + 24);
  if (v5)
  {
    self->_app = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_firstNameAdj = *((unsigned char *)v4 + 40);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_lastNameAdj = *((unsigned char *)v4 + 42);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_middleNameAdj = *((unsigned char *)v4 + 43);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_isUpdate = *((unsigned char *)v4 + 41);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_extracted = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_extractionModelVersion = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_selfId = *((unsigned char *)v4 + 44);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  self->_type = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 24) & 0x10) != 0)
  {
LABEL_13:
    self->_uiType = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_14:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v5 = 2654435761 * self->_app;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_firstNameAdj;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_lastNameAdj;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_middleNameAdj;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_isUpdate;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_extracted;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_extractionModelVersion;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_selfId;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v13 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_19:
  uint64_t v12 = 0;
  if ((has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_type;
  if ((has & 0x10) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_uiType;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_69;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_69;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 24);
  if (has)
  {
    if ((v7 & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_69;
    }
  }
  else if (v7)
  {
    goto LABEL_69;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_69;
    }
    if (self->_firstNameAdj)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_69;
    }
    if (self->_lastNameAdj)
    {
      if (!*((unsigned char *)v4 + 42)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 42))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0) {
      goto LABEL_69;
    }
    if (self->_middleNameAdj)
    {
      if (!*((unsigned char *)v4 + 43)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 43))
    {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_69;
    }
    if (self->_isUpdate)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_extracted != *((_DWORD *)v4 + 3)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) != 0)
    {
      if (self->_selfId)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_69;
        }
        goto LABEL_59;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_59;
      }
    }
LABEL_69:
    BOOL v8 = 0;
    goto LABEL_70;
  }
  if ((*((_WORD *)v4 + 24) & 0x200) != 0) {
    goto LABEL_69;
  }
LABEL_59:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_uiType != *((_DWORD *)v4 + 9)) {
      goto LABEL_69;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v7 & 0x10) == 0;
  }
LABEL_70:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(_WORD *)(v5 + 48) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 40) = self->_firstNameAdj;
  *(_WORD *)(v5 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(unsigned char *)(v5 + 42) = self->_lastNameAdj;
  *(_WORD *)(v5 + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(unsigned char *)(v5 + 43) = self->_middleNameAdj;
  *(_WORD *)(v5 + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(unsigned char *)(v5 + 41) = self->_isUpdate;
  *(_WORD *)(v5 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 12) = self->_extracted;
  *(_WORD *)(v5 + 48) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 16) = self->_extractionModelVersion;
  *(_WORD *)(v5 + 48) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_WORD *)(v5 + 48) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
LABEL_20:
  *(unsigned char *)(v5 + 44) = self->_selfId;
  *(_WORD *)(v5 + 48) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 36) = self->_uiType;
    *(_WORD *)(v5 + 48) |= 0x10u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v6 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_app;
    *((_WORD *)v4 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 40) = self->_firstNameAdj;
  *((_WORD *)v4 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((unsigned char *)v4 + 42) = self->_lastNameAdj;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 43) = self->_middleNameAdj;
  *((_WORD *)v4 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 41) = self->_isUpdate;
  *((_WORD *)v4 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 3) = self->_extracted;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_extractionModelVersion;
  *((_WORD *)v4 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 44) = self->_selfId;
  *((_WORD *)v4 + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)v4 + 8) = self->_type;
  *((_WORD *)v4 + 24) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 9) = self->_uiType;
    *((_WORD *)v4 + 24) |= 0x10u;
  }
LABEL_14:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_14:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactConfirmedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t app = self->_app;
    if (app >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_app);
      BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = off_1E5B8E128[app];
    }
    [v4 setObject:v8 forKey:@"app"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_firstNameAdj];
    [v4 setObject:v9 forKey:@"firstNameAdj"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_10:
      if ((has & 0x100) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_10;
  }
  uint64_t v10 = [NSNumber numberWithBool:self->_lastNameAdj];
  [v4 setObject:v10 forKey:@"lastNameAdj"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v11 = [NSNumber numberWithBool:self->_middleNameAdj];
  [v4 setObject:v11 forKey:@"middleNameAdj"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = [NSNumber numberWithBool:self->_isUpdate];
  [v4 setObject:v12 forKey:@"isUpdate"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_26;
  }
LABEL_22:
  uint64_t extracted = self->_extracted;
  if (extracted >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extracted);
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v14 = off_1E5B8E140[extracted];
  }
  [v4 setObject:v14 forKey:@"extracted"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = [NSNumber numberWithUnsignedInt:self->_extractionModelVersion];
  [v4 setObject:v15 forKey:@"extractionModelVersion"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
LABEL_28:
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5B8E160[type];
    }
    [v4 setObject:v18 forKey:@"type"];

    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
LABEL_27:
  v16 = [NSNumber numberWithBool:self->_selfId];
  [v4 setObject:v16 forKey:@"selfId"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_28;
  }
LABEL_16:
  if ((has & 0x10) != 0)
  {
LABEL_32:
    uint64_t uiType = self->_uiType;
    if (uiType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_uiType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E5B8E188[uiType];
    }
    [v4 setObject:v20 forKey:@"uiType"];
  }
LABEL_36:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactConfirmed;
  id v4 = [(SGM2ContactConfirmed *)&v8 description];
  uint64_t v5 = [(SGM2ContactConfirmed *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsUiType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DontSuggestButton"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Notification"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)uiTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E188[a3];
  }

  return v3;
}

- (BOOL)hasUiType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasUiType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setUiType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_uint64_t uiType = a3;
}

- (int)uiType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_uiType;
  }
  else {
    return 0;
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailTypeEmail"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypePhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeAddress"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeOther"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeBirthday"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E160[a3];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSelfId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasSelfId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setSelfId:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selfId = a3;
}

- (BOOL)hasExtractionModelVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_extractionModelVersion = a3;
}

- (int)StringAsExtracted:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMBannerExtractionTypeSig"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMBannerExtractionTypePhrase"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMBannerExtractionTypeSigPhrase"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMBannerExtractionTypeOther"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)extractedAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E140[a3];
  }

  return v3;
}

- (BOOL)hasExtracted
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasExtracted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setExtracted:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_uint64_t extracted = a3;
}

- (int)extracted
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_extracted;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsUpdate
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsUpdate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setIsUpdate:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isUpdate = a3;
}

- (BOOL)hasMiddleNameAdj
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasMiddleNameAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setMiddleNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_middleNameAdj = a3;
}

- (BOOL)hasLastNameAdj
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasLastNameAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setLastNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_lastNameAdj = a3;
}

- (BOOL)hasFirstNameAdj
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasFirstNameAdj:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setFirstNameAdj:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_firstNameAdj = a3;
}

- (int)StringAsApp:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMBannerDisplayAppMail"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMBannerDisplayAppMessages"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMBannerDisplayAppOther"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)appAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E128[a3];
  }

  return v3;
}

- (BOOL)hasApp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasApp:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setApp:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_uint64_t app = a3;
}

- (int)app
{
  if (*(_WORD *)&self->_has) {
    return self->_app;
  }
  else {
    return 0;
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"ContactConfirmed";
  }
}

@end