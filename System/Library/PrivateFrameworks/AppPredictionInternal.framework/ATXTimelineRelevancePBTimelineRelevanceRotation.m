@interface ATXTimelineRelevancePBTimelineRelevanceRotation
- (BOOL)hasClientModelId;
- (BOOL)hasDuration;
- (BOOL)hasEngagement;
- (BOOL)hasIsMediumOrHighConfidence;
- (BOOL)hasRotationEventType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediumOrHighConfidence;
- (BOOL)readFrom:(id)a3;
- (id)clientModelIdAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementAsString:(int)a3;
- (id)rotationEventTypeAsString:(int)a3;
- (int)StringAsClientModelId:(id)a3;
- (int)StringAsEngagement:(id)a3;
- (int)StringAsRotationEventType:(id)a3;
- (int)clientModelId;
- (int)engagement;
- (int)rotationEventType;
- (int64_t)duration;
- (int64_t)timestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientModelId:(int)a3;
- (void)setDuration:(int64_t)a3;
- (void)setEngagement:(int)a3;
- (void)setHasClientModelId:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEngagement:(BOOL)a3;
- (void)setHasIsMediumOrHighConfidence:(BOOL)a3;
- (void)setHasRotationEventType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsMediumOrHighConfidence:(BOOL)a3;
- (void)setRotationEventType:(int)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBTimelineRelevanceRotation

- (void)setTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)rotationEventType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_rotationEventType;
  }
  else {
    return 0;
  }
}

- (void)setRotationEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_rotationEventType = a3;
}

- (void)setHasRotationEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRotationEventType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)rotationEventTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B2CD8[a3];
  }
  return v3;
}

- (int)StringAsRotationEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EventTypeSystemSuggest"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EventTypeUserScroll"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EventTypeSystemFallback"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EventTypeSystemUpdate"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EventTypeStackCreated"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EventTypeStackDestroyed"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EventTypeWidgetsAdded"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EventTypeTopWidgetRemoved"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EventTypeUnknown"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsMediumOrHighConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isMediumOrHighConfidence = a3;
}

- (void)setHasIsMediumOrHighConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsMediumOrHighConfidence
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)clientModelId
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_clientModelId;
  }
  else {
    return 0;
  }
}

- (void)setClientModelId:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_clientModelId = a3;
}

- (void)setHasClientModelId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasClientModelId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)clientModelIdAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Other";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"TimelineRelevance";
  }
  return v4;
}

- (int)StringAsClientModelId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TimelineRelevance"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Other"];
  }

  return v4;
}

- (void)setDuration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)engagement
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_engagement;
  }
  else {
    return 0;
  }
}

- (void)setEngagement:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_engagement = a3;
}

- (void)setHasEngagement:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEngagement
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)engagementAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B2D20[a3];
  }
  return v3;
}

- (int)StringAsEngagement:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotSeen"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Shown"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"UserRotate"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Dwell"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Tapped"])
  {
    int v4 = 5;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceRotation;
  int v4 = [(ATXTimelineRelevancePBTimelineRelevanceRotation *)&v8 description];
  v5 = [(ATXTimelineRelevancePBTimelineRelevanceRotation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  uint64_t rotationEventType = self->_rotationEventType;
  if (rotationEventType >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rotationEventType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E68B2CD8[rotationEventType];
  }
  [v3 setObject:v7 forKey:@"rotationEventType"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  objc_super v8 = [NSNumber numberWithBool:self->_isMediumOrHighConfidence];
  [v3 setObject:v8 forKey:@"isMediumOrHighConfidence"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
LABEL_20:
    v11 = [NSNumber numberWithLongLong:self->_duration];
    [v3 setObject:v11 forKey:@"duration"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_25;
    }
LABEL_21:
    uint64_t engagement = self->_engagement;
    if (engagement >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagement);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E68B2D20[engagement];
    }
    [v3 setObject:v13 forKey:@"engagement"];

    goto LABEL_25;
  }
LABEL_14:
  int clientModelId = self->_clientModelId;
  if (clientModelId)
  {
    if (clientModelId == 1)
    {
      v10 = @"Other";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_clientModelId);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = @"TimelineRelevance";
  }
  [v3 setObject:v10 forKey:@"clientModelId"];

  char has = (char)self->_has;
  if (has) {
    goto LABEL_20;
  }
LABEL_6:
  if ((has & 8) != 0) {
    goto LABEL_21;
  }
LABEL_25:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceRotationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_rotationEventType;
  *((unsigned char *)v4 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)v4 + 36) = self->_isMediumOrHighConfidence;
  *((unsigned char *)v4 + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 6) = self->_clientModelId;
  *((unsigned char *)v4 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[1] = self->_duration;
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 7) = self->_engagement;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_rotationEventType;
  *((unsigned char *)result + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 36) = self->_isMediumOrHighConfidence;
  *((unsigned char *)result + 40) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = self->_clientModelId;
  *((unsigned char *)result + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)result + 1) = self->_duration;
  *((unsigned char *)result + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 7) = self->_engagement;
  *((unsigned char *)result + 40) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0 || self->_rotationEventType != *((_DWORD *)v4 + 8)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x20) != 0)
    {
      if (self->_isMediumOrHighConfidence)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_34;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_20;
      }
    }
LABEL_34:
    BOOL v5 = 0;
    goto LABEL_35;
  }
  if ((*((unsigned char *)v4 + 40) & 0x20) != 0) {
    goto LABEL_34;
  }
LABEL_20:
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_clientModelId != *((_DWORD *)v4 + 6)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_duration != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_34;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_engagement != *((_DWORD *)v4 + 7)) {
      goto LABEL_34;
    }
    BOOL v5 = 1;
  }
LABEL_35:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_rotationEventType;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isMediumOrHighConfidence;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_clientModelId;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_duration;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_engagement;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t rotationEventType = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_isMediumOrHighConfidence = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_int clientModelId = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_duration = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_7:
    self->_uint64_t engagement = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isMediumOrHighConfidence
{
  return self->_isMediumOrHighConfidence;
}

- (int64_t)duration
{
  return self->_duration;
}

@end