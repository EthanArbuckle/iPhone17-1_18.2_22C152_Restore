@interface HDCodableWorkoutSessionGlobalState
+ (Class)eventsType;
- (BOOL)hasCurrentActivity;
- (BOOL)hasEndDate;
- (BOOL)hasSessionState;
- (BOOL)hasSessionStateChangeDate;
- (BOOL)hasSessionStateEvent;
- (BOOL)hasSessionStateEventDate;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableWorkoutActivity)currentActivity;
- (NSMutableArray)events;
- (double)endDate;
- (double)sessionStateChangeDate;
- (double)sessionStateEventDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (int64_t)sessionState;
- (int64_t)sessionStateEvent;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (void)addEvents:(id)a3;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentActivity:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setEvents:(id)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasSessionState:(BOOL)a3;
- (void)setHasSessionStateChangeDate:(BOOL)a3;
- (void)setHasSessionStateEvent:(BOOL)a3;
- (void)setHasSessionStateEventDate:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSessionStateChangeDate:(double)a3;
- (void)setSessionStateEvent:(int64_t)a3;
- (void)setSessionStateEventDate:(double)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutSessionGlobalState

- (void)setSessionState:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSessionStateChangeDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionStateChangeDate = a3;
}

- (void)setHasSessionStateChangeDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStateChangeDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSessionStateEvent:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sessionStateEvent = a3;
}

- (void)setHasSessionStateEvent:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSessionStateEvent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSessionStateEventDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sessionStateEventDate = a3;
}

- (void)setHasSessionStateEventDate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSessionStateEventDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCurrentActivity
{
  return self->_currentActivity != 0;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutSessionGlobalState;
  id v4 = [(HDCodableWorkoutSessionGlobalState *)&v8 description];
  v5 = [(HDCodableWorkoutSessionGlobalState *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = [NSNumber numberWithLongLong:self->_sessionState];
    [v3 setObject:v16 forKey:@"sessionState"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v17 = [NSNumber numberWithDouble:self->_sessionStateChangeDate];
  [v3 setObject:v17 forKey:@"sessionStateChangeDate"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v18 = [NSNumber numberWithLongLong:self->_sessionStateEvent];
  [v3 setObject:v18 forKey:@"sessionStateEvent"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v19 = [NSNumber numberWithDouble:self->_sessionStateEventDate];
  [v3 setObject:v19 forKey:@"sessionStateEventDate"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_26:
  v20 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v20 forKey:@"startDate"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v5 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v5 forKey:@"endDate"];
  }
LABEL_8:
  currentActivity = self->_currentActivity;
  if (currentActivity)
  {
    v7 = [(HDCodableWorkoutActivity *)currentActivity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"currentActivity"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = self->_events;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"events"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionGlobalStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_currentActivity) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_events;
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_sessionState;
    *((unsigned char *)v4 + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(void *)&self->_sessionStateChangeDate;
  *((unsigned char *)v4 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[4] = self->_sessionStateEvent;
  *((unsigned char *)v4 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[5] = *(void *)&self->_sessionStateEventDate;
  *((unsigned char *)v4 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  v4[6] = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 72) |= 0x20u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v4[1] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 72) |= 1u;
  }
LABEL_8:
  id v10 = v4;
  if (self->_currentActivity) {
    objc_msgSend(v4, "setCurrentActivity:");
  }
  if ([(HDCodableWorkoutSessionGlobalState *)self eventsCount])
  {
    [v10 clearEvents];
    unint64_t v6 = [(HDCodableWorkoutSessionGlobalState *)self eventsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HDCodableWorkoutSessionGlobalState *)self eventsAtIndex:i];
        [v10 addEvents:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_sessionState;
    *(unsigned char *)(v5 + 72) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_sessionStateChangeDate;
  *(unsigned char *)(v5 + 72) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(void *)(v5 + 32) = self->_sessionStateEvent;
  *(unsigned char *)(v5 + 72) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 40) = self->_sessionStateEventDate;
  *(unsigned char *)(v5 + 72) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_startDate;
  *(unsigned char *)(v5 + 72) |= 0x20u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *(double *)(v5 + 8) = self->_endDate;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
LABEL_8:
  id v8 = [(HDCodableWorkoutActivity *)self->_currentActivity copyWithZone:a3];
  uint64_t v9 = (void *)v6[7];
  v6[7] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = self->_events;
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
        [v6 addEvents:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_sessionState != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_36:
    char v7 = 0;
    goto LABEL_37;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_sessionStateChangeDate != *((double *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0 || self->_sessionStateEvent != *((void *)v4 + 4)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x10) == 0 || self->_sessionStateEventDate != *((double *)v4 + 5)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 0x20) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_endDate != *((double *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_36;
  }
  currentActivity = self->_currentActivity;
  if ((unint64_t)currentActivity | *((void *)v4 + 7)
    && !-[HDCodableWorkoutActivity isEqual:](currentActivity, "isEqual:"))
  {
    goto LABEL_36;
  }
  events = self->_events;
  if ((unint64_t)events | *((void *)v4 + 8)) {
    char v7 = -[NSMutableArray isEqual:](events, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_37:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_sessionState;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sessionStateChangeDate = self->_sessionStateChangeDate;
  double v6 = -sessionStateChangeDate;
  if (sessionStateChangeDate >= 0.0) {
    double v6 = self->_sessionStateChangeDate;
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
  if ((has & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_sessionStateEvent;
    if ((has & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_18:
    unint64_t v15 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  double sessionStateEventDate = self->_sessionStateEventDate;
  double v12 = -sessionStateEventDate;
  if (sessionStateEventDate >= 0.0) {
    double v12 = self->_sessionStateEventDate;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_21:
  if ((has & 0x20) != 0)
  {
    double startDate = self->_startDate;
    double v18 = -startDate;
    if (startDate >= 0.0) {
      double v18 = self->_startDate;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if (has)
  {
    double endDate = self->_endDate;
    double v23 = -endDate;
    if (endDate >= 0.0) {
      double v23 = self->_endDate;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  unint64_t v26 = v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v21 ^ [(HDCodableWorkoutActivity *)self->_currentActivity hash];
  return v26 ^ [(NSMutableArray *)self->_events hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 2) != 0)
  {
    self->_sessionState = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 72);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double sessionStateChangeDate = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_sessionStateEvent = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 0x10) == 0)
  {
LABEL_5:
    if ((v6 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double sessionStateEventDate = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v6 = *((unsigned char *)v4 + 72);
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_double startDate = *((double *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  if (*((unsigned char *)v4 + 72))
  {
LABEL_7:
    self->_double endDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
  currentActivity = self->_currentActivity;
  uint64_t v8 = *((void *)v5 + 7);
  if (currentActivity)
  {
    if (v8) {
      -[HDCodableWorkoutActivity mergeFrom:](currentActivity, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[HDCodableWorkoutSessionGlobalState setCurrentActivity:](self, "setCurrentActivity:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v5 + 8);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[HDCodableWorkoutSessionGlobalState addEvents:](self, "addEvents:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (double)sessionStateChangeDate
{
  return self->_sessionStateChangeDate;
}

- (int64_t)sessionStateEvent
{
  return self->_sessionStateEvent;
}

- (double)sessionStateEventDate
{
  return self->_sessionStateEventDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HDCodableWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_currentActivity, 0);
}

@end