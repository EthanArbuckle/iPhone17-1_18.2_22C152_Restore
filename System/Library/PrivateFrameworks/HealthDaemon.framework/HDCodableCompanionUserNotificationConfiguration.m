@interface HDCodableCompanionUserNotificationConfiguration
- (BOOL)hasNotificationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationTypeAsString:(int)a3;
- (int)StringAsNotificationType:(id)a3;
- (int)notificationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNotificationType:(BOOL)a3;
- (void)setNotificationType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableCompanionUserNotificationConfiguration

- (int)notificationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_notificationType;
  }
  else {
    return 0;
  }
}

- (void)setNotificationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)notificationTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"HeartRhythmDataAvailable";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"None";
  }
  return v4;
}

- (int)StringAsNotificationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"HeartRhythmDataAvailable"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableCompanionUserNotificationConfiguration;
  int v4 = [(HDCodableCompanionUserNotificationConfiguration *)&v8 description];
  v5 = [(HDCodableCompanionUserNotificationConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int notificationType = self->_notificationType;
    if (notificationType)
    {
      if (notificationType == 1)
      {
        v5 = @"HeartRhythmDataAvailable";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_notificationType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"None";
    }
    [v3 setObject:v5 forKey:@"notificationType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableCompanionUserNotificationConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_notificationType;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_notificationType;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_notificationType == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_notificationType;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_int notificationType = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

@end