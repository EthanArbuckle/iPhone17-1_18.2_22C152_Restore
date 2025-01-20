@interface BLTPBSetRemoteGlobalSpokenSettingEnabledRequest
- (BOOL)hasSettingDate;
- (BOOL)hasSettingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)settingEnabled;
- (double)settingDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSettingDate:(BOOL)a3;
- (void)setHasSettingEnabled:(BOOL)a3;
- (void)setSettingDate:(double)a3;
- (void)setSettingEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetRemoteGlobalSpokenSettingEnabledRequest

- (void)setSettingEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_settingEnabled = a3;
}

- (void)setHasSettingEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSettingEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSettingDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_settingDate = a3;
}

- (void)setHasSettingDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSettingDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetRemoteGlobalSpokenSettingEnabledRequest;
  v4 = [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)&v8 description];
  v5 = [(BLTPBSetRemoteGlobalSpokenSettingEnabledRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_settingEnabled];
    [v3 setObject:v5 forKey:@"settingEnabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_settingDate];
    [v3 setObject:v6 forKey:@"settingDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetRemoteGlobalSpokenSettingEnabledRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[16] = self->_settingEnabled;
    v4[20] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_settingDate;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_settingEnabled;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_settingDate;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) != 0)
    {
      if (self->_settingEnabled)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    BOOL v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 20) & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_settingDate != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_settingEnabled;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double settingDate = self->_settingDate;
  double v4 = -settingDate;
  if (settingDate >= 0.0) {
    double v4 = self->_settingDate;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) != 0)
  {
    self->_settingEnabled = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if (v5)
  {
    self->_double settingDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)settingEnabled
{
  return self->_settingEnabled;
}

- (double)settingDate
{
  return self->_settingDate;
}

@end