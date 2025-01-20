@interface _MLNLPSentenceClassifierModel
- (MLModelDescription)modelDescription;
- (_MLNLPSentenceClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setModelDescription:(id)a3;
@end

@implementation _MLNLPSentenceClassifierModel

- (void).cxx_destruct
{
}

- (void)setModelDescription:(id)a3
{
}

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)objc_getProperty(self, a2, 16, 1);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = +[_MLNLPFrameworkHandle sharedHandle];
  if ([v8 isValid])
  {
    v9 = [(MLModelDescription *)self->_modelDescription inputDescriptionsByName];
    v10 = [v9 allKeys];
    v11 = [v10 objectAtIndexedSubscript:0];

    v12 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
    v13 = [v12 allKeys];
    v14 = [v13 objectAtIndexedSubscript:0];

    v15 = [v7 featureValueForName:v11];
    v16 = [v15 stringValue];

    if (v16)
    {
      uint64_t v17 = [v8 predictLabelsForSentenceString:self->_sentenceClassifierModel inputString:v16 error:a5];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [MLDictionaryFeatureProvider alloc];
        v27 = v14;
        v28 = v18;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        v21 = [(MLDictionaryFeatureProvider *)v19 initWithDictionary:v20 error:a5];
      }
      else
      {
        if (!a5)
        {
          v18 = 0;
          v21 = 0;
          goto LABEL_13;
        }
        v20 = [NSString stringWithFormat:@"Prediction failed"];
        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v30 = v20;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        *a5 = [v24 errorWithDomain:@"com.apple" code:0 userInfo:v25];

        v18 = 0;
        v21 = 0;
      }
    }
    else
    {
      if (!a5)
      {
        v21 = 0;
        goto LABEL_14;
      }
      v18 = [NSString stringWithFormat:@"Input string feature '%@' not found", v11];
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = v18;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      [v23 errorWithDomain:@"com.apple" code:0 userInfo:v20];
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
LABEL_14:

    goto LABEL_15;
  }
  if (!a5)
  {
    v21 = 0;
    goto LABEL_16;
  }
  v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v33 = *MEMORY[0x1E4F28568];
  v34[0] = @"NaturalLanguage framework not available on this OS version";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  [v22 errorWithDomain:@"com.apple" code:0 userInfo:v11];
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

LABEL_16:

  return v21;
}

- (void)dealloc
{
  sentenceClassifierModel = self->_sentenceClassifierModel;
  if (sentenceClassifierModel) {
    CFRelease(sentenceClassifierModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MLNLPSentenceClassifierModel;
  [(_MLNLPSentenceClassifierModel *)&v4 dealloc];
}

- (_MLNLPSentenceClassifierModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLNLPFrameworkHandle sharedHandle];
  if (([v11 isValid] & 1) == 0)
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = @"NaturalLanguage framework not available on this OS version";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
      v28 = v27;
LABEL_16:
      [v28 errorWithDomain:@"com.apple" code:0 userInfo:v23];
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_21;
  }
  v12 = [v9 inputDescriptionsByName];
  if ([v12 count] != 1)
  {

LABEL_13:
    if (a5)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = @"Must only have one string input feature";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = &v48;
      v32 = &v47;
LABEL_15:
      v23 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      v28 = v29;
      goto LABEL_16;
    }
LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  [v9 inputDescriptionsByName];
  v13 = v39 = v10;
  [v13 allValues];
  v15 = v14 = self;
  v16 = [v15 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 type];

  self = v14;
  id v10 = v39;

  if (v17 != 3) {
    goto LABEL_13;
  }
  v18 = [v9 outputDescriptionsByName];
  if ([v18 count] != 1)
  {

LABEL_19:
    if (a5)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46 = @"Must only have one string output feature";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = &v46;
      v32 = &v45;
      goto LABEL_15;
    }
    goto LABEL_21;
  }
  v19 = [v9 outputDescriptionsByName];
  v20 = [v19 allValues];
  v21 = [v20 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 type];

  self = v14;
  id v10 = v39;

  if (v22 != 3) {
    goto LABEL_19;
  }
  v23 = [v39 objectForKeyedSubscript:@"modelData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
    {
LABEL_26:
      v26 = 0;
      goto LABEL_17;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44 = @"parameters['modelData'] does not exist or is not a string";
    v35 = (void *)MEMORY[0x1E4F1C9E8];
    v36 = &v44;
    v37 = &v43;
LABEL_25:
    v38 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
    *a5 = [v34 errorWithDomain:@"com.apple" code:0 userInfo:v38];

    goto LABEL_26;
  }
  v40.receiver = v14;
  v40.super_class = (Class)_MLNLPSentenceClassifierModel;
  v24 = [(_MLNLPSentenceClassifierModel *)&v40 init];
  self = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelDescription, a3);
    v25 = (void *)[v11 initializeSentenceClassifierModelWithData:v23 error:a5];
    self->_sentenceClassifierModel = v25;
    if (!v25)
    {
      if (!a5) {
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"initialization of classifier model with model data failed";
      v35 = (void *)MEMORY[0x1E4F1C9E8];
      v36 = &v42;
      v37 = &v41;
      goto LABEL_25;
    }
  }
  self = self;
  v26 = self;
LABEL_17:

LABEL_22:
  return v26;
}

@end