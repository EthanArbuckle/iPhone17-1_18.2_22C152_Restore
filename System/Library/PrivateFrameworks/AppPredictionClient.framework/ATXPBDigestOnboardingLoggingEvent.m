@interface ATXPBDigestOnboardingLoggingEvent
+ (Class)deliveryTimesType;
- (BOOL)didSelectShowMore;
- (BOOL)hasDidSelectShowMore;
- (BOOL)hasDigestOnboardingOutcome;
- (BOOL)hasEntrySource;
- (BOOL)hasFinalUIShown;
- (BOOL)hasSessionUUID;
- (BOOL)hasTimeTaken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deliveryTimes;
- (NSString)sessionUUID;
- (double)timeTaken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deliveryTimesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)digestOnboardingOutcomeAsString:(int)a3;
- (id)entrySourceAsString:(int)a3;
- (id)finalUIShownAsString:(int)a3;
- (int)StringAsDigestOnboardingOutcome:(id)a3;
- (int)StringAsEntrySource:(id)a3;
- (int)StringAsFinalUIShown:(id)a3;
- (int)digestOnboardingOutcome;
- (int)entrySource;
- (int)finalUIShown;
- (unint64_t)deliveryTimesCount;
- (unint64_t)hash;
- (void)addDeliveryTimes:(id)a3;
- (void)clearDeliveryTimes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeliveryTimes:(id)a3;
- (void)setDidSelectShowMore:(BOOL)a3;
- (void)setDigestOnboardingOutcome:(int)a3;
- (void)setEntrySource:(int)a3;
- (void)setFinalUIShown:(int)a3;
- (void)setHasDidSelectShowMore:(BOOL)a3;
- (void)setHasDigestOnboardingOutcome:(BOOL)a3;
- (void)setHasEntrySource:(BOOL)a3;
- (void)setHasFinalUIShown:(BOOL)a3;
- (void)setHasTimeTaken:(BOOL)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimeTaken:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBDigestOnboardingLoggingEvent

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (int)entrySource
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_entrySource;
  }
  else {
    return 0;
  }
}

- (void)setEntrySource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_entrySource = a3;
}

- (void)setHasEntrySource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEntrySource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)entrySourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06A28[a3];
  }

  return v3;
}

- (int)StringAsEntrySource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OnboardingSuggestion"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Settings"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)digestOnboardingOutcome
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_digestOnboardingOutcome;
  }
  else {
    return 0;
  }
}

- (void)setDigestOnboardingOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_digestOnboardingOutcome = a3;
}

- (void)setHasDigestOnboardingOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDigestOnboardingOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)digestOnboardingOutcomeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06A40[a3];
  }

  return v3;
}

- (int)StringAsDigestOnboardingOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Dismiss"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Defer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Complete"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)finalUIShown
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_finalUIShown;
  }
  else {
    return 0;
  }
}

- (void)setFinalUIShown:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_finalUIShown = a3;
}

- (void)setHasFinalUIShown:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFinalUIShown
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)finalUIShownAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06A60[a3];
  }

  return v3;
}

- (int)StringAsFinalUIShown:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Introduction"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AppPicker"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Scheduler"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTimeTaken:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeTaken
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDidSelectShowMore:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_didSelectShowMore = a3;
}

- (void)setHasDidSelectShowMore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDidSelectShowMore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearDeliveryTimes
{
}

- (void)addDeliveryTimes:(id)a3
{
  id v4 = a3;
  deliveryTimes = self->_deliveryTimes;
  id v8 = v4;
  if (!deliveryTimes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_deliveryTimes;
    self->_deliveryTimes = v6;

    id v4 = v8;
    deliveryTimes = self->_deliveryTimes;
  }
  [(NSMutableArray *)deliveryTimes addObject:v4];
}

- (unint64_t)deliveryTimesCount
{
  return [(NSMutableArray *)self->_deliveryTimes count];
}

- (id)deliveryTimesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deliveryTimes objectAtIndex:a3];
}

+ (Class)deliveryTimesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBDigestOnboardingLoggingEvent;
  id v4 = [(ATXPBDigestOnboardingLoggingEvent *)&v8 description];
  v5 = [(ATXPBDigestOnboardingLoggingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t entrySource = self->_entrySource;
    if (entrySource >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entrySource);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D06A28[entrySource];
    }
    [v4 setObject:v8 forKey:@"entrySource"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t digestOnboardingOutcome = self->_digestOnboardingOutcome;
  if (digestOnboardingOutcome >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_digestOnboardingOutcome);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E5D06A40[digestOnboardingOutcome];
  }
  [v4 setObject:v10 forKey:@"DigestOnboardingOutcome"];

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
LABEL_15:
    uint64_t finalUIShown = self->_finalUIShown;
    if (finalUIShown >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_finalUIShown);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5D06A60[finalUIShown];
    }
    [v4 setObject:v12 forKey:@"finalUIShown"];

    char has = (char)self->_has;
  }
LABEL_19:
  if (has)
  {
    v13 = [NSNumber numberWithDouble:self->_timeTaken];
    [v4 setObject:v13 forKey:@"timeTaken"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_didSelectShowMore];
    [v4 setObject:v14 forKey:@"didSelectShowMore"];
  }
  deliveryTimes = self->_deliveryTimes;
  if (deliveryTimes) {
    [v4 setObject:deliveryTimes forKey:@"deliveryTimes"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestOnboardingLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_sessionUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_deliveryTimes;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_entrySource;
    *((unsigned char *)v4 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_digestOnboardingOutcome;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_19:
    *((void *)v4 + 1) = *(void *)&self->_timeTaken;
    *((unsigned char *)v4 + 52) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_finalUIShown;
  *((unsigned char *)v4 + 52) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_19;
  }
LABEL_7:
  if ((has & 0x10) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 48) = self->_didSelectShowMore;
    *((unsigned char *)v4 + 52) |= 0x10u;
  }
LABEL_9:
  if ([(ATXPBDigestOnboardingLoggingEvent *)self deliveryTimesCount])
  {
    [v10 clearDeliveryTimes];
    unint64_t v6 = [(ATXPBDigestOnboardingLoggingEvent *)self deliveryTimesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ATXPBDigestOnboardingLoggingEvent *)self deliveryTimesAtIndex:i];
        [v10 addDeliveryTimes:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_entrySource;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_digestOnboardingOutcome;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 32) = self->_finalUIShown;
  *(unsigned char *)(v5 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  *(double *)(v5 + 8) = self->_timeTaken;
  *(unsigned char *)(v5 + 52) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 48) = self->_didSelectShowMore;
    *(unsigned char *)(v5 + 52) |= 0x10u;
  }
LABEL_7:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_deliveryTimes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addDeliveryTimes:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_entrySource != *((_DWORD *)v4 + 7)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_digestOnboardingOutcome != *((_DWORD *)v4 + 6)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_finalUIShown != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_timeTaken != *((double *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_34;
    }
LABEL_28:
    char v6 = 0;
    goto LABEL_29;
  }
  if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
    goto LABEL_28;
  }
  if (!self->_didSelectShowMore)
  {
    if (!*((unsigned char *)v4 + 48)) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }
  if (!*((unsigned char *)v4 + 48)) {
    goto LABEL_28;
  }
LABEL_34:
  deliveryTimes = self->_deliveryTimes;
  if ((unint64_t)deliveryTimes | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](deliveryTimes, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_29:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionUUID hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_entrySource;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_digestOnboardingOutcome;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_finalUIShown;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double timeTaken = self->_timeTaken;
  double v9 = -timeTaken;
  if (timeTaken >= 0.0) {
    double v9 = self->_timeTaken;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_15:
  if ((has & 0x10) != 0) {
    uint64_t v13 = 2654435761 * self->_didSelectShowMore;
  }
  else {
    uint64_t v13 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v7 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_deliveryTimes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[ATXPBDigestOnboardingLoggingEvent setSessionUUID:](self, "setSessionUUID:");
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t entrySource = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_uint64_t digestOnboardingOutcome = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_uint64_t finalUIShown = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_20:
  self->_double timeTaken = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
LABEL_8:
    self->_didSelectShowMore = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_9:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        -[ATXPBDigestOnboardingLoggingEvent addDeliveryTimes:](self, "addDeliveryTimes:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (BOOL)didSelectShowMore
{
  return self->_didSelectShowMore;
}

- (NSMutableArray)deliveryTimes
{
  return self->_deliveryTimes;
}

- (void)setDeliveryTimes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);

  objc_storeStrong((id *)&self->_deliveryTimes, 0);
}

@end