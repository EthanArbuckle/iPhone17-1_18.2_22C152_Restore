@interface HKCodableWheelchairSetting
- (BOOL)hasIsUsingWheelchair;
- (BOOL)hasLatestSupportedVersion;
- (BOOL)hasMinimumSupportedVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsingWheelchair;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)latestSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsUsingWheelchair:(BOOL)a3;
- (void)setHasLatestSupportedVersion:(BOOL)a3;
- (void)setHasMinimumSupportedVersion:(BOOL)a3;
- (void)setIsUsingWheelchair:(BOOL)a3;
- (void)setLatestSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableWheelchairSetting

- (void)setIsUsingWheelchair:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isUsingWheelchair = a3;
}

- (void)setHasIsUsingWheelchair:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsUsingWheelchair
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableWheelchairSetting;
  v4 = [(HKCodableWheelchairSetting *)&v8 description];
  v5 = [(HKCodableWheelchairSetting *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isUsingWheelchair];
    [v3 setObject:v7 forKey:@"isUsingWheelchair"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_latestSupportedVersion];
  [v3 setObject:v8 forKey:@"latestSupportedVersion"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_minimumSupportedVersion];
    [v3 setObject:v5 forKey:@"minimumSupportedVersion"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableWheelchairSettingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[24] = self->_isUsingWheelchair;
    v4[28] |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = self->_latestSupportedVersion;
  v4[28] |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((void *)v4 + 2) = self->_minimumSupportedVersion;
    v4[28] |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 24) = self->_isUsingWheelchair;
    *((unsigned char *)result + 28) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_latestSupportedVersion;
  *((unsigned char *)result + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 2) = self->_minimumSupportedVersion;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_isUsingWheelchair)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_19:
    BOOL v5 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 28) & 4) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_latestSupportedVersion != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_19;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_minimumSupportedVersion != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
    BOOL v5 = 1;
  }
LABEL_20:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_isUsingWheelchair;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_latestSupportedVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_minimumSupportedVersion;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_isUsingWheelchair = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_latestSupportedVersion = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_4:
    self->_minimumSupportedVersion = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (BOOL)isUsingWheelchair
{
  return self->_isUsingWheelchair;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

@end