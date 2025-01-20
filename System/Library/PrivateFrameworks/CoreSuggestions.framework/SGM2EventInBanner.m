@interface SGM2EventInBanner
- (BOOL)hasApp;
- (BOOL)hasCategory;
- (BOOL)hasExtracted;
- (BOOL)hasKey;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extractedAsString:(int)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsApp:(id)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsExtracted:(id)a3;
- (int)StringAsState:(id)a3;
- (int)app;
- (int)category;
- (int)extracted;
- (int)state;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setCategory:(int)a3;
- (void)setExtracted:(int)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasExtracted:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2EventInBanner

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 3))
  {
    v6 = v4;
    -[SGM2EventInBanner setKey:](self, "setKey:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_app = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((v4[9] & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_category = v4[3];
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_extracted = v4[4];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[9] & 8) != 0)
  {
LABEL_7:
    self->_state = v4[8];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
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
      if ((*(unsigned char *)&self->_has & 4) != 0) {
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
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_extracted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_state;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_category != *((_DWORD *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_extracted != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_state != *((_DWORD *)v4 + 8)) {
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
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 16) = self->_extracted;
      *(unsigned char *)(v5 + 36) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_category;
  *(unsigned char *)(v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_state;
    *(unsigned char *)(v5 + 36) |= 8u;
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
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 3) = self->_category;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 4) = self->_extracted;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 8) = self->_state;
    *((unsigned char *)v4 + 36) |= 8u;
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
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
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
  return SGM2EventInBannerReadFrom((uint64_t)self, (uint64_t)a3);
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
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5B8F980[app];
    }
    [v4 setObject:v8 forKey:@"app"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_16:
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

      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_22;
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
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E5B8F998[category];
  }
  [v4 setObject:v10 forKey:@"category"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_16;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_22:
    uint64_t state = self->_state;
    if (state >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_state);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E5B8F9F8[state];
    }
    [v4 setObject:v14 forKey:@"state"];
  }
LABEL_26:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2EventInBanner;
  id v4 = [(SGM2EventInBanner *)&v8 description];
  uint64_t v5 = [(SGM2EventInBanner *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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
    id v3 = off_1E5B8F9F8[a3];
  }

  return v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t state = a3;
}

- (int)state
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
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
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasExtracted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setExtracted:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int extracted = a3;
}

- (int)extracted
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
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
    id v3 = off_1E5B8F998[a3];
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
    id v3 = off_1E5B8F980[a3];
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
    return (NSString *)@"EventInBanner";
  }
}

@end