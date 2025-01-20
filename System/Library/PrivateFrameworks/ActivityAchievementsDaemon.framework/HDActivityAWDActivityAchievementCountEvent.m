@interface HDActivityAWDActivityAchievementCountEvent
- (BOOL)hasMoreThanOneYearSinceActivitySetup;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalAchievementCount;
- (BOOL)hasTotalOTAAchievementCount;
- (BOOL)hasTotalOTAAchievementViewedCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)moreThanOneYearSinceActivitySetup;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)totalAchievementCountAsString:(int)a3;
- (id)totalOTAAchievementCountAsString:(int)a3;
- (id)totalOTAAchievementViewedCountAsString:(int)a3;
- (int)StringAsTotalAchievementCount:(id)a3;
- (int)StringAsTotalOTAAchievementCount:(id)a3;
- (int)StringAsTotalOTAAchievementViewedCount:(id)a3;
- (int)totalAchievementCount;
- (int)totalOTAAchievementCount;
- (int)totalOTAAchievementViewedCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMoreThanOneYearSinceActivitySetup:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalAchievementCount:(BOOL)a3;
- (void)setHasTotalOTAAchievementCount:(BOOL)a3;
- (void)setHasTotalOTAAchievementViewedCount:(BOOL)a3;
- (void)setMoreThanOneYearSinceActivitySetup:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalAchievementCount:(int)a3;
- (void)setTotalOTAAchievementCount:(int)a3;
- (void)setTotalOTAAchievementViewedCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDActivityAWDActivityAchievementCountEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)totalAchievementCount
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_totalAchievementCount;
  }
  else {
    return 0;
  }
}

- (void)setTotalAchievementCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalAchievementCount = a3;
}

- (void)setHasTotalAchievementCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTotalAchievementCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)totalAchievementCountAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264517260[a3];
  }
  return v3;
}

- (int)StringAsTotalAchievementCount:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LessThan_2"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Range_2_5"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Range_6_10"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MoreThan_10"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setMoreThanOneYearSinceActivitySetup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_moreThanOneYearSinceActivitySetup = a3;
}

- (void)setHasMoreThanOneYearSinceActivitySetup:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMoreThanOneYearSinceActivitySetup
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)totalOTAAchievementCount
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_totalOTAAchievementCount;
  }
  else {
    return 0;
  }
}

- (void)setTotalOTAAchievementCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalOTAAchievementCount = a3;
}

- (void)setHasTotalOTAAchievementCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalOTAAchievementCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)totalOTAAchievementCountAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264517260[a3];
  }
  return v3;
}

- (int)StringAsTotalOTAAchievementCount:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LessThan_2"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Range_2_5"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Range_6_10"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MoreThan_10"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)totalOTAAchievementViewedCount
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_totalOTAAchievementViewedCount;
  }
  else {
    return 0;
  }
}

- (void)setTotalOTAAchievementViewedCount:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalOTAAchievementViewedCount = a3;
}

- (void)setHasTotalOTAAchievementViewedCount:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalOTAAchievementViewedCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)totalOTAAchievementViewedCountAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264517260[a3];
  }
  return v3;
}

- (int)StringAsTotalOTAAchievementViewedCount:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LessThan_2"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Range_2_5"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Range_6_10"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MoreThan_10"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDActivityAWDActivityAchievementCountEvent;
  int v4 = [(HDActivityAWDActivityAchievementCountEvent *)&v8 description];
  v5 = [(HDActivityAWDActivityAchievementCountEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t totalAchievementCount = self->_totalAchievementCount;
  if (totalAchievementCount >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_totalAchievementCount);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_264517260[totalAchievementCount];
  }
  [v3 setObject:v7 forKey:@"totalAchievementCount"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    uint64_t totalOTAAchievementCount = self->_totalOTAAchievementCount;
    if (totalOTAAchievementCount >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_totalOTAAchievementCount);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_264517260[totalOTAAchievementCount];
    }
    [v3 setObject:v10 forKey:@"totalOTAAchievementCount"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
LABEL_12:
  objc_super v8 = [NSNumber numberWithBool:self->_moreThanOneYearSinceActivitySetup];
  [v3 setObject:v8 forKey:@"moreThanOneYearSinceActivitySetup"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_17:
    uint64_t totalOTAAchievementViewedCount = self->_totalOTAAchievementViewedCount;
    if (totalOTAAchievementViewedCount >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_totalOTAAchievementViewedCount);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_264517260[totalOTAAchievementViewedCount];
    }
    [v3 setObject:v12 forKey:@"totalOTAAchievementViewedCount"];
  }
LABEL_21:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDActivityAWDActivityAchievementCountEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_totalAchievementCount;
  *((unsigned char *)v4 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)v4 + 28) = self->_moreThanOneYearSinceActivitySetup;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_totalOTAAchievementCount;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 6) = self->_totalOTAAchievementViewedCount;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 32) |= 1u;
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
  *((_DWORD *)result + 4) = self->_totalAchievementCount;
  *((unsigned char *)result + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((unsigned char *)result + 28) = self->_moreThanOneYearSinceActivitySetup;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_totalOTAAchievementCount;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 6) = self->_totalOTAAchievementViewedCount;
  *((unsigned char *)result + 32) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_totalAchievementCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
    {
      if (self->_moreThanOneYearSinceActivitySetup)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_29;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_20;
      }
    }
LABEL_29:
    BOOL v5 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 32) & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_totalOTAAchievementCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_29;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_totalOTAAchievementViewedCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_29;
    }
    BOOL v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_totalAchievementCount;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_moreThanOneYearSinceActivitySetup;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_totalOTAAchievementCount;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_totalOTAAchievementViewedCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t totalAchievementCount = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_moreThanOneYearSinceActivitySetup = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_uint64_t totalOTAAchievementCount = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_6:
    self->_uint64_t totalOTAAchievementViewedCount = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)moreThanOneYearSinceActivitySetup
{
  return self->_moreThanOneYearSinceActivitySetup;
}

@end