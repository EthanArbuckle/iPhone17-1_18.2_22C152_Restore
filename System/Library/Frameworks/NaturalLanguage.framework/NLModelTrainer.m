@interface NLModelTrainer
+ (id)modelTrainerWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6;
- (BOOL)shouldStop;
- (Class)modelImplClass;
- (NLDataSet)dataSet;
- (NLModel)trainedModel;
- (NLModelConfiguration)configuration;
- (NLModelTrainer)initWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6;
- (NLModelTrainerDelegate)delegate;
- (NSDictionary)options;
- (NSDictionary)testResults;
- (NSError)trainingError;
- (id)model;
- (void)logMessage:(id)a3;
- (void)setModel:(id)a3;
- (void)setTrainingError:(id)a3;
- (void)trainModel;
- (void)trainer:(id)a3 logMessage:(id)a4;
@end

@implementation NLModelTrainer

- (NLModelTrainer)initWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)NLModelTrainer;
    v14 = [(NLModelTrainer *)&v22 init];
    if (v14)
    {
      uint64_t v15 = [v10 copy];
      configuration = v14->_configuration;
      v14->_configuration = (NLModelConfiguration *)v15;

      objc_storeStrong((id *)&v14->_dataSet, a4);
      uint64_t v17 = [v12 copy];
      options = v14->_options;
      v14->_options = (NSDictionary *)v17;

      objc_storeStrong((id *)&v14->_delegate, a6);
      if (v13)
      {
        v14->_delegateRespondsToLogMessage = objc_opt_respondsToSelector() & 1;
        char v19 = objc_opt_respondsToSelector();
      }
      else
      {
        char v19 = 0;
        v14->_delegateRespondsToLogMessage = 0;
      }
      v14->_delegateRespondsToShouldStop = v19 & 1;
    }
    self = v14;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)modelTrainerWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v13 dataSet:v12 options:v11 delegate:v10];

  return v14;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NLDataSet)dataSet
{
  return self->_dataSet;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NLModelTrainerDelegate)delegate
{
  return self->_delegate;
}

- (Class)modelImplClass
{
  v3 = [(NLModelTrainer *)self configuration];
  v4 = [v3 options];
  BOOLForKeyWithDefault(v4, @"UseCRF");

  v5 = [(NLModelTrainer *)self configuration];
  v6 = [v5 options];
  BOOLForKeyWithDefault(v6, @"UseRNN");

  v7 = [(NLModelTrainer *)self configuration];
  v8 = [v7 options];
  BOOLForKeyWithDefault(v8, @"UseTransfer");

  getenv("NLUseCRFSuiteMaxEnt");
  v9 = [(NLModelTrainer *)self configuration];
  id v10 = [v9 options];
  id v11 = [v10 objectForKey:@"Algorithm"];

  if (v11)
  {
    [v11 isEqualToString:@"CRF"];
    [v11 isEqualToString:@"RNN"];
    [v11 isEqualToString:@"Transfer"];
  }
  id v12 = [(NLModelTrainer *)self configuration];
  unint64_t v13 = [v12 type];

  if (v13 > 1) {
    v14 = 0;
  }
  else {
    v14 = objc_opt_class();
  }
  uint64_t v15 = v14;

  return v15;
}

- (void)trainModel
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v3 = objc_msgSend(objc_alloc(-[NLModelTrainer modelImplClass](self, "modelImplClass")), "initWithModelTrainer:error:", self, &v11);
  id v4 = v11;
  v5 = v4;
  if (v3)
  {
    v6 = [NLModel alloc];
    v7 = [(NLModelTrainer *)self configuration];
    v8 = [(NLModel *)v6 initWithConfiguration:v7 modelImpl:v3];

    [(NLModelTrainer *)self setModel:v8];
  }
  else
  {
    if (!v4)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"Failed to train model";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      v5 = [v9 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:9 userInfo:v10];
    }
    [(NLModelTrainer *)self setTrainingError:v5];
  }
}

- (id)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSError)trainingError
{
  return self->_trainingError;
}

- (void)setTrainingError:(id)a3
{
}

- (NLModel)trainedModel
{
  model = self->_model;
  if (!model)
  {
    if (self->_trainingError)
    {
      model = 0;
    }
    else
    {
      [(NLModelTrainer *)self logMessage:@"Tokenizing data and extracting features"];
      id v4 = [(NLModelTrainer *)self dataSet];
      v5 = [v4 dataProviderOfType:0];
      [v5 generateMapsWithModelTrainer:self];

      [(NLModelTrainer *)self trainModel];
      model = self->_model;
    }
  }

  return model;
}

- (NSDictionary)testResults
{
  v3 = [(NLModelTrainer *)self model];
  id v4 = [(NLModelTrainer *)self dataSet];
  v5 = [v3 testResultsWithDataSet:v4];

  return (NSDictionary *)v5;
}

- (void)logMessage:(id)a3
{
  if (self->_delegateRespondsToLogMessage) {
    [(NLModelTrainerDelegate *)self->_delegate modelTrainer:self logMessage:a3];
  }
}

- (void)trainer:(id)a3 logMessage:(id)a4
{
}

- (BOOL)shouldStop
{
  if (self->_delegateRespondsToShouldStop) {
    return [(NLModelTrainerDelegate *)self->_delegate modelTrainerShouldStop:self];
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_trainingError, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end