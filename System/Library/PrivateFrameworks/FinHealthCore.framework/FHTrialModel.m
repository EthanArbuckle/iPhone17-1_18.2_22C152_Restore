@interface FHTrialModel
- (FHTrialModel)initWithModelName:(id)a3 fhExperiment:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6;
- (FHTrialModel)initWithModelName:(id)a3 namespaceName:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6;
- (NSString)trialId;
- (void)setTrialId:(id)a3;
- (void)updateFactors;
@end

@implementation FHTrialModel

- (FHTrialModel)initWithModelName:(id)a3 namespaceName:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[FHExperiment alloc] initWithClient:0 namespaceName:v12 setRefresh:1 delegate:self];

  v15 = [(FHTrialModel *)self initWithModelName:v13 fhExperiment:v14 modelFactorName:v11 defaultModel:v10];
  return v15;
}

- (FHTrialModel)initWithModelName:(id)a3 fhExperiment:(id)a4 modelFactorName:(id)a5 defaultModel:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_storeStrong((id *)&self->_fhExperiment, a4);
  id v14 = a3;
  objc_storeStrong((id *)&self->_modelFactorName, a5);
  v15 = [(FHExperiment *)self->_fhExperiment getFilePathForFactor:v12];
  if (v15)
  {
    id v16 = (id)[objc_alloc(NSURL) initWithString:v15];
    v17 = [(FHExperiment *)self->_fhExperiment getTrialIdForFactor:v12];
    trialId = self->_trialId;
    self->_trialId = v17;
  }
  else
  {
    v19 = FinHealthLogObject(@"FinHealthCore");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[FHTrialModel initWithModelName:fhExperiment:modelFactorName:defaultModel:]";
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_24E029000, v19, OS_LOG_TYPE_DEBUG, "%s Loading default model %@", buf, 0x16u);
    }

    id v16 = v13;
    v20 = self->_trialId;
    self->_trialId = (NSString *)&stru_27001CD40;
  }
  v26.receiver = self;
  v26.super_class = (Class)FHTrialModel;
  v21 = [(FHModel *)&v26 initWithModelURL:v16 modelName:v14];

  if (v21)
  {
    v22 = [(FHModel *)v21 mlModel];

    if (!v22)
    {
      v23 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[FHTrialModel initWithModelName:fhExperiment:modelFactorName:defaultModel:]";
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_24E029000, v23, OS_LOG_TYPE_DEBUG, "%s Loading default model %@", buf, 0x16u);
      }

      v24 = v21->_trialId;
      v21->_trialId = (NSString *)&stru_27001CD40;

      [(FHModel *)v21 _loadModel:v13];
    }
  }

  return v21;
}

- (void)updateFactors
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = FinHealthLogObject(@"FinHealthCore");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    modelFactorName = self->_modelFactorName;
    int v11 = 136315394;
    id v12 = "-[FHTrialModel updateFactors]";
    __int16 v13 = 2112;
    id v14 = modelFactorName;
    _os_log_impl(&dword_24E029000, v3, OS_LOG_TYPE_DEBUG, "%s Updating trial model with factor name: %@", (uint8_t *)&v11, 0x16u);
  }

  v5 = [(FHExperiment *)self->_fhExperiment getFilePathForFactor:self->_modelFactorName];
  v6 = [(FHModel *)self compiledModelURL];
  if (v5)
  {
    v7 = (void *)[objc_alloc(NSURL) initWithString:v5];
    BOOL v8 = [(FHModel *)self _loadModel:v7];

    if (v8)
    {
      v9 = [(FHExperiment *)self->_fhExperiment getTrialIdForFactor:self->_modelFactorName];
      trialId = self->_trialId;
      self->_trialId = v9;

      [(FHModel *)self _deleteModelFile:v6];
    }
  }
}

- (NSString)trialId
{
  return self->_trialId;
}

- (void)setTrialId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialId, 0);
  objc_storeStrong((id *)&self->_modelFactorName, 0);
  objc_storeStrong((id *)&self->_fhExperiment, 0);
}

@end