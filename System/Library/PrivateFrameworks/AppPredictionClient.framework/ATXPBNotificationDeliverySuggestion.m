@interface ATXPBNotificationDeliverySuggestion
- (ATXPBInterruptionManagerTuningSuggestion)interruptionManagerTuning;
- (ATXPBNotificationPromotingSuggestion)promoting;
- (ATXPBNotificationQuietingSuggestion)quieting;
- (ATXPBNotificationSmartPauseSuggestion)smartPause;
- (ATXPBSendMessagesToDigestSuggestion)sendMessagesToDigest;
- (ATXPBSendToDigestSuggestion)sendToDigest;
- (ATXPBTurnOffNotificationsForAppSuggestion)turnOffNotificationsForApp;
- (ATXPBUrgencyTuningSuggestion)urgencyTuning;
- (BOOL)hasEntityIdentifier;
- (BOOL)hasInterruptionManagerTuning;
- (BOOL)hasOneofNotificationDeliverySuggestion;
- (BOOL)hasPromoting;
- (BOOL)hasQuieting;
- (BOOL)hasScope;
- (BOOL)hasSendMessagesToDigest;
- (BOOL)hasSendToDigest;
- (BOOL)hasSmartPause;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerNotificationUUID;
- (BOOL)hasTurnOffNotificationsForApp;
- (BOOL)hasUrgencyTuning;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)entityIdentifier;
- (NSString)triggerNotificationUUID;
- (NSString)uuid;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)oneofNotificationDeliverySuggestionAsString:(int)a3;
- (int)StringAsOneofNotificationDeliverySuggestion:(id)a3;
- (int)oneofNotificationDeliverySuggestion;
- (int)scope;
- (unint64_t)hash;
- (void)clearOneofValuesForOneofNotificationDeliverySuggestion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntityIdentifier:(id)a3;
- (void)setHasOneofNotificationDeliverySuggestion:(BOOL)a3;
- (void)setHasScope:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterruptionManagerTuning:(id)a3;
- (void)setOneofNotificationDeliverySuggestion:(int)a3;
- (void)setPromoting:(id)a3;
- (void)setQuieting:(id)a3;
- (void)setScope:(int)a3;
- (void)setSendMessagesToDigest:(id)a3;
- (void)setSendToDigest:(id)a3;
- (void)setSmartPause:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTriggerNotificationUUID:(id)a3;
- (void)setTurnOffNotificationsForApp:(id)a3;
- (void)setUrgencyTuning:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBNotificationDeliverySuggestion

- (BOOL)hasSmartPause
{
  return self->_smartPause != 0;
}

- (void)setSmartPause:(id)a3
{
  v4 = (ATXPBNotificationSmartPauseSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 1;
  smartPause = self->_smartPause;
  self->_smartPause = v4;
}

- (BOOL)hasQuieting
{
  return self->_quieting != 0;
}

- (void)setQuieting:(id)a3
{
  v4 = (ATXPBNotificationQuietingSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 2;
  quieting = self->_quieting;
  self->_quieting = v4;
}

- (BOOL)hasPromoting
{
  return self->_promoting != 0;
}

- (void)setPromoting:(id)a3
{
  v4 = (ATXPBNotificationPromotingSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 3;
  promoting = self->_promoting;
  self->_promoting = v4;
}

- (BOOL)hasInterruptionManagerTuning
{
  return self->_interruptionManagerTuning != 0;
}

- (void)setInterruptionManagerTuning:(id)a3
{
  v4 = (ATXPBInterruptionManagerTuningSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 4;
  interruptionManagerTuning = self->_interruptionManagerTuning;
  self->_interruptionManagerTuning = v4;
}

- (BOOL)hasSendToDigest
{
  return self->_sendToDigest != 0;
}

- (void)setSendToDigest:(id)a3
{
  v4 = (ATXPBSendToDigestSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 5;
  sendToDigest = self->_sendToDigest;
  self->_sendToDigest = v4;
}

- (BOOL)hasUrgencyTuning
{
  return self->_urgencyTuning != 0;
}

- (void)setUrgencyTuning:(id)a3
{
  v4 = (ATXPBUrgencyTuningSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 6;
  urgencyTuning = self->_urgencyTuning;
  self->_urgencyTuning = v4;
}

- (BOOL)hasSendMessagesToDigest
{
  return self->_sendMessagesToDigest != 0;
}

- (void)setSendMessagesToDigest:(id)a3
{
  v4 = (ATXPBSendMessagesToDigestSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 7;
  sendMessagesToDigest = self->_sendMessagesToDigest;
  self->_sendMessagesToDigest = v4;
}

- (BOOL)hasTurnOffNotificationsForApp
{
  return self->_turnOffNotificationsForApp != 0;
}

- (void)setTurnOffNotificationsForApp:(id)a3
{
  v4 = (ATXPBTurnOffNotificationsForAppSuggestion *)a3;
  [(ATXPBNotificationDeliverySuggestion *)self clearOneofValuesForOneofNotificationDeliverySuggestion];
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = 8;
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  self->_turnOffNotificationsForApp = v4;
}

- (int)oneofNotificationDeliverySuggestion
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_oneofNotificationDeliverySuggestion;
  }
  else {
    return 0;
  }
}

- (void)setOneofNotificationDeliverySuggestion:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_oneofNotificationDeliverySuggestion = a3;
}

- (void)setHasOneofNotificationDeliverySuggestion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOneofNotificationDeliverySuggestion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)oneofNotificationDeliverySuggestionAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D0AB50[a3];
  }

  return v3;
}

- (int)StringAsOneofNotificationDeliverySuggestion:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"smartPause"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"quieting"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"promoting"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"interruptionManagerTuning"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"sendToDigest"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"urgencyTuning"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"sendMessagesToDigest"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"turnOffNotificationsForApp"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForOneofNotificationDeliverySuggestion
{
  *(unsigned char *)&self->_has &= ~2u;
  self->_oneofNotificationDeliverySuggestion = 0;
  smartPause = self->_smartPause;
  self->_smartPause = 0;

  quieting = self->_quieting;
  self->_quieting = 0;

  promoting = self->_promoting;
  self->_promoting = 0;

  interruptionManagerTuning = self->_interruptionManagerTuning;
  self->_interruptionManagerTuning = 0;

  sendToDigest = self->_sendToDigest;
  self->_sendToDigest = 0;

  urgencyTuning = self->_urgencyTuning;
  self->_urgencyTuning = 0;

  sendMessagesToDigest = self->_sendMessagesToDigest;
  self->_sendMessagesToDigest = 0;

  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  self->_turnOffNotificationsForApp = 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
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

- (void)setScope:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_scope = a3;
}

- (void)setHasScope:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasScope
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
}

- (BOOL)hasTriggerNotificationUUID
{
  return self->_triggerNotificationUUID != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBNotificationDeliverySuggestion;
  int v4 = [(ATXPBNotificationDeliverySuggestion *)&v8 description];
  v5 = [(ATXPBNotificationDeliverySuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  smartPause = self->_smartPause;
  if (smartPause)
  {
    v5 = [(ATXPBNotificationSmartPauseSuggestion *)smartPause dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"smartPause"];
  }
  quieting = self->_quieting;
  if (quieting)
  {
    v7 = [(ATXPBNotificationQuietingSuggestion *)quieting dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"quieting"];
  }
  promoting = self->_promoting;
  if (promoting)
  {
    v9 = [(ATXPBNotificationPromotingSuggestion *)promoting dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"promoting"];
  }
  interruptionManagerTuning = self->_interruptionManagerTuning;
  if (interruptionManagerTuning)
  {
    v11 = [(ATXPBInterruptionManagerTuningSuggestion *)interruptionManagerTuning dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"interruptionManagerTuning"];
  }
  sendToDigest = self->_sendToDigest;
  if (sendToDigest)
  {
    v13 = [(ATXPBSendToDigestSuggestion *)sendToDigest dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"sendToDigest"];
  }
  urgencyTuning = self->_urgencyTuning;
  if (urgencyTuning)
  {
    v15 = [(ATXPBUrgencyTuningSuggestion *)urgencyTuning dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"urgencyTuning"];
  }
  sendMessagesToDigest = self->_sendMessagesToDigest;
  if (sendMessagesToDigest)
  {
    v17 = [(ATXPBSendMessagesToDigestSuggestion *)sendMessagesToDigest dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"sendMessagesToDigest"];
  }
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  if (turnOffNotificationsForApp)
  {
    v19 = [(ATXPBTurnOffNotificationsForAppSuggestion *)turnOffNotificationsForApp dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"turnOffNotificationsForApp"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t oneofNotificationDeliverySuggestion = self->_oneofNotificationDeliverySuggestion;
    if (oneofNotificationDeliverySuggestion >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_oneofNotificationDeliverySuggestion);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E5D0AB50[oneofNotificationDeliverySuggestion];
    }
    [v3 setObject:v21 forKey:@"OneofNotificationDeliverySuggestion"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v24 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v24 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v25 = [NSNumber numberWithInt:self->_scope];
    [v3 setObject:v25 forKey:@"scope"];
  }
  entityIdentifier = self->_entityIdentifier;
  if (entityIdentifier) {
    [v3 setObject:entityIdentifier forKey:@"entityIdentifier"];
  }
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if (triggerNotificationUUID) {
    [v3 setObject:triggerNotificationUUID forKey:@"triggerNotificationUUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationDeliverySuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_entityIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_triggerNotificationUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_smartPause)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_quieting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_promoting)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_interruptionManagerTuning)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendToDigest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_urgencyTuning)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_sendMessagesToDigest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_turnOffNotificationsForApp)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_oneofNotificationDeliverySuggestion;
    *((unsigned char *)v4 + 120) |= 2u;
  }
  id v6 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 120) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[14] = self->_scope;
    *((unsigned char *)v4 + 120) |= 4u;
  }
  if (self->_entityIdentifier)
  {
    objc_msgSend(v6, "setEntityIdentifier:");
    id v4 = v6;
  }
  if (self->_triggerNotificationUUID)
  {
    objc_msgSend(v6, "setTriggerNotificationUUID:");
    id v4 = v6;
  }
  if (self->_smartPause)
  {
    objc_msgSend(v6, "setSmartPause:");
    id v4 = v6;
  }
  if (self->_quieting)
  {
    objc_msgSend(v6, "setQuieting:");
    id v4 = v6;
  }
  if (self->_promoting)
  {
    objc_msgSend(v6, "setPromoting:");
    id v4 = v6;
  }
  if (self->_interruptionManagerTuning)
  {
    objc_msgSend(v6, "setInterruptionManagerTuning:");
    id v4 = v6;
  }
  if (self->_sendToDigest)
  {
    objc_msgSend(v6, "setSendToDigest:");
    id v4 = v6;
  }
  if (self->_urgencyTuning)
  {
    objc_msgSend(v6, "setUrgencyTuning:");
    id v4 = v6;
  }
  if (self->_sendMessagesToDigest)
  {
    objc_msgSend(v6, "setSendMessagesToDigest:");
    id v4 = v6;
  }
  if (self->_turnOffNotificationsForApp)
  {
    objc_msgSend(v6, "setTurnOffNotificationsForApp:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_oneofNotificationDeliverySuggestion;
    *(unsigned char *)(v5 + 120) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_uuid copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v7;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v6 + 8) = self->_timestamp;
    *(unsigned char *)(v6 + 120) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_scope;
    *(unsigned char *)(v6 + 120) |= 4u;
  }
  uint64_t v10 = [(NSString *)self->_entityIdentifier copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_triggerNotificationUUID copyWithZone:a3];
  v13 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v12;

  id v14 = [(ATXPBNotificationSmartPauseSuggestion *)self->_smartPause copyWithZone:a3];
  v15 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v14;

  id v16 = [(ATXPBNotificationQuietingSuggestion *)self->_quieting copyWithZone:a3];
  v17 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v16;

  id v18 = [(ATXPBNotificationPromotingSuggestion *)self->_promoting copyWithZone:a3];
  v19 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v18;

  id v20 = [(ATXPBInterruptionManagerTuningSuggestion *)self->_interruptionManagerTuning copyWithZone:a3];
  v21 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v20;

  id v22 = [(ATXPBSendToDigestSuggestion *)self->_sendToDigest copyWithZone:a3];
  v23 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v22;

  id v24 = [(ATXPBUrgencyTuningSuggestion *)self->_urgencyTuning copyWithZone:a3];
  v25 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v24;

  id v26 = [(ATXPBSendMessagesToDigestSuggestion *)self->_sendMessagesToDigest copyWithZone:a3];
  v27 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v26;

  id v28 = [(ATXPBTurnOffNotificationsForAppSuggestion *)self->_turnOffNotificationsForApp copyWithZone:a3];
  v29 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v28;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_oneofNotificationDeliverySuggestion != *((_DWORD *)v4 + 8)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    goto LABEL_40;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_40:
      char v17 = 0;
      goto LABEL_41;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_40;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 4) == 0 || self->_scope != *((_DWORD *)v4 + 14)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
    goto LABEL_40;
  }
  entityIdentifier = self->_entityIdentifier;
  if ((unint64_t)entityIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](entityIdentifier, "isEqual:"))
  {
    goto LABEL_40;
  }
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if ((unint64_t)triggerNotificationUUID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](triggerNotificationUUID, "isEqual:")) {
      goto LABEL_40;
    }
  }
  smartPause = self->_smartPause;
  if ((unint64_t)smartPause | *((void *)v4 + 10))
  {
    if (!-[ATXPBNotificationSmartPauseSuggestion isEqual:](smartPause, "isEqual:")) {
      goto LABEL_40;
    }
  }
  quieting = self->_quieting;
  if ((unint64_t)quieting | *((void *)v4 + 6))
  {
    if (!-[ATXPBNotificationQuietingSuggestion isEqual:](quieting, "isEqual:")) {
      goto LABEL_40;
    }
  }
  promoting = self->_promoting;
  if ((unint64_t)promoting | *((void *)v4 + 5))
  {
    if (!-[ATXPBNotificationPromotingSuggestion isEqual:](promoting, "isEqual:")) {
      goto LABEL_40;
    }
  }
  interruptionManagerTuning = self->_interruptionManagerTuning;
  if ((unint64_t)interruptionManagerTuning | *((void *)v4 + 3))
  {
    if (!-[ATXPBInterruptionManagerTuningSuggestion isEqual:](interruptionManagerTuning, "isEqual:")) {
      goto LABEL_40;
    }
  }
  sendToDigest = self->_sendToDigest;
  if ((unint64_t)sendToDigest | *((void *)v4 + 9))
  {
    if (!-[ATXPBSendToDigestSuggestion isEqual:](sendToDigest, "isEqual:")) {
      goto LABEL_40;
    }
  }
  urgencyTuning = self->_urgencyTuning;
  if ((unint64_t)urgencyTuning | *((void *)v4 + 13))
  {
    if (!-[ATXPBUrgencyTuningSuggestion isEqual:](urgencyTuning, "isEqual:")) {
      goto LABEL_40;
    }
  }
  sendMessagesToDigest = self->_sendMessagesToDigest;
  if ((unint64_t)sendMessagesToDigest | *((void *)v4 + 8))
  {
    if (!-[ATXPBSendMessagesToDigestSuggestion isEqual:](sendMessagesToDigest, "isEqual:")) {
      goto LABEL_40;
    }
  }
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  if ((unint64_t)turnOffNotificationsForApp | *((void *)v4 + 12)) {
    char v17 = -[ATXPBTurnOffNotificationsForAppSuggestion isEqual:](turnOffNotificationsForApp, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_41:

  return v17;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_oneofNotificationDeliverySuggestion;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_uuid hash];
  char has = (char)self->_has;
  if (has)
  {
    double timestamp = self->_timestamp;
    double v8 = -timestamp;
    if (timestamp >= 0.0) {
      double v8 = self->_timestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_scope;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v4 ^ v3 ^ v6 ^ v11 ^ [(NSString *)self->_entityIdentifier hash];
  NSUInteger v13 = [(NSString *)self->_triggerNotificationUUID hash];
  unint64_t v14 = v13 ^ [(ATXPBNotificationSmartPauseSuggestion *)self->_smartPause hash];
  unint64_t v15 = v12 ^ v14 ^ [(ATXPBNotificationQuietingSuggestion *)self->_quieting hash];
  unint64_t v16 = [(ATXPBNotificationPromotingSuggestion *)self->_promoting hash];
  unint64_t v17 = v16 ^ [(ATXPBInterruptionManagerTuningSuggestion *)self->_interruptionManagerTuning hash];
  unint64_t v18 = v17 ^ [(ATXPBSendToDigestSuggestion *)self->_sendToDigest hash];
  unint64_t v19 = v15 ^ v18 ^ [(ATXPBUrgencyTuningSuggestion *)self->_urgencyTuning hash];
  unint64_t v20 = [(ATXPBSendMessagesToDigestSuggestion *)self->_sendMessagesToDigest hash];
  return v19 ^ v20 ^ [(ATXPBTurnOffNotificationsForAppSuggestion *)self->_turnOffNotificationsForApp hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if ((v4[30] & 2) != 0)
  {
    self->_uint64_t oneofNotificationDeliverySuggestion = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  v23 = v4;
  if (*((void *)v4 + 14))
  {
    -[ATXPBNotificationDeliverySuggestion setUuid:](self, "setUuid:");
    uint64_t v5 = v23;
  }
  char v6 = *((unsigned char *)v5 + 120);
  if (v6)
  {
    self->_double timestamp = *((double *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v5 + 120);
  }
  if ((v6 & 4) != 0)
  {
    self->_scope = v5[14];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 2))
  {
    -[ATXPBNotificationDeliverySuggestion setEntityIdentifier:](self, "setEntityIdentifier:");
    uint64_t v5 = v23;
  }
  if (*((void *)v5 + 11))
  {
    -[ATXPBNotificationDeliverySuggestion setTriggerNotificationUUID:](self, "setTriggerNotificationUUID:");
    uint64_t v5 = v23;
  }
  smartPause = self->_smartPause;
  uint64_t v8 = *((void *)v5 + 10);
  if (smartPause)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[ATXPBNotificationSmartPauseSuggestion mergeFrom:](smartPause, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[ATXPBNotificationDeliverySuggestion setSmartPause:](self, "setSmartPause:");
  }
  uint64_t v5 = v23;
LABEL_19:
  quieting = self->_quieting;
  uint64_t v10 = *((void *)v5 + 6);
  if (quieting)
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[ATXPBNotificationQuietingSuggestion mergeFrom:](quieting, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[ATXPBNotificationDeliverySuggestion setQuieting:](self, "setQuieting:");
  }
  uint64_t v5 = v23;
LABEL_25:
  promoting = self->_promoting;
  uint64_t v12 = *((void *)v5 + 5);
  if (promoting)
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[ATXPBNotificationPromotingSuggestion mergeFrom:](promoting, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_31;
    }
    -[ATXPBNotificationDeliverySuggestion setPromoting:](self, "setPromoting:");
  }
  uint64_t v5 = v23;
LABEL_31:
  interruptionManagerTuning = self->_interruptionManagerTuning;
  uint64_t v14 = *((void *)v5 + 3);
  if (interruptionManagerTuning)
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[ATXPBInterruptionManagerTuningSuggestion mergeFrom:](interruptionManagerTuning, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_37;
    }
    -[ATXPBNotificationDeliverySuggestion setInterruptionManagerTuning:](self, "setInterruptionManagerTuning:");
  }
  uint64_t v5 = v23;
LABEL_37:
  sendToDigest = self->_sendToDigest;
  uint64_t v16 = *((void *)v5 + 9);
  if (sendToDigest)
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[ATXPBSendToDigestSuggestion mergeFrom:](sendToDigest, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_43;
    }
    -[ATXPBNotificationDeliverySuggestion setSendToDigest:](self, "setSendToDigest:");
  }
  uint64_t v5 = v23;
LABEL_43:
  urgencyTuning = self->_urgencyTuning;
  uint64_t v18 = *((void *)v5 + 13);
  if (urgencyTuning)
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[ATXPBUrgencyTuningSuggestion mergeFrom:](urgencyTuning, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_49;
    }
    -[ATXPBNotificationDeliverySuggestion setUrgencyTuning:](self, "setUrgencyTuning:");
  }
  uint64_t v5 = v23;
LABEL_49:
  sendMessagesToDigest = self->_sendMessagesToDigest;
  uint64_t v20 = *((void *)v5 + 8);
  if (sendMessagesToDigest)
  {
    if (!v20) {
      goto LABEL_55;
    }
    -[ATXPBSendMessagesToDigestSuggestion mergeFrom:](sendMessagesToDigest, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_55;
    }
    -[ATXPBNotificationDeliverySuggestion setSendMessagesToDigest:](self, "setSendMessagesToDigest:");
  }
  uint64_t v5 = v23;
LABEL_55:
  turnOffNotificationsForApp = self->_turnOffNotificationsForApp;
  uint64_t v22 = *((void *)v5 + 12);
  if (turnOffNotificationsForApp)
  {
    if (!v22) {
      goto LABEL_61;
    }
    turnOffNotificationsForApp = (ATXPBTurnOffNotificationsForAppSuggestion *)-[ATXPBTurnOffNotificationsForAppSuggestion mergeFrom:](turnOffNotificationsForApp, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_61;
    }
    turnOffNotificationsForApp = (ATXPBTurnOffNotificationsForAppSuggestion *)-[ATXPBNotificationDeliverySuggestion setTurnOffNotificationsForApp:](self, "setTurnOffNotificationsForApp:");
  }
  uint64_t v5 = v23;
LABEL_61:

  MEMORY[0x1F41817F8](turnOffNotificationsForApp, v5);
}

- (ATXPBNotificationSmartPauseSuggestion)smartPause
{
  return self->_smartPause;
}

- (ATXPBNotificationQuietingSuggestion)quieting
{
  return self->_quieting;
}

- (ATXPBNotificationPromotingSuggestion)promoting
{
  return self->_promoting;
}

- (ATXPBInterruptionManagerTuningSuggestion)interruptionManagerTuning
{
  return self->_interruptionManagerTuning;
}

- (ATXPBSendToDigestSuggestion)sendToDigest
{
  return self->_sendToDigest;
}

- (ATXPBUrgencyTuningSuggestion)urgencyTuning
{
  return self->_urgencyTuning;
}

- (ATXPBSendMessagesToDigestSuggestion)sendMessagesToDigest
{
  return self->_sendMessagesToDigest;
}

- (ATXPBTurnOffNotificationsForAppSuggestion)turnOffNotificationsForApp
{
  return self->_turnOffNotificationsForApp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int)scope
{
  return self->_scope;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
}

- (NSString)triggerNotificationUUID
{
  return self->_triggerNotificationUUID;
}

- (void)setTriggerNotificationUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_urgencyTuning, 0);
  objc_storeStrong((id *)&self->_turnOffNotificationsForApp, 0);
  objc_storeStrong((id *)&self->_triggerNotificationUUID, 0);
  objc_storeStrong((id *)&self->_smartPause, 0);
  objc_storeStrong((id *)&self->_sendToDigest, 0);
  objc_storeStrong((id *)&self->_sendMessagesToDigest, 0);
  objc_storeStrong((id *)&self->_quieting, 0);
  objc_storeStrong((id *)&self->_promoting, 0);
  objc_storeStrong((id *)&self->_interruptionManagerTuning, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end