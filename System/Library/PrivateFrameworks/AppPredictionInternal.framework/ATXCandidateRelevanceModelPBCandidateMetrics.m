@interface ATXCandidateRelevanceModelPBCandidateMetrics
- (BOOL)hasCandidateIdentifier;
- (BOOL)hasCandidateNumberOfDaysWithPositiveSamples;
- (BOOL)hasCandidateNumberOfModelWeights;
- (BOOL)hasCandidateNumberOfNonZeroModelWeights;
- (BOOL)hasCandidateNumberOfPositiveSamples;
- (BOOL)hasCandidateNumberOfSamples;
- (BOOL)hasCandidateShadowF1;
- (BOOL)hasCandidateShadowLaunchPercentage;
- (BOOL)hasCandidateShadowPrecision;
- (BOOL)hasCandidateShadowRecall;
- (BOOL)hasCandidateShadowShownPercentage;
- (BOOL)hasCandidateUIF1;
- (BOOL)hasCandidateUILaunchPercentage;
- (BOOL)hasCandidateUIPrecision;
- (BOOL)hasCandidateUIRecall;
- (BOOL)hasCandidateUIShownPercentage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)candidateIdentifier;
- (float)candidateShadowF1;
- (float)candidateShadowLaunchPercentage;
- (float)candidateShadowPrecision;
- (float)candidateShadowRecall;
- (float)candidateShadowShownPercentage;
- (float)candidateUIF1;
- (float)candidateUILaunchPercentage;
- (float)candidateUIPrecision;
- (float)candidateUIRecall;
- (float)candidateUIShownPercentage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)candidateNumberOfDaysWithPositiveSamples;
- (unsigned)candidateNumberOfModelWeights;
- (unsigned)candidateNumberOfNonZeroModelWeights;
- (unsigned)candidateNumberOfPositiveSamples;
- (unsigned)candidateNumberOfSamples;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateIdentifier:(id)a3;
- (void)setCandidateNumberOfDaysWithPositiveSamples:(unsigned int)a3;
- (void)setCandidateNumberOfModelWeights:(unsigned int)a3;
- (void)setCandidateNumberOfNonZeroModelWeights:(unsigned int)a3;
- (void)setCandidateNumberOfPositiveSamples:(unsigned int)a3;
- (void)setCandidateNumberOfSamples:(unsigned int)a3;
- (void)setCandidateShadowF1:(float)a3;
- (void)setCandidateShadowLaunchPercentage:(float)a3;
- (void)setCandidateShadowPrecision:(float)a3;
- (void)setCandidateShadowRecall:(float)a3;
- (void)setCandidateShadowShownPercentage:(float)a3;
- (void)setCandidateUIF1:(float)a3;
- (void)setCandidateUILaunchPercentage:(float)a3;
- (void)setCandidateUIPrecision:(float)a3;
- (void)setCandidateUIRecall:(float)a3;
- (void)setCandidateUIShownPercentage:(float)a3;
- (void)setHasCandidateNumberOfDaysWithPositiveSamples:(BOOL)a3;
- (void)setHasCandidateNumberOfModelWeights:(BOOL)a3;
- (void)setHasCandidateNumberOfNonZeroModelWeights:(BOOL)a3;
- (void)setHasCandidateNumberOfPositiveSamples:(BOOL)a3;
- (void)setHasCandidateNumberOfSamples:(BOOL)a3;
- (void)setHasCandidateShadowF1:(BOOL)a3;
- (void)setHasCandidateShadowLaunchPercentage:(BOOL)a3;
- (void)setHasCandidateShadowPrecision:(BOOL)a3;
- (void)setHasCandidateShadowRecall:(BOOL)a3;
- (void)setHasCandidateShadowShownPercentage:(BOOL)a3;
- (void)setHasCandidateUIF1:(BOOL)a3;
- (void)setHasCandidateUILaunchPercentage:(BOOL)a3;
- (void)setHasCandidateUIPrecision:(BOOL)a3;
- (void)setHasCandidateUIRecall:(BOOL)a3;
- (void)setHasCandidateUIShownPercentage:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXCandidateRelevanceModelPBCandidateMetrics

- (void)setCandidateNumberOfPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_candidateNumberOfPositiveSamples = a3;
}

- (void)setHasCandidateNumberOfPositiveSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCandidateNumberOfPositiveSamples
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCandidateNumberOfSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_candidateNumberOfSamples = a3;
}

- (void)setHasCandidateNumberOfSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCandidateNumberOfSamples
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCandidateNumberOfDaysWithPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_candidateNumberOfDaysWithPositiveSamples = a3;
}

- (void)setHasCandidateNumberOfDaysWithPositiveSamples:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCandidateNumberOfDaysWithPositiveSamples
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCandidateNumberOfModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_candidateNumberOfModelWeights = a3;
}

- (void)setHasCandidateNumberOfModelWeights:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCandidateNumberOfModelWeights
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCandidateNumberOfNonZeroModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_candidateNumberOfNonZeroModelWeights = a3;
}

- (void)setHasCandidateNumberOfNonZeroModelWeights:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCandidateNumberOfNonZeroModelWeights
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCandidateShadowLaunchPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_candidateShadowLaunchPercentage = a3;
}

- (void)setHasCandidateShadowLaunchPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCandidateShadowLaunchPercentage
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setCandidateShadowShownPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_candidateShadowShownPercentage = a3;
}

- (void)setHasCandidateShadowShownPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasCandidateShadowShownPercentage
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCandidateShadowPrecision:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_candidateShadowPrecision = a3;
}

- (void)setHasCandidateShadowPrecision:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasCandidateShadowPrecision
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCandidateShadowRecall:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_candidateShadowRecall = a3;
}

- (void)setHasCandidateShadowRecall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasCandidateShadowRecall
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCandidateShadowF1:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_candidateShadowF1 = a3;
}

- (void)setHasCandidateShadowF1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCandidateShadowF1
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCandidateUILaunchPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_candidateUILaunchPercentage = a3;
}

- (void)setHasCandidateUILaunchPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasCandidateUILaunchPercentage
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCandidateUIShownPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_candidateUIShownPercentage = a3;
}

- (void)setHasCandidateUIShownPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasCandidateUIShownPercentage
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setCandidateUIPrecision:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_candidateUIPrecision = a3;
}

- (void)setHasCandidateUIPrecision:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCandidateUIPrecision
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCandidateUIRecall:(float)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_candidateUIRecall = a3;
}

- (void)setHasCandidateUIRecall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasCandidateUIRecall
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCandidateUIF1:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_candidateUIF1 = a3;
}

- (void)setHasCandidateUIF1:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasCandidateUIF1
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasCandidateIdentifier
{
  return self->_candidateIdentifier != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelPBCandidateMetrics;
  v4 = [(ATXCandidateRelevanceModelPBCandidateMetrics *)&v8 description];
  v5 = [(ATXCandidateRelevanceModelPBCandidateMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_candidateNumberOfPositiveSamples];
    [v3 setObject:v9 forKey:@"candidateNumberOfPositiveSamples"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithUnsignedInt:self->_candidateNumberOfSamples];
  [v3 setObject:v10 forKey:@"candidateNumberOfSamples"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v11 = [NSNumber numberWithUnsignedInt:self->_candidateNumberOfDaysWithPositiveSamples];
  [v3 setObject:v11 forKey:@"candidateNumberOfDaysWithPositiveSamples"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v12 = [NSNumber numberWithUnsignedInt:self->_candidateNumberOfModelWeights];
  [v3 setObject:v12 forKey:@"candidateNumberOfModelWeights"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v13 = [NSNumber numberWithUnsignedInt:self->_candidateNumberOfNonZeroModelWeights];
  [v3 setObject:v13 forKey:@"candidateNumberOfNonZeroModelWeights"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(float *)&double v4 = self->_candidateShadowLaunchPercentage;
  v14 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v14 forKey:@"candidateShadowLaunchPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(float *)&double v4 = self->_candidateShadowShownPercentage;
  v15 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v15 forKey:@"candidateShadowShownPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(float *)&double v4 = self->_candidateShadowPrecision;
  v16 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v16 forKey:@"candidateShadowPrecision"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(float *)&double v4 = self->_candidateShadowRecall;
  v17 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v17 forKey:@"candidateShadowRecall"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(float *)&double v4 = self->_candidateShadowF1;
  v18 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v18 forKey:@"candidateShadowF1"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&double v4 = self->_candidateUILaunchPercentage;
  v19 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v19 forKey:@"candidateUILaunchPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(float *)&double v4 = self->_candidateUIShownPercentage;
  v20 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v20 forKey:@"candidateUIShownPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(float *)&double v4 = self->_candidateUIPrecision;
  v21 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v21 forKey:@"candidateUIPrecision"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  *(float *)&double v4 = self->_candidateUIRecall;
  v22 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v22 forKey:@"candidateUIRecall"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    *(float *)&double v4 = self->_candidateUIF1;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"candidateUIF1"];
  }
LABEL_17:
  candidateIdentifier = self->_candidateIdentifier;
  if (candidateIdentifier) {
    [v3 setObject:candidateIdentifier forKey:@"candidateIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBCandidateMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_17:
  if (self->_candidateIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_candidateNumberOfPositiveSamples;
    *((_WORD *)v4 + 38) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_candidateNumberOfSamples;
  *((_WORD *)v4 + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[4] = self->_candidateNumberOfDaysWithPositiveSamples;
  *((_WORD *)v4 + 38) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[5] = self->_candidateNumberOfModelWeights;
  *((_WORD *)v4 + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[6] = self->_candidateNumberOfNonZeroModelWeights;
  *((_WORD *)v4 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[10] = LODWORD(self->_candidateShadowLaunchPercentage);
  *((_WORD *)v4 + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[13] = LODWORD(self->_candidateShadowShownPercentage);
  *((_WORD *)v4 + 38) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[11] = LODWORD(self->_candidateShadowPrecision);
  *((_WORD *)v4 + 38) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[12] = LODWORD(self->_candidateShadowRecall);
  *((_WORD *)v4 + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[9] = LODWORD(self->_candidateShadowF1);
  *((_WORD *)v4 + 38) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[15] = LODWORD(self->_candidateUILaunchPercentage);
  *((_WORD *)v4 + 38) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[18] = LODWORD(self->_candidateUIShownPercentage);
  *((_WORD *)v4 + 38) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[16] = LODWORD(self->_candidateUIPrecision);
  *((_WORD *)v4 + 38) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  v4[17] = LODWORD(self->_candidateUIRecall);
  *((_WORD *)v4 + 38) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_16:
    v4[14] = LODWORD(self->_candidateUIF1);
    *((_WORD *)v4 + 38) |= 0x400u;
  }
LABEL_17:
  if (self->_candidateIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setCandidateIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_candidateNumberOfPositiveSamples;
    *(_WORD *)(v5 + 76) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_candidateNumberOfSamples;
  *(_WORD *)(v5 + 76) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 16) = self->_candidateNumberOfDaysWithPositiveSamples;
  *(_WORD *)(v5 + 76) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 20) = self->_candidateNumberOfModelWeights;
  *(_WORD *)(v5 + 76) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 24) = self->_candidateNumberOfNonZeroModelWeights;
  *(_WORD *)(v5 + 76) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(float *)(v5 + 40) = self->_candidateShadowLaunchPercentage;
  *(_WORD *)(v5 + 76) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(float *)(v5 + 52) = self->_candidateShadowShownPercentage;
  *(_WORD *)(v5 + 76) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(float *)(v5 + 44) = self->_candidateShadowPrecision;
  *(_WORD *)(v5 + 76) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(float *)(v5 + 48) = self->_candidateShadowRecall;
  *(_WORD *)(v5 + 76) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(float *)(v5 + 36) = self->_candidateShadowF1;
  *(_WORD *)(v5 + 76) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(float *)(v5 + 60) = self->_candidateUILaunchPercentage;
  *(_WORD *)(v5 + 76) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(float *)(v5 + 72) = self->_candidateUIShownPercentage;
  *(_WORD *)(v5 + 76) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    *(float *)(v5 + 68) = self->_candidateUIRecall;
    *(_WORD *)(v5 + 76) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_30:
  *(float *)(v5 + 64) = self->_candidateUIPrecision;
  *(_WORD *)(v5 + 76) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 0x400) != 0)
  {
LABEL_16:
    *(float *)(v5 + 56) = self->_candidateUIF1;
    *(_WORD *)(v5 + 76) |= 0x400u;
  }
LABEL_17:
  uint64_t v8 = [(NSString *)self->_candidateIdentifier copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_candidateNumberOfPositiveSamples != *((_DWORD *)v4 + 7)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 8) != 0)
  {
LABEL_79:
    char v8 = 0;
    goto LABEL_80;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_candidateNumberOfSamples != *((_DWORD *)v4 + 8)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_candidateNumberOfDaysWithPositiveSamples != *((_DWORD *)v4 + 4)) {
      goto LABEL_79;
    }
  }
  else if (v6)
  {
    goto LABEL_79;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_candidateNumberOfModelWeights != *((_DWORD *)v4 + 5)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_candidateNumberOfNonZeroModelWeights != *((_DWORD *)v4 + 6)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_candidateShadowLaunchPercentage != *((float *)v4 + 10)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x200) == 0 || self->_candidateShadowShownPercentage != *((float *)v4 + 13)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x200) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_candidateShadowPrecision != *((float *)v4 + 11)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) == 0 || self->_candidateShadowRecall != *((float *)v4 + 12)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_candidateShadowF1 != *((float *)v4 + 9)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x800) == 0 || self->_candidateUILaunchPercentage != *((float *)v4 + 15)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x4000) == 0 || self->_candidateUIShownPercentage != *((float *)v4 + 18)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x4000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x1000) == 0 || self->_candidateUIPrecision != *((float *)v4 + 16)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x2000) == 0 || self->_candidateUIRecall != *((float *)v4 + 17)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x2000) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x400) == 0 || self->_candidateUIF1 != *((float *)v4 + 14)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  candidateIdentifier = self->_candidateIdentifier;
  if ((unint64_t)candidateIdentifier | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](candidateIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_80:

  return v8;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v61 = 2654435761 * self->_candidateNumberOfPositiveSamples;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v60 = 2654435761 * self->_candidateNumberOfSamples;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v60 = 0;
  if (has)
  {
LABEL_4:
    uint64_t v59 = 2654435761 * self->_candidateNumberOfDaysWithPositiveSamples;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v59 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    uint64_t v58 = 2654435761 * self->_candidateNumberOfModelWeights;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v57 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v58 = 0;
  if ((has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v57 = 2654435761 * self->_candidateNumberOfNonZeroModelWeights;
  if ((has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  float candidateShadowLaunchPercentage = self->_candidateShadowLaunchPercentage;
  float v5 = -candidateShadowLaunchPercentage;
  if (candidateShadowLaunchPercentage >= 0.0) {
    float v5 = self->_candidateShadowLaunchPercentage;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_19:
  if ((has & 0x200) != 0)
  {
    float candidateShadowShownPercentage = self->_candidateShadowShownPercentage;
    float v11 = -candidateShadowShownPercentage;
    if (candidateShadowShownPercentage >= 0.0) {
      float v11 = self->_candidateShadowShownPercentage;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v56 = v8;
  if ((has & 0x80) != 0)
  {
    float candidateShadowPrecision = self->_candidateShadowPrecision;
    float v16 = -candidateShadowPrecision;
    if (candidateShadowPrecision >= 0.0) {
      float v16 = self->_candidateShadowPrecision;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v55 = v9;
  if ((has & 0x100) != 0)
  {
    float candidateShadowRecall = self->_candidateShadowRecall;
    float v21 = -candidateShadowRecall;
    if (candidateShadowRecall >= 0.0) {
      float v21 = self->_candidateShadowRecall;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float candidateShadowF1 = self->_candidateShadowF1;
    float v26 = -candidateShadowF1;
    if (candidateShadowF1 >= 0.0) {
      float v26 = self->_candidateShadowF1;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x800) != 0)
  {
    float candidateUILaunchPercentage = self->_candidateUILaunchPercentage;
    float v31 = -candidateUILaunchPercentage;
    if (candidateUILaunchPercentage >= 0.0) {
      float v31 = self->_candidateUILaunchPercentage;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x4000) != 0)
  {
    float candidateUIShownPercentage = self->_candidateUIShownPercentage;
    float v36 = -candidateUIShownPercentage;
    if (candidateUIShownPercentage >= 0.0) {
      float v36 = self->_candidateUIShownPercentage;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    float candidateUIPrecision = self->_candidateUIPrecision;
    float v41 = -candidateUIPrecision;
    if (candidateUIPrecision >= 0.0) {
      float v41 = self->_candidateUIPrecision;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((has & 0x2000) != 0)
  {
    float candidateUIRecall = self->_candidateUIRecall;
    float v46 = -candidateUIRecall;
    if (candidateUIRecall >= 0.0) {
      float v46 = self->_candidateUIRecall;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  if ((has & 0x400) != 0)
  {
    float candidateUIF1 = self->_candidateUIF1;
    float v51 = -candidateUIF1;
    if (candidateUIF1 >= 0.0) {
      float v51 = self->_candidateUIF1;
    }
    float v52 = floorf(v51 + 0.5);
    float v53 = (float)(v51 - v52) * 1.8447e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  return v60 ^ v61 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v14 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v49 ^ [(NSString *)self->_candidateIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) != 0)
  {
    self->_candidateNumberOfPositiveSamples = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 38);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_candidateNumberOfSamples = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_candidateNumberOfDaysWithPositiveSamples = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_candidateNumberOfModelWeights = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_candidateNumberOfNonZeroModelWeights = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_float candidateShadowLaunchPercentage = *((float *)v4 + 10);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_float candidateShadowShownPercentage = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_float candidateShadowPrecision = *((float *)v4 + 11);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_float candidateShadowRecall = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_float candidateShadowF1 = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_float candidateUILaunchPercentage = *((float *)v4 + 15);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_float candidateUIShownPercentage = *((float *)v4 + 18);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x1000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_float candidateUIPrecision = *((float *)v4 + 16);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_35:
  self->_float candidateUIRecall = *((float *)v4 + 17);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 38) & 0x400) != 0)
  {
LABEL_16:
    self->_float candidateUIF1 = *((float *)v4 + 14);
    *(_WORD *)&self->_has |= 0x400u;
  }
LABEL_17:
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[ATXCandidateRelevanceModelPBCandidateMetrics setCandidateIdentifier:](self, "setCandidateIdentifier:");
    id v4 = v6;
  }
}

- (unsigned)candidateNumberOfPositiveSamples
{
  return self->_candidateNumberOfPositiveSamples;
}

- (unsigned)candidateNumberOfSamples
{
  return self->_candidateNumberOfSamples;
}

- (unsigned)candidateNumberOfDaysWithPositiveSamples
{
  return self->_candidateNumberOfDaysWithPositiveSamples;
}

- (unsigned)candidateNumberOfModelWeights
{
  return self->_candidateNumberOfModelWeights;
}

- (unsigned)candidateNumberOfNonZeroModelWeights
{
  return self->_candidateNumberOfNonZeroModelWeights;
}

- (float)candidateShadowLaunchPercentage
{
  return self->_candidateShadowLaunchPercentage;
}

- (float)candidateShadowShownPercentage
{
  return self->_candidateShadowShownPercentage;
}

- (float)candidateShadowPrecision
{
  return self->_candidateShadowPrecision;
}

- (float)candidateShadowRecall
{
  return self->_candidateShadowRecall;
}

- (float)candidateShadowF1
{
  return self->_candidateShadowF1;
}

- (float)candidateUILaunchPercentage
{
  return self->_candidateUILaunchPercentage;
}

- (float)candidateUIShownPercentage
{
  return self->_candidateUIShownPercentage;
}

- (float)candidateUIPrecision
{
  return self->_candidateUIPrecision;
}

- (float)candidateUIRecall
{
  return self->_candidateUIRecall;
}

- (float)candidateUIF1
{
  return self->_candidateUIF1;
}

- (NSString)candidateIdentifier
{
  return self->_candidateIdentifier;
}

- (void)setCandidateIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end