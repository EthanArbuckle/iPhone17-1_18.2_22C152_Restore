@interface MLModelDescription
+ (BOOL)supportsSecureCoding;
+ (id)metadataWithFormat:(void *)a3;
+ (id)metadataWithSpecification:(void *)a3;
- (BOOL)hasEnumeratedShapeInputs;
- (BOOL)hasRangeShapeInputs;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescription:(id)a3;
- (BOOL)isUpdatable;
- (BOOL)validateAsClassifierDescriptionAndReturnError:(id *)a3;
- (BOOL)validateAsRegressorDescriptionAndReturnError:(id *)a3;
- (BOOL)verifyInput:(id)a3 error:(id *)a4;
- (MLFeatureDescription)classProbabilityFeatureDescription;
- (MLFeatureDescription)predictedClassFeatureDescription;
- (MLFeatureDescription)predictedValueFeatureDescription;
- (MLLayerPath)modelPath;
- (MLModelDescription)initWithCoder:(id)a3;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 functionDescriptions:(id)a7 isUpdatable:(BOOL)a8 trainingInputDescriptions:(id)a9 parameterDescriptions:(id)a10 orderedInputFeatureNames:(id)a11 orderedOutputFeatureNames:(id)a12 metadata:(id)a13 defaultFunctionName:(id)a14 functionName:(id)a15 classLabels:(id)a16 modelURL:(id)a17 modelPath:(id)a18;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 metadata:(id)a7;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 metadata:(id)a8;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 metadata:(id)a10;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionDescriptions:(id)a8 isUpdatable:(BOOL)a9 trainingInputDescriptions:(id)a10 parameterDescriptions:(id)a11 orderedInputFeatureNames:(id)a12 orderedOutputFeatureNames:(id)a13 orderedStateFeatureNames:(id)a14 metadata:(id)a15 defaultFunctionName:(id)a16 functionName:(id)a17 classLabels:(id)a18 modelURL:(id)a19 modelPath:(id)a20;
- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionName:(id)a8;
- (NSArray)classLabels;
- (NSDictionary)inputDescriptionsByName;
- (NSDictionary)metadata;
- (NSDictionary)outputDescriptionsByName;
- (NSDictionary)parameterDescriptionsByKey;
- (NSDictionary)stateDescriptionsByName;
- (NSDictionary)trainingInputDescriptionsByName;
- (NSOrderedSet)inputFeatureNames;
- (NSOrderedSet)outputFeatureNames;
- (NSOrderedSet)stateFeatureNames;
- (NSString)functionName;
- (NSString)predictedFeatureName;
- (NSString)predictedProbabilitiesName;
- (NSURL)modelURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultFunctionName;
- (id)description;
- (id)functionDescriptions;
- (id)initFromModelDescriptionSpecification:(void *)a3;
- (id)initFromRawCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4;
- (id)initFromRawModelSpecification:(void *)a3;
- (id)initFromSingleFunctionCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4;
- (id)initFromSingleFunctionModelDescriptionSpecification:(void *)a3;
- (id)initFromSingleFunctionModelSpecification:(void *)a3;
- (id)modelDescriptionBySettingMetadata:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClassLabels:(id)a3;
- (void)setIsUpdatable:(BOOL)a3;
- (void)setModelPath:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setParameterDescriptionsByKey:(id)a3;
- (void)setTrainingInputDescriptionsByName:(id)a3;
@end

@implementation MLModelDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateFeatureNames, 0);
  objc_storeStrong((id *)&self->_outputFeatureNames, 0);
  objc_storeStrong((id *)&self->_inputFeatureNames, 0);
  objc_storeStrong((id *)&self->_modelPath, 0);
  objc_storeStrong((id *)&self->_parameterDescriptionsByKey, 0);
  objc_storeStrong((id *)&self->_trainingInputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_predictedProbabilitiesName, 0);
  objc_storeStrong((id *)&self->_predictedFeatureName, 0);
  objc_storeStrong((id *)&self->_stateDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_outputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_inputDescriptionsByName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_defaultFunctionName, 0);

  objc_storeStrong((id *)&self->_functionDescriptions, 0);
}

- (NSDictionary)outputDescriptionsByName
{
  return self->_outputDescriptionsByName;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionDescriptions:(id)a8 isUpdatable:(BOOL)a9 trainingInputDescriptions:(id)a10 parameterDescriptions:(id)a11 orderedInputFeatureNames:(id)a12 orderedOutputFeatureNames:(id)a13 orderedStateFeatureNames:(id)a14 metadata:(id)a15 defaultFunctionName:(id)a16 functionName:(id)a17 classLabels:(id)a18 modelURL:(id)a19 modelPath:(id)a20
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v85 = a4;
  id v92 = a5;
  id v73 = a6;
  id v74 = a6;
  id v72 = a7;
  id v75 = a7;
  id v71 = a8;
  id v76 = a8;
  id v77 = a10;
  id v78 = a11;
  id v88 = a12;
  id v87 = a13;
  id v86 = a14;
  id v90 = a15;
  id v79 = a16;
  id v80 = a17;
  id v81 = a18;
  id v82 = a19;
  id v91 = a20;
  v93.receiver = self;
  v93.super_class = (Class)MLModelDescription;
  v25 = [(MLModelDescription *)&v93 init];
  if (!v25) {
    goto LABEL_47;
  }
  if (v90) {
    id v84 = v90;
  }
  else {
    id v84 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  if (v91) {
    v26 = (MLLayerPath *)v91;
  }
  else {
    v26 = objc_alloc_init(MLLayerPath);
  }
  v70 = v26;
  id v27 = v89;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (!v29)
  {

LABEL_22:
    v30 = (NSDictionary *)v28;
    goto LABEL_23;
  }
  v30 = 0;
  uint64_t v31 = *(void *)v95;
  do
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if (*(void *)v95 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void *)(*((void *)&v94 + 1) + 8 * i);
      v34 = [v28 objectForKeyedSubscript:v33];
      if ([v34 type] == 8)
      {
        if (!v30) {
          v30 = (NSDictionary *)[v28 mutableCopy];
        }
        [(NSDictionary *)v30 removeObjectForKey:v33];
      }
    }
    uint64_t v29 = [v28 countByEnumeratingWithState:&v94 objects:v98 count:16];
  }
  while (v29);

  if (!v30) {
    goto LABEL_22;
  }
LABEL_23:

  inputDescriptionsByName = v25->_inputDescriptionsByName;
  v25->_inputDescriptionsByName = v30;

  objc_storeStrong((id *)&v25->_outputDescriptionsByName, a4);
  uint64_t v36 = conformedStateDescriptions(v28, v92);
  stateDescriptionsByName = v25->_stateDescriptionsByName;
  v25->_stateDescriptionsByName = (NSDictionary *)v36;

  objc_storeStrong((id *)&v25->_predictedFeatureName, v73);
  objc_storeStrong((id *)&v25->_predictedProbabilitiesName, v72);
  v25->_isUpdatable = a9;
  objc_storeStrong((id *)&v25->_trainingInputDescriptionsByName, a10);
  objc_storeStrong((id *)&v25->_parameterDescriptionsByKey, a11);
  objc_storeStrong((id *)&v25->_metadata, v84);
  id v38 = v88;
  id v39 = v28;
  v40 = v39;
  if (v38)
  {
    id v41 = v38;
  }
  else
  {
    v42 = (void *)MEMORY[0x1E4F1CAA0];
    v43 = [v39 allKeys];
    id v41 = [v42 orderedSetWithArray:v43];
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v44 = v41;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v98 count:16];
  if (v45)
  {
    v46 = 0;
    uint64_t v47 = *(void *)v95;
    do
    {
      for (uint64_t j = 0; j != v45; ++j)
      {
        if (*(void *)v95 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v94 + 1) + 8 * j);
        v50 = [v40 objectForKeyedSubscript:v49];
        if ([v50 type] == 8)
        {
          if (!v46) {
            v46 = (NSOrderedSet *)[v44 mutableCopy];
          }
          [(NSOrderedSet *)v46 removeObject:v49];
        }
      }
      uint64_t v45 = [v44 countByEnumeratingWithState:&v94 objects:v98 count:16];
    }
    while (v45);

    if (v46) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  v46 = (NSOrderedSet *)v44;
LABEL_41:

  inputFeatureNames = v25->_inputFeatureNames;
  v25->_inputFeatureNames = v46;

  id v52 = v87;
  id v53 = v85;
  v54 = v53;
  if (v52)
  {
    v55 = (NSOrderedSet *)v52;
  }
  else
  {
    v56 = (void *)MEMORY[0x1E4F1CAA0];
    v57 = [v53 allKeys];
    v55 = [v56 orderedSetWithArray:v57];
  }
  outputFeatureNames = v25->_outputFeatureNames;
  v25->_outputFeatureNames = v55;

  id v59 = v86;
  id v60 = v40;
  id v61 = v92;
  id v62 = v59;
  uint64_t v63 = (uint64_t)v62;
  if (!v62)
  {
    v64 = conformedStateDescriptions(v60, v61);
    v65 = (void *)MEMORY[0x1E4F1CAA0];
    v66 = [v64 allKeys];
    uint64_t v63 = [v65 orderedSetWithArray:v66];
  }
  stateFeatureNames = v25->_stateFeatureNames;
  v25->_stateFeatureNames = (NSOrderedSet *)v63;

  objc_storeStrong((id *)&v25->_functionDescriptions, v71);
  objc_storeStrong((id *)&v25->_defaultFunctionName, a16);
  objc_storeStrong((id *)&v25->_functionName, a17);
  objc_storeStrong((id *)&v25->_classLabels, a18);
  objc_storeStrong((id *)&v25->_modelURL, a19);
  modelPath = v25->_modelPath;
  v25->_modelPath = v70;

LABEL_47:
  return v25;
}

+ (id)metadataWithFormat:(void *)a3
{
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = *(uint64_t **)(*(void *)a3 + 48);
  if (*((char *)v5 + 23) < 0) {
    v5 = (uint64_t *)*v5;
  }
  v6 = [NSString stringWithUTF8String:v5];
  [v4 setObject:v6 forKeyedSubscript:@"MLModelDescriptionKey"];

  v7 = *(uint64_t **)(*(void *)a3 + 56);
  if (*((char *)v7 + 23) < 0) {
    v7 = (uint64_t *)*v7;
  }
  v8 = [NSString stringWithUTF8String:v7];
  [v4 setObject:v8 forKeyedSubscript:@"MLModelVersionStringKey"];

  v9 = *(uint64_t **)(*(void *)a3 + 64);
  if (*((char *)v9 + 23) < 0) {
    v9 = (uint64_t *)*v9;
  }
  v10 = [NSString stringWithUTF8String:v9];
  [v4 setObject:v10 forKeyedSubscript:@"MLModelAuthorKey"];

  v11 = *(uint64_t **)(*(void *)a3 + 72);
  if (*((char *)v11 + 23) < 0) {
    v11 = (uint64_t *)*v11;
  }
  v12 = [NSString stringWithUTF8String:v11];
  [v4 setObject:v12 forKeyedSubscript:@"MLModelLicenseKey"];

  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v14 = (void *)MEMORY[0x19F3C29E0]();
  google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v22, *(void **)(*(void *)a3 + 40));
  while (v22[0])
  {
    v15 = (uint64_t *)*((void *)v22[0] + 3);
    if (*((char *)v15 + 23) < 0)
    {
      if (!v15[1]) {
        goto LABEL_26;
      }
      uint64_t v16 = *v15;
    }
    else
    {
      uint64_t v16 = *((void *)v22[0] + 3);
      if (!*((unsigned char *)v15 + 23)) {
        goto LABEL_26;
      }
    }
    v17 = [NSString stringWithUTF8String:v16];
    v18 = v15 + 3;
    if (*((char *)v15 + 47) < 0)
    {
      if (!v15[4])
      {
LABEL_22:
        char v19 = 1;
        v20 = &stru_1EF0E81D0;
        goto LABEL_23;
      }
      v18 = (void *)*v18;
    }
    else if (!*((unsigned char *)v15 + 47))
    {
      goto LABEL_22;
    }
    a3 = [NSString stringWithUTF8String:v18];
    char v19 = 0;
    v20 = (__CFString *)a3;
LABEL_23:
    [v13 setObject:v20 forKeyedSubscript:v17];
    if ((v19 & 1) == 0) {

    }
LABEL_26:
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++(v22);
  }
  [v4 setObject:v13 forKeyedSubscript:@"MLModelCreatorDefinedKey"];

  return v4;
}

- (id)initFromModelDescriptionSpecification:(void *)a3
{
  v4 = +[MLModelIOUtils inputDescriptionFromInterface:](MLModelIOUtils, "inputDescriptionFromInterface:");
  char v19 = +[MLModelIOUtils outputDescriptionFromInterface:a3];
  v18 = +[MLModelIOUtils stateDescriptionFromInterface:a3];
  v5 = +[MLModelIOUtils orderedInputFeatureNamesFromInterface:a3];
  v6 = +[MLModelIOUtils orderedOutputFeatureNamesFromInterface:a3];
  v7 = +[MLModelIOUtils orderedStateFeatureNamesFromInterface:a3];
  v8 = +[MLModelIOUtils trainingInputDescriptionFromInterface:a3];
  v9 = *(uint64_t **)(*(void *)a3 + 136);
  if (*((char *)v9 + 23) < 0) {
    v9 = (uint64_t *)*v9;
  }
  v23 = [NSString stringWithUTF8String:v9];
  v10 = *(uint64_t **)(*(void *)a3 + 144);
  if (*((char *)v10 + 23) < 0) {
    v10 = (uint64_t *)*v10;
  }
  v11 = v23;
  v22 = [NSString stringWithUTF8String:v10];
  if (![v23 length])
  {

    v11 = 0;
  }
  if (![v22 length])
  {

    v22 = 0;
  }
  if (*(uint64_t **)a3 == &CoreML::Specification::_ModelDescription_default_instance_
    || (v12 = *(const CoreML::Specification::Metadata **)(*(void *)a3 + 160)) == 0)
  {
    v17 = 0;
  }
  else
  {
    _MLModelMetadataSpecification::_MLModelMetadataSpecification((_MLModelMetadataSpecification *)v24, v12);
    v17 = [(id)objc_opt_class() metadataWithFormat:v24];
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
  }
  v13 = +[MLModelIOUtils functionDescriptionsFromDescriptionSpecification:a3];
  v14 = +[MLModelIOUtils defaultFunctionNameFromDescriptionSpecification:a3];
  LOBYTE(v16) = 0;
  v21 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v4, v19, v18, v11, v22, v13, v16, v8, 0, v5, v6, v7, v17, v14, 0,
          0,
          0,
          0);

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[MLModelDescription allocWithZone:](MLModelDescription, "allocWithZone:");
  id v28 = (void *)[(NSDictionary *)self->_inputDescriptionsByName copyWithZone:a3];
  id v27 = (void *)[(NSDictionary *)self->_outputDescriptionsByName copyWithZone:a3];
  v25 = (void *)[(NSDictionary *)self->_stateDescriptionsByName copyWithZone:a3];
  v24 = (void *)[(NSString *)self->_predictedFeatureName copyWithZone:a3];
  v23 = (void *)[(NSString *)self->_predictedProbabilitiesName copyWithZone:a3];
  uint64_t v6 = [(NSArray *)self->_functionDescriptions copyWithZone:a3];
  BOOL isUpdatable = self->_isUpdatable;
  v22 = (void *)v6;
  v8 = (void *)[(NSDictionary *)self->_trainingInputDescriptionsByName copyWithZone:a3];
  uint64_t v9 = [(NSDictionary *)self->_parameterDescriptionsByKey copyWithZone:a3];
  v10 = (void *)[(NSOrderedSet *)self->_inputFeatureNames copyWithZone:a3];
  v11 = (void *)[(NSOrderedSet *)self->_outputFeatureNames copyWithZone:a3];
  v12 = (void *)[(NSOrderedSet *)self->_stateFeatureNames copyWithZone:a3];
  v21 = (void *)[(NSDictionary *)self->_metadata copyWithZone:a3];
  v20 = (void *)[(NSString *)self->_defaultFunctionName copyWithZone:a3];
  char v19 = (void *)[(NSString *)self->_functionName copyWithZone:a3];
  v26 = (void *)v9;
  v18 = (void *)[(NSArray *)self->_classLabels copyWithZone:a3];
  v13 = (void *)[(NSURL *)self->_modelURL copyWithZone:a3];
  id v14 = [(MLLayerPath *)self->_modelPath copyWithZone:a3];
  LOBYTE(v16) = isUpdatable;
  v17 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](v5, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v28, v27, v25, v24, v23, v22, v16, v8, v26, v10, v11, v12, v21, v20, v19,
          v18,
          v13,
          v14);

  return v17;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setModelURL:(id)a3
{
}

- (void)setIsUpdatable:(BOOL)a3
{
  self->_BOOL isUpdatable = a3;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (id)initFromRawCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v9);
  if (+[MLModelIOUtils deserializeInterfaceFormat:&v9 archive:a3 error:a4])
  {
    self = (MLModelDescription *)[(MLModelDescription *)self initFromRawModelDescriptionSpecification:&v9];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v7;
}

- (id)functionDescriptions
{
  return self->_functionDescriptions;
}

- (id)defaultFunctionName
{
  return self->_defaultFunctionName;
}

- (void)setClassLabels:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (BOOL)hasRangeShapeInputs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(MLModelDescription *)self inputDescriptionsByName];
  v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)v14;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(v3);
      }
      v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if ([v7 type] == 5)
      {
        v8 = [v7 multiArrayConstraint];
        uint64_t v9 = [v8 shapeConstraint];
      }
      else
      {
        if ([v7 type] != 4) {
          continue;
        }
        v8 = [v7 imageConstraint];
        uint64_t v9 = [v8 sizeConstraint];
      }
      v10 = v9;
      uint64_t v11 = [v9 type];

      if (v11 == 3)
      {
        LOBYTE(v4) = 1;
        goto LABEL_15;
      }
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_15:

  return v4;
}

- (NSDictionary)inputDescriptionsByName
{
  return self->_inputDescriptionsByName;
}

- (NSDictionary)stateDescriptionsByName
{
  return self->_stateDescriptionsByName;
}

- (NSOrderedSet)stateFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 144, 1);
}

- (NSOrderedSet)outputFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (NSOrderedSet)inputFeatureNames
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setModelPath:(id)a3
{
}

- (MLLayerPath)modelPath
{
  return self->_modelPath;
}

- (void)setParameterDescriptionsByKey:(id)a3
{
}

- (NSDictionary)parameterDescriptionsByKey
{
  return self->_parameterDescriptionsByKey;
}

- (void)setTrainingInputDescriptionsByName:(id)a3
{
}

- (NSDictionary)trainingInputDescriptionsByName
{
  return self->_trainingInputDescriptionsByName;
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (NSString)predictedProbabilitiesName
{
  return self->_predictedProbabilitiesName;
}

- (NSString)predictedFeatureName
{
  return self->_predictedFeatureName;
}

- (BOOL)validateAsRegressorDescriptionAndReturnError:(id *)a3
{
  uint64_t v4 = [(MLModelDescription *)self predictedFeatureName];

  if (a3 && !v4)
  {
    *a3 = +[MLModelErrorUtils genericErrorWithFormat:@"Regressor must specify predictedFeatureName."];
  }
  return v4 != 0;
}

- (BOOL)validateAsClassifierDescriptionAndReturnError:(id *)a3
{
  uint64_t v5 = [(MLModelDescription *)self predictedFeatureName];
  if (v5)
  {

    return 1;
  }
  else
  {
    v7 = [(MLModelDescription *)self predictedProbabilitiesName];
    BOOL v6 = v7 != 0;

    if (a3 && !v7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Classifier must specify predictedFeatureName and/or predictedProbabilitiesName"];
      BOOL v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (MLFeatureDescription)classProbabilityFeatureDescription
{
  v3 = [(MLModelDescription *)self predictedProbabilitiesName];
  if (v3)
  {
    uint64_t v4 = [(MLModelDescription *)self outputDescriptionsByName];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (MLFeatureDescription)predictedClassFeatureDescription
{
  v3 = [(MLModelDescription *)self predictedFeatureName];
  if (v3)
  {
    uint64_t v4 = [(MLModelDescription *)self outputDescriptionsByName];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (MLFeatureDescription)predictedValueFeatureDescription
{
  v3 = [(MLModelDescription *)self predictedFeatureName];
  if (v3)
  {
    uint64_t v4 = [(MLModelDescription *)self outputDescriptionsByName];
    uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (MLFeatureDescription *)v5;
}

- (unint64_t)hash
{
  v17 = [(MLModelDescription *)self inputDescriptionsByName];
  uint64_t v15 = [v17 hash];
  long long v16 = [(MLModelDescription *)self outputDescriptionsByName];
  uint64_t v3 = [v16 hash];
  uint64_t v4 = [(MLModelDescription *)self predictedFeatureName];
  uint64_t v5 = [v4 hash];
  BOOL v6 = [(MLModelDescription *)self predictedProbabilitiesName];
  uint64_t v7 = [v6 hash];
  v8 = [(MLModelDescription *)self trainingInputDescriptionsByName];
  uint64_t v9 = [v8 hash];
  v10 = [(MLModelDescription *)self metadata];
  uint64_t v11 = [v10 hash];
  v12 = [(MLModelDescription *)self modelPath];
  unint64_t v13 = v3 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (MLModelDescription)initWithCoder:(id)a3
{
  v47[15] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v47[0] = objc_opt_class();
  v47[1] = objc_opt_class();
  v47[2] = objc_opt_class();
  v47[3] = objc_opt_class();
  v47[4] = objc_opt_class();
  v47[5] = objc_opt_class();
  v47[6] = objc_opt_class();
  v47[7] = objc_opt_class();
  v47[8] = objc_opt_class();
  v47[9] = objc_opt_class();
  v47[10] = objc_opt_class();
  v47[11] = objc_opt_class();
  v47[12] = objc_opt_class();
  v47[13] = objc_opt_class();
  v47[14] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:15];
  [v4 addObjectsFromArray:v5];

  BOOL v6 = [v3 allowedClasses];
  [v4 unionSet:v6];

  id v45 = 0;
  v35 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"inputDescriptionsByName" error:&v45];
  id v7 = v45;
  id v44 = v7;
  v34 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"outputDescriptionsByName" error:&v44];
  id v8 = v44;

  id v43 = v8;
  uint64_t v33 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"stateDescriptionsByName" error:&v43];
  id v9 = v43;

  id v42 = v9;
  v32 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"predictedFeatureName" error:&v42];
  id v10 = v42;

  id v41 = v10;
  uint64_t v31 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"predictedProbabilitiesName" error:&v41];
  id v11 = v41;

  id v40 = v11;
  v12 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"trainingInputDescriptionsByName" error:&v40];
  id v13 = v40;

  id v39 = v13;
  long long v14 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"metadata" error:&v39];
  id v15 = v39;

  long long v16 = (void *)MEMORY[0x1E4F1CAD0];
  v46[0] = objc_opt_class();
  v46[1] = objc_opt_class();
  v46[2] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  uint64_t v18 = [v16 setWithArray:v17];
  char v19 = [v3 decodeTopLevelObjectOfClasses:v18 forKey:@"classLabels" error:0];

  id v38 = v15;
  v20 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"isUpdatable" error:&v38];
  id v21 = v38;

  char v22 = [v20 BOOLValue];
  id v37 = v21;
  v23 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"parameterDescriptionsByKey" error:&v37];
  id v24 = v37;

  id v36 = v24;
  v25 = [v3 decodeTopLevelObjectOfClasses:v4 forKey:@"modelURL" error:&v36];
  id v26 = v36;

  LOBYTE(v29) = v22;
  id v27 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v35, v34, v33, v32, v31, MEMORY[0x1E4F1CBF0], v29, v12, v23, 0, 0, 0, v14, 0, 0,
          v19,
          v25,
          0);

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  id v4 = [(MLModelDescription *)self inputDescriptionsByName];
  [v15 encodeObject:v4 forKey:@"inputDescriptionsByName"];

  uint64_t v5 = [(MLModelDescription *)self outputDescriptionsByName];
  [v15 encodeObject:v5 forKey:@"outputDescriptionsByName"];

  BOOL v6 = [(MLModelDescription *)self stateDescriptionsByName];
  [v15 encodeObject:v6 forKey:@"stateDescriptionsByName"];

  id v7 = [(MLModelDescription *)self predictedFeatureName];
  [v15 encodeObject:v7 forKey:@"predictedFeatureName"];

  id v8 = [(MLModelDescription *)self predictedProbabilitiesName];
  [v15 encodeObject:v8 forKey:@"predictedProbabilitiesName"];

  id v9 = [(MLModelDescription *)self trainingInputDescriptionsByName];
  [v15 encodeObject:v9 forKey:@"trainingInputDescriptionsByName"];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MLModelDescription isUpdatable](self, "isUpdatable"));
  [v15 encodeObject:v10 forKey:@"isUpdatable"];

  id v11 = [(MLModelDescription *)self parameterDescriptionsByKey];
  [v15 encodeObject:v11 forKey:@"parameterDescriptionsByKey"];

  v12 = [(MLModelDescription *)self modelURL];
  [v15 encodeObject:v12 forKey:@"modelURL"];

  id v13 = [(MLModelDescription *)self metadata];
  [v15 encodeObject:v13 forKey:@"metadata"];

  long long v14 = [(MLModelDescription *)self classLabels];
  [v15 encodeObject:v14 forKey:@"classLabels"];
}

- (BOOL)verifyInput:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)isEqualToDescription:(id)a3
{
  id v4 = (MLModelDescription *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = [(MLModelDescription *)self description];
    BOOL v6 = [(MLModelDescription *)v4 description];
    char v7 = [v5 isEqualToString:v6];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLModelDescription *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(MLModelDescription *)self isEqualToDescription:v5];

  return v6;
}

- (id)description
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  BOOL v6 = [(MLModelDescription *)self inputDescriptionsByName];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v86 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v85 + 1) + 8 * i);
        id v11 = [(MLModelDescription *)self inputDescriptionsByName];
        v12 = [v11 objectForKeyedSubscript:v10];
        [v68 addObject:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v7);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v13 = [(MLModelDescription *)self outputDescriptionsByName];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v82;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v82 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v81 + 1) + 8 * j);
        uint64_t v18 = [(MLModelDescription *)self outputDescriptionsByName];
        char v19 = [v18 objectForKeyedSubscript:v17];
        [v67 addObject:v19];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v81 objects:v92 count:16];
    }
    while (v14);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v20 = [(MLModelDescription *)self stateDescriptionsByName];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v78 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v77 + 1) + 8 * k);
        v25 = [(MLModelDescription *)self stateDescriptionsByName];
        id v26 = [v25 objectForKeyedSubscript:v24];
        [v3 addObject:v26];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v91 count:16];
    }
    while (v21);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v27 = [(MLModelDescription *)self trainingInputDescriptionsByName];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v90 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v74;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v74 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void *)(*((void *)&v73 + 1) + 8 * m);
        v32 = [(MLModelDescription *)self trainingInputDescriptionsByName];
        uint64_t v33 = [v32 objectForKeyedSubscript:v31];
        [v4 addObject:v33];
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v73 objects:v90 count:16];
    }
    while (v28);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v34 = [(MLModelDescription *)self parameterDescriptionsByKey];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v89 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v70;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v70 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v38 = *(void *)(*((void *)&v69 + 1) + 8 * n);
        id v39 = [(MLModelDescription *)self parameterDescriptionsByKey];
        id v40 = [v39 objectForKeyedSubscript:v38];
        [v5 addObject:v40];
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v69 objects:v89 count:16];
    }
    while (v35);
  }

  id v41 = [MEMORY[0x1E4F28E78] string];
  id v42 = NSString;
  id v43 = [(MLModelDescription *)self functionName];
  id v44 = [v42 stringWithFormat:@"\nfunctionName: %@", v43];
  [v41 appendString:v44];

  id v45 = [NSString stringWithFormat:@"\ninputs: %@", v68];
  [v41 appendString:v45];

  v46 = [NSString stringWithFormat:@"\noutputs: %@", v67];
  [v41 appendString:v46];

  uint64_t v47 = [NSString stringWithFormat:@"\nstates: %@", v3];
  [v41 appendString:v47];

  v48 = NSString;
  uint64_t v49 = [(MLModelDescription *)self predictedFeatureName];
  v50 = [v48 stringWithFormat:@"\npredictedFeatureName: %@", v49];
  [v41 appendString:v50];

  v51 = NSString;
  id v52 = [(MLModelDescription *)self predictedProbabilitiesName];
  id v53 = [v51 stringWithFormat:@"\npredictedProbabilitiesName: %@", v52];
  [v41 appendString:v53];

  v54 = NSString;
  v55 = [(MLModelDescription *)self classLabels];
  v56 = [v54 stringWithFormat:@"\nclassLabels: %@", v55];
  [v41 appendString:v56];

  v57 = NSString;
  BOOL v58 = [(MLModelDescription *)self isUpdatable];
  id v59 = @"NO";
  if (v58) {
    id v59 = @"YES";
  }
  id v60 = [v57 stringWithFormat:@"\nupdatable: %@", v59];
  [v41 appendString:v60];

  id v61 = [NSString stringWithFormat:@"\ntrainingInputs: %@", v4];
  [v41 appendString:v61];

  id v62 = [NSString stringWithFormat:@"\nparameters: %@", v5];
  [v41 appendString:v62];

  uint64_t v63 = NSString;
  v64 = [(MLModelDescription *)self metadata];
  v65 = [v63 stringWithFormat:@"\nmetadata: %@", v64];
  [v41 appendString:v65];

  return v41;
}

- (id)modelDescriptionBySettingMetadata:(id)a3
{
  id v25 = a3;
  id v4 = [MLModelDescription alloc];
  uint64_t v24 = [(MLModelDescription *)self inputDescriptionsByName];
  v23 = [(MLModelDescription *)self outputDescriptionsByName];
  uint64_t v21 = [(MLModelDescription *)self stateDescriptionsByName];
  v20 = [(MLModelDescription *)self predictedFeatureName];
  char v19 = [(MLModelDescription *)self predictedProbabilitiesName];
  uint64_t v18 = [(MLModelDescription *)self functionDescriptions];
  BOOL v16 = [(MLModelDescription *)self isUpdatable];
  id v5 = [(MLModelDescription *)self trainingInputDescriptionsByName];
  uint64_t v22 = [(MLModelDescription *)self parameterDescriptionsByKey];
  BOOL v6 = [(MLModelDescription *)self inputFeatureNames];
  uint64_t v7 = [(MLModelDescription *)self outputFeatureNames];
  uint64_t v17 = [(MLModelDescription *)self stateFeatureNames];
  uint64_t v15 = [(MLModelDescription *)self defaultFunctionName];
  uint64_t v8 = [(MLModelDescription *)self functionName];
  uint64_t v14 = [(MLModelDescription *)self classLabels];
  id v13 = [(MLModelDescription *)self modelURL];
  id v9 = [(MLModelDescription *)self modelPath];
  LOBYTE(v11) = v16;
  v12 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](v4, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v24, v23, v21, v20, v19, v18, v11, v5, v22, v6, v7, v17, v25, v15, v8,
          v14,
          v13,
          v9);

  return v12;
}

- (id)initFromSingleFunctionModelDescriptionSpecification:(void *)a3
{
  id v3 = [(MLModelDescription *)self initFromModelDescriptionSpecification:a3];
  id v4 = [v3 functionDescriptions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
    }
  }

  return v3;
}

- (id)initFromSingleFunctionModelSpecification:(void *)a3
{
  if (*(void *)(*(void *)a3 + 16)) {
    id v4 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    id v4 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v11, v4);
  id v5 = [(MLModelDescription *)self initFromModelDescriptionSpecification:v11];
  BOOL v6 = [v5 functionDescriptions];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
    }
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }

  return v5;
}

- (id)initFromSingleFunctionCompiledModelArchive:(_MLModelInputArchiver *)a3 error:(id *)a4
{
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v9);
  if (+[MLModelIOUtils deserializeInterfaceFormat:&v9 archive:a3 error:a4])
  {
    id v7 = [[MLModelDescription alloc] initFromSingleFunctionModelDescriptionSpecification:&v9];
  }
  else
  {
    id v7 = 0;
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v7;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 metadata:(id)a7
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E4F1CBF0], 0, 0, 0, 0, 0, a7, 0, 0, 0, 0,
           0);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 metadata:(id)a8
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E4F1CBF0], 0, a7, 0, 0, 0, a8, 0, 0, 0, 0,
           0);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 trainingInputDescriptions:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 metadata:(id)a10
{
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, a5, a6, MEMORY[0x1E4F1CBF0], 0, a7, 0, a8, a9, a10, 0, 0, 0, 0,
           0);
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 stateDescriptions:(id)a5 predictedFeatureName:(id)a6 predictedProbabilitiesName:(id)a7 functionName:(id)a8
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v45 = a4;
  id v44 = a5;
  id v41 = a6;
  id v42 = a7;
  id v43 = a8;
  uint64_t v49 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
  v48 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v13, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v59 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v18 = [v17 name];
        [v49 setObject:v17 forKeyedSubscript:v18];

        char v19 = [v17 name];
        [v48 addObject:v19];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v14);
  }

  v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v45, "count"));
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v45, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v46 = v45;
  uint64_t v22 = [v46 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v55 != v23) {
          objc_enumerationMutation(v46);
        }
        id v25 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        id v26 = [v25 name];
        [v20 setObject:v25 forKeyedSubscript:v26];

        id v27 = [v25 name];
        [v21 addObject:v27];
      }
      uint64_t v22 = [v46 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v22);
  }

  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  uint64_t v29 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v44, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v30 = v44;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        if (*(void *)v51 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = *(void **)(*((void *)&v50 + 1) + 8 * k);
        uint64_t v35 = [v34 name];
        [v28 setObject:v34 forKeyedSubscript:v35];

        uint64_t v36 = [v34 name];
        [v29 addObject:v36];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v31);
  }

  LOBYTE(v39) = 0;
  id v37 = -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", v49, v20, v28, v41, v42, MEMORY[0x1E4F1CBF0], v39, 0, 0, v48, v21, v29, 0, 0, v43,
          0,
          0,
          0);

  return v37;
}

- (MLModelDescription)initWithInputDescriptions:(id)a3 outputDescriptions:(id)a4 predictedFeatureName:(id)a5 predictedProbabilitiesName:(id)a6 functionDescriptions:(id)a7 isUpdatable:(BOOL)a8 trainingInputDescriptions:(id)a9 parameterDescriptions:(id)a10 orderedInputFeatureNames:(id)a11 orderedOutputFeatureNames:(id)a12 metadata:(id)a13 defaultFunctionName:(id)a14 functionName:(id)a15 classLabels:(id)a16 modelURL:(id)a17 modelPath:(id)a18
{
  LOBYTE(v19) = a8;
  return -[MLModelDescription initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:](self, "initWithInputDescriptions:outputDescriptions:stateDescriptions:predictedFeatureName:predictedProbabilitiesName:functionDescriptions:isUpdatable:trainingInputDescriptions:parameterDescriptions:orderedInputFeatureNames:orderedOutputFeatureNames:orderedStateFeatureNames:metadata:defaultFunctionName:functionName:classLabels:modelURL:modelPath:", a3, a4, 0, a5, a6, a7, v19, a9, a10, a11, a12, 0, a13, a14, a15,
           a16,
           a17,
           a18);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)metadataWithSpecification:(void *)a3
{
  id v3 = *(uint64_t **)(*(void *)a3 + 16);
  if (!v3) {
    id v3 = &CoreML::Specification::_ModelDescription_default_instance_;
  }
  id v4 = (const CoreML::Specification::Metadata *)v3[20];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (const CoreML::Specification::Metadata *)&CoreML::Specification::_Metadata_default_instance_;
  }
  _MLModelMetadataSpecification::_MLModelMetadataSpecification((_MLModelMetadataSpecification *)&v8, v5);
  BOOL v6 = +[MLModelDescription metadataWithFormat:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v6;
}

- (id)initFromRawModelSpecification:(void *)a3
{
  if (*(void *)(*(void *)a3 + 16)) {
    id v4 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    id v4 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v7, v4);
  id v5 = [(MLModelDescription *)self initFromModelDescriptionSpecification:&v7];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return v5;
}

- (BOOL)hasEnumeratedShapeInputs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(MLModelDescription *)self inputDescriptionsByName];
  id v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)v15;
  while (2)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if ([v7 type] == 5)
      {
        uint64_t v8 = [v7 multiArrayConstraint];
        id v9 = [v8 shapeConstraint];
        uint64_t v10 = [v9 enumeratedShapes];
      }
      else
      {
        if ([v7 type] != 4) {
          continue;
        }
        uint64_t v8 = [v7 imageConstraint];
        id v9 = [v8 sizeConstraint];
        uint64_t v10 = [v9 enumeratedImageSizes];
      }
      uint64_t v11 = v10;
      unint64_t v12 = [v10 count];

      if (v12 > 1)
      {
        LOBYTE(v4) = 1;
        goto LABEL_15;
      }
    }
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_15:

  return v4;
}

@end