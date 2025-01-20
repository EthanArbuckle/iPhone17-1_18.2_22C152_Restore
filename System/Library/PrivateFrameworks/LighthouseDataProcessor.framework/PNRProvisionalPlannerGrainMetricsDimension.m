@interface PNRProvisionalPlannerGrainMetricsDimension
- (BOOL)hasActionResolverRequestToLastResolverEventTime;
- (BOOL)hasFailureInfo;
- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime;
- (BOOL)hasLastResolverEventToResponseGeneratedTime;
- (BOOL)hasNumActionResolverRequests;
- (BOOL)hasNumClientActionCreated;
- (BOOL)hasNumCriticalErrors;
- (BOOL)hasNumPlansCreated;
- (BOOL)hasNumQueriesCreated;
- (BOOL)hasNumQueriesExecuted;
- (BOOL)hasNumStatementEvaluatedFromPlanner;
- (BOOL)hasNumSystemPromptResolved;
- (BOOL)hasPlanCreatedToActionResolverRequestTime;
- (BOOL)hasPlanCreatedToLastResolverEventTime;
- (BOOL)hasPlanCreatedToResolutionTime;
- (BOOL)hasPlanCreatedToResolverRequestTime;
- (BOOL)hasPlannerGrainStage;
- (BOOL)hasPlannerResponseTime;
- (BOOL)hasPlanningStep;
- (BOOL)hasResolutionToResponseGeneratedTime;
- (BOOL)hasResolverFirstSystemPromptToResolutionTime;
- (BOOL)hasResolverRequestToResolutionTime;
- (BOOL)hasResolverTotalClientActionTime;
- (BOOL)hasResolverTotalQueryTime;
- (BOOL)hasStartToActionResolverRequestTime;
- (BOOL)hasStartToContextRetrievedTime;
- (BOOL)hasStartToEntitySpanMatchedTime;
- (BOOL)hasStartToLastQueryDecorationEventTime;
- (BOOL)hasStartToLastResolverEventTime;
- (BOOL)hasStartToPlanCreatedTime;
- (BOOL)hasStartToToolsRetrievedTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)plannerGrainStage;
- (NSString)planningStep;
- (PNRProvisionalMetrics)actionResolverRequestToLastResolverEventTime;
- (PNRProvisionalMetrics)lastQueryDecorationEventToPlanCreatedTime;
- (PNRProvisionalMetrics)lastResolverEventToResponseGeneratedTime;
- (PNRProvisionalMetrics)planCreatedToActionResolverRequestTime;
- (PNRProvisionalMetrics)planCreatedToLastResolverEventTime;
- (PNRProvisionalMetrics)planCreatedToResolutionTime;
- (PNRProvisionalMetrics)planCreatedToResolverRequestTime;
- (PNRProvisionalMetrics)plannerResponseTime;
- (PNRProvisionalMetrics)resolutionToResponseGeneratedTime;
- (PNRProvisionalMetrics)resolverFirstSystemPromptToResolutionTime;
- (PNRProvisionalMetrics)resolverRequestToResolutionTime;
- (PNRProvisionalMetrics)resolverTotalClientActionTime;
- (PNRProvisionalMetrics)resolverTotalQueryTime;
- (PNRProvisionalMetrics)startToActionResolverRequestTime;
- (PNRProvisionalMetrics)startToContextRetrievedTime;
- (PNRProvisionalMetrics)startToEntitySpanMatchedTime;
- (PNRProvisionalMetrics)startToLastQueryDecorationEventTime;
- (PNRProvisionalMetrics)startToLastResolverEventTime;
- (PNRProvisionalMetrics)startToPlanCreatedTime;
- (PNRProvisionalMetrics)startToToolsRetrievedTime;
- (PNRProvisionalPlannerGrainMetricsDimension)initWithDictionary:(id)a3;
- (PNRProvisionalPlannerGrainMetricsDimension)initWithJSON:(id)a3;
- (PNRProvisionalSageFailureInfo)failureInfo;
- (id)dictionaryRepresentation;
- (int)numActionResolverRequests;
- (int)numClientActionCreated;
- (int)numCriticalErrors;
- (int)numPlansCreated;
- (int)numQueriesCreated;
- (int)numQueriesExecuted;
- (int)numStatementEvaluatedFromPlanner;
- (int)numSystemPromptResolved;
- (unint64_t)hash;
- (void)deleteActionResolverRequestToLastResolverEventTime;
- (void)deleteFailureInfo;
- (void)deleteLastQueryDecorationEventToPlanCreatedTime;
- (void)deleteLastResolverEventToResponseGeneratedTime;
- (void)deleteNumActionResolverRequests;
- (void)deleteNumClientActionCreated;
- (void)deleteNumCriticalErrors;
- (void)deleteNumPlansCreated;
- (void)deleteNumQueriesCreated;
- (void)deleteNumQueriesExecuted;
- (void)deleteNumStatementEvaluatedFromPlanner;
- (void)deleteNumSystemPromptResolved;
- (void)deletePlanCreatedToActionResolverRequestTime;
- (void)deletePlanCreatedToLastResolverEventTime;
- (void)deletePlanCreatedToResolutionTime;
- (void)deletePlanCreatedToResolverRequestTime;
- (void)deletePlannerGrainStage;
- (void)deletePlannerResponseTime;
- (void)deletePlanningStep;
- (void)deleteResolutionToResponseGeneratedTime;
- (void)deleteResolverFirstSystemPromptToResolutionTime;
- (void)deleteResolverRequestToResolutionTime;
- (void)deleteResolverTotalClientActionTime;
- (void)deleteResolverTotalQueryTime;
- (void)deleteStartToActionResolverRequestTime;
- (void)deleteStartToContextRetrievedTime;
- (void)deleteStartToEntitySpanMatchedTime;
- (void)deleteStartToLastQueryDecorationEventTime;
- (void)deleteStartToLastResolverEventTime;
- (void)deleteStartToPlanCreatedTime;
- (void)deleteStartToToolsRetrievedTime;
- (void)setActionResolverRequestToLastResolverEventTime:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3;
- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3;
- (void)setHasNumActionResolverRequests:(BOOL)a3;
- (void)setHasNumClientActionCreated:(BOOL)a3;
- (void)setHasNumCriticalErrors:(BOOL)a3;
- (void)setHasNumPlansCreated:(BOOL)a3;
- (void)setHasNumQueriesCreated:(BOOL)a3;
- (void)setHasNumQueriesExecuted:(BOOL)a3;
- (void)setHasNumStatementEvaluatedFromPlanner:(BOOL)a3;
- (void)setHasNumSystemPromptResolved:(BOOL)a3;
- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3;
- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3;
- (void)setHasPlanCreatedToResolutionTime:(BOOL)a3;
- (void)setHasPlanCreatedToResolverRequestTime:(BOOL)a3;
- (void)setHasPlannerGrainStage:(BOOL)a3;
- (void)setHasPlannerResponseTime:(BOOL)a3;
- (void)setHasPlanningStep:(BOOL)a3;
- (void)setHasResolutionToResponseGeneratedTime:(BOOL)a3;
- (void)setHasResolverFirstSystemPromptToResolutionTime:(BOOL)a3;
- (void)setHasResolverRequestToResolutionTime:(BOOL)a3;
- (void)setHasResolverTotalClientActionTime:(BOOL)a3;
- (void)setHasResolverTotalQueryTime:(BOOL)a3;
- (void)setHasStartToActionResolverRequestTime:(BOOL)a3;
- (void)setHasStartToContextRetrievedTime:(BOOL)a3;
- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3;
- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3;
- (void)setHasStartToLastResolverEventTime:(BOOL)a3;
- (void)setHasStartToPlanCreatedTime:(BOOL)a3;
- (void)setHasStartToToolsRetrievedTime:(BOOL)a3;
- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3;
- (void)setLastResolverEventToResponseGeneratedTime:(id)a3;
- (void)setNumActionResolverRequests:(int)a3;
- (void)setNumClientActionCreated:(int)a3;
- (void)setNumCriticalErrors:(int)a3;
- (void)setNumPlansCreated:(int)a3;
- (void)setNumQueriesCreated:(int)a3;
- (void)setNumQueriesExecuted:(int)a3;
- (void)setNumStatementEvaluatedFromPlanner:(int)a3;
- (void)setNumSystemPromptResolved:(int)a3;
- (void)setPlanCreatedToActionResolverRequestTime:(id)a3;
- (void)setPlanCreatedToLastResolverEventTime:(id)a3;
- (void)setPlanCreatedToResolutionTime:(id)a3;
- (void)setPlanCreatedToResolverRequestTime:(id)a3;
- (void)setPlannerGrainStage:(id)a3;
- (void)setPlannerResponseTime:(id)a3;
- (void)setPlanningStep:(id)a3;
- (void)setResolutionToResponseGeneratedTime:(id)a3;
- (void)setResolverFirstSystemPromptToResolutionTime:(id)a3;
- (void)setResolverRequestToResolutionTime:(id)a3;
- (void)setResolverTotalClientActionTime:(id)a3;
- (void)setResolverTotalQueryTime:(id)a3;
- (void)setStartToActionResolverRequestTime:(id)a3;
- (void)setStartToContextRetrievedTime:(id)a3;
- (void)setStartToEntitySpanMatchedTime:(id)a3;
- (void)setStartToLastQueryDecorationEventTime:(id)a3;
- (void)setStartToLastResolverEventTime:(id)a3;
- (void)setStartToPlanCreatedTime:(id)a3;
- (void)setStartToToolsRetrievedTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRProvisionalPlannerGrainMetricsDimension

- (BOOL)hasPlanningStep
{
  return self->_planningStep != 0;
}

- (void)deletePlanningStep
{
}

- (void)setNumQueriesCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numQueriesCreated = a3;
}

- (BOOL)hasNumQueriesCreated
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasNumQueriesCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteNumQueriesCreated
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setNumQueriesExecuted:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numQueriesExecuted = a3;
}

- (BOOL)hasNumQueriesExecuted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumQueriesExecuted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteNumQueriesExecuted
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setNumClientActionCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numClientActionCreated = a3;
}

- (BOOL)hasNumClientActionCreated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumClientActionCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)deleteNumClientActionCreated
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setNumSystemPromptResolved:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numSystemPromptResolved = a3;
}

- (BOOL)hasNumSystemPromptResolved
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumSystemPromptResolved:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)deleteNumSystemPromptResolved
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (BOOL)hasPlannerResponseTime
{
  return self->_plannerResponseTime != 0;
}

- (void)deletePlannerResponseTime
{
}

- (BOOL)hasStartToPlanCreatedTime
{
  return self->_startToPlanCreatedTime != 0;
}

- (void)deleteStartToPlanCreatedTime
{
}

- (BOOL)hasStartToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime != 0;
}

- (void)deleteStartToLastQueryDecorationEventTime
{
}

- (BOOL)hasLastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime != 0;
}

- (void)deleteLastQueryDecorationEventToPlanCreatedTime
{
}

- (BOOL)hasPlanCreatedToResolutionTime
{
  return self->_planCreatedToResolutionTime != 0;
}

- (void)deletePlanCreatedToResolutionTime
{
}

- (BOOL)hasResolutionToResponseGeneratedTime
{
  return self->_resolutionToResponseGeneratedTime != 0;
}

- (void)deleteResolutionToResponseGeneratedTime
{
}

- (BOOL)hasStartToContextRetrievedTime
{
  return self->_startToContextRetrievedTime != 0;
}

- (void)deleteStartToContextRetrievedTime
{
}

- (BOOL)hasStartToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime != 0;
}

- (void)deleteStartToToolsRetrievedTime
{
}

- (BOOL)hasStartToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime != 0;
}

- (void)deleteStartToEntitySpanMatchedTime
{
}

- (BOOL)hasPlanCreatedToResolverRequestTime
{
  return self->_planCreatedToResolverRequestTime != 0;
}

- (void)deletePlanCreatedToResolverRequestTime
{
}

- (BOOL)hasResolverRequestToResolutionTime
{
  return self->_resolverRequestToResolutionTime != 0;
}

- (void)deleteResolverRequestToResolutionTime
{
}

- (BOOL)hasResolverTotalQueryTime
{
  return self->_resolverTotalQueryTime != 0;
}

- (void)deleteResolverTotalQueryTime
{
}

- (BOOL)hasResolverTotalClientActionTime
{
  return self->_resolverTotalClientActionTime != 0;
}

- (void)deleteResolverTotalClientActionTime
{
}

- (BOOL)hasResolverFirstSystemPromptToResolutionTime
{
  return self->_resolverFirstSystemPromptToResolutionTime != 0;
}

- (void)deleteResolverFirstSystemPromptToResolutionTime
{
}

- (void)setNumPlansCreated:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numPlansCreated = a3;
}

- (BOOL)hasNumPlansCreated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumPlansCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)deleteNumPlansCreated
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setNumActionResolverRequests:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numActionResolverRequests = a3;
}

- (BOOL)hasNumActionResolverRequests
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasNumActionResolverRequests:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)deleteNumActionResolverRequests
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setNumStatementEvaluatedFromPlanner:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_numStatementEvaluatedFromPlanner = a3;
}

- (BOOL)hasNumStatementEvaluatedFromPlanner
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasNumStatementEvaluatedFromPlanner:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)deleteNumStatementEvaluatedFromPlanner
{
  *(unsigned char *)&self->_has &= ~0x40u;
}

- (void)setNumCriticalErrors:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_numCriticalErrors = a3;
}

- (BOOL)hasNumCriticalErrors
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasNumCriticalErrors:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)deleteNumCriticalErrors
{
  *(unsigned char *)&self->_has &= ~0x80u;
}

- (BOOL)hasStartToLastResolverEventTime
{
  return self->_startToLastResolverEventTime != 0;
}

- (void)deleteStartToLastResolverEventTime
{
}

- (BOOL)hasStartToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime != 0;
}

- (void)deleteStartToActionResolverRequestTime
{
}

- (BOOL)hasLastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime != 0;
}

- (void)deleteLastResolverEventToResponseGeneratedTime
{
}

- (BOOL)hasActionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime != 0;
}

- (void)deleteActionResolverRequestToLastResolverEventTime
{
}

- (BOOL)hasPlanCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime != 0;
}

- (void)deletePlanCreatedToLastResolverEventTime
{
}

- (BOOL)hasPlanCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime != 0;
}

- (void)deletePlanCreatedToActionResolverRequestTime
{
}

- (BOOL)hasPlannerGrainStage
{
  return self->_plannerGrainStage != 0;
}

- (void)deletePlannerGrainStage
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteFailureInfo
{
}

- (BOOL)readFrom:(id)a3
{
  return PNRProvisionalPlannerGrainMetricsDimensionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v51 = a3;
  v4 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planningStep];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
  v6 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];

  if (v6)
  {
    v7 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];

  if (v8)
  {
    v9 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];

  if (v10)
  {
    v11 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];
    PBDataWriterWriteSubmessage();
  }
  v12 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];

  if (v12)
  {
    v13 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];

  if (v14)
  {
    v15 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];

  if (v16)
  {
    v17 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];

  if (v18)
  {
    v19 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];

  if (v20)
  {
    v21 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];
    PBDataWriterWriteSubmessage();
  }
  v22 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];

  if (v22)
  {
    v23 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];
    PBDataWriterWriteSubmessage();
  }
  v24 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];

  if (v24)
  {
    v25 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];
    PBDataWriterWriteSubmessage();
  }
  v26 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];

  if (v26)
  {
    v27 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];
    PBDataWriterWriteSubmessage();
  }
  v28 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];

  if (v28)
  {
    v29 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];

  if (v30)
  {
    v31 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];
    PBDataWriterWriteSubmessage();
  }
  v32 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];

  if (v32)
  {
    v33 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];
    PBDataWriterWriteSubmessage();
  }
  char v34 = (char)self->_has;
  if ((v34 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v34 = (char)self->_has;
    if ((v34 & 0x20) == 0)
    {
LABEL_38:
      if ((v34 & 0x40) == 0) {
        goto LABEL_39;
      }
LABEL_65:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_40;
      }
      goto LABEL_66;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteInt32Field();
  char v34 = (char)self->_has;
  if ((v34 & 0x40) != 0) {
    goto LABEL_65;
  }
LABEL_39:
  if ((v34 & 0x80) == 0) {
    goto LABEL_40;
  }
LABEL_66:
  PBDataWriterWriteInt32Field();
LABEL_40:
  v35 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];

  if (v35)
  {
    v36 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  v37 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];

  if (v37)
  {
    v38 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];
    PBDataWriterWriteSubmessage();
  }
  v39 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];

  if (v39)
  {
    v40 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];
    PBDataWriterWriteSubmessage();
  }
  v41 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];

  if (v41)
  {
    v42 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  v43 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];

  if (v43)
  {
    v44 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];
    PBDataWriterWriteSubmessage();
  }
  v45 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];

  if (v45)
  {
    v46 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];
    PBDataWriterWriteSubmessage();
  }
  v47 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerGrainStage];

  if (v47) {
    PBDataWriterWriteStringField();
  }
  v48 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];

  v49 = v51;
  if (v48)
  {
    v50 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];
    PBDataWriterWriteSubmessage();

    v49 = v51;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_147;
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planningStep];
  v6 = [v4 planningStep];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v7 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planningStep];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planningStep];
    v10 = [v4 planningStep];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  $953F8AC6BAE7205F228116AF38C4AAF6 has = self->_has;
  unsigned int v13 = v4[224];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_147;
  }
  if (*(unsigned char *)&has)
  {
    int numQueriesCreated = self->_numQueriesCreated;
    if (numQueriesCreated != [v4 numQueriesCreated]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 has = self->_has;
    unsigned int v13 = v4[224];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_147;
  }
  if (v15)
  {
    int numQueriesExecuted = self->_numQueriesExecuted;
    if (numQueriesExecuted != [v4 numQueriesExecuted]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 has = self->_has;
    unsigned int v13 = v4[224];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v13 >> 2) & 1)) {
    goto LABEL_147;
  }
  if (v17)
  {
    int numClientActionCreated = self->_numClientActionCreated;
    if (numClientActionCreated != [v4 numClientActionCreated]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 has = self->_has;
    unsigned int v13 = v4[224];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v13 >> 3) & 1)) {
    goto LABEL_147;
  }
  if (v19)
  {
    int numSystemPromptResolved = self->_numSystemPromptResolved;
    if (numSystemPromptResolved != [v4 numSystemPromptResolved]) {
      goto LABEL_147;
    }
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];
  v6 = [v4 plannerResponseTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v21 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];
    v24 = [v4 plannerResponseTime];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];
  v6 = [v4 startToPlanCreatedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v26 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];
    v29 = [v4 startToPlanCreatedTime];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];
  v6 = [v4 startToLastQueryDecorationEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v31 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];
    char v34 = [v4 startToLastQueryDecorationEventTime];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];
  v6 = [v4 lastQueryDecorationEventToPlanCreatedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v36 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];
    v39 = [v4 lastQueryDecorationEventToPlanCreatedTime];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];
  v6 = [v4 planCreatedToResolutionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v41 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];
    v44 = [v4 planCreatedToResolutionTime];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];
  v6 = [v4 resolutionToResponseGeneratedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v46 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];
  if (v46)
  {
    v47 = (void *)v46;
    v48 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];
    v49 = [v4 resolutionToResponseGeneratedTime];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];
  v6 = [v4 startToContextRetrievedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v51 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];
    v54 = [v4 startToContextRetrievedTime];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];
  v6 = [v4 startToToolsRetrievedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v56 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];
    v59 = [v4 startToToolsRetrievedTime];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];
  v6 = [v4 startToEntitySpanMatchedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v61 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];
    v64 = [v4 startToEntitySpanMatchedTime];
    int v65 = [v63 isEqual:v64];

    if (!v65) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];
  v6 = [v4 planCreatedToResolverRequestTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v66 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];
  if (v66)
  {
    v67 = (void *)v66;
    v68 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];
    v69 = [v4 planCreatedToResolverRequestTime];
    int v70 = [v68 isEqual:v69];

    if (!v70) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];
  v6 = [v4 resolverRequestToResolutionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v71 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];
    v74 = [v4 resolverRequestToResolutionTime];
    int v75 = [v73 isEqual:v74];

    if (!v75) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];
  v6 = [v4 resolverTotalQueryTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v76 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];
  if (v76)
  {
    v77 = (void *)v76;
    v78 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];
    v79 = [v4 resolverTotalQueryTime];
    int v80 = [v78 isEqual:v79];

    if (!v80) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];
  v6 = [v4 resolverTotalClientActionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v81 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];
  if (v81)
  {
    v82 = (void *)v81;
    v83 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];
    v84 = [v4 resolverTotalClientActionTime];
    int v85 = [v83 isEqual:v84];

    if (!v85) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];
  v6 = [v4 resolverFirstSystemPromptToResolutionTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v86 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];
  if (v86)
  {
    v87 = (void *)v86;
    v88 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];
    v89 = [v4 resolverFirstSystemPromptToResolutionTime];
    int v90 = [v88 isEqual:v89];

    if (!v90) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  $953F8AC6BAE7205F228116AF38C4AAF6 v91 = self->_has;
  int v92 = (*(unsigned int *)&v91 >> 4) & 1;
  unsigned int v93 = v4[224];
  if (v92 != ((v93 >> 4) & 1)) {
    goto LABEL_147;
  }
  if (v92)
  {
    int numPlansCreated = self->_numPlansCreated;
    if (numPlansCreated != [v4 numPlansCreated]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 v91 = self->_has;
    unsigned int v93 = v4[224];
  }
  int v95 = (*(unsigned int *)&v91 >> 5) & 1;
  if (v95 != ((v93 >> 5) & 1)) {
    goto LABEL_147;
  }
  if (v95)
  {
    int numActionResolverRequests = self->_numActionResolverRequests;
    if (numActionResolverRequests != [v4 numActionResolverRequests]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 v91 = self->_has;
    unsigned int v93 = v4[224];
  }
  int v97 = (*(unsigned int *)&v91 >> 6) & 1;
  if (v97 != ((v93 >> 6) & 1)) {
    goto LABEL_147;
  }
  if (v97)
  {
    int numStatementEvaluatedFromPlanner = self->_numStatementEvaluatedFromPlanner;
    if (numStatementEvaluatedFromPlanner != [v4 numStatementEvaluatedFromPlanner]) {
      goto LABEL_147;
    }
    $953F8AC6BAE7205F228116AF38C4AAF6 v91 = self->_has;
    unsigned int v93 = v4[224];
  }
  if (((v93 ^ *(_DWORD *)&v91) & 0x80) != 0) {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&v91 & 0x80) != 0)
  {
    int numCriticalErrors = self->_numCriticalErrors;
    if (numCriticalErrors != [v4 numCriticalErrors]) {
      goto LABEL_147;
    }
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];
  v6 = [v4 startToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v100 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];
  if (v100)
  {
    v101 = (void *)v100;
    v102 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];
    v103 = [v4 startToLastResolverEventTime];
    int v104 = [v102 isEqual:v103];

    if (!v104) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];
  v6 = [v4 startToActionResolverRequestTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v105 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];
  if (v105)
  {
    v106 = (void *)v105;
    v107 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];
    v108 = [v4 startToActionResolverRequestTime];
    int v109 = [v107 isEqual:v108];

    if (!v109) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];
  v6 = [v4 lastResolverEventToResponseGeneratedTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v110 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];
  if (v110)
  {
    v111 = (void *)v110;
    v112 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];
    v113 = [v4 lastResolverEventToResponseGeneratedTime];
    int v114 = [v112 isEqual:v113];

    if (!v114) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];
  v6 = [v4 actionResolverRequestToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v115 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];
  if (v115)
  {
    v116 = (void *)v115;
    v117 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];
    v118 = [v4 actionResolverRequestToLastResolverEventTime];
    int v119 = [v117 isEqual:v118];

    if (!v119) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];
  v6 = [v4 planCreatedToLastResolverEventTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v120 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];
  if (v120)
  {
    v121 = (void *)v120;
    v122 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];
    v123 = [v4 planCreatedToLastResolverEventTime];
    int v124 = [v122 isEqual:v123];

    if (!v124) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];
  v6 = [v4 planCreatedToActionResolverRequestTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v125 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];
  if (v125)
  {
    v126 = (void *)v125;
    v127 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];
    v128 = [v4 planCreatedToActionResolverRequestTime];
    int v129 = [v127 isEqual:v128];

    if (!v129) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerGrainStage];
  v6 = [v4 plannerGrainStage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_146;
  }
  uint64_t v130 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerGrainStage];
  if (v130)
  {
    v131 = (void *)v130;
    v132 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerGrainStage];
    v133 = [v4 plannerGrainStage];
    int v134 = [v132 isEqual:v133];

    if (!v134) {
      goto LABEL_147;
    }
  }
  else
  {
  }
  v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];
  v6 = [v4 failureInfo];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_146:

    goto LABEL_147;
  }
  uint64_t v135 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];
  if (!v135)
  {

LABEL_150:
    BOOL v140 = 1;
    goto LABEL_148;
  }
  v136 = (void *)v135;
  v137 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];
  v138 = [v4 failureInfo];
  char v139 = [v137 isEqual:v138];

  if (v139) {
    goto LABEL_150;
  }
LABEL_147:
  BOOL v140 = 0;
LABEL_148:

  return v140;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_planningStep hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_numQueriesCreated;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_numQueriesExecuted;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_numClientActionCreated;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  uint64_t v37 = v4;
  NSUInteger v38 = v3;
  uint64_t v35 = v6;
  uint64_t v36 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v7 = [(PNRProvisionalMetrics *)self->_plannerResponseTime hash];
  }
  else {
    unint64_t v7 = [(PNRProvisionalMetrics *)self->_plannerResponseTime hash];
  }
  unint64_t v34 = v7;
  unint64_t v32 = [(PNRProvisionalMetrics *)self->_startToPlanCreatedTime hash];
  unint64_t v8 = [(PNRProvisionalMetrics *)self->_startToLastQueryDecorationEventTime hash];
  unint64_t v9 = [(PNRProvisionalMetrics *)self->_lastQueryDecorationEventToPlanCreatedTime hash];
  unint64_t v10 = [(PNRProvisionalMetrics *)self->_planCreatedToResolutionTime hash];
  unint64_t v11 = [(PNRProvisionalMetrics *)self->_resolutionToResponseGeneratedTime hash];
  unint64_t v12 = [(PNRProvisionalMetrics *)self->_startToContextRetrievedTime hash];
  unint64_t v13 = [(PNRProvisionalMetrics *)self->_startToToolsRetrievedTime hash];
  unint64_t v31 = [(PNRProvisionalMetrics *)self->_startToEntitySpanMatchedTime hash];
  unint64_t v33 = [(PNRProvisionalMetrics *)self->_planCreatedToResolverRequestTime hash];
  unint64_t v14 = [(PNRProvisionalMetrics *)self->_resolverRequestToResolutionTime hash];
  unint64_t v15 = [(PNRProvisionalMetrics *)self->_resolverTotalQueryTime hash];
  unint64_t v16 = [(PNRProvisionalMetrics *)self->_resolverTotalClientActionTime hash];
  unint64_t v17 = [(PNRProvisionalMetrics *)self->_resolverFirstSystemPromptToResolutionTime hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v18 = 2654435761 * self->_numPlansCreated;
  }
  else {
    uint64_t v18 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v20 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    uint64_t v21 = 0;
    goto LABEL_22;
  }
  uint64_t v19 = 2654435761 * self->_numActionResolverRequests;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v20 = 2654435761 * self->_numStatementEvaluatedFromPlanner;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  uint64_t v21 = 2654435761 * self->_numCriticalErrors;
LABEL_22:
  unint64_t v22 = v37 ^ v38 ^ v36 ^ v35 ^ v30 ^ v34 ^ v32 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v31 ^ v33 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ [(PNRProvisionalMetrics *)self->_startToLastResolverEventTime hash];
  unint64_t v23 = [(PNRProvisionalMetrics *)self->_startToActionResolverRequestTime hash];
  unint64_t v24 = v23 ^ [(PNRProvisionalMetrics *)self->_lastResolverEventToResponseGeneratedTime hash];
  unint64_t v25 = v24 ^ [(PNRProvisionalMetrics *)self->_actionResolverRequestToLastResolverEventTime hash];
  unint64_t v26 = v25 ^ [(PNRProvisionalMetrics *)self->_planCreatedToLastResolverEventTime hash];
  unint64_t v27 = v26 ^ [(PNRProvisionalMetrics *)self->_planCreatedToActionResolverRequestTime hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_plannerGrainStage hash];
  return v22 ^ v28 ^ [(PNRProvisionalSageFailureInfo *)self->_failureInfo hash];
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_actionResolverRequestToLastResolverEventTime)
  {
    uint64_t v4 = [(PNRProvisionalPlannerGrainMetricsDimension *)self actionResolverRequestToLastResolverEventTime];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    }
  }
  if (self->_failureInfo)
  {
    unint64_t v7 = [(PNRProvisionalPlannerGrainMetricsDimension *)self failureInfo];
    unint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      unint64_t v9 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v9 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_lastQueryDecorationEventToPlanCreatedTime)
  {
    unint64_t v10 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastQueryDecorationEventToPlanCreatedTime];
    unint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    }
    else
    {
      unint64_t v12 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v12 forKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    }
  }
  if (self->_lastResolverEventToResponseGeneratedTime)
  {
    unint64_t v13 = [(PNRProvisionalPlannerGrainMetricsDimension *)self lastResolverEventToResponseGeneratedTime];
    unint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    }
    else
    {
      unint64_t v15 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v15 forKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numActionResolverRequests](self, "numActionResolverRequests"));
    [v3 setObject:v20 forKeyedSubscript:@"numActionResolverRequests"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 0x80) == 0) {
        goto LABEL_24;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numClientActionCreated](self, "numClientActionCreated"));
  [v3 setObject:v21 forKeyedSubscript:@"numClientActionCreated"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_24:
    if ((has & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v22 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numCriticalErrors](self, "numCriticalErrors"));
  [v3 setObject:v22 forKeyedSubscript:@"numCriticalErrors"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_25:
    if ((has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numPlansCreated](self, "numPlansCreated"));
  [v3 setObject:v23 forKeyedSubscript:@"numPlansCreated"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_26:
    if ((has & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numQueriesCreated](self, "numQueriesCreated"));
  [v3 setObject:v24 forKeyedSubscript:@"numQueriesCreated"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_27:
    if ((has & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v25 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numQueriesExecuted](self, "numQueriesExecuted"));
  [v3 setObject:v25 forKeyedSubscript:@"numQueriesExecuted"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_28:
    if ((has & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_39:
  unint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numStatementEvaluatedFromPlanner](self, "numStatementEvaluatedFromPlanner"));
  [v3 setObject:v26 forKeyedSubscript:@"numStatementEvaluatedFromPlanner"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_29:
    unint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", -[PNRProvisionalPlannerGrainMetricsDimension numSystemPromptResolved](self, "numSystemPromptResolved"));
    [v3 setObject:v17 forKeyedSubscript:@"numSystemPromptResolved"];
  }
LABEL_30:
  if (self->_planCreatedToActionResolverRequestTime)
  {
    uint64_t v18 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToActionResolverRequestTime];
    uint64_t v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"planCreatedToActionResolverRequestTime"];
    }
    else
    {
      unint64_t v27 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v27 forKeyedSubscript:@"planCreatedToActionResolverRequestTime"];
    }
  }
  if (self->_planCreatedToLastResolverEventTime)
  {
    NSUInteger v28 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToLastResolverEventTime];
    v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v30 forKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    }
  }
  if (self->_planCreatedToResolutionTime)
  {
    unint64_t v31 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolutionTime];
    unint64_t v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"planCreatedToResolutionTime"];
    }
    else
    {
      unint64_t v33 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v33 forKeyedSubscript:@"planCreatedToResolutionTime"];
    }
  }
  if (self->_planCreatedToResolverRequestTime)
  {
    unint64_t v34 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planCreatedToResolverRequestTime];
    uint64_t v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"planCreatedToResolverRequestTime"];
    }
    else
    {
      uint64_t v36 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v36 forKeyedSubscript:@"planCreatedToResolverRequestTime"];
    }
  }
  if (self->_plannerGrainStage)
  {
    uint64_t v37 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerGrainStage];
    NSUInteger v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"plannerGrainStage"];
  }
  if (self->_plannerResponseTime)
  {
    v39 = [(PNRProvisionalPlannerGrainMetricsDimension *)self plannerResponseTime];
    int v40 = [v39 dictionaryRepresentation];
    if (v40)
    {
      [v3 setObject:v40 forKeyedSubscript:@"plannerResponseTime"];
    }
    else
    {
      uint64_t v41 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v41 forKeyedSubscript:@"plannerResponseTime"];
    }
  }
  if (self->_planningStep)
  {
    v42 = [(PNRProvisionalPlannerGrainMetricsDimension *)self planningStep];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"planningStep"];
  }
  if (self->_resolutionToResponseGeneratedTime)
  {
    v44 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolutionToResponseGeneratedTime];
    int v45 = [v44 dictionaryRepresentation];
    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"resolutionToResponseGeneratedTime"];
    }
    else
    {
      uint64_t v46 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v46 forKeyedSubscript:@"resolutionToResponseGeneratedTime"];
    }
  }
  if (self->_resolverFirstSystemPromptToResolutionTime)
  {
    v47 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverFirstSystemPromptToResolutionTime];
    v48 = [v47 dictionaryRepresentation];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"resolverFirstSystemPromptToResolutionTime"];
    }
    else
    {
      v49 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v49 forKeyedSubscript:@"resolverFirstSystemPromptToResolutionTime"];
    }
  }
  if (self->_resolverRequestToResolutionTime)
  {
    int v50 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverRequestToResolutionTime];
    uint64_t v51 = [v50 dictionaryRepresentation];
    if (v51)
    {
      [v3 setObject:v51 forKeyedSubscript:@"resolverRequestToResolutionTime"];
    }
    else
    {
      v52 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v52 forKeyedSubscript:@"resolverRequestToResolutionTime"];
    }
  }
  if (self->_resolverTotalClientActionTime)
  {
    v53 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalClientActionTime];
    v54 = [v53 dictionaryRepresentation];
    if (v54)
    {
      [v3 setObject:v54 forKeyedSubscript:@"resolverTotalClientActionTime"];
    }
    else
    {
      int v55 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v55 forKeyedSubscript:@"resolverTotalClientActionTime"];
    }
  }
  if (self->_resolverTotalQueryTime)
  {
    uint64_t v56 = [(PNRProvisionalPlannerGrainMetricsDimension *)self resolverTotalQueryTime];
    v57 = [v56 dictionaryRepresentation];
    if (v57)
    {
      [v3 setObject:v57 forKeyedSubscript:@"resolverTotalQueryTime"];
    }
    else
    {
      v58 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v58 forKeyedSubscript:@"resolverTotalQueryTime"];
    }
  }
  if (self->_startToActionResolverRequestTime)
  {
    v59 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToActionResolverRequestTime];
    int v60 = [v59 dictionaryRepresentation];
    if (v60)
    {
      [v3 setObject:v60 forKeyedSubscript:@"startToActionResolverRequestTime"];
    }
    else
    {
      uint64_t v61 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v61 forKeyedSubscript:@"startToActionResolverRequestTime"];
    }
  }
  if (self->_startToContextRetrievedTime)
  {
    v62 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToContextRetrievedTime];
    v63 = [v62 dictionaryRepresentation];
    if (v63)
    {
      [v3 setObject:v63 forKeyedSubscript:@"startToContextRetrievedTime"];
    }
    else
    {
      v64 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v64 forKeyedSubscript:@"startToContextRetrievedTime"];
    }
  }
  if (self->_startToEntitySpanMatchedTime)
  {
    int v65 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToEntitySpanMatchedTime];
    uint64_t v66 = [v65 dictionaryRepresentation];
    if (v66)
    {
      [v3 setObject:v66 forKeyedSubscript:@"startToEntitySpanMatchedTime"];
    }
    else
    {
      v67 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v67 forKeyedSubscript:@"startToEntitySpanMatchedTime"];
    }
  }
  if (self->_startToLastQueryDecorationEventTime)
  {
    v68 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastQueryDecorationEventTime];
    v69 = [v68 dictionaryRepresentation];
    if (v69)
    {
      [v3 setObject:v69 forKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    }
    else
    {
      int v70 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v70 forKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    }
  }
  if (self->_startToLastResolverEventTime)
  {
    uint64_t v71 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToLastResolverEventTime];
    v72 = [v71 dictionaryRepresentation];
    if (v72)
    {
      [v3 setObject:v72 forKeyedSubscript:@"startToLastResolverEventTime"];
    }
    else
    {
      v73 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v73 forKeyedSubscript:@"startToLastResolverEventTime"];
    }
  }
  if (self->_startToPlanCreatedTime)
  {
    v74 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToPlanCreatedTime];
    int v75 = [v74 dictionaryRepresentation];
    if (v75)
    {
      [v3 setObject:v75 forKeyedSubscript:@"startToPlanCreatedTime"];
    }
    else
    {
      uint64_t v76 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v76 forKeyedSubscript:@"startToPlanCreatedTime"];
    }
  }
  if (self->_startToToolsRetrievedTime)
  {
    v77 = [(PNRProvisionalPlannerGrainMetricsDimension *)self startToToolsRetrievedTime];
    v78 = [v77 dictionaryRepresentation];
    if (v78)
    {
      [v3 setObject:v78 forKeyedSubscript:@"startToToolsRetrievedTime"];
    }
    else
    {
      v79 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v79 forKeyedSubscript:@"startToToolsRetrievedTime"];
    }
  }
  [(PNRProvisionalPlannerGrainMetricsDimension *)self willProduceDictionaryRepresentation:v3];
  id v80 = v3;

  return v80;
}

- (NSData)jsonData
{
  v2 = [(PNRProvisionalPlannerGrainMetricsDimension *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    NSUInteger v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    NSUInteger v3 = 0;
  }

  return (NSData *)v3;
}

- (PNRProvisionalPlannerGrainMetricsDimension)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(PNRProvisionalPlannerGrainMetricsDimension *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (PNRProvisionalPlannerGrainMetricsDimension)initWithDictionary:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)PNRProvisionalPlannerGrainMetricsDimension;
  uint64_t v5 = [(PNRProvisionalPlannerGrainMetricsDimension *)&v87 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"planningStep"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[v6 copy];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlanningStep:v7];
    }
    int v70 = v6;
    unint64_t v8 = [v4 objectForKeyedSubscript:@"numQueriesCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesCreated:](v5, "setNumQueriesCreated:", [v8 intValue]);
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"numQueriesExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumQueriesExecuted:](v5, "setNumQueriesExecuted:", [v9 intValue]);
    }
    unint64_t v10 = [v4 objectForKeyedSubscript:@"numClientActionCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumClientActionCreated:](v5, "setNumClientActionCreated:", [v10 intValue]);
    }
    unint64_t v11 = [v4 objectForKeyedSubscript:@"numSystemPromptResolved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumSystemPromptResolved:](v5, "setNumSystemPromptResolved:", [v11 intValue]);
    }
    uint64_t v66 = v11;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"plannerResponseTime"];
    objc_opt_class();
    uint64_t v86 = (void *)v12;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v13 = [[PNRProvisionalMetrics alloc] initWithDictionary:v12];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlannerResponseTime:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"startToPlanCreatedTime"];
    objc_opt_class();
    int v85 = (void *)v14;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v15 = [[PNRProvisionalMetrics alloc] initWithDictionary:v14];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToPlanCreatedTime:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"startToLastQueryDecorationEventTime"];
    objc_opt_class();
    v84 = (void *)v16;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v17 = [[PNRProvisionalMetrics alloc] initWithDictionary:v16];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToLastQueryDecorationEventTime:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"lastQueryDecorationEventToPlanCreatedTime"];
    objc_opt_class();
    v83 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [[PNRProvisionalMetrics alloc] initWithDictionary:v18];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setLastQueryDecorationEventToPlanCreatedTime:v19];
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"planCreatedToResolutionTime"];
    objc_opt_class();
    v82 = (void *)v20;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [[PNRProvisionalMetrics alloc] initWithDictionary:v20];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlanCreatedToResolutionTime:v21];
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"resolutionToResponseGeneratedTime"];
    objc_opt_class();
    uint64_t v81 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v23 = [[PNRProvisionalMetrics alloc] initWithDictionary:v22];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setResolutionToResponseGeneratedTime:v23];
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"startToContextRetrievedTime"];
    objc_opt_class();
    id v80 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v25 = [[PNRProvisionalMetrics alloc] initWithDictionary:v24];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToContextRetrievedTime:v25];
    }
    uint64_t v26 = [v4 objectForKeyedSubscript:@"startToToolsRetrievedTime"];
    objc_opt_class();
    v79 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v27 = [[PNRProvisionalMetrics alloc] initWithDictionary:v26];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToToolsRetrievedTime:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"startToEntitySpanMatchedTime"];
    objc_opt_class();
    v78 = (void *)v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = [[PNRProvisionalMetrics alloc] initWithDictionary:v28];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToEntitySpanMatchedTime:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"planCreatedToResolverRequestTime"];
    objc_opt_class();
    v77 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v31 = [[PNRProvisionalMetrics alloc] initWithDictionary:v30];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlanCreatedToResolverRequestTime:v31];
    }
    uint64_t v32 = [v4 objectForKeyedSubscript:@"resolverRequestToResolutionTime"];
    objc_opt_class();
    uint64_t v76 = (void *)v32;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v33 = [[PNRProvisionalMetrics alloc] initWithDictionary:v32];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setResolverRequestToResolutionTime:v33];
    }
    uint64_t v34 = [v4 objectForKeyedSubscript:@"resolverTotalQueryTime"];
    objc_opt_class();
    int v75 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [[PNRProvisionalMetrics alloc] initWithDictionary:v34];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setResolverTotalQueryTime:v35];
    }
    uint64_t v36 = [v4 objectForKeyedSubscript:@"resolverTotalClientActionTime"];
    objc_opt_class();
    v74 = (void *)v36;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v37 = [[PNRProvisionalMetrics alloc] initWithDictionary:v36];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setResolverTotalClientActionTime:v37];
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"resolverFirstSystemPromptToResolutionTime"];
    objc_opt_class();
    v73 = (void *)v38;
    if (objc_opt_isKindOfClass())
    {
      v39 = [[PNRProvisionalMetrics alloc] initWithDictionary:v38];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setResolverFirstSystemPromptToResolutionTime:v39];
    }
    int v40 = [v4 objectForKeyedSubscript:@"numPlansCreated"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumPlansCreated:](v5, "setNumPlansCreated:", [v40 intValue]);
    }
    uint64_t v41 = [v4 objectForKeyedSubscript:@"numActionResolverRequests"];
    objc_opt_class();
    v72 = v41;
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumActionResolverRequests:](v5, "setNumActionResolverRequests:", [v41 intValue]);
    }
    v42 = [v4 objectForKeyedSubscript:@"numStatementEvaluatedFromPlanner"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumStatementEvaluatedFromPlanner:](v5, "setNumStatementEvaluatedFromPlanner:", [v42 intValue]);
    }
    int v65 = v40;
    v43 = [v4 objectForKeyedSubscript:@"numCriticalErrors"];
    objc_opt_class();
    uint64_t v71 = v43;
    if (objc_opt_isKindOfClass()) {
      -[PNRProvisionalPlannerGrainMetricsDimension setNumCriticalErrors:](v5, "setNumCriticalErrors:", [v43 intValue]);
    }
    uint64_t v44 = [v4 objectForKeyedSubscript:@"startToLastResolverEventTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v45 = [[PNRProvisionalMetrics alloc] initWithDictionary:v44];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToLastResolverEventTime:v45];
    }
    v64 = (void *)v44;
    v69 = v8;
    uint64_t v46 = [v4 objectForKeyedSubscript:@"startToActionResolverRequestTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [[PNRProvisionalMetrics alloc] initWithDictionary:v46];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setStartToActionResolverRequestTime:v47];
    }
    v68 = v9;
    v48 = [v4 objectForKeyedSubscript:@"lastResolverEventToResponseGeneratedTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = [[PNRProvisionalMetrics alloc] initWithDictionary:v48];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setLastResolverEventToResponseGeneratedTime:v49];
    }
    v67 = v10;
    int v50 = [v4 objectForKeyedSubscript:@"actionResolverRequestToLastResolverEventTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v51 = [[PNRProvisionalMetrics alloc] initWithDictionary:v50];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setActionResolverRequestToLastResolverEventTime:v51];
    }
    v63 = (void *)v46;
    v52 = [v4 objectForKeyedSubscript:@"planCreatedToLastResolverEventTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v53 = [[PNRProvisionalMetrics alloc] initWithDictionary:v52];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlanCreatedToLastResolverEventTime:v53];
    }
    v54 = v42;
    int v55 = [v4 objectForKeyedSubscript:@"planCreatedToActionResolverRequestTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v56 = [[PNRProvisionalMetrics alloc] initWithDictionary:v55];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlanCreatedToActionResolverRequestTime:v56];
    }
    v57 = [v4 objectForKeyedSubscript:@"plannerGrainStage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v58 = (void *)[v57 copy];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setPlannerGrainStage:v58];
    }
    v59 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v60 = [[PNRProvisionalSageFailureInfo alloc] initWithDictionary:v59];
      [(PNRProvisionalPlannerGrainMetricsDimension *)v5 setFailureInfo:v60];
    }
    uint64_t v61 = v5;
  }
  return v5;
}

- (NSString)planningStep
{
  return self->_planningStep;
}

- (void)setPlanningStep:(id)a3
{
}

- (int)numQueriesCreated
{
  return self->_numQueriesCreated;
}

- (int)numQueriesExecuted
{
  return self->_numQueriesExecuted;
}

- (int)numClientActionCreated
{
  return self->_numClientActionCreated;
}

- (int)numSystemPromptResolved
{
  return self->_numSystemPromptResolved;
}

- (PNRProvisionalMetrics)plannerResponseTime
{
  return self->_plannerResponseTime;
}

- (void)setPlannerResponseTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToPlanCreatedTime
{
  return self->_startToPlanCreatedTime;
}

- (void)setStartToPlanCreatedTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToLastQueryDecorationEventTime
{
  return self->_startToLastQueryDecorationEventTime;
}

- (void)setStartToLastQueryDecorationEventTime:(id)a3
{
}

- (PNRProvisionalMetrics)lastQueryDecorationEventToPlanCreatedTime
{
  return self->_lastQueryDecorationEventToPlanCreatedTime;
}

- (void)setLastQueryDecorationEventToPlanCreatedTime:(id)a3
{
}

- (PNRProvisionalMetrics)planCreatedToResolutionTime
{
  return self->_planCreatedToResolutionTime;
}

- (void)setPlanCreatedToResolutionTime:(id)a3
{
}

- (PNRProvisionalMetrics)resolutionToResponseGeneratedTime
{
  return self->_resolutionToResponseGeneratedTime;
}

- (void)setResolutionToResponseGeneratedTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToContextRetrievedTime
{
  return self->_startToContextRetrievedTime;
}

- (void)setStartToContextRetrievedTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToToolsRetrievedTime
{
  return self->_startToToolsRetrievedTime;
}

- (void)setStartToToolsRetrievedTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToEntitySpanMatchedTime
{
  return self->_startToEntitySpanMatchedTime;
}

- (void)setStartToEntitySpanMatchedTime:(id)a3
{
}

- (PNRProvisionalMetrics)planCreatedToResolverRequestTime
{
  return self->_planCreatedToResolverRequestTime;
}

- (void)setPlanCreatedToResolverRequestTime:(id)a3
{
}

- (PNRProvisionalMetrics)resolverRequestToResolutionTime
{
  return self->_resolverRequestToResolutionTime;
}

- (void)setResolverRequestToResolutionTime:(id)a3
{
}

- (PNRProvisionalMetrics)resolverTotalQueryTime
{
  return self->_resolverTotalQueryTime;
}

- (void)setResolverTotalQueryTime:(id)a3
{
}

- (PNRProvisionalMetrics)resolverTotalClientActionTime
{
  return self->_resolverTotalClientActionTime;
}

- (void)setResolverTotalClientActionTime:(id)a3
{
}

- (PNRProvisionalMetrics)resolverFirstSystemPromptToResolutionTime
{
  return self->_resolverFirstSystemPromptToResolutionTime;
}

- (void)setResolverFirstSystemPromptToResolutionTime:(id)a3
{
}

- (int)numPlansCreated
{
  return self->_numPlansCreated;
}

- (int)numActionResolverRequests
{
  return self->_numActionResolverRequests;
}

- (int)numStatementEvaluatedFromPlanner
{
  return self->_numStatementEvaluatedFromPlanner;
}

- (int)numCriticalErrors
{
  return self->_numCriticalErrors;
}

- (PNRProvisionalMetrics)startToLastResolverEventTime
{
  return self->_startToLastResolverEventTime;
}

- (void)setStartToLastResolverEventTime:(id)a3
{
}

- (PNRProvisionalMetrics)startToActionResolverRequestTime
{
  return self->_startToActionResolverRequestTime;
}

- (void)setStartToActionResolverRequestTime:(id)a3
{
}

- (PNRProvisionalMetrics)lastResolverEventToResponseGeneratedTime
{
  return self->_lastResolverEventToResponseGeneratedTime;
}

- (void)setLastResolverEventToResponseGeneratedTime:(id)a3
{
}

- (PNRProvisionalMetrics)actionResolverRequestToLastResolverEventTime
{
  return self->_actionResolverRequestToLastResolverEventTime;
}

- (void)setActionResolverRequestToLastResolverEventTime:(id)a3
{
}

- (PNRProvisionalMetrics)planCreatedToLastResolverEventTime
{
  return self->_planCreatedToLastResolverEventTime;
}

- (void)setPlanCreatedToLastResolverEventTime:(id)a3
{
}

- (PNRProvisionalMetrics)planCreatedToActionResolverRequestTime
{
  return self->_planCreatedToActionResolverRequestTime;
}

- (void)setPlanCreatedToActionResolverRequestTime:(id)a3
{
}

- (NSString)plannerGrainStage
{
  return self->_plannerGrainStage;
}

- (void)setPlannerGrainStage:(id)a3
{
}

- (PNRProvisionalSageFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setFailureInfo:(id)a3
{
}

- (void)setHasPlanningStep:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasPlannerResponseTime:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasStartToPlanCreatedTime:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasStartToLastQueryDecorationEventTime:(BOOL)a3
{
  self->_hasPlanningStep = a3;
}

- (void)setHasLastQueryDecorationEventToPlanCreatedTime:(BOOL)a3
{
  self->_hasPlannerResponseTime = a3;
}

- (void)setHasPlanCreatedToResolutionTime:(BOOL)a3
{
  self->_hasStartToPlanCreatedTime = a3;
}

- (void)setHasResolutionToResponseGeneratedTime:(BOOL)a3
{
  self->_hasStartToLastQueryDecorationEventTime = a3;
}

- (void)setHasStartToContextRetrievedTime:(BOOL)a3
{
  self->_hasLastQueryDecorationEventToPlanCreatedTime = a3;
}

- (void)setHasStartToToolsRetrievedTime:(BOOL)a3
{
  self->_hasPlanCreatedToResolutionTime = a3;
}

- (void)setHasStartToEntitySpanMatchedTime:(BOOL)a3
{
  self->_hasResolutionToResponseGeneratedTime = a3;
}

- (void)setHasPlanCreatedToResolverRequestTime:(BOOL)a3
{
  self->_hasStartToContextRetrievedTime = a3;
}

- (void)setHasResolverRequestToResolutionTime:(BOOL)a3
{
  self->_hasStartToToolsRetrievedTime = a3;
}

- (void)setHasResolverTotalQueryTime:(BOOL)a3
{
  self->_hasStartToEntitySpanMatchedTime = a3;
}

- (void)setHasResolverTotalClientActionTime:(BOOL)a3
{
  self->_hasPlanCreatedToResolverRequestTime = a3;
}

- (void)setHasResolverFirstSystemPromptToResolutionTime:(BOOL)a3
{
  self->_hasResolverRequestToResolutionTime = a3;
}

- (void)setHasStartToLastResolverEventTime:(BOOL)a3
{
  self->_hasResolverTotalQueryTime = a3;
}

- (void)setHasStartToActionResolverRequestTime:(BOOL)a3
{
  self->_hasResolverTotalClientActionTime = a3;
}

- (void)setHasLastResolverEventToResponseGeneratedTime:(BOOL)a3
{
  self->_hasResolverFirstSystemPromptToResolutionTime = a3;
}

- (void)setHasActionResolverRequestToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToLastResolverEventTime = a3;
}

- (void)setHasPlanCreatedToLastResolverEventTime:(BOOL)a3
{
  self->_hasStartToActionResolverRequestTime = a3;
}

- (void)setHasPlanCreatedToActionResolverRequestTime:(BOOL)a3
{
  self->_hasLastResolverEventToResponseGeneratedTime = a3;
}

- (void)setHasPlannerGrainStage:(BOOL)a3
{
  self->_hasActionResolverRequestToLastResolverEventTime = a3;
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasPlanCreatedToLastResolverEventTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_plannerGrainStage, 0);
  objc_storeStrong((id *)&self->_planCreatedToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_actionResolverRequestToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_lastResolverEventToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_startToActionResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToLastResolverEventTime, 0);
  objc_storeStrong((id *)&self->_resolverFirstSystemPromptToResolutionTime, 0);
  objc_storeStrong((id *)&self->_resolverTotalClientActionTime, 0);
  objc_storeStrong((id *)&self->_resolverTotalQueryTime, 0);
  objc_storeStrong((id *)&self->_resolverRequestToResolutionTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToResolverRequestTime, 0);
  objc_storeStrong((id *)&self->_startToEntitySpanMatchedTime, 0);
  objc_storeStrong((id *)&self->_startToToolsRetrievedTime, 0);
  objc_storeStrong((id *)&self->_startToContextRetrievedTime, 0);
  objc_storeStrong((id *)&self->_resolutionToResponseGeneratedTime, 0);
  objc_storeStrong((id *)&self->_planCreatedToResolutionTime, 0);
  objc_storeStrong((id *)&self->_lastQueryDecorationEventToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_startToLastQueryDecorationEventTime, 0);
  objc_storeStrong((id *)&self->_startToPlanCreatedTime, 0);
  objc_storeStrong((id *)&self->_plannerResponseTime, 0);

  objc_storeStrong((id *)&self->_planningStep, 0);
}

@end