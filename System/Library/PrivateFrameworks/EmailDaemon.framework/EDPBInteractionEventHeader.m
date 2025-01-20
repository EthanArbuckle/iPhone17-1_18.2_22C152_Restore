@interface EDPBInteractionEventHeader
- (BOOL)categoryRootInstalled;
- (BOOL)hasCategoryRootInstalled;
- (BOOL)hasDeviceId;
- (BOOL)hasLocale;
- (BOOL)hasTimezoneOffset;
- (BOOL)hasUserId;
- (BOOL)hasUserSegment;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)messageFrameType;
- (int)timezoneOffset;
- (int64_t)deviceId;
- (int64_t)userId;
- (unint64_t)hash;
- (unsigned)userSegment;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoryRootInstalled:(BOOL)a3;
- (void)setDeviceId:(int64_t)a3;
- (void)setHasCategoryRootInstalled:(BOOL)a3;
- (void)setHasDeviceId:(BOOL)a3;
- (void)setHasTimezoneOffset:(BOOL)a3;
- (void)setHasUserId:(BOOL)a3;
- (void)setHasUserSegment:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setTimezoneOffset:(int)a3;
- (void)setUserId:(int64_t)a3;
- (void)setUserSegment:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventHeader

- (int)messageFrameType
{
  return 4;
}

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setUserId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userId = a3;
}

- (void)setHasUserId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceId = a3;
}

- (void)setHasDeviceId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)setTimezoneOffset:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timezoneOffset = a3;
}

- (void)setHasTimezoneOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimezoneOffset
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setUserSegment:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userSegment = a3;
}

- (void)setHasUserSegment:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserSegment
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCategoryRootInstalled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_categoryRootInstalled = a3;
}

- (void)setHasCategoryRootInstalled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCategoryRootInstalled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventHeader;
  v4 = [(EDPBInteractionEventHeader *)&v8 description];
  v5 = [(EDPBInteractionEventHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_userId];
    [v3 setObject:v6 forKey:@"user_id"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_deviceId];
    [v3 setObject:v7 forKey:@"device_id"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 4) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_timezoneOffset];
    [v3 setObject:v10 forKey:@"timezone_offset"];

    char v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_userSegment];
    [v3 setObject:v11 forKey:@"user_segment"];

    char v9 = (char)self->_has;
  }
  if ((v9 & 0x20) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_categoryRootInstalled];
    [v3 setObject:v12 forKey:@"category_root_installed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteSint64Field();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) != 0)
  {
    PBDataWriterWriteSint32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[10] = self->_version;
    *((unsigned char *)v4 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 2) = self->_userId;
  *((unsigned char *)v4 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_deviceId;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_5:
  v7 = v4;
  if (self->_locale) {
    objc_msgSend(v4, "setLocale:");
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    v7[8] = self->_timezoneOffset;
    *((unsigned char *)v7 + 48) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v7[9] = self->_userSegment;
  *((unsigned char *)v7 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_10:
    *((unsigned char *)v7 + 44) = self->_categoryRootInstalled;
    *((unsigned char *)v7 + 48) |= 0x20u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_version;
    *(unsigned char *)(v5 + 48) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_userId;
  *(unsigned char *)(v5 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_deviceId;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  char v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    *(_DWORD *)(v6 + 36) = self->_userSegment;
    *(unsigned char *)(v6 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 32) = self->_timezoneOffset;
  *(unsigned char *)(v6 + 48) |= 4u;
  char v10 = (char)self->_has;
  if ((v10 & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v10 & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 44) = self->_categoryRootInstalled;
    *(unsigned char *)(v6 + 48) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_userId != *((void *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_deviceId != *((void *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_32;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_32;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_timezoneOffset != *((_DWORD *)v4 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_userSegment != *((_DWORD *)v4 + 9)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_32;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
    {
      if (self->_categoryRootInstalled)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 44))
      {
        goto LABEL_32;
      }
      BOOL v7 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v7 = 0;
  }
LABEL_33:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_userId;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_deviceId;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6;
  }
  uint64_t v7 = 2654435761 * self->_timezoneOffset;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v8 = 2654435761 * self->_userSegment;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_categoryRootInstalled;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_userId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_4:
    self->_deviceId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 3)) {
    -[EDPBInteractionEventHeader setLocale:](self, "setLocale:");
  }
  char v6 = *((unsigned char *)v7 + 48);
  if ((v6 & 4) != 0)
  {
    self->_timezoneOffset = *((_DWORD *)v7 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v7 + 48);
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v7 + 48) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_userSegment = *((_DWORD *)v7 + 9);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v7 + 48) & 0x20) != 0)
  {
LABEL_10:
    self->_categoryRootInstalled = *((unsigned char *)v7 + 44);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_11:
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)userId
{
  return self->_userId;
}

- (int64_t)deviceId
{
  return self->_deviceId;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (int)timezoneOffset
{
  return self->_timezoneOffset;
}

- (unsigned)userSegment
{
  return self->_userSegment;
}

- (BOOL)categoryRootInstalled
{
  return self->_categoryRootInstalled;
}

- (void).cxx_destruct
{
}

@end