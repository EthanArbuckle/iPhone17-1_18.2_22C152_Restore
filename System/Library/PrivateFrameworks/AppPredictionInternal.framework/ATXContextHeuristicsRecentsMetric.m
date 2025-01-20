@interface ATXContextHeuristicsRecentsMetric
- (NSString)atxTrialDeploymentId;
- (NSString)atxTrialExperimentId;
- (NSString)atxTrialTreatmentId;
- (NSString)recentType;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numEngaged;
- (unint64_t)numSearched;
- (unint64_t)recentAge;
- (void)setAtxTrialDeploymentId:(id)a3;
- (void)setAtxTrialExperimentId:(id)a3;
- (void)setAtxTrialTreatmentId:(id)a3;
- (void)setNumEngaged:(unint64_t)a3;
- (void)setNumSearched:(unint64_t)a3;
- (void)setRecentAge:(unint64_t)a3;
- (void)setRecentType:(id)a3;
- (void)setTrialDeploymentId:(id)a3;
- (void)setTrialExperimentId:(id)a3;
- (void)setTrialTreatmentId:(id)a3;
@end

@implementation ATXContextHeuristicsRecentsMetric

- (id)metricName
{
  return @"com.apple.zkw.recents";
}

- (id)coreAnalyticsDictionary
{
  v26[10] = *MEMORY[0x1E4F143B8];
  v25[0] = @"recentType";
  uint64_t v3 = [(ATXContextHeuristicsRecentsMetric *)self recentType];
  v24 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v3;
  v26[0] = v3;
  v25[1] = @"recentAge";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric recentAge](self, "recentAge"));
  v26[1] = v23;
  v25[2] = @"numEngaged";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric numEngaged](self, "numEngaged"));
  v26[2] = v22;
  v25[3] = @"numSearched";
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXContextHeuristicsRecentsMetric numSearched](self, "numSearched"));
  v26[3] = v21;
  v25[4] = @"trialDeploymentId";
  uint64_t v4 = [(ATXContextHeuristicsRecentsMetric *)self trialDeploymentId];
  v5 = (void *)v4;
  if (!v4)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v4;
  v26[4] = v4;
  v25[5] = @"trialExperimentId";
  uint64_t v6 = [(ATXContextHeuristicsRecentsMetric *)self trialExperimentId];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[5] = v6;
  v25[6] = @"trialTreatmentId";
  v8 = [(ATXContextHeuristicsRecentsMetric *)self trialTreatmentId];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[6] = v9;
  v25[7] = @"atxTrialDeploymentId";
  v10 = [(ATXContextHeuristicsRecentsMetric *)self atxTrialDeploymentId];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[7] = v11;
  v25[8] = @"atxTrialExperimentId";
  v12 = [(ATXContextHeuristicsRecentsMetric *)self atxTrialExperimentId];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[8] = v13;
  v25[9] = @"atxTrialTreatmentId";
  v14 = [(ATXContextHeuristicsRecentsMetric *)self atxTrialTreatmentId];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[9] = v15;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:10];
  if (!v14) {

  }
  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v7)
  }

  if (!v5) {
  if (!v24)
  }

  return v20;
}

- (NSString)recentType
{
  return self->_recentType;
}

- (void)setRecentType:(id)a3
{
}

- (unint64_t)recentAge
{
  return self->_recentAge;
}

- (void)setRecentAge:(unint64_t)a3
{
  self->_recentAge = a3;
}

- (unint64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(unint64_t)a3
{
  self->_numEngaged = a3;
}

- (unint64_t)numSearched
{
  return self->_numSearched;
}

- (void)setNumSearched:(unint64_t)a3
{
  self->_numSearched = a3;
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
  objc_storeStrong((id *)&self->_recentType, 0);
}

@end