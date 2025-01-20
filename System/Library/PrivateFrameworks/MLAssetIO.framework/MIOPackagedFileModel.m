@interface MIOPackagedFileModel
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MIOModelDescription)modelDescription;
- (MIOModeling)specificationFileModel;
- (MIOPackagedFileModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (MIOPackagedFileModel)initWithModel:(id)a3;
- (MIOVersionInfo)specificationVersion;
- (NSArray)layers;
- (NSArray)subModels;
- (NSString)modelTypeName;
- (NSURL)packageURL;
- (id)computePrecisionForFunctionNamed:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3;
- (id)programOperationHistogramForFunctionNamed:(id)a3;
- (id)storagePrecisionForFunctionNamed:(id)a3;
- (unint64_t)hash;
- (void)irProgram;
- (void)setModelDescription:(id)a3;
- (void)setPackageURL:(id)a3;
- (void)setSpecificationFileModel:(id)a3;
@end

@implementation MIOPackagedFileModel

- (MIOPackagedFileModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  __p[22] = *(void **)MEMORY[0x1E4F143B8];
  id v7 = a3;
  v4 = (NSURL *)[v7 copy];
  packageURL = self->_packageURL;
  self->_packageURL = v4;

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
  MPL::ModelPackage::ModelPackage((uint64_t)v9, (char *)__p, 0, 1);
}

- (MIOPackagedFileModel)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIOPackagedFileModel;
  v6 = [(MIOPackagedFileModel *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specificationFileModel, a3);
  }

  return v7;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v20[13] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = [(MIOPackagedFileModel *)self packageURL];
  id v15 = [(id)v5 path];

  v6 = [v14 path];
  id v16 = 0;
  LOBYTE(v5) = [v13 copyItemAtPath:v15 toPath:v6 error:&v16];
  id v12 = v16;
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v6 UTF8String]);
    MPL::ModelPackage::ModelPackage((uint64_t)v20, (char *)&__p, 1u, 0);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MIOPackagedFileModel writeToURL:error:].cold.6([v15 UTF8String], objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), (uint8_t *)&__p);
  }
  if (a4)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v10 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to copy model from %s to %s", objc_msgSend(v15, "UTF8String"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v18 = v10;
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"com.apple.mlassetio", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (MIOVersionInfo)specificationVersion
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  v3 = [v2 specificationVersion];

  return (MIOVersionInfo *)v3;
}

- (NSString)modelTypeName
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  v3 = [v2 modelTypeName];

  return (NSString *)v3;
}

- (NSArray)layers
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  v3 = [v2 layers];

  return (NSArray *)v3;
}

- (NSArray)subModels
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  v3 = [v2 subModels];

  return (NSArray *)v3;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MIOPackagedFileModel *)self specificationFileModel];
  v6 = [v5 neuralNetworkLayerHistogramForFunctionNamed:v4];

  return v6;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MIOPackagedFileModel *)self specificationFileModel];
  v6 = [v5 programOperationHistogramForFunctionNamed:v4];

  return v6;
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MIOPackagedFileModel *)self specificationFileModel];
  v6 = [v5 computePrecisionForFunctionNamed:v4];

  return v6;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MIOPackagedFileModel *)self specificationFileModel];
  v6 = [v5 storagePrecisionForFunctionNamed:v4];

  return v6;
}

- (void)irProgram
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  v3 = (void *)[v2 irProgram];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIOPackagedFileModel *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(MIOPackagedFileModel *)self modelDescription],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          [(MIOPackagedFileModel *)v4 modelDescription],
          v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v5 isEqual:v6],
          v6,
          v5,
          (v7 & 1) != 0))
    {
      v8 = [(MIOPackagedFileModel *)self specificationFileModel];
      objc_super v9 = [(MIOPackagedFileModel *)v4 specificationFileModel];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(MIOPackagedFileModel *)self specificationFileModel];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MIOPackagedFileModel alloc];
  uint64_t v5 = [(MIOPackagedFileModel *)self specificationFileModel];
  v6 = (void *)[v5 copy];
  char v7 = [(MIOPackagedFileModel *)v4 initWithModel:v6];

  v8 = [(MIOPackagedFileModel *)self packageURL];
  objc_super v9 = (void *)[v8 copy];
  [(MIOPackagedFileModel *)v7 setPackageURL:v9];

  char v10 = [(MIOPackagedFileModel *)self modelDescription];
  v11 = (void *)[v10 copy];
  [(MIOPackagedFileModel *)v7 setModelDescription:v11];

  return v7;
}

- (MIOModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void)setPackageURL:(id)a3
{
}

- (MIOModeling)specificationFileModel
{
  return self->_specificationFileModel;
}

- (void)setSpecificationFileModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificationFileModel, 0);
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

- (void)initWithContentsOfURL:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = OUTLINED_FUNCTION_3(v0, v1);
  v3(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DC036000, MEMORY[0x1E4F14500], v4, "Failed to open the model package at %@. Error: %s", v5, v6, v7, v8, v9);
}

- (void)initWithContentsOfURL:error:.cold.3()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = OUTLINED_FUNCTION_3(v0, v1);
  v3(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DC036000, MEMORY[0x1E4F14500], v4, "Failed to extract root model from the model package at %@. Error: %s", v5, v6, v7, v8, v9);
}

- (void)writeToURL:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DC036000, MEMORY[0x1E4F14500], v0, "Failed to write feature descriptions to external JSON file at %@", v1, v2, v3, v4, v5);
}

- (void)writeToURL:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DC036000, MEMORY[0x1E4F14500], v1, "Failed to look up or create file for storing feature descriptions. Error: %s", v2, v3, v4, v5, v6);
}

- (void)writeToURL:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DC036000, MEMORY[0x1E4F14500], v0, "Failed to write metadata to external JSON file at %@", v1, v2, v3, v4, v5);
}

- (void)writeToURL:(uint64_t)a1 error:.cold.4(uint64_t a1)
{
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DC036000, MEMORY[0x1E4F14500], v1, "Failed to look up or create file for storing metadata. Error: %s", v2, v3, v4, v5, v6);
}

- (void)writeToURL:error:.cold.5()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = OUTLINED_FUNCTION_3(v0, v1);
  v3(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DC036000, MEMORY[0x1E4F14500], v4, "Failed to extract root from model package at %@. Error: %s", v5, v6, v7, v8, v9);
}

- (void)writeToURL:(uint8_t *)buf error:.cold.6(uint64_t a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to copy model from %s to %s", buf, 0x16u);
}

@end