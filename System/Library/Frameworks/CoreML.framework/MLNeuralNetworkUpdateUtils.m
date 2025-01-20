@interface MLNeuralNetworkUpdateUtils
+ (BOOL)loadUpdateParameters:(void *)a3 fromCompiledArchive:(void *)a4 error:(id *)a5;
+ (id)createClassLabelToIndexMapWith:(id)a3;
+ (id)loadParameterDescriptionsAndContainerFromUpdateParameters:(const void *)a3 modelDescription:(id)a4;
@end

@implementation MLNeuralNetworkUpdateUtils

+ (id)createClassLabelToIndexMapWith:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithInteger:", v7 + i, (void)v13);
        [v4 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v7 += i;
    }
    while (v6);
  }

  return v4;
}

+ (id)loadParameterDescriptionsAndContainerFromUpdateParameters:(const void *)a3 modelDescription:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((void *)a3 + 6))
  {
    uint64_t v8 = +[MLParameterKey epochs];
    if (*((void *)a3 + 6)) {
      v9 = (uint64_t *)*((void *)a3 + 6);
    }
    else {
      v9 = &CoreML::Specification::_Int64Parameter_default_instance_;
    }
    uint64_t v10 = +[MLParameterDescription parameterDescriptionForKey:v8 int64ParameterSpec:v9];
    [v7 addObject:v10];
  }
  v11 = +[MLParameterKey epochs];
  [v6 addObject:v11];

  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((void *)a3 + 7))
  {
    v12 = +[MLParameterKey shuffle];
    if (*((void *)a3 + 7)) {
      long long v13 = (uint64_t *)*((void *)a3 + 7);
    }
    else {
      long long v13 = &CoreML::Specification::_BoolParameter_default_instance_;
    }
    long long v14 = +[MLParameterDescription parameterDescriptionForKey:v12 BOOLParameterSpec:v13];
    [v7 addObject:v14];
  }
  long long v15 = +[MLParameterKey shuffle];
  [v6 addObject:v15];

  if (a3 != &CoreML::Specification::_NetworkUpdateParameters_default_instance_ && *((void *)a3 + 8))
  {
    long long v16 = +[MLParameterKey seed];
    if (*((void *)a3 + 8)) {
      v17 = (uint64_t *)*((void *)a3 + 8);
    }
    else {
      v17 = &CoreML::Specification::_Int64Parameter_default_instance_;
    }
    uint64_t v18 = +[MLParameterDescription parameterDescriptionForKey:v16 int64ParameterSpec:v17];
    [v7 addObject:v18];
  }
  v19 = +[MLParameterKey seed];
  [v6 addObject:v19];

  if (*((void *)a3 + 5)) {
    v20 = (const CoreML::Specification::Optimizer *)*((void *)a3 + 5);
  }
  else {
    v20 = (const CoreML::Specification::Optimizer *)&CoreML::Specification::_Optimizer_default_instance_;
  }
  CoreML::Specification::Optimizer::Optimizer((CoreML::Specification::Optimizer *)v85, v20);
  if (v87 == 10)
  {
    if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[2])
    {
      v24 = +[MLParameterKey learningRate];
      v25 = v24;
      if (v87 == 10)
      {
        v26 = v86;
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v24);
        v26 = &CoreML::Specification::_SGDOptimizer_default_instance_;
      }
      v35 = (uint64_t *)v26[2];
      if (v35) {
        v36 = v35;
      }
      else {
        v36 = &CoreML::Specification::_DoubleParameter_default_instance_;
      }
      v37 = +[MLParameterDescription parameterDescriptionForKey:v25 doubleParameterSpec:v36];
      [v7 addObject:v37];
    }
    v38 = +[MLParameterKey learningRate];
    [v6 addObject:v38];

    if (v87 == 10)
    {
      if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[3])
      {
        v40 = +[MLParameterKey miniBatchSize];
        v41 = v40;
        if (v87 == 10)
        {
          v42 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v40);
          v42 = &CoreML::Specification::_SGDOptimizer_default_instance_;
        }
        v51 = (uint64_t *)v42[3];
        if (v51) {
          v52 = v51;
        }
        else {
          v52 = &CoreML::Specification::_Int64Parameter_default_instance_;
        }
        v53 = +[MLParameterDescription parameterDescriptionForKey:v41 int64ParameterSpec:v52];
        [v7 addObject:v53];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v39);
    }
    v54 = +[MLParameterKey miniBatchSize];
    [v6 addObject:v54];

    if (v87 == 10)
    {
      if (v86 != &CoreML::Specification::_SGDOptimizer_default_instance_ && v86[4])
      {
        v56 = +[MLParameterKey momentum];
        v57 = v56;
        if (v87 == 10)
        {
          v58 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v56);
          v58 = &CoreML::Specification::_SGDOptimizer_default_instance_;
        }
        v67 = (uint64_t *)v58[4];
        if (v67) {
          v68 = v67;
        }
        else {
          v68 = &CoreML::Specification::_DoubleParameter_default_instance_;
        }
        v69 = +[MLParameterDescription parameterDescriptionForKey:v57 doubleParameterSpec:v68];
        [v7 addObject:v69];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v55);
    }
    v70 = +[MLParameterKey momentum];
    [v6 addObject:v70];
  }
  else
  {
    if (v87 != 11) {
      goto LABEL_111;
    }
    if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[2])
    {
      v21 = +[MLParameterKey learningRate];
      v22 = v21;
      if (v87 == 11)
      {
        v23 = v86;
      }
      else
      {
        CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v21);
        v23 = &CoreML::Specification::_AdamOptimizer_default_instance_;
      }
      v27 = (uint64_t *)v23[2];
      if (v27) {
        v28 = v27;
      }
      else {
        v28 = &CoreML::Specification::_DoubleParameter_default_instance_;
      }
      v29 = +[MLParameterDescription parameterDescriptionForKey:v22 doubleParameterSpec:v28];
      [v7 addObject:v29];
    }
    v30 = +[MLParameterKey learningRate];
    [v6 addObject:v30];

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[3])
      {
        v32 = +[MLParameterKey miniBatchSize];
        v33 = v32;
        if (v87 == 11)
        {
          v34 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v32);
          v34 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v43 = (uint64_t *)v34[3];
        if (v43) {
          v44 = v43;
        }
        else {
          v44 = &CoreML::Specification::_Int64Parameter_default_instance_;
        }
        v45 = +[MLParameterDescription parameterDescriptionForKey:v33 int64ParameterSpec:v44];
        [v7 addObject:v45];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v31);
    }
    v46 = +[MLParameterKey miniBatchSize];
    [v6 addObject:v46];

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[4])
      {
        v48 = +[MLParameterKey beta1];
        v49 = v48;
        if (v87 == 11)
        {
          v50 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v48);
          v50 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v59 = (uint64_t *)v50[4];
        if (v59) {
          v60 = v59;
        }
        else {
          v60 = &CoreML::Specification::_DoubleParameter_default_instance_;
        }
        v61 = +[MLParameterDescription parameterDescriptionForKey:v49 doubleParameterSpec:v60];
        [v7 addObject:v61];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v47);
    }
    v62 = +[MLParameterKey beta1];
    [v6 addObject:v62];

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[5])
      {
        v64 = +[MLParameterKey beta2];
        v65 = v64;
        if (v87 == 11)
        {
          v66 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v64);
          v66 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v71 = (uint64_t *)v66[5];
        if (v71) {
          v72 = v71;
        }
        else {
          v72 = &CoreML::Specification::_DoubleParameter_default_instance_;
        }
        v73 = +[MLParameterDescription parameterDescriptionForKey:v65 doubleParameterSpec:v72];
        [v7 addObject:v73];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v63);
    }
    v74 = +[MLParameterKey beta2];
    [v6 addObject:v74];

    if (v87 == 11)
    {
      if (v86 != &CoreML::Specification::_AdamOptimizer_default_instance_ && v86[6])
      {
        v76 = +[MLParameterKey eps];
        v77 = v76;
        if (v87 == 11)
        {
          v78 = v86;
        }
        else
        {
          CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v76);
          v78 = &CoreML::Specification::_AdamOptimizer_default_instance_;
        }
        v79 = (uint64_t *)v78[6];
        if (v79) {
          v80 = v79;
        }
        else {
          v80 = &CoreML::Specification::_DoubleParameter_default_instance_;
        }
        v81 = +[MLParameterDescription parameterDescriptionForKey:v77 doubleParameterSpec:v80];
        [v7 addObject:v81];
      }
    }
    else
    {
      CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v75);
    }
    v70 = +[MLParameterKey eps];
    [v6 addObject:v70];
  }

LABEL_111:
  +[MLParameterUtils appendParameterDescriptions:v7 toModelDescription:v5];
  v82 = [v5 parameterDescriptionsByKey];
  v83 = +[MLParameterContainer parameterContainerFor:v6 descriptions:v82];

  CoreML::Specification::Optimizer::~Optimizer((CoreML::Specification::Optimizer *)v85);

  return v83;
}

+ (BOOL)loadUpdateParameters:(void *)a3 fromCompiledArchive:(void *)a4 error:(id *)a5
{
  std::string::basic_string[abi:ne180100]<0>(&v33, "updateParameters");
  char hasNestedArchive = IArchive::hasNestedArchive(a4, &v33);
  char v9 = hasNestedArchive;
  if (SHIBYTE(v35) < 0)
  {
    operator delete(v33);
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    if (!a5) {
      return 0;
    }
    +[MLModelErrorUtils updateErrorWithFormat:@"Failed to unarchive update parameters. Model should be re-compiled."];
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    return v15;
  }
  if ((hasNestedArchive & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  std::string::basic_string[abi:ne180100]<0>(v17, "NetworkUpdateParameters");
  std::string::basic_string[abi:ne180100]<0>(&v33, "updateParameters");
  uint64_t v10 = IArchive::nestedArchive(a4, (uint64_t)&v33);
  if (SHIBYTE(v35) < 0) {
    operator delete(v33);
  }
  v11 = IArchive::nestedArchive(v10, (uint64_t)v17);
  uint64_t v12 = (*(uint64_t (**)(void))(**(void **)(*(void *)v11 + 32) + 16))(*(void *)(*(void *)v11 + 32));
  v33 = &unk_1EF0DB2F8;
  v34 = &unk_1EF0DB2C8;
  uint64_t v35 = v12;
  v36[0] = &unk_1EF0DB3A8;
  v36[1] = &v34;
  __int16 v37 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v41 = 0;
  int v40 = 0x2000;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  v25 = &v33;
  *(void *)v26 = 0;
  *(void *)((char *)&v26[1] + 2) = 0;
  uint64_t v27 = 0x7FFFFFFFLL;
  uint64_t v28 = 0x647FFFFFFFLL;
  int v29 = 100;
  char v30 = 1;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v23);
  LODWORD(v28) = 0x7FFFFFFF;
  uint64_t v13 = v24 + SHIDWORD(v27);
  uint64_t v24 = v13;
  int v14 = v26[0] - v27;
  if (v26[0] <= (int)v27) {
    int v14 = 0;
  }
  else {
    uint64_t v24 = v13 - v14;
  }
  HIDWORD(v27) = v14;
  if (google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)a3, (google::protobuf::io::CodedInputStream *)&v23))
  {
    CoreML::Result::Result((CoreML::Result *)v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v19[0] = 5;
    std::operator+<char>();
    if (v22 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v23);
  v33 = &unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v36);
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  BOOL v15 = (v19[0] & 0xFFFFFFEF) == 0;
  if (a5 && (v19[0] & 0xFFFFFFEF) != 0)
  {
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"Failed to unarchive update parameters."];
  }
  if (v20 < 0) {
    operator delete((void *)v19[1]);
  }
  return v15;
}

@end