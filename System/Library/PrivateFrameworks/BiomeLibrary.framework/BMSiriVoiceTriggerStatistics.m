@interface BMSiriVoiceTriggerStatistics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16;
- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16 keywordThresholdHS:(id)a17 keywordThresholdJS:(id)a18 tdSpeakerRecognizerCombinedThresholdHS:(id)a19 tdSpeakerRecognizerCombinedThresholdJS:(id)a20;
- (BMSiriVoiceTriggerStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasFirstPassPeakScoreHS;
- (BOOL)hasFirstPassPeakScoreJS;
- (BOOL)hasFirstPassTriggerSource;
- (BOOL)hasHwSampleRate;
- (BOOL)hasInvocationTypeID;
- (BOOL)hasKeywordThresholdHS;
- (BOOL)hasKeywordThresholdJS;
- (BOOL)hasMitigationScore;
- (BOOL)hasRecognizerScoreHS;
- (BOOL)hasRecognizerScoreJS;
- (BOOL)hasRepetitionSimilarityScore;
- (BOOL)hasTdSpeakerRecognizerCombinedScore;
- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS;
- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS;
- (BOOL)hasTriggerScoreHS;
- (BOOL)hasTriggerScoreJS;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)configVersion;
- (NSString)description;
- (double)firstPassPeakScoreHS;
- (double)firstPassPeakScoreJS;
- (double)hwSampleRate;
- (double)keywordThresholdHS;
- (double)keywordThresholdJS;
- (double)mitigationScore;
- (double)recognizerScoreHS;
- (double)recognizerScoreJS;
- (double)repetitionSimilarityScore;
- (double)tdSpeakerRecognizerCombinedScore;
- (double)tdSpeakerRecognizerCombinedThresholdHS;
- (double)tdSpeakerRecognizerCombinedThresholdJS;
- (double)triggerScoreHS;
- (double)triggerScoreJS;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)firstPassTriggerSource;
- (int)invocationTypeID;
- (unsigned)dataVersion;
- (void)setHasFirstPassPeakScoreHS:(BOOL)a3;
- (void)setHasFirstPassPeakScoreJS:(BOOL)a3;
- (void)setHasFirstPassTriggerSource:(BOOL)a3;
- (void)setHasHwSampleRate:(BOOL)a3;
- (void)setHasInvocationTypeID:(BOOL)a3;
- (void)setHasKeywordThresholdHS:(BOOL)a3;
- (void)setHasKeywordThresholdJS:(BOOL)a3;
- (void)setHasMitigationScore:(BOOL)a3;
- (void)setHasRecognizerScoreHS:(BOOL)a3;
- (void)setHasRecognizerScoreJS:(BOOL)a3;
- (void)setHasRepetitionSimilarityScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3;
- (void)setHasTriggerScoreHS:(BOOL)a3;
- (void)setHasTriggerScoreJS:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriVoiceTriggerStatistics

- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16
{
  return -[BMSiriVoiceTriggerStatistics initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:](self, "initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           0,
           0,
           0,
           0);
}

- (void).cxx_destruct
{
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedThresholdJS = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS
{
  return self->_hasTdSpeakerRecognizerCombinedThresholdJS;
}

- (double)tdSpeakerRecognizerCombinedThresholdJS
{
  return self->_tdSpeakerRecognizerCombinedThresholdJS;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedThresholdHS = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS
{
  return self->_hasTdSpeakerRecognizerCombinedThresholdHS;
}

- (double)tdSpeakerRecognizerCombinedThresholdHS
{
  return self->_tdSpeakerRecognizerCombinedThresholdHS;
}

- (void)setHasKeywordThresholdJS:(BOOL)a3
{
  self->_hasKeywordThresholdJS = a3;
}

- (BOOL)hasKeywordThresholdJS
{
  return self->_hasKeywordThresholdJS;
}

- (double)keywordThresholdJS
{
  return self->_keywordThresholdJS;
}

- (void)setHasKeywordThresholdHS:(BOOL)a3
{
  self->_hasKeywordThresholdHS = a3;
}

- (BOOL)hasKeywordThresholdHS
{
  return self->_hasKeywordThresholdHS;
}

- (double)keywordThresholdHS
{
  return self->_keywordThresholdHS;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setHasHwSampleRate:(BOOL)a3
{
  self->_hasHwSampleRate = a3;
}

- (BOOL)hasHwSampleRate
{
  return self->_hasHwSampleRate;
}

- (double)hwSampleRate
{
  return self->_hwSampleRate;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  self->_hasTdSpeakerRecognizerCombinedScore = a3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return self->_hasTdSpeakerRecognizerCombinedScore;
}

- (double)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  self->_hasRepetitionSimilarityScore = a3;
}

- (BOOL)hasRepetitionSimilarityScore
{
  return self->_hasRepetitionSimilarityScore;
}

- (double)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (void)setHasInvocationTypeID:(BOOL)a3
{
  self->_hasInvocationTypeID = a3;
}

- (BOOL)hasInvocationTypeID
{
  return self->_hasInvocationTypeID;
}

- (int)invocationTypeID
{
  return self->_invocationTypeID;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  self->_hasMitigationScore = a3;
}

- (BOOL)hasMitigationScore
{
  return self->_hasMitigationScore;
}

- (double)mitigationScore
{
  return self->_mitigationScore;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  self->_hasTriggerScoreJS = a3;
}

- (BOOL)hasTriggerScoreJS
{
  return self->_hasTriggerScoreJS;
}

- (double)triggerScoreJS
{
  return self->_triggerScoreJS;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  self->_hasTriggerScoreHS = a3;
}

- (BOOL)hasTriggerScoreHS
{
  return self->_hasTriggerScoreHS;
}

- (double)triggerScoreHS
{
  return self->_triggerScoreHS;
}

- (void)setHasRecognizerScoreJS:(BOOL)a3
{
  self->_hasRecognizerScoreJS = a3;
}

- (BOOL)hasRecognizerScoreJS
{
  return self->_hasRecognizerScoreJS;
}

- (double)recognizerScoreJS
{
  return self->_recognizerScoreJS;
}

- (void)setHasRecognizerScoreHS:(BOOL)a3
{
  self->_hasRecognizerScoreHS = a3;
}

- (BOOL)hasRecognizerScoreHS
{
  return self->_hasRecognizerScoreHS;
}

- (double)recognizerScoreHS
{
  return self->_recognizerScoreHS;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  self->_hasFirstPassTriggerSource = a3;
}

- (BOOL)hasFirstPassTriggerSource
{
  return self->_hasFirstPassTriggerSource;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  self->_hasFirstPassPeakScoreJS = a3;
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return self->_hasFirstPassPeakScoreJS;
}

- (double)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  self->_hasFirstPassPeakScoreHS = a3;
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return self->_hasFirstPassPeakScoreHS;
}

- (double)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriVoiceTriggerStatistics *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriVoiceTriggerStatistics *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreHS]
      || [v5 hasFirstPassPeakScoreHS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreHS]) {
        goto LABEL_91;
      }
      if (![v5 hasFirstPassPeakScoreHS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreHS];
      double v14 = v13;
      [v5 firstPassPeakScoreHS];
      if (v14 != v15) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreJS]
      || [v5 hasFirstPassPeakScoreJS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreJS]) {
        goto LABEL_91;
      }
      if (![v5 hasFirstPassPeakScoreJS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreJS];
      double v17 = v16;
      [v5 firstPassPeakScoreJS];
      if (v17 != v18) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasFirstPassTriggerSource]
      || [v5 hasFirstPassTriggerSource])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasFirstPassTriggerSource]) {
        goto LABEL_91;
      }
      if (![v5 hasFirstPassTriggerSource]) {
        goto LABEL_91;
      }
      int v19 = [(BMSiriVoiceTriggerStatistics *)self firstPassTriggerSource];
      if (v19 != [v5 firstPassTriggerSource]) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreHS]
      || [v5 hasRecognizerScoreHS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreHS]) {
        goto LABEL_91;
      }
      if (![v5 hasRecognizerScoreHS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self recognizerScoreHS];
      double v21 = v20;
      [v5 recognizerScoreHS];
      if (v21 != v22) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreJS]
      || [v5 hasRecognizerScoreJS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreJS]) {
        goto LABEL_91;
      }
      if (![v5 hasRecognizerScoreJS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self recognizerScoreJS];
      double v24 = v23;
      [v5 recognizerScoreJS];
      if (v24 != v25) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreHS]
      || [v5 hasTriggerScoreHS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreHS]) {
        goto LABEL_91;
      }
      if (![v5 hasTriggerScoreHS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self triggerScoreHS];
      double v27 = v26;
      [v5 triggerScoreHS];
      if (v27 != v28) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreJS]
      || [v5 hasTriggerScoreJS])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreJS]) {
        goto LABEL_91;
      }
      if (![v5 hasTriggerScoreJS]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self triggerScoreJS];
      double v30 = v29;
      [v5 triggerScoreJS];
      if (v30 != v31) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasMitigationScore]
      || [v5 hasMitigationScore])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasMitigationScore]) {
        goto LABEL_91;
      }
      if (![v5 hasMitigationScore]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self mitigationScore];
      double v33 = v32;
      [v5 mitigationScore];
      if (v33 != v34) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasInvocationTypeID]
      || [v5 hasInvocationTypeID])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasInvocationTypeID]) {
        goto LABEL_91;
      }
      if (![v5 hasInvocationTypeID]) {
        goto LABEL_91;
      }
      int v35 = [(BMSiriVoiceTriggerStatistics *)self invocationTypeID];
      if (v35 != [v5 invocationTypeID]) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasRepetitionSimilarityScore]
      || [v5 hasRepetitionSimilarityScore])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasRepetitionSimilarityScore]) {
        goto LABEL_91;
      }
      if (![v5 hasRepetitionSimilarityScore]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self repetitionSimilarityScore];
      double v37 = v36;
      [v5 repetitionSimilarityScore];
      if (v37 != v38) {
        goto LABEL_91;
      }
    }
    if (-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedScore](self, "hasTdSpeakerRecognizerCombinedScore")|| [v5 hasTdSpeakerRecognizerCombinedScore])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasTdSpeakerRecognizerCombinedScore])goto LABEL_91; {
      if (![v5 hasTdSpeakerRecognizerCombinedScore])
      }
        goto LABEL_91;
      [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedScore];
      double v40 = v39;
      [v5 tdSpeakerRecognizerCombinedScore];
      if (v40 != v41) {
        goto LABEL_91;
      }
    }
    if ([(BMSiriVoiceTriggerStatistics *)self hasHwSampleRate]
      || [v5 hasHwSampleRate])
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasHwSampleRate]) {
        goto LABEL_91;
      }
      if (![v5 hasHwSampleRate]) {
        goto LABEL_91;
      }
      [(BMSiriVoiceTriggerStatistics *)self hwSampleRate];
      double v43 = v42;
      [v5 hwSampleRate];
      if (v43 != v44) {
        goto LABEL_91;
      }
    }
    v45 = [(BMSiriVoiceTriggerStatistics *)self configVersion];
    uint64_t v46 = [v5 configVersion];
    if (v45 == (void *)v46)
    {
    }
    else
    {
      v47 = (void *)v46;
      v48 = [(BMSiriVoiceTriggerStatistics *)self configVersion];
      v49 = [v5 configVersion];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_91;
      }
    }
    if (![(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdHS]
      && ![v5 hasKeywordThresholdHS]
      || [(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdHS]
      && [v5 hasKeywordThresholdHS]
      && ([(BMSiriVoiceTriggerStatistics *)self keywordThresholdHS],
          double v52 = v51,
          [v5 keywordThresholdHS],
          v52 == v53))
    {
      if (![(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdJS]
        && ![v5 hasKeywordThresholdJS]
        || [(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdJS]
        && [v5 hasKeywordThresholdJS]
        && ([(BMSiriVoiceTriggerStatistics *)self keywordThresholdJS],
            double v55 = v54,
            [v5 keywordThresholdJS],
            v55 == v56))
      {
        if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdHS](self, "hasTdSpeakerRecognizerCombinedThresholdHS")&& ![v5 hasTdSpeakerRecognizerCombinedThresholdHS]|| -[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdHS](self, "hasTdSpeakerRecognizerCombinedThresholdHS")&& objc_msgSend(v5, "hasTdSpeakerRecognizerCombinedThresholdHS")&& (-[BMSiriVoiceTriggerStatistics tdSpeakerRecognizerCombinedThresholdHS](self, "tdSpeakerRecognizerCombinedThresholdHS"), double v58 = v57, objc_msgSend(v5, "tdSpeakerRecognizerCombinedThresholdHS"), v58 == v59))
        {
          if (!-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdJS](self, "hasTdSpeakerRecognizerCombinedThresholdJS")&& ![v5 hasTdSpeakerRecognizerCombinedThresholdJS])
          {
            BOOL v12 = 1;
            goto LABEL_92;
          }
          if (-[BMSiriVoiceTriggerStatistics hasTdSpeakerRecognizerCombinedThresholdJS](self, "hasTdSpeakerRecognizerCombinedThresholdJS")&& [v5 hasTdSpeakerRecognizerCombinedThresholdJS])
          {
            [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdJS];
            double v61 = v60;
            [v5 tdSpeakerRecognizerCombinedThresholdJS];
            BOOL v12 = v61 == v62;
LABEL_92:

            goto LABEL_93;
          }
        }
      }
    }
LABEL_91:
    BOOL v12 = 0;
    goto LABEL_92;
  }
  BOOL v12 = 0;
LABEL_93:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v92[18] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriVoiceTriggerStatistics *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMSiriVoiceTriggerStatistics *)self absoluteTimestamp];
    [v5 timeIntervalSince1970];
    objc_msgSend(v4, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  if (![(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreHS]
    || ([(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreHS], fabs(v7) == INFINITY))
  {
    id v9 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreHS];
    v8 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreHS];
    objc_msgSend(v8, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasFirstPassPeakScoreJS]
    || ([(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreJS], fabs(v10) == INFINITY))
  {
    id v12 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreJS];
    int v11 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreJS];
    objc_msgSend(v11, "numberWithDouble:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriVoiceTriggerStatistics *)self hasFirstPassTriggerSource])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriVoiceTriggerStatistics firstPassTriggerSource](self, "firstPassTriggerSource"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreHS]
    || ([(BMSiriVoiceTriggerStatistics *)self recognizerScoreHS], fabs(v14) == INFINITY))
  {
    id v16 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self recognizerScoreHS];
    double v15 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self recognizerScoreHS];
    objc_msgSend(v15, "numberWithDouble:");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasRecognizerScoreJS]
    || ([(BMSiriVoiceTriggerStatistics *)self recognizerScoreJS], fabs(v17) == INFINITY))
  {
    id v19 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self recognizerScoreJS];
    double v18 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self recognizerScoreJS];
    objc_msgSend(v18, "numberWithDouble:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreHS]
    || ([(BMSiriVoiceTriggerStatistics *)self triggerScoreHS], fabs(v20) == INFINITY))
  {
    id v22 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self triggerScoreHS];
    double v21 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self triggerScoreHS];
    objc_msgSend(v21, "numberWithDouble:");
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasTriggerScoreJS]
    || ([(BMSiriVoiceTriggerStatistics *)self triggerScoreJS], fabs(v23) == INFINITY))
  {
    id v90 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self triggerScoreJS];
    double v24 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self triggerScoreJS];
    objc_msgSend(v24, "numberWithDouble:");
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasMitigationScore]
    || ([(BMSiriVoiceTriggerStatistics *)self mitigationScore], fabs(v25) == INFINITY))
  {
    id v89 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self mitigationScore];
    double v26 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self mitigationScore];
    objc_msgSend(v26, "numberWithDouble:");
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMSiriVoiceTriggerStatistics *)self hasInvocationTypeID])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriVoiceTriggerStatistics invocationTypeID](self, "invocationTypeID"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasRepetitionSimilarityScore]
    || ([(BMSiriVoiceTriggerStatistics *)self repetitionSimilarityScore],
        fabs(v27) == INFINITY))
  {
    id v87 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self repetitionSimilarityScore];
    double v28 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self repetitionSimilarityScore];
    objc_msgSend(v28, "numberWithDouble:");
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasTdSpeakerRecognizerCombinedScore]
    || ([(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedScore],
        fabs(v29) == INFINITY))
  {
    id v86 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedScore];
    double v30 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedScore];
    objc_msgSend(v30, "numberWithDouble:");
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasHwSampleRate]
    || ([(BMSiriVoiceTriggerStatistics *)self hwSampleRate], fabs(v31) == INFINITY))
  {
    id v85 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self hwSampleRate];
    double v32 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self hwSampleRate];
    objc_msgSend(v32, "numberWithDouble:");
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  v84 = [(BMSiriVoiceTriggerStatistics *)self configVersion];
  if (![(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdHS]
    || ([(BMSiriVoiceTriggerStatistics *)self keywordThresholdHS], fabs(v33) == INFINITY))
  {
    id v83 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self keywordThresholdHS];
    double v34 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self keywordThresholdHS];
    objc_msgSend(v34, "numberWithDouble:");
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasKeywordThresholdJS]
    || ([(BMSiriVoiceTriggerStatistics *)self keywordThresholdJS], fabs(v35) == INFINITY))
  {
    id v82 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self keywordThresholdJS];
    double v36 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self keywordThresholdJS];
    objc_msgSend(v36, "numberWithDouble:");
    id v82 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasTdSpeakerRecognizerCombinedThresholdHS]|| ([(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdHS], fabs(v37) == INFINITY))
  {
    id v81 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdHS];
    double v38 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdHS];
    objc_msgSend(v38, "numberWithDouble:");
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMSiriVoiceTriggerStatistics *)self hasTdSpeakerRecognizerCombinedThresholdJS]|| ([(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdJS], fabs(v39) == INFINITY))
  {
    id v41 = 0;
  }
  else
  {
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdJS];
    double v40 = NSNumber;
    [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdJS];
    objc_msgSend(v40, "numberWithDouble:");
    id v41 = (id)objc_claimAutoreleasedReturnValue();
  }
  v91[0] = @"absoluteTimestamp";
  uint64_t v42 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v42;
  v92[0] = v42;
  v91[1] = @"firstPassPeakScoreHS";
  uint64_t v43 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v73 = (void *)v43;
  v92[1] = v43;
  v91[2] = @"firstPassPeakScoreJS";
  uint64_t v44 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)v44;
  v92[2] = v44;
  v91[3] = @"firstPassTriggerSource";
  uint64_t v45 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v45;
  v92[3] = v45;
  v91[4] = @"recognizerScoreHS";
  uint64_t v46 = (uint64_t)v16;
  if (!v16)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v46;
  v92[4] = v46;
  v91[5] = @"recognizerScoreJS";
  uint64_t v47 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v47;
  v92[5] = v47;
  v91[6] = @"triggerScoreHS";
  uint64_t v48 = (uint64_t)v22;
  if (!v22)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v48;
  v92[6] = v48;
  v91[7] = @"triggerScoreJS";
  uint64_t v49 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = v9;
  v92[7] = v49;
  v91[8] = @"mitigationScore";
  uint64_t v50 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = v19;
  v92[8] = v50;
  v91[9] = @"invocationTypeID";
  uint64_t v51 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = v22;
  v92[9] = v51;
  v91[10] = @"repetitionSimilarityScore";
  uint64_t v52 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v80 = v6;
  uint64_t v63 = v52;
  v92[10] = v52;
  v91[11] = @"tdSpeakerRecognizerCombinedScore";
  double v53 = v86;
  if (!v86)
  {
    double v53 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v52);
  }
  v78 = v13;
  v92[11] = v53;
  v91[12] = @"hwSampleRate";
  double v54 = v85;
  if (!v85)
  {
    double v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v51;
  v67 = (void *)v49;
  v92[12] = v54;
  v91[13] = @"configVersion";
  double v55 = v84;
  if (!v84)
  {
    double v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = (void *)v50;
  double v56 = v12;
  v92[13] = v55;
  v91[14] = @"keywordThresholdHS";
  double v57 = v83;
  if (!v83)
  {
    double v57 = [MEMORY[0x1E4F1CA98] null];
  }
  double v58 = v16;
  v92[14] = v57;
  v91[15] = @"keywordThresholdJS";
  double v59 = v82;
  if (!v82)
  {
    double v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v92[15] = v59;
  v91[16] = @"tdSpeakerRecognizerCombinedThresholdHS";
  double v60 = v81;
  if (!v81)
  {
    double v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v92[16] = v60;
  v91[17] = @"tdSpeakerRecognizerCombinedThresholdJS";
  double v61 = v41;
  if (!v41)
  {
    double v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v92[17] = v61;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v92, v91, 18, v63);
  id v75 = (id)objc_claimAutoreleasedReturnValue();
  if (!v41) {

  }
  if (!v81) {
  if (!v82)
  }

  if (!v83) {
  if (!v84)
  }

  if (!v85) {
  if (!v86)
  }

  if (!v87) {
  if (!v88)
  }

  if (!v89) {
  if (v90)
  }
  {
    if (v76) {
      goto LABEL_124;
    }
  }
  else
  {

    if (v76)
    {
LABEL_124:
      if (v77) {
        goto LABEL_125;
      }
      goto LABEL_135;
    }
  }

  if (v77)
  {
LABEL_125:
    if (v58) {
      goto LABEL_126;
    }
    goto LABEL_136;
  }
LABEL_135:

  if (v58)
  {
LABEL_126:
    if (v78) {
      goto LABEL_127;
    }
    goto LABEL_137;
  }
LABEL_136:

  if (v78)
  {
LABEL_127:
    if (v56) {
      goto LABEL_128;
    }
    goto LABEL_138;
  }
LABEL_137:

  if (v56)
  {
LABEL_128:
    if (v79) {
      goto LABEL_129;
    }
LABEL_139:

    if (v80) {
      goto LABEL_130;
    }
    goto LABEL_140;
  }
LABEL_138:

  if (!v79) {
    goto LABEL_139;
  }
LABEL_129:
  if (v80) {
    goto LABEL_130;
  }
LABEL_140:

LABEL_130:

  return v75;
}

- (BMSiriVoiceTriggerStatistics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v218[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v182 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v182 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v8 = v182;
    id v9 = [v7 alloc];
    [v8 doubleValue];
    double v11 = v10;

    id v12 = (id)[v9 initWithTimeIntervalSince1970:v11];
LABEL_6:
    id v6 = v12;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v6 = 0;
        uint64_t v47 = 0;
        goto LABEL_144;
      }
      id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v94 = *MEMORY[0x1E4F502C8];
      uint64_t v217 = *MEMORY[0x1E4F28568];
      id v180 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
      v218[0] = v180;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v218 forKeys:&v217 count:1];
      id v95 = (id)[v93 initWithDomain:v94 code:2 userInfo:v14];
      id v6 = 0;
      uint64_t v47 = 0;
      *a4 = v95;
      goto LABEL_143;
    }
    id v12 = v182;
    goto LABEL_6;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  id v6 = [v13 dateFromString:v182];

LABEL_9:
  double v14 = [v5 objectForKeyedSubscript:@"firstPassPeakScoreHS"];
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v180 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v180 = v14;
LABEL_12:
    double v15 = [v5 objectForKeyedSubscript:@"firstPassPeakScoreJS"];
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v179 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v179 = v15;
LABEL_15:
      id v16 = [v5 objectForKeyedSubscript:@"firstPassTriggerSource"];
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v176 = v16;
        id v17 = 0;
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v176 = v16;
        id v17 = v16;
LABEL_18:
        double v18 = [v5 objectForKeyedSubscript:@"recognizerScoreHS"];
        id v178 = v17;
        if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v19 = 0;
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
LABEL_21:
          double v20 = [v5 objectForKeyedSubscript:@"recognizerScoreJS"];
          if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v171 = v20;
            id v175 = 0;
            goto LABEL_24;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v171 = v20;
            id v175 = v20;
LABEL_24:
            uint64_t v21 = [v5 objectForKeyedSubscript:@"triggerScoreHS"];
            v173 = (void *)v21;
            if (!v21 || (id v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v174 = 0;
              goto LABEL_27;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v174 = v22;
LABEL_27:
              uint64_t v23 = [v5 objectForKeyedSubscript:@"triggerScoreJS"];
              v170 = (void *)v23;
              if (!v23 || (double v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v172 = 0;
                goto LABEL_30;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v172 = v24;
LABEL_30:
                uint64_t v25 = [v5 objectForKeyedSubscript:@"mitigationScore"];
                v168 = (void *)v25;
                if (!v25 || (double v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v169 = 0;
                  goto LABEL_33;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v169 = v26;
LABEL_33:
                  uint64_t v27 = [v5 objectForKeyedSubscript:@"invocationTypeID"];
                  v164 = (void *)v27;
                  if (!v27 || (double v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v165 = 0;
                    goto LABEL_36;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v165 = v28;
LABEL_36:
                    uint64_t v29 = [v5 objectForKeyedSubscript:@"repetitionSimilarityScore"];
                    v159 = (void *)v29;
                    if (!v29 || (double v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v160 = 0;
                      goto LABEL_39;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v160 = v30;
LABEL_39:
                      uint64_t v31 = [v5 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];
                      v157 = (void *)v31;
                      if (!v31 || (double v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v158 = 0;
                        goto LABEL_42;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v158 = v32;
LABEL_42:
                        uint64_t v33 = [v5 objectForKeyedSubscript:@"hwSampleRate"];
                        v155 = (void *)v33;
                        if (!v33 || (double v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v156 = 0;
                          goto LABEL_45;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v156 = v34;
LABEL_45:
                          uint64_t v35 = [v5 objectForKeyedSubscript:@"configVersion"];
                          v152 = (void *)v35;
                          if (!v35 || (double v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v153 = 0;
                            goto LABEL_48;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v153 = v36;
LABEL_48:
                            uint64_t v37 = [v5 objectForKeyedSubscript:@"keywordThresholdHS"];
                            v166 = v18;
                            v149 = (void *)v37;
                            if (!v37 || (double v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v151 = 0;
                              goto LABEL_51;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v151 = v38;
LABEL_51:
                              uint64_t v39 = [v5 objectForKeyedSubscript:@"keywordThresholdJS"];
                              v148 = (void *)v39;
                              if (!v39 || (double v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v150 = 0;
                                goto LABEL_54;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v150 = v40;
LABEL_54:
                                id v41 = [v5 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdHS"];
                                id v161 = v41;
                                if (v41)
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    uint64_t v42 = v6;
                                    id v41 = 0;
                                  }
                                  else
                                  {
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                    {
                                      if (!a4)
                                      {
                                        id v41 = 0;
                                        uint64_t v47 = 0;
                                        uint64_t v63 = v171;
                                        goto LABEL_127;
                                      }
                                      uint64_t v42 = v6;
                                      id v140 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v141 = *MEMORY[0x1E4F502C8];
                                      uint64_t v185 = *MEMORY[0x1E4F28568];
                                      id v115 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tdSpeakerRecognizerCombinedThresholdHS"];
                                      id v186 = v115;
                                      v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v186 forKeys:&v185 count:1];
                                      id v142 = (id)[v140 initWithDomain:v141 code:2 userInfo:v114];
                                      uint64_t v47 = 0;
                                      id v41 = 0;
                                      *a4 = v142;
                                      goto LABEL_126;
                                    }
                                    uint64_t v42 = v6;
                                    id v41 = v41;
                                  }
                                }
                                else
                                {
                                  uint64_t v42 = v6;
                                }
                                v114 = [v5 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdJS"];
                                if (v114 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (a4)
                                    {
                                      id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v146 = *MEMORY[0x1E4F502C8];
                                      uint64_t v183 = *MEMORY[0x1E4F28568];
                                      v143 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tdSpeakerRecognizerCombinedThresholdJS"];
                                      v184 = v143;
                                      v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
                                      *a4 = (id)[v147 initWithDomain:v146 code:2 userInfo:v144];
                                    }
                                    id v115 = 0;
                                    uint64_t v47 = 0;
                                    goto LABEL_126;
                                  }
                                  id v115 = v114;
                                }
                                else
                                {
                                  id v115 = 0;
                                }
                                uint64_t v47 = objc_retain(-[BMSiriVoiceTriggerStatistics initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:](self, "initWithAbsoluteTimestamp:firstPassPeakScoreHS:firstPassPeakScoreJS:firstPassTriggerSource:recognizerScoreHS:recognizerScoreJS:triggerScoreHS:triggerScoreJS:mitigationScore:invocationTypeID:repetitionSimilarityScore:tdSpeakerRecognizerCombinedScore:hwSampleRate:configVersion:keywordThresholdHS:keywordThresholdJS:tdSpeakerRecognizerCombinedThresholdHS:tdSpeakerRecognizerCombinedThresholdJS:", v42, v180, v179, v178, v19, v175, v174, v172, v169, v165, v160, v158,
                                          v156,
                                          v153,
                                          v151,
                                          v150,
                                          v41,
                                          v115));
                                self = v47;
LABEL_126:
                                uint64_t v63 = v171;

                                id v6 = v42;
                                double v18 = v166;
LABEL_127:
                                v116 = v161;
LABEL_128:

                                id v16 = v176;
LABEL_129:

LABEL_130:
LABEL_131:

LABEL_132:
LABEL_133:

LABEL_134:
LABEL_135:

LABEL_136:
LABEL_137:

                                goto LABEL_138;
                              }
                              if (a4)
                              {
                                id v163 = v19;
                                v132 = v14;
                                v133 = v15;
                                v134 = v6;
                                id v135 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v136 = *MEMORY[0x1E4F502C8];
                                uint64_t v187 = *MEMORY[0x1E4F28568];
                                uint64_t v137 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"keywordThresholdJS"];
                                uint64_t v188 = v137;
                                v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
                                v138 = v135;
                                id v6 = v134;
                                id v41 = (id)v137;
                                double v15 = v133;
                                double v14 = v132;
                                id v19 = v163;
                                id v139 = (id)[v138 initWithDomain:v136 code:2 userInfo:v116];
                                uint64_t v47 = 0;
                                id v150 = 0;
                                *a4 = v139;
                                uint64_t v63 = v171;
                                goto LABEL_128;
                              }
                              id v150 = 0;
                              uint64_t v47 = 0;
LABEL_178:
                              id v16 = v176;
                              uint64_t v63 = v171;
                              goto LABEL_129;
                            }
                            if (a4)
                            {
                              v126 = v6;
                              id v127 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v128 = *MEMORY[0x1E4F502C8];
                              uint64_t v189 = *MEMORY[0x1E4F28568];
                              id v150 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"keywordThresholdHS"];
                              id v190 = v150;
                              uint64_t v129 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v190 forKeys:&v189 count:1];
                              v130 = v127;
                              id v6 = v126;
                              v148 = (void *)v129;
                              id v131 = (id)objc_msgSend(v130, "initWithDomain:code:userInfo:", v128, 2);
                              uint64_t v47 = 0;
                              id v151 = 0;
                              *a4 = v131;
                              goto LABEL_178;
                            }
                            id v151 = 0;
                            uint64_t v47 = 0;
                            id v16 = v176;
LABEL_176:
                            uint64_t v63 = v171;
                            goto LABEL_130;
                          }
                          if (a4)
                          {
                            id v154 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v124 = *MEMORY[0x1E4F502C8];
                            uint64_t v191 = *MEMORY[0x1E4F28568];
                            id v151 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"configVersion"];
                            id v192 = v151;
                            v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v192 forKeys:&v191 count:1];
                            id v125 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v124, 2);
                            uint64_t v47 = 0;
                            id v153 = 0;
                            *a4 = v125;
                            id v16 = v176;
                            goto LABEL_176;
                          }
                          id v153 = 0;
                          uint64_t v47 = 0;
                          id v16 = v176;
LABEL_174:
                          uint64_t v63 = v171;
                          goto LABEL_131;
                        }
                        if (a4)
                        {
                          v118 = v6;
                          id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v120 = *MEMORY[0x1E4F502C8];
                          uint64_t v193 = *MEMORY[0x1E4F28568];
                          id v153 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"hwSampleRate"];
                          id v194 = v153;
                          uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v194 forKeys:&v193 count:1];
                          v122 = v119;
                          id v6 = v118;
                          v152 = (void *)v121;
                          id v123 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v120, 2);
                          uint64_t v47 = 0;
                          id v156 = 0;
                          *a4 = v123;
                          id v16 = v176;
                          goto LABEL_174;
                        }
                        id v156 = 0;
                        uint64_t v47 = 0;
LABEL_172:
                        id v16 = v176;
                        uint64_t v63 = v171;
                        goto LABEL_132;
                      }
                      if (a4)
                      {
                        v108 = v6;
                        id v109 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v110 = *MEMORY[0x1E4F502C8];
                        uint64_t v195 = *MEMORY[0x1E4F28568];
                        id v156 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"tdSpeakerRecognizerCombinedScore"];
                        id v196 = v156;
                        uint64_t v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v196 forKeys:&v195 count:1];
                        v112 = v109;
                        id v6 = v108;
                        v155 = (void *)v111;
                        id v113 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v110, 2);
                        uint64_t v47 = 0;
                        id v158 = 0;
                        *a4 = v113;
                        goto LABEL_172;
                      }
                      id v158 = 0;
                      uint64_t v47 = 0;
LABEL_167:
                      id v16 = v176;
                      uint64_t v63 = v171;
                      goto LABEL_133;
                    }
                    if (a4)
                    {
                      v102 = v6;
                      id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v104 = *MEMORY[0x1E4F502C8];
                      uint64_t v197 = *MEMORY[0x1E4F28568];
                      id v158 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"repetitionSimilarityScore"];
                      id v198 = v158;
                      uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v197 count:1];
                      v106 = v103;
                      id v6 = v102;
                      v157 = (void *)v105;
                      id v107 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v104, 2);
                      uint64_t v47 = 0;
                      id v160 = 0;
                      *a4 = v107;
                      goto LABEL_167;
                    }
                    id v160 = 0;
                    uint64_t v47 = 0;
LABEL_163:
                    id v16 = v176;
                    uint64_t v63 = v171;
                    goto LABEL_134;
                  }
                  if (a4)
                  {
                    v96 = v6;
                    id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v98 = *MEMORY[0x1E4F502C8];
                    uint64_t v199 = *MEMORY[0x1E4F28568];
                    id v160 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"invocationTypeID"];
                    id v200 = v160;
                    uint64_t v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
                    v100 = v97;
                    id v6 = v96;
                    v159 = (void *)v99;
                    id v101 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v98, 2);
                    uint64_t v47 = 0;
                    id v165 = 0;
                    *a4 = v101;
                    goto LABEL_163;
                  }
                  id v165 = 0;
                  uint64_t v47 = 0;
LABEL_159:
                  id v16 = v176;
                  uint64_t v63 = v171;
                  goto LABEL_135;
                }
                if (a4)
                {
                  id v87 = v6;
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v89 = *MEMORY[0x1E4F502C8];
                  uint64_t v201 = *MEMORY[0x1E4F28568];
                  id v165 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mitigationScore"];
                  id v202 = v165;
                  uint64_t v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v202 forKeys:&v201 count:1];
                  v91 = v88;
                  id v6 = v87;
                  v164 = (void *)v90;
                  id v92 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v89, 2);
                  uint64_t v47 = 0;
                  id v169 = 0;
                  *a4 = v92;
                  goto LABEL_159;
                }
                id v169 = 0;
                uint64_t v47 = 0;
LABEL_154:
                id v16 = v176;
                uint64_t v63 = v171;
                goto LABEL_136;
              }
              if (a4)
              {
                id v81 = v6;
                id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v83 = *MEMORY[0x1E4F502C8];
                uint64_t v203 = *MEMORY[0x1E4F28568];
                id v169 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"triggerScoreJS"];
                id v204 = v169;
                uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
                id v85 = v82;
                id v6 = v81;
                v168 = (void *)v84;
                id v86 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v83, 2);
                uint64_t v47 = 0;
                id v172 = 0;
                *a4 = v86;
                goto LABEL_154;
              }
              id v172 = 0;
              uint64_t v47 = 0;
LABEL_148:
              id v16 = v176;
              uint64_t v63 = v171;
              goto LABEL_137;
            }
            if (a4)
            {
              id v75 = v6;
              id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v77 = *MEMORY[0x1E4F502C8];
              uint64_t v205 = *MEMORY[0x1E4F28568];
              id v172 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"triggerScoreHS"];
              id v206 = v172;
              uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v206 forKeys:&v205 count:1];
              v79 = v76;
              id v6 = v75;
              v170 = (void *)v78;
              id v80 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v77, 2);
              uint64_t v47 = 0;
              id v174 = 0;
              *a4 = v80;
              goto LABEL_148;
            }
            id v174 = 0;
            uint64_t v47 = 0;
            id v16 = v176;
            uint64_t v63 = v171;
LABEL_138:

            goto LABEL_139;
          }
          if (a4)
          {
            id v162 = v19;
            v66 = v6;
            id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v207 = *MEMORY[0x1E4F28568];
            v167 = v18;
            v69 = a4;
            id v70 = [NSString alloc];
            uint64_t v145 = objc_opt_class();
            v71 = v70;
            uint64_t v63 = v20;
            id v174 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v145, @"recognizerScoreJS"];
            id v208 = v174;
            uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
            v73 = v67;
            id v6 = v66;
            id v19 = v162;
            v173 = (void *)v72;
            id v74 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v68, 2);
            uint64_t v47 = 0;
            id v175 = 0;
            id *v69 = v74;
            double v18 = v167;
            id v16 = v176;
            goto LABEL_138;
          }
          id v175 = 0;
          uint64_t v47 = 0;
          id v16 = v176;
          uint64_t v63 = v20;
LABEL_139:

          goto LABEL_140;
        }
        if (a4)
        {
          double v59 = v6;
          id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v209 = *MEMORY[0x1E4F28568];
          double v62 = a4;
          id v175 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"recognizerScoreHS"];
          id v210 = v175;
          uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
          v64 = v60;
          id v6 = v59;
          id v65 = (id)[v64 initWithDomain:v61 code:2 userInfo:v63];
          uint64_t v47 = 0;
          *double v62 = v65;
          id v19 = 0;
          id v16 = v176;
          goto LABEL_139;
        }
        id v19 = 0;
        uint64_t v47 = 0;
        id v16 = v176;
LABEL_140:

        uint64_t v51 = v178;
        goto LABEL_141;
      }
      if (a4)
      {
        v177 = a4;
        id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
        double v56 = v6;
        uint64_t v57 = *MEMORY[0x1E4F502C8];
        uint64_t v211 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firstPassTriggerSource"];
        id v212 = v19;
        double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v212 forKeys:&v211 count:1];
        uint64_t v58 = v57;
        id v6 = v56;
        uint64_t v47 = 0;
        id v178 = 0;
        id *v177 = (id)[v55 initWithDomain:v58 code:2 userInfo:v18];
        goto LABEL_140;
      }
      uint64_t v51 = 0;
      uint64_t v47 = 0;
LABEL_141:

      goto LABEL_142;
    }
    if (a4)
    {
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v49 = v6;
      uint64_t v50 = *MEMORY[0x1E4F502C8];
      uint64_t v213 = *MEMORY[0x1E4F28568];
      uint64_t v51 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firstPassPeakScoreJS"];
      v214 = v51;
      uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
      double v53 = v48;
      id v16 = (void *)v52;
      uint64_t v54 = v50;
      id v6 = v49;
      uint64_t v47 = 0;
      id v179 = 0;
      *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v52];
      goto LABEL_141;
    }
    id v179 = 0;
    uint64_t v47 = 0;
LABEL_142:

    goto LABEL_143;
  }
  if (a4)
  {
    id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v44 = v6;
    uint64_t v45 = *MEMORY[0x1E4F502C8];
    uint64_t v215 = *MEMORY[0x1E4F28568];
    id v179 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firstPassPeakScoreHS"];
    id v216 = v179;
    double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
    uint64_t v46 = v45;
    id v6 = v44;
    uint64_t v47 = 0;
    id v180 = 0;
    *a4 = (id)[v43 initWithDomain:v46 code:2 userInfo:v15];
    goto LABEL_142;
  }
  id v180 = 0;
  uint64_t v47 = 0;
LABEL_143:

LABEL_144:
  return v47;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriVoiceTriggerStatistics *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasFirstPassPeakScoreHS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasFirstPassPeakScoreJS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasFirstPassTriggerSource)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRecognizerScoreHS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasRecognizerScoreJS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasTriggerScoreHS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasTriggerScoreJS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasMitigationScore)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasInvocationTypeID)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRepetitionSimilarityScore)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedScore)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasHwSampleRate)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_configVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasKeywordThresholdHS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasKeywordThresholdJS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedThresholdHS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasTdSpeakerRecognizerCombinedThresholdJS)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)BMSiriVoiceTriggerStatistics;
  id v5 = [(BMEventBase *)&v84 init];
  if (!v5) {
    goto LABEL_125;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          uint64_t v81 = 24;
          goto LABEL_121;
        case 2u:
          v5->_hasFirstPassPeakScoreHS = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)&v4[*v7])
          {
            float v25 = *(float *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v25 = 0.0;
          }
          double v22 = v25;
          uint64_t v81 = 64;
          goto LABEL_121;
        case 3u:
          v5->_hasFirstPassPeakScoreJS = 1;
          uint64_t v26 = *v6;
          unint64_t v27 = *(void *)&v4[v26];
          if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)&v4[*v7])
          {
            float v28 = *(float *)(*(void *)&v4[*v9] + v27);
            *(void *)&v4[v26] = v27 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v28 = 0.0;
          }
          double v22 = v28;
          uint64_t v81 = 72;
          goto LABEL_121;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasFirstPassTriggerSource = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v31) = 0;
          }
LABEL_85:
          uint64_t v80 = 52;
          goto LABEL_90;
        case 5u:
          v5->_hasRecognizerScoreHS = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)&v4[*v7])
          {
            float v38 = *(float *)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v38 = 0.0;
          }
          double v22 = v38;
          uint64_t v81 = 80;
          goto LABEL_121;
        case 6u:
          v5->_hasRecognizerScoreJS = 1;
          uint64_t v39 = *v6;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(void *)&v4[*v7])
          {
            float v41 = *(float *)(*(void *)&v4[*v9] + v40);
            *(void *)&v4[v39] = v40 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v41 = 0.0;
          }
          double v22 = v41;
          uint64_t v81 = 88;
          goto LABEL_121;
        case 7u:
          v5->_hasTriggerScoreHS = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(void *)&v4[*v7])
          {
            float v44 = *(float *)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v44 = 0.0;
          }
          double v22 = v44;
          uint64_t v81 = 96;
          goto LABEL_121;
        case 8u:
          v5->_hasTriggerScoreJS = 1;
          uint64_t v45 = *v6;
          unint64_t v46 = *(void *)&v4[v45];
          if (v46 <= 0xFFFFFFFFFFFFFFFBLL && v46 + 4 <= *(void *)&v4[*v7])
          {
            float v47 = *(float *)(*(void *)&v4[*v9] + v46);
            *(void *)&v4[v45] = v46 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v47 = 0.0;
          }
          double v22 = v47;
          uint64_t v81 = 104;
          goto LABEL_121;
        case 9u:
          v5->_hasMitigationScore = 1;
          uint64_t v48 = *v6;
          unint64_t v49 = *(void *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFFBLL && v49 + 4 <= *(void *)&v4[*v7])
          {
            float v50 = *(float *)(*(void *)&v4[*v9] + v49);
            *(void *)&v4[v48] = v49 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v50 = 0.0;
          }
          double v22 = v50;
          uint64_t v81 = 112;
          goto LABEL_121;
        case 0xAu:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v31 = 0;
          v5->_hasInvocationTypeID = 1;
          break;
        case 0xBu:
          v5->_hasRepetitionSimilarityScore = 1;
          uint64_t v57 = *v6;
          unint64_t v58 = *(void *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFFBLL && v58 + 4 <= *(void *)&v4[*v7])
          {
            float v59 = *(float *)(*(void *)&v4[*v9] + v58);
            *(void *)&v4[v57] = v58 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v59 = 0.0;
          }
          double v22 = v59;
          uint64_t v81 = 120;
          goto LABEL_121;
        case 0xCu:
          v5->_hasTdSpeakerRecognizerCombinedScore = 1;
          uint64_t v60 = *v6;
          unint64_t v61 = *(void *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFFBLL && v61 + 4 <= *(void *)&v4[*v7])
          {
            float v62 = *(float *)(*(void *)&v4[*v9] + v61);
            *(void *)&v4[v60] = v61 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v62 = 0.0;
          }
          double v22 = v62;
          uint64_t v81 = 128;
          goto LABEL_121;
        case 0xDu:
          v5->_hasHwSampleRate = 1;
          uint64_t v63 = *v6;
          unint64_t v64 = *(void *)&v4[v63];
          if (v64 <= 0xFFFFFFFFFFFFFFFBLL && v64 + 4 <= *(void *)&v4[*v7])
          {
            float v65 = *(float *)(*(void *)&v4[*v9] + v64);
            *(void *)&v4[v63] = v64 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v65 = 0.0;
          }
          double v22 = v65;
          uint64_t v81 = 136;
          goto LABEL_121;
        case 0xEu:
          uint64_t v66 = PBReaderReadString();
          configVersion = v5->_configVersion;
          v5->_configVersion = (NSString *)v66;

          continue;
        case 0xFu:
          v5->_hasKeywordThresholdHS = 1;
          uint64_t v68 = *v6;
          unint64_t v69 = *(void *)&v4[v68];
          if (v69 <= 0xFFFFFFFFFFFFFFFBLL && v69 + 4 <= *(void *)&v4[*v7])
          {
            float v70 = *(float *)(*(void *)&v4[*v9] + v69);
            *(void *)&v4[v68] = v69 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v70 = 0.0;
          }
          double v22 = v70;
          uint64_t v81 = 152;
          goto LABEL_121;
        case 0x10u:
          v5->_hasKeywordThresholdJS = 1;
          uint64_t v71 = *v6;
          unint64_t v72 = *(void *)&v4[v71];
          if (v72 <= 0xFFFFFFFFFFFFFFFBLL && v72 + 4 <= *(void *)&v4[*v7])
          {
            float v73 = *(float *)(*(void *)&v4[*v9] + v72);
            *(void *)&v4[v71] = v72 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v73 = 0.0;
          }
          double v22 = v73;
          uint64_t v81 = 160;
          goto LABEL_121;
        case 0x11u:
          v5->_hasTdSpeakerRecognizerCombinedThresholdHS = 1;
          uint64_t v74 = *v6;
          unint64_t v75 = *(void *)&v4[v74];
          if (v75 <= 0xFFFFFFFFFFFFFFFBLL && v75 + 4 <= *(void *)&v4[*v7])
          {
            float v76 = *(float *)(*(void *)&v4[*v9] + v75);
            *(void *)&v4[v74] = v75 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v76 = 0.0;
          }
          double v22 = v76;
          uint64_t v81 = 168;
          goto LABEL_121;
        case 0x12u:
          v5->_hasTdSpeakerRecognizerCombinedThresholdJS = 1;
          uint64_t v77 = *v6;
          unint64_t v78 = *(void *)&v4[v77];
          if (v78 <= 0xFFFFFFFFFFFFFFFBLL && v78 + 4 <= *(void *)&v4[*v7])
          {
            float v79 = *(float *)(*(void *)&v4[*v9] + v78);
            *(void *)&v4[v77] = v78 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v79 = 0.0;
          }
          double v22 = v79;
          uint64_t v81 = 176;
LABEL_121:
          *(double *)((char *)&v5->super.super.isa + v81) = v22;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_124;
          }
          continue;
      }
      while (1)
      {
        uint64_t v53 = *v6;
        uint64_t v54 = *(void *)&v4[v53];
        unint64_t v55 = v54 + 1;
        if (v54 == -1 || v55 > *(void *)&v4[*v7]) {
          break;
        }
        char v56 = *(unsigned char *)(*(void *)&v4[*v9] + v54);
        *(void *)&v4[v53] = v55;
        v31 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0) {
          goto LABEL_87;
        }
        v51 += 7;
        BOOL v17 = v52++ >= 9;
        if (v17)
        {
          LODWORD(v31) = 0;
          goto LABEL_89;
        }
      }
      v4[*v8] = 1;
LABEL_87:
      if (v4[*v8]) {
        LODWORD(v31) = 0;
      }
LABEL_89:
      uint64_t v80 = 56;
LABEL_90:
      *(_DWORD *)((char *)&v5->super.super.isa + v80) = v31;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_124:
  }
    id v82 = 0;
  else {
LABEL_125:
  }
    id v82 = v5;

  return v82;
}

- (NSString)description
{
  id v31 = [NSString alloc];
  unint64_t v37 = [(BMSiriVoiceTriggerStatistics *)self absoluteTimestamp];
  v3 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreHS];
  uint64_t v36 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self firstPassPeakScoreJS];
  char v35 = objc_msgSend(v4, "numberWithDouble:");
  unsigned int v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriVoiceTriggerStatistics firstPassTriggerSource](self, "firstPassTriggerSource"));
  id v5 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self recognizerScoreHS];
  char v29 = objc_msgSend(v5, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self recognizerScoreJS];
  float v28 = objc_msgSend(v6, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self triggerScoreHS];
  unint64_t v34 = objc_msgSend(v7, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self triggerScoreJS];
  unint64_t v27 = objc_msgSend(v8, "numberWithDouble:");
  id v9 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self mitigationScore];
  uint64_t v26 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v33 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriVoiceTriggerStatistics invocationTypeID](self, "invocationTypeID"));
  char v10 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self repetitionSimilarityScore];
  float v25 = objc_msgSend(v10, "numberWithDouble:");
  unsigned int v11 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedScore];
  unint64_t v24 = objc_msgSend(v11, "numberWithDouble:");
  unint64_t v12 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self hwSampleRate];
  uint64_t v23 = objc_msgSend(v12, "numberWithDouble:");
  uint64_t v13 = [(BMSiriVoiceTriggerStatistics *)self configVersion];
  uint64_t v14 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self keywordThresholdHS];
  unint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  char v16 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self keywordThresholdJS];
  BOOL v17 = objc_msgSend(v16, "numberWithDouble:");
  int v18 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdHS];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  uint64_t v20 = NSNumber;
  [(BMSiriVoiceTriggerStatistics *)self tdSpeakerRecognizerCombinedThresholdJS];
  unint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
  uint64_t v32 = objc_msgSend(v31, "initWithFormat:", @"BMSiriVoiceTriggerStatistics with absoluteTimestamp: %@, firstPassPeakScoreHS: %@, firstPassPeakScoreJS: %@, firstPassTriggerSource: %@, recognizerScoreHS: %@, recognizerScoreJS: %@, triggerScoreHS: %@, triggerScoreJS: %@, mitigationScore: %@, invocationTypeID: %@, repetitionSimilarityScore: %@, tdSpeakerRecognizerCombinedScore: %@, hwSampleRate: %@, configVersion: %@, keywordThresholdHS: %@, keywordThresholdJS: %@, tdSpeakerRecognizerCombinedThresholdHS: %@, tdSpeakerRecognizerCombinedThresholdJS: %@", v37, v36, v35, v30, v29, v28, v34, v27, v26, v33, v25, v24, v23, v13, v15, v17,
                  v19,
                  v21);

  return (NSString *)v32;
}

- (BMSiriVoiceTriggerStatistics)initWithAbsoluteTimestamp:(id)a3 firstPassPeakScoreHS:(id)a4 firstPassPeakScoreJS:(id)a5 firstPassTriggerSource:(id)a6 recognizerScoreHS:(id)a7 recognizerScoreJS:(id)a8 triggerScoreHS:(id)a9 triggerScoreJS:(id)a10 mitigationScore:(id)a11 invocationTypeID:(id)a12 repetitionSimilarityScore:(id)a13 tdSpeakerRecognizerCombinedScore:(id)a14 hwSampleRate:(id)a15 configVersion:(id)a16 keywordThresholdHS:(id)a17 keywordThresholdJS:(id)a18 tdSpeakerRecognizerCombinedThresholdHS:(id)a19 tdSpeakerRecognizerCombinedThresholdJS:(id)a20
{
  id v25 = a3;
  id v26 = a4;
  id v77 = a5;
  id v76 = a6;
  id v75 = a7;
  id v74 = a8;
  id v73 = a9;
  id v72 = a10;
  unint64_t v27 = v26;
  id v71 = a11;
  id v70 = a12;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v69 = a16;
  id v31 = a17;
  id v32 = a18;
  id v33 = a19;
  id v34 = a20;
  v78.receiver = self;
  v78.super_class = (Class)BMSiriVoiceTriggerStatistics;
  char v35 = [(BMEventBase *)&v78 init];
  if (v35)
  {
    v35->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v25)
    {
      v35->_hasRaw_absoluteTimestamp = 1;
      [v25 timeIntervalSince1970];
    }
    else
    {
      v35->_hasRaw_absoluteTimestamp = 0;
      double v36 = -1.0;
    }
    v35->_raw_absoluteTimestamp = v36;
    if (v27)
    {
      v35->_hasFirstPassPeakScoreHS = 1;
      [v27 floatValue];
      double v38 = v37;
    }
    else
    {
      v35->_hasFirstPassPeakScoreHS = 0;
      double v38 = -1.0;
    }
    v35->_firstPassPeakScoreHS = v38;
    if (v77)
    {
      v35->_hasFirstPassPeakScoreJS = 1;
      [v77 floatValue];
      double v40 = v39;
    }
    else
    {
      v35->_hasFirstPassPeakScoreJS = 0;
      double v40 = -1.0;
    }
    v35->_firstPassPeakScoreJS = v40;
    if (v76)
    {
      v35->_hasFirstPassTriggerSource = 1;
      int v41 = [v76 intValue];
    }
    else
    {
      v35->_hasFirstPassTriggerSource = 0;
      int v41 = -1;
    }
    v35->_firstPassTriggerSource = v41;
    if (v75)
    {
      v35->_hasRecognizerScoreHS = 1;
      [v75 floatValue];
      double v43 = v42;
    }
    else
    {
      v35->_hasRecognizerScoreHS = 0;
      double v43 = -1.0;
    }
    v35->_recognizerScoreHS = v43;
    if (v74)
    {
      v35->_hasRecognizerScoreJS = 1;
      [v74 floatValue];
      double v45 = v44;
    }
    else
    {
      v35->_hasRecognizerScoreJS = 0;
      double v45 = -1.0;
    }
    v35->_recognizerScoreJS = v45;
    if (v73)
    {
      v35->_hasTriggerScoreHS = 1;
      [v73 floatValue];
      double v47 = v46;
    }
    else
    {
      v35->_hasTriggerScoreHS = 0;
      double v47 = -1.0;
    }
    v35->_triggerScoreHS = v47;
    if (v72)
    {
      v35->_hasTriggerScoreJS = 1;
      [v72 floatValue];
      double v49 = v48;
    }
    else
    {
      v35->_hasTriggerScoreJS = 0;
      double v49 = -1.0;
    }
    v35->_triggerScoreJS = v49;
    if (v71)
    {
      v35->_hasMitigationScore = 1;
      [v71 floatValue];
      double v51 = v50;
    }
    else
    {
      v35->_hasMitigationScore = 0;
      double v51 = -1.0;
    }
    v35->_mitigationScore = v51;
    if (v70)
    {
      v35->_hasInvocationTypeID = 1;
      int v52 = [v70 intValue];
    }
    else
    {
      v35->_hasInvocationTypeID = 0;
      int v52 = -1;
    }
    v35->_invocationTypeID = v52;
    if (v28)
    {
      v35->_hasRepetitionSimilarityScore = 1;
      [v28 floatValue];
      double v54 = v53;
    }
    else
    {
      v35->_hasRepetitionSimilarityScore = 0;
      double v54 = -1.0;
    }
    v35->_repetitionSimilarityScore = v54;
    if (v29)
    {
      v35->_hasTdSpeakerRecognizerCombinedScore = 1;
      [v29 floatValue];
      double v56 = v55;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedScore = 0;
      double v56 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedScore = v56;
    if (v30)
    {
      v35->_hasHwSampleRate = 1;
      [v30 floatValue];
      double v58 = v57;
    }
    else
    {
      v35->_hasHwSampleRate = 0;
      double v58 = -1.0;
    }
    v35->_hwSampleRate = v58;
    objc_storeStrong((id *)&v35->_configVersion, a16);
    if (v31)
    {
      v35->_hasKeywordThresholdHS = 1;
      [v31 floatValue];
      double v60 = v59;
    }
    else
    {
      v35->_hasKeywordThresholdHS = 0;
      double v60 = -1.0;
    }
    v35->_keywordThresholdHS = v60;
    if (v32)
    {
      v35->_hasKeywordThresholdJS = 1;
      [v32 floatValue];
      double v62 = v61;
    }
    else
    {
      v35->_hasKeywordThresholdJS = 0;
      double v62 = -1.0;
    }
    v35->_keywordThresholdJS = v62;
    if (v33)
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdHS = 1;
      [v33 floatValue];
      double v64 = v63;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdHS = 0;
      double v64 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedThresholdHS = v64;
    if (v34)
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdJS = 1;
      [v34 floatValue];
      double v66 = v65;
    }
    else
    {
      v35->_hasTdSpeakerRecognizerCombinedThresholdJS = 0;
      double v66 = -1.0;
    }
    v35->_tdSpeakerRecognizerCombinedThresholdJS = v66;
  }

  return v35;
}

+ (id)protoFields
{
  v22[18] = *MEMORY[0x1E4F143B8];
  unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v22[0] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstPassPeakScoreHS" number:2 type:1 subMessageClass:0];
  v22[1] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstPassPeakScoreJS" number:3 type:1 subMessageClass:0];
  v22[2] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstPassTriggerSource" number:4 type:2 subMessageClass:0];
  v22[3] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recognizerScoreHS" number:5 type:1 subMessageClass:0];
  v22[4] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recognizerScoreJS" number:6 type:1 subMessageClass:0];
  v22[5] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"triggerScoreHS" number:7 type:1 subMessageClass:0];
  v22[6] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"triggerScoreJS" number:8 type:1 subMessageClass:0];
  v22[7] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mitigationScore" number:9 type:1 subMessageClass:0];
  v22[8] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"invocationTypeID" number:10 type:2 subMessageClass:0];
  v22[9] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"repetitionSimilarityScore" number:11 type:1 subMessageClass:0];
  v22[10] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tdSpeakerRecognizerCombinedScore" number:12 type:1 subMessageClass:0];
  v22[11] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"hwSampleRate" number:13 type:1 subMessageClass:0];
  v22[12] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"configVersion" number:14 type:13 subMessageClass:0];
  v22[13] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"keywordThresholdHS" number:15 type:1 subMessageClass:0];
  v22[14] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"keywordThresholdJS" number:16 type:1 subMessageClass:0];
  v22[15] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tdSpeakerRecognizerCombinedThresholdHS" number:17 type:1 subMessageClass:0];
  v22[16] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tdSpeakerRecognizerCombinedThresholdJS" number:18 type:1 subMessageClass:0];
  v22[17] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:18];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6CA8;
}

+ (id)columns
{
  v22[18] = *MEMORY[0x1E4F143B8];
  unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstPassPeakScoreHS" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstPassPeakScoreJS" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstPassTriggerSource" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recognizerScoreHS" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recognizerScoreJS" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"triggerScoreHS" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:1 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"triggerScoreJS" dataType:1 requestOnly:0 fieldNumber:8 protoDataType:1 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mitigationScore" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:1 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"invocationTypeID" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"repetitionSimilarityScore" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:1 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tdSpeakerRecognizerCombinedScore" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:1 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"hwSampleRate" dataType:1 requestOnly:0 fieldNumber:13 protoDataType:1 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"configVersion" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"keywordThresholdHS" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:1 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"keywordThresholdJS" dataType:1 requestOnly:0 fieldNumber:16 protoDataType:1 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tdSpeakerRecognizerCombinedThresholdHS" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:1 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tdSpeakerRecognizerCombinedThresholdJS" dataType:1 requestOnly:0 fieldNumber:18 protoDataType:1 convertedType:0];
  v22[0] = v21;
  v22[1] = v20;
  v22[2] = v19;
  v22[3] = v18;
  v22[4] = v17;
  v22[5] = v16;
  v22[6] = v15;
  v22[7] = v14;
  v22[8] = v2;
  v22[9] = v3;
  v22[10] = v4;
  v22[11] = v13;
  v22[12] = v5;
  v22[13] = v6;
  v22[14] = v7;
  v22[15] = v12;
  v22[16] = v8;
  v22[17] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:18];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriVoiceTriggerStatistics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[12] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end