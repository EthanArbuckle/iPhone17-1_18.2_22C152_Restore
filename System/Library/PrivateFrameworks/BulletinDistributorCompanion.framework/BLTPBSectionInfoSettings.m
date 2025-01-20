@interface BLTPBSectionInfoSettings
- (BLTPBMuteAssertion)muteAssertion;
- (BOOL)hasAnnounceSetting;
- (BOOL)hasMuteAssertion;
- (BOOL)hasScheduledDeliverySetting;
- (BOOL)hasTimeSensitiveSetting;
- (BOOL)hasUserConfiguredTimeSensitiveSetting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userConfiguredTimeSensitiveSetting;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)announceSetting;
- (int)scheduledDeliverySetting;
- (int)timeSensitiveSetting;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnnounceSetting:(int)a3;
- (void)setHasAnnounceSetting:(BOOL)a3;
- (void)setHasScheduledDeliverySetting:(BOOL)a3;
- (void)setHasTimeSensitiveSetting:(BOOL)a3;
- (void)setHasUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setScheduledDeliverySetting:(int)a3;
- (void)setTimeSensitiveSetting:(int)a3;
- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSectionInfoSettings

- (void)setAnnounceSetting:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_announceSetting = a3;
}

- (void)setHasAnnounceSetting:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAnnounceSetting
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMuteAssertion
{
  return self->_muteAssertion != 0;
}

- (void)setTimeSensitiveSetting:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timeSensitiveSetting = a3;
}

- (void)setHasTimeSensitiveSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeSensitiveSetting
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (void)setHasUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setScheduledDeliverySetting:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_scheduledDeliverySetting = a3;
}

- (void)setHasScheduledDeliverySetting:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheduledDeliverySetting
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionInfoSettings;
  v4 = [(BLTPBSectionInfoSettings *)&v8 description];
  v5 = [(BLTPBSectionInfoSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_announceSetting];
    [v3 setObject:v4 forKey:@"announceSetting"];
  }
  muteAssertion = self->_muteAssertion;
  if (muteAssertion)
  {
    v6 = [(BLTPBMuteAssertion *)muteAssertion dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"muteAssertion"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_timeSensitiveSetting];
    [v3 setObject:v10 forKey:@"timeSensitiveSetting"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithBool:self->_userConfiguredTimeSensitiveSetting];
  [v3 setObject:v11 forKey:@"userConfiguredTimeSensitiveSetting"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithInt:self->_scheduledDeliverySetting];
    [v3 setObject:v8 forKey:@"scheduledDeliverySetting"];
  }
LABEL_9:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionInfoSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_muteAssertion) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_8:
  }
    PBDataWriterWriteInt32Field();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_announceSetting;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_muteAssertion)
  {
    v6 = v4;
    objc_msgSend(v4, "setMuteAssertion:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_timeSensitiveSetting;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 32) = self->_userConfiguredTimeSensitiveSetting;
  *((unsigned char *)v4 + 36) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_8:
    v4[6] = self->_scheduledDeliverySetting;
    *((unsigned char *)v4 + 36) |= 2u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_announceSetting;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v7 = [(BLTPBMuteAssertion *)self->_muteAssertion copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(unsigned char *)(v6 + 32) = self->_userConfiguredTimeSensitiveSetting;
    *(unsigned char *)(v6 + 36) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 28) = self->_timeSensitiveSetting;
  *(unsigned char *)(v6 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_scheduledDeliverySetting;
    *(unsigned char *)(v6 + 36) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_announceSetting != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_27;
  }
  muteAssertion = self->_muteAssertion;
  if ((unint64_t)muteAssertion | *((void *)v4 + 2))
  {
    if (!-[BLTPBMuteAssertion isEqual:](muteAssertion, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_timeSensitiveSetting != *((_DWORD *)v4 + 7)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) != 0)
    {
      if (self->_userConfiguredTimeSensitiveSetting)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    BOOL v7 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 36) & 8) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_scheduledDeliverySetting != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
    BOOL v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_announceSetting;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(BLTPBMuteAssertion *)self->_muteAssertion hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_timeSensitiveSetting;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_userConfiguredTimeSensitiveSetting;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_scheduledDeliverySetting;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[9])
  {
    self->_announceSetting = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  muteAssertion = self->_muteAssertion;
  uint64_t v7 = *((void *)v5 + 2);
  if (muteAssertion)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[BLTPBMuteAssertion mergeFrom:](muteAssertion, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[BLTPBSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:");
  }
  uint64_t v5 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v5 + 36);
  if ((v8 & 4) != 0)
  {
    self->_timeSensitiveSetting = v5[7];
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v5 + 36);
    if ((v8 & 8) == 0)
    {
LABEL_11:
      if ((v8 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v5[9] & 8) == 0)
  {
    goto LABEL_11;
  }
  self->_userConfiguredTimeSensitiveSetting = *((unsigned char *)v5 + 32);
  *(unsigned char *)&self->_has |= 8u;
  if ((v5[9] & 2) != 0)
  {
LABEL_12:
    self->_scheduledDeliverySetting = v5[6];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_13:
  MEMORY[0x270F9A758]();
}

- (int)announceSetting
{
  return self->_announceSetting;
}

- (BLTPBMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void)setMuteAssertion:(id)a3
{
}

- (int)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (BOOL)userConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (int)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (void).cxx_destruct
{
}

@end