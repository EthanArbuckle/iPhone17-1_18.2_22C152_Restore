@interface SGM2ContactInBanner
- (BOOL)hasApp;
- (BOOL)hasExtracted;
- (BOOL)hasExtractionModelVersion;
- (BOOL)hasKey;
- (BOOL)hasSelfId;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)selfId;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsApp:(id)a3;
- (int)StringAsExtracted:(id)a3;
- (int)StringAsType:(id)a3;
- (int)app;
- (int)extracted;
- (int)type;
- (unint64_t)hash;
- (unsigned)extractionModelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setExtracted:(int)a3;
- (void)setExtractionModelVersion:(unsigned int)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasExtracted:(BOOL)a3;
- (void)setHasExtractionModelVersion:(BOOL)a3;
- (void)setHasSelfId:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSelfId:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactInBanner

- (void).cxx_destruct
{
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (BOOL)selfId
{
  return self->_selfId;
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
    -[SGM2ContactInBanner setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_app = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_extracted = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_selfId = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  self->_extractionModelVersion = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_8:
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_app;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_extracted;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_selfId;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_extractionModelVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_extracted != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
    {
      if (self->_selfId)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_31;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_22;
      }
    }
LABEL_31:
    BOOL v6 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0) {
    goto LABEL_31;
  }
LABEL_22:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_31;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
    BOOL v6 = 1;
  }
LABEL_32:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_extracted;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_extractionModelVersion;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(unsigned char *)(v5 + 36) = self->_selfId;
  *(unsigned char *)(v5 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 40) |= 8u;
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
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_app;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 3) = self->_extracted;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v4 + 36) = self->_selfId;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_extractionModelVersion;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 8) = self->_type;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_9:
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
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactInBannerReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (has)
  {
    uint64_t app = self->_app;
    if (app >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_app);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E5B8F918[app];
    }
    [v4 setObject:v8 forKey:@"app"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t extracted = self->_extracted;
    if (extracted >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extracted);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E5B8F930[extracted];
    }
    [v4 setObject:v10 forKey:@"extracted"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) == 0)
  {
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
LABEL_18:
    v12 = [NSNumber numberWithUnsignedInt:self->_extractionModelVersion];
    [v4 setObject:v12 forKey:@"extractionModelVersion"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E5B8F950[type];
    }
    [v4 setObject:v14 forKey:@"type"];

    goto LABEL_23;
  }
  v11 = [NSNumber numberWithBool:self->_selfId];
  [v4 setObject:v11 forKey:@"selfId"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_18;
  }
LABEL_15:
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_23:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactInBanner;
  id v4 = [(SGM2ContactInBanner *)&v8 description];
  uint64_t v5 = [(SGM2ContactInBanner *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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
    id v3 = off_1E5B8F950[a3];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasExtractionModelVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_extractionModelVersion = a3;
}

- (BOOL)hasSelfId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasSelfId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setSelfId:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_selfId = a3;
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
    id v3 = off_1E5B8F930[a3];
  }

  return v3;
}

- (BOOL)hasExtracted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasExtracted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setExtracted:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t extracted = a3;
}

- (int)extracted
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_extracted;
  }
  else {
    return 0;
  }
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
    id v3 = off_1E5B8F918[a3];
  }

  return v3;
}

- (BOOL)hasApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasApp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setApp:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t app = a3;
}

- (int)app
{
  if (*(unsigned char *)&self->_has) {
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
    return (NSString *)@"ContactInBanner";
  }
}

@end