@interface ATXPBDigestOnboardingSuggestionLoggingEvent
- (BOOL)hasDigestOnboardingSuggestionOutcome;
- (BOOL)hasSessionUUID;
- (BOOL)hasTimeToResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sessionUUID;
- (double)timeToResolution;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)digestOnboardingSuggestionOutcomeAsString:(int)a3;
- (int)StringAsDigestOnboardingSuggestionOutcome:(id)a3;
- (int)digestOnboardingSuggestionOutcome;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDigestOnboardingSuggestionOutcome:(int)a3;
- (void)setHasDigestOnboardingSuggestionOutcome:(BOOL)a3;
- (void)setHasTimeToResolution:(BOOL)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimeToResolution:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBDigestOnboardingSuggestionLoggingEvent

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (int)digestOnboardingSuggestionOutcome
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_digestOnboardingSuggestionOutcome;
  }
  else {
    return 0;
  }
}

- (void)setDigestOnboardingSuggestionOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_digestOnboardingSuggestionOutcome = a3;
}

- (void)setHasDigestOnboardingSuggestionOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDigestOnboardingSuggestionOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)digestOnboardingSuggestionOutcomeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D06948[a3];
  }

  return v3;
}

- (int)StringAsDigestOnboardingSuggestionOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Dismissed"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Engaged"])
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

- (void)setTimeToResolution:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeToResolution = a3;
}

- (void)setHasTimeToResolution:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeToResolution
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBDigestOnboardingSuggestionLoggingEvent;
  int v4 = [(ATXPBDigestOnboardingSuggestionLoggingEvent *)&v8 description];
  v5 = [(ATXPBDigestOnboardingSuggestionLoggingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t digestOnboardingSuggestionOutcome = self->_digestOnboardingSuggestionOutcome;
    if (digestOnboardingSuggestionOutcome >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_digestOnboardingSuggestionOutcome);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D06948[digestOnboardingSuggestionOutcome];
    }
    [v4 setObject:v8 forKey:@"digestOnboardingSuggestionOutcome"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_timeToResolution];
    [v4 setObject:v9 forKey:@"timeToResolution"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBDigestOnboardingSuggestionLoggingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sessionUUID)
  {
    PBDataWriterWriteStringField();
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
  if (self->_sessionUUID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSessionUUID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_digestOnboardingSuggestionOutcome;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timeToResolution;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_digestOnboardingSuggestionOutcome;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timeToResolution;
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
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_digestOnboardingSuggestionOutcome != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_timeToResolution != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionUUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_digestOnboardingSuggestionOutcome;
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
  double timeToResolution = self->_timeToResolution;
  double v6 = -timeToResolution;
  if (timeToResolution >= 0.0) {
    double v6 = self->_timeToResolution;
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
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[ATXPBDigestOnboardingSuggestionLoggingEvent setSessionUUID:](self, "setSessionUUID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t digestOnboardingSuggestionOutcome = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_double timeToResolution = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (double)timeToResolution
{
  return self->_timeToResolution;
}

- (void).cxx_destruct
{
}

@end