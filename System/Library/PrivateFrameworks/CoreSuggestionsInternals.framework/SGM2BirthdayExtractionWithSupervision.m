@interface SGM2BirthdayExtractionWithSupervision
- (BOOL)dateIsCorrect;
- (BOOL)didRegexTrigger;
- (BOOL)didResponseKitTrigger;
- (BOOL)hasDateIsCorrect;
- (BOOL)hasDidRegexTrigger;
- (BOOL)hasDidResponseKitTrigger;
- (BOOL)hasIsFromCongratulation;
- (BOOL)hasModelVersion;
- (BOOL)hasOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromCongratulation;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)offsetAsString:(int)a3;
- (int)StringAsOffset:(id)a3;
- (int)offset;
- (unint64_t)hash;
- (unsigned)modelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateIsCorrect:(BOOL)a3;
- (void)setDidRegexTrigger:(BOOL)a3;
- (void)setDidResponseKitTrigger:(BOOL)a3;
- (void)setHasDateIsCorrect:(BOOL)a3;
- (void)setHasDidRegexTrigger:(BOOL)a3;
- (void)setHasDidResponseKitTrigger:(BOOL)a3;
- (void)setHasIsFromCongratulation:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasOffset:(BOOL)a3;
- (void)setIsFromCongratulation:(BOOL)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setOffset:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2BirthdayExtractionWithSupervision

- (BOOL)didResponseKitTrigger
{
  return self->_didResponseKitTrigger;
}

- (BOOL)didRegexTrigger
{
  return self->_didRegexTrigger;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (BOOL)isFromCongratulation
{
  return self->_isFromCongratulation;
}

- (BOOL)dateIsCorrect
{
  return self->_dateIsCorrect;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_dateIsCorrect = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_isFromCongratulation = *((unsigned char *)v4 + 19);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_modelVersion = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_didRegexTrigger = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_offset = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
  {
LABEL_7:
    self->_didResponseKitTrigger = *((unsigned char *)v4 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_dateIsCorrect;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_isFromCongratulation;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_modelVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_didRegexTrigger;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
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
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_offset;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_didResponseKitTrigger;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_38;
    }
    if (self->_dateIsCorrect)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x20) == 0) {
      goto LABEL_38;
    }
    if (self->_isFromCongratulation)
    {
      if (!*((unsigned char *)v4 + 19)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 19))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_modelVersion != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_didRegexTrigger)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_offset != *((_DWORD *)v4 + 3)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_38;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 0x10) != 0)
    {
      if (self->_didResponseKitTrigger)
      {
        if (!*((unsigned char *)v4 + 18)) {
          goto LABEL_38;
        }
      }
      else if (*((unsigned char *)v4 + 18))
      {
        goto LABEL_38;
      }
      BOOL v5 = 1;
      goto LABEL_39;
    }
LABEL_38:
    BOOL v5 = 0;
  }
LABEL_39:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 16) = self->_dateIsCorrect;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 19) = self->_isFromCongratulation;
  *((unsigned char *)result + 20) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 2) = self->_modelVersion;
  *((unsigned char *)result + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 17) = self->_didRegexTrigger;
  *((unsigned char *)result + 20) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_offset;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_7:
  *((unsigned char *)result + 18) = self->_didResponseKitTrigger;
  *((unsigned char *)result + 20) |= 0x10u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[16] = self->_dateIsCorrect;
    v4[20] |= 4u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[19] = self->_isFromCongratulation;
  v4[20] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 2) = self->_modelVersion;
  v4[20] |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[17] = self->_didRegexTrigger;
  v4[20] |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 3) = self->_offset;
  v4[20] |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v4[18] = self->_didResponseKitTrigger;
    v4[20] |= 0x10u;
  }
LABEL_8:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2BirthdayExtractionWithSupervisionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_dateIsCorrect];
    [v3 setObject:v7 forKey:@"dateIsCorrect"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithBool:self->_isFromCongratulation];
  [v3 setObject:v8 forKey:@"isFromCongratulation"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = [NSNumber numberWithUnsignedInt:self->_modelVersion];
  [v3 setObject:v9 forKey:@"modelVersion"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithBool:self->_didRegexTrigger];
  [v3 setObject:v10 forKey:@"didRegexTrigger"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  uint64_t offset = self->_offset;
  if (offset >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_offset);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E65BB8E0[offset];
  }
  [v3 setObject:v12 forKey:@"offset"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  id v5 = [NSNumber numberWithBool:self->_didResponseKitTrigger];
  [v3 setObject:v5 forKey:@"didResponseKitTrigger"];

LABEL_8:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2BirthdayExtractionWithSupervision;
  id v4 = [(SGM2BirthdayExtractionWithSupervision *)&v8 description];
  id v5 = [(SGM2BirthdayExtractionWithSupervision *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDidResponseKitTrigger
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasDidResponseKitTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setDidResponseKitTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_didResponseKitTrigger = a3;
}

- (int)StringAsOffset:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGM2BirthdayWrongDay"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGM2BirthdaySameDay"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGM2BirthdayPreviousDay"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGM2BirthdayNextDay"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGM2BirthdayPreviousWeek"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGM2BirthdayNextWeek"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)offsetAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65BB8E0[a3];
  }
  return v3;
}

- (BOOL)hasOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t offset = a3;
}

- (int)offset
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_offset;
  }
  else {
    return 0;
  }
}

- (BOOL)hasDidRegexTrigger
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDidRegexTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setDidRegexTrigger:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_didRegexTrigger = a3;
}

- (BOOL)hasModelVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modelVersion = a3;
}

- (BOOL)hasIsFromCongratulation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsFromCongratulation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsFromCongratulation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isFromCongratulation = a3;
}

- (BOOL)hasDateIsCorrect
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDateIsCorrect:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDateIsCorrect:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dateIsCorrect = a3;
}

@end