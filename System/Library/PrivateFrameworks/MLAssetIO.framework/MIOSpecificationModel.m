@interface MIOSpecificationModel
- (BOOL)isEqual:(id)a3;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MIOModelDescription)modelDescription;
- (MIOParserContext)parserContext;
- (MIOSpecificationModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5;
- (MIOSpecificationModel)initWithSpecificationData:(id)a3 parserContext:(id)a4 error:(id *)a5;
- (MIOVersionInfo)specificationVersion;
- (NSArray)layers;
- (NSArray)subModels;
- (NSData)specificationData;
- (NSString)modelTypeName;
- (id).cxx_construct;
- (id)computePrecisionForFunctionNamed:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3;
- (id)programOperationHistogramForFunctionNamed:(id)a3;
- (id)storagePrecisionForFunctionNamed:(id)a3;
- (unint64_t)_indexForFunctionNamed:(id)a3;
- (unint64_t)hash;
- (void)irProgram;
- (void)setModelDescription:(id)a3;
@end

@implementation MIOSpecificationModel

- (MIOSpecificationModel)initWithSpecificationData:(id)a3 parserContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_specificationData, a3);
  objc_storeStrong((id *)&self->_parserContext, a4);
  id v11 = v9;
  uint64_t v12 = [v11 bytes];
  int v13 = [v11 length];
  v16[0] = v12;
  v16[1] = v12 + v13;
  v16[2] = 0;
  int v17 = v13;
  uint64_t v18 = 0;
  __int16 v19 = 0;
  int v20 = v13;
  uint64_t v21 = 0x7FFFFFFF00000000;
  int v22 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  int v23 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
  char v24 = 1;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  v14 = [(MIOSpecificationModel *)self initWithMessageStream:v16 parserContext:v10 error:a5];
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)v16);

  return v14;
}

- (MIOSpecificationModel)initWithMessageStream:(CodedInputStream *)a3 parserContext:(id)a4 error:(id *)a5
{
  v40[3] = *(void ***)MEMORY[0x1E4F143B8];
  v29 = (MIOParserContext *)a4;
  v39.receiver = self;
  v39.super_class = (Class)MIOSpecificationModel;
  id v7 = [(MIOSpecificationModel *)&v39 init];
  if (!v7)
  {
LABEL_20:
    uint64_t v25 = (MIOSpecificationModel *)v7;
    goto LABEL_26;
  }
  int v30 = 0;
  v34 = 0;
  int v35 = 0;
  uint64_t v31 = 0;
  v32 = 0;
  int v33 = 0;
  *(_OWORD *)obj = 0u;
  memset(v37, 0, sizeof(v37));
  uint64_t v38 = 0;
  MIOParseModelSpecification(a3, v29, (MIOModelInfo *)&v30);
  v8 = [MIOModelDescription alloc];
  uint64_t v9 = v31;
  int v10 = v33;
  uint64_t v11 = *(void *)&v37[0];
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v13 = (void *)*((void *)&v37[0] + 1);
  for (i = *(void **)&v37[1]; v13 != i; v13 += 5)
  {
    if (*v13)
    {
      objc_msgSend(v12, "addObject:");
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v12 addObject:v15];
    }
  }
  if (v11) {
    uint64_t v16 = v11;
  }
  else {
    uint64_t v16 = MEMORY[0x1E4F1CBF0];
  }
  int v17 = [(MIOModelDescription *)v8 initWithSpecification:v9 isUpdatable:v10 != 0 modelParameters:v16 classLabelsPerFunction:v12 error:a5];

  if (v17)
  {
    uint64_t v18 = [MIOVersionInfo alloc];
    uint64_t v19 = [(MIOVersionInfo *)v18 initWithMajor:v30 minor:0 patch:0];
    int v20 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v19;

    if (v34) {
      uint64_t v21 = v34;
    }
    else {
      uint64_t v21 = @"UNKNOWN";
    }
    objc_storeStrong((id *)v7 + 6, v21);
    objc_storeStrong((id *)v7 + 9, obj[0]);
    objc_storeStrong((id *)v7 + 8, obj[1]);
    objc_storeStrong((id *)v7 + 7, v17);
    std::vector<MIOFunctionInfo>::__vdeallocate((void ***)v7 + 2);
    *((_OWORD *)v7 + 1) = *(_OWORD *)((char *)v37 + 8);
    *((void *)v7 + 4) = *((void *)&v37[1] + 1);
    memset((char *)v37 + 8, 0, 24);
    uint64_t v22 = v38;
    uint64_t v38 = 0;
    uint64_t v23 = *((void *)v7 + 1);
    *((void *)v7 + 1) = v22;
    if (v23) {
      (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
    }

    uint64_t v24 = v38;
    uint64_t v38 = 0;
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
    }
    v40[0] = (void **)v37 + 1;
    std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100](v40);

    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    goto LABEL_20;
  }
  uint64_t v26 = v38;
  uint64_t v38 = 0;
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
  }
  v40[0] = (void **)v37 + 1;
  std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100](v40);

  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  uint64_t v25 = 0;
LABEL_26:

  return v25;
}

- (unint64_t)_indexForFunctionNamed:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    || ([(MIOSpecificationModel *)self modelDescription],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 defaultFunctionName],
        v5 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    id v7 = [(MIOSpecificationModel *)self modelDescription];
    v8 = [v7 functionDescriptions];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__MIOSpecificationModel__indexForFunctionNamed___block_invoke;
    v12[3] = &unk_1E6C2BC98;
    id v9 = v5;
    id v13 = v9;
    unint64_t v10 = [v8 indexOfObjectPassingTest:v12];
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

uint64_t __48__MIOSpecificationModel__indexForFunctionNamed___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)programOperationHistogramForFunctionNamed:(id)a3
{
  unint64_t v4 = [(MIOSpecificationModel *)self _indexForFunctionNamed:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  else {
    id v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 2);
  }
  return v5;
}

- (id)neuralNetworkLayerHistogramForFunctionNamed:(id)a3
{
  unint64_t v4 = [(MIOSpecificationModel *)self _indexForFunctionNamed:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  else {
    id v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 1);
  }
  return v5;
}

- (id)computePrecisionForFunctionNamed:(id)a3
{
  unint64_t v4 = [(MIOSpecificationModel *)self _indexForFunctionNamed:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  else {
    id v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 3);
  }
  return v5;
}

- (id)storagePrecisionForFunctionNamed:(id)a3
{
  unint64_t v4 = [(MIOSpecificationModel *)self _indexForFunctionNamed:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    id v5 = 0;
  }
  else {
    id v5 = *((id *)self->_functions.__begin_ + 5 * v4 + 4);
  }
  return v5;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(MIOSpecificationModel *)self specificationData];

  if (v7)
  {
    int v8 = open((const char *)[v6 fileSystemRepresentation], 1537, 420);
    google::protobuf::io::FileOutputStream::FileOutputStream((uint64_t)v42, v8, -1);
    google::protobuf::io::CodedOutputStream::CodedOutputStream((uint64_t)v39, (uint64_t)v42);
    id v9 = [(MIOSpecificationModel *)self specificationData];
    unint64_t v10 = (char *)[v9 bytes];
    uint64_t v11 = [(MIOSpecificationModel *)self specificationData];
    int v12 = [v11 length];
    v38.var0 = v10;
    v38.var1 = &v10[v12];
    v38.var2 = 0;
    v38.var3 = v12;
    *(void *)&v38.var4 = 0;
    *(_WORD *)&v38.var6 = 0;
    *(void *)&v38.var9 = 0x7FFFFFFF00000000;
    v38.var8 = v12;
    v38.var11 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
    v38.var12 = google::protobuf::io::CodedInputStream::default_recursion_limit_;
    v38.var13 = 1;
    v38.var14 = 0;
    v38.var15 = 0;

    MLAssetIO::ProtoWireFormatParser::ProtoWireFormatParser((uint64_t)v37, &v38);
    while (1)
    {
      int Field = MLAssetIO::ProtoWireFormatParser::nextField((MLAssetIO::ProtoWireFormatParser *)v37);
      BOOL v14 = Field == 0;
      if (!Field) {
        break;
      }
      unsigned int v15 = MLAssetIO::ProtoWireFormatParser::tag((MLAssetIO::ProtoWireFormatParser *)v37);
      unsigned int v16 = v15;
      if (v41 < 5)
      {
        google::protobuf::io::CodedOutputStream::WriteVarint32SlowPath((google::protobuf::io::CodedOutputStream *)v39, v15);
      }
      else
      {
        int v17 = (int)v40;
        if (v15 < 0x80)
        {
          LOBYTE(v19) = v15;
          uint64_t v18 = v40;
        }
        else
        {
          uint64_t v18 = v40;
          do
          {
            *v18++ = v16 | 0x80;
            unsigned int v19 = v16 >> 7;
            unsigned int v20 = v16 >> 14;
            v16 >>= 7;
          }
          while (v20);
        }
        *uint64_t v18 = v19;
        int v21 = v18 - v17 + 1;
        v40 += v21;
        v41 -= v21;
      }
      if (Field == 2)
      {
        CoreML::Specification::ModelDescription::ModelDescription((CoreML::Specification::ModelDescription *)v36, (const CoreML::Specification::ModelDescription *)[(MIOModelDescription *)self->_modelDescription modelDescriptionSpecification]);
        unsigned int v22 = google::protobuf::MessageLite::ByteSize((google::protobuf::MessageLite *)v36);
        unsigned int v23 = v22;
        if (v41 < 5)
        {
          google::protobuf::io::CodedOutputStream::WriteVarint32SlowPath((google::protobuf::io::CodedOutputStream *)v39, v22);
        }
        else
        {
          int v24 = (int)v40;
          if (v22 < 0x80)
          {
            LOBYTE(v26) = v22;
            uint64_t v25 = v40;
          }
          else
          {
            uint64_t v25 = v40;
            do
            {
              *v25++ = v23 | 0x80;
              unsigned int v26 = v23 >> 7;
              unsigned int v27 = v23 >> 14;
              v23 >>= 7;
            }
            while (v27);
          }
          *uint64_t v25 = v26;
          int v28 = v25 - v24 + 1;
          v40 += v28;
          v41 -= v28;
        }
        if ((google::protobuf::MessageLite::SerializeToCodedStream((google::protobuf::MessageLite *)v36, (google::protobuf::io::CodedOutputStream *)v39) & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[MIOSpecificationModel writeToURL:error:]();
          }
          if (a4)
          {
            v32 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v43 = *MEMORY[0x1E4F28568];
            int v33 = [NSString stringWithFormat:@"Failed to serialize ModelDescription message"];
            v44 = v33;
            v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
            *a4 = [v32 errorWithDomain:@"com.apple.mlassetio" code:2 userInfo:v34];
          }
          CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v36);
          break;
        }
        CoreML::Specification::ModelDescription::~ModelDescription((CoreML::Specification::ModelDescription *)v36);
      }
      else
      {
        MLAssetIO::ProtoWireFormatParser::copyFieldTo((uint64_t)v37, (google::protobuf::io::CodedOutputStream *)v39);
      }
    }
    google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v38);
    google::protobuf::io::CodedOutputStream::~CodedOutputStream((google::protobuf::io::CodedOutputStream *)v39);
    google::protobuf::io::FileOutputStream::~FileOutputStream((google::protobuf::io::FileOutputStream *)v42);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MIOSpecificationModel writeToURL:error:]();
    }
    if (a4)
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      int v30 = [NSString stringWithFormat:@"Model instance must be initialized with an existing model file to write the content back to a file."];
      v46[0] = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      *a4 = [v29 errorWithDomain:@"com.apple.mlassetio" code:2 userInfo:v31];
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)irProgram
{
  return self->_irProgram.__ptr_.__value_;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MIOSpecificationModel *)a3;
  if (self == v4)
  {
    char v20 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v20 = 0;
    goto LABEL_12;
  }
  id v5 = v4;
  id v6 = [(MIOSpecificationModel *)self specificationVersion];
  id v7 = [(MIOSpecificationModel *)v5 specificationVersion];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0) {
    goto LABEL_8;
  }
  id v9 = [(MIOSpecificationModel *)self modelTypeName];
  unint64_t v10 = [(MIOSpecificationModel *)v5 modelTypeName];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0) {
    goto LABEL_8;
  }
  int v12 = [(MIOSpecificationModel *)self modelDescription];
  id v13 = [(MIOSpecificationModel *)v5 modelDescription];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0) {
    goto LABEL_8;
  }
  unsigned int v15 = [(MIOSpecificationModel *)self layers];
  unsigned int v16 = [(MIOSpecificationModel *)v5 layers];
  if (v15 == v16)
  {

    goto LABEL_14;
  }
  int v17 = [(MIOSpecificationModel *)self layers];
  uint64_t v18 = [(MIOSpecificationModel *)v5 layers];
  char v19 = [v17 isEqual:v18];

  if (v19)
  {
LABEL_14:
    unsigned int v22 = [(MIOSpecificationModel *)self subModels];
    unsigned int v23 = [(MIOSpecificationModel *)v5 subModels];
    if (v22 == v23)
    {
      char v20 = 1;
      unsigned int v23 = v22;
    }
    else
    {
      int v24 = [(MIOSpecificationModel *)self subModels];
      uint64_t v25 = [(MIOSpecificationModel *)v5 subModels];
      char v20 = [v24 isEqual:v25];
    }
    goto LABEL_9;
  }
LABEL_8:
  char v20 = 0;
LABEL_9:

LABEL_12:
  return v20;
}

- (unint64_t)hash
{
  v3 = [(MIOSpecificationModel *)self modelTypeName];
  uint64_t v4 = [v3 hash];
  id v5 = [(MIOSpecificationModel *)self modelDescription];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [MIOSpecificationModel alloc];
  id v5 = [(MIOSpecificationModel *)self specificationData];
  unint64_t v6 = [(MIOSpecificationModel *)self parserContext];
  id v14 = 0;
  id v7 = [(MIOSpecificationModel *)v4 initWithSpecificationData:v5 parserContext:v6 error:&v14];
  id v8 = v14;

  if (v8)
  {
    id v9 = +[MIOLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(MIOSpecificationModel *)(uint64_t)self copyWithZone:v9];
    }

    unint64_t v10 = 0;
  }
  else
  {
    char v11 = [(MIOSpecificationModel *)self modelDescription];
    int v12 = (void *)[v11 copy];
    [(MIOSpecificationModel *)v7 setModelDescription:v12];

    unint64_t v10 = v7;
  }

  return v10;
}

- (MIOVersionInfo)specificationVersion
{
  return self->_specificationVersion;
}

- (NSString)modelTypeName
{
  return self->_modelTypeName;
}

- (MIOModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
}

- (NSArray)layers
{
  return self->_layers;
}

- (NSArray)subModels
{
  return self->_subModels;
}

- (NSData)specificationData
{
  return self->_specificationData;
}

- (MIOParserContext)parserContext
{
  return self->_parserContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserContext, 0);
  objc_storeStrong((id *)&self->_specificationData, 0);
  objc_storeStrong((id *)&self->_subModels, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_modelTypeName, 0);
  objc_storeStrong((id *)&self->_specificationVersion, 0);
  p_functions = &self->_functions;
  std::vector<MIOFunctionInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_functions);
  value = self->_irProgram.__ptr_.__value_;
  self->_irProgram.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(IRProgram *))(*(void *)value + 8))(value);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)initWithMessageStream:(uint64_t)a1 parserContext:error:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to parse the model specification. Error: %s", (uint8_t *)&v2, 0xCu);
}

- (void)writeToURL:error:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Model instance must be initialized with an existing model file to write the content back to a file.", v0, 2u);
}

- (void)writeToURL:error:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to serialize ModelDescription message", v0, 2u);
}

- (void)copyWithZone:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DC036000, log, OS_LOG_TYPE_ERROR, "Failed to clone %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end