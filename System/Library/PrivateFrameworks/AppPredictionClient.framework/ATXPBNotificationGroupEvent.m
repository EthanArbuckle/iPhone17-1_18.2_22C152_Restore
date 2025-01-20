@interface ATXPBNotificationGroupEvent
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (double)secondsSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)eventType;
- (uint64_t)hasEventType;
- (uint64_t)hasSecondsSinceReferenceDate;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)setHasSecondsSinceReferenceDate:(uint64_t)result;
- (uint64_t)setSecondsSinceReferenceDate:(uint64_t)result;
- (uint64_t)uuid;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setUuid:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBNotificationGroupEvent

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 32) & 2) != 0) {
      return *(unsigned int *)(result + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D07450[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unused"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"NotificationCenterAppeared"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"NotificationCenterDisappeared"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"NotificationCenterClearAll"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"MissedBundleAppeared"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"MissedBundleExpired"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"MissedBundleExpanded"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"MissedBundleCollapsed"])
    {
      uint64_t v6 = 13;
    }
    else if ([v5 isEqualToString:@"MissedBundleDismissed"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"DigestAppeared"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"DigestExpired"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"DigestExpanded"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"DigestCollapsed"])
    {
      uint64_t v6 = 14;
    }
    else if ([v5 isEqualToString:@"DigestDismissed"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"DigestClearAll"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"SpringboardRestart"])
    {
      uint64_t v6 = 15;
    }
    else if ([v5 isEqualToString:@"PriorityNotificationsSectionAppeared"])
    {
      uint64_t v6 = 16;
    }
    else if ([v5 isEqualToString:@"PriorityNotificationsSectionDisappeared"])
    {
      uint64_t v6 = 17;
    }
    else if ([v5 isEqualToString:@"PriorityNotificationsSectionExpanded"])
    {
      uint64_t v6 = 18;
    }
    else if ([v5 isEqualToString:@"PriorityNotificationsSectionCollapsed"])
    {
      uint64_t v6 = 19;
    }
    else if ([v5 isEqualToString:@"PriorityNotificationsSectionClearAll"])
    {
      uint64_t v6 = 20;
    }
    else if ([v5 isEqualToString:@"Total"])
    {
      uint64_t v6 = 21;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasUuid
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (uint64_t)setSecondsSinceReferenceDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasSecondsSinceReferenceDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasSecondsSinceReferenceDate
{
  if (result) {
    return *(unsigned char *)(result + 32) & 1;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBNotificationGroupEvent;
  v4 = [(ATXPBNotificationGroupEvent *)&v8 description];
  id v5 = [(ATXPBNotificationGroupEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E5D07450[eventType];
    }
    [v3 setObject:v5 forKey:@"eventType"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithDouble:self->_secondsSinceReferenceDate];
    [v3 setObject:v7 forKey:@"secondsSinceReferenceDate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationGroupEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 32) & 2) != 0)
    {
      v3[4] = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v3 + 32) |= 2u;
    }
    id v4 = *(void **)(a1 + 24);
    if (v4)
    {
      id v5 = v3;
      -[ATXPBNotificationGroupEvent setUuid:]((uint64_t)v3, v4);
      id v3 = v5;
    }
    if (*(unsigned char *)(a1 + 32))
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 32) |= 1u;
    }
  }
}

- (void)setUuid:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_uuid copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_secondsSinceReferenceDate;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_14:
      BOOL v7 = 0;
      goto LABEL_15;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
    BOOL v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_uuid hash];
  if (*(unsigned char *)&self->_has)
  {
    double secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    double v7 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0) {
      double v7 = self->_secondsSinceReferenceDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if ((v3[8] & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = v3[4];
      *(unsigned char *)(a1 + 32) |= 2u;
    }
    NSUInteger v4 = (void *)*((void *)v3 + 3);
    if (v4)
    {
      unint64_t v5 = v3;
      objc_storeStrong((id *)(a1 + 24), v4);
      uint64_t v3 = v5;
    }
    if (v3[8])
    {
      *(void *)(a1 + 8) = *((void *)v3 + 1);
      *(unsigned char *)(a1 + 32) |= 1u;
    }
  }
}

- (uint64_t)uuid
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (double)secondsSinceReferenceDate
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
}

@end