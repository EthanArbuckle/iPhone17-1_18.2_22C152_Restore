@interface BLTPBSetRemoteGlobalSettingsRequest
- (BOOL)hasGlobalScheduledDeliverySetting;
- (BOOL)hasGlobalSummarizationSetting;
- (BOOL)hasSettingDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)settingDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)globalScheduledDeliverySetting;
- (unint64_t)globalSummarizationSetting;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGlobalScheduledDeliverySetting:(unint64_t)a3;
- (void)setGlobalSummarizationSetting:(unint64_t)a3;
- (void)setHasGlobalScheduledDeliverySetting:(BOOL)a3;
- (void)setHasGlobalSummarizationSetting:(BOOL)a3;
- (void)setHasSettingDate:(BOOL)a3;
- (void)setSettingDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetRemoteGlobalSettingsRequest

- (void)setGlobalScheduledDeliverySetting:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_globalScheduledDeliverySetting = a3;
}

- (void)setHasGlobalScheduledDeliverySetting:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalScheduledDeliverySetting
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSettingDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_settingDate = a3;
}

- (void)setHasSettingDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSettingDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setGlobalSummarizationSetting:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_globalSummarizationSetting = a3;
}

- (void)setHasGlobalSummarizationSetting:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalSummarizationSetting
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetRemoteGlobalSettingsRequest;
  v4 = [(BLTPBSetRemoteGlobalSettingsRequest *)&v8 description];
  v5 = [(BLTPBSetRemoteGlobalSettingsRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_globalScheduledDeliverySetting];
    [v3 setObject:v7 forKey:@"globalScheduledDeliverySetting"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_settingDate];
  [v3 setObject:v8 forKey:@"settingDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_globalSummarizationSetting];
    [v3 setObject:v5 forKey:@"globalSummarizationSetting"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetRemoteGlobalSettingsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_globalScheduledDeliverySetting;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(void *)&self->_settingDate;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_globalSummarizationSetting;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_globalScheduledDeliverySetting;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 3) = *(void *)&self->_settingDate;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = self->_globalSummarizationSetting;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_globalScheduledDeliverySetting != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_settingDate != *((double *)v4 + 3)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_globalSummarizationSetting != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_globalScheduledDeliverySetting;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double settingDate = self->_settingDate;
  double v6 = -settingDate;
  if (settingDate >= 0.0) {
    double v6 = self->_settingDate;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0) {
    unint64_t v10 = 2654435761u * self->_globalSummarizationSetting;
  }
  else {
    unint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_globalScheduledDeliverySetting = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double settingDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_4:
    self->_globalSummarizationSetting = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unint64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (double)settingDate
{
  return self->_settingDate;
}

- (unint64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

@end