@interface NLModelImplML
- (NLModelImplML)initWithMLModel:(id)a3 configuration:(id)a4;
- (NLModelImplML)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplML)initWithModelTrainer:(id)a3 error:(id *)a4;
- (id)configuration;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelsForTokens:(id)a3;
@end

@implementation NLModelImplML

- (NLModelImplML)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  return 0;
}

- (NLModelImplML)initWithModelTrainer:(id)a3 error:(id *)a4
{
  return 0;
}

- (NLModelImplML)initWithMLModel:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 modelDescription];
  v10 = [v9 inputDescriptionsByName];
  v11 = [v10 allKeys];
  v12 = [v11 objectAtIndexedSubscript:0];

  v13 = [v9 outputDescriptionsByName];
  v14 = [v13 allKeys];
  v15 = [v14 objectAtIndexedSubscript:0];

  if (v7)
  {
    if (v8)
    {
      if (v12)
      {
        if (v15)
        {
          v24.receiver = self;
          v24.super_class = (Class)NLModelImplML;
          v16 = [(NLModelImplML *)&v24 init];
          self = v16;
          if (v16)
          {
            objc_storeStrong((id *)&v16->_mlModel, a3);
            v17 = (NLModelConfiguration *)[v8 copy];
            configuration = self->_configuration;
            self->_configuration = v17;

            v19 = (NSString *)[v12 copy];
            inputName = self->_inputName;
            self->_inputName = v19;

            v21 = (NSString *)[v15 copy];
            outputName = self->_outputName;
            self->_outputName = v21;
          }
        }
      }
    }
  }

  return self;
}

- (id)modelData
{
  return 0;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)predictedLabelForString:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_mlModel || !self->_inputName || !self->_outputName)
  {
    v14 = 0;
    id v9 = 0;
    id v8 = 0;
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1E930]);
  inputName = self->_inputName;
  v6 = [MEMORY[0x1E4F1E950] featureValueWithString:v4];
  v20[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&inputName count:1];
  id v18 = 0;
  id v8 = (void *)[v5 initWithDictionary:v7 error:&v18];
  id v9 = v18;

  if (!v8)
  {
    v14 = 0;
    goto LABEL_7;
  }
  mlModel = self->_mlModel;
  id v17 = v9;
  v11 = [(MLModel *)mlModel predictionFromFeatures:v8 error:&v17];
  id v12 = v17;

  v13 = [v11 featureValueForName:self->_outputName];
  v14 = [v13 stringValue];

  id v9 = v12;
LABEL_8:
  id v15 = v14;

  return v15;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsJoinedByString:@" "];
  v6 = [(NLModelImplML *)self predictedLabelForString:v5];

  id v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = &stru_1EFB303D0;
    }
    do
    {
      [v7 addObject:v9];
      ++v8;
    }
    while (v8 < [v4 count]);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_mlModel, 0);
}

@end