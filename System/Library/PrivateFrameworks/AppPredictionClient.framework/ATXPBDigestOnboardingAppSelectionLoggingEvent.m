@interface ATXPBDigestOnboardingAppSelectionLoggingEvent
- (BOOL)addedToDigest;
- (BOOL)hasAddedToDigest;
- (BOOL)hasAvgNumBasicNotifications;
- (BOOL)hasAvgNumMessageNotifications;
- (BOOL)hasAvgNumTimeSensitiveNonMessageNotifications;
- (BOOL)hasBundleId;
- (BOOL)hasRank;
- (BOOL)hasSessionUUID;
- (BOOL)hasWasShownInDigestOnboarding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasShownInDigestOnboarding;
- (NSString)bundleId;
- (NSString)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)avgNumBasicNotifications;
- (unsigned)avgNumMessageNotifications;
- (unsigned)avgNumTimeSensitiveNonMessageNotifications;
- (unsigned)rank;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddedToDigest:(BOOL)a3;
- (void)setAvgNumBasicNotifications:(unsigned int)a3;
- (void)setAvgNumMessageNotifications:(unsigned int)a3;
- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unsigned int)a3;
- (void)setBundleId:(id)a3;
- (void)setHasAddedToDigest:(BOOL)a3;
- (void)setHasAvgNumBasicNotifications:(BOOL)a3;
- (void)setHasAvgNumMessageNotifications:(BOOL)a3;
- (void)setHasAvgNumTimeSensitiveNonMessageNotifications:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasWasShownInDigestOnboarding:(BOOL)a3;
- (void)setRank:(unsigned int)a3;
- (void)setSessionUUID:(id)a3;
- (void)setWasShownInDigestOnboarding:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBDigestOnboardingAppSelectionLoggingEvent

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setAvgNumBasicNotifications:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_avgNumBasicNotifications = a3;
}

- (void)setHasAvgNumBasicNotifications:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvgNumBasicNotifications
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAvgNumMessageNotifications:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_avgNumMessageNotifications = a3;
}

- (void)setHasAvgNumMessageNotifications:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvgNumMessageNotifications
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAvgNumTimeSensitiveNonMessageNotifications:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_avgNumTimeSensitiveNonMessageNotifications = a3;
}

- (void)setHasAvgNumTimeSensitiveNonMessageNotifications:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAvgNumTimeSensitiveNonMessageNotifications
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRank:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRank
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAddedToDigest:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_addedToDigest = a3;
}

- (void)setHasAddedToDigest:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAddedToDigest
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setWasShownInDigestOnboarding:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_wasShownInDigestOnboarding = a3;
}

- (void)setHasWasShownInDigestOnboarding:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWasShownInDigestOnboarding
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBDigestOnboardingAppSelectionLoggingEvent;
  v4 = [(ATXPBDigestOnboardingAppSelectionLoggingEvent *)&v8 description];
  v5 = [(ATXPBDigestOnboardingAppSelectionLoggingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v4 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_avgNumBasicNotifications];
    [v4 setObject:v10 forKey:@"avgNumBasicNotifications"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithUnsignedInt:self->_avgNumMessageNotifications];
  [v4 setObject:v11 forKey:@"avgNumMessageNotifications"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  v12 = [NSNumber numberWithUnsignedInt:self->_avgNumTimeSensitiveNonMessageNotifications];
  [v4 setObject:v12 forKey:@"avgNumTimeSensitiveNonMessageNotifications"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithUnsignedInt:self->_rank];
  [v4 setObject:v13 forKey:@"rank"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v14 = [NSNumber numberWithBool:self->_addedToDigest];
  [v4 setObject:v14 forKey:@"addedToDigest"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithBool:self->_wasShownInDigestOnboarding];
    [v4 setObject:v8 forKey:@"wasShownInDigestOnboarding"];
  }
LABEL_12:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestOnboardingAppSelectionLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    id v4 = v6;
  }
  if (self->_bundleId)
  {
    objc_msgSend(v6, "setBundleId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_avgNumBasicNotifications;
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 3) = self->_avgNumMessageNotifications;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 4) = self->_avgNumTimeSensitiveNonMessageNotifications;
  *((unsigned char *)v4 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_rank;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  *((unsigned char *)v4 + 48) = self->_addedToDigest;
  *((unsigned char *)v4 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 49) = self->_wasShownInDigestOnboarding;
    *((unsigned char *)v4 + 52) |= 0x20u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_avgNumBasicNotifications;
    *(unsigned char *)(v5 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_avgNumMessageNotifications;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 16) = self->_avgNumTimeSensitiveNonMessageNotifications;
  *(unsigned char *)(v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(unsigned char *)(v5 + 48) = self->_addedToDigest;
    *(unsigned char *)(v5 + 52) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 32) = self->_rank;
  *(unsigned char *)(v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x20) != 0)
  {
LABEL_7:
    *(unsigned char *)(v5 + 49) = self->_wasShownInDigestOnboarding;
    *(unsigned char *)(v5 + 52) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:")) {
      goto LABEL_36;
    }
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_avgNumBasicNotifications != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_avgNumMessageNotifications != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_avgNumTimeSensitiveNonMessageNotifications != *((_DWORD *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_rank != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_36;
    }
    if (self->_addedToDigest)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
    {
      if (self->_wasShownInDigestOnboarding)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_36;
        }
      }
      else if (*((unsigned char *)v4 + 49))
      {
        goto LABEL_36;
      }
      BOOL v7 = 1;
      goto LABEL_37;
    }
LABEL_36:
    BOOL v7 = 0;
  }
LABEL_37:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionUUID hash];
  NSUInteger v4 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_avgNumBasicNotifications;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_avgNumMessageNotifications;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_avgNumTimeSensitiveNonMessageNotifications;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_rank;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_11:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_addedToDigest;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_wasShownInDigestOnboarding;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[ATXPBDigestOnboardingAppSelectionLoggingEvent setSessionUUID:](self, "setSessionUUID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[ATXPBDigestOnboardingAppSelectionLoggingEvent setBundleId:](self, "setBundleId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_avgNumBasicNotifications = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_avgNumMessageNotifications = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_avgNumTimeSensitiveNonMessageNotifications = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_rank = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_addedToDigest = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
LABEL_11:
    self->_wasShownInDigestOnboarding = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_12:
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (unsigned)avgNumBasicNotifications
{
  return self->_avgNumBasicNotifications;
}

- (unsigned)avgNumMessageNotifications
{
  return self->_avgNumMessageNotifications;
}

- (unsigned)avgNumTimeSensitiveNonMessageNotifications
{
  return self->_avgNumTimeSensitiveNonMessageNotifications;
}

- (unsigned)rank
{
  return self->_rank;
}

- (BOOL)addedToDigest
{
  return self->_addedToDigest;
}

- (BOOL)wasShownInDigestOnboarding
{
  return self->_wasShownInDigestOnboarding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end