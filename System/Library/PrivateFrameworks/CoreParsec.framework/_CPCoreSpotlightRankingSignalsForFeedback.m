@interface _CPCoreSpotlightRankingSignalsForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatchOfLaunchString;
- (BOOL)isSemanticMatch;
- (BOOL)isSyntacticMatch;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasEngagedInSpotlight;
- (BOOL)wasNominatedAsTopHit;
- (_CPCoreSpotlightRankingSignalsForFeedback)initWithFacade:(id)a3;
- (float)engagementScore;
- (float)freshness;
- (float)pommesL2Score;
- (float)predictedLikelihoodOfEngagement;
- (float)semanticScore;
- (float)sodiumL2Score;
- (float)syntacticScore;
- (float)topicalityScore;
- (int)embeddingStatus;
- (int)resultQueryRecency;
- (unint64_t)hash;
- (unsigned)itemAgeInDays;
- (void)setEmbeddingStatus:(int)a3;
- (void)setEngagementScore:(float)a3;
- (void)setFreshness:(float)a3;
- (void)setIsExactMatchOfLaunchString:(BOOL)a3;
- (void)setIsSemanticMatch:(BOOL)a3;
- (void)setIsSyntacticMatch:(BOOL)a3;
- (void)setItemAgeInDays:(unsigned int)a3;
- (void)setPommesL2Score:(float)a3;
- (void)setPredictedLikelihoodOfEngagement:(float)a3;
- (void)setResultQueryRecency:(int)a3;
- (void)setSemanticScore:(float)a3;
- (void)setSodiumL2Score:(float)a3;
- (void)setSyntacticScore:(float)a3;
- (void)setTopicalityScore:(float)a3;
- (void)setWasEngagedInSpotlight:(BOOL)a3;
- (void)setWasNominatedAsTopHit:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPCoreSpotlightRankingSignalsForFeedback

- (void)setItemAgeInDays:(unsigned int)a3
{
  self->_itemAgeInDays = a3;
}

- (unsigned)itemAgeInDays
{
  return self->_itemAgeInDays;
}

- (void)setEmbeddingStatus:(int)a3
{
  self->_embeddingStatus = a3;
}

- (int)embeddingStatus
{
  return self->_embeddingStatus;
}

- (void)setSyntacticScore:(float)a3
{
  self->_syntacticScore = a3;
}

- (float)syntacticScore
{
  return self->_syntacticScore;
}

- (void)setIsSyntacticMatch:(BOOL)a3
{
  self->_isSyntacticMatch = a3;
}

- (BOOL)isSyntacticMatch
{
  return self->_isSyntacticMatch;
}

- (void)setSemanticScore:(float)a3
{
  self->_semanticScore = a3;
}

- (float)semanticScore
{
  return self->_semanticScore;
}

- (void)setIsSemanticMatch:(BOOL)a3
{
  self->_isSemanticMatch = a3;
}

- (BOOL)isSemanticMatch
{
  return self->_isSemanticMatch;
}

- (void)setPommesL2Score:(float)a3
{
  self->_pommesL2Score = a3;
}

- (float)pommesL2Score
{
  return self->_pommesL2Score;
}

- (void)setResultQueryRecency:(int)a3
{
  self->_resultQueryRecency = a3;
}

- (int)resultQueryRecency
{
  return self->_resultQueryRecency;
}

- (void)setWasEngagedInSpotlight:(BOOL)a3
{
  self->_wasEngagedInSpotlight = a3;
}

- (BOOL)wasEngagedInSpotlight
{
  return self->_wasEngagedInSpotlight;
}

- (void)setIsExactMatchOfLaunchString:(BOOL)a3
{
  self->_isExactMatchOfLaunchString = a3;
}

- (BOOL)isExactMatchOfLaunchString
{
  return self->_isExactMatchOfLaunchString;
}

- (void)setSodiumL2Score:(float)a3
{
  self->_sodiumL2Score = a3;
}

- (float)sodiumL2Score
{
  return self->_sodiumL2Score;
}

- (void)setWasNominatedAsTopHit:(BOOL)a3
{
  self->_wasNominatedAsTopHit = a3;
}

- (BOOL)wasNominatedAsTopHit
{
  return self->_wasNominatedAsTopHit;
}

- (void)setPredictedLikelihoodOfEngagement:(float)a3
{
  self->_predictedLikelihoodOfEngagement = a3;
}

- (float)predictedLikelihoodOfEngagement
{
  return self->_predictedLikelihoodOfEngagement;
}

- (void)setEngagementScore:(float)a3
{
  self->_engagementScore = a3;
}

- (float)engagementScore
{
  return self->_engagementScore;
}

- (void)setFreshness:(float)a3
{
  self->_freshness = a3;
}

- (float)freshness
{
  return self->_freshness;
}

- (void)setTopicalityScore:(float)a3
{
  self->_topicalityScore = a3;
}

- (float)topicalityScore
{
  return self->_topicalityScore;
}

- (unint64_t)hash
{
  float topicalityScore = self->_topicalityScore;
  double v4 = topicalityScore;
  if (topicalityScore < 0.0) {
    double v4 = -topicalityScore;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float freshness = self->_freshness;
  double v8 = freshness;
  if (freshness < 0.0) {
    double v8 = -freshness;
  }
  long double v9 = round(v8);
  unint64_t v40 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  float engagementScore = self->_engagementScore;
  double v11 = engagementScore;
  if (engagementScore < 0.0) {
    double v11 = -engagementScore;
  }
  long double v12 = round(v11);
  unint64_t v39 = (unint64_t)(fmod(v12, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v11 - v12, 0x40uLL);
  float predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  double v14 = predictedLikelihoodOfEngagement;
  if (predictedLikelihoodOfEngagement < 0.0) {
    double v14 = -predictedLikelihoodOfEngagement;
  }
  long double v15 = round(v14);
  unint64_t v38 = (unint64_t)(fmod(v15, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v14 - v15, 0x40uLL);
  uint64_t v37 = 2654435761 * self->_wasNominatedAsTopHit;
  float sodiumL2Score = self->_sodiumL2Score;
  double v17 = sodiumL2Score;
  if (sodiumL2Score < 0.0) {
    double v17 = -sodiumL2Score;
  }
  long double v18 = round(v17);
  unint64_t v19 = (unint64_t)(fmod(v18, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v17 - v18, 0x40uLL);
  uint64_t v20 = 2654435761 * self->_isExactMatchOfLaunchString;
  uint64_t v21 = 2654435761 * self->_wasEngagedInSpotlight;
  uint64_t v22 = 2654435761 * self->_resultQueryRecency;
  float pommesL2Score = self->_pommesL2Score;
  double v24 = pommesL2Score;
  if (pommesL2Score < 0.0) {
    double v24 = -pommesL2Score;
  }
  long double v25 = round(v24);
  unint64_t v26 = (unint64_t)(fmod(v25, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v24 - v25, 0x40uLL);
  uint64_t v27 = 2654435761 * self->_isSemanticMatch;
  float semanticScore = self->_semanticScore;
  double v29 = semanticScore;
  if (semanticScore < 0.0) {
    double v29 = -semanticScore;
  }
  long double v30 = round(v29);
  unint64_t v31 = (unint64_t)(fmod(v30, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v29 - v30, 0x40uLL);
  float syntacticScore = self->_syntacticScore;
  double v34 = syntacticScore;
  if (syntacticScore < 0.0) {
    double v34 = -syntacticScore;
  }
  long double v35 = round(v34);
  uint64_t v32 = 2654435761 * self->_isSyntacticMatch;
  return v40 ^ v37 ^ v39 ^ v38 ^ v20 ^ v21 ^ v19 ^ v22 ^ v27 ^ v26 ^ v32 ^ v31 ^ (2654435761 * self->_embeddingStatus) ^ (2654435761 * self->_itemAgeInDays) ^ ((unint64_t)(fmod(v35, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v34 - v35, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  float topicalityScore = self->_topicalityScore;
  [v4 topicalityScore];
  if (topicalityScore != v6) {
    goto LABEL_18;
  }
  float freshness = self->_freshness;
  [v4 freshness];
  if (freshness != v8) {
    goto LABEL_18;
  }
  float engagementScore = self->_engagementScore;
  [v4 engagementScore];
  if (engagementScore != v10) {
    goto LABEL_18;
  }
  float predictedLikelihoodOfEngagement = self->_predictedLikelihoodOfEngagement;
  [v4 predictedLikelihoodOfEngagement];
  if (predictedLikelihoodOfEngagement != v12) {
    goto LABEL_18;
  }
  int wasNominatedAsTopHit = self->_wasNominatedAsTopHit;
  if (wasNominatedAsTopHit != [v4 wasNominatedAsTopHit]) {
    goto LABEL_18;
  }
  float sodiumL2Score = self->_sodiumL2Score;
  [v4 sodiumL2Score];
  if (sodiumL2Score != v15) {
    goto LABEL_18;
  }
  int isExactMatchOfLaunchString = self->_isExactMatchOfLaunchString;
  if (isExactMatchOfLaunchString != [v4 isExactMatchOfLaunchString]) {
    goto LABEL_18;
  }
  int wasEngagedInSpotlight = self->_wasEngagedInSpotlight;
  if (wasEngagedInSpotlight != [v4 wasEngagedInSpotlight]) {
    goto LABEL_18;
  }
  int resultQueryRecency = self->_resultQueryRecency;
  if (resultQueryRecency != [v4 resultQueryRecency]) {
    goto LABEL_18;
  }
  float pommesL2Score = self->_pommesL2Score;
  [v4 pommesL2Score];
  if (pommesL2Score != v20) {
    goto LABEL_18;
  }
  int isSemanticMatch = self->_isSemanticMatch;
  if (isSemanticMatch == [v4 isSemanticMatch]
    && (float semanticScore = self->_semanticScore, [v4 semanticScore], semanticScore == v23)
    && (int isSyntacticMatch = self->_isSyntacticMatch,
        isSyntacticMatch == [v4 isSyntacticMatch])
    && (float syntacticScore = self->_syntacticScore, [v4 syntacticScore], syntacticScore == v26)
    && (int embeddingStatus = self->_embeddingStatus, embeddingStatus == [v4 embeddingStatus]))
  {
    unsigned int itemAgeInDays = self->_itemAgeInDays;
    BOOL v29 = itemAgeInDays == [v4 itemAgeInDays];
  }
  else
  {
LABEL_18:
    BOOL v29 = 0;
  }

  return v29;
}

- (void)writeTo:(id)a3
{
  a3;
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self topicalityScore];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self freshness];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self engagementScore];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self predictedLikelihoodOfEngagement];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self wasNominatedAsTopHit]) {
    PBDataWriterWriteBOOLField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self sodiumL2Score];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self isExactMatchOfLaunchString]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self wasEngagedInSpotlight]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self resultQueryRecency]) {
    PBDataWriterWriteInt32Field();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self pommesL2Score];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self isSemanticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self semanticScore];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self isSyntacticMatch]) {
    PBDataWriterWriteBOOLField();
  }
  [(_CPCoreSpotlightRankingSignalsForFeedback *)self syntacticScore];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self embeddingStatus]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPCoreSpotlightRankingSignalsForFeedback *)self itemAgeInDays]) {
    PBDataWriterWriteUint32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPCoreSpotlightRankingSignalsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (_CPCoreSpotlightRankingSignalsForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_CPCoreSpotlightRankingSignalsForFeedback;
  float v5 = [(_CPCoreSpotlightRankingSignalsForFeedback *)&v24 init];
  if (v5)
  {
    float v6 = [v4 topicalityScore];

    if (v6)
    {
      float v7 = [v4 topicalityScore];
      [v7 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setTopicalityScore:](v5, "setTopicalityScore:");
    }
    float v8 = [v4 freshness];

    if (v8)
    {
      float v9 = [v4 freshness];
      [v9 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setFreshness:](v5, "setFreshness:");
    }
    float v10 = [v4 engagementScore];

    if (v10)
    {
      float v11 = [v4 engagementScore];
      [v11 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setEngagementScore:](v5, "setEngagementScore:");
    }
    float v12 = [v4 predictedLikelihoodOfEngagement];

    if (v12)
    {
      v13 = [v4 predictedLikelihoodOfEngagement];
      [v13 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setPredictedLikelihoodOfEngagement:](v5, "setPredictedLikelihoodOfEngagement:");
    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setWasNominatedAsTopHit:](v5, "setWasNominatedAsTopHit:", [v4 wasNominatedAsTopHit]);
    double v14 = [v4 sodiumL2Score];

    if (v14)
    {
      float v15 = [v4 sodiumL2Score];
      [v15 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setSodiumL2Score:](v5, "setSodiumL2Score:");
    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsExactMatchOfLaunchString:](v5, "setIsExactMatchOfLaunchString:", [v4 isExactMatchOfLaunchString]);
    -[_CPCoreSpotlightRankingSignalsForFeedback setWasEngagedInSpotlight:](v5, "setWasEngagedInSpotlight:", [v4 wasEngagedInSpotlight]);
    -[_CPCoreSpotlightRankingSignalsForFeedback setResultQueryRecency:](v5, "setResultQueryRecency:", [v4 resultQueryRecency]);
    v16 = [v4 pommesL2Score];

    if (v16)
    {
      double v17 = [v4 pommesL2Score];
      [v17 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setPommesL2Score:](v5, "setPommesL2Score:");
    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsSemanticMatch:](v5, "setIsSemanticMatch:", [v4 isSemanticMatch]);
    long double v18 = [v4 semanticScore];

    if (v18)
    {
      unint64_t v19 = [v4 semanticScore];
      [v19 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setSemanticScore:](v5, "setSemanticScore:");
    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setIsSyntacticMatch:](v5, "setIsSyntacticMatch:", [v4 isSyntacticMatch]);
    float v20 = [v4 syntacticScore];

    if (v20)
    {
      uint64_t v21 = [v4 syntacticScore];
      [v21 floatValue];
      -[_CPCoreSpotlightRankingSignalsForFeedback setSyntacticScore:](v5, "setSyntacticScore:");
    }
    -[_CPCoreSpotlightRankingSignalsForFeedback setEmbeddingStatus:](v5, "setEmbeddingStatus:", [v4 embeddingStatus]);
    -[_CPCoreSpotlightRankingSignalsForFeedback setItemAgeInDays:](v5, "setItemAgeInDays:", [v4 itemAgeInDays]);
    uint64_t v22 = v5;
  }

  return v5;
}

@end