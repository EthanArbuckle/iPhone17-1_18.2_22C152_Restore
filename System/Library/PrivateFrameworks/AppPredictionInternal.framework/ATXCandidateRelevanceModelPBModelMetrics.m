@interface ATXCandidateRelevanceModelPBModelMetrics
- (BOOL)hasAbGroup;
- (BOOL)hasAvgNumberOfModelWeights;
- (BOOL)hasAvgNumberOfNonZeroModelWeights;
- (BOOL)hasBlendingABGroup;
- (BOOL)hasClientModelId;
- (BOOL)hasDefaultHyperParams;
- (BOOL)hasExecutableType;
- (BOOL)hasHasDefaultHyperParams;
- (BOOL)hasHasTrainedModel;
- (BOOL)hasLearningRate;
- (BOOL)hasLogisticRegressionRegularizationL1Ratio;
- (BOOL)hasLogisticRegressionRegularizationRate;
- (BOOL)hasLogisticRegressionRegularizationStrategy;
- (BOOL)hasMinIterations;
- (BOOL)hasModelAgeInDays;
- (BOOL)hasModelType;
- (BOOL)hasNumberOfCandidateModels;
- (BOOL)hasPipelineEnabled;
- (BOOL)hasStoppingThreshold;
- (BOOL)hasTrainDataNumberOfCandidates;
- (BOOL)hasTrainDataNumberOfDaysWithPositiveSamples;
- (BOOL)hasTrainDataNumberOfPositiveSamples;
- (BOOL)hasTrainDataNumberOfSamples;
- (BOOL)hasTrainedModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)pipelineEnabled;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)blendingABGroup;
- (NSString)clientModelId;
- (NSString)executableType;
- (NSString)logisticRegressionRegularizationStrategy;
- (NSString)modelType;
- (float)learningRate;
- (float)logisticRegressionRegularizationL1Ratio;
- (float)logisticRegressionRegularizationRate;
- (float)stoppingThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)avgNumberOfModelWeights;
- (unsigned)avgNumberOfNonZeroModelWeights;
- (unsigned)minIterations;
- (unsigned)modelAgeInDays;
- (unsigned)numberOfCandidateModels;
- (unsigned)trainDataNumberOfCandidates;
- (unsigned)trainDataNumberOfDaysWithPositiveSamples;
- (unsigned)trainDataNumberOfPositiveSamples;
- (unsigned)trainDataNumberOfSamples;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAvgNumberOfModelWeights:(unsigned int)a3;
- (void)setAvgNumberOfNonZeroModelWeights:(unsigned int)a3;
- (void)setBlendingABGroup:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setExecutableType:(id)a3;
- (void)setHasAvgNumberOfModelWeights:(BOOL)a3;
- (void)setHasAvgNumberOfNonZeroModelWeights:(BOOL)a3;
- (void)setHasDefaultHyperParams:(BOOL)a3;
- (void)setHasHasDefaultHyperParams:(BOOL)a3;
- (void)setHasHasTrainedModel:(BOOL)a3;
- (void)setHasLearningRate:(BOOL)a3;
- (void)setHasLogisticRegressionRegularizationL1Ratio:(BOOL)a3;
- (void)setHasLogisticRegressionRegularizationRate:(BOOL)a3;
- (void)setHasMinIterations:(BOOL)a3;
- (void)setHasModelAgeInDays:(BOOL)a3;
- (void)setHasNumberOfCandidateModels:(BOOL)a3;
- (void)setHasPipelineEnabled:(BOOL)a3;
- (void)setHasStoppingThreshold:(BOOL)a3;
- (void)setHasTrainDataNumberOfCandidates:(BOOL)a3;
- (void)setHasTrainDataNumberOfDaysWithPositiveSamples:(BOOL)a3;
- (void)setHasTrainDataNumberOfPositiveSamples:(BOOL)a3;
- (void)setHasTrainDataNumberOfSamples:(BOOL)a3;
- (void)setHasTrainedModel:(BOOL)a3;
- (void)setLearningRate:(float)a3;
- (void)setLogisticRegressionRegularizationL1Ratio:(float)a3;
- (void)setLogisticRegressionRegularizationRate:(float)a3;
- (void)setLogisticRegressionRegularizationStrategy:(id)a3;
- (void)setMinIterations:(unsigned int)a3;
- (void)setModelAgeInDays:(unsigned int)a3;
- (void)setModelType:(id)a3;
- (void)setNumberOfCandidateModels:(unsigned int)a3;
- (void)setPipelineEnabled:(BOOL)a3;
- (void)setStoppingThreshold:(float)a3;
- (void)setTrainDataNumberOfCandidates:(unsigned int)a3;
- (void)setTrainDataNumberOfDaysWithPositiveSamples:(unsigned int)a3;
- (void)setTrainDataNumberOfPositiveSamples:(unsigned int)a3;
- (void)setTrainDataNumberOfSamples:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXCandidateRelevanceModelPBModelMetrics

- (BOOL)hasBlendingABGroup
{
  return self->_blendingABGroup != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (void)setPipelineEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_pipelineEnabled = a3;
}

- (void)setHasPipelineEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasPipelineEnabled
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setHasTrainedModel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_hasTrainedModel = a3;
}

- (void)setHasHasTrainedModel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasHasTrainedModel
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setHasDefaultHyperParams:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_hasDefaultHyperParams = a3;
}

- (void)setHasHasDefaultHyperParams:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasHasDefaultHyperParams
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasModelType
{
  return self->_modelType != 0;
}

- (void)setAvgNumberOfModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_avgNumberOfModelWeights = a3;
}

- (void)setHasAvgNumberOfModelWeights:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAvgNumberOfModelWeights
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAvgNumberOfNonZeroModelWeights:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_avgNumberOfNonZeroModelWeights = a3;
}

- (void)setHasAvgNumberOfNonZeroModelWeights:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAvgNumberOfNonZeroModelWeights
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumberOfCandidateModels:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numberOfCandidateModels = a3;
}

- (void)setHasNumberOfCandidateModels:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumberOfCandidateModels
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasLogisticRegressionRegularizationStrategy
{
  return self->_logisticRegressionRegularizationStrategy != 0;
}

- (void)setLogisticRegressionRegularizationRate:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_logisticRegressionRegularizationRate = a3;
}

- (void)setHasLogisticRegressionRegularizationRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLogisticRegressionRegularizationRate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLogisticRegressionRegularizationL1Ratio:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_logisticRegressionRegularizationL1Ratio = a3;
}

- (void)setHasLogisticRegressionRegularizationL1Ratio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLogisticRegressionRegularizationL1Ratio
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLearningRate:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_learningRate = a3;
}

- (void)setHasLearningRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLearningRate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMinIterations:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_minIterations = a3;
}

- (void)setHasMinIterations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMinIterations
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setStoppingThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_stoppingThreshold = a3;
}

- (void)setHasStoppingThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasStoppingThreshold
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTrainDataNumberOfPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_trainDataNumberOfPositiveSamples = a3;
}

- (void)setHasTrainDataNumberOfPositiveSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTrainDataNumberOfPositiveSamples
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTrainDataNumberOfSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_trainDataNumberOfSamples = a3;
}

- (void)setHasTrainDataNumberOfSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTrainDataNumberOfSamples
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setTrainDataNumberOfDaysWithPositiveSamples:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_trainDataNumberOfDaysWithPositiveSamples = a3;
}

- (void)setHasTrainDataNumberOfDaysWithPositiveSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTrainDataNumberOfDaysWithPositiveSamples
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTrainDataNumberOfCandidates:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_trainDataNumberOfCandidates = a3;
}

- (void)setHasTrainDataNumberOfCandidates:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTrainDataNumberOfCandidates
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (void)setModelAgeInDays:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_modelAgeInDays = a3;
}

- (void)setHasModelAgeInDays:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasModelAgeInDays
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXCandidateRelevanceModelPBModelMetrics;
  v4 = [(ATXCandidateRelevanceModelPBModelMetrics *)&v8 description];
  v5 = [(ATXCandidateRelevanceModelPBModelMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  blendingABGroup = self->_blendingABGroup;
  if (blendingABGroup) {
    [v3 setObject:blendingABGroup forKey:@"blendingABGroup"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v5 setObject:abGroup forKey:@"abGroup"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v5 setObject:clientModelId forKey:@"clientModelId"];
  }
  $858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v31 = [NSNumber numberWithBool:self->_pipelineEnabled];
  [v5 setObject:v31 forKey:@"pipelineEnabled"];

  *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    v10 = [NSNumber numberWithBool:self->_hasTrainedModel];
    [v5 setObject:v10 forKey:@"hasTrainedModel"];

    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_hasDefaultHyperParams];
    [v5 setObject:v11 forKey:@"hasDefaultHyperParams"];
  }
  modelType = self->_modelType;
  if (modelType) {
    [v5 setObject:modelType forKey:@"modelType"];
  }
  __int16 v13 = (__int16)self->_has;
  if (v13)
  {
    v21 = [NSNumber numberWithUnsignedInt:self->_avgNumberOfModelWeights];
    [v5 setObject:v21 forKey:@"avgNumberOfModelWeights"];

    __int16 v13 = (__int16)self->_has;
    if ((v13 & 2) == 0)
    {
LABEL_16:
      if ((v13 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_16;
  }
  v22 = [NSNumber numberWithUnsignedInt:self->_avgNumberOfNonZeroModelWeights];
  [v5 setObject:v22 forKey:@"avgNumberOfNonZeroModelWeights"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    v14 = [NSNumber numberWithUnsignedInt:self->_numberOfCandidateModels];
    [v5 setObject:v14 forKey:@"numberOfCandidateModels"];
  }
LABEL_18:
  logisticRegressionRegularizationStrategy = self->_logisticRegressionRegularizationStrategy;
  if (logisticRegressionRegularizationStrategy) {
    [v5 setObject:logisticRegressionRegularizationStrategy forKey:@"logisticRegressionRegularizationStrategy"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    *(float *)&double v4 = self->_logisticRegressionRegularizationRate;
    v23 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v23 forKey:@"logisticRegressionRegularizationRate"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 8) == 0)
    {
LABEL_22:
      if ((v16 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_42;
    }
  }
  else if ((v16 & 8) == 0)
  {
    goto LABEL_22;
  }
  *(float *)&double v4 = self->_logisticRegressionRegularizationL1Ratio;
  v24 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v24 forKey:@"logisticRegressionRegularizationL1Ratio"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 4) == 0)
  {
LABEL_23:
    if ((v16 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(float *)&double v4 = self->_learningRate;
  v25 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v25 forKey:@"learningRate"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) == 0)
  {
LABEL_24:
    if ((v16 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_44;
  }
LABEL_43:
  v26 = [NSNumber numberWithUnsignedInt:self->_minIterations];
  [v5 setObject:v26 forKey:@"minIterations"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x100) == 0)
  {
LABEL_25:
    if ((v16 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(float *)&double v4 = self->_stoppingThreshold;
  v27 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v27 forKey:@"stoppingThreshold"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x800) == 0)
  {
LABEL_26:
    if ((v16 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_46;
  }
LABEL_45:
  v28 = [NSNumber numberWithUnsignedInt:self->_trainDataNumberOfPositiveSamples];
  [v5 setObject:v28 forKey:@"trainDataNumberOfPositiveSamples"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x1000) == 0)
  {
LABEL_27:
    if ((v16 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_47;
  }
LABEL_46:
  v29 = [NSNumber numberWithUnsignedInt:self->_trainDataNumberOfSamples];
  [v5 setObject:v29 forKey:@"trainDataNumberOfSamples"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x400) == 0)
  {
LABEL_28:
    if ((v16 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_47:
  v30 = [NSNumber numberWithUnsignedInt:self->_trainDataNumberOfDaysWithPositiveSamples];
  [v5 setObject:v30 forKey:@"trainDataNumberOfDaysWithPositiveSamples"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    v17 = [NSNumber numberWithUnsignedInt:self->_trainDataNumberOfCandidates];
    [v5 setObject:v17 forKey:@"trainDataNumberOfCandidates"];
  }
LABEL_30:
  executableType = self->_executableType;
  if (executableType) {
    [v5 setObject:executableType forKey:@"executableType"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v19 = [NSNumber numberWithUnsignedInt:self->_modelAgeInDays];
    [v5 setObject:v19 forKey:@"modelAgeInDays"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return ATXCandidateRelevanceModelPBModelMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_blendingABGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  $858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_modelType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
LABEL_18:
  if (self->_logisticRegressionRegularizationStrategy)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_42;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
LABEL_30:
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_blendingABGroup)
  {
    objc_msgSend(v4, "setBlendingABGroup:");
    id v4 = v8;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v8, "setAbGroup:");
    id v4 = v8;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v8, "setClientModelId:");
    id v4 = v8;
  }
  $858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 114) = self->_pipelineEnabled;
  *((_WORD *)v4 + 58) |= 0x8000u;
  *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_9:
    *((unsigned char *)v4 + 113) = self->_hasTrainedModel;
    *((_WORD *)v4 + 58) |= 0x4000u;
    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
LABEL_10:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    *((unsigned char *)v4 + 112) = self->_hasDefaultHyperParams;
    *((_WORD *)v4 + 58) |= 0x2000u;
  }
  if (self->_modelType)
  {
    objc_msgSend(v8, "setModelType:");
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    *((_DWORD *)v4 + 4) = self->_avgNumberOfModelWeights;
    *((_WORD *)v4 + 58) |= 1u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)v4 + 5) = self->_avgNumberOfNonZeroModelWeights;
  *((_WORD *)v4 + 58) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_17:
    *((_DWORD *)v4 + 22) = self->_numberOfCandidateModels;
    *((_WORD *)v4 + 58) |= 0x80u;
  }
LABEL_18:
  if (self->_logisticRegressionRegularizationStrategy)
  {
    objc_msgSend(v8, "setLogisticRegressionRegularizationStrategy:");
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = LODWORD(self->_logisticRegressionRegularizationRate);
    *((_WORD *)v4 + 58) |= 0x10u;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_42;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  *((_DWORD *)v4 + 13) = LODWORD(self->_logisticRegressionRegularizationL1Ratio);
  *((_WORD *)v4 + 58) |= 8u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 12) = LODWORD(self->_learningRate);
  *((_WORD *)v4 + 58) |= 4u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 18) = self->_minIterations;
  *((_WORD *)v4 + 58) |= 0x20u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 23) = LODWORD(self->_stoppingThreshold);
  *((_WORD *)v4 + 58) |= 0x100u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 26) = self->_trainDataNumberOfPositiveSamples;
  *((_WORD *)v4 + 58) |= 0x800u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 27) = self->_trainDataNumberOfSamples;
  *((_WORD *)v4 + 58) |= 0x1000u;
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_47:
  *((_DWORD *)v4 + 25) = self->_trainDataNumberOfDaysWithPositiveSamples;
  *((_WORD *)v4 + 58) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_29:
    *((_DWORD *)v4 + 24) = self->_trainDataNumberOfCandidates;
    *((_WORD *)v4 + 58) |= 0x200u;
  }
LABEL_30:
  if (self->_executableType)
  {
    objc_msgSend(v8, "setExecutableType:");
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_modelAgeInDays;
    *((_WORD *)v4 + 58) |= 0x40u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_blendingABGroup copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_abGroup copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  $858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 114) = self->_pipelineEnabled;
  *(_WORD *)(v5 + 116) |= 0x8000u;
  *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_3:
    *(unsigned char *)(v5 + 113) = self->_hasTrainedModel;
    *(_WORD *)(v5 + 116) |= 0x4000u;
    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
LABEL_4:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 112) = self->_hasDefaultHyperParams;
    *(_WORD *)(v5 + 116) |= 0x2000u;
  }
  uint64_t v13 = [(NSString *)self->_modelType copyWithZone:a3];
  v14 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v13;

  __int16 v15 = (__int16)self->_has;
  if (v15)
  {
    *(_DWORD *)(v5 + 16) = self->_avgNumberOfModelWeights;
    *(_WORD *)(v5 + 116) |= 1u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 2) == 0)
    {
LABEL_8:
      if ((v15 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 20) = self->_avgNumberOfNonZeroModelWeights;
  *(_WORD *)(v5 + 116) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 88) = self->_numberOfCandidateModels;
    *(_WORD *)(v5 + 116) |= 0x80u;
  }
LABEL_10:
  uint64_t v16 = [(NSString *)self->_logisticRegressionRegularizationStrategy copyWithZone:a3];
  v17 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v16;

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x10) != 0)
  {
    *(float *)(v5 + 56) = self->_logisticRegressionRegularizationRate;
    *(_WORD *)(v5 + 116) |= 0x10u;
    __int16 v18 = (__int16)self->_has;
    if ((v18 & 8) == 0)
    {
LABEL_12:
      if ((v18 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_28;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_12;
  }
  *(float *)(v5 + 52) = self->_logisticRegressionRegularizationL1Ratio;
  *(_WORD *)(v5 + 116) |= 8u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 4) == 0)
  {
LABEL_13:
    if ((v18 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(float *)(v5 + 48) = self->_learningRate;
  *(_WORD *)(v5 + 116) |= 4u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) == 0)
  {
LABEL_14:
    if ((v18 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 72) = self->_minIterations;
  *(_WORD *)(v5 + 116) |= 0x20u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x100) == 0)
  {
LABEL_15:
    if ((v18 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(float *)(v5 + 92) = self->_stoppingThreshold;
  *(_WORD *)(v5 + 116) |= 0x100u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x800) == 0)
  {
LABEL_16:
    if ((v18 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 104) = self->_trainDataNumberOfPositiveSamples;
  *(_WORD *)(v5 + 116) |= 0x800u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x1000) == 0)
  {
LABEL_17:
    if ((v18 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 108) = self->_trainDataNumberOfSamples;
  *(_WORD *)(v5 + 116) |= 0x1000u;
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x400) == 0)
  {
LABEL_18:
    if ((v18 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_33:
  *(_DWORD *)(v5 + 100) = self->_trainDataNumberOfDaysWithPositiveSamples;
  *(_WORD *)(v5 + 116) |= 0x400u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 96) = self->_trainDataNumberOfCandidates;
    *(_WORD *)(v5 + 116) |= 0x200u;
  }
LABEL_20:
  uint64_t v19 = [(NSString *)self->_executableType copyWithZone:a3];
  v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_modelAgeInDays;
    *(_WORD *)(v5 + 116) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_106;
  }
  blendingABGroup = self->_blendingABGroup;
  if ((unint64_t)blendingABGroup | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](blendingABGroup, "isEqual:")) {
      goto LABEL_106;
    }
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](abGroup, "isEqual:")) {
      goto LABEL_106;
    }
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_106;
    }
  }
  $858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x8000) == 0) {
      goto LABEL_106;
    }
    if (self->_pipelineEnabled)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x8000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x4000) == 0) {
      goto LABEL_106;
    }
    if (self->_hasTrainedModel)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x4000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x2000) == 0) {
      goto LABEL_106;
    }
    if (self->_hasDefaultHyperParams)
    {
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 112))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  modelType = self->_modelType;
  if ((unint64_t)modelType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](modelType, "isEqual:")) {
      goto LABEL_106;
    }
    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 58);
  if (*(unsigned char *)&has)
  {
    if ((v10 & 1) == 0 || self->_avgNumberOfModelWeights != *((_DWORD *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if (v10)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_avgNumberOfNonZeroModelWeights != *((_DWORD *)v4 + 5)) {
      goto LABEL_106;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_numberOfCandidateModels != *((_DWORD *)v4 + 22)) {
      goto LABEL_106;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  logisticRegressionRegularizationStrategy = self->_logisticRegressionRegularizationStrategy;
  if ((unint64_t)logisticRegressionRegularizationStrategy | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](logisticRegressionRegularizationStrategy, "isEqual:")) {
      goto LABEL_106;
    }
    *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
  }
  __int16 v12 = *((_WORD *)v4 + 58);
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_logisticRegressionRegularizationRate != *((float *)v4 + 14)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_logisticRegressionRegularizationL1Ratio != *((float *)v4 + 13)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_learningRate != *((float *)v4 + 12)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_minIterations != *((_DWORD *)v4 + 18)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x100) == 0 || self->_stoppingThreshold != *((float *)v4 + 23)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x800) == 0 || self->_trainDataNumberOfPositiveSamples != *((_DWORD *)v4 + 26)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x1000) == 0 || self->_trainDataNumberOfSamples != *((_DWORD *)v4 + 27)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x400) == 0 || self->_trainDataNumberOfDaysWithPositiveSamples != *((_DWORD *)v4 + 25)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 58) & 0x200) == 0 || self->_trainDataNumberOfCandidates != *((_DWORD *)v4 + 24)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 58) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((void *)v4 + 5))
  {
    if (-[NSString isEqual:](executableType, "isEqual:"))
    {
      *(_WORD *)&$858CD4590B3952EEF70BA3EF88502D79 has = self->_has;
      goto LABEL_101;
    }
LABEL_106:
    BOOL v15 = 0;
    goto LABEL_107;
  }
LABEL_101:
  __int16 v14 = *((_WORD *)v4 + 58);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_modelAgeInDays != *((_DWORD *)v4 + 19)) {
      goto LABEL_106;
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = (v14 & 0x40) == 0;
  }
LABEL_107:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v45 = [(NSString *)self->_blendingABGroup hash];
  NSUInteger v44 = [(NSString *)self->_abGroup hash];
  NSUInteger v43 = [(NSString *)self->_clientModelId hash];
  if ((*(_WORD *)&self->_has & 0x8000) == 0)
  {
    uint64_t v42 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v41 = 2654435761 * self->_hasTrainedModel;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v42 = 2654435761 * self->_pipelineEnabled;
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v41 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_4:
    uint64_t v40 = 2654435761 * self->_hasDefaultHyperParams;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v40 = 0;
LABEL_8:
  NSUInteger v39 = [(NSString *)self->_modelType hash];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v38 = 0;
    if ((has & 2) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v37 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v38 = 2654435761 * self->_avgNumberOfModelWeights;
  if ((has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v37 = 2654435761 * self->_avgNumberOfNonZeroModelWeights;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v36 = 2654435761 * self->_numberOfCandidateModels;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v36 = 0;
LABEL_15:
  NSUInteger v35 = [(NSString *)self->_logisticRegressionRegularizationStrategy hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    float logisticRegressionRegularizationRate = self->_logisticRegressionRegularizationRate;
    float v7 = -logisticRegressionRegularizationRate;
    if (logisticRegressionRegularizationRate >= 0.0) {
      float v7 = self->_logisticRegressionRegularizationRate;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((v4 & 8) != 0)
  {
    float logisticRegressionRegularizationL1Ratio = self->_logisticRegressionRegularizationL1Ratio;
    float v12 = -logisticRegressionRegularizationL1Ratio;
    if (logisticRegressionRegularizationL1Ratio >= 0.0) {
      float v12 = self->_logisticRegressionRegularizationL1Ratio;
    }
    float v13 = floorf(v12 + 0.5);
    float v14 = (float)(v12 - v13) * 1.8447e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v34 = v5;
  if ((v4 & 4) != 0)
  {
    float learningRate = self->_learningRate;
    float v17 = -learningRate;
    if (learningRate >= 0.0) {
      float v17 = self->_learningRate;
    }
    float v18 = floorf(v17 + 0.5);
    float v19 = (float)(v17 - v18) * 1.8447e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  unint64_t v33 = v10;
  if ((v4 & 0x20) != 0)
  {
    uint64_t v20 = 2654435761 * self->_minIterations;
    if ((v4 & 0x100) != 0) {
      goto LABEL_41;
    }
LABEL_46:
    unint64_t v25 = 0;
    goto LABEL_49;
  }
  uint64_t v20 = 0;
  if ((v4 & 0x100) == 0) {
    goto LABEL_46;
  }
LABEL_41:
  float stoppingThreshold = self->_stoppingThreshold;
  float v22 = -stoppingThreshold;
  if (stoppingThreshold >= 0.0) {
    float v22 = self->_stoppingThreshold;
  }
  float v23 = floorf(v22 + 0.5);
  float v24 = (float)(v22 - v23) * 1.8447e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmodf(v23, 1.8447e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabsf(v24);
  }
LABEL_49:
  if ((v4 & 0x800) != 0)
  {
    uint64_t v26 = 2654435761 * self->_trainDataNumberOfPositiveSamples;
    if ((v4 & 0x1000) != 0)
    {
LABEL_51:
      uint64_t v27 = 2654435761 * self->_trainDataNumberOfSamples;
      if ((v4 & 0x400) != 0) {
        goto LABEL_52;
      }
LABEL_56:
      uint64_t v28 = 0;
      if ((v4 & 0x200) != 0) {
        goto LABEL_53;
      }
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((v4 & 0x1000) != 0) {
      goto LABEL_51;
    }
  }
  uint64_t v27 = 0;
  if ((v4 & 0x400) == 0) {
    goto LABEL_56;
  }
LABEL_52:
  uint64_t v28 = 2654435761 * self->_trainDataNumberOfDaysWithPositiveSamples;
  if ((v4 & 0x200) != 0)
  {
LABEL_53:
    uint64_t v29 = 2654435761 * self->_trainDataNumberOfCandidates;
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v29 = 0;
LABEL_58:
  NSUInteger v30 = [(NSString *)self->_executableType hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v31 = 2654435761 * self->_modelAgeInDays;
  }
  else {
    uint64_t v31 = 0;
  }
  return v44 ^ v45 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v15 ^ v20 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4 = (__int16 *)a3;
  float v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setBlendingABGroup:](self, "setBlendingABGroup:");
    __int16 v4 = v8;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setAbGroup:](self, "setAbGroup:");
    __int16 v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setClientModelId:](self, "setClientModelId:");
    __int16 v4 = v8;
  }
  int v5 = v4[58];
  if ((v5 & 0x80000000) == 0)
  {
    if ((v5 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_pipelineEnabled = *((unsigned char *)v4 + 114);
  *(_WORD *)&self->_has |= 0x8000u;
  LOWORD(v5) = v4[58];
  if ((v5 & 0x4000) != 0)
  {
LABEL_9:
    self->_hasTrainedModel = *((unsigned char *)v4 + 113);
    *(_WORD *)&self->_has |= 0x4000u;
    LOWORD(v5) = v4[58];
  }
LABEL_10:
  if ((v5 & 0x2000) != 0)
  {
    self->_hasDefaultHyperParams = *((unsigned char *)v4 + 112);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 10))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setModelType:](self, "setModelType:");
    __int16 v4 = v8;
  }
  __int16 v6 = v4[58];
  if (v6)
  {
    self->_avgNumberOfModelWeights = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
    __int16 v6 = v4[58];
    if ((v6 & 2) == 0)
    {
LABEL_16:
      if ((v6 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_16;
  }
  self->_avgNumberOfNonZeroModelWeights = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if ((v4[58] & 0x80) != 0)
  {
LABEL_17:
    self->_numberOfCandidateModels = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_18:
  if (*((void *)v4 + 8))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setLogisticRegressionRegularizationStrategy:](self, "setLogisticRegressionRegularizationStrategy:");
    __int16 v4 = v8;
  }
  __int16 v7 = v4[58];
  if ((v7 & 0x10) != 0)
  {
    self->_float logisticRegressionRegularizationRate = *((float *)v4 + 14);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v7 = v4[58];
    if ((v7 & 8) == 0)
    {
LABEL_22:
      if ((v7 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_42;
    }
  }
  else if ((v7 & 8) == 0)
  {
    goto LABEL_22;
  }
  self->_float logisticRegressionRegularizationL1Ratio = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 8u;
  __int16 v7 = v4[58];
  if ((v7 & 4) == 0)
  {
LABEL_23:
    if ((v7 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_float learningRate = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 4u;
  __int16 v7 = v4[58];
  if ((v7 & 0x20) == 0)
  {
LABEL_24:
    if ((v7 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_minIterations = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = v4[58];
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_float stoppingThreshold = *((float *)v4 + 23);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v7 = v4[58];
  if ((v7 & 0x800) == 0)
  {
LABEL_26:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_trainDataNumberOfPositiveSamples = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = v4[58];
  if ((v7 & 0x1000) == 0)
  {
LABEL_27:
    if ((v7 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_trainDataNumberOfSamples = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v7 = v4[58];
  if ((v7 & 0x400) == 0)
  {
LABEL_28:
    if ((v7 & 0x200) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_47:
  self->_trainDataNumberOfDaysWithPositiveSamples = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x400u;
  if ((v4[58] & 0x200) != 0)
  {
LABEL_29:
    self->_trainDataNumberOfCandidates = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_30:
  if (*((void *)v4 + 5))
  {
    -[ATXCandidateRelevanceModelPBModelMetrics setExecutableType:](self, "setExecutableType:");
    __int16 v4 = v8;
  }
  if ((v4[58] & 0x40) != 0)
  {
    self->_modelAgeInDays = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }
}

- (NSString)blendingABGroup
{
  return self->_blendingABGroup;
}

- (void)setBlendingABGroup:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (BOOL)pipelineEnabled
{
  return self->_pipelineEnabled;
}

- (BOOL)hasTrainedModel
{
  return self->_hasTrainedModel;
}

- (BOOL)hasDefaultHyperParams
{
  return self->_hasDefaultHyperParams;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
}

- (unsigned)avgNumberOfModelWeights
{
  return self->_avgNumberOfModelWeights;
}

- (unsigned)avgNumberOfNonZeroModelWeights
{
  return self->_avgNumberOfNonZeroModelWeights;
}

- (unsigned)numberOfCandidateModels
{
  return self->_numberOfCandidateModels;
}

- (NSString)logisticRegressionRegularizationStrategy
{
  return self->_logisticRegressionRegularizationStrategy;
}

- (void)setLogisticRegressionRegularizationStrategy:(id)a3
{
}

- (float)logisticRegressionRegularizationRate
{
  return self->_logisticRegressionRegularizationRate;
}

- (float)logisticRegressionRegularizationL1Ratio
{
  return self->_logisticRegressionRegularizationL1Ratio;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unsigned)minIterations
{
  return self->_minIterations;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (unsigned)trainDataNumberOfPositiveSamples
{
  return self->_trainDataNumberOfPositiveSamples;
}

- (unsigned)trainDataNumberOfSamples
{
  return self->_trainDataNumberOfSamples;
}

- (unsigned)trainDataNumberOfDaysWithPositiveSamples
{
  return self->_trainDataNumberOfDaysWithPositiveSamples;
}

- (unsigned)trainDataNumberOfCandidates
{
  return self->_trainDataNumberOfCandidates;
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
}

- (unsigned)modelAgeInDays
{
  return self->_modelAgeInDays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_logisticRegressionRegularizationStrategy, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_blendingABGroup, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end