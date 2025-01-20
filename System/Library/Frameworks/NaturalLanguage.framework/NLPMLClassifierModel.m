@interface NLPMLClassifierModel
- (MLModelDescription)modelDescription;
- (NLPMLClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation NLPMLClassifierModel

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NLPMLClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 inputDescriptionsByName];
  if ([v11 count] != 1) {
    goto LABEL_10;
  }
  v27 = self;
  v12 = [v9 inputDescriptionsByName];
  v13 = [v12 allValues];
  v14 = [v13 objectAtIndexedSubscript:0];
  if ([v14 type] != 3)
  {
LABEL_9:

    self = v27;
LABEL_10:

    goto LABEL_11;
  }
  v26 = v10;
  v15 = [v9 outputDescriptionsByName];
  if ([v15 count] != 1)
  {

    id v10 = v26;
    goto LABEL_9;
  }
  v24 = [v9 outputDescriptionsByName];
  v16 = [v24 allValues];
  v17 = [v16 objectAtIndexedSubscript:0];
  uint64_t v25 = [v17 type];

  id v10 = v26;
  self = v27;
  if (v25 == 3)
  {
    v18 = [v26 objectForKey:@"modelData"];
    v28.receiver = v27;
    v28.super_class = (Class)NLPMLClassifierModel;
    v19 = [(NLModel *)&v28 initWithData:v18 error:a5];
    v20 = v19;
    if (v19) {
      objc_storeStrong((id *)&v19->_modelDescription, a3);
    }
    self = v20;
    v21 = self;
    goto LABEL_13;
  }
LABEL_11:
  if (!a5)
  {
    v21 = 0;
    goto LABEL_15;
  }
  v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  v30[0] = @"Failed to load model file";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  [v22 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:2 userInfo:v18];
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_15:
  return v21;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  modelDescription = self->_modelDescription;
  id v8 = a3;
  id v9 = [(MLModelDescription *)modelDescription inputDescriptionsByName];
  id v10 = [v9 allKeys];
  v11 = [v10 objectAtIndexedSubscript:0];

  v12 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
  v13 = [v12 allKeys];
  v14 = [v13 objectAtIndexedSubscript:0];

  v15 = [v8 featureValueForName:v11];

  v16 = [v15 stringValue];

  if (v16)
  {
    v17 = [(NLModel *)self predictedLabelForString:v16];
    id v18 = objc_alloc(MEMORY[0x1E4F1E930]);
    v24 = v14;
    v19 = [MEMORY[0x1E4F1E950] featureValueWithString:v17];
    uint64_t v25 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v21 = (void *)[v18 initWithDictionary:v20 error:a5];

LABEL_5:
    goto LABEL_6;
  }
  if (a5)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Prediction failed due to missing input";
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v22 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v17];
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v21 = 0;
LABEL_6:

  return v21;
}

- (void).cxx_destruct
{
}

@end