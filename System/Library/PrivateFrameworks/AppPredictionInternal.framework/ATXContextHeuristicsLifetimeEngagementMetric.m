@interface ATXContextHeuristicsLifetimeEngagementMetric
- (NSString)actionId;
- (NSString)atxTrialDeploymentId;
- (NSString)atxTrialExperimentId;
- (NSString)atxTrialTreatmentId;
- (NSString)contextType;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numEngaged;
- (unint64_t)numShown;
- (void)setActionId:(id)a3;
- (void)setAtxTrialDeploymentId:(id)a3;
- (void)setAtxTrialExperimentId:(id)a3;
- (void)setAtxTrialTreatmentId:(id)a3;
- (void)setContextType:(id)a3;
- (void)setNumEngaged:(unint64_t)a3;
- (void)setNumShown:(unint64_t)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
@end

@implementation ATXContextHeuristicsLifetimeEngagementMetric

- (id)metricName
{
  return @"com.apple.proactive.zkw.lifetimeEngagement";
}

- (id)coreAnalyticsDictionary
{
  v29[10] = *MEMORY[0x1E4F143B8];
  v28[0] = @"actionId";
  uint64_t v3 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self actionId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = v4;
  v22 = (void *)v3;
  v29[0] = v3;
  v28[1] = @"contextType";
  uint64_t v5 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self contextType];
  v26 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v5;
  v29[1] = v5;
  v28[2] = @"numShown";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsLifetimeEngagementMetric numShown](self, "numShown"));
  v29[2] = v25;
  v28[3] = @"numEngaged";
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsLifetimeEngagementMetric numEngaged](self, "numEngaged"));
  v29[3] = v24;
  v28[4] = @"trialDeploymentId";
  uint64_t v6 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self trialDeploymentId];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v6;
  v29[4] = v6;
  v28[5] = @"trialExperimentId";
  uint64_t v8 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self trialExperimentId];
  v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v8;
  v29[5] = v8;
  v28[6] = @"trialTreatmentId";
  v10 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self trialTreatmentId];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[6] = v11;
  v28[7] = @"atxTrialDeploymentId";
  v12 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self atxTrialDeploymentId];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[7] = v13;
  v28[8] = @"atxTrialExperimentId";
  v14 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self atxTrialExperimentId];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[8] = v15;
  v28[9] = @"atxTrialTreatmentId";
  v16 = [(ATXContextHeuristicsLifetimeEngagementMetric *)self atxTrialTreatmentId];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[9] = v17;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:10];
  if (!v16) {

  }
  if (!v14) {
  if (!v12)
  }

  if (!v10) {
  if (!v9)
  }

  if (!v7) {
  if (!v26)
  }

  if (!v27) {
  return v23;
  }
}

- (NSString)actionId
{
  return self->_actionId;
}

- (void)setActionId:(id)a3
{
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
}

- (unint64_t)numShown
{
  return self->_numShown;
}

- (void)setNumShown:(unint64_t)a3
{
  self->_numShown = a3;
}

- (unint64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(unint64_t)a3
{
  self->_numEngaged = a3;
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

- (NSString)atxTrialDeploymentId
{
  return self->_atxTrialDeploymentId;
}

- (void)setAtxTrialDeploymentId:(id)a3
{
}

- (NSString)atxTrialExperimentId
{
  return self->_atxTrialExperimentId;
}

- (void)setAtxTrialExperimentId:(id)a3
{
}

- (NSString)atxTrialTreatmentId
{
  return self->_atxTrialTreatmentId;
}

- (void)setAtxTrialTreatmentId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxTrialTreatmentId, 0);
  objc_storeStrong((id *)&self->_atxTrialExperimentId, 0);
  objc_storeStrong((id *)&self->_atxTrialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_actionId, 0);
}

@end