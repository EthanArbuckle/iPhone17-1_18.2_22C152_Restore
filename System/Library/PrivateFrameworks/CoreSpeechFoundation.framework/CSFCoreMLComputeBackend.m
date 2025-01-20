@interface CSFCoreMLComputeBackend
- (BOOL)_populateModelInterfaceParameters;
- (CSFCoreMLComputeBackend)initWithModelFile:(id)a3 error:(id *)a4;
- (MLModel)coremlModel;
- (MLPredictionOptions)options;
- (NSDictionary)inputSpecs;
- (NSDictionary)outputSpecs;
- (id)_convertDataBufferToMLMultiArray:(id)a3 error:(id *)a4;
- (id)_convertInputToCoreMLInputs:(id)a3 error:(id *)a4;
- (id)_convertOuputsToNSArrayWithCoreMLOutputs:(id)a3 error:(id *)a4;
- (id)_fetchTensorPropertiesWithFeatDesc:(id)a3;
- (id)getExpectedInputTensors;
- (id)getExpectedOutputTensors;
- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4;
- (int64_t)_getMLMultiArrayDataTypeForComputeType:(unint64_t)a3;
- (unint64_t)_getComputeDataTypeForMLType:(int64_t)a3;
- (void)setCoremlModel:(id)a3;
- (void)setInputSpecs:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOutputSpecs:(id)a3;
@end

@implementation CSFCoreMLComputeBackend

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_coremlModel, 0);
  objc_storeStrong((id *)&self->_outputSpecs, 0);
  objc_storeStrong((id *)&self->_inputSpecs, 0);
}

- (void)setOptions:(id)a3
{
}

- (MLPredictionOptions)options
{
  return self->_options;
}

- (void)setCoremlModel:(id)a3
{
}

- (MLModel)coremlModel
{
  return self->_coremlModel;
}

- (void)setOutputSpecs:(id)a3
{
}

- (NSDictionary)outputSpecs
{
  return self->_outputSpecs;
}

- (void)setInputSpecs:(id)a3
{
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (int64_t)_getMLMultiArrayDataTypeForComputeType:(unint64_t)a3
{
  int64_t v3 = 65600;
  if (a3 == 1) {
    int64_t v3 = 65568;
  }
  if (a3) {
    return v3;
  }
  else {
    return 131104;
  }
}

- (unint64_t)_getComputeDataTypeForMLType:(int64_t)a3
{
  unint64_t v3 = 2;
  if (a3 == 131104) {
    unint64_t v3 = 0;
  }
  if (a3 == 65600) {
    unint64_t v3 = 1;
  }
  if (a3 == 65568) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)_convertOuputsToNSArrayWithCoreMLOutputs:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [v5 featureNames];
  uint64_t v59 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
  id v7 = 0;
  if (v59)
  {
    uint64_t v58 = *(void *)v69;
    uint64_t v52 = *MEMORY[0x1E4F28568];
    v53 = a4;
    v56 = v6;
    id v57 = v5;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      id v62 = v7;
      if (*(void *)v69 != v58) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v68 + 1) + 8 * v8);
      v10 = [v5 featureValueForName:v9];
      v11 = [v10 multiArrayValue];
      v12 = [v11 shape];
      v63 = +[CSFTensorProperties propertyWithShape:dataType:](CSFTensorProperties, "propertyWithShape:dataType:", v12, -[CSFCoreMLComputeBackend _getComputeDataTypeForMLType:](self, "_getComputeDataTypeForMLType:", [v11 dataType]));
      if ([v12 count] == 1)
      {
        v61 = v10;
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v14 = [v12 objectAtIndexedSubscript:0];
        uint64_t v15 = [v14 unsignedLongValue];

        if (v15)
        {
          unint64_t v16 = 0;
          do
          {
            v17 = [v11 objectAtIndexedSubscript:v16];
            [v13 addObject:v17];

            ++v16;
            v18 = [v12 objectAtIndexedSubscript:0];
            unint64_t v19 = [v18 unsignedLongValue];
          }
          while (v16 < v19);
        }
        v20 = v11;
        v21 = [CSFComputeDataBuffer alloc];
        v22 = v62;
        id v67 = v62;
        v23 = &v67;
        v24 = [(CSFComputeDataBuffer *)v21 initWithInputArray:v13 name:v9 properties:v63 errOut:&v67];
      }
      else
      {
        if ([v12 count] != 2)
        {
          if (a4)
          {
            v46 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v72 = v52;
            [NSString stringWithFormat:@"output shape not supported"];
            v48 = v47 = v11;
            v73 = v48;
            v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
            *a4 = [v46 errorWithDomain:@"com.apple.corespeech" code:2455 userInfo:v49];

            v11 = v47;
          }
          int v45 = 0;
          id v7 = v62;
          goto LABEL_28;
        }
        uint64_t v54 = v9;
        v61 = v10;
        id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v25 = [v12 objectAtIndexedSubscript:0];
        uint64_t v26 = [v25 unsignedLongValue];

        if (v26)
        {
          unint64_t v27 = 0;
          do
          {
            id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v28 = [v12 objectAtIndexedSubscript:1];
            uint64_t v29 = [v28 unsignedLongValue];

            v30 = v12;
            if (v29)
            {
              unint64_t v31 = 0;
              do
              {
                v32 = [NSNumber numberWithUnsignedInteger:v27];
                v74[0] = v32;
                v33 = [NSNumber numberWithUnsignedInteger:v31];
                v74[1] = v33;
                [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
                v35 = unint64_t v34 = v27;
                [v11 objectForKeyedSubscript:v35];
                v37 = v36 = v11;
                [v65 addObject:v37];

                ++v31;
                v38 = [v30 objectAtIndexedSubscript:1];
                unint64_t v39 = [v38 unsignedLongValue];

                v11 = v36;
                BOOL v40 = v31 >= v39;
                unint64_t v27 = v34;
              }
              while (!v40);
            }
            v41 = (void *)[v65 copy];
            [v64 addObject:v41];

            ++v27;
            v42 = [v30 objectAtIndexedSubscript:0];
            unint64_t v43 = [v42 unsignedLongValue];

            v12 = v30;
          }
          while (v27 < v43);
        }
        v20 = v11;
        v44 = [CSFComputeDataBuffer alloc];
        v22 = v62;
        id v66 = v62;
        v23 = &v66;
        id v13 = v64;
        uint64_t v9 = v54;
        v24 = [(CSFComputeDataBuffer *)v44 initWithInputArray:v64 name:v54 properties:v63 errOut:&v66];
        a4 = v53;
      }
      id v7 = *v23;

      id v6 = v56;
      [v56 setObject:v24 forKey:v9];

      int v45 = 1;
      v11 = v20;
      if (a4)
      {
        id v5 = v57;
        if (v7)
        {
          id v7 = v7;
          int v45 = 0;
          *a4 = v7;
        }
      }
      else
      {
        id v5 = v57;
      }
      v10 = v61;
LABEL_28:

      if (!v45)
      {

        v50 = 0;
        goto LABEL_33;
      }
      if (++v8 == v59)
      {
        uint64_t v59 = [obj countByEnumeratingWithState:&v68 objects:v75 count:16];
        if (v59) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v50 = (void *)[v6 copy];
LABEL_33:

  return v50;
}

- (id)_convertDataBufferToMLMultiArray:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 tensorProperties];
  uint64_t v8 = [v7 shape];

  uint64_t v9 = [v6 tensorProperties];
  int64_t v10 = -[CSFCoreMLComputeBackend _getMLMultiArrayDataTypeForComputeType:](self, "_getMLMultiArrayDataTypeForComputeType:", [v9 dataType]);

  if ([v8 count] == 1)
  {
    v11 = &unk_1F13B84D0;
  }
  else
  {
    if ([v8 count] != 2)
    {
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:2455 userInfo:0];
        uint64_t v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v15 = 0;
      }
      goto LABEL_8;
    }
    v12 = [v8 objectAtIndexedSubscript:1];
    v19[0] = v12;
    v19[1] = &unk_1F13B8410;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1E9A0]);
  id v14 = [v6 data];
  id v18 = 0;
  uint64_t v15 = objc_msgSend(v13, "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v14, "bytes"), v8, v10, v11, 0, &v18);
  id v16 = v18;

  if (a4) {
    *a4 = v16;
  }

LABEL_8:
  return v15;
}

- (id)_convertInputToCoreMLInputs:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    uint64_t v29 = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, v29);
        id v14 = [(NSDictionary *)self->_inputSpecs objectForKeyedSubscript:v12];
        uint64_t v15 = [v13 tensorProperties];
        char v16 = [v14 isEqual:v15];

        if ((v16 & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v41 = *MEMORY[0x1E4F28568];
          uint64_t v26 = [NSString stringWithFormat:@"Unable to read interface specs"];
          v42 = v26;
          unint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          id v22 = [v25 errorWithDomain:@"com.apple.corespeech" code:2455 userInfo:v27];

          if (v29)
          {
            id v22 = v22;
            *uint64_t v29 = v22;
          }
          goto LABEL_25;
        }
        id v32 = 0;
        v17 = [(CSFCoreMLComputeBackend *)self _convertDataBufferToMLMultiArray:v13 error:&v32];
        id v18 = v32;
        if (v17) {
          BOOL v19 = v18 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (!v19)
        {
          id v22 = v18;
          if (v29) {
            *uint64_t v29 = v18;
          }

LABEL_25:
          v24 = 0;
          id v20 = v7;
          goto LABEL_26;
        }
        [v30 setObject:v17 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
      a4 = v29;
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v31 = 0;
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F1E928]) initWithDictionary:v30 error:&v31];
  id v21 = v31;
  id v22 = v21;
  if (v21)
  {
    if (a4) {
      *a4 = v21;
    }
    v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[CSFCoreMLComputeBackend _convertInputToCoreMLInputs:error:]";
      __int16 v39 = 2112;
      id v40 = v22;
      _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s features input conversion to MLDictionaryFeatureProvider with error: %@", buf, 0x16u);
    }
    v24 = 0;
  }
  else
  {
    id v20 = v20;
    v24 = v20;
  }
LABEL_26:

  return v24;
}

- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4
{
  id v19 = 0;
  id v6 = [(CSFCoreMLComputeBackend *)self _convertInputToCoreMLInputs:a3 error:&v19];
  id v7 = v19;
  if (v7)
  {
    id v8 = v7;
    if (a4)
    {
      id v8 = v7;
      id v9 = 0;
      *a4 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    coremlModel = self->_coremlModel;
    options = self->_options;
    id v18 = 0;
    uint64_t v12 = [(MLModel *)coremlModel predictionFromFeatures:v6 options:options error:&v18];
    id v13 = v18;
    if (v13)
    {
      id v8 = v13;
      if (a4)
      {
        id v8 = v13;
        id v9 = 0;
        *a4 = v8;
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v17 = 0;
      id v14 = [(CSFCoreMLComputeBackend *)self _convertOuputsToNSArrayWithCoreMLOutputs:v12 error:&v17];
      id v15 = v17;
      id v8 = v15;
      if (v15)
      {
        id v9 = 0;
        if (a4) {
          *a4 = v15;
        }
      }
      else
      {
        id v9 = v14;
      }
    }
  }

  return v9;
}

- (id)getExpectedOutputTensors
{
  return self->_outputSpecs;
}

- (id)getExpectedInputTensors
{
  return self->_inputSpecs;
}

- (id)_fetchTensorPropertiesWithFeatDesc:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CSFCoreMLComputeBackend__fetchTensorPropertiesWithFeatDesc___block_invoke;
  v11[3] = &unk_1E6200C40;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

void __62__CSFCoreMLComputeBackend__fetchTensorPropertiesWithFeatDesc___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  id v8 = [v7 multiArrayConstraint];
  id v9 = [v8 shape];

  uint64_t v10 = *(void **)(a1 + 32);
  v11 = [v7 multiArrayConstraint];

  uint64_t v12 = objc_msgSend(v10, "_getComputeDataTypeForMLType:", objc_msgSend(v11, "dataType"));
  if (v12 == 2)
  {
    *a4 = 1;
  }
  else
  {
    id v13 = +[CSFTensorProperties propertyWithShape:v9 dataType:v12];
    [*(id *)(a1 + 40) setObject:v13 forKey:v14];
  }
}

- (BOOL)_populateModelInterfaceParameters
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MLModel *)self->_coremlModel modelDescription];
  v4 = [v3 inputDescriptionsByName];

  id v5 = [(CSFCoreMLComputeBackend *)self _fetchTensorPropertiesWithFeatDesc:v4];
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v5;

  NSUInteger v7 = [(NSDictionary *)self->_inputSpecs count];
  if (v7 == [v4 count])
  {
    id v8 = [(MLModel *)self->_coremlModel modelDescription];
    id v9 = [v8 outputDescriptionsByName];

    uint64_t v10 = [(CSFCoreMLComputeBackend *)self _fetchTensorPropertiesWithFeatDesc:v9];
    outputSpecs = self->_outputSpecs;
    self->_outputSpecs = v10;

    NSUInteger v12 = [(NSDictionary *)self->_outputSpecs count];
    BOOL v13 = v12 == [v9 count];
    if (!v13)
    {
      id v14 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315138;
        id v18 = "-[CSFCoreMLComputeBackend _populateModelInterfaceParameters]";
        _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Unable to extract input tensor descriptors", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    id v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[CSFCoreMLComputeBackend _populateModelInterfaceParameters]";
      _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Unable to extract input tensor descriptors", (uint8_t *)&v17, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (CSFCoreMLComputeBackend)initWithModelFile:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSFCoreMLComputeBackend;
  NSUInteger v7 = [(CSFCoreMLComputeBackend *)&v21 init];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1E988]);
    [v9 setComputeUnits:0];
    id v20 = 0;
    uint64_t v10 = [MEMORY[0x1E4F1E970] modelWithContentsOfURL:v8 configuration:v9 error:&v20];
    id v11 = v20;
    coremlModel = v7->_coremlModel;
    v7->_coremlModel = (MLModel *)v10;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
LABEL_10:

      id v15 = 0;
      goto LABEL_11;
    }
    BOOL v13 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x1E4F1E9D8]);
    options = v7->_options;
    v7->_options = v13;

    if (![(CSFCoreMLComputeBackend *)v7 _populateModelInterfaceParameters])
    {
      if (a4)
      {
        char v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        int v17 = [NSString stringWithFormat:@"Unable to read interface specs"];
        v23[0] = v17;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
        *a4 = [v16 errorWithDomain:@"com.apple.corespeech" code:2457 userInfo:v18];
      }
      goto LABEL_10;
    }
  }
  id v15 = v7;
LABEL_11:

  return v15;
}

@end