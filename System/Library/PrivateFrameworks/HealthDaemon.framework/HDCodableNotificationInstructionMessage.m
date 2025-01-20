@interface HDCodableNotificationInstructionMessage
- (BOOL)hasAction;
- (BOOL)hasCategoryIdentifier;
- (BOOL)hasClientIdentifier;
- (BOOL)hasCreationDateTimeInterval;
- (BOOL)hasCriteria;
- (BOOL)hasCurrentCompatibilityVersion;
- (BOOL)hasExpirationDateTimeInterval;
- (BOOL)hasMinimumCompatibleVersion;
- (BOOL)hasSendingDeviceInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableNotificationInstructionCriteria)criteria;
- (NSString)categoryIdentifier;
- (NSString)clientIdentifier;
- (NSString)sendingDeviceInfo;
- (double)creationDateTimeInterval;
- (double)expirationDateTimeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)action;
- (int64_t)currentCompatibilityVersion;
- (int64_t)minimumCompatibleVersion;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCreationDateTimeInterval:(double)a3;
- (void)setCriteria:(id)a3;
- (void)setCurrentCompatibilityVersion:(int64_t)a3;
- (void)setExpirationDateTimeInterval:(double)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setHasCreationDateTimeInterval:(BOOL)a3;
- (void)setHasCurrentCompatibilityVersion:(BOOL)a3;
- (void)setHasExpirationDateTimeInterval:(BOOL)a3;
- (void)setHasMinimumCompatibleVersion:(BOOL)a3;
- (void)setMinimumCompatibleVersion:(int64_t)a3;
- (void)setSendingDeviceInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableNotificationInstructionMessage

- (void)setCurrentCompatibilityVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_currentCompatibilityVersion = a3;
}

- (void)setHasCurrentCompatibilityVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCurrentCompatibilityVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinimumCompatibleVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minimumCompatibleVersion = a3;
}

- (void)setHasMinimumCompatibleVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumCompatibleVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCreationDateTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_creationDateTimeInterval = a3;
}

- (void)setHasCreationDateTimeInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDateTimeInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSendingDeviceInfo
{
  return self->_sendingDeviceInfo != 0;
}

- (void)setAction:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasCategoryIdentifier
{
  return self->_categoryIdentifier != 0;
}

- (void)setExpirationDateTimeInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_expirationDateTimeInterval = a3;
}

- (void)setHasExpirationDateTimeInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpirationDateTimeInterval
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableNotificationInstructionMessage;
  v4 = [(HDCodableNotificationInstructionMessage *)&v8 description];
  v5 = [(HDCodableNotificationInstructionMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = [NSNumber numberWithLongLong:self->_currentCompatibilityVersion];
    [v3 setObject:v14 forKey:@"currentCompatibilityVersion"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v15 = [NSNumber numberWithLongLong:self->_minimumCompatibleVersion];
  [v3 setObject:v15 forKey:@"minimumCompatibleVersion"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithDouble:self->_creationDateTimeInterval];
    [v3 setObject:v5 forKey:@"creationDateTimeInterval"];
  }
LABEL_5:
  sendingDeviceInfo = self->_sendingDeviceInfo;
  if (sendingDeviceInfo) {
    [v3 setObject:sendingDeviceInfo forKey:@"sendingDeviceInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithLongLong:self->_action];
    [v3 setObject:v7 forKey:@"action"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  categoryIdentifier = self->_categoryIdentifier;
  if (categoryIdentifier) {
    [v3 setObject:categoryIdentifier forKey:@"categoryIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_expirationDateTimeInterval];
    [v3 setObject:v10 forKey:@"expirationDateTimeInterval"];
  }
  criteria = self->_criteria;
  if (criteria)
  {
    v12 = [(HDCodableNotificationInstructionCriteria *)criteria dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"criteria"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
  if (self->_sendingDeviceInfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_categoryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_criteria)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = self->_currentCompatibilityVersion;
    *((unsigned char *)v4 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_minimumCompatibleVersion;
  *((unsigned char *)v4 + 80) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = *(void *)&self->_creationDateTimeInterval;
    *((unsigned char *)v4 + 80) |= 2u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_sendingDeviceInfo)
  {
    objc_msgSend(v4, "setSendingDeviceInfo:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_action;
    *((unsigned char *)v4 + 80) |= 1u;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v6, "setClientIdentifier:");
    id v4 = v6;
  }
  if (self->_categoryIdentifier)
  {
    objc_msgSend(v6, "setCategoryIdentifier:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[4] = *(void *)&self->_expirationDateTimeInterval;
    *((unsigned char *)v4 + 80) |= 8u;
  }
  if (self->_criteria)
  {
    objc_msgSend(v6, "setCriteria:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_currentCompatibilityVersion;
    *(unsigned char *)(v5 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_minimumCompatibleVersion;
  *(unsigned char *)(v5 + 80) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_creationDateTimeInterval;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_sendingDeviceInfo copyWithZone:a3];
  v9 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_action;
    *(unsigned char *)(v6 + 80) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_categoryIdentifier copyWithZone:a3];
  v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(double *)(v6 + 32) = self->_expirationDateTimeInterval;
    *(unsigned char *)(v6 + 80) |= 8u;
  }
  id v14 = [(HDCodableNotificationInstructionCriteria *)self->_criteria copyWithZone:a3];
  v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 80);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_currentCompatibilityVersion != *((void *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_minimumCompatibleVersion != *((void *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_creationDateTimeInterval != *((double *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_36;
  }
  sendingDeviceInfo = self->_sendingDeviceInfo;
  if ((unint64_t)sendingDeviceInfo | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sendingDeviceInfo, "isEqual:"))
    {
LABEL_36:
      char v11 = 0;
      goto LABEL_37;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_action != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (v6)
  {
    goto LABEL_36;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((void *)v4 + 7)
    && !-[NSString isEqual:](clientIdentifier, "isEqual:"))
  {
    goto LABEL_36;
  }
  categoryIdentifier = self->_categoryIdentifier;
  if ((unint64_t)categoryIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](categoryIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_expirationDateTimeInterval != *((double *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_36;
  }
  criteria = self->_criteria;
  if ((unint64_t)criteria | *((void *)v4 + 8)) {
    char v11 = -[HDCodableNotificationInstructionCriteria isEqual:](criteria, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v9 = 0;
    goto LABEL_13;
  }
  uint64_t v3 = 2654435761 * self->_currentCompatibilityVersion;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_minimumCompatibleVersion;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double creationDateTimeInterval = self->_creationDateTimeInterval;
  double v6 = -creationDateTimeInterval;
  if (creationDateTimeInterval >= 0.0) {
    double v6 = self->_creationDateTimeInterval;
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
LABEL_13:
  NSUInteger v10 = [(NSString *)self->_sendingDeviceInfo hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_action;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_clientIdentifier hash];
  NSUInteger v13 = [(NSString *)self->_categoryIdentifier hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    double expirationDateTimeInterval = self->_expirationDateTimeInterval;
    double v16 = -expirationDateTimeInterval;
    if (expirationDateTimeInterval >= 0.0) {
      double v16 = self->_expirationDateTimeInterval;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ [(HDCodableNotificationInstructionCriteria *)self->_criteria hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 80);
  if ((v6 & 4) != 0)
  {
    self->_currentCompatibilityVersion = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 80);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_minimumCompatibleVersion = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
LABEL_4:
    self->_double creationDateTimeInterval = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  id v9 = v4;
  if (*((void *)v4 + 9))
  {
    -[HDCodableNotificationInstructionMessage setSendingDeviceInfo:](self, "setSendingDeviceInfo:");
    id v5 = v9;
  }
  if (*((unsigned char *)v5 + 80))
  {
    self->_action = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 7))
  {
    -[HDCodableNotificationInstructionMessage setClientIdentifier:](self, "setClientIdentifier:");
    id v5 = v9;
  }
  if (*((void *)v5 + 6))
  {
    -[HDCodableNotificationInstructionMessage setCategoryIdentifier:](self, "setCategoryIdentifier:");
    id v5 = v9;
  }
  if ((*((unsigned char *)v5 + 80) & 8) != 0)
  {
    self->_double expirationDateTimeInterval = *((double *)v5 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  criteria = self->_criteria;
  uint64_t v8 = *((void *)v5 + 8);
  if (criteria)
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[HDCodableNotificationInstructionCriteria mergeFrom:](criteria, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_24;
    }
    -[HDCodableNotificationInstructionMessage setCriteria:](self, "setCriteria:");
  }
  id v5 = v9;
LABEL_24:
}

- (int64_t)currentCompatibilityVersion
{
  return self->_currentCompatibilityVersion;
}

- (int64_t)minimumCompatibleVersion
{
  return self->_minimumCompatibleVersion;
}

- (double)creationDateTimeInterval
{
  return self->_creationDateTimeInterval;
}

- (NSString)sendingDeviceInfo
{
  return self->_sendingDeviceInfo;
}

- (void)setSendingDeviceInfo:(id)a3
{
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (double)expirationDateTimeInterval
{
  return self->_expirationDateTimeInterval;
}

- (HDCodableNotificationInstructionCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end