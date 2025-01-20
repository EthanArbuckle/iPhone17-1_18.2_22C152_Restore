@interface SGM2EventBannerConfirmed
- (BOOL)hasApp;
- (BOOL)hasCategory;
- (BOOL)hasDateAdj;
- (BOOL)hasDuraAdj;
- (BOOL)hasExtracted;
- (BOOL)hasKey;
- (BOOL)hasState;
- (BOOL)hasTitleAdj;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateAdjAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)duraAdjAsString:(int)a3;
- (id)extractedAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (id)titleAdjAsString:(int)a3;
- (int)StringAsApp:(id)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsDateAdj:(id)a3;
- (int)StringAsDuraAdj:(id)a3;
- (int)StringAsExtracted:(id)a3;
- (int)StringAsState:(id)a3;
- (int)StringAsTitleAdj:(id)a3;
- (int)app;
- (int)category;
- (int)dateAdj;
- (int)duraAdj;
- (int)extracted;
- (int)state;
- (int)titleAdj;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setCategory:(int)a3;
- (void)setDateAdj:(int)a3;
- (void)setDuraAdj:(int)a3;
- (void)setExtracted:(int)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasDateAdj:(BOOL)a3;
- (void)setHasDuraAdj:(BOOL)a3;
- (void)setHasExtracted:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTitleAdj:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setState:(int)a3;
- (void)setTitleAdj:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2EventBannerConfirmed

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 4))
  {
    v6 = v4;
    -[SGM2EventBannerConfirmed setKey:](self, "setKey:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_app = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((v4[12] & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_category = v4[3];
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_extracted = v4[6];
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_state = v4[10];
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_titleAdj = v4[11];
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  self->_dateAdj = v4[4];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[12] & 8) != 0)
  {
LABEL_10:
    self->_duraAdj = v4[5];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_11:
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
      uint64_t v5 = 2654435761 * self->_category;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
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
    uint64_t v6 = 2654435761 * self->_extracted;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_state;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_titleAdj;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_dateAdj;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_duraAdj;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_38;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_38:
    BOOL v6 = 0;
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_category != *((_DWORD *)v4 + 3)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_extracted != *((_DWORD *)v4 + 6)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) == 0 || self->_state != *((_DWORD *)v4 + 10)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x40) == 0 || self->_titleAdj != *((_DWORD *)v4 + 11)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x40) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_dateAdj != *((_DWORD *)v4 + 4)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_38;
  }
  BOOL v6 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_duraAdj != *((_DWORD *)v4 + 5)) {
      goto LABEL_38;
    }
    BOOL v6 = 1;
  }
LABEL_39:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(unsigned char *)(v5 + 48) |= 1u;
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
  *(_DWORD *)(v5 + 12) = self->_category;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 24) = self->_extracted;
  *(unsigned char *)(v5 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 40) = self->_state;
  *(unsigned char *)(v5 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(_DWORD *)(v5 + 16) = self->_dateAdj;
    *(unsigned char *)(v5 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v5 + 44) = self->_titleAdj;
  *(unsigned char *)(v5 + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 20) = self->_duraAdj;
    *(unsigned char *)(v5 + 48) |= 8u;
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
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 3) = self->_category;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 6) = self->_extracted;
  *((unsigned char *)v4 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 10) = self->_state;
  *((unsigned char *)v4 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 11) = self->_titleAdj;
  *((unsigned char *)v4 + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)v4 + 4) = self->_dateAdj;
  *((unsigned char *)v4 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 5) = self->_duraAdj;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_11:
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
      goto LABEL_16;
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
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2EventBannerConfirmedReadFrom((uint64_t)self, (uint64_t)a3);
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
      uint64_t v8 = off_1E5B8FB18[app];
    }
    [v4 setObject:v8 forKey:@"app"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t category = self->_category;
  if (category >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_category);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = off_1E5B8FB30[category];
  }
  [v4 setObject:v10 forKey:@"category"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_19:
  int extracted = self->_extracted;
  if (extracted)
  {
    if (extracted == 1)
    {
      v12 = @"SGMEventExtractionTypeTemplate";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extracted);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = @"SGMEventExtractionTypeICal";
  }
  [v4 setObject:v12 forKey:@"extracted"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t state = self->_state;
  if (state >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E5B8FB90[state];
  }
  [v4 setObject:v14 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
LABEL_33:
    uint64_t dateAdj = self->_dateAdj;
    if (dateAdj >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dateAdj);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E5B8FBD0[dateAdj];
    }
    [v4 setObject:v18 forKey:@"dateAdj"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_37;
  }
LABEL_29:
  uint64_t titleAdj = self->_titleAdj;
  if (titleAdj >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_titleAdj);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E5B8FBA8[titleAdj];
  }
  [v4 setObject:v16 forKey:@"titleAdj"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_33;
  }
LABEL_9:
  if ((has & 8) != 0)
  {
LABEL_37:
    uint64_t duraAdj = self->_duraAdj;
    if (duraAdj >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_duraAdj);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_1E5B8FC20[duraAdj];
    }
    [v4 setObject:v20 forKey:@"duraAdj"];
  }
LABEL_41:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2EventBannerConfirmed;
  id v4 = [(SGM2EventBannerConfirmed *)&v8 description];
  uint64_t v5 = [(SGM2EventBannerConfirmed *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsDuraAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventDurationAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjLessThan30Min"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdj30To60Min"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdj1To2Hours"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMEventDurationAdjMoreThan2Hours"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)duraAdjAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FC20[a3];
  }

  return v3;
}

- (BOOL)hasDuraAdj
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDuraAdj:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setDuraAdj:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t duraAdj = a3;
}

- (int)duraAdj
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_duraAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsDateAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventDateAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjChangedDay"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime2hPlus"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime2h"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjSubTime1h"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime1h"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime2h"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjAddTime2hPlus"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMEventDateAdjChangedDayAndTime"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dateAdjAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FBD0[a3];
  }

  return v3;
}

- (BOOL)hasDateAdj
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDateAdj:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDateAdj:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t dateAdj = a3;
}

- (int)dateAdj
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_dateAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsTitleAdj:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventStringAdjNA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjConfirmed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjPrefixAdded"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjSuffixAdded"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventStringAdjReplaced"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)titleAdjAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FBA8[a3];
  }

  return v3;
}

- (BOOL)hasTitleAdj
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasTitleAdj:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setTitleAdj:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_uint64_t titleAdj = a3;
}

- (int)titleAdj
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_titleAdj;
  }
  else {
    return 0;
  }
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventStateUpdate"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventStateCancel"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventStateNew"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FB90[a3];
  }

  return v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_uint64_t state = a3;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (int)StringAsExtracted:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventExtractionTypeICal"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SGMEventExtractionTypeTemplate"];
  }

  return v4;
}

- (id)extractedAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SGMEventExtractionTypeTemplate";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SGMEventExtractionTypeICal";
  }
  return v4;
}

- (BOOL)hasExtracted
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasExtracted:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setExtracted:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int extracted = a3;
}

- (int)extracted
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_extracted;
  }
  else {
    return 0;
  }
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventCategoryFlight"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryBus"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryTrain"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryHotel"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryCar"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryTicket"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryMovie"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryFood"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMEventCategorySocial"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryOther"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryBoat"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SGMEventCategoryAppointment"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FB30[a3];
  }

  return v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t category = a3;
}

- (int)category
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_category;
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
    id v3 = off_1E5B8FB18[a3];
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
    return (NSString *)@"EventBannerConfirmed";
  }
}

@end