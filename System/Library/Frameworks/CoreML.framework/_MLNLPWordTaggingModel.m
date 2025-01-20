@interface _MLNLPWordTaggingModel
- (MLModelDescription)modelDescription;
- (_MLNLPWordTaggingModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (void)dealloc;
- (void)setModelDescription:(id)a3;
@end

@implementation _MLNLPWordTaggingModel

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
  v63[1] = *MEMORY[0x1E4F143B8];
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

    v15 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
    v16 = [v15 allKeys];
    uint64_t v17 = [v16 objectAtIndexedSubscript:1];

    v18 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
    v19 = [v18 allKeys];
    v55 = [v19 objectAtIndexedSubscript:2];

    v20 = [v7 featureValueForName:v11];
    v21 = [v20 stringValue];

    v54 = (void *)v17;
    if (v21)
    {
      v22 = [v8 predictTokensLabelsLocationsLengthsForString:self->_wordTaggingModel inputString:v21 error:a5];
      if (v22)
      {
        v47 = [MLDictionaryFeatureProvider alloc];
        v56[0] = v17;
        id v53 = v7;
        v51 = v21;
        v46 = [v22 allKeys];
        uint64_t v43 = [v46 objectAtIndexedSubscript:1];
        v50 = [v22 objectForKeyedSubscript:v43];
        v49 = +[MLSequence sequenceWithStringArray:v50];
        v48 = +[MLFeatureValue featureValueWithSequence:v49];
        v57[0] = v48;
        v56[1] = v55;
        v45 = [v22 allKeys];
        v44 = [v45 objectAtIndexedSubscript:0];
        v42 = [v22 objectForKeyedSubscript:v44];
        v41 = +[MLSequence sequenceWithInt64Array:v42];
        v40 = +[MLFeatureValue featureValueWithSequence:v41];
        v57[1] = v40;
        v56[2] = v14;
        v52 = v11;
        v39 = [v22 allKeys];
        v23 = [v39 objectAtIndexedSubscript:2];
        v24 = [v22 objectForKeyedSubscript:v23];
        v25 = +[MLSequence sequenceWithInt64Array:v24];
        +[MLFeatureValue featureValueWithSequence:v25];
        v26 = v8;
        v28 = v27 = v14;
        v57[2] = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
        v30 = [(MLDictionaryFeatureProvider *)v47 initWithDictionary:v29 error:a5];

        v31 = (void *)v43;
        v14 = v27;
        v8 = v26;
        v32 = v46;

        v11 = v52;
        id v7 = v53;

        v21 = v51;
      }
      else
      {
        if (!a5)
        {
          v22 = 0;
          v30 = 0;
          goto LABEL_14;
        }
        v32 = [NSString stringWithFormat:@"Prediction failed"];
        v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        v59 = v32;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v37 = v35;
        v31 = (void *)v36;
        [v37 errorWithDomain:@"com.apple" code:0 userInfo:v36];
        v30 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!a5)
      {
        v30 = 0;
        goto LABEL_15;
      }
      v22 = [NSString stringWithFormat:@"Input string feature '%@' not found", v11];
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v60 = *MEMORY[0x1E4F28568];
      v61 = v22;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      [v34 errorWithDomain:@"com.apple" code:0 userInfo:v32];
      v30 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_14:
LABEL_15:

    goto LABEL_16;
  }
  if (!a5)
  {
    v30 = 0;
    goto LABEL_17;
  }
  v33 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v62 = *MEMORY[0x1E4F28568];
  v63[0] = @"NaturalLanguage framework not available on this OS version";
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
  [v33 errorWithDomain:@"com.apple" code:0 userInfo:v11];
  v30 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:

  return v30;
}

- (void)dealloc
{
  wordTaggingModel = self->_wordTaggingModel;
  if (wordTaggingModel) {
    CFRelease(wordTaggingModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MLNLPWordTaggingModel;
  [(_MLNLPWordTaggingModel *)&v4 dealloc];
}

- (_MLNLPWordTaggingModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLNLPFrameworkHandle sharedHandle];
  if (([v11 isValid] & 1) == 0)
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"NaturalLanguage framework not available on this OS version";
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      v28 = v27;
LABEL_23:
      [v28 errorWithDomain:@"com.apple" code:0 userInfo:v23];
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v12 = [v9 inputDescriptionsByName];
  if ([v12 count] != 1)
  {

LABEL_15:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      v54 = @"Must only have one string input feature";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = &v54;
      v32 = &v53;
LABEL_22:
      v23 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
      v28 = v29;
      goto LABEL_23;
    }
LABEL_25:
    v26 = 0;
    goto LABEL_26;
  }
  [v9 inputDescriptionsByName];
  v13 = v45 = self;
  v14 = [v13 allValues];
  v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 type];

  self = v45;
  if (v16 != 3) {
    goto LABEL_15;
  }
  uint64_t v17 = [v9 outputDescriptionsByName];
  if ([v17 count] != 3)
  {
LABEL_19:

LABEL_20:
    if (a5)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52 = @"Must only have three sequence output features";
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = &v52;
      v32 = &v51;
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  v18 = [v9 outputDescriptionsByName];
  v19 = [v18 allValues];
  v20 = [v19 objectAtIndexedSubscript:0];
  if ([v20 type] != 7)
  {
LABEL_18:

    goto LABEL_19;
  }
  v44 = [v9 outputDescriptionsByName];
  uint64_t v43 = [v44 allValues];
  v21 = [v43 objectAtIndexedSubscript:1];
  if ([v21 type] != 7)
  {

    self = v45;
    goto LABEL_18;
  }
  v40 = [v9 outputDescriptionsByName];
  v39 = [v40 allValues];
  [v39 objectAtIndexedSubscript:2];
  v22 = v41 = v18;
  uint64_t v42 = [v22 type];

  self = v45;
  if (v42 != 7) {
    goto LABEL_20;
  }
  v23 = [v10 objectForKeyedSubscript:@"modelData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
    {
LABEL_30:
      v26 = 0;
      goto LABEL_24;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v49 = *MEMORY[0x1E4F28568];
    v50 = @"parameters['modelData'] does not exist or is not a string";
    v35 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v36 = &v50;
    v37 = &v49;
LABEL_29:
    v38 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
    *a5 = [v34 errorWithDomain:@"com.apple" code:0 userInfo:v38];

    goto LABEL_30;
  }
  v46.receiver = v45;
  v46.super_class = (Class)_MLNLPWordTaggingModel;
  v24 = [(_MLNLPWordTaggingModel *)&v46 init];
  self = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelDescription, a3);
    v25 = (void *)[v11 initializeWordTaggingModelWithData:v23 error:a5];
    self->_wordTaggingModel = v25;
    if (!v25)
    {
      if (!a5) {
        goto LABEL_30;
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48 = @"initialization of sequence model with model data failed";
      v35 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v36 = &v48;
      v37 = &v47;
      goto LABEL_29;
    }
  }
  self = self;
  v26 = self;
LABEL_24:

LABEL_26:
  return v26;
}

@end