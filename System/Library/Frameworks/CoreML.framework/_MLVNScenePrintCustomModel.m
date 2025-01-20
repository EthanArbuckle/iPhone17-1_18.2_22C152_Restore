@interface _MLVNScenePrintCustomModel
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (_MLVNScenePrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)scenePrintRequestRevision;
@end

@implementation _MLVNScenePrintCustomModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_modelDescription, 0);
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)scenePrintRequestRevision
{
  return self->_scenePrintRequestRevision;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  v10 = +[_MLVNFrameworkHandle sharedHandle];
  if ([v10 isValid])
  {
    v11 = [(MLModelDescription *)self->_modelDescription inputDescriptionsByName];
    v12 = [v11 allKeys];
    v13 = [v12 objectAtIndexedSubscript:0];

    v14 = [v8 featureValueForName:v13];
    uint64_t v15 = [v14 imageBufferValue];

    if (v15)
    {
      if ([v9 predictionUsesCPU])
      {
        BOOL v16 = 1;
      }
      else
      {
        v23 = +[MLInternalSettings globalSettings];
        BOOL v16 = ([v23 restrictNeuralNetworksToUseCPUOnly] & 1) != 0
           || [(MLModelConfiguration *)self->_configuration computeUnits] == MLComputeUnitsCPUOnly;
      }
      unint64_t scenePrintRequestRevision = self->_scenePrintRequestRevision;
      id v33 = 0;
      v21 = [v10 scenePrintsFromPixelBuffers:v15 version:scenePrintRequestRevision augmentationOptions:0 useCPUOnly:v16 error:&v33];
      id v19 = v33;
      if (!v19 && [v21 count])
      {
        v32 = [v21 objectAtIndexedSubscript:0];
        v25 = -[_MLVNScenePrintCustomModel featureValueFromScenePrint:elementSize:](self, "featureValueFromScenePrint:elementSize:", v32, [v32 length]/ (unint64_t)objc_msgSend(v10, "elementCountForScenePrintRequestRevision:", self->_scenePrintRequestRevision));
        v26 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
        v27 = [v26 allKeys];
        v28 = [v27 objectAtIndexedSubscript:0];

        v29 = [MLDictionaryFeatureProvider alloc];
        v34 = v28;
        v35 = v25;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        v18 = [(MLDictionaryFeatureProvider *)v29 initWithDictionary:v30 error:a5];

        id v19 = 0;
        goto LABEL_23;
      }
      if (!a5)
      {
        v18 = 0;
        goto LABEL_23;
      }
      id v22 = v19;
      id v19 = v22;
    }
    else
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_24;
      }
      id v19 = [NSString stringWithFormat:@"Input image feature '%@' not found", v13];
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      id v37 = v19;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v22 = [v20 errorWithDomain:@"com.apple" code:0 userInfo:v21];
    }
    v18 = 0;
    *a5 = v22;
LABEL_23:

    goto LABEL_24;
  }
  if (!a5)
  {
    v18 = 0;
    goto LABEL_25;
  }
  v17 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v39[0] = @"ScenePrint not available on this version";
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  [v17 errorWithDomain:@"com.apple" code:0 userInfo:v13];
  v18 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:

  return v18;
}

- (id)featureValueFromScenePrint:(id)a3 elementSize:(unint64_t)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 <= 4) {
    uint64_t v8 = 65568;
  }
  else {
    uint64_t v8 = 65600;
  }
  unint64_t v9 = [v6 length];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__8894;
  v31[4] = __Block_byref_object_dispose__8895;
  id v10 = v7;
  id v32 = v10;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69___MLVNScenePrintCustomModel_featureValueFromScenePrint_elementSize___block_invoke;
  v30[3] = &unk_1E59A5200;
  v30[4] = v31;
  v11 = _Block_copy(v30);
  v12 = [MLMultiArray alloc];
  id v13 = v10;
  uint64_t v14 = [v13 bytes];
  unint64_t v15 = v9 / a4;
  BOOL v16 = [NSNumber numberWithUnsignedInteger:v15];
  v34[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v18 = [(MLMultiArray *)v12 initWithDataPointer:v14 shape:v17 dataType:v8 strides:&unk_1EF11A940 deallocator:v11 error:0];

  id v19 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
  v20 = [v19 allValues];
  v21 = [v20 objectAtIndexedSubscript:0];
  id v22 = [v21 multiArrayConstraint];
  uint64_t v23 = [v22 dataType];

  if (v23 == v8)
  {
    v24 = v18;
  }
  else
  {
    v25 = [MLMultiArray alloc];
    v26 = [NSNumber numberWithUnsignedInteger:v15];
    id v33 = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    v24 = [(MLMultiArray *)v25 initWithShape:v27 dataType:v23 error:0];

    [(MLMultiArray *)v18 copyIntoMultiArray:v24 error:0];
  }
  v28 = +[MLFeatureValue featureValueWithMultiArray:v24];

  _Block_object_dispose(v31, 8);

  return v28;
}

- (_MLVNScenePrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLVNFrameworkHandle sharedHandle];
  if ([v11 isValid])
  {
    if (v10)
    {
      v12 = [v10 objectForKeyedSubscript:@"MLScenePrintRequestRevision"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v13 = [v12 unsignedIntegerValue];
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
      }
      else
      {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
    v18 = [v9 inputDescriptionsByName];
    if ([v18 count] == 1)
    {
      uint64_t v50 = v14;
      id v19 = [v9 inputDescriptionsByName];
      v20 = [v19 allValues];
      v21 = [v20 objectAtIndexedSubscript:0];
      v51 = self;
      uint64_t v22 = [v21 type];

      BOOL v23 = v22 == 4;
      self = v51;
      if (v23)
      {
        v24 = [v9 outputDescriptionsByName];
        if ([v24 count] == 1)
        {
          v25 = [v9 outputDescriptionsByName];
          v26 = [v25 allValues];
          v27 = [v26 objectAtIndexedSubscript:0];
          uint64_t v28 = [v27 type];

          self = v51;
          if (v28 == 5)
          {
            uint64_t v49 = [v11 elementCountForScenePrintRequestRevision:v50];
            v29 = [v9 outputDescriptionsByName];
            v30 = [v29 allValues];
            BOOL v16 = [v30 objectAtIndexedSubscript:0];

            v31 = [v16 multiArrayConstraint];
            if (!v31) {
              goto LABEL_19;
            }
            id v32 = [NSNumber numberWithUnsignedInteger:v49];
            v55 = v32;
            id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
            char v34 = [v31 isAllowedShape:v33 error:0];

            if ((v34 & 1) == 0)
            {
              if (a5)
              {
                v46 = objc_msgSend(NSString, "stringWithFormat:", @"Must allow %lu-element vector as output", v49);
                v47 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v53 = *MEMORY[0x1E4F28568];
                v54 = v46;
                v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
                *a5 = [v47 errorWithDomain:@"com.apple" code:0 userInfo:v48];
              }
              v41 = 0;
              self = v51;
            }
            else
            {
LABEL_19:
              v52.receiver = v51;
              v52.super_class = (Class)_MLVNScenePrintCustomModel;
              v35 = [(_MLVNScenePrintCustomModel *)&v52 init];
              uint64_t v36 = v35;
              if (v35)
              {
                objc_storeStrong((id *)&v35->_modelDescription, a3);
                v36->_unint64_t scenePrintRequestRevision = v50;
                uint64_t v37 = [v10 objectForKeyedSubscript:@"MLScenePrintConfiguration"];
                configuration = v36->_configuration;
                v36->_configuration = (MLModelConfiguration *)v37;

                if (!v36->_configuration)
                {
                  v39 = objc_alloc_init(MLModelConfiguration);
                  v40 = v36->_configuration;
                  v36->_configuration = v39;
                }
              }
              self = v36;
              v41 = self;
            }

            goto LABEL_28;
          }
        }
        else
        {
        }
        if (a5)
        {
          uint64_t v56 = *MEMORY[0x1E4F28568];
          v57 = @"Must only have one output multiarray feature";
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v57;
          v44 = &v56;
          goto LABEL_26;
        }
LABEL_32:
        v41 = 0;
        goto LABEL_33;
      }
    }
    else
    {
    }
    if (a5)
    {
      uint64_t v58 = *MEMORY[0x1E4F28568];
      v59 = @"Must only have one input image feature";
      v42 = (void *)MEMORY[0x1E4F1C9E8];
      v43 = &v59;
      v44 = &v58;
LABEL_26:
      BOOL v16 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
      v17 = (void *)MEMORY[0x1E4F28C58];
      goto LABEL_27;
    }
    goto LABEL_32;
  }
  if (!a5) {
    goto LABEL_32;
  }
  unint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v60 = *MEMORY[0x1E4F28568];
  v61[0] = @"ScenePrint not available on this version";
  BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  v17 = v15;
LABEL_27:
  [v17 errorWithDomain:@"com.apple" code:0 userInfo:v16];
  v41 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_33:
  return v41;
}

@end