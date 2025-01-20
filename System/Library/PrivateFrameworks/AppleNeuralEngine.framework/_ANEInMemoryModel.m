@interface _ANEInMemoryModel
+ (id)inMemoryModelWithDescriptor:(id)a3;
+ (id)new;
+ (void)initialize;
- (BOOL)compileWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5;
- (BOOL)compiledModelExists;
- (BOOL)evaluateWithQoS:(unsigned int)a3 options:(id)a4 request:(id)a5 error:(id *)a6;
- (BOOL)isMILModel;
- (BOOL)loadWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5;
- (BOOL)mapIOSurfacesWithRequest:(id)a3 cacheInference:(BOOL)a4 error:(id *)a5;
- (BOOL)unloadWithQoS:(unsigned int)a3 error:(id *)a4;
- (NSDictionary)modelAttributes;
- (NSString)compilerOptionsFileName;
- (NSString)hexStringIdentifier;
- (NSURL)modelURL;
- (_ANEClient)sharedConnection;
- (_ANEInMemoryModel)init;
- (_ANEInMemoryModel)initWithDesctiptor:(id)a3;
- (_ANEInMemoryModelDescriptor)descriptor;
- (_ANEModel)model;
- (_ANEProgramForEvaluation)program;
- (char)queueDepth;
- (id)compilerOptionsWithOptions:(id)a3 isCompiledModelCached:(BOOL)a4;
- (id)localModelPath;
- (id)saveModelFiles;
- (unint64_t)intermediateBufferHandle;
- (unint64_t)programHandle;
- (unint64_t)state;
- (unint64_t)string_id;
- (unsigned)perfStatsMask;
- (void)dealloc;
- (void)purgeCompiledModel;
- (void)saveModelFiles;
- (void)setCompilerOptionsFileName:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setIntermediateBufferHandle:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)setModelAttributes:(id)a3;
- (void)setModelURL:(id)a3;
- (void)setPerfStatsMask:(unsigned int)a3;
- (void)setProgram:(id)a3;
- (void)setProgramHandle:(unint64_t)a3;
- (void)setQueueDepth:(char)a3;
- (void)setState:(unint64_t)a3;
- (void)unmapIOSurfacesWithRequest:(id)a3;
@end

@implementation _ANEInMemoryModel

+ (void)initialize
{
  gLogger = +[_ANELog framework];
  MEMORY[0x1F41817F8]();
}

+ (id)new
{
  return 0;
}

- (_ANEInMemoryModel)init
{
  return 0;
}

- (_ANEInMemoryModel)initWithDesctiptor:(id)a3
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_ANEInMemoryModel;
  v7 = [(_ANEInMemoryModel *)&v22 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_descriptor, a3);
    uint64_t v9 = [v6 hexStringIdentifier];
    hexStringIdentifier = v8->_hexStringIdentifier;
    v8->_hexStringIdentifier = (NSString *)v9;

    v8->_isMILModel = [v6 isMILModel];
    modelAttributes = v8->_modelAttributes;
    v8->_modelAttributes = (NSDictionary *)MEMORY[0x1E4F1CC08];

    objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "hash"));
    id v12 = objc_claimAutoreleasedReturnValue();
    [v12 UTF8String];
    uint64_t v13 = kdebug_trace_string();
    v8->_string_id = v13;
    if (v13 == -1)
    {
      v14 = +[_ANELog common];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);
      }
    }
    program = v8->_program;
    v8->_programHandle = 0;
    v8->_program = 0;
    v8->_queueDepth = 0;

    v8->_perfStatsMask = 0;
    v8->_state = 0;
    v16 = [v6 optionsPlist];
    if (v16)
    {
      uint64_t v17 = +[_ANEStrings defaultANECIROptionsFileName];
      compilerOptionsFileName = v8->_compilerOptionsFileName;
      v8->_compilerOptionsFileName = (NSString *)v17;
    }
    else
    {
      compilerOptionsFileName = v8->_compilerOptionsFileName;
      v8->_compilerOptionsFileName = 0;
    }

    uint64_t v19 = +[_ANEClient sharedConnection];
    sharedConnection = v8->_sharedConnection;
    v8->_sharedConnection = (_ANEClient *)v19;
  }
  return v8;
}

- (void)dealloc
{
  self->_state = 5;
  unint64_t v4 = kdebug_trace_string();
  self->_string_id = v4;
  if (v4 == -1)
  {
    v5 = +[_ANELog common];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)_ANEInMemoryModel;
  [(_ANEInMemoryModel *)&v6 dealloc];
}

- (id)localModelPath
{
  v3 = NSTemporaryDirectory();
  unint64_t v4 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)saveModelFiles
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(_ANEInMemoryModel *)self modelURL];

  if (v4)
  {
    v5 = [(_ANEInMemoryModel *)self modelURL];
    goto LABEL_33;
  }
  objc_super v6 = [(_ANEInMemoryModel *)self localModelPath];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v47 = 0;
  char v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v47];
  id v9 = v47;
  if ((v8 & 1) == 0)
  {
    v11 = +[_ANELog common];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v39 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v50 = v39;
      __int16 v51 = 2112;
      v52 = v6;
      __int16 v53 = 2112;
      id v54 = v9;
      _os_log_error_impl(&dword_1DB8AB000, v11, OS_LOG_TYPE_ERROR, "%@: createDirectoryAtPath:... failed tmp=%@ : lErr=%@", buf, 0x20u);
    }
    v5 = 0;
    goto LABEL_32;
  }
  v10 = +[_ANEStrings defaultANECIRFileName];
  v11 = [v6 stringByAppendingPathComponent:v10];

  id v12 = [(_ANEInMemoryModel *)self descriptor];
  uint64_t v13 = [v12 networkText];
  char v14 = [v13 writeToFile:v11 atomically:1];

  if (v14)
  {
    v15 = [(_ANEInMemoryModel *)self compilerOptionsFileName];

    if (!v15)
    {
LABEL_8:
      v40 = v11;
      id v41 = v9;
      v42 = v7;
      v21 = [(_ANEInMemoryModel *)self descriptor];
      objc_super v22 = [v21 weights];
      v23 = [v22 allKeys];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v17 = v23;
      uint64_t v24 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v17);
            }
            uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v29 = [(_ANEInMemoryModel *)self descriptor];
            v30 = [v29 weights];
            v31 = [v30 objectForKeyedSubscript:v28];

            v32 = [v31 allKeys];
            v33 = [v32 firstObject];

            v34 = [v31 objectForKeyedSubscript:v33];
            v35 = [v6 stringByAppendingPathComponent:v33];
            if (([v34 writeToFile:v35 atomically:1] & 1) == 0)
            {
              v36 = +[_ANELog common];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                -[_ANEInMemoryModel saveModelFiles]();
              }

              v5 = 0;
              goto LABEL_26;
            }
          }
          uint64_t v25 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
      if (v5)
      {
        [(_ANEInMemoryModel *)self setModelURL:v5];
        [(_ANEInMemoryModel *)self setDescriptor:0];
      }
LABEL_26:
      id v9 = v41;
      v7 = v42;
      v11 = v40;
      goto LABEL_31;
    }
    v16 = [(_ANEInMemoryModel *)self compilerOptionsFileName];
    uint64_t v17 = [v6 stringByAppendingPathComponent:v16];

    v18 = [(_ANEInMemoryModel *)self descriptor];
    uint64_t v19 = [v18 optionsPlist];
    char v20 = [v19 writeToFile:v17 atomically:1];

    if (v20)
    {

      goto LABEL_8;
    }
    v37 = +[_ANELog common];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[_ANEInMemoryModel saveModelFiles]();
    }
  }
  else
  {
    uint64_t v17 = +[_ANELog common];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_ANEInMemoryModel saveModelFiles]();
    }
  }
  v5 = 0;
LABEL_31:

LABEL_32:
LABEL_33:
  return v5;
}

+ (id)inMemoryModelWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDesctiptor:v4];

  return v5;
}

- (id)compilerOptionsWithOptions:(id)a3 isCompiledModelCached:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v6 = (void *)[a3 mutableCopy];
  BOOL v7 = [(_ANEInMemoryModel *)self isMILModel];
  char v8 = kANEFModelMILValue;
  if (!v7) {
    char v8 = kANEFModelANECIRValue;
  }
  id v9 = *v8;
  [v6 setObject:v9 forKeyedSubscript:kANEFModelTypeKey[0]];
  v10 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  [v6 setObject:v10 forKeyedSubscript:kANEFInMemoryModelIdentifierKey];

  v11 = [NSNumber numberWithBool:v4];
  [v6 setObject:v11 forKeyedSubscript:kANEFInMemoryModelIsCachedKey];

  id v12 = [(_ANEInMemoryModel *)self compilerOptionsFileName];

  if (v12)
  {
    uint64_t v13 = [(_ANEInMemoryModel *)self compilerOptionsFileName];
    [v6 setObject:v13 forKeyedSubscript:kANEFCompilerOptionsFilenameKey[0]];
  }
  char v14 = (void *)[v6 copy];

  return v14;
}

- (BOOL)compileWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  v10 = [(_ANEInMemoryModel *)self saveModelFiles];
  if (v10)
  {
    v11 = +[_ANEModel modelAtURL:v10 key:&stru_1F35E5710];
    [(_ANEInMemoryModel *)self setModel:v11];
    id v12 = [(_ANEInMemoryModel *)self compilerOptionsWithOptions:v9 isCompiledModelCached:0];
    uint64_t v13 = [(_ANEInMemoryModel *)self sharedConnection];
    id v18 = 0;
    char v14 = [v13 compileModel:v11 options:v12 qos:v6 error:&v18];
    id v15 = v18;

    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        -[_ANEInMemoryModel compileWithQoS:options:error:]();
        if (a5)
        {
LABEL_5:
          if (v15) {
            *a5 = v15;
          }
        }
      }
      else if (a5)
      {
        goto LABEL_5;
      }
    }

    goto LABEL_11;
  }
  v16 = (void *)gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEInMemoryModel compileWithQoS:options:error:](v16, a2);
  }
  char v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)loadWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  v10 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  }
  BOOL v11 = [(_ANEInMemoryModel *)self compiledModelExists];
  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v13 = [(_ANEInMemoryModel *)self hexStringIdentifier];
    char v14 = [v12 fileURLWithPath:v13];

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
      -[_ANEInMemoryModel loadWithQoS:options:error:]();
    }
    goto LABEL_7;
  }
  char v14 = [(_ANEInMemoryModel *)self saveModelFiles];
  if (v14)
  {
LABEL_7:
    id v15 = v10;
    v16 = +[_ANEModel modelAtURL:v14 key:&stru_1F35E5710];
    [(_ANEInMemoryModel *)self setModel:v16];
    id v25 = v9;
    uint64_t v17 = [(_ANEInMemoryModel *)self compilerOptionsWithOptions:v9 isCompiledModelCached:v11];
    id v18 = [(_ANEInMemoryModel *)self sharedConnection];
    id v26 = 0;
    int v19 = [v18 loadModel:v16 options:v17 qos:v6 error:&v26];
    id v20 = v26;

    if (v19)
    {
      -[_ANEInMemoryModel setProgramHandle:](self, "setProgramHandle:", [v16 programHandle]);
      -[_ANEInMemoryModel setIntermediateBufferHandle:](self, "setIntermediateBufferHandle:", [v16 intermediateBufferHandle]);
      -[_ANEInMemoryModel setQueueDepth:](self, "setQueueDepth:", [v16 queueDepth]);
      v21 = [v16 modelAttributes];
      [(_ANEInMemoryModel *)self setModelAttributes:v21];

      -[_ANEInMemoryModel setPerfStatsMask:](self, "setPerfStatsMask:", [v16 perfStatsMask]);
      objc_super v22 = [v16 program];
      [(_ANEInMemoryModel *)self setProgram:v22];

      [(_ANEInMemoryModel *)self setState:3];
      v10 = v15;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
        -[_ANEInMemoryModel loadWithQoS:options:error:]();
      }
      v10 = v15;
      if (a5 && v20) {
        *a5 = v20;
      }
    }

    id v9 = v25;
    goto LABEL_15;
  }
  uint64_t v24 = (void *)gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEInMemoryModel compileWithQoS:options:error:](v24, a2);
  }
  LOBYTE(v19) = 0;
LABEL_15:

  return v19;
}

- (BOOL)unloadWithQoS:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  v36[2] = *MEMORY[0x1E4F143B8];
  char v8 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  BOOL v9 = [(_ANEInMemoryModel *)self isMILModel];
  v10 = kANEFModelMILValue;
  if (!v9) {
    v10 = kANEFModelANECIRValue;
  }
  BOOL v11 = *v10;
  v35[0] = kANEFModelTypeKey[0];
  v35[1] = kANEFInMemoryModelIdentifierKey;
  v36[0] = v11;
  v36[1] = v8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint64_t v13 = [(_ANEInMemoryModel *)self sharedConnection];
  char v14 = [(_ANEInMemoryModel *)self model];
  id v28 = 0;
  int v15 = [v13 unloadModel:v14 options:v12 qos:v5 error:&v28];
  id v16 = v28;

  if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR)) {
    -[_ANEInMemoryModel unloadWithQoS:error:]();
  }
  uint64_t v17 = [(_ANEInMemoryModel *)self localModelPath];
  id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v27 = 0;
  if ([v18 fileExistsAtPath:v17 isDirectory:&v27])
  {
    aSelector = a2;
    id v26 = v16;
    char v19 = [v18 removeItemAtPath:v17 error:&v26];
    id v20 = v26;

    if ((v19 & 1) == 0)
    {
      v21 = (void *)gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        objc_super v22 = v21;
        v23 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        v30 = v23;
        __int16 v31 = 2112;
        v32 = v17;
        __int16 v33 = 2112;
        id v34 = v20;
        _os_log_error_impl(&dword_1DB8AB000, v22, OS_LOG_TYPE_ERROR, "%@: removeItemAtPath: failed! localPath=%@ : lErr=%@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v20 = v16;
  }
  if (a4 && v15 != 1 && v20) {
    *a4 = v20;
  }

  return v15;
}

- (BOOL)evaluateWithQoS:(unsigned int)a3 options:(id)a4 request:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[_ANEVirtualClient sharedConnection];

  if (v13)
  {
    char v14 = +[_ANEVirtualClient sharedConnection];
    int v15 = [(_ANEInMemoryModel *)self model];
    LOBYTE(v8) = [v14 evaluateWithModel:v15 options:v11 request:v12 qos:v8 error:a6];

    goto LABEL_13;
  }
  if (+[_ANEDeviceInfo isVirtualMachine])
  {
    id v16 = (void *)gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEInMemoryModel evaluateWithQoS:options:request:error:](v16, a2);
      if (!a6) {
        goto LABEL_7;
      }
    }
    else if (!a6)
    {
LABEL_7:
      LOBYTE(v8) = 0;
      goto LABEL_13;
    }
    uint64_t v17 = NSStringFromSelector(a2);
    *a6 = +[_ANEErrors hostTooOld:v17];

    goto LABEL_7;
  }
  unint64_t v18 = +[_ANEQoSMapper queueIndexForQoS:v8];
  unsigned int v25 = 0;
  char v19 = [(_ANEInMemoryModel *)self program];
  id v24 = 0;
  LODWORD(v8) = objc_msgSend(v19, "processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:", v12, 0, v8, v18, -[_ANEInMemoryModel string_id](self, "string_id"), v11, &v25, &v24);
  id v20 = v24;

  if (a6 && !v8 && v20)
  {
    *a6 = v20;
    v21 = [(_ANEInMemoryModel *)self sharedConnection];
    objc_super v22 = [(_ANEInMemoryModel *)self model];
    [v21 reportEvaluateFailure:v22 failureReason:v25 qIdx:v18];
  }
LABEL_13:

  return v8;
}

- (BOOL)compiledModelExists
{
  v3 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  }
  BOOL v4 = [(_ANEInMemoryModel *)self sharedConnection];
  char v5 = [v4 compiledModelExistsMatchingHash:v3];

  return v5;
}

- (void)purgeCompiledModel
{
  v3 = [(_ANEInMemoryModel *)self hexStringIdentifier];
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG)) {
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  }
  BOOL v4 = [(_ANEInMemoryModel *)self sharedConnection];
  [v4 purgeCompiledModelMatchingHash:v3];
}

- (BOOL)mapIOSurfacesWithRequest:(id)a3 cacheInference:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = [(_ANEInMemoryModel *)self sharedConnection];
  v10 = [(_ANEInMemoryModel *)self model];
  LOBYTE(a5) = [v9 mapIOSurfacesWithModel:v10 request:v8 cacheInference:v6 error:a5];

  return (char)a5;
}

- (void)unmapIOSurfacesWithRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(_ANEInMemoryModel *)self sharedConnection];
  char v5 = [(_ANEInMemoryModel *)self model];
  [v6 unmapIOSurfacesWithModel:v5 request:v4];
}

- (NSDictionary)modelAttributes
{
  return self->_modelAttributes;
}

- (void)setModelAttributes:(id)a3
{
}

- (unsigned)perfStatsMask
{
  return self->_perfStatsMask;
}

- (void)setPerfStatsMask:(unsigned int)a3
{
  self->_perfStatsMask = a3;
}

- (NSString)hexStringIdentifier
{
  return self->_hexStringIdentifier;
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (void)setQueueDepth:(char)a3
{
  self->_queueDepth = a3;
}

- (_ANEClient)sharedConnection
{
  return self->_sharedConnection;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (BOOL)isMILModel
{
  return self->_isMILModel;
}

- (NSString)compilerOptionsFileName
{
  return self->_compilerOptionsFileName;
}

- (void)setCompilerOptionsFileName:(id)a3
{
}

- (_ANEModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (unint64_t)string_id
{
  return self->_string_id;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (_ANEProgramForEvaluation)program
{
  return self->_program;
}

- (void)setProgram:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_ANEInMemoryModelDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_compilerOptionsFileName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_sharedConnection, 0);
  objc_storeStrong((id *)&self->_hexStringIdentifier, 0);
  objc_storeStrong((id *)&self->_modelAttributes, 0);
}

- (void)saveModelFiles
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1DB8AB000, v2, v3, "%@:  Write netPlistPath=%@ failed", v4, v5, v6, v7, v8);
}

- (void)compileWithQoS:(void *)a1 options:(const char *)a2 error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: saveModelFiles failed", v7, v8, v9, v10, 2u);
}

- (void)compileWithQoS:options:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v5, v6, "%@: compileModel:options:qos:error: failed! lErr=%@", v7, v8, v9, v10, v11);
}

- (void)loadWithQoS:options:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v5, v6, "%@: loadModel:options:qos:error: failed! lErr=%@", v7, v8, v9, v10, v11);
}

- (void)loadWithQoS:options:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_3(&dword_1DB8AB000, v5, v6, "%@: modelURL=%@", v7, v8, v9, v10, v11);
}

- (void)loadWithQoS:options:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_2_3(&dword_1DB8AB000, v5, v6, "%@: modelIdentifier=%@", v7, v8, v9, v10, v11);
}

- (void)unloadWithQoS:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (const char *)OUTLINED_FUNCTION_4_1();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_6_1(&dword_1DB8AB000, v5, v6, "%@: unLoadModel:options:qos:error: failed! lErr=%@", v7, v8, v9, v10, v11);
}

- (void)evaluateWithQoS:(void *)a1 options:(const char *)a2 request:error:.cold.1(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_7_0(&dword_1DB8AB000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, 2u);
}

@end