@interface _MLVNDetectionPrintCustomModel
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (NSDictionary)expectedOutputShapeV1;
- (_MLVNDetectionPrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)featureValueFromDetectionPrint:(id)a3 featureName:(id)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)detectionPrintRequestRevision;
@end

@implementation _MLVNDetectionPrintCustomModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_expectedOutputShapeV1, 0);

  objc_storeStrong((id *)&self->_modelDescription, 0);
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NSDictionary)expectedOutputShapeV1
{
  return self->_expectedOutputShapeV1;
}

- (unint64_t)detectionPrintRequestRevision
{
  return self->_detectionPrintRequestRevision;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = +[_MLVNFrameworkHandle sharedHandle];
  if ([v10 isValid])
  {
    if (!v9)
    {
      id v9 = +[MLPredictionOptions defaultOptions];
    }
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
        v22 = +[MLInternalSettings globalSettings];
        BOOL v16 = ([v22 restrictNeuralNetworksToUseCPUOnly] & 1) != 0
           || [(MLModelConfiguration *)self->_configuration computeUnits] == MLComputeUnitsCPUOnly;
      }
      unint64_t detectionPrintRequestRevision = self->_detectionPrintRequestRevision;
      id v48 = 0;
      v21 = [v10 detectionPrintsFromPixelBuffers:v15 version:detectionPrintRequestRevision augmentationOptions:0 useCPUOnly:v16 error:&v48];
      id v19 = v48;
      if (v19)
      {
        v24 = [NSString stringWithFormat:@"Failed to compute detection print"];
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v50 = *MEMORY[0x1E4F28568];
        v51 = v24;
        id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        [v25 errorWithDomain:@"com.apple" code:0 userInfo:v26];
        v18 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v39 = v13;
        v40 = a5;
        v41 = v10;
        id v42 = v9;
        id v43 = v8;
        v38 = v21;
        v24 = [v21 firstObject];
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v27 = [(MLModelDescription *)self->_modelDescription outputDescriptionsByName];
        v28 = [v27 allValues];

        uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              v34 = [v33 name];
              v35 = [(_MLVNDetectionPrintCustomModel *)self featureValueFromDetectionPrint:v24 featureName:v34];

              v36 = [v33 name];
              [v26 setObject:v35 forKey:v36];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v49 count:16];
          }
          while (v30);
        }

        v18 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v26 error:v40];
        id v9 = v42;
        id v8 = v43;
        v10 = v41;
        id v19 = 0;
        v13 = v39;
        v21 = v38;
      }
    }
    else
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_28;
      }
      id v19 = [NSString stringWithFormat:@"Input image feature '%@' not found", v13];
      v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      id v53 = v19;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      [v20 errorWithDomain:@"com.apple" code:0 userInfo:v21];
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!a5)
    {
      v18 = 0;
      goto LABEL_29;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55[0] = @"DetectionPrint not available on this version";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    [v17 errorWithDomain:@"com.apple" code:0 userInfo:v13];
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_28:

LABEL_29:

  return v18;
}

- (id)featureValueFromDetectionPrint:(id)a3 featureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:v7];
  id v9 = v8;
  if (v8)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__20079;
    v20[4] = __Block_byref_object_dispose__20080;
    id v10 = v8;
    id v21 = v10;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77___MLVNDetectionPrintCustomModel_featureValueFromDetectionPrint_featureName___block_invoke;
    aBlock[3] = &unk_1E59A5200;
    aBlock[4] = v20;
    v11 = _Block_copy(aBlock);
    v12 = [(NSDictionary *)self->_expectedOutputShapeV1 objectForKey:v7];
    v13 = [MLMultiArray alloc];
    uint64_t v14 = [v10 bytes];
    uint64_t v15 = +[MLDataConversionUtils stridesForShape:v12];
    BOOL v16 = [(MLMultiArray *)v13 initWithDataPointer:v14 shape:v12 dataType:65568 strides:v15 deallocator:v11 error:0];

    v17 = +[MLFeatureValue featureValueWithMultiArray:v16];

    _Block_object_dispose(v20, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (_MLVNDetectionPrintCustomModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  v102[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[_MLVNFrameworkHandle sharedHandle];
  if (([v11 isValid] & 1) == 0)
  {
    if (a5)
    {
      long long v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v101 = *MEMORY[0x1E4F28568];
      v102[0] = @"DetectionPrint not available on this version";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
      [v47 errorWithDomain:@"com.apple" code:0 userInfo:v12];
      long long v46 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    long long v46 = 0;
    goto LABEL_45;
  }
  v12 = [v11 detectionPrintSupportedRevisions];
  if (!v12)
  {
    if (a5)
    {
      id v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v99 = *MEMORY[0x1E4F28568];
      v100 = @"DetectionPrint unable to get supported revisions";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      [v48 errorWithDomain:@"com.apple" code:0 userInfo:v27];
      long long v46 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    }
    v12 = 0;
    long long v46 = 0;
    goto LABEL_44;
  }
  v80 = self;
  id v13 = v10;
  uint64_t v14 = [v12 firstObject];
  unint64_t v77 = [v14 unsignedIntegerValue];

  uint64_t v15 = [v12 lastObject];
  unint64_t v16 = [v15 unsignedIntegerValue];

  if (v13)
  {
    v17 = [v13 objectForKeyedSubscript:@"MLDetectionPrintRequestRevision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v18 = [v17 unsignedIntegerValue];
      unint64_t v19 = v77;
      if (v18 <= v16 && v18 >= v77) {
        unint64_t v19 = v18;
      }
      unint64_t v77 = v19;
    }
  }
  id v21 = [v9 inputDescriptionsByName];
  if ([v21 count] != 1)
  {

    goto LABEL_38;
  }
  v22 = [v9 inputDescriptionsByName];
  [v22 allValues];
  v23 = v76 = v9;
  [v23 objectAtIndexedSubscript:0];
  v24 = id v75 = v10;
  uint64_t v25 = [v24 type];

  id v10 = v75;
  id v9 = v76;

  if (v25 != 4)
  {
LABEL_38:
    if (!a5)
    {
      long long v46 = 0;
      self = v80;
      goto LABEL_44;
    }
    v49 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v97 = *MEMORY[0x1E4F28568];
    v98 = @"Must only have one input feature of image type";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    [v49 errorWithDomain:@"com.apple" code:0 userInfo:v27];
    long long v46 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:
    self = v80;
    goto LABEL_41;
  }
  uint64_t v26 = [v11 detectionPrintShapes:v77];
  if (!v26)
  {
    if (a5)
    {
      v51 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v95 = *MEMORY[0x1E4F28568];
      v96 = @"DetectionPrint unable to get expected shapes";
      uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      *a5 = [v51 errorWithDomain:@"com.apple" code:0 userInfo:v52];

      id v10 = v75;
    }
    v27 = 0;
    long long v46 = 0;
    goto LABEL_40;
  }
  v27 = (void *)v26;
  v28 = [v76 outputDescriptionsByName];
  uint64_t v29 = [v28 count];
  uint64_t v30 = [v27 count];

  if (v29 != v30)
  {
    if (a5)
    {
      id v53 = NSString;
      uint64_t v54 = [v76 outputDescriptionsByName];
      v55 = objc_msgSend(v53, "stringWithFormat:", @"Output count %lu does not match expected %lu in the request revision %lu", objc_msgSend(v54, "count"), objc_msgSend(v27, "count"), v77);

      v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v93 = *MEMORY[0x1E4F28568];
      v94 = v55;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      *a5 = [v56 errorWithDomain:@"com.apple" code:0 userInfo:v57];
    }
    long long v46 = 0;
    id v10 = v75;
    goto LABEL_40;
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v31 = [v76 outputDescriptionsByName];
  v32 = [v31 allValues];

  id obj = v32;
  uint64_t v73 = [v32 countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (!v73) {
    goto LABEL_28;
  }
  uint64_t v74 = *(void *)v83;
  while (2)
  {
    for (uint64_t i = 0; i != v73; ++i)
    {
      if (*(void *)v83 != v74) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      if ([v34 type] != 5)
      {
        id v10 = v75;
        self = v80;
        if (!a5) {
          goto LABEL_61;
        }
        v37 = v27;
        v58 = NSString;
        v59 = [v34 name];
        v36 = [v58 stringWithFormat:@"Output %@ is not a MultiArray", v59];

        id v10 = v75;
        v60 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v90 = *MEMORY[0x1E4F28568];
        v91 = v36;
        v61 = (void *)MEMORY[0x1E4F1C9E8];
        v62 = &v91;
        v63 = &v90;
LABEL_56:
        v39 = [v61 dictionaryWithObjects:v62 forKeys:v63 count:1];
        *a5 = [v60 errorWithDomain:@"com.apple" code:0 userInfo:v39];
        goto LABEL_60;
      }
      v35 = [v34 name];
      v36 = [v27 objectForKey:v35];

      if (!v36)
      {
        id v10 = v75;
        self = v80;
        if (!a5) {
          goto LABEL_61;
        }
        v37 = v27;
        v64 = NSString;
        v65 = [v34 name];
        v36 = [v64 stringWithFormat:@"Output feature %@ not expected", v65];

        id v10 = v75;
        v60 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v86 = *MEMORY[0x1E4F28568];
        v87 = v36;
        v61 = (void *)MEMORY[0x1E4F1C9E8];
        v62 = &v87;
        v63 = &v86;
        goto LABEL_56;
      }
      v37 = v27;
      v38 = [v34 multiArrayConstraint];
      v39 = v38;
      if (v38 && ([v38 isAllowedShape:v36 error:0] & 1) == 0)
      {
        if (a5)
        {
          v78 = NSString;
          v66 = [v36 objectAtIndexedSubscript:0];
          v67 = [v36 objectAtIndexedSubscript:1];
          v68 = [v36 objectAtIndexedSubscript:2];
          v69 = [v34 name];
          v79 = [v78 stringWithFormat:@"Must allow (%@, %@, %@) vector for output feature %@", v66, v67, v68, v69];

          v70 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          v89 = v79;
          v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          *a5 = [v70 errorWithDomain:@"com.apple" code:0 userInfo:v71];
        }
        id v10 = v75;
        self = v80;
LABEL_60:

        v27 = v37;
LABEL_61:

        long long v46 = 0;
        id v9 = v76;
        goto LABEL_41;
      }

      id v9 = v76;
      v27 = v37;
    }
    uint64_t v73 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v73) {
      continue;
    }
    break;
  }
LABEL_28:

  v81.receiver = v80;
  v81.super_class = (Class)_MLVNDetectionPrintCustomModel;
  v40 = [(_MLVNDetectionPrintCustomModel *)&v81 init];
  v41 = v40;
  if (v40)
  {
    objc_storeStrong((id *)&v40->_modelDescription, a3);
    v41->_unint64_t detectionPrintRequestRevision = v77;
    objc_storeStrong((id *)&v41->_expectedOutputShapeV1, v27);
    uint64_t v42 = [v13 objectForKeyedSubscript:@"MLDetectionPrintConfiguration"];
    configuration = v41->_configuration;
    v41->_configuration = (MLModelConfiguration *)v42;

    if (!v41->_configuration)
    {
      long long v44 = objc_alloc_init(MLModelConfiguration);
      long long v45 = v41->_configuration;
      v41->_configuration = v44;
    }
  }
  self = v41;
  long long v46 = self;
  id v10 = v75;
LABEL_41:

LABEL_44:
LABEL_45:

  return v46;
}

@end