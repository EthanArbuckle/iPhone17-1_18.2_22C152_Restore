@interface ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcome
- (BOOL)hasOutcomeType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outcomeTypeAsString:(int)a3;
- (int)StringAsOutcomeType:(id)a3;
- (int)outcomeType;
- (int64_t)timestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasOutcomeType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOutcomeType:(int)a3;
- (void)setTimestamp:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcome

- (void)setTimestamp:(int64_t)a3
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

- (int)outcomeType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_outcomeType;
  }
  else {
    return 0;
  }
}

- (void)setOutcomeType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_outcomeType = a3;
}

- (void)setHasOutcomeType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOutcomeType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)outcomeTypeAsString:(int)a3
{
  if (a3 >= 0x18)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AF9E8[a3];
  }
  return v3;
}

- (int)StringAsOutcomeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"OutcomeTypeFailureScoreIsSameAsThresholdBadLuck"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureRecentDismissal"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureWidgetIsOnDenyList"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureRotationExceededDurationLimit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureEarlierSuggestionCurrentlyBeingPredictedWasChosen"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureLaterSuggestionChosen"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureScoreIsSameAsThresholdButCountOfRecentRotationsExceedsSoftRotationQuota"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureNilRelevance"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureNonPositiveScore"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureNumberOfRecentRotationsHaveReachedHardRotationQuota"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureSuggestionInCoolDown"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureInsufficientHistory"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureScoreIsSmallerThanThreshold"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeUnknown"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassWidgetKitDeveloperModeEnabled"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassWidgetHasUnlimitedSoftRotationQuota"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassSoftRotationQuotaExceedsAverageCountOfDailyEntries"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassSuggestionPreviouslyPassedButWidgetHasNotBeenSurfaced"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassWidgetWasSurfacedAndHasNotExceededDurationLimit"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassScoreIsGreaterThanThreshold"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"OutcomeTypePassScoreIsSameAsThresholdGoodLuck"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeSuggestionHasExpired"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureBlockedByScreenTime"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"OutcomeTypeFailureScoreIsSameAsThresholdRandomizationDisabled"])
  {
    int v4 = 23;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcome;
  int v4 = [(ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcome *)&v8 description];
  v5 = [(ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcome *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t outcomeType = self->_outcomeType;
    if (outcomeType >= 0x18)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outcomeType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E68AF9E8[outcomeType];
    }
    [v3 setObject:v7 forKey:@"outcomeType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceAbuseControlOutcomeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_outcomeType;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_outcomeType;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_outcomeType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_outcomeType;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t outcomeType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)timestamp
{
  return self->_timestamp;
}

@end