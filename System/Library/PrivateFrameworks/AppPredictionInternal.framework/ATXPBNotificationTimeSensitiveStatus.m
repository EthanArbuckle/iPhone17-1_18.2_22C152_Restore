@interface ATXPBNotificationTimeSensitiveStatus
- (BOOL)hasBundleId;
- (BOOL)hasIsTimeSensitiveAndEngagedNotification;
- (BOOL)hasIsTimeSensitiveNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTimeSensitiveAndEngagedNotification;
- (BOOL)isTimeSensitiveNotification;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasIsTimeSensitiveAndEngagedNotification:(BOOL)a3;
- (void)setHasIsTimeSensitiveNotification:(BOOL)a3;
- (void)setIsTimeSensitiveAndEngagedNotification:(BOOL)a3;
- (void)setIsTimeSensitiveNotification:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBNotificationTimeSensitiveStatus

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setIsTimeSensitiveNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isTimeSensitiveNotification = a3;
}

- (void)setHasIsTimeSensitiveNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsTimeSensitiveNotification
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsTimeSensitiveAndEngagedNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isTimeSensitiveAndEngagedNotification = a3;
}

- (void)setHasIsTimeSensitiveAndEngagedNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsTimeSensitiveAndEngagedNotification
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBNotificationTimeSensitiveStatus;
  v4 = [(ATXPBNotificationTimeSensitiveStatus *)&v8 description];
  v5 = [(ATXPBNotificationTimeSensitiveStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_isTimeSensitiveNotification];
    [v4 setObject:v7 forKey:@"isTimeSensitiveNotification"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isTimeSensitiveAndEngagedNotification];
    [v4 setObject:v8 forKey:@"isTimeSensitiveAndEngagedNotification"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationTimeSensitiveStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_bundleId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setBundleId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[17] = self->_isTimeSensitiveNotification;
    v4[20] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[16] = self->_isTimeSensitiveAndEngagedNotification;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_isTimeSensitiveNotification;
    *(unsigned char *)(v5 + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 16) = self->_isTimeSensitiveAndEngagedNotification;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_14;
    }
    if (self->_isTimeSensitiveNotification)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_isTimeSensitiveAndEngagedNotification)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_14;
        }
      }
      else if (*((unsigned char *)v4 + 16))
      {
        goto LABEL_14;
      }
      BOOL v6 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v6 = 0;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_isTimeSensitiveNotification;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isTimeSensitiveAndEngagedNotification;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[ATXPBNotificationTimeSensitiveStatus setBundleId:](self, "setBundleId:");
    uint64_t v4 = v6;
  }
  BOOL v5 = v4[20];
  if ((v5 & 2) != 0)
  {
    self->_isTimeSensitiveNotification = v4[17];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[20];
  }
  if (v5)
  {
    self->_isTimeSensitiveAndEngagedNotification = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isTimeSensitiveNotification
{
  return self->_isTimeSensitiveNotification;
}

- (BOOL)isTimeSensitiveAndEngagedNotification
{
  return self->_isTimeSensitiveAndEngagedNotification;
}

- (void).cxx_destruct
{
}

@end