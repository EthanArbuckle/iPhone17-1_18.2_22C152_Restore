@interface MLNeuralNetworkContainer
+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)containerFromCompiledArchiveCommon:(void *)a3 filename:(id)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8;
+ (id)containerFromFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6;
- (BOOL)hasBidirectionalLayer;
- (BOOL)hasDynamicLayer;
- (BOOL)hasOptionalInputSequenceConcat;
- (BOOL)modelIsEncrypted;
- (BOOL)modelIsMIL;
- (BOOL)modelIsTrainingProgram;
- (BOOL)ndArrayInterpretation;
- (MLCompilerNeuralNetworkOutput)compilerOutput;
- (MLModelDescription)modelDescription;
- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9;
- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9 compilerVersionInfo:(id)a10;
- (MLNeuralNetworkContainer)initWithFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6;
- (MLNeuralNetworksCompileTimeParams)updatableModelCompiledParams;
- (MLVersionInfo)compilerVersionInfo;
- (MLVersionInfo)modelVersionInfo;
- (NSArray)classLabels;
- (NSArray)configurationList;
- (NSArray)inputLayerNames;
- (NSArray)outputLayerNames;
- (NSDictionary)imageParameters;
- (NSDictionary)imagePreprocessingParams;
- (NSDictionary)inputDescription;
- (NSDictionary)optionalInputDefaultValues;
- (NSDictionary)optionalInputTypes;
- (NSDictionary)outputDescription;
- (NSString)activeFunction;
- (NSString)classScoreVectorName;
- (NSString)modelFilePath;
- (NSString)name;
- (id).cxx_construct;
- (int)engine;
- (int)precision;
- (void)setClassLabels:(id)a3;
- (void)setClassScoreVectorName:(id)a3;
- (void)setCompilerOutput:(id)a3;
- (void)setCompilerVersionInfo:(id)a3;
- (void)setConfigurationList:(id)a3;
- (void)setEngine:(int)a3;
- (void)setHasBidirectionalLayer:(BOOL)a3;
- (void)setHasDynamicLayer:(BOOL)a3;
- (void)setHasOptionalInputSequenceConcat:(BOOL)a3;
- (void)setImageParameters:(id)a3;
- (void)setImagePreprocessingParams:(id)a3;
- (void)setInputDescription:(id)a3;
- (void)setInputLayerNames:(id)a3;
- (void)setModelFilePath:(id)a3;
- (void)setModelIsEncrypted:(BOOL)a3;
- (void)setModelIsMIL:(BOOL)a3;
- (void)setModelIsTrainingProgram:(BOOL)a3;
- (void)setModelVersionInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setNdArrayInterpretation:(BOOL)a3;
- (void)setOptionalInputDefaultValues:(id)a3;
- (void)setOptionalInputTypes:(id)a3;
- (void)setOutputDescription:(id)a3;
- (void)setOutputLayerNames:(id)a3;
- (void)setPrecision:(int)a3;
- (void)setUpdatableModelCompiledParams:(id)a3;
@end

@implementation MLNeuralNetworkContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilerOutput, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_modelVersionInfo, 0);
  objc_storeStrong((id *)&self->_optionalInputDefaultValues, 0);
  objc_storeStrong((id *)&self->_updatableModelCompiledParams, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_configurationList, 0);
  objc_storeStrong((id *)&self->_imagePreprocessingParams, 0);
  objc_storeStrong((id *)&self->_imageParameters, 0);
  objc_storeStrong((id *)&self->_outputDescription, 0);
  objc_storeStrong((id *)&self->_inputDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_outputLayerNames, 0);
  objc_storeStrong((id *)&self->_inputLayerNames, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->ranks.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->sequences.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->batches.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->ks.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->heights.__tree_.__pair1_.__value_.__left_);
  left = (char *)self->widths.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(left);
}

- (void)setHasDynamicLayer:(BOOL)a3
{
  self->_hasDynamicLayer = a3;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setOptionalInputTypes:(id)a3
{
}

- (void)setOptionalInputDefaultValues:(id)a3
{
}

- (void)setNdArrayInterpretation:(BOOL)a3
{
  self->_ndArrayInterpretation = a3;
}

- (void)setHasOptionalInputSequenceConcat:(BOOL)a3
{
  self->_hasOptionalInputSequenceConcat = a3;
}

- (void)setCompilerOutput:(id)a3
{
}

- (void)setUpdatableModelCompiledParams:(id)a3
{
}

- (void)setHasBidirectionalLayer:(BOOL)a3
{
  self->_hasBidirectionalLayer = a3;
}

- (void)setConfigurationList:(id)a3
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 14) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 18) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = (char *)self + 136;
  return self;
}

+ (id)containerFromCompiledArchiveCommon:(void *)a3 filename:(id)a4 modelVersionInfo:(id)a5 compilerVersionInfo:(id)a6 configuration:(id)a7 error:(id *)a8
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v37 = a5;
  id v14 = a6;
  id v35 = a7;
  v15 = +[MLVersionInfo versionInfoWithMajor:9 minor:0 patch:0 variant:@"generic"];
  uint64_t v16 = [v15 majorVersion];
  if (v16 >= [v14 majorVersion])
  {
    if (!v14)
    {
      id v14 = +[MLVersionInfo versionInfoWithMajor:1 minor:2 patch:1 variant:@"generic"];
    }
    v20 = [[MLModelAssetDescription alloc] initWithCompiledModelArchive:a3 error:a8];
    v21 = v20;
    if (v20)
    {
      if (![(MLModelAssetDescription *)v20 usesMultiFunctionSyntax])
      {
        v26 = [[MLNeuralNetworkFunctionInfo alloc] initWithCompiledModelArchive:a3 compilerVersionInfo:v14 error:a8];
        v27 = [(MLNeuralNetworkFunctionInfo *)v26 classLabels];
        v28 = [(MLModelAssetDescription *)v21 assetDescriptionBySettingClassLabels:v27];

        id v29 = objc_alloc((Class)a1);
        v30 = [(MLModelAssetDescription *)v28 defaultModelDescription];
        v31 = [(MLNeuralNetworkFunctionInfo *)v26 outputNames];
        v32 = [(MLNeuralNetworkFunctionInfo *)v26 classScoreVectorName];
        v33 = [(MLNeuralNetworkFunctionInfo *)v26 classLabels];
        v19 = (void *)[v29 initWithFeatureDescriptions:v36 modelDescription:v30 outputLayerNames:v31 classScoreVectorName:v32 classLabels:v33 isEncrypted:(*(uint64_t (**)(void))(**(void **)a3 + 64))() modelVersionInfo:v37 compilerVersionInfo:v14];

        v21 = v28;
        goto LABEL_15;
      }
      v22 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "This MLModel doesn't support the multi-function description sytnax.", buf, 2u);
      }

      if (a8)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v24 = [NSString stringWithFormat:@"This MLModel doesn't support the multi-function description sytnax."];
        v40[0] = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        *a8 = [v23 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v25];
      }
    }
    v19 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (a8)
  {
    v17 = [v14 versionNumberString];
    v18 = [v15 versionNumberString];
    *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v17, v18];
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9 compilerVersionInfo:(id)a10
{
  id v35 = a3;
  id v16 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a9;
  id v30 = a10;
  v36.receiver = self;
  v36.super_class = (Class)MLNeuralNetworkContainer;
  v17 = [(MLNeuralNetworkContainer *)&v36 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelFilePath, a3);
    v18->_modelIsMIL = 0;
    objc_storeStrong((id *)&v18->_modelDescription, a4);
    v19 = [v16 inputDescriptionsByName];
    id v28 = v16;
    v20 = [v19 allKeys];
    v21 = [v16 stateDescriptionsByName];
    v22 = [v21 allKeys];
    uint64_t v23 = [v20 arrayByAddingObjectsFromArray:v22];
    inputLayerNames = v18->_inputLayerNames;
    v18->_inputLayerNames = (NSArray *)v23;

    objc_storeStrong((id *)&v18->_outputLayerNames, a5);
    *(void *)&v18->_precision = 65568;
    *(_WORD *)&v18->_hasBidirectionalLayer = 0;
    objc_storeStrong((id *)&v18->_classLabels, a7);
    objc_storeStrong((id *)&v18->_classScoreVectorName, a6);
    v18->_hasDynamicLayer = 0;
    v18->_modelIsEncrypted = a8;
    objc_storeStrong((id *)&v18->_compilerVersionInfo, a10);
    objc_storeStrong((id *)&v18->_modelVersionInfo, a9);
    id v16 = v28;
    v25 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    optionalInputTypes = v18->_optionalInputTypes;
    v18->_optionalInputTypes = v25;
  }
  return v18;
}

- (NSDictionary)optionalInputTypes
{
  return self->_optionalInputTypes;
}

- (BOOL)ndArrayInterpretation
{
  return self->_ndArrayInterpretation;
}

- (NSDictionary)optionalInputDefaultValues
{
  return self->_optionalInputDefaultValues;
}

- (NSString)modelFilePath
{
  return self->_modelFilePath;
}

- (NSArray)outputLayerNames
{
  return self->_outputLayerNames;
}

- (BOOL)modelIsMIL
{
  return self->_modelIsMIL;
}

- (BOOL)modelIsEncrypted
{
  return self->_modelIsEncrypted;
}

- (NSDictionary)imagePreprocessingParams
{
  return self->_imagePreprocessingParams;
}

- (NSString)classScoreVectorName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSArray)classLabels
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (MLVersionInfo)modelVersionInfo
{
  return self->_modelVersionInfo;
}

- (NSDictionary)imageParameters
{
  return self->_imageParameters;
}

- (BOOL)hasOptionalInputSequenceConcat
{
  return self->_hasOptionalInputSequenceConcat;
}

- (BOOL)hasBidirectionalLayer
{
  return self->_hasBidirectionalLayer;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (MLCompilerNeuralNetworkOutput)compilerOutput
{
  return self->_compilerOutput;
}

- (NSArray)inputLayerNames
{
  return self->_inputLayerNames;
}

- (NSString)activeFunction
{
  return (NSString *)[NSString stringWithUTF8String:"main"];
}

- (void)setOutputLayerNames:(id)a3
{
}

- (void)setInputLayerNames:(id)a3
{
}

- (void)setModelIsMIL:(BOOL)a3
{
  self->_modelIsMIL = a3;
}

- (BOOL)modelIsTrainingProgram
{
  return self->_modelIsTrainingProgram;
}

- (void)setCompilerVersionInfo:(id)a3
{
}

- (void)setEngine:(int)a3
{
  self->_engine = a3;
}

- (int)engine
{
  return self->_engine;
}

- (void)setPrecision:(int)a3
{
  self->_precision = a3;
}

- (int)precision
{
  return self->_precision;
}

- (void)setModelIsTrainingProgram:(BOOL)a3
{
  self->_modelIsTrainingProgram = a3;
}

- (void)setModelVersionInfo:(id)a3
{
}

- (void)setModelIsEncrypted:(BOOL)a3
{
  self->_modelIsEncrypted = a3;
}

- (MLNeuralNetworksCompileTimeParams)updatableModelCompiledParams
{
  return self->_updatableModelCompiledParams;
}

- (void)setClassScoreVectorName:(id)a3
{
}

- (void)setClassLabels:(id)a3
{
}

- (BOOL)hasDynamicLayer
{
  return self->_hasDynamicLayer;
}

- (NSArray)configurationList
{
  return self->_configurationList;
}

- (void)setImagePreprocessingParams:(id)a3
{
}

- (void)setImageParameters:(id)a3
{
}

- (void)setOutputDescription:(id)a3
{
}

- (NSDictionary)outputDescription
{
  return self->_outputDescription;
}

- (void)setInputDescription:(id)a3
{
}

- (NSDictionary)inputDescription
{
  return self->_inputDescription;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setModelFilePath:(id)a3
{
}

- (MLNeuralNetworkContainer)initWithFeatureDescriptions:(id)a3 modelDescription:(id)a4 outputLayerNames:(id)a5 classScoreVectorName:(id)a6 classLabels:(id)a7 isEncrypted:(BOOL)a8 modelVersionInfo:(id)a9
{
  return [(MLNeuralNetworkContainer *)self initWithFeatureDescriptions:a3 modelDescription:a4 outputLayerNames:a5 classScoreVectorName:a6 classLabels:a7 isEncrypted:a8 modelVersionInfo:a9 compilerVersionInfo:0];
}

- (MLNeuralNetworkContainer)initWithFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MLNeuralNetworkContainer;
  v15 = [(MLNeuralNetworkContainer *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFilePath, a3);
    objc_storeStrong((id *)&v16->_inputLayerNames, a4);
    objc_storeStrong((id *)&v16->_outputLayerNames, a5);
    *(void *)&v16->_precision = 65568;
    objc_storeStrong((id *)&v16->_imageParameters, a6);
    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    optionalInputTypes = v16->_optionalInputTypes;
    v16->_optionalInputTypes = v17;
  }
  return v16;
}

+ (id)containerFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v7 = +[MLNeuralNetworkV1Container containerFromCompiledArchive:a3 modelVersionInfo:a4 compilerVersionInfo:a5 configuration:a6 error:a7];

  return v7;
}

+ (id)containerFromFilePath:(id)a3 inputLayerNames:(id)a4 outputLayerNames:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)[objc_alloc((Class)a1) initWithFilePath:v10 inputLayerNames:v11 outputLayerNames:v12 parameters:v13];

  return v14;
}

@end