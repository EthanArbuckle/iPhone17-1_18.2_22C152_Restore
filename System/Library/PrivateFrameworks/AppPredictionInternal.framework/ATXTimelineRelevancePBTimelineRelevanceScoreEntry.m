@interface ATXTimelineRelevancePBTimelineRelevanceScoreEntry
- (BOOL)hasDuration;
- (BOOL)hasRelevanceScore;
- (BOOL)hasSuggestionID;
- (BOOL)hasSuggestionMappingReason;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)suggestionID;
- (double)relevanceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionMappingReasonAsString:(int)a3;
- (int)StringAsSuggestionMappingReason:(id)a3;
- (int)suggestionMappingReason;
- (int64_t)duration;
- (int64_t)timestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(int64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasRelevanceScore:(BOOL)a3;
- (void)setHasSuggestionMappingReason:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setSuggestionID:(id)a3;
- (void)setSuggestionMappingReason:(int)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBTimelineRelevanceScoreEntry

- (void)setRelevanceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_relevanceScore = a3;
}

- (void)setHasRelevanceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRelevanceScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (void)setTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSuggestionID
{
  return self->_suggestionID != 0;
}

- (int)suggestionMappingReason
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_suggestionMappingReason;
  }
  else {
    return 0;
  }
}

- (void)setSuggestionMappingReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_suggestionMappingReason = a3;
}

- (void)setHasSuggestionMappingReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuggestionMappingReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)suggestionMappingReasonAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B45C0[a3];
  }
  return v3;
}

- (int)StringAsSuggestionMappingReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ReasonCoalescedWithPreviousSuggestion"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ReasonNewInfoSuggestion"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ReasonPreviousSuggestionWasTrimmed"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ReasonNilRelevance"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ReasonNonPositiveRelevanceScore"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ReasonEndDateOfPreviousSuggestionWasSet"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ReasonUnknown"])
  {
    int v4 = 6;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceScoreEntry;
  int v4 = [(ATXTimelineRelevancePBTimelineRelevanceScoreEntry *)&v8 description];
  v5 = [(ATXTimelineRelevancePBTimelineRelevanceScoreEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_relevanceScore];
    [v3 setObject:v9 forKey:@"relevanceScore"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_duration];
  [v3 setObject:v10 forKey:@"duration"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];
  }
LABEL_5:
  suggestionID = self->_suggestionID;
  if (suggestionID) {
    [v3 setObject:suggestionID forKey:@"suggestionID"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t suggestionMappingReason = self->_suggestionMappingReason;
    if (suggestionMappingReason >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestionMappingReason);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E68B45C0[suggestionMappingReason];
    }
    [v3 setObject:v8 forKey:@"suggestionMappingReason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceScoreEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_suggestionID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_relevanceScore;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_duration;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_timestamp;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_5:
  if (self->_suggestionID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSuggestionID:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_suggestionMappingReason;
    *((unsigned char *)v4 + 44) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_relevanceScore;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_duration;
  *(unsigned char *)(v5 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_suggestionID copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_suggestionMappingReason;
    *(unsigned char *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_relevanceScore != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_duration != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_timestamp != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  suggestionID = self->_suggestionID;
  if ((unint64_t)suggestionID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](suggestionID, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_suggestionMappingReason != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double relevanceScore = self->_relevanceScore;
    double v6 = -relevanceScore;
    if (relevanceScore >= 0.0) {
      double v6 = self->_relevanceScore;
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
  if (has)
  {
    uint64_t v9 = 2654435761 * self->_duration;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 4) != 0)
    {
LABEL_11:
      uint64_t v10 = 2654435761 * self->_timestamp;
      goto LABEL_14;
    }
  }
  uint64_t v10 = 0;
LABEL_14:
  NSUInteger v11 = [(NSString *)self->_suggestionID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_suggestionMappingReason;
  }
  else {
    uint64_t v12 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_double relevanceScore = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_4:
    self->_timestamp = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[ATXTimelineRelevancePBTimelineRelevanceScoreEntry setSuggestionID:](self, "setSuggestionID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    self->_uint64_t suggestionMappingReason = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (int64_t)duration
{
  return self->_duration;
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end