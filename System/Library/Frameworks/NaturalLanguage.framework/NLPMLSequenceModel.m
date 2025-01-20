@interface NLPMLSequenceModel
- (MLModelDescription)modelDescription;
- (NLPMLSequenceModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation NLPMLSequenceModel

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NLPMLSequenceModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [v9 outputDescriptionsByName];
  v12 = [v11 allKeys];

  v13 = [v9 inputDescriptionsByName];
  if ([v13 count] != 1) {
    goto LABEL_11;
  }
  v14 = [v9 inputDescriptionsByName];
  v15 = [v14 allValues];
  v16 = [v15 objectAtIndexedSubscript:0];
  if ([v16 type] != 3
    || [v12 count] != 3
    || ![v12 containsObject:@"labels"]
    || ![v12 containsObject:@"locations"])
  {

LABEL_11:
    goto LABEL_12;
  }
  char v23 = [v12 containsObject:@"lengths"];

  if (v23)
  {
    v17 = [v10 objectForKey:@"modelData"];
    v24.receiver = self;
    v24.super_class = (Class)NLPMLSequenceModel;
    v18 = [(NLModel *)&v24 initWithData:v17 error:a5];
    v19 = v18;
    if (v18) {
      objc_storeStrong((id *)&v18->_modelDescription, a3);
    }
    self = v19;
    v20 = self;
    goto LABEL_14;
  }
LABEL_12:
  if (!a5)
  {
    v20 = 0;
    goto LABEL_16;
  }
  v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v26[0] = @"Failed to load model file";
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:2 userInfo:v17];
  v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  return v20;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  modelDescription = self->_modelDescription;
  id v8 = a3;
  id v9 = [(MLModelDescription *)modelDescription inputDescriptionsByName];
  id v10 = [v9 allKeys];
  v11 = [v10 objectAtIndexedSubscript:0];

  v12 = [v8 featureValueForName:v11];

  v13 = [v12 stringValue];

  v14 = [MEMORY[0x1E4F1CA48] array];
  v15 = [MEMORY[0x1E4F1CA48] array];
  v16 = [MEMORY[0x1E4F1CA48] array];
  if (v13)
  {
    v35 = a5;
    v38 = v11;
    generateTokenSequence(v13, 0, v14, v15, v16);
    v17 = [(NLModel *)self predictedLabelsForTokens:v14];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [v15 count];
    uint64_t v20 = [v16 count];
    uint64_t v21 = 0;
    if (v17 && v18)
    {
      uint64_t v21 = [MEMORY[0x1E4F1E9F0] sequenceWithStringArray:v17];
    }
    v22 = 0;
    if (v15 && v19)
    {
      v22 = [MEMORY[0x1E4F1E9F0] sequenceWithInt64Array:v15];
    }
    char v23 = 0;
    v36 = v14;
    v37 = v13;
    v34 = v15;
    if (v16 && v20)
    {
      char v23 = [MEMORY[0x1E4F1E9F0] sequenceWithInt64Array:v16];
    }
    id v24 = objc_alloc(MEMORY[0x1E4F1E930]);
    v39[0] = @"labels";
    uint64_t v25 = [MEMORY[0x1E4F1E950] featureValueWithSequence:v21];
    v40[0] = v25;
    v39[1] = @"locations";
    v26 = [MEMORY[0x1E4F1E950] featureValueWithSequence:v22];
    v40[1] = v26;
    v39[2] = @"lengths";
    v27 = [MEMORY[0x1E4F1E950] featureValueWithSequence:v23];
    v40[2] = v27;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v29 = v28 = (void *)v21;
    v30 = (void *)[v24 initWithDictionary:v29 error:v35];

    v31 = v28;
    v13 = v37;
    v11 = v38;
    v14 = v36;
    v15 = v34;
    goto LABEL_14;
  }
  if (a5)
  {
    v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42[0] = @"Prediction failed due to missing input";
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    [v32 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v31];
    v30 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  v30 = 0;
LABEL_15:

  return v30;
}

- (void).cxx_destruct
{
}

@end