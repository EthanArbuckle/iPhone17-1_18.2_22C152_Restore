@interface MLModelConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultConfiguration;
- (BOOL)allowBackgroundGPUComputeSetting;
- (BOOL)allowLowPrecisionAccumulationOnGPU;
- (BOOL)allowsInstrumentation;
- (BOOL)enableTestVectorMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelConfiguration:(id)a3;
- (BOOL)preparesLazily;
- (BOOL)serializesMILTextForDebugging;
- (BOOL)specializationUsesMPSGraphExecutable;
- (BOOL)trainWithMLCompute;
- (BOOL)usePrecompiledE5Bundle;
- (BOOL)usePreloadedKey;
- (BOOL)useWatchSPIForScribble;
- (BOOL)usesCompileTimeMPSGraphTypeInferenceForModelVersion:(id)a3;
- (MLComputeUnits)computeUnits;
- (MLModelConfiguration)init;
- (MLModelConfiguration)initWithCoder:(id)a3;
- (MLModelConfiguration)initWithComputeUnits:(int64_t)a3;
- (MLOptimizationHints)optimizationHints;
- (NSDictionary)e5rtDynamicCallableFunctions;
- (NSDictionary)e5rtMutableMILWeightURLs;
- (NSDictionary)parameters;
- (NSString)e5rtCustomANECompilerOptions;
- (NSString)functionName;
- (NSString)modelDisplayName;
- (NSString)parentModelName;
- (NSURL)rootModelURL;
- (id)bnnsGraphBackendUsageToString:(int64_t)a3;
- (id)computeUnitsToString:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)experimentalMLE5EngineUsageToString:(int64_t)a3;
- (id)neuralEngineCompilerOptions;
- (id)preferredMetalDevice;
- (int64_t)experimentalMLE5BNNSGraphBackendUsage;
- (int64_t)experimentalMLE5BNNSGraphBackendUsageMultiSegment;
- (int64_t)experimentalMLE5EngineUsage;
- (int64_t)predictionConcurrencyHint;
- (int64_t)profilingOptions;
- (unint64_t)e5rtComputeDeviceTypeMask;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowBackgroundGPUCompute:(BOOL)a3;
- (void)setAllowBackgroundGPUComputeSetting:(BOOL)a3;
- (void)setAllowLowPrecisionAccumulationOnGPU:(BOOL)allowLowPrecisionAccumulationOnGPU;
- (void)setAllowsInstrumentation:(BOOL)a3;
- (void)setComputeUnits:(MLComputeUnits)computeUnits;
- (void)setE5rtComputeDeviceTypeMask:(unint64_t)a3;
- (void)setE5rtCustomANECompilerOptions:(id)a3;
- (void)setE5rtDynamicCallableFunctions:(id)a3;
- (void)setE5rtMutableMILWeightURLs:(id)a3;
- (void)setEnableTestVectorMode:(BOOL)a3;
- (void)setExperimentalMLE5BNNSGraphBackendUsage:(int64_t)a3;
- (void)setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:(int64_t)a3;
- (void)setExperimentalMLE5EngineUsage:(int64_t)a3;
- (void)setFunctionName:(id)a3;
- (void)setModelDisplayName:(NSString *)modelDisplayName;
- (void)setOptimizationHints:(id)a3;
- (void)setParameters:(NSDictionary *)parameters;
- (void)setParentModelName:(id)a3;
- (void)setPredictionConcurrencyHint:(int64_t)a3;
- (void)setPreferredMetalDevice:(id)preferredMetalDevice;
- (void)setPreparesLazily:(BOOL)a3;
- (void)setProfilingOptions:(int64_t)a3;
- (void)setRootModelURL:(id)a3;
- (void)setSerializesMILTextForDebugging:(BOOL)a3;
- (void)setSpecializationUsesMPSGraphExecutable:(BOOL)a3;
- (void)setTrainWithMLCompute:(BOOL)a3;
- (void)setUsePrecompiledE5Bundle:(BOOL)a3;
- (void)setUsePreloadedKey:(BOOL)a3;
- (void)setUseWatchSPIForScribble:(BOOL)a3;
@end

@implementation MLModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentModelName, 0);
  objc_storeStrong((id *)&self->_rootModelURL, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_preferredMetalDevice, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_optimizationHints, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_e5rtCustomANECompilerOptions, 0);
  objc_storeStrong((id *)&self->_e5rtMutableMILWeightURLs, 0);

  objc_storeStrong((id *)&self->_e5rtDynamicCallableFunctions, 0);
}

- (BOOL)usesCompileTimeMPSGraphTypeInferenceForModelVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MLModelConfiguration *)self optimizationHints];
  uint64_t v6 = [v5 reshapeFrequency];

  BOOL v7 = v6 == 1 || (dyld_program_sdk_at_least() & 1) == 0 && [v4 majorVersion] < 9;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[MLModelConfiguration allocWithZone:a3] init];
  [(MLModelConfiguration *)v4 setComputeUnits:[(MLModelConfiguration *)self computeUnits]];
  [(MLModelConfiguration *)v4 setUseWatchSPIForScribble:[(MLModelConfiguration *)self useWatchSPIForScribble]];
  [(MLModelConfiguration *)v4 setAllowLowPrecisionAccumulationOnGPU:[(MLModelConfiguration *)self allowLowPrecisionAccumulationOnGPU]];
  [(MLModelConfiguration *)v4 setAllowBackgroundGPUComputeSetting:[(MLModelConfiguration *)self allowBackgroundGPUComputeSetting]];
  v5 = [(MLModelConfiguration *)self preferredMetalDevice];
  [(MLModelConfiguration *)v4 setPreferredMetalDevice:v5];

  [(MLModelConfiguration *)v4 setEnableTestVectorMode:[(MLModelConfiguration *)self enableTestVectorMode]];
  uint64_t v6 = [(MLModelConfiguration *)self parameters];
  [(MLModelConfiguration *)v4 setParameters:v6];

  BOOL v7 = [(MLModelConfiguration *)self rootModelURL];
  [(MLModelConfiguration *)v4 setRootModelURL:v7];

  [(MLModelConfiguration *)v4 setProfilingOptions:[(MLModelConfiguration *)self profilingOptions]];
  [(MLModelConfiguration *)v4 setUsePreloadedKey:[(MLModelConfiguration *)self usePreloadedKey]];
  [(MLModelConfiguration *)v4 setTrainWithMLCompute:[(MLModelConfiguration *)self trainWithMLCompute]];
  v8 = [(MLModelConfiguration *)self parentModelName];
  [(MLModelConfiguration *)v4 setParentModelName:v8];

  v9 = [(MLModelConfiguration *)self modelDisplayName];
  [(MLModelConfiguration *)v4 setModelDisplayName:v9];

  [(MLModelConfiguration *)v4 setAllowsInstrumentation:[(MLModelConfiguration *)self allowsInstrumentation]];
  [(MLModelConfiguration *)v4 setExperimentalMLE5EngineUsage:[(MLModelConfiguration *)self experimentalMLE5EngineUsage]];
  [(MLModelConfiguration *)v4 setPreparesLazily:[(MLModelConfiguration *)self preparesLazily]];
  [(MLModelConfiguration *)v4 setPredictionConcurrencyHint:[(MLModelConfiguration *)self predictionConcurrencyHint]];
  [(MLModelConfiguration *)v4 setUsePrecompiledE5Bundle:[(MLModelConfiguration *)self usePrecompiledE5Bundle]];
  [(MLModelConfiguration *)v4 setExperimentalMLE5BNNSGraphBackendUsage:[(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsage]];
  v10 = [(MLModelConfiguration *)self e5rtDynamicCallableFunctions];
  [(MLModelConfiguration *)v4 setE5rtDynamicCallableFunctions:v10];

  v11 = [(MLModelConfiguration *)self e5rtMutableMILWeightURLs];
  [(MLModelConfiguration *)v4 setE5rtMutableMILWeightURLs:v11];

  v12 = [(MLModelConfiguration *)self optimizationHints];
  [(MLModelConfiguration *)v4 setOptimizationHints:v12];

  v13 = [(MLModelConfiguration *)self functionName];
  [(MLModelConfiguration *)v4 setFunctionName:v13];

  [(MLModelConfiguration *)v4 setE5rtComputeDeviceTypeMask:[(MLModelConfiguration *)self e5rtComputeDeviceTypeMask]];
  v14 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
  [(MLModelConfiguration *)v4 setE5rtCustomANECompilerOptions:v14];

  [(MLModelConfiguration *)v4 setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:[(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsageMultiSegment]];
  [(MLModelConfiguration *)v4 setSerializesMILTextForDebugging:[(MLModelConfiguration *)self serializesMILTextForDebugging]];
  [(MLModelConfiguration *)v4 setSpecializationUsesMPSGraphExecutable:[(MLModelConfiguration *)self specializationUsesMPSGraphExecutable]];
  return v4;
}

- (MLComputeUnits)computeUnits
{
  return self->_computeUnits;
}

- (BOOL)allowsInstrumentation
{
  return self->_allowsInstrumentation;
}

- (NSString)modelDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (MLModelConfiguration)init
{
  return [(MLModelConfiguration *)self initWithComputeUnits:2];
}

- (MLModelConfiguration)initWithComputeUnits:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MLModelConfiguration;
  id v4 = [(MLModelConfiguration *)&v20 init];
  v5 = v4;
  if (v4)
  {
    v4->_computeUnits = a3;
    *(_WORD *)&v4->_useWatchSPIForScribble = 0;
    v4->_allowBackgroundGPUComputeSetting = 0;
    preferredMetalDevice = v4->_preferredMetalDevice;
    v4->_preferredMetalDevice = 0;

    v5->_enableTestVectorMode = 0;
    parameters = v5->_parameters;
    v5->_parameters = 0;

    rootModelURL = v5->_rootModelURL;
    v5->_rootModelURL = 0;

    v5->_usePreloadedKey = 0;
    v5->_trainWithMLCompute = 0;
    parentModelName = v5->_parentModelName;
    v5->_profilingOptions = 0;
    v5->_parentModelName = (NSString *)&stru_1EF0E81D0;

    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = 0;

    v5->_allowsInstrumentation = 1;
    v5->_experimentalMLE5EngineUsage = _os_feature_enabled_impl() ^ 1;
    v5->_preparesLazily = 0;
    v5->_predictionConcurrencyHint = 0;
    v5->_usePrecompiledE5Bundle = 0;
    v5->_experimentalMLE5BNNSGraphBackendUsage = _os_feature_enabled_impl() ^ 1;
    int v11 = _os_feature_enabled_impl();
    e5rtDynamicCallableFunctions = v5->_e5rtDynamicCallableFunctions;
    v13 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    v5->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = v11 ^ 1u;
    v5->_e5rtDynamicCallableFunctions = v13;

    e5rtMutableMILWeightURLs = v5->_e5rtMutableMILWeightURLs;
    v5->_e5rtMutableMILWeightURLs = v13;

    v15 = objc_alloc_init(MLOptimizationHints);
    optimizationHints = v5->_optimizationHints;
    v5->_optimizationHints = v15;

    functionName = v5->_functionName;
    v5->_functionName = 0;

    e5rtCustomANECompilerOptions = v5->_e5rtCustomANECompilerOptions;
    v5->_e5rtComputeDeviceTypeMask = -1;
    v5->_e5rtCustomANECompilerOptions = 0;

    *(_WORD *)&v5->_serializesMILTextForDebugging = 256;
  }
  return v5;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (int64_t)profilingOptions
{
  return self->_profilingOptions;
}

- (BOOL)trainWithMLCompute
{
  return self->_trainWithMLCompute;
}

- (int64_t)experimentalMLE5EngineUsage
{
  return self->_experimentalMLE5EngineUsage;
}

- (void)setAllowsInstrumentation:(BOOL)a3
{
  self->_allowsInstrumentation = a3;
}

- (NSString)parentModelName
{
  return self->_parentModelName;
}

- (void)setRootModelURL:(id)a3
{
}

- (void)setModelDisplayName:(NSString *)modelDisplayName
{
}

- (void)setComputeUnits:(MLComputeUnits)computeUnits
{
  self->_computeUnits = computeUnits;
}

- (BOOL)preparesLazily
{
  return self->_preparesLazily;
}

- (BOOL)enableTestVectorMode
{
  return self->_enableTestVectorMode;
}

- (BOOL)allowLowPrecisionAccumulationOnGPU
{
  return self->_allowLowPrecisionAccumulationOnGPU;
}

- (MLOptimizationHints)optimizationHints
{
  return self->_optimizationHints;
}

- (BOOL)usePrecompiledE5Bundle
{
  return self->_usePrecompiledE5Bundle;
}

- (int64_t)experimentalMLE5BNNSGraphBackendUsage
{
  return self->_experimentalMLE5BNNSGraphBackendUsage;
}

- (unint64_t)e5rtComputeDeviceTypeMask
{
  return self->_e5rtComputeDeviceTypeMask;
}

- (BOOL)serializesMILTextForDebugging
{
  return self->_serializesMILTextForDebugging;
}

- (BOOL)allowBackgroundGPUComputeSetting
{
  return self->_allowBackgroundGPUComputeSetting;
}

- (void)setUsePrecompiledE5Bundle:(BOOL)a3
{
  self->_usePrecompiledE5Bundle = a3;
}

- (void)setSerializesMILTextForDebugging:(BOOL)a3
{
  self->_serializesMILTextForDebugging = a3;
}

- (void)setExperimentalMLE5EngineUsage:(int64_t)a3
{
  self->_experimentalMLE5EngineUsage = a3;
}

- (void)setExperimentalMLE5BNNSGraphBackendUsageMultiSegment:(int64_t)a3
{
  self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = a3;
}

- (void)setExperimentalMLE5BNNSGraphBackendUsage:(int64_t)a3
{
  self->_experimentalMLE5BNNSGraphBackendUsage = a3;
}

- (void)setE5rtMutableMILWeightURLs:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  e5rtMutableMILWeightURLs = self->_e5rtMutableMILWeightURLs;
  self->_e5rtMutableMILWeightURLs = v4;
}

- (void)setE5rtDynamicCallableFunctions:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  e5rtDynamicCallableFunctions = self->_e5rtDynamicCallableFunctions;
  self->_e5rtDynamicCallableFunctions = v4;
}

- (void)setE5rtCustomANECompilerOptions:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  e5rtCustomANECompilerOptions = self->_e5rtCustomANECompilerOptions;
  self->_e5rtCustomANECompilerOptions = v4;
}

- (void)setE5rtComputeDeviceTypeMask:(unint64_t)a3
{
  self->_e5rtComputeDeviceTypeMask = a3;
}

- (int64_t)experimentalMLE5BNNSGraphBackendUsageMultiSegment
{
  return self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment;
}

- (NSDictionary)e5rtMutableMILWeightURLs
{
  return self->_e5rtMutableMILWeightURLs;
}

- (NSDictionary)e5rtDynamicCallableFunctions
{
  return self->_e5rtDynamicCallableFunctions;
}

- (NSString)e5rtCustomANECompilerOptions
{
  return self->_e5rtCustomANECompilerOptions;
}

- (BOOL)useWatchSPIForScribble
{
  return self->_useWatchSPIForScribble;
}

- (BOOL)usePreloadedKey
{
  return self->_usePreloadedKey;
}

- (void)setUseWatchSPIForScribble:(BOOL)a3
{
  self->_useWatchSPIForScribble = a3;
}

- (void)setUsePreloadedKey:(BOOL)a3
{
  self->_usePreloadedKey = a3;
}

- (void)setTrainWithMLCompute:(BOOL)a3
{
  self->_trainWithMLCompute = a3;
}

- (void)setProfilingOptions:(int64_t)a3
{
  self->_profilingOptions = a3;
}

- (void)setPreparesLazily:(BOOL)a3
{
  self->_preparesLazily = a3;
}

- (void)setPreferredMetalDevice:(id)preferredMetalDevice
{
}

- (void)setPredictionConcurrencyHint:(int64_t)a3
{
  self->_predictionConcurrencyHint = a3;
}

- (void)setParentModelName:(id)a3
{
}

- (void)setParameters:(NSDictionary *)parameters
{
}

- (void)setOptimizationHints:(id)a3
{
}

- (void)setFunctionName:(id)a3
{
}

- (void)setEnableTestVectorMode:(BOOL)a3
{
  self->_enableTestVectorMode = a3;
}

- (void)setAllowLowPrecisionAccumulationOnGPU:(BOOL)allowLowPrecisionAccumulationOnGPU
{
  self->_allowLowPrecisionAccumulationOnGPU = allowLowPrecisionAccumulationOnGPU;
}

- (void)setAllowBackgroundGPUComputeSetting:(BOOL)a3
{
  self->_allowBackgroundGPUComputeSetting = a3;
}

- (NSURL)rootModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (id)preferredMetalDevice
{
  return self->_preferredMetalDevice;
}

- (int64_t)predictionConcurrencyHint
{
  return self->_predictionConcurrencyHint;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAllowBackgroundGPUCompute:(BOOL)a3
{
  self->_allowBackgroundGPUComputeSetting = a3;
}

+ (id)defaultConfiguration
{
  v2 = objc_alloc_init(MLModelConfiguration);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MLModelConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(MLModelConfiguration *)self isEqualToModelConfiguration:v4];
  }

  return v5;
}

- (id)neuralEngineCompilerOptions
{
  v3 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(MLModelConfiguration *)self optimizationHints];
    uint64_t v7 = [v6 specializationStrategy];

    v8 = [MEMORY[0x1E4F1CA48] array];
    if (dyld_program_sdk_at_least()) {
      [v8 addObject:@"EnableLowEffortCPAllocation=true"];
    }
    if (v7 == 1) {
      [v8 addObject:@"SpatialSplitMode=GenericDAG"];
    }
    id v5 = [v8 componentsJoinedByString:@","];
  }

  return v5;
}

- (id)description
{
  v38 = NSString;
  v37 = [(MLModelConfiguration *)self computeUnitsToString:self->_computeUnits];
  v3 = "NO";
  if ([(MLModelConfiguration *)self useWatchSPIForScribble]) {
    id v4 = "YES";
  }
  else {
    id v4 = "NO";
  }
  v36 = v4;
  if ([(MLModelConfiguration *)self allowLowPrecisionAccumulationOnGPU]) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  v35 = v5;
  if ([(MLModelConfiguration *)self allowBackgroundGPUComputeSetting]) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  v34 = v6;
  v33 = [(MLModelConfiguration *)self preferredMetalDevice];
  if ([(MLModelConfiguration *)self enableTestVectorMode]) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  v32 = v7;
  v31 = [(MLModelConfiguration *)self parameters];
  v30 = [(MLModelConfiguration *)self rootModelURL];
  int64_t v29 = [(MLModelConfiguration *)self profilingOptions];
  if ([(MLModelConfiguration *)self usePreloadedKey]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  v28 = v8;
  if ([(MLModelConfiguration *)self trainWithMLCompute]) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  v27 = v9;
  v26 = [(MLModelConfiguration *)self parentModelName];
  v25 = [(MLModelConfiguration *)self modelDisplayName];
  v41 = [(MLModelConfiguration *)self experimentalMLE5EngineUsageToString:self->_experimentalMLE5EngineUsage];
  if ([(MLModelConfiguration *)self preparesLazily]) {
    v10 = "YES";
  }
  else {
    v10 = "NO";
  }
  v23 = v10;
  int64_t v22 = [(MLModelConfiguration *)self predictionConcurrencyHint];
  if ([(MLModelConfiguration *)self usePrecompiledE5Bundle]) {
    int v11 = "YES";
  }
  else {
    int v11 = "NO";
  }
  v21 = v11;
  v40 = [(MLModelConfiguration *)self bnnsGraphBackendUsageToString:self->_experimentalMLE5BNNSGraphBackendUsage];
  v12 = [(MLModelConfiguration *)self e5rtMutableMILWeightURLs];
  objc_super v20 = [(MLModelConfiguration *)self e5rtDynamicCallableFunctions];
  v24 = [(MLModelConfiguration *)self optimizationHints];
  v13 = [v24 description];
  v14 = [(MLModelConfiguration *)self functionName];
  v15 = [(MLModelConfiguration *)self bnnsGraphBackendUsageToString:self->_experimentalMLE5BNNSGraphBackendUsageMultiSegment];
  unint64_t v16 = [(MLModelConfiguration *)self e5rtComputeDeviceTypeMask];
  v17 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
  if ([(MLModelConfiguration *)self serializesMILTextForDebugging]) {
    v3 = "YES";
  }
  if ([(MLModelConfiguration *)self specializationUsesMPSGraphExecutable]) {
    v18 = "YES";
  }
  else {
    v18 = "NO";
  }
  objc_msgSend(v38, "stringWithFormat:", @"\n computeUnits: %@,             \n useWatchSPIForScribble: %s,             \n allowLowPrecisionAccumulationOnGPU: %s,             \n allowBackgroundGPUComputeSetting: %s,             \n preferredMetalDevice: %@,             \n enableTestVectorMode: %s,             \n parameters: %@,             \n rootModelURL: %@,             \n profilingOptions: %lu,             \n usePreloadedKey: %s,             \n trainWithMLCompute: %s,             \n parentModelName: %@,             \n modelName: %@,             \n experimentalMLE5EngineUsage: %@,             \n preparesLazily: %s,             \n predictionConcurrencyHint: %zd,             \n usePrecompiledE5Bundle: %s,             \n experimentalMLE5BNNSGraphBackendUsage: %@,             \n e5rtMutableMILWeightURLs: %@             \n e5rtDynamicCallableFunctions: %@             \n optimizationHints: %@,             \n functionName: %@,             \n experimentalMLE5BNNSGraphBackendUsageMultiSegment: %@,             \n e5rtComputeDeviceTypeMask: 0x%llx,             \n e5rtCustomANECompilerOptions: %@,             \n serializesMILTextForDebugging: %s,             \n specializationUsesMPSGraphExecutable: %s,             ", v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v41, v23, v22,
    v21,
    v40,
    v12,
    v20,
    v13,
    v14,
    v15,
    v16,
    v17,
    v3,
  v39 = v18);

  return v39;
}

- (MLModelConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[MLModelConfiguration initWithComputeUnits:](self, "initWithComputeUnits:", [v4 decodeIntegerForKey:@"computeUnits"]);
  if (v5)
  {
    v5->_useWatchSPIForScribble = [v4 decodeBoolForKey:@"useSPIforScribble"];
    v5->_allowLowPrecisionAccumulationOnGPU = [v4 decodeBoolForKey:@"allowLowPrecisionAccumulationOnGPU"];
    v5->_allowBackgroundGPUComputeSetting = [v4 decodeBoolForKey:@"allowBackgroundGPUCompute"];
    MPSDeviceOptions v6 = [v4 decodeIntegerForKey:@"MPSDeviceOptions"];
    if (v6 == -1)
    {
      preferredMetalDevice = v5->_preferredMetalDevice;
      v5->_preferredMetalDevice = 0;
    }
    else
    {
      uint64_t v7 = MPSGetPreferredDevice(v6);
      preferredMetalDevice = v5->_preferredMetalDevice;
      v5->_preferredMetalDevice = (MTLDevice *)v7;
    }

    v5->_enableTestVectorMode = [v4 decodeBoolForKey:@"enableTestVectorMode"];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rootModelURL"];
    rootModelURL = v5->_rootModelURL;
    v5->_rootModelURL = (NSURL *)v17;

    v5->_profilingOptions = [v4 decodeIntegerForKey:@"profilingOptions"];
    v5->_usePreloadedKey = [v4 decodeBoolForKey:@"usePreloadedKey"];
    v5->_trainWithMLCompute = [v4 decodeBoolForKey:@"forceMLComputeTraining"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentModelName"];
    parentModelName = v5->_parentModelName;
    v5->_parentModelName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelName"];
    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = (NSString *)v21;

    v5->_preparesLazily = [v4 decodeBoolForKey:@"preparesLazily"];
    v5->_predictionConcurrencyHint = [v4 decodeIntegerForKey:@"predictionConcurrencyHint"];
    v5->_usePrecompiledE5Bundle = [v4 decodeBoolForKey:@"usePrecompiledE5Bundle"];
    v5->_experimentalMLE5BNNSGraphBackendUsage = [v4 decodeIntegerForKey:@"experimentalMLE5BNNSGraphBackendUsage"];
    v5->_experimentalMLE5BNNSGraphBackendUsageMultiSegment = [v4 decodeIntegerForKey:@"experimentalMLE5BNNSGraphBackendUsageMultiSegment"];
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"e5rtDynamicCallableFunctions"];
    e5rtDynamicCallableFunctions = v5->_e5rtDynamicCallableFunctions;
    v5->_e5rtDynamicCallableFunctions = (NSDictionary *)v27;

    int64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    v32 = objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"e5rtMutableMILWeightURLs"];
    e5rtMutableMILWeightURLs = v5->_e5rtMutableMILWeightURLs;
    v5->_e5rtMutableMILWeightURLs = (NSDictionary *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"optimizationHints"];
    optimizationHints = v5->_optimizationHints;
    v5->_optimizationHints = (MLOptimizationHints *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"functionName"];
    functionName = v5->_functionName;
    v5->_functionName = (NSString *)v37;

    v5->_e5rtComputeDeviceTypeMask = [v4 decodeInt64ForKey:@"e5rtComputeDeviceTypeMask"];
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e5rtCustomANECompilerOptions"];
    e5rtCustomANECompilerOptions = v5->_e5rtCustomANECompilerOptions;
    v5->_e5rtCustomANECompilerOptions = (NSString *)v39;

    v5->_serializesMILTextForDebugging = [v4 decodeBoolForKey:@"serializesMILTextForDebugging"];
    v5->_specializationUsesMPSGraphExecutable = [v4 decodeBoolForKey:@"specializationUsesMPSGraphExecutable"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration computeUnits](self, "computeUnits"), @"computeUnits");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration useWatchSPIForScribble](self, "useWatchSPIForScribble"), @"useSPIforScribble");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration allowLowPrecisionAccumulationOnGPU](self, "allowLowPrecisionAccumulationOnGPU"), @"allowLowPrecisionAccumulationOnGPU");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration allowBackgroundGPUComputeSetting](self, "allowBackgroundGPUComputeSetting"), @"allowBackgroundGPUCompute");
  id v4 = [(MLModelConfiguration *)self preferredMetalDevice];

  if (!v4)
  {
    uint64_t v8 = -1;
LABEL_8:
    [v21 encodeInteger:v8 forKey:@"MPSDeviceOptions"];
    goto LABEL_9;
  }
  id v5 = [(MLModelConfiguration *)self preferredMetalDevice];
  MPSDeviceOptions v6 = MPSGetPreferredDevice(0);

  if (v5 == v6)
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = [(MLModelConfiguration *)self preferredMetalDevice];
  uint64_t v8 = 1;
  v9 = MPSGetPreferredDevice(1uLL);

  if (v7 == v9) {
    goto LABEL_8;
  }
  uint64_t v10 = [(MLModelConfiguration *)self preferredMetalDevice];
  uint64_t v8 = 2;
  uint64_t v11 = MPSGetPreferredDevice(2uLL);

  if (v10 == v11) {
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration enableTestVectorMode](self, "enableTestVectorMode"), @"enableTestVectorMode");
  uint64_t v12 = [(MLModelConfiguration *)self parameters];
  [v21 encodeObject:v12 forKey:@"parameters"];

  uint64_t v13 = [(MLModelConfiguration *)self rootModelURL];
  [v21 encodeObject:v13 forKey:@"rootModelURL"];

  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration profilingOptions](self, "profilingOptions"), @"profilingOptions");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration usePreloadedKey](self, "usePreloadedKey"), @"usePreloadedKey");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration trainWithMLCompute](self, "trainWithMLCompute"), @"forceMLComputeTraining");
  v14 = [(MLModelConfiguration *)self parentModelName];
  [v21 encodeObject:v14 forKey:@"parentModelName"];

  uint64_t v15 = [(MLModelConfiguration *)self modelDisplayName];
  [v21 encodeObject:v15 forKey:@"modelName"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration preparesLazily](self, "preparesLazily"), @"preparesLazily");
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration predictionConcurrencyHint](self, "predictionConcurrencyHint"), @"predictionConcurrencyHint");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration usePrecompiledE5Bundle](self, "usePrecompiledE5Bundle"), @"usePrecompiledE5Bundle");
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsage](self, "experimentalMLE5BNNSGraphBackendUsage"), @"experimentalMLE5BNNSGraphBackendUsage");
  unint64_t v16 = [(MLModelConfiguration *)self e5rtDynamicCallableFunctions];
  [v21 encodeObject:v16 forKey:@"e5rtDynamicCallableFunctions"];

  uint64_t v17 = [(MLModelConfiguration *)self e5rtMutableMILWeightURLs];
  [v21 encodeObject:v17 forKey:@"e5rtMutableMILWeightURLs"];

  v18 = [(MLModelConfiguration *)self optimizationHints];
  [v21 encodeObject:v18 forKey:@"optimizationHints"];

  uint64_t v19 = [(MLModelConfiguration *)self functionName];
  [v21 encodeObject:v19 forKey:@"functionName"];

  objc_msgSend(v21, "encodeInt64:forKey:", -[MLModelConfiguration e5rtComputeDeviceTypeMask](self, "e5rtComputeDeviceTypeMask"), @"e5rtComputeDeviceTypeMask");
  objc_super v20 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
  [v21 encodeObject:v20 forKey:@"e5rtCustomANECompilerOptions"];

  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration serializesMILTextForDebugging](self, "serializesMILTextForDebugging"), @"serializesMILTextForDebugging");
  objc_msgSend(v21, "encodeBool:forKey:", -[MLModelConfiguration specializationUsesMPSGraphExecutable](self, "specializationUsesMPSGraphExecutable"), @"specializationUsesMPSGraphExecutable");
  objc_msgSend(v21, "encodeInteger:forKey:", -[MLModelConfiguration experimentalMLE5BNNSGraphBackendUsageMultiSegment](self, "experimentalMLE5BNNSGraphBackendUsageMultiSegment"), @"experimentalMLE5BNNSGraphBackendUsageMultiSegment");
}

- (unint64_t)hash
{
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLModelConfiguration computeUnits](self, "computeUnits"));
  uint64_t v3 = [v39 hash];
  uint64_t v4 = [(MLModelConfiguration *)self useWatchSPIForScribble];
  uint64_t v5 = v4 ^ [(MLModelConfiguration *)self allowLowPrecisionAccumulationOnGPU];
  uint64_t v6 = v5 ^ [(MLModelConfiguration *)self allowBackgroundGPUComputeSetting];
  uint64_t v38 = [(MLModelConfiguration *)self preferredMetalDevice];
  uint64_t v7 = v3 ^ v6 ^ v38 ^ [(MLModelConfiguration *)self enableTestVectorMode];
  uint64_t v37 = [(MLModelConfiguration *)self parameters];
  uint64_t v8 = [v37 hash];
  v36 = [(MLModelConfiguration *)self rootModelURL];
  uint64_t v9 = v8 ^ [v36 hash];
  int64_t v10 = v9 ^ [(MLModelConfiguration *)self profilingOptions];
  int64_t v11 = v10 ^ [(MLModelConfiguration *)self usePreloadedKey];
  int64_t v12 = v11 ^ [(MLModelConfiguration *)self trainWithMLCompute];
  uint64_t v13 = [(MLModelConfiguration *)self parentModelName];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(MLModelConfiguration *)self modelDisplayName];
  uint64_t v16 = v7 ^ v14 ^ [v15 hash];
  int64_t v17 = [(MLModelConfiguration *)self experimentalMLE5EngineUsage];
  int64_t v18 = v17 ^ [(MLModelConfiguration *)self preparesLazily];
  int64_t v19 = v18 ^ [(MLModelConfiguration *)self predictionConcurrencyHint];
  int64_t v20 = v19 ^ [(MLModelConfiguration *)self usePrecompiledE5Bundle];
  int64_t v21 = v20 ^ [(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsage];
  int64_t v22 = [(MLModelConfiguration *)self e5rtMutableMILWeightURLs];
  uint64_t v23 = v21 ^ [v22 hash];
  uint64_t v24 = [(MLModelConfiguration *)self e5rtDynamicCallableFunctions];
  uint64_t v25 = v16 ^ v23 ^ [v24 hash];
  v26 = [(MLModelConfiguration *)self optimizationHints];
  uint64_t v27 = [v26 hash];
  v28 = [(MLModelConfiguration *)self functionName];
  uint64_t v29 = v27 ^ [v28 hash];
  unint64_t v30 = v29 ^ [(MLModelConfiguration *)self e5rtComputeDeviceTypeMask];
  uint64_t v31 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
  unint64_t v32 = v30 ^ v31 ^ [(MLModelConfiguration *)self serializesMILTextForDebugging];
  unint64_t v33 = v32 ^ [(MLModelConfiguration *)self specializationUsesMPSGraphExecutable];
  unint64_t v34 = v25 ^ v33 ^ [(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsageMultiSegment];

  return v34;
}

- (BOOL)isEqualToModelConfiguration:(id)a3
{
  id v7 = a3;
  MLComputeUnits v8 = [(MLModelConfiguration *)self computeUnits];
  if (v8 == [v7 computeUnits])
  {
    int v9 = [(MLModelConfiguration *)self useWatchSPIForScribble];
    if (v9 == [v7 useWatchSPIForScribble])
    {
      int v10 = [(MLModelConfiguration *)self allowLowPrecisionAccumulationOnGPU];
      if (v10 == [v7 allowLowPrecisionAccumulationOnGPU])
      {
        int v11 = [(MLModelConfiguration *)self allowBackgroundGPUComputeSetting];
        if (v11 == [v7 allowBackgroundGPUComputeSetting])
        {
          uint64_t v14 = [(MLModelConfiguration *)self preferredMetalDevice];
          uint64_t v15 = [v7 preferredMetalDevice];
          if (v14 != v15
            || (int v16 = [(MLModelConfiguration *)self enableTestVectorMode],
                v16 != [v7 enableTestVectorMode]))
          {
            BOOL v12 = 0;
LABEL_10:

            goto LABEL_6;
          }
          int64_t v17 = [(MLModelConfiguration *)self parameters];
          if (v17)
          {
            uint64_t v3 = [(MLModelConfiguration *)self parameters];
            uint64_t v4 = [v7 parameters];
            if (([v3 isEqualToDictionary:v4] & 1) == 0)
            {
              BOOL v12 = 0;
LABEL_23:

              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v18 = [v7 parameters];
            if (v18)
            {
              BOOL v12 = 0;
              int64_t v17 = (void *)v18;
              goto LABEL_24;
            }
          }
          int64_t v19 = [(MLModelConfiguration *)self rootModelURL];
          if (v19)
          {
            int64_t v20 = [(MLModelConfiguration *)self rootModelURL];
            uint64_t v5 = [v7 rootModelURL];
            if ([v20 isEqual:v5])
            {
              v68 = v20;
LABEL_25:
              int64_t v22 = [(MLModelConfiguration *)self profilingOptions];
              if (v22 != [v7 profilingOptions]
                || (int v23 = [(MLModelConfiguration *)self usePreloadedKey],
                    v23 != [v7 usePreloadedKey])
                || (int v24 = [(MLModelConfiguration *)self trainWithMLCompute],
                    v24 != [v7 trainWithMLCompute]))
              {
LABEL_28:
                BOOL v12 = 0;
                if (!v19) {
                  goto LABEL_30;
                }
                goto LABEL_29;
              }
              uint64_t v25 = [(MLModelConfiguration *)self parentModelName];
              if (v25)
              {
                v67 = v5;
                uint64_t v26 = [(MLModelConfiguration *)self parentModelName];
                uint64_t v27 = [v7 parentModelName];
                v66 = (void *)v26;
                v28 = (void *)v26;
                uint64_t v29 = (void *)v27;
                if (([v28 isEqualToString:v27] & 1) == 0)
                {

                  BOOL v12 = 0;
                  uint64_t v5 = v67;
                  if (!v19) {
                    goto LABEL_30;
                  }
                  goto LABEL_29;
                }
                v64 = v29;
                v65 = v25;
              }
              else
              {
                v65 = 0;
                unint64_t v30 = [v7 parentModelName];
                if (v30)
                {

                  goto LABEL_28;
                }
                v67 = v5;
              }
              uint64_t v31 = [(MLModelConfiguration *)self modelDisplayName];
              if (v31)
              {
                unint64_t v32 = [(MLModelConfiguration *)self modelDisplayName];
                v63 = [v7 modelDisplayName];
                if (objc_msgSend(v32, "isEqualToString:"))
                {
                  v62 = v32;
LABEL_47:
                  int64_t v34 = [(MLModelConfiguration *)self experimentalMLE5EngineUsage];
                  if (v34 == [v7 experimentalMLE5EngineUsage])
                  {
                    int v35 = [(MLModelConfiguration *)self preparesLazily];
                    if (v35 == [v7 preparesLazily])
                    {
                      int64_t v36 = [(MLModelConfiguration *)self predictionConcurrencyHint];
                      if (v36 == [v7 predictionConcurrencyHint])
                      {
                        int v37 = [(MLModelConfiguration *)self usePrecompiledE5Bundle];
                        if (v37 == [v7 usePrecompiledE5Bundle])
                        {
                          int64_t v38 = [(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsage];
                          if (v38 == [v7 experimentalMLE5BNNSGraphBackendUsage])
                          {
                            uint64_t v39 = [(MLModelConfiguration *)self e5rtMutableMILWeightURLs];
                            v60 = [v7 e5rtMutableMILWeightURLs];
                            v61 = v39;
                            if (objc_msgSend(v39, "isEqual:"))
                            {
                              v40 = [(MLModelConfiguration *)self e5rtDynamicCallableFunctions];
                              v58 = [v7 e5rtDynamicCallableFunctions];
                              v59 = v40;
                              if (!objc_msgSend(v40, "isEqual:"))
                              {
                                BOOL v44 = 0;
                                goto LABEL_79;
                              }
                              v41 = [(MLModelConfiguration *)self optimizationHints];
                              v56 = [v7 optimizationHints];
                              v57 = v41;
                              if (!objc_msgSend(v41, "isEqual:"))
                              {
                                BOOL v43 = 0;
LABEL_78:

                                BOOL v44 = v43;
                                goto LABEL_79;
                              }
                              v55 = [(MLModelConfiguration *)self functionName];
                              if (v55)
                              {
                                v42 = [(MLModelConfiguration *)self functionName];
                                v53 = [v7 functionName];
                                v54 = v42;
                                if ((objc_msgSend(v42, "isEqual:") & 1) == 0)
                                {
                                  BOOL v43 = 0;
LABEL_77:

                                  goto LABEL_78;
                                }
                              }
                              else
                              {
                                v45 = [v7 functionName];
                                if (v45)
                                {

                                  BOOL v44 = 0;
                                  goto LABEL_81;
                                }
                              }
                              unint64_t v46 = [(MLModelConfiguration *)self e5rtComputeDeviceTypeMask];
                              if (v46 == [v7 e5rtComputeDeviceTypeMask])
                              {
                                uint64_t v47 = [(MLModelConfiguration *)self e5rtCustomANECompilerOptions];
                                v51 = [v7 e5rtCustomANECompilerOptions];
                                v52 = (void *)v47;
                                if ((void *)v47 == v51)
                                {
                                  int v48 = [(MLModelConfiguration *)self serializesMILTextForDebugging];
                                  if (v48 == [v7 serializesMILTextForDebugging])
                                  {
                                    int v49 = [(MLModelConfiguration *)self specializationUsesMPSGraphExecutable];
                                    if (v49 == [v7 specializationUsesMPSGraphExecutable])
                                    {
                                      int64_t v50 = [(MLModelConfiguration *)self experimentalMLE5BNNSGraphBackendUsageMultiSegment];
                                      BOOL v44 = v50 == [v7 experimentalMLE5BNNSGraphBackendUsageMultiSegment];

                                      BOOL v43 = v44;
LABEL_76:
                                      if (v55) {
                                        goto LABEL_77;
                                      }
LABEL_81:

LABEL_79:
                                      BOOL v12 = v44;
                                      if (!v31) {
                                        goto LABEL_61;
                                      }
                                      goto LABEL_60;
                                    }
                                  }
                                }
                              }
                              BOOL v44 = 0;
                              BOOL v43 = 0;
                              goto LABEL_76;
                            }
                          }
                        }
                      }
                    }
                  }
                  BOOL v44 = 0;
                  BOOL v12 = 0;
                  if (!v31)
                  {
LABEL_61:

LABEL_62:
                    uint64_t v5 = v67;
                    if (v65)
                    {
                    }
                    if (!v19)
                    {
LABEL_30:

                      if (!v17) {
                        goto LABEL_24;
                      }
                      goto LABEL_23;
                    }
LABEL_29:

                    goto LABEL_30;
                  }
LABEL_60:

                  BOOL v12 = v44;
                  goto LABEL_61;
                }
              }
              else
              {
                unint64_t v33 = [v7 modelDisplayName];
                if (!v33) {
                  goto LABEL_47;
                }
              }
              BOOL v12 = 0;
              goto LABEL_62;
            }
          }
          else
          {
            int64_t v21 = [v7 rootModelURL];
            if (!v21) {
              goto LABEL_25;
            }
          }
          BOOL v12 = 0;
          if (v17) {
            goto LABEL_23;
          }
LABEL_24:

          goto LABEL_10;
        }
      }
    }
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (id)bnnsGraphBackendUsageToString:(int64_t)a3
{
  if (a3) {
    return @"Disable";
  }
  else {
    return @"Enable";
  }
}

- (id)experimentalMLE5EngineUsageToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"e5EngineUsage has an unrecognized value" userInfo:0];
    objc_exception_throw(v4);
  }
  return *(&off_1E59A3E90 + a3);
}

- (id)computeUnitsToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"computeUnits has an unrecognized value" userInfo:0];
    objc_exception_throw(v4);
  }
  return *(&off_1E59A3E70 + a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSpecializationUsesMPSGraphExecutable:(BOOL)a3
{
  self->_specializationUsesMPSGraphExecutable = a3;
}

- (BOOL)specializationUsesMPSGraphExecutable
{
  return self->_specializationUsesMPSGraphExecutable;
}

@end