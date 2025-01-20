@interface ATXPBMissedNotificationRankingLoggingEvent
- (ATXPBMissedNotificationRanking)missedNotificationRanking;
- (BOOL)hasEventType;
- (BOOL)hasMissedNotificationRanking;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMissedNotificationRanking:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBMissedNotificationRankingLoggingEvent

- (BOOL)hasMissedNotificationRanking
{
  return self->_missedNotificationRanking != 0;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06B68[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ExpandedView"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CollapsedView"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UpcomingExpandedView"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DeliveredExpandedView"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"UpcomingCollapsedView"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DeliveredCollapsedView"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Removed"])
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBMissedNotificationRankingLoggingEvent;
  int v4 = [(ATXPBMissedNotificationRankingLoggingEvent *)&v8 description];
  v5 = [(ATXPBMissedNotificationRankingLoggingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  missedNotificationRanking = self->_missedNotificationRanking;
  if (missedNotificationRanking)
  {
    v5 = [(ATXPBMissedNotificationRanking *)missedNotificationRanking dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"missedNotificationRanking"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D06B68[eventType];
    }
    [v3 setObject:v8 forKey:@"eventType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBMissedNotificationRankingLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_missedNotificationRanking)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  if (self->_missedNotificationRanking)
  {
    id v6 = v4;
    objc_msgSend(v4, "setMissedNotificationRanking:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_eventType;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXPBMissedNotificationRanking *)self->_missedNotificationRanking copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  missedNotificationRanking = self->_missedNotificationRanking;
  if ((unint64_t)missedNotificationRanking | *((void *)v4 + 3))
  {
    if (!-[ATXPBMissedNotificationRanking isEqual:](missedNotificationRanking, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXPBMissedNotificationRanking *)self->_missedNotificationRanking hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_eventType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
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
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  missedNotificationRanking = self->_missedNotificationRanking;
  uint64_t v6 = *((void *)v4 + 3);
  if (missedNotificationRanking)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    missedNotificationRanking = (ATXPBMissedNotificationRanking *)-[ATXPBMissedNotificationRanking mergeFrom:](missedNotificationRanking, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    missedNotificationRanking = (ATXPBMissedNotificationRanking *)-[ATXPBMissedNotificationRankingLoggingEvent setMissedNotificationRanking:](self, "setMissedNotificationRanking:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if ((v7 & 2) != 0)
  {
    self->_uint64_t eventType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if (v7)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8](missedNotificationRanking, v4);
}

- (ATXPBMissedNotificationRanking)missedNotificationRanking
{
  return self->_missedNotificationRanking;
}

- (void)setMissedNotificationRanking:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXPBMissedNotificationRankingLoggingEvent *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      char v7 = [ATXPBMissedNotificationRanking alloc];
      id v8 = [v6 objectForKeyedSubscript:@"missedNotificationRanking"];
      id v9 = [(ATXPBMissedNotificationRanking *)v7 initFromJSON:v8];
      [(ATXPBMissedNotificationRankingLoggingEvent *)v5 setMissedNotificationRanking:v9];

      id v10 = [v6 objectForKeyedSubscript:@"eventType"];
      if ([v10 isEqualToString:@"ExpandedView"])
      {
        uint64_t v11 = 0;
      }
      else if ([v10 isEqualToString:@"CollapsedView"])
      {
        uint64_t v11 = 1;
      }
      else if ([v10 isEqualToString:@"UpcomingExpandedView"])
      {
        uint64_t v11 = 2;
      }
      else if ([v10 isEqualToString:@"DeliveredExpandedView"])
      {
        uint64_t v11 = 3;
      }
      else if ([v10 isEqualToString:@"UpcomingCollapsedView"])
      {
        uint64_t v11 = 4;
      }
      else if ([v10 isEqualToString:@"DeliveredCollapsedView"])
      {
        uint64_t v11 = 5;
      }
      else if ([v10 isEqualToString:@"Removed"])
      {
        uint64_t v11 = 6;
      }
      else if ([v10 isEqualToString:@"Total"])
      {
        uint64_t v11 = 7;
      }
      else
      {
        uint64_t v11 = 0;
      }

      [(ATXPBMissedNotificationRankingLoggingEvent *)v5 setEventType:v11];
      v12 = [v6 objectForKeyedSubscript:@"timestamp"];
      [v12 doubleValue];
      -[ATXPBMissedNotificationRankingLoggingEvent setTimestamp:](v5, "setTimestamp:");
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"missedNotificationRanking";
  unint64_t v3 = [(ATXPBMissedNotificationRanking *)self->_missedNotificationRanking jsonRepresentation];
  id v4 = +[ATXJSONHelper wrapObject:v3];
  v13[0] = v4;
  v12[1] = @"eventType";
  uint64_t eventType = self->_eventType;
  if (eventType >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E5D070E8[eventType];
  }
  char v7 = +[ATXJSONHelper wrapObject:v6];
  v13[1] = v7;
  v12[2] = @"timestamp";
  id v8 = [NSNumber numberWithDouble:self->_timestamp];
  id v9 = +[ATXJSONHelper wrapObject:v8];
  v13[2] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

@end