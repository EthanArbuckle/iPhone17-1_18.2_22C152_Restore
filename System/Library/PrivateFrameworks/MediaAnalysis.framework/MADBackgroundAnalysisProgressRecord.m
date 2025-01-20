@interface MADBackgroundAnalysisProgressRecord
- (NSDate)storeDate;
- (id)description;
- (unint64_t)activityID;
- (unint64_t)analysisSubtype;
- (unint64_t)processedAssetCount;
- (unint64_t)progress;
- (unint64_t)totalAssetCount;
- (unint64_t)version;
- (void)setActivityID:(unint64_t)a3;
- (void)setAnalysisSubtype:(unint64_t)a3;
- (void)setProcessedAssetCount:(unint64_t)a3;
- (void)setProgress:(unint64_t)a3;
- (void)setStoreDate:(id)a3;
- (void)setTotalAssetCount:(unint64_t)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MADBackgroundAnalysisProgressRecord

- (unint64_t)progress
{
  unint64_t result = [(MADBackgroundAnalysisProgressRecord *)self totalAssetCount];
  if (result)
  {
    float v4 = (float)[(MADBackgroundAnalysisProgressRecord *)self processedAssetCount];
    return (unint64_t)(float)((float)(v4
                                           / (float)[(MADBackgroundAnalysisProgressRecord *)self totalAssetCount])* 100.0);
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  float v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = VCPTaskIDDescription([(MADBackgroundAnalysisProgressRecord *)self activityID]);
  [v3 appendFormat:@"activityID: %@, ", v6];

  [v3 appendFormat:@"analysisSubtype: %d, ", -[MADBackgroundAnalysisProgressRecord analysisSubtype](self, "analysisSubtype")];
  [v3 appendFormat:@"version: %d, ", -[MADBackgroundAnalysisProgressRecord version](self, "version")];
  [v3 appendFormat:@"processedAssetCount: %d, ", -[MADBackgroundAnalysisProgressRecord processedAssetCount](self, "processedAssetCount")];
  [v3 appendFormat:@"totalAssetCount: %d, ", -[MADBackgroundAnalysisProgressRecord totalAssetCount](self, "totalAssetCount")];
  [v3 appendFormat:@"progress: %d, ", -[MADBackgroundAnalysisProgressRecord progress](self, "progress")];
  v7 = [(MADBackgroundAnalysisProgressRecord *)self storeDate];
  [v3 appendFormat:@"storeDate: %@>", v7];

  return v3;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(unint64_t)a3
{
  self->_activityID = a3;
}

- (unint64_t)analysisSubtype
{
  return self->_analysisSubtype;
}

- (void)setAnalysisSubtype:(unint64_t)a3
{
  self->_analysisSubtype = a3;
}

- (NSDate)storeDate
{
  return self->_storeDate;
}

- (void)setStoreDate:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)processedAssetCount
{
  return self->_processedAssetCount;
}

- (void)setProcessedAssetCount:(unint64_t)a3
{
  self->_processedAssetCount = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (void)setProgress:(unint64_t)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
}

@end