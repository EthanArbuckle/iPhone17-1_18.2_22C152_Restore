@interface ATXPBActivitySuggestionFeedbackEvent
+ (uint64_t)serializedAcceptedTriggersType;
- (BOOL)hasActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (__CFString)locationAsString:(__CFString *)a1;
- (__CFString)suggestionTypeAsString:(__CFString *)a1;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serializedAcceptedTriggersAtIndex:(id *)a1;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)StringAsLocation:(uint64_t)a1;
- (uint64_t)StringAsSuggestionType:(uint64_t)a1;
- (uint64_t)activity;
- (uint64_t)addSerializedAcceptedTriggers:(uint64_t)a1;
- (uint64_t)clearSerializedAcceptedTriggers;
- (uint64_t)eventType;
- (uint64_t)hasDate;
- (uint64_t)hasEventType;
- (uint64_t)hasLocation;
- (uint64_t)hasSuggestionType;
- (uint64_t)location;
- (uint64_t)serializedAcceptedTriggers;
- (uint64_t)serializedAcceptedTriggersCount;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)setHasLocation:(uint64_t)result;
- (uint64_t)setHasSuggestionType:(uint64_t)result;
- (uint64_t)setLocation:(uint64_t)result;
- (uint64_t)setSuggestionType:(uint64_t)result;
- (uint64_t)suggestionType;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setActivity:(uint64_t)a1;
- (void)setSerializedAcceptedTriggers:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBActivitySuggestionFeedbackEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 44) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return *(unsigned char *)(result + 44) & 1;
  }
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 44) & 2) != 0) {
      return *(unsigned int *)(result + 24);
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
    *(unsigned char *)(result + 44) |= 2u;
    *(_DWORD *)(result + 24) = a2;
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
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 44) >> 1) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D04E80[(int)a2];
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
    if ([v5 isEqualToString:@"Suggested"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Seen"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Accepted"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Rejected"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"SetUpFinished"])
    {
      uint64_t v6 = 4;
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

- (uint64_t)suggestionType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 44) & 8) != 0) {
      return *(unsigned int *)(result + 40);
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
    *(unsigned char *)(result + 44) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 44) >> 3) & 1;
  }
  return result;
}

- (__CFString)suggestionTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D04EA8[(int)a2];
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
    if ([v5 isEqualToString:@"SetUp"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"EnterAnAlreadyConfiguredActivity"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Trigger"])
    {
      uint64_t v6 = 2;
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

- (BOOL)hasActivity
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)clearSerializedAcceptedTriggers
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addSerializedAcceptedTriggers:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      id v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)serializedAcceptedTriggersCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)serializedAcceptedTriggersAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)serializedAcceptedTriggersType
{
  self;

  return objc_opt_class();
}

- (uint64_t)location
{
  if (result)
  {
    if ((*(unsigned char *)(result + 44) & 4) != 0) {
      return *(unsigned int *)(result + 28);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setLocation:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 44) |= 4u;
    *(_DWORD *)(result + 28) = a2;
  }
  return result;
}

- (uint64_t)setHasLocation:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasLocation
{
  if (result) {
    return (*(unsigned __int8 *)(result + 44) >> 2) & 1;
  }
  return result;
}

- (__CFString)locationAsString:(__CFString *)a1
{
  if (!a1)
  {
LABEL_11:
    return a1;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      a1 = @"LockScreen";
      return a1;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  a1 = @"ControlCenter";
  return a1;
}

- (uint64_t)StringAsLocation:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isEqualToString:@"ControlCenter"]) {
      a1 = 0;
    }
    else {
      a1 = [v4 isEqualToString:@"LockScreen"];
    }
  }

  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBActivitySuggestionFeedbackEvent;
  id v4 = [(ATXPBActivitySuggestionFeedbackEvent *)&v8 description];
  id v5 = [(ATXPBActivitySuggestionFeedbackEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v5 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v5 forKey:@"date"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t eventType = self->_eventType;
  if (eventType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E5D04E80[eventType];
  }
  [v3 setObject:v7 forKey:@"eventType"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_10:
    uint64_t suggestionType = self->_suggestionType;
    if (suggestionType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestionType);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = off_1E5D04EA8[suggestionType];
    }
    [v3 setObject:v9 forKey:@"suggestionType"];
  }
LABEL_14:
  activity = self->_activity;
  if (activity)
  {
    v11 = [(ATXPBActivity *)activity dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"activity"];
  }
  serializedAcceptedTriggers = self->_serializedAcceptedTriggers;
  if (serializedAcceptedTriggers) {
    [v3 setObject:serializedAcceptedTriggers forKey:@"serializedAcceptedTriggers"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int location = self->_location;
    if (location)
    {
      if (location == 1)
      {
        v14 = @"LockScreen";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_location);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = @"ControlCenter";
    }
    [v3 setObject:v14 forKey:@"location"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActivitySuggestionFeedbackEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_activity) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_serializedAcceptedTriggers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_16;
  }
  char v4 = *(unsigned char *)(a1 + 44);
  if ((v4 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 44) & 2) == 0) {
      goto LABEL_4;
    }
LABEL_20:
    *((_DWORD *)v3 + 6) = *(_DWORD *)(a1 + 24);
    *((unsigned char *)v3 + 44) |= 2u;
    if ((*(unsigned char *)(a1 + 44) & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v3[1] = *(id *)(a1 + 8);
  *((unsigned char *)v3 + 44) |= 1u;
  char v4 = *(unsigned char *)(a1 + 44);
  if ((v4 & 2) != 0) {
    goto LABEL_20;
  }
LABEL_4:
  if ((v4 & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v3 + 10) = *(_DWORD *)(a1 + 40);
    *((unsigned char *)v3 + 44) |= 8u;
  }
LABEL_6:
  v10 = v3;
  id v5 = *(void **)(a1 + 16);
  if (v5) {
    -[ATXPBActivitySuggestionFeedbackEvent setActivity:]((uint64_t)v3, v5);
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (v10) {
      [v10[4] removeAllObjects];
    }
    uint64_t v6 = [*(id *)(a1 + 32) count];
    if (v6)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [*(id *)(a1 + 32) objectAtIndex:i];
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:]((uint64_t)v10, v9);
      }
    }
  }
  id v3 = v10;
  if ((*(unsigned char *)(a1 + 44) & 4) != 0)
  {
    *((_DWORD *)v10 + 7) = *(_DWORD *)(a1 + 28);
    *((unsigned char *)v10 + 44) |= 4u;
  }
LABEL_16:
}

- (void)setActivity:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_eventType;
  *(unsigned char *)(v5 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_suggestionType;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
LABEL_5:
  id v8 = [(ATXPBActivity *)self->_activity copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_serializedAcceptedTriggers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](v6, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_location;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_25:
    BOOL v7 = 0;
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_suggestionType != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_25;
  }
  activity = self->_activity;
  if ((unint64_t)activity | *((void *)v4 + 2) && !-[ATXPBActivity isEqual:](activity, "isEqual:")) {
    goto LABEL_25;
  }
  serializedAcceptedTriggers = self->_serializedAcceptedTriggers;
  if ((unint64_t)serializedAcceptedTriggers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](serializedAcceptedTriggers, "isEqual:")) {
      goto LABEL_25;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_location != *((_DWORD *)v4 + 7)) {
      goto LABEL_25;
    }
    BOOL v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_eventType;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 8) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_suggestionType;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  unint64_t v11 = [(ATXPBActivity *)self->_activity hash];
  uint64_t v12 = [(NSMutableArray *)self->_serializedAcceptedTriggers hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v13 = 2654435761 * self->_location;
  }
  else {
    uint64_t v13 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = (id *)v3;
  if (!a1) {
    goto LABEL_23;
  }
  char v5 = v3[44];
  if ((v5 & 1) == 0)
  {
    if ((v3[44] & 2) == 0) {
      goto LABEL_4;
    }
LABEL_10:
    *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
    *(unsigned char *)(a1 + 44) |= 2u;
    if ((v3[44] & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  *(void *)(a1 + 8) = *((void *)v3 + 1);
  *(unsigned char *)(a1 + 44) |= 1u;
  char v5 = v3[44];
  if ((v5 & 2) != 0) {
    goto LABEL_10;
  }
LABEL_4:
  if ((v5 & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(unsigned char *)(a1 + 44) |= 8u;
  }
LABEL_6:
  double v6 = (void *)*((void *)v3 + 2);
  if (*(void *)(a1 + 16))
  {
    if (v6) {
      -[ATXPBActivity mergeFrom:](*(void *)(a1 + 16), v6);
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(a1 + 16), v6);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4[4];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ATXPBActivitySuggestionFeedbackEvent addSerializedAcceptedTriggers:](a1, *(void **)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    *(_DWORD *)(a1 + 28) = *((_DWORD *)v4 + 7);
    *(unsigned char *)(a1 + 44) |= 4u;
  }
LABEL_23:
}

- (double)date
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)activity
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)serializedAcceptedTriggers
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setSerializedAcceptedTriggers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedAcceptedTriggers, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end