@interface ATXMPBAnchorModelEngagementTracker
- (BOOL)hasAbGroup;
- (BOOL)hasAnchorPopularity;
- (BOOL)hasAnchorType;
- (BOOL)hasCandidateType;
- (BOOL)hasClassConditionalProbability;
- (BOOL)hasConsumerSubType;
- (BOOL)hasEngagementType;
- (BOOL)hasExecutableObject;
- (BOOL)hasGlobalPopularity;
- (BOOL)hasNumPredictionsforAnchor;
- (BOOL)hasNumUniqueOccurrencesAfterAnchor;
- (BOOL)hasPosteriorProbability;
- (BOOL)hasScore;
- (BOOL)hasSecondsAfterAnchor;
- (BOOL)hasStandardDeviationOfOffsetFromAnchor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)anchorType;
- (NSString)candidateType;
- (NSString)consumerSubType;
- (NSString)executableObject;
- (double)anchorPopularity;
- (double)classConditionalProbability;
- (double)globalPopularity;
- (double)posteriorProbability;
- (double)score;
- (double)standardDeviationOfOffsetFromAnchor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)engagementType;
- (unint64_t)hash;
- (unsigned)numPredictionsforAnchor;
- (unsigned)numUniqueOccurrencesAfterAnchor;
- (unsigned)secondsAfterAnchor;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAnchorPopularity:(double)a3;
- (void)setAnchorType:(id)a3;
- (void)setCandidateType:(id)a3;
- (void)setClassConditionalProbability:(double)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setEngagementType:(int)a3;
- (void)setExecutableObject:(id)a3;
- (void)setGlobalPopularity:(double)a3;
- (void)setHasAnchorPopularity:(BOOL)a3;
- (void)setHasClassConditionalProbability:(BOOL)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)setHasGlobalPopularity:(BOOL)a3;
- (void)setHasNumPredictionsforAnchor:(BOOL)a3;
- (void)setHasNumUniqueOccurrencesAfterAnchor:(BOOL)a3;
- (void)setHasPosteriorProbability:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSecondsAfterAnchor:(BOOL)a3;
- (void)setHasStandardDeviationOfOffsetFromAnchor:(BOOL)a3;
- (void)setNumPredictionsforAnchor:(unsigned int)a3;
- (void)setNumUniqueOccurrencesAfterAnchor:(unsigned int)a3;
- (void)setPosteriorProbability:(double)a3;
- (void)setScore:(double)a3;
- (void)setSecondsAfterAnchor:(unsigned int)a3;
- (void)setStandardDeviationOfOffsetFromAnchor:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAnchorModelEngagementTracker

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
}

- (void)setScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasCandidateType
{
  return self->_candidateType != 0;
}

- (void)setSecondsAfterAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_secondsAfterAnchor = a3;
}

- (void)setHasSecondsAfterAnchor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSecondsAfterAnchor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumPredictionsforAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numPredictionsforAnchor = a3;
}

- (void)setHasNumPredictionsforAnchor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumPredictionsforAnchor
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)engagementType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_engagementType;
  }
  else {
    return 0;
  }
}

- (void)setEngagementType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEngagementType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E68AF5D0[a3];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Engaged"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Rejected"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Abandoned"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasExecutableObject
{
  return self->_executableObject != 0;
}

- (void)setPosteriorProbability:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_posteriorProbability = a3;
}

- (void)setHasPosteriorProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPosteriorProbability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setClassConditionalProbability:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_classConditionalProbability = a3;
}

- (void)setHasClassConditionalProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasClassConditionalProbability
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStandardDeviationOfOffsetFromAnchor:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_standardDeviationOfOffsetFromAnchor = a3;
}

- (void)setHasStandardDeviationOfOffsetFromAnchor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasStandardDeviationOfOffsetFromAnchor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumUniqueOccurrencesAfterAnchor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numUniqueOccurrencesAfterAnchor = a3;
}

- (void)setHasNumUniqueOccurrencesAfterAnchor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumUniqueOccurrencesAfterAnchor
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAnchorPopularity:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_anchorPopularity = a3;
}

- (void)setHasAnchorPopularity:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAnchorPopularity
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGlobalPopularity:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_globalPopularity = a3;
}

- (void)setHasGlobalPopularity:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlobalPopularity
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBAnchorModelEngagementTracker;
  int v4 = [(ATXMPBAnchorModelEngagementTracker *)&v8 description];
  v5 = [(ATXMPBAnchorModelEngagementTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  anchorType = self->_anchorType;
  if (anchorType) {
    [v3 setObject:anchorType forKey:@"anchorType"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v6 forKey:@"score"];
  }
  candidateType = self->_candidateType;
  if (candidateType) {
    [v4 setObject:candidateType forKey:@"candidateType"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_secondsAfterAnchor];
    [v4 setObject:v9 forKey:@"secondsAfterAnchor"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithUnsignedInt:self->_numPredictionsforAnchor];
  [v4 setObject:v10 forKey:@"numPredictionsforAnchor"];

  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t engagementType = self->_engagementType;
  if (engagementType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E68AF5D0[engagementType];
  }
  [v4 setObject:v12 forKey:@"engagementType"];

LABEL_17:
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  executableObject = self->_executableObject;
  if (executableObject) {
    [v4 setObject:executableObject forKey:@"executableObject"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 8) != 0)
  {
    v19 = [NSNumber numberWithDouble:self->_posteriorProbability];
    [v4 setObject:v19 forKey:@"posteriorProbability"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 2) == 0)
    {
LABEL_25:
      if ((v16 & 0x20) == 0) {
        goto LABEL_26;
      }
      goto LABEL_35;
    }
  }
  else if ((v16 & 2) == 0)
  {
    goto LABEL_25;
  }
  v20 = [NSNumber numberWithDouble:self->_classConditionalProbability];
  [v4 setObject:v20 forKey:@"classConditionalProbability"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_26:
    if ((v16 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
LABEL_35:
  v21 = [NSNumber numberWithDouble:self->_standardDeviationOfOffsetFromAnchor];
  [v4 setObject:v21 forKey:@"standardDeviationOfOffsetFromAnchor"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) == 0)
  {
LABEL_27:
    if ((v16 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_37;
  }
LABEL_36:
  v22 = [NSNumber numberWithUnsignedInt:self->_numUniqueOccurrencesAfterAnchor];
  [v4 setObject:v22 forKey:@"numUniqueOccurrencesAfterAnchor"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 1) == 0)
  {
LABEL_28:
    if ((v16 & 4) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_37:
  v23 = [NSNumber numberWithDouble:self->_anchorPopularity];
  [v4 setObject:v23 forKey:@"anchorPopularity"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_29:
    v17 = [NSNumber numberWithDouble:self->_globalPopularity];
    [v4 setObject:v17 forKey:@"globalPopularity"];
  }
LABEL_30:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelEngagementTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
  if (self->_candidateType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_11:
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_executableObject)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_24:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_anchorType)
  {
    objc_msgSend(v4, "setAnchorType:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_score;
    *((_WORD *)v4 + 58) |= 0x10u;
  }
  if (self->_candidateType)
  {
    objc_msgSend(v7, "setCandidateType:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_secondsAfterAnchor;
    *((_WORD *)v4 + 58) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_9:
      if ((has & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 26) = self->_numPredictionsforAnchor;
  *((_WORD *)v4 + 58) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 22) = self->_engagementType;
    *((_WORD *)v4 + 58) |= 0x40u;
  }
LABEL_11:
  if (self->_consumerSubType)
  {
    objc_msgSend(v7, "setConsumerSubType:");
    id v4 = v7;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v7, "setAbGroup:");
    id v4 = v7;
  }
  if (self->_executableObject)
  {
    objc_msgSend(v7, "setExecutableObject:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
  {
    *((void *)v4 + 4) = *(void *)&self->_posteriorProbability;
    *((_WORD *)v4 + 58) |= 8u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  *((void *)v4 + 2) = *(void *)&self->_classConditionalProbability;
  *((_WORD *)v4 + 58) |= 2u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 6) = *(void *)&self->_standardDeviationOfOffsetFromAnchor;
  *((_WORD *)v4 + 58) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v4 + 27) = self->_numUniqueOccurrencesAfterAnchor;
  *((_WORD *)v4 + 58) |= 0x100u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_34:
  *((void *)v4 + 1) = *(void *)&self->_anchorPopularity;
  *((_WORD *)v4 + 58) |= 1u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    *((void *)v4 + 3) = *(void *)&self->_globalPopularity;
    *((_WORD *)v4 + 58) |= 4u;
  }
LABEL_24:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_anchorType copyWithZone:a3];
  id v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_score;
    *(_WORD *)(v5 + 116) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_candidateType copyWithZone:a3];
  v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_secondsAfterAnchor;
    *(_WORD *)(v5 + 116) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 104) = self->_numPredictionsforAnchor;
  *(_WORD *)(v5 + 116) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 88) = self->_engagementType;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
LABEL_7:
  uint64_t v11 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v12 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v11;

  uint64_t v13 = [(NSString *)self->_abGroup copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  uint64_t v15 = [(NSString *)self->_executableObject copyWithZone:a3];
  __int16 v16 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_posteriorProbability;
    *(_WORD *)(v5 + 116) |= 8u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 2) == 0)
    {
LABEL_9:
      if ((v17 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 16) = self->_classConditionalProbability;
  *(_WORD *)(v5 + 116) |= 2u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_10:
    if ((v17 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_standardDeviationOfOffsetFromAnchor;
  *(_WORD *)(v5 + 116) |= 0x20u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_11:
    if ((v17 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_22:
    *(double *)(v5 + 8) = self->_anchorPopularity;
    *(_WORD *)(v5 + 116) |= 1u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_13;
  }
LABEL_21:
  *(_DWORD *)(v5 + 108) = self->_numUniqueOccurrencesAfterAnchor;
  *(_WORD *)(v5 + 116) |= 0x100u;
  __int16 v17 = (__int16)self->_has;
  if (v17) {
    goto LABEL_22;
  }
LABEL_12:
  if ((v17 & 4) != 0)
  {
LABEL_13:
    *(double *)(v5 + 24) = self->_globalPopularity;
    *(_WORD *)(v5 + 116) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](anchorType, "isEqual:")) {
      goto LABEL_63;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 58);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_score != *((double *)v4 + 5)) {
      goto LABEL_63;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_63;
  }
  candidateType = self->_candidateType;
  if ((unint64_t)candidateType | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](candidateType, "isEqual:"))
    {
LABEL_63:
      BOOL v15 = 0;
      goto LABEL_64;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 58);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_secondsAfterAnchor != *((_DWORD *)v4 + 28)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_numPredictionsforAnchor != *((_DWORD *)v4 + 26)) {
      goto LABEL_63;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_63;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_engagementType != *((_DWORD *)v4 + 22)) {
      goto LABEL_63;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_63;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 10)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_63;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_63;
    }
  }
  executableObject = self->_executableObject;
  if ((unint64_t)executableObject | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](executableObject, "isEqual:")) {
      goto LABEL_63;
    }
  }
  __int16 v13 = (__int16)self->_has;
  __int16 v14 = *((_WORD *)v4 + 58);
  if ((v13 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_posteriorProbability != *((double *)v4 + 4)) {
      goto LABEL_63;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_classConditionalProbability != *((double *)v4 + 2)) {
      goto LABEL_63;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_63;
  }
  if ((v13 & 0x20) != 0)
  {
    if ((v14 & 0x20) == 0 || self->_standardDeviationOfOffsetFromAnchor != *((double *)v4 + 6)) {
      goto LABEL_63;
    }
  }
  else if ((v14 & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_numUniqueOccurrencesAfterAnchor != *((_DWORD *)v4 + 27)) {
      goto LABEL_63;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_63;
  }
  if (v13)
  {
    if ((v14 & 1) == 0 || self->_anchorPopularity != *((double *)v4 + 1)) {
      goto LABEL_63;
    }
  }
  else if (v14)
  {
    goto LABEL_63;
  }
  if ((v13 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_globalPopularity != *((double *)v4 + 3)) {
      goto LABEL_63;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (v14 & 4) == 0;
  }
LABEL_64:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v44 = [(NSString *)self->_anchorType hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    double score = self->_score;
    double v5 = -score;
    if (score >= 0.0) {
      double v5 = self->_score;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v43 = [(NSString *)self->_candidateType hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
    uint64_t v42 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v41 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  uint64_t v42 = 2654435761 * self->_secondsAfterAnchor;
  if ((has & 0x80) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v41 = 2654435761 * self->_numPredictionsforAnchor;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v40 = 2654435761 * self->_engagementType;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v40 = 0;
LABEL_16:
  NSUInteger v39 = [(NSString *)self->_consumerSubType hash];
  NSUInteger v38 = [(NSString *)self->_abGroup hash];
  NSUInteger v9 = [(NSString *)self->_executableObject hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    double posteriorProbability = self->_posteriorProbability;
    double v13 = -posteriorProbability;
    if (posteriorProbability >= 0.0) {
      double v13 = self->_posteriorProbability;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((v10 & 2) != 0)
  {
    double classConditionalProbability = self->_classConditionalProbability;
    double v18 = -classConditionalProbability;
    if (classConditionalProbability >= 0.0) {
      double v18 = self->_classConditionalProbability;
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
  if ((v10 & 0x20) != 0)
  {
    double standardDeviationOfOffsetFromAnchor = self->_standardDeviationOfOffsetFromAnchor;
    double v23 = -standardDeviationOfOffsetFromAnchor;
    if (standardDeviationOfOffsetFromAnchor >= 0.0) {
      double v23 = self->_standardDeviationOfOffsetFromAnchor;
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
  if ((v10 & 0x100) != 0)
  {
    uint64_t v26 = 2654435761 * self->_numUniqueOccurrencesAfterAnchor;
    if (v10) {
      goto LABEL_42;
    }
LABEL_47:
    unint64_t v31 = 0;
    goto LABEL_50;
  }
  uint64_t v26 = 0;
  if ((v10 & 1) == 0) {
    goto LABEL_47;
  }
LABEL_42:
  double anchorPopularity = self->_anchorPopularity;
  double v28 = -anchorPopularity;
  if (anchorPopularity >= 0.0) {
    double v28 = self->_anchorPopularity;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_50:
  if ((v10 & 4) != 0)
  {
    double globalPopularity = self->_globalPopularity;
    double v34 = -globalPopularity;
    if (globalPopularity >= 0.0) {
      double v34 = self->_globalPopularity;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    unint64_t v32 = 0;
  }
  return v3 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 8))
  {
    -[ATXMPBAnchorModelEngagementTracker setAnchorType:](self, "setAnchorType:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 58) & 0x10) != 0)
  {
    self->_double score = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 9))
  {
    -[ATXMPBAnchorModelEngagementTracker setCandidateType:](self, "setCandidateType:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 58);
  if ((v5 & 0x200) != 0)
  {
    self->_secondsAfterAnchor = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 58);
    if ((v5 & 0x80) == 0)
    {
LABEL_9:
      if ((v5 & 0x40) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_numPredictionsforAnchor = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 58) & 0x40) != 0)
  {
LABEL_10:
    self->_uint64_t engagementType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:
  if (*((void *)v4 + 10))
  {
    -[ATXMPBAnchorModelEngagementTracker setConsumerSubType:](self, "setConsumerSubType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 7))
  {
    -[ATXMPBAnchorModelEngagementTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[ATXMPBAnchorModelEngagementTracker setExecutableObject:](self, "setExecutableObject:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 8) != 0)
  {
    self->_double posteriorProbability = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 58);
    if ((v6 & 2) == 0)
    {
LABEL_19:
      if ((v6 & 0x20) == 0) {
        goto LABEL_20;
      }
      goto LABEL_32;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_19;
  }
  self->_double classConditionalProbability = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x20) == 0)
  {
LABEL_20:
    if ((v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double standardDeviationOfOffsetFromAnchor = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 0x100) == 0)
  {
LABEL_21:
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_numUniqueOccurrencesAfterAnchor = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 58);
  if ((v6 & 1) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_34:
  self->_double anchorPopularity = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 58) & 4) != 0)
  {
LABEL_23:
    self->_double globalPopularity = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_24:
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (void)setCandidateType:(id)a3
{
}

- (unsigned)secondsAfterAnchor
{
  return self->_secondsAfterAnchor;
}

- (unsigned)numPredictionsforAnchor
{
  return self->_numPredictionsforAnchor;
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)executableObject
{
  return self->_executableObject;
}

- (void)setExecutableObject:(id)a3
{
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (double)standardDeviationOfOffsetFromAnchor
{
  return self->_standardDeviationOfOffsetFromAnchor;
}

- (unsigned)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)anchorPopularity
{
  return self->_anchorPopularity;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableObject, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end