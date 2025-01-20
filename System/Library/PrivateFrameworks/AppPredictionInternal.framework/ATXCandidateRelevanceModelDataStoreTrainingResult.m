@interface ATXCandidateRelevanceModelDataStoreTrainingResult
- (ATXCandidate)candidate;
- (ATXCandidateRelevanceModel)model;
- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)datasetMetadata;
- (ATXCandidateRelevanceModelDataStoreTrainingResult)initWithModel:(id)a3 candidate:(id)a4 featurizationManager:(id)a5 modelUUID:(id)a6 datasetMetadata:(id)a7 clientModelName:(id)a8 trainDate:(id)a9 isVerified:(BOOL)a10;
- (ATXCandidateRelevanceModelFeaturizationManager)featurizationManager;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:(id)a3;
- (BOOL)isVerified;
- (NSDate)trainDate;
- (NSString)clientModelName;
- (NSUUID)modelUUID;
- (id)description;
@end

@implementation ATXCandidateRelevanceModelDataStoreTrainingResult

- (ATXCandidateRelevanceModelDataStoreTrainingResult)initWithModel:(id)a3 candidate:(id)a4 featurizationManager:(id)a5 modelUUID:(id)a6 datasetMetadata:(id)a7 clientModelName:(id)a8 trainDate:(id)a9 isVerified:(BOOL)a10
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v17 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ATXCandidateRelevanceModelDataStoreTrainingResult;
  v19 = [(ATXCandidateRelevanceModelDataStoreTrainingResult *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_model, a3);
    objc_storeStrong((id *)&v20->_candidate, a4);
    objc_storeStrong((id *)&v20->_featurizationManager, a5);
    objc_storeStrong((id *)&v20->_modelUUID, a6);
    objc_storeStrong((id *)&v20->_datasetMetadata, a7);
    objc_storeStrong((id *)&v20->_clientModelName, a8);
    objc_storeStrong((id *)&v20->_trainDate, a9);
    v20->_isVerified = a10;
  }

  return v20;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateStyle:4];
  [v4 setTimeStyle:4];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
  [v4 setLocale:v5];

  v6 = [(ATXCandidate *)self->_candidate identifier];
  [v3 appendFormat:@"Candidate Identifier: %@\n", v6];

  [v3 appendFormat:@"Client Model Name: %@\n", self->_clientModelName];
  [v3 appendFormat:@"Model UUID: %@\n", self->_modelUUID];
  if (self->_isVerified) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"Verified: %@\n", v7];
  [v3 appendFormat:@"%@\n", self->_datasetMetadata];
  v8 = [v4 stringFromDate:self->_trainDate];
  [v3 appendFormat:@"Date Trained: %@\n", v8];

  [v3 appendFormat:@"%@\n", self->_model];
  v9 = [(ATXCandidateRelevanceModel *)self->_model featureImportanceDescriptionForFeaturizationManager:self->_featurizationManager];
  [v3 appendFormat:@"Feature Importances: \n%@\n", v9];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCandidateRelevanceModelDataStoreTrainingResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidateRelevanceModelDataStoreTrainingResult *)self isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreTrainingResult:(id)a3
{
  id v4 = (id *)a3;
  model = self->_model;
  BOOL v6 = (ATXCandidateRelevanceModel *)v4[2];
  if (model == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = model;
    char v9 = [(ATXCandidateRelevanceModel *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_23;
    }
  }
  candidate = self->_candidate;
  v11 = (ATXCandidate *)v4[3];
  if (candidate == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = candidate;
    BOOL v14 = [(ATXCandidate *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_23;
    }
  }
  featurizationManager = self->_featurizationManager;
  v16 = (ATXCandidateRelevanceModelFeaturizationManager *)v4[4];
  if (featurizationManager == v16)
  {
  }
  else
  {
    id v17 = v16;
    id v18 = featurizationManager;
    BOOL v19 = [(ATXCandidateRelevanceModelFeaturizationManager *)v18 isEqual:v17];

    if (!v19) {
      goto LABEL_23;
    }
  }
  modelUUID = self->_modelUUID;
  v21 = (NSUUID *)v4[5];
  if (modelUUID == v21)
  {
  }
  else
  {
    id v22 = v21;
    id v23 = modelUUID;
    char v24 = [(NSUUID *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_23;
    }
  }
  datasetMetadata = self->_datasetMetadata;
  id v26 = (ATXCandidateRelevanceModelDataStoreDatasetMetadata *)v4[6];
  if (datasetMetadata == v26)
  {
  }
  else
  {
    objc_super v27 = v26;
    v28 = datasetMetadata;
    BOOL v29 = [(ATXCandidateRelevanceModelDataStoreDatasetMetadata *)v28 isEqual:v27];

    if (!v29) {
      goto LABEL_23;
    }
  }
  clientModelName = self->_clientModelName;
  v31 = (NSString *)v4[7];
  if (clientModelName == v31)
  {
  }
  else
  {
    v32 = v31;
    v33 = clientModelName;
    char v34 = [(NSString *)v33 isEqual:v32];

    if ((v34 & 1) == 0)
    {
LABEL_23:
      char v35 = 0;
      goto LABEL_24;
    }
  }
  v37 = self->_trainDate;
  v38 = v37;
  if (v37 == v4[8]) {
    char v35 = 1;
  }
  else {
    char v35 = -[NSDate isEqual:](v37, "isEqual:");
  }

LABEL_24:
  return v35;
}

- (ATXCandidateRelevanceModel)model
{
  return self->_model;
}

- (ATXCandidate)candidate
{
  return self->_candidate;
}

- (ATXCandidateRelevanceModelFeaturizationManager)featurizationManager
{
  return self->_featurizationManager;
}

- (NSUUID)modelUUID
{
  return self->_modelUUID;
}

- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)datasetMetadata
{
  return self->_datasetMetadata;
}

- (NSString)clientModelName
{
  return self->_clientModelName;
}

- (NSDate)trainDate
{
  return self->_trainDate;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainDate, 0);
  objc_storeStrong((id *)&self->_clientModelName, 0);
  objc_storeStrong((id *)&self->_datasetMetadata, 0);
  objc_storeStrong((id *)&self->_modelUUID, 0);
  objc_storeStrong((id *)&self->_featurizationManager, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end