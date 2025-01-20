@interface SGM2ContactDetailRejected
- (BOOL)hasExtracted;
- (BOOL)hasExtractionModelVersion;
- (BOOL)hasKey;
- (BOOL)hasType;
- (BOOL)hasUiType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (id)uiTypeAsString:(int)a3;
- (int)StringAsExtracted:(id)a3;
- (int)StringAsType:(id)a3;
- (int)StringAsUiType:(id)a3;
- (int)extracted;
- (int)type;
- (int)uiType;
- (unint64_t)hash;
- (unsigned)extractionModelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExtracted:(int)a3;
- (void)setExtractionModelVersion:(unsigned int)a3;
- (void)setHasExtracted:(BOOL)a3;
- (void)setHasExtractionModelVersion:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUiType:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setType:(int)a3;
- (void)setUiType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactDetailRejected

- (void).cxx_destruct
{
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SGM2ContactDetailRejected setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_extracted = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_extractionModelVersion = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_7:
    self->_uiType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_extracted;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_extractionModelVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_uiType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_extracted != *((_DWORD *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_uiType != *((_DWORD *)v4 + 7)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 12) = self->_extractionModelVersion;
      *(unsigned char *)(v5 + 32) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_extracted;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 28) = self->_uiType;
    *(unsigned char *)(v5 + 32) |= 8u;
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_extracted;
  *((unsigned char *)v4 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 3) = self->_extractionModelVersion;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 7) = self->_uiType;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_8:
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailRejectedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5B90118[type];
    }
    [v4 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_16:
      v11 = [NSNumber numberWithUnsignedInt:self->_extractionModelVersion];
      [v4 setObject:v11 forKey:@"extractionModelVersion"];

      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_21;
      }
LABEL_17:
      uint64_t uiType = self->_uiType;
      if (uiType >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_uiType);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E5B90168[uiType];
      }
      [v4 setObject:v13 forKey:@"uiType"];

      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t extracted = self->_extracted;
  if (extracted >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extracted);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E5B90140[extracted];
  }
  [v4 setObject:v10 forKey:@"extracted"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_16;
  }
LABEL_6:
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_21:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactDetailRejected;
  id v4 = [(SGM2ContactDetailRejected *)&v8 description];
  uint64_t v5 = [(SGM2ContactDetailRejected *)self dictionaryRepresentation];
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
    id v3 = off_1E5B90168[a3];
  }

  return v3;
}

- (BOOL)hasUiType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUiType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUiType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t uiType = a3;
}

- (int)uiType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_uiType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasExtractionModelVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_extractionModelVersion = a3;
}

- (int)StringAsExtracted:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMDetailExtractionTypeSig"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMDetailExtractionTypePhrase"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMDetailExtractionTypeSigPhrase"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMDetailExtractionTypeInteraction"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMDetailExtractionTypeOther"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)extractedAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B90140[a3];
  }

  return v3;
}

- (BOOL)hasExtracted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasExtracted:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setExtracted:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t extracted = a3;
}

- (int)extracted
{
  if (*(unsigned char *)&self->_has) {
    return self->_extracted;
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
    id v3 = off_1E5B90118[a3];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
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
    return (NSString *)@"ContactDetailRejected";
  }
}

@end