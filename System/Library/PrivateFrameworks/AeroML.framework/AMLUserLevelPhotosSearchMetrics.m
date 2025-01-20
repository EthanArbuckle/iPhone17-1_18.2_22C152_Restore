@interface AMLUserLevelPhotosSearchMetrics
- (BOOL)hasCoverageDaily;
- (BOOL)hasCoverageWeekly;
- (BOOL)hasIsProductionModel;
- (BOOL)hasMetricDefinitionVersion;
- (BOOL)hasModelName;
- (BOOL)hasNdcgDaily;
- (BOOL)hasNdcgWeekly;
- (BOOL)hasTrialDeploymentId;
- (BOOL)hasTrialExperimentId;
- (BOOL)hasTrialTreatmentId;
- (BOOL)hasTtrDaily;
- (BOOL)hasTtrWeekly;
- (BOOL)hasUiSurface;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProductionModel;
- (BOOL)readFrom:(id)a3;
- (NSString)metricDefinitionVersion;
- (NSString)modelName;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (double)coverageDaily;
- (double)coverageWeekly;
- (double)ndcgDaily;
- (double)ndcgWeekly;
- (double)ttrDaily;
- (double)ttrWeekly;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)uiSurfaceAsString:(int)a3;
- (int)StringAsUiSurface:(id)a3;
- (int)uiSurface;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoverageDaily:(double)a3;
- (void)setCoverageWeekly:(double)a3;
- (void)setHasCoverageDaily:(BOOL)a3;
- (void)setHasCoverageWeekly:(BOOL)a3;
- (void)setHasIsProductionModel:(BOOL)a3;
- (void)setHasNdcgDaily:(BOOL)a3;
- (void)setHasNdcgWeekly:(BOOL)a3;
- (void)setHasTtrDaily:(BOOL)a3;
- (void)setHasTtrWeekly:(BOOL)a3;
- (void)setHasUiSurface:(BOOL)a3;
- (void)setIsProductionModel:(BOOL)a3;
- (void)setMetricDefinitionVersion:(id)a3;
- (void)setModelName:(id)a3;
- (void)setNdcgDaily:(double)a3;
- (void)setNdcgWeekly:(double)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)setTtrDaily:(double)a3;
- (void)setTtrWeekly:(double)a3;
- (void)setUiSurface:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMLUserLevelPhotosSearchMetrics

- (void)setIsProductionModel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isProductionModel = a3;
}

- (void)setHasIsProductionModel:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsProductionModel
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasModelName
{
  return self->_modelName != 0;
}

- (void)setTtrDaily:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_ttrDaily = a3;
}

- (void)setHasTtrDaily:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTtrDaily
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTtrWeekly:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_ttrWeekly = a3;
}

- (void)setHasTtrWeekly:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTtrWeekly
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCoverageDaily:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coverageDaily = a3;
}

- (void)setHasCoverageDaily:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoverageDaily
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCoverageWeekly:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_coverageWeekly = a3;
}

- (void)setHasCoverageWeekly:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCoverageWeekly
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNdcgDaily:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_ndcgDaily = a3;
}

- (void)setHasNdcgDaily:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNdcgDaily
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNdcgWeekly:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_ndcgWeekly = a3;
}

- (void)setHasNdcgWeekly:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNdcgWeekly
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasMetricDefinitionVersion
{
  return self->_metricDefinitionVersion != 0;
}

- (int)uiSurface
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_uiSurface;
  }
  else {
    return 0;
  }
}

- (void)setUiSurface:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_uiSurface = a3;
}

- (void)setHasUiSurface:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasUiSurface
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)uiSurfaceAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2652201A0[a3];
  }

  return v3;
}

- (int)StringAsUiSurface:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AMLUISurfaceTypeUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypeSpotlight"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypePhotosApp"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AMLUISurfaceTypeStoryTellingBackground"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTrialDeploymentId
{
  return self->_trialDeploymentId != 0;
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AMLUserLevelPhotosSearchMetrics;
  int v4 = [(AMLUserLevelPhotosSearchMetrics *)&v8 description];
  v5 = [(AMLUserLevelPhotosSearchMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    int v4 = [NSNumber numberWithBool:self->_isProductionModel];
    [v3 setObject:v4 forKey:@"isProductionModel"];
  }
  modelName = self->_modelName;
  if (modelName) {
    [v3 setObject:modelName forKey:@"modelName"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_ttrDaily];
    [v3 setObject:v11 forKey:@"ttrDaily"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithDouble:self->_ttrWeekly];
  [v3 setObject:v12 forKey:@"ttrWeekly"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = [NSNumber numberWithDouble:self->_coverageDaily];
  [v3 setObject:v13 forKey:@"coverageDaily"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = [NSNumber numberWithDouble:self->_coverageWeekly];
  [v3 setObject:v14 forKey:@"coverageWeekly"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  v15 = [NSNumber numberWithDouble:self->_ndcgDaily];
  [v3 setObject:v15 forKey:@"ndcgDaily"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    v7 = [NSNumber numberWithDouble:self->_ndcgWeekly];
    [v3 setObject:v7 forKey:@"ndcgWeekly"];
  }
LABEL_12:
  metricDefinitionVersion = self->_metricDefinitionVersion;
  if (metricDefinitionVersion) {
    [v3 setObject:metricDefinitionVersion forKey:@"metricDefinitionVersion"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t uiSurface = self->_uiSurface;
    if (uiSurface >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_uiSurface);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_2652201A0[uiSurface];
    }
    [v3 setObject:v10 forKey:@"uiSurface"];
  }
  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId) {
    [v3 setObject:trialDeploymentId forKey:@"trialDeploymentId"];
  }
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId) {
    [v3 setObject:trialExperimentId forKey:@"trialExperimentId"];
  }
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId) {
    [v3 setObject:trialTreatmentId forKey:@"trialTreatmentId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AMLUserLevelPhotosSearchMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_modelName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_metricDefinitionVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_trialDeploymentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_trialExperimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_trialTreatmentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v4[100] = self->_isProductionModel;
    v4[104] |= 0x80u;
  }
  id v6 = v4;
  if (self->_modelName)
  {
    objc_msgSend(v4, "setModelName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)v4 + 5) = *(void *)&self->_ttrDaily;
    v4[104] |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 6) = *(void *)&self->_ttrWeekly;
  v4[104] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v4 + 1) = *(void *)&self->_coverageDaily;
  v4[104] |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 2) = *(void *)&self->_coverageWeekly;
  v4[104] |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  *((void *)v4 + 3) = *(void *)&self->_ndcgDaily;
  v4[104] |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    *((void *)v4 + 4) = *(void *)&self->_ndcgWeekly;
    v4[104] |= 8u;
  }
LABEL_12:
  if (self->_metricDefinitionVersion)
  {
    objc_msgSend(v6, "setMetricDefinitionVersion:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 24) = self->_uiSurface;
    v4[104] |= 0x40u;
  }
  if (self->_trialDeploymentId)
  {
    objc_msgSend(v6, "setTrialDeploymentId:");
    id v4 = v6;
  }
  if (self->_trialExperimentId)
  {
    objc_msgSend(v6, "setTrialExperimentId:");
    id v4 = v6;
  }
  if (self->_trialTreatmentId)
  {
    objc_msgSend(v6, "setTrialTreatmentId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 100) = self->_isProductionModel;
    *(unsigned char *)(v5 + 104) |= 0x80u;
  }
  uint64_t v7 = [(NSString *)self->_modelName copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v6 + 40) = self->_ttrDaily;
    *(unsigned char *)(v6 + 104) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 48) = self->_ttrWeekly;
  *(unsigned char *)(v6 + 104) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v6 + 8) = self->_coverageDaily;
  *(unsigned char *)(v6 + 104) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v6 + 16) = self->_coverageWeekly;
  *(unsigned char *)(v6 + 104) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_17:
  *(double *)(v6 + 24) = self->_ndcgDaily;
  *(unsigned char *)(v6 + 104) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(double *)(v6 + 32) = self->_ndcgWeekly;
    *(unsigned char *)(v6 + 104) |= 8u;
  }
LABEL_10:
  uint64_t v10 = [(NSString *)self->_metricDefinitionVersion copyWithZone:a3];
  v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_uiSurface;
    *(unsigned char *)(v6 + 104) |= 0x40u;
  }
  uint64_t v12 = [(NSString *)self->_trialDeploymentId copyWithZone:a3];
  v13 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_trialExperimentId copyWithZone:a3];
  v15 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v14;

  uint64_t v16 = [(NSString *)self->_trialTreatmentId copyWithZone:a3];
  v17 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  $5E3C5A6893583B82D06FCB23CB312A5A has = self->_has;
  int v6 = v4[104];
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_58;
    }
    if (self->_isProductionModel)
    {
      if (!v4[100]) {
        goto LABEL_58;
      }
    }
    else if (v4[100])
    {
      goto LABEL_58;
    }
  }
  else if (v6 < 0)
  {
    goto LABEL_58;
  }
  modelName = self->_modelName;
  if ((unint64_t)modelName | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](modelName, "isEqual:")) {
      goto LABEL_58;
    }
    *(unsigned char *)&$5E3C5A6893583B82D06FCB23CB312A5A has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v4[104] & 0x10) == 0 || self->_ttrDaily != *((double *)v4 + 5)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v4[104] & 0x20) == 0 || self->_ttrWeekly != *((double *)v4 + 6)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    if ((v4[104] & 1) == 0 || self->_coverageDaily != *((double *)v4 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v4[104])
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v4[104] & 2) == 0 || self->_coverageWeekly != *((double *)v4 + 2)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v4[104] & 4) == 0 || self->_ndcgDaily != *((double *)v4 + 3)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v4[104] & 8) == 0 || self->_ndcgWeekly != *((double *)v4 + 4)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 8) != 0)
  {
    goto LABEL_58;
  }
  metricDefinitionVersion = self->_metricDefinitionVersion;
  if ((unint64_t)metricDefinitionVersion | *((void *)v4 + 7))
  {
    if (-[NSString isEqual:](metricDefinitionVersion, "isEqual:"))
    {
      *(unsigned char *)&$5E3C5A6893583B82D06FCB23CB312A5A has = self->_has;
      goto LABEL_47;
    }
LABEL_58:
    char v12 = 0;
    goto LABEL_59;
  }
LABEL_47:
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v4[104] & 0x40) == 0 || self->_uiSurface != *((_DWORD *)v4 + 24)) {
      goto LABEL_58;
    }
  }
  else if ((v4[104] & 0x40) != 0)
  {
    goto LABEL_58;
  }
  trialDeploymentId = self->_trialDeploymentId;
  if ((unint64_t)trialDeploymentId | *((void *)v4 + 9)
    && !-[NSString isEqual:](trialDeploymentId, "isEqual:"))
  {
    goto LABEL_58;
  }
  trialExperimentId = self->_trialExperimentId;
  if ((unint64_t)trialExperimentId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](trialExperimentId, "isEqual:")) {
      goto LABEL_58;
    }
  }
  trialTreatmentId = self->_trialTreatmentId;
  if ((unint64_t)trialTreatmentId | *((void *)v4 + 11)) {
    char v12 = -[NSString isEqual:](trialTreatmentId, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_59:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v41 = 2654435761 * self->_isProductionModel;
  }
  else {
    uint64_t v41 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_modelName hash];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    double ttrDaily = self->_ttrDaily;
    double v7 = -ttrDaily;
    if (ttrDaily >= 0.0) {
      double v7 = self->_ttrDaily;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double ttrWeekly = self->_ttrWeekly;
    double v12 = -ttrWeekly;
    if (ttrWeekly >= 0.0) {
      double v12 = self->_ttrWeekly;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (has)
  {
    double coverageDaily = self->_coverageDaily;
    double v17 = -coverageDaily;
    if (coverageDaily >= 0.0) {
      double v17 = self->_coverageDaily;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((has & 2) != 0)
  {
    double coverageWeekly = self->_coverageWeekly;
    double v22 = -coverageWeekly;
    if (coverageWeekly >= 0.0) {
      double v22 = self->_coverageWeekly;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  if ((has & 4) != 0)
  {
    double ndcgDaily = self->_ndcgDaily;
    double v27 = -ndcgDaily;
    if (ndcgDaily >= 0.0) {
      double v27 = self->_ndcgDaily;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  if ((has & 8) != 0)
  {
    double ndcgWeekly = self->_ndcgWeekly;
    double v32 = -ndcgWeekly;
    if (ndcgWeekly >= 0.0) {
      double v32 = self->_ndcgWeekly;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v30 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_metricDefinitionVersion hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v36 = 2654435761 * self->_uiSurface;
  }
  else {
    uint64_t v36 = 0;
  }
  NSUInteger v37 = v3 ^ v41 ^ v5 ^ v10 ^ v15 ^ v20 ^ v25 ^ v30 ^ v35;
  NSUInteger v38 = v36 ^ [(NSString *)self->_trialDeploymentId hash];
  NSUInteger v39 = v37 ^ v38 ^ [(NSString *)self->_trialExperimentId hash];
  return v39 ^ [(NSString *)self->_trialTreatmentId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (char *)a3;
  if (v4[104] < 0)
  {
    self->_isProductionModel = v4[100];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  int v6 = v4;
  if (*((void *)v4 + 8))
  {
    -[AMLUserLevelPhotosSearchMetrics setModelName:](self, "setModelName:");
    id v4 = v6;
  }
  char v5 = v4[104];
  if ((v5 & 0x10) != 0)
  {
    self->_double ttrDaily = *((double *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = v4[104];
    if ((v5 & 0x20) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
  }
  else if ((v4[104] & 0x20) == 0)
  {
    goto LABEL_7;
  }
  self->_double ttrWeekly = *((double *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = v4[104];
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double coverageDaily = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = v4[104];
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double coverageWeekly = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = v4[104];
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_29:
  self->_double ndcgDaily = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[104] & 8) != 0)
  {
LABEL_11:
    self->_double ndcgWeekly = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  if (*((void *)v4 + 7))
  {
    -[AMLUserLevelPhotosSearchMetrics setMetricDefinitionVersion:](self, "setMetricDefinitionVersion:");
    id v4 = v6;
  }
  if ((v4[104] & 0x40) != 0)
  {
    self->_uint64_t uiSurface = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 9))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialDeploymentId:](self, "setTrialDeploymentId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialExperimentId:](self, "setTrialExperimentId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 11))
  {
    -[AMLUserLevelPhotosSearchMetrics setTrialTreatmentId:](self, "setTrialTreatmentId:");
    id v4 = v6;
  }
}

- (BOOL)isProductionModel
{
  return self->_isProductionModel;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (double)ttrDaily
{
  return self->_ttrDaily;
}

- (double)ttrWeekly
{
  return self->_ttrWeekly;
}

- (double)coverageDaily
{
  return self->_coverageDaily;
}

- (double)coverageWeekly
{
  return self->_coverageWeekly;
}

- (double)ndcgDaily
{
  return self->_ndcgDaily;
}

- (double)ndcgWeekly
{
  return self->_ndcgWeekly;
}

- (NSString)metricDefinitionVersion
{
  return self->_metricDefinitionVersion;
}

- (void)setMetricDefinitionVersion:(id)a3
{
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_metricDefinitionVersion, 0);
}

@end