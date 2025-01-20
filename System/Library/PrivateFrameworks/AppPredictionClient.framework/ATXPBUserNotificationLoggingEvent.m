@interface ATXPBUserNotificationLoggingEvent
- (ATXPBUserNotification)notification;
- (BOOL)hasDeliveryReason;
- (BOOL)hasDeliveryUI;
- (BOOL)hasEventType;
- (BOOL)hasModeIdentifier;
- (BOOL)hasNotification;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)modeIdentifier;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deliveryReasonAsString:(int)a3;
- (id)deliveryUIAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (int)StringAsDeliveryReason:(id)a3;
- (int)StringAsDeliveryUI:(id)a3;
- (int)StringAsEventType:(id)a3;
- (int)deliveryReason;
- (int)deliveryUI;
- (int)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeliveryReason:(int)a3;
- (void)setDeliveryUI:(int)a3;
- (void)setEventType:(int)a3;
- (void)setHasDeliveryReason:(BOOL)a3;
- (void)setHasDeliveryUI:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setModeIdentifier:(id)a3;
- (void)setNotification:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationLoggingEvent

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPBUserNotificationLoggingEvent *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      v7 = [ATXPBUserNotification alloc];
      v8 = [v6 objectForKeyedSubscript:@"notification"];
      id v9 = [(ATXPBUserNotification *)v7 initFromJSON:v8];
      [(ATXPBUserNotificationLoggingEvent *)v5 setNotification:v9];

      id v10 = [v6 objectForKeyedSubscript:@"eventType"];
      if ([v10 isEqualToString:@"Received"])
      {
        uint64_t v11 = 0;
      }
      else if ([v10 isEqualToString:@"DefaultAction"])
      {
        uint64_t v11 = 1;
      }
      else if ([v10 isEqualToString:@"SupplementaryAction"])
      {
        uint64_t v11 = 2;
      }
      else if ([v10 isEqualToString:@"Clear"])
      {
        uint64_t v11 = 3;
      }
      else if ([v10 isEqualToString:@"NotificationCenterClearAll"])
      {
        uint64_t v11 = 4;
      }
      else if ([v10 isEqualToString:@"Removed"])
      {
        uint64_t v11 = 5;
      }
      else if ([v10 isEqualToString:@"Hide"])
      {
        uint64_t v11 = 6;
      }
      else if ([v10 isEqualToString:@"LongLook"])
      {
        uint64_t v11 = 7;
      }
      else if ([v10 isEqualToString:@"Silence"])
      {
        uint64_t v11 = 8;
      }
      else if ([v10 isEqualToString:@"AppLaunch"])
      {
        uint64_t v11 = 9;
      }
      else if ([v10 isEqualToString:@"Expired"])
      {
        uint64_t v11 = 10;
      }
      else if ([v10 isEqualToString:@"BannerPulldown"])
      {
        uint64_t v11 = 11;
      }
      else if ([v10 isEqualToString:@"TapCoalesce"])
      {
        uint64_t v11 = 12;
      }
      else if ([v10 isEqualToString:@"TapExpand"])
      {
        uint64_t v11 = 19;
      }
      else if ([v10 isEqualToString:@"Deduped"])
      {
        uint64_t v11 = 13;
      }
      else if ([v10 isEqualToString:@"DevActivated"])
      {
        uint64_t v11 = 14;
      }
      else if ([v10 isEqualToString:@"DevUnlocked"])
      {
        uint64_t v11 = 15;
      }
      else if ([v10 isEqualToString:@"ReceivedAndDeliveredProminently"])
      {
        uint64_t v11 = 16;
      }
      else if ([v10 isEqualToString:@"ReceivedAndDeliveredNonprominently"])
      {
        uint64_t v11 = 17;
      }
      else if ([v10 isEqualToString:@"Modified"])
      {
        uint64_t v11 = 18;
      }
      else if ([v10 isEqualToString:@"ShortLookDefaultAction"])
      {
        uint64_t v11 = 20;
      }
      else if ([v10 isEqualToString:@"ShortLookDismiss"])
      {
        uint64_t v11 = 21;
      }
      else if ([v10 isEqualToString:@"ShortLookClear"])
      {
        uint64_t v11 = 22;
      }
      else if ([v10 isEqualToString:@"LongLookDefaultAction"])
      {
        uint64_t v11 = 23;
      }
      else if ([v10 isEqualToString:@"LongLookCustomAction"])
      {
        uint64_t v11 = 24;
      }
      else if ([v10 isEqualToString:@"LongLookDismiss"])
      {
        uint64_t v11 = 25;
      }
      else if ([v10 isEqualToString:@"LongLookRepark"])
      {
        uint64_t v11 = 26;
      }
      else if ([v10 isEqualToString:@"Total"])
      {
        uint64_t v11 = 27;
      }
      else
      {
        uint64_t v11 = 0;
      }

      [(ATXPBUserNotificationLoggingEvent *)v5 setEventType:v11];
      v12 = [v6 objectForKeyedSubscript:@"timestamp"];
      [v12 doubleValue];
      -[ATXPBUserNotificationLoggingEvent setTimestamp:](v5, "setTimestamp:");
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"notification";
  v3 = [(ATXPBUserNotification *)self->_notification jsonRepresentation];
  id v4 = +[ATXJSONHelper wrapObject:v3];
  v13[0] = v4;
  v12[1] = @"eventType";
  uint64_t eventType = self->_eventType;
  if (eventType >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E5D06758[eventType];
  }
  v7 = +[ATXJSONHelper wrapObject:v6];
  v13[1] = v7;
  v12[2] = @"timestamp";
  v8 = [NSNumber numberWithDouble:self->_timestamp];
  id v9 = +[ATXJSONHelper wrapObject:v8];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (BOOL)hasNotification
{
  return self->_notification != 0;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 0x1C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D09798[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Received"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DefaultAction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SupplementaryAction"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NotificationCenterClearAll"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Removed"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Hide"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LongLook"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Silence"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AppLaunch"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Expired"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BannerPulldown"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TapCoalesce"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TapExpand"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"Deduped"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DevActivated"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DevUnlocked"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ReceivedAndDeliveredProminently"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ReceivedAndDeliveredNonprominently"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"Modified"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ShortLookDefaultAction"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ShortLookDismiss"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"ShortLookClear"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"LongLookDefaultAction"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"LongLookCustomAction"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"LongLookDismiss"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"LongLookRepark"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 27;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasModeIdentifier
{
  return self->_modeIdentifier != 0;
}

- (int)deliveryReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_deliveryReason;
  }
  else {
    return 0;
  }
}

- (void)setDeliveryReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deliveryReason = a3;
}

- (void)setHasDeliveryReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeliveryReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)deliveryReasonAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D09878[a3];
  }

  return v3;
}

- (int)StringAsDeliveryReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Application"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Contact"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MatchedContact"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Urgency"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MessageBreakthrough"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)deliveryUI
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_deliveryUI;
  }
  else {
    return 0;
  }
}

- (void)setDeliveryUI:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deliveryUI = a3;
}

- (void)setHasDeliveryUI:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeliveryUI
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)deliveryUIAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D098B8[a3];
  }

  return v3;
}

- (int)StringAsDeliveryUI:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Digest"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MissedNotificationBundle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotificationCenter"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LockScreen"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PriorityNotification"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationLoggingEvent;
  int v4 = [(ATXPBUserNotificationLoggingEvent *)&v8 description];
  v5 = [(ATXPBUserNotificationLoggingEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  notification = self->_notification;
  if (notification)
  {
    v5 = [(ATXPBUserNotification *)notification dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"notification"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 0x1C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D09798[eventType];
    }
    [v3 setObject:v8 forKey:@"eventType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];
  }
  modeIdentifier = self->_modeIdentifier;
  if (modeIdentifier) {
    [v3 setObject:modeIdentifier forKey:@"modeIdentifier"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    uint64_t deliveryReason = self->_deliveryReason;
    if (deliveryReason >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryReason);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E5D09878[deliveryReason];
    }
    [v3 setObject:v13 forKey:@"deliveryReason"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    uint64_t deliveryUI = self->_deliveryUI;
    if (deliveryUI >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryUI);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E5D098B8[deliveryUI];
    }
    [v3 setObject:v15 forKey:@"deliveryUI"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_notification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_modeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_notification)
  {
    objc_msgSend(v4, "setNotification:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_eventType;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_modeIdentifier)
  {
    objc_msgSend(v7, "setModeIdentifier:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_deliveryReason;
    *((unsigned char *)v4 + 48) |= 2u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_deliveryUI;
    *((unsigned char *)v4 + 48) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXPBUserNotification *)self->_notification copyWithZone:a3];
  id v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(unsigned char *)(v5 + 48) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_modeIdentifier copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char v11 = (char)self->_has;
  if ((v11 & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_deliveryReason;
    *(unsigned char *)(v5 + 48) |= 2u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_deliveryUI;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  notification = self->_notification;
  if ((unint64_t)notification | *((void *)v4 + 5))
  {
    if (!-[ATXPBUserNotification isEqual:](notification, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_26;
  }
  modeIdentifier = self->_modeIdentifier;
  if ((unint64_t)modeIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](modeIdentifier, "isEqual:"))
    {
LABEL_26:
      BOOL v8 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_deliveryReason != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v8 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_deliveryUI != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
    BOOL v8 = 1;
  }
LABEL_27:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXPBUserNotification *)self->_notification hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_eventType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
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
  NSUInteger v10 = [(NSString *)self->_modeIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_deliveryReason;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v12 = 2654435761 * self->_deliveryUI;
  return v4 ^ v3 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  notification = self->_notification;
  uint64_t v6 = *((void *)v4 + 5);
  id v9 = v4;
  if (notification)
  {
    if (!v6) {
      goto LABEL_7;
    }
    notification = (ATXPBUserNotification *)-[ATXPBUserNotification mergeFrom:](notification, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    notification = (ATXPBUserNotification *)-[ATXPBUserNotificationLoggingEvent setNotification:](self, "setNotification:");
  }
  id v4 = v9;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 8) != 0)
  {
    self->_uint64_t eventType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if (v7)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    notification = (ATXPBUserNotification *)-[ATXPBUserNotificationLoggingEvent setModeIdentifier:](self, "setModeIdentifier:");
    id v4 = v9;
  }
  char v8 = *((unsigned char *)v4 + 48);
  if ((v8 & 2) != 0)
  {
    self->_uint64_t deliveryReason = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v4 + 48);
  }
  if ((v8 & 4) != 0)
  {
    self->_uint64_t deliveryUI = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }

  MEMORY[0x1F41817F8](notification, v4);
}

- (ATXPBUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)modeIdentifier
{
  return self->_modeIdentifier;
}

- (void)setModeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);

  objc_storeStrong((id *)&self->_modeIdentifier, 0);
}

@end