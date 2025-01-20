@interface ATXPBNotificationSuggestionInteractionEvent
- (BOOL)hasSuggestionUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (__CFString)suggestionTypeAsString:(__CFString *)a1;
- (double)secondsSinceReferenceDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)StringAsSuggestionType:(uint64_t)a1;
- (uint64_t)eventType;
- (uint64_t)hasEventType;
- (uint64_t)hasSecondsSinceReferenceDate;
- (uint64_t)hasSuggestionType;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)setHasSecondsSinceReferenceDate:(uint64_t)result;
- (uint64_t)setHasSuggestionType:(uint64_t)result;
- (uint64_t)setSecondsSinceReferenceDate:(uint64_t)result;
- (uint64_t)setSuggestionType:(uint64_t)result;
- (uint64_t)suggestionType;
- (uint64_t)suggestionUUID;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setSuggestionUUID:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBNotificationSuggestionInteractionEvent

- (uint64_t)suggestionType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 32) & 4) != 0) {
      return *(unsigned int *)(result + 20);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setSuggestionType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 4u;
    *(_DWORD *)(result + 20) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 32) >> 2) & 1;
  }
  return result;
}

- (__CFString)suggestionTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D05790[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsSuggestionType:(uint64_t)a1
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
    else if ([v5 isEqualToString:@"Quieting"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Promoting"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"RealTimeTuning"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"SmartPause"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"InterruptionManagement"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"SendToDigest"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"UrgencyTuningSuggestion"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"SendMessagesToDigest"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"TurnOffNotificationsForAppSuggestion"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"Total"])
    {
      uint64_t v6 = 10;
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
    if (a2 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D057E8[(int)a2];
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
    else if ([v5 isEqualToString:@"Rejected"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Accepted"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Appeared"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Cleared"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"Removed"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"Expired"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"Created"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"CouldNotShow"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"Total"])
    {
      uint64_t v6 = 9;
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

- (BOOL)hasSuggestionUUID
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
  v8.super_class = (Class)ATXPBNotificationSuggestionInteractionEvent;
  v4 = [(ATXPBNotificationSuggestionInteractionEvent *)&v8 description];
  id v5 = [(ATXPBNotificationSuggestionInteractionEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t suggestionType = self->_suggestionType;
    if (suggestionType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestionType);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = off_1E5D05790[suggestionType];
    }
    [v3 setObject:v6 forKey:@"suggestionType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D057E8[eventType];
    }
    [v3 setObject:v8 forKey:@"eventType"];
  }
  suggestionUUID = self->_suggestionUUID;
  if (suggestionUUID) {
    [v3 setObject:suggestionUUID forKey:@"suggestionUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithDouble:self->_secondsSinceReferenceDate];
    [v3 setObject:v10 forKey:@"secondsSinceReferenceDate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationSuggestionInteractionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_suggestionUUID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 32);
    if ((v4 & 4) != 0)
    {
      v3[5] = *(_DWORD *)(a1 + 20);
      *((unsigned char *)v3 + 32) |= 4u;
      char v4 = *(unsigned char *)(a1 + 32);
    }
    if ((v4 & 2) != 0)
    {
      v3[4] = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v3 + 32) |= 2u;
    }
    id v5 = *(void **)(a1 + 24);
    if (v5)
    {
      uint64_t v6 = v3;
      -[ATXPBNotificationSuggestionInteractionEvent setSuggestionUUID:]((uint64_t)v3, v5);
      id v3 = v6;
    }
    if (*(unsigned char *)(a1 + 32))
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 32) |= 1u;
    }
  }
}

- (void)setSuggestionUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_suggestionType;
    *(unsigned char *)(v5 + 32) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_suggestionUUID copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

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
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_suggestionType != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  suggestionUUID = self->_suggestionUUID;
  if ((unint64_t)suggestionUUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestionUUID, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_suggestionType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_suggestionUUID hash];
  if (*(unsigned char *)&self->_has)
  {
    double secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    double v8 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0) {
      double v8 = self->_secondsSinceReferenceDate;
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
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[32];
    if ((v4 & 4) != 0)
    {
      *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
      *(unsigned char *)(a1 + 32) |= 4u;
      char v4 = v3[32];
    }
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 32) |= 2u;
    }
    NSUInteger v5 = (void *)*((void *)v3 + 3);
    if (v5)
    {
      unint64_t v6 = v3;
      objc_storeStrong((id *)(a1 + 24), v5);
      uint64_t v3 = v6;
    }
    if (v3[32])
    {
      *(void *)(a1 + 8) = *((void *)v3 + 1);
      *(unsigned char *)(a1 + 32) |= 1u;
    }
  }
}

- (uint64_t)suggestionUUID
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