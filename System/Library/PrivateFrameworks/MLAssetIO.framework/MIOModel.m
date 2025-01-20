@interface MIOModel
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MIOModel)init;
- (MIOModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MIOModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5;
- (MIOModel)initWithModeling:(id)a3 error:(id *)a4;
- (MIOModelDescription)modelDescription;
- (MIOModeling)modelImpl;
- (MIOVersionInfo)specificationVersion;
- (NSArray)layers;
- (NSArray)subModels;
- (NSString)modelTypeName;
- (id)computePrecisionForFunctionNamed:(id)a3;
- (id)description;
- (id)layerHistogram;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3;
- (id)programOperationHistogramForFunctionNamed:(id)a3;
- (id)storagePrecisionForFunctionNamed:(id)a3;
- (unint64_t)hash;
- (void)irProgram;
- (void)setModelDescription:(id)a3;
- (void)setModelImpl:(id)a3;
@end

@implementation MIOModel

- (MIOModel)init
{
  return [(MIOModel *)self initWithModeling:0 error:0];
}

- (MIOModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 fileSystemRepresentation]);
    MPL::ModelPackage::isValid(__p);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MIOModel initWithContentsOfURL:error:]();
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"MIOModel instance must be initialized with an existing model file or package."];
    v16[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = [v10 errorWithDomain:@"com.apple.mlassetio" code:2 userInfo:v12];

    a4 = 0;
  }

  return (MIOModel *)a4;
}

- (MIOModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  char v9 = [[MIOSpecificationModel alloc] initWithMessageStream:a3 parserContext:v8 error:a5];
  if (v9)
  {
    self = [(MIOModel *)self initWithModeling:v9 error:a5];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MIOModel)initWithModeling:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MIOModel;
  id v8 = [(MIOModel *)&v18 init];
  if (!v8) {
    goto LABEL_8;
  }
  char v9 = [v7 specificationVersion];
  BOOL v10 = [v9 majorVersion] > 9;

  if (!v10)
  {
    objc_storeStrong((id *)&v8->_modelImpl, a3);
LABEL_8:
    a4 = v8;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = [v7 specificationVersion];
    -[MIOModel initWithModeling:error:](buf, [v11 majorVersion], v11);
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v13 = NSString;
    v14 = [v7 specificationVersion];
    uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"The model specification version (%zd) is greater than the maximum supported version (%d)", objc_msgSend(v14, "majorVersion"), 9);
    v20 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *a4 = [v12 errorWithDomain:@"com.apple.mlassetio" code:1 userInfo:v16];

    a4 = 0;
  }
LABEL_9:

  return (MIOModel *)a4;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:v6 error:a4];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v6 lastPathComponent];
    BOOL v10 = [v7 URLByAppendingPathComponent:v9];

    v11 = [(MIOModel *)self modelImpl];
    LOBYTE(v9) = [v11 writeToURL:v10 error:a4];

    if (v9) {
      char v12 = [v8 replaceItemAtURL:v6 withItemAtURL:v10 backupItemName:0 options:0 resultingItemURL:0 error:a4];
    }
    else {
      char v12 = 0;
    }
    [v8 removeItemAtURL:v7 error:0];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (MIOVersionInfo)specificationVersion
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = [v2 specificationVersion];

  return (MIOVersionInfo *)v3;
}

- (NSString)modelTypeName
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = [v2 modelTypeName];

  return (NSString *)v3;
}

- (MIOModelDescription)modelDescription
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = [v2 modelDescription];

  return (MIOModelDescription *)v3;
}

- (void)setModelDescription:(id)a3
{
  id v5 = a3;
  v4 = [(MIOModel *)self modelImpl];
  [v4 setModelDescription:v5];
}

- (NSArray)layers
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = [v2 layers];

  return (NSArray *)v3;
}

- (NSArray)subModels
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = [v2 subModels];

  return (NSArray *)v3;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MIOModel *)self modelImpl];
  id v6 = [v5 neuralNetworkLayerHistogramForFunctionNamed:v4];

  return v6;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MIOModel *)self modelImpl];
  id v6 = [v5 programOperationHistogramForFunctionNamed:v4];

  return v6;
}

- (id)layerHistogram
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1E0198E60](self, a2);
  v14 = [(MIOModel *)self neuralNetworkLayerHistogramForFunctionNamed:0];
  v3 = [(MIOModel *)self programOperationHistogramForFunctionNamed:0];
  id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v5 = v4;
  if (v14) {
    [v4 addObject:v14];
  }
  if (v3) {
    [v5 addObject:v3];
  }
  id v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __26__MIOModel_layerHistogram__block_invoke;
        v15[3] = &unk_1E6C2BB28;
        id v16 = v6;
        [v11 enumerateKeysAndObjectsUsingBlock:v15];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v6;
}

void __26__MIOModel_layerHistogram__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = NSNumber;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v5, "integerValue") + objc_msgSend(v7, "integerValue"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MIOModel *)self modelImpl];
  id v6 = [v5 computePrecisionForFunctionNamed:v4];

  return v6;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MIOModel *)self modelImpl];
  id v6 = [v5 storagePrecisionForFunctionNamed:v4];

  return v6;
}

- (void)irProgram
{
  v2 = [(MIOModel *)self modelImpl];
  v3 = (void *)[v2 irProgram];

  return v3;
}

- (id)description
{
  v2 = NSString;
  v3 = [(MIOModel *)self modelTypeName];
  id v4 = [v2 stringWithFormat:@"MIOModel<%@>", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIOModel *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(MIOModel *)self modelImpl];
      id v6 = [(MIOModel *)v4 modelImpl];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MIOModel *)self modelImpl];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [MIOMutableModel alloc];
  id v5 = [(MIOModel *)self modelImpl];
  id v6 = (void *)[v5 copy];
  char v7 = [(MIOModel *)v4 initWithModeling:v6 error:0];

  return v7;
}

- (MIOModeling)modelImpl
{
  return self->_modelImpl;
}

- (void)setModelImpl:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithContentsOfURL:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "MIOModel instance must be initialized with an existing model file or package.", v0, 2u);
}

- (void)initWithModeling:(void *)a3 error:.cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 9;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "The model specification version (%zd) is greater than the maximum supported version (%d)", buf, 0x12u);
}

@end