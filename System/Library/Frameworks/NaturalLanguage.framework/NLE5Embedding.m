@interface NLE5Embedding
+ (BOOL)compileEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5;
+ (BOOL)isCompiledEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5 error:(id *)a6;
+ (id)embeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5;
+ (id)logCategory;
- (BOOL)_loadFunction:(const char *)a3;
- (BOOL)isAdapterLoaded:(id)a3;
- (BOOL)isBackboneLoaded;
- (BOOL)loadAdapter:(id)a3;
- (BOOL)loadBackbone;
- (NLE5Embedding)initWithProgramLibrary:()unique_ptr<E5RT:(std:(void *)a4 :default_delete<E5RT::ProgramLibrary>>)a3 :ProgramLibrary andSubwordVocab:;
- (NSArray)adapters;
- (id).cxx_construct;
- (id)_tokenIDsForText:(id)a3 addBOS:(BOOL)a4;
- (id)embeddingDataForString:(id)a3 sequenceSize:(unint64_t *)a4 error:(id *)a5;
- (id)embeddingDataForTokenizedBatch:(id)a3 withOutputProperties:(id)a4;
- (id)textForTokenIDs:(id)a3;
- (id)tokenIDsForText:(id)a3;
- (unint64_t)dimension;
- (unint64_t)maximumSequenceLength;
- (void)_setInputFragments:(int *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)setAdapters:(id)a3;
@end

@implementation NLE5Embedding

- (NLE5Embedding)initWithProgramLibrary:()unique_ptr<E5RT:(std:(void *)a4 :default_delete<E5RT::ProgramLibrary>>)a3 :ProgramLibrary andSubwordVocab:
{
  v13.receiver = self;
  v13.super_class = (Class)NLE5Embedding;
  v6 = [(NLE5Embedding *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_numInputs = 3;
    v6->_subwordVocabRef = a4;
    v8 = *(ProgramLibrary **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    value = v6->_programLibrary.__ptr_.__value_;
    v7->_programLibrary.__ptr_.__value_ = v8;
    if (value) {
      (*(void (**)(ProgramLibrary *))(*(void *)value + 8))(value);
    }
    adapters = v7->_adapters;
    v7->_adapters = (NSArray *)MEMORY[0x1E4F1CBF0];

    loadedFunction = v7->_loadedFunction;
    v7->_loadedFunction = 0;
  }
  return v7;
}

- (void)dealloc
{
  subwordVocabRef = self->_subwordVocabRef;
  if (subwordVocabRef) {
    CFRelease(subwordVocabRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLE5Embedding;
  [(NLE5Embedding *)&v4 dealloc];
}

+ (id)embeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5
{
  BOOL v6 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [v8 pathExtension];
    char v11 = [v10 isEqualToString:@"mil"];

    if (v11)
    {
      v12 = [v8 stringByDeletingLastPathComponent];
      objc_super v13 = [v12 stringByAppendingPathComponent:@"sp.dat"];

      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v15 = [v14 fileExistsAtPath:v13 isDirectory:0];

      if (v15)
      {
        uint64_t v16 = NLEmbeddingSubwordVocabCreate();
        if (v16)
        {
          v17 = [MEMORY[0x1E4F1C9C8] now];
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
          compileModel((uint64_t)__p, v6, v9);
          if (v49 < 0) {
            operator delete(*(void **)__p);
          }
          v18 = [MEMORY[0x1E4F1C9C8] now];
          [v18 timeIntervalSinceDate:v17];
          double v20 = v19;

          v21 = (void *)MEMORY[0x1AD0BB930]();
          v22 = NLGetLogCategory(a1);
          v23 = [v22 internal];

          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = NLGetLogIdentifier(a1);
            v25 = [NSString stringWithFormat:@"%.2f ms spent on compilation", v20 * 1000.0];
            *(_DWORD *)__p = 138543618;
            *(void *)&__p[4] = v24;
            __int16 v47 = 2114;
            v48 = v25;
            _os_log_impl(&dword_1A6419000, v23, OS_LOG_TYPE_INFO, "%{public}@%{public}@", __p, 0x16u);
          }
          uint64_t v44 = v45;
          uint64_t v45 = 0;
          v26 = [[NLE5Embedding alloc] initWithProgramLibrary:&v44 andSubwordVocab:v16];
          uint64_t v27 = v44;
          uint64_t v44 = 0;
          if (v27) {
            (*(void (**)(uint64_t))(*(void *)v27 + 8))(v27);
          }
          if ([v9 count])
          {
            v28 = (void *)[v9 copy];
            [(NLE5Embedding *)v26 setAdapters:v28];
          }
          uint64_t v29 = v45;
          uint64_t v45 = 0;
          if (v29) {
            (*(void (**)(uint64_t))(*(void *)v29 + 8))(v29);
          }

          goto LABEL_25;
        }
        v35 = (void *)MEMORY[0x1AD0BB930]();
        v40 = NLGetLogCategory(0);
        v37 = [v40 internal];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v41 = NLGetLogIdentifier(0);
          v42 = [NSString stringWithFormat:@"Failed to load sentence piece model for embedding from: %@", v13];
          *(_DWORD *)__p = 138543618;
          *(void *)&__p[4] = v41;
          __int16 v47 = 2114;
          v48 = v42;
          _os_log_impl(&dword_1A6419000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x1AD0BB930]();
        v36 = NLGetLogCategory(0);
        v37 = [v36 internal];

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = NLGetLogIdentifier(0);
          v39 = [NSString stringWithFormat:@"Missing sentence piece model for embedding at: %@", v13];
          *(_DWORD *)__p = 138543618;
          *(void *)&__p[4] = v38;
          __int16 v47 = 2114;
          v48 = v39;
          _os_log_impl(&dword_1A6419000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);
        }
      }

      v26 = 0;
LABEL_25:

      goto LABEL_26;
    }
  }
  v30 = (void *)MEMORY[0x1AD0BB930]();
  v31 = NLGetLogCategory(0);
  v32 = [v31 internal];

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = NLGetLogIdentifier(0);
    v34 = [NSString stringWithFormat:@"Invalid path for MIL model: %@", v8];
    *(_DWORD *)__p = 138543618;
    *(void *)&__p[4] = v33;
    __int16 v47 = 2114;
    v48 = v34;
    _os_log_impl(&dword_1A6419000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", __p, 0x16u);
  }
  v26 = 0;
LABEL_26:

  return v26;
}

+ (BOOL)isCompiledEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  MEMORY[0x1AD0BB2B0](v22);
  std::string::basic_string[abi:ne180100]<0>(__p, "/private/var/db/com.apple.naturallanguaged");
  E5RT::E5CompilerConfigOptions::SetBundleCacheLocation();
  if (v26 < 0) {
    operator delete(*(void **)__p);
  }
  E5RT::E5Compiler::MakeCompiler();
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  createE5CompilerOptions(v7, v9);
  if (v26 < 0) {
    operator delete(*(void **)__p);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
  int IsNewCompileRequired = E5RT::E5Compiler::IsNewCompileRequired();
  if (v26 < 0) {
    operator delete(*(void **)__p);
  }
  v12 = (void *)MEMORY[0x1AD0BB930]();
  char v13 = IsNewCompileRequired ^ 1;
  v14 = NLGetLogCategory(0);
  char v15 = [v14 internal];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = NLGetLogIdentifier(0);
    v17 = "no";
    if (IsNewCompileRequired) {
      v17 = "yes";
    }
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"Is new compile required: %s", v17);
    *(_DWORD *)__p = 138543618;
    *(void *)&__p[4] = v16;
    __int16 v24 = 2114;
    v25 = v18;
    _os_log_impl(&dword_1A6419000, v15, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@", __p, 0x16u);
  }
  if (v20) {
    (*(void (**)())(*(void *)v20 + 8))();
  }
  if (v21) {
    (*(void (**)())(*(void *)v21 + 8))();
  }
  MEMORY[0x1AD0BB2C0](v22);

  return v13;
}

+ (BOOL)compileEmbeddingModelWithModelPath:(id)a3 useANE:(BOOL)a4 adapters:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1AD0BB930]();
  id v10 = NLGetLogCategory(0);
  char v11 = [v10 internal];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    NLGetLogIdentifier(0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    char v13 = NSString;
    v14 = [v8 componentsJoinedByString:@" / "];
    char v15 = [v13 stringWithFormat:@"Compiling '%@' with adapters: %@", v7, v14];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v12;
    __int16 v20 = 2114;
    uint64_t v21 = v15;
    _os_log_impl(&dword_1A6419000, v11, OS_LOG_TYPE_DEBUG, "%{public}@%{public}@", buf, 0x16u);
  }
  id v16 = v7;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v16 UTF8String]);
  compileModel((uint64_t)buf, v6, v8);
  if (v18) {
    (*(void (**)())(*(void *)v18 + 8))();
  }
  if (v22 < 0) {
    operator delete(*(void **)buf);
  }

  return 1;
}

- (BOOL)_loadFunction:(const char *)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t ExportedFunctions = E5RT::ProgramLibrary::GetExportedFunctions((E5RT::ProgramLibrary *)self->_programLibrary.__ptr_.__value_);
  std::unordered_map<std::string,std::shared_ptr<E5RT::ProgramFunction>>::unordered_map((uint64_t)v85, ExportedFunctions);
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)a3);
  BOOL v6 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(v85, buf);
  id v7 = v6;
  if ((v89 & 0x80000000) == 0)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_69:
    v48 = (void *)MEMORY[0x1AD0BB930]();
    char v49 = NLGetLogCategory(self);
    uint64_t v50 = [v49 internal];

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = NLGetLogIdentifier(self);
      v52 = objc_msgSend(NSString, "stringWithFormat:", @"Loaded mil library is missing %s function", a3);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v51;
      __int16 v87 = 2114;
      v88 = v52;
      _os_log_impl(&dword_1A6419000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
    }
    BOOL v47 = 0;
    goto LABEL_95;
  }
  operator delete(*(void **)buf);
  if (!v7) {
    goto LABEL_69;
  }
LABEL_3:
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)a3);
  id v8 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(v85, buf);
  if (!v8) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v9 = (std::__shared_weak_count *)*((void *)v8 + 6);
  v83 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  E5RT::PrecompiledComputeOpCreateOptions::Create();
  if (v83) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v83);
  }
  if (v89 < 0) {
    operator delete(*(void **)buf);
  }
  id v10 = [NSString stringWithUTF8String:a3];
  loadedFunction = self->_loadedFunction;
  self->_loadedFunction = v10;

  E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp();
  std::shared_ptr<E5RT::ExecutionStreamOperation>::operator=[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>(&self->_main_esop.__ptr_, (uint64_t *)buf);
  uint64_t v12 = *(void *)buf;
  *(void *)buf = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  char v13 = *(unsigned __int8 **)(E5RT::ExecutionStreamOperation::GetInputPorts((E5RT::ExecutionStreamOperation *)self->_main_esop.__ptr_)
                            + 16);
  if (!v13)
  {
LABEL_34:
    std::string::basic_string[abi:ne180100]<0>(buf, "mlm_input");
    char v26 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(&self->_buffers.__table_.__bucket_list_.__ptr_.__value_, buf);
    uint64_t v27 = v26;
    if (v89 < 0)
    {
      operator delete(*(void **)buf);
      if (v27)
      {
LABEL_36:
        for (i = *(unsigned __int8 **)(E5RT::ExecutionStreamOperation::GetOutputPorts((E5RT::ExecutionStreamOperation *)self->_main_esop.__ptr_)
                                      + 16); i; i = *(unsigned __int8 **)i)
        {
          PortDescriptorRef = (E5RT::OperandDescriptor *)E5RT::IOPort::GetPortDescriptorRef(*((E5RT::IOPort **)i + 5));
          v30 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(PortDescriptorRef);
          E5RT::TensorDescriptor::AllocateMemory();
          std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>((uint64_t)&self->_buffers, i + 16, (long long *)i + 1, (uint64_t *)buf);
          uint64_t v31 = *(void *)buf;
          *(void *)buf = 0;
          if (v31) {
            (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
          }
          *(void *)buf = i + 16;
          v32 = (std::__shared_weak_count *)*((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_buffers, i + 16, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 6);
          v81 = v32;
          if (v32) {
            atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          E5RT::IOPort::BindMemoryObject();
          if (v81) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v81);
          }
          uint64_t v33 = i[39];
          int v34 = (char)v33;
          if ((v33 & 0x80u) != 0) {
            uint64_t v33 = *((void *)i + 3);
          }
          if (v33 == 14)
          {
            v35 = v34 >= 0 ? (uint64_t *)(i + 16) : (uint64_t *)*((void *)i + 2);
            uint64_t v36 = *v35;
            uint64_t v37 = *(uint64_t *)((char *)v35 + 6);
            if (v36 == 0x65626D655F6D6C6DLL && v37 == 0x73676E6964646562)
            {
              TensorShape = (void *)E5RT::TensorDescriptor::GetTensorShape(v30);
              if (TensorShape[1] - *TensorShape != 32)
              {
                v53 = (void *)MEMORY[0x1AD0BB930]();
                v70 = NLGetLogCategory(self);
                v55 = [v70 internal];

                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v71 = NLGetLogIdentifier(self);
                  v72 = [NSString stringWithFormat:@"Unexpected output rank"];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v71;
                  __int16 v87 = 2114;
                  v88 = v72;
                  _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
                }
                goto LABEL_92;
              }
              E5RT::TensorDescriptor::GetTensorDataTypeRef(v30);
              if ((E5RT::TensorDataType::IsType<float>() & 1) == 0)
              {
                v53 = (void *)MEMORY[0x1AD0BB930]();
                v73 = NLGetLogCategory(self);
                v55 = [v73 internal];

                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v74 = NLGetLogIdentifier(self);
                  v75 = [NSString stringWithFormat:@"Unexpected output type"];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v74;
                  __int16 v87 = 2114;
                  v88 = v75;
                  _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
                }
                goto LABEL_92;
              }
              uint64_t v40 = *TensorShape;
              self->_dimension = *(int *)(*TensorShape + 24);
              if (self->_maximumSequenceLength != *(_DWORD *)(v40 + 8))
              {
                v53 = (void *)MEMORY[0x1AD0BB930]();
                v76 = NLGetLogCategory(self);
                v55 = [v76 internal];

                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  v77 = NLGetLogIdentifier(self);
                  v78 = [NSString stringWithFormat:@"Max sequence length not matching in input/output"];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v77;
                  __int16 v87 = 2114;
                  v88 = v78;
                  _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
                }
                goto LABEL_92;
              }
            }
          }
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "mlm_embeddings");
        v41 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(&self->_buffers.__table_.__bucket_list_.__ptr_.__value_, buf);
        v42 = v41;
        if (v89 < 0)
        {
          operator delete(*(void **)buf);
          if (v42)
          {
LABEL_60:
            E5RT::ExecutionStream::CreateExecutionStream((uint64_t *)buf, (E5RT::ExecutionStream *)v41);
            v43 = *(ExecutionStream **)buf;
            *(void *)buf = 0;
            value = self->_stream.__ptr_.__value_;
            self->_stream.__ptr_.__value_ = v43;
            if (value)
            {
              (*(void (**)(ExecutionStream *))(*(void *)value + 8))(value);
              uint64_t v45 = *(void *)buf;
              *(void *)buf = 0;
              if (v45) {
                (*(void (**)(uint64_t))(*(void *)v45 + 8))(v45);
              }
            }
            cntrl = self->_main_esop.__cntrl_;
            v80 = (std::__shared_weak_count *)cntrl;
            if (cntrl) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
            }
            E5RT::ExecutionStream::EncodeOperation();
            if (v80) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v80);
            }
            BOOL v47 = 1;
            goto LABEL_93;
          }
        }
        else if (v41)
        {
          goto LABEL_60;
        }
        v53 = (void *)MEMORY[0x1AD0BB930]();
        v58 = NLGetLogCategory(self);
        v55 = [v58 internal];

        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v59 = NLGetLogIdentifier(self);
          v60 = objc_msgSend(NSString, "stringWithFormat:", @"%s output is missing", "mlm_embeddings");
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v59;
          __int16 v87 = 2114;
          v88 = v60;
          _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
        }
        goto LABEL_92;
      }
    }
    else if (v26)
    {
      goto LABEL_36;
    }
    v53 = (void *)MEMORY[0x1AD0BB930]();
    v54 = NLGetLogCategory(self);
    v55 = [v54 internal];

    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = NLGetLogIdentifier(self);
      v57 = objc_msgSend(NSString, "stringWithFormat:", @"%s input is missing", "mlm_input");
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v56;
      __int16 v87 = 2114;
      v88 = v57;
      _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
    }
    goto LABEL_92;
  }
  while (1)
  {
    v14 = (E5RT::OperandDescriptor *)E5RT::IOPort::GetPortDescriptorRef(*((E5RT::IOPort **)v13 + 5));
    char v15 = (E5RT::TensorDescriptor *)E5RT::OperandDescriptor::TensorDescriptor(v14);
    E5RT::TensorDescriptor::AllocateMemory();
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>((uint64_t)&self->_buffers, v13 + 16, (long long *)v13 + 1, (uint64_t *)buf);
    uint64_t v16 = *(void *)buf;
    *(void *)buf = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
    *(void *)buf = v13 + 16;
    v17 = (std::__shared_weak_count *)*((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_buffers, v13 + 16, (uint64_t)&std::piecewise_construct, (long long **)buf)+ 6);
    v82 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    E5RT::IOPort::BindMemoryObject();
    if (v82) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v82);
    }
    uint64_t v18 = v13[39];
    int v19 = (char)v18;
    if ((v18 & 0x80u) != 0) {
      uint64_t v18 = *((void *)v13 + 3);
    }
    if (v18 != 9) {
      goto LABEL_33;
    }
    uint64_t v20 = v19 >= 0 ? (uint64_t)(v13 + 16) : *((void *)v13 + 2);
    uint64_t v21 = *(void *)v20;
    int v22 = *(unsigned __int8 *)(v20 + 8);
    if (v21 != 0x75706E695F6D6C6DLL || v22 != 116) {
      goto LABEL_33;
    }
    __int16 v24 = (void *)E5RT::TensorDescriptor::GetTensorShape(v15);
    if (v24[1] - *v24 != 32) {
      break;
    }
    E5RT::TensorDescriptor::GetTensorDataTypeRef(v15);
    if ((E5RT::TensorDataType::IsType<int>() & 1) == 0)
    {
      v53 = (void *)MEMORY[0x1AD0BB930]();
      v64 = NLGetLogCategory(self);
      v55 = [v64 internal];

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v65 = NLGetLogIdentifier(self);
        v66 = [NSString stringWithFormat:@"Unexpected input type"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v65;
        __int16 v87 = 2114;
        v88 = v66;
        _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      goto LABEL_92;
    }
    uint64_t v25 = *v24;
    self->_maximumSequenceLength = *(int *)(*v24 + 8);
    if (self->_numInputs != *(_DWORD *)(v25 + 24))
    {
      v53 = (void *)MEMORY[0x1AD0BB930]();
      v67 = NLGetLogCategory(self);
      v55 = [v67 internal];

      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v68 = NLGetLogIdentifier(self);
        v69 = [NSString stringWithFormat:@"Unexpected input tensor shape"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v68;
        __int16 v87 = 2114;
        v88 = v69;
        _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      goto LABEL_92;
    }
LABEL_33:
    char v13 = *(unsigned __int8 **)v13;
    if (!v13) {
      goto LABEL_34;
    }
  }
  v53 = (void *)MEMORY[0x1AD0BB930]();
  v61 = NLGetLogCategory(self);
  v55 = [v61 internal];

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v62 = NLGetLogIdentifier(self);
    v63 = [NSString stringWithFormat:@"Unexpected input rank"];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v62;
    __int16 v87 = 2114;
    v88 = v63;
    _os_log_impl(&dword_1A6419000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
  }
LABEL_92:

  BOOL v47 = 0;
LABEL_93:
  if (v84) {
    (*(void (**)())(*(void *)v84 + 8))();
  }
LABEL_95:
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)v85);
  return v47;
}

- (void)_setInputFragments:(int *)a3 count:(unint64_t)a4
{
  p_buffers = &self->_buffers;
  std::string::basic_string[abi:ne180100]<0>(__p, "mlm_input");
  v17 = __p;
  id v8 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_buffers, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v17);
  uint64_t DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v8 + 5));
  size_t v11 = v10 & 0xFFFFFFFFFFFFFFFCLL;
  if (v10 >= 4) {
    uint64_t v12 = (void *)DataSpan;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  bzero(v12, v11);
  unint64_t maximumSequenceLength = self->_maximumSequenceLength;
  if (maximumSequenceLength >= a4) {
    unint64_t maximumSequenceLength = a4;
  }
  if (maximumSequenceLength)
  {
    for (uint64_t i = 0; i != maximumSequenceLength; ++i)
    {
      *((_DWORD *)v12 + self->_numInputs * (int)i) = a3[i];
      *((_DWORD *)v12 + self->_numInputs * (int)i + 1) = i;
      *((_DWORD *)v12 + self->_numInputs * (int)i + 2) = 0;
    }
  }
}

- (BOOL)isBackboneLoaded
{
  if (!self->_stream.__ptr_.__value_) {
    return 0;
  }
  loadedFunction = self->_loadedFunction;
  v3 = [NSString stringWithUTF8String:"main"];
  BOOL v4 = [(NSString *)loadedFunction isEqualToString:v3];

  return v4;
}

- (BOOL)loadBackbone
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NLE5Embedding *)self isBackboneLoaded]) {
    return 1;
  }
  BOOL v4 = (void *)MEMORY[0x1AD0BB930]();
  v5 = NLGetLogCategory(self);
  BOOL v6 = [v5 internal];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = NLGetLogIdentifier(self);
    id v8 = [NSString stringWithFormat:@"Loading backbone"];
    *(_DWORD *)buf = 138543618;
    int v22 = v7;
    __int16 v23 = 2114;
    __int16 v24 = v8;
    _os_log_impl(&dword_1A6419000, v6, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
  }
  value = self->_stream.__ptr_.__value_;
  if (value)
  {
    E5RT::ExecutionStream::ResetStream((E5RT::ExecutionStream *)value);
    unint64_t v10 = self->_stream.__ptr_.__value_;
    self->_stream.__ptr_.__value_ = 0;
    if (v10) {
      (*(void (**)(ExecutionStream *))(*(void *)v10 + 8))(v10);
    }
  }
  size_t v11 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v3 = [(NLE5Embedding *)self _loadFunction:"main"];
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v11];
  double v14 = v13;

  char v15 = (void *)MEMORY[0x1AD0BB930]();
  char v16 = NLGetLogCategory(self);
  v17 = [v16 internal];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = NLGetLogIdentifier(self);
    int v19 = [NSString stringWithFormat:@"%.2f ms spent creating Execution Stream and allocating buffers", v14 * 1000.0];
    *(_DWORD *)buf = 138543618;
    int v22 = v18;
    __int16 v23 = 2114;
    __int16 v24 = v19;
    _os_log_impl(&dword_1A6419000, v17, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
  }

  return v3;
}

- (BOOL)isAdapterLoaded:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_stream.__ptr_.__value_ && [(NSString *)self->_loadedFunction isEqualToString:v4];

  return v5;
}

- (BOOL)loadAdapter:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NLE5Embedding *)self isAdapterLoaded:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = [(NLE5Embedding *)self adapters];
    char v7 = [v6 containsObject:v4];

    id v8 = (void *)MEMORY[0x1AD0BB930]();
    if (v7)
    {
      id v9 = NLGetLogCategory(self);
      unint64_t v10 = [v9 internal];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        size_t v11 = NLGetLogIdentifier(self);
        uint64_t v12 = [NSString stringWithFormat:@"Loading adapter '%@'", v4];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v11;
        __int16 v32 = 2114;
        uint64_t v33 = v12;
        _os_log_impl(&dword_1A6419000, v10, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
      }
      value = self->_stream.__ptr_.__value_;
      if (value)
      {
        E5RT::ExecutionStream::ResetStream((E5RT::ExecutionStream *)value);
        double v14 = self->_stream.__ptr_.__value_;
        self->_stream.__ptr_.__value_ = 0;
        if (v14) {
          (*(void (**)(ExecutionStream *))(*(void *)v14 + 8))(v14);
        }
        loadedFunction = self->_loadedFunction;
        self->_loadedFunction = 0;
      }
      char v16 = [MEMORY[0x1E4F1C9C8] now];
      BOOL v5 = -[NLE5Embedding _loadFunction:](self, "_loadFunction:", [v4 UTF8String]);
      v17 = [MEMORY[0x1E4F1C9C8] now];
      [v17 timeIntervalSinceDate:v16];
      double v19 = v18;

      uint64_t v20 = (void *)MEMORY[0x1AD0BB930]();
      uint64_t v21 = NLGetLogCategory(self);
      int v22 = [v21 internal];

      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = NLGetLogIdentifier(self);
        __int16 v24 = [NSString stringWithFormat:@"%.2f ms spent creating Execution Stream and allocating buffers", v19 * 1000.0];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v23;
        __int16 v32 = 2114;
        uint64_t v33 = v24;
        _os_log_impl(&dword_1A6419000, v22, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v25 = NLGetLogCategory(self);
      char v26 = [v25 internal];

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = NLGetLogIdentifier(self);
        v28 = [NSString stringWithFormat:@"E5 bundle is missing requested adapter '%@'", v4];
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = v27;
        __int16 v32 = 2114;
        uint64_t v33 = v28;
        _os_log_impl(&dword_1A6419000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)embeddingDataForTokenizedBatch:(id)a3 withOutputProperties:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v6 = a4;
  id v58 = v6;
  if (self->_stream.__ptr_.__value_)
  {
    id v55 = [MEMORY[0x1E4F1CA58] data];
    v54 = [MEMORY[0x1E4F1CA48] array];
    v53 = [MEMORY[0x1E4F1CA48] array];
    for (unint64_t i = 0; i < [v56 count]; ++i)
    {
      char v7 = objc_msgSend(v56, "objectAtIndex:");
      id v8 = [MEMORY[0x1E4F1CA48] array];
      memset(&__p, 0, sizeof(__p));
      id v9 = [(NLE5Embedding *)self _tokenIDsForText:&stru_1EFB303D0 addBOS:1];
      unint64_t v10 = [v9 firstObject];
      int v11 = [v10 intValue];

      std::vector<int>::pointer end = __p.__end_;
      if (__p.__end_ >= __p.__end_cap_.__value_)
      {
        std::vector<int>::pointer begin = __p.__begin_;
        int64_t v15 = __p.__end_ - __p.__begin_;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 62) {
          std::vector<double>::__throw_length_error[abi:ne180100]();
        }
        int64_t v17 = (char *)__p.__end_cap_.__value_ - (char *)__p.__begin_;
        if (((char *)__p.__end_cap_.__value_ - (char *)__p.__begin_) >> 1 > v16) {
          unint64_t v16 = v17 >> 1;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          double v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&__p.__end_cap_, v18);
          std::vector<int>::pointer begin = __p.__begin_;
          std::vector<int>::pointer end = __p.__end_;
        }
        else
        {
          double v19 = 0;
        }
        uint64_t v20 = (int *)&v19[4 * v15];
        *uint64_t v20 = v11;
        double v13 = v20 + 1;
        while (end != begin)
        {
          int v21 = *--end;
          *--uint64_t v20 = v21;
        }
        __p.__begin_ = v20;
        __p.__end_ = v13;
        __p.__end_cap_.__value_ = (int *)&v19[4 * v18];
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        *__p.__end_ = v11;
        double v13 = end + 1;
      }
      unint64_t v22 = 0;
      __p.__end_ = v13;
      while ([v7 count] > v22)
      {
        __int16 v23 = [v7 objectAtIndex:v22];
        id v24 = [(NLE5Embedding *)self _tokenIDsForText:v23 addBOS:0];
        uint64_t v25 = v24;
        if (v24) {
          CFRetain(v24);
        }
        applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v25);

        if (!cf)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1AD0BB430](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
        }
        applesauce::CF::convert_to<std::vector<int>,0>(cf, &buf);
        std::vector<int>::pointer v27 = __p.__begin_;
        std::vector<int>::pointer v26 = __p.__end_;
        std::vector<int>::pointer v29 = buf.__begin_;
        std::vector<int>::pointer v28 = buf.__end_;
        unint64_t v30 = [(NLE5Embedding *)self maximumSequenceLength];
        unint64_t v31 = v28 - v29 + v26 - v27;
        id v6 = v58;
        if (v31 <= v30)
        {
          __int16 v32 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", __p.__end_ - __p.__begin_, buf.__end_ - buf.__begin_);
          [v8 addObject:v32];

          std::vector<int>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(&__p, (uint64_t)__p.__end_, (char *)buf.__begin_, (char *)buf.__end_, buf.__end_ - buf.__begin_);
        }
        if (buf.__begin_)
        {
          buf.__end_ = buf.__begin_;
          operator delete(buf.__begin_);
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v31 > v30) {
          break;
        }
        ++v22;
      }
      while ([v7 count] > v22)
      {
        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
        [v8 addObject:v33];

        ++v22;
      }
      -[NLE5Embedding _setInputFragments:count:](self, "_setInputFragments:count:");
      uint64_t v34 = [MEMORY[0x1E4F1C9C8] now];
      E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
      v35 = [MEMORY[0x1E4F1C9C8] now];
      [v35 timeIntervalSinceDate:v34];
      double v37 = v36;

      v38 = (void *)MEMORY[0x1AD0BB930]();
      v39 = NLGetLogCategory(self);
      uint64_t v40 = [v39 internal];

      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        NLGetLogIdentifier(self);
        v41 = (int *)(id)objc_claimAutoreleasedReturnValue();
        v42 = [NSString stringWithFormat:@"%.2f ms spent running inference", v37 * 1000.0];
        LODWORD(buf.__begin_) = 138543618;
        *(std::vector<int>::pointer *)((char *)&buf.__begin_ + 4) = v41;
        WORD2(buf.__end_) = 2114;
        *(std::vector<int>::pointer *)((char *)&buf.__end_ + 6) = v42;
        _os_log_impl(&dword_1A6419000, v40, OS_LOG_TYPE_INFO, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);
      }
      std::string::basic_string[abi:ne180100]<0>(&buf, "mlm_embeddings");
      CFTypeRef cf = &buf;
      v43 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_buffers, (unsigned __int8 *)&buf, (uint64_t)&std::piecewise_construct, (long long **)&cf);
      uint64_t DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v43 + 5));
      [v55 appendBytes:DataSpan length:4 * self->_dimension * ((unint64_t)((char *)__p.__end_ - (char *)__p.__begin_) >> 2)];
      if (SHIBYTE(buf.__end_cap_.__value_) < 0) {
        operator delete(buf.__begin_);
      }
      [v54 addObject:v8];
      uint64_t v45 = [NSNumber numberWithUnsignedLong:__p.__end_ - __p.__begin_];
      [v53 addObject:v45];

      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
    }
    [v6 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F5C8E8]];
    [v6 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F5C8F0]];
  }
  else
  {
    v46 = (void *)MEMORY[0x1AD0BB930]();
    BOOL v47 = NLGetLogCategory(self);
    v48 = [v47 internal];

    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      char v49 = (int *)objc_claimAutoreleasedReturnValue();
      uint64_t v50 = [NSString stringWithFormat:@"Execution stream hasn't been created"];
      LODWORD(__p.__begin_) = 138543618;
      *(std::vector<int>::pointer *)((char *)&__p.__begin_ + 4) = v49;
      WORD2(__p.__end_) = 2114;
      *(std::vector<int>::pointer *)((char *)&__p.__end_ + 6) = v50;
      _os_log_impl(&dword_1A6419000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&__p, 0x16u);
    }
    id v55 = 0;
  }

  return v55;
}

- (id)embeddingDataForString:(id)a3 sequenceSize:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_stream.__ptr_.__value_)
  {
    id v9 = [(NLE5Embedding *)self _tokenIDsForText:v8 addBOS:1];
    unint64_t v10 = v9;
    if (v9) {
      CFRetain(v9);
    }
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v10);

    if (!cf)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0BB430](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    applesauce::CF::convert_to<std::vector<int>,0>(cf, &v48);
    std::vector<int>::pointer begin = v48.__begin_;
    std::vector<int>::pointer end = v48.__end_;
    if ([(NLE5Embedding *)self maximumSequenceLength] < end - begin)
    {
      double v13 = (void *)MEMORY[0x1AD0BB930]();
      double v14 = NLGetLogCategory(self);
      int64_t v15 = [v14 internal];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v16 = NLGetLogIdentifier(self);
        int64_t v17 = [NSString stringWithFormat:@"Input string length exceeds max sequence length supported by the model"];
        *(_DWORD *)std::vector<int> buf = 138543618;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v43 = 2114;
        uint64_t v44 = v17;
        _os_log_impl(&dword_1A6419000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", buf, 0x16u);
      }
      if (a5)
      {
        unint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        BOOL v47 = @"Input trimmed up to max sequence length";
        double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a5 = [v18 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v19];
      }
      std::vector<int>::resize(&v48, [(NLE5Embedding *)self maximumSequenceLength]);
    }
    -[NLE5Embedding _setInputFragments:count:](self, "_setInputFragments:count:");
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    E5RT::ExecutionStream::ExecuteStreamSync((E5RT::ExecutionStream *)self->_stream.__ptr_.__value_);
    int v21 = [MEMORY[0x1E4F1C9C8] now];
    [v21 timeIntervalSinceDate:v20];
    double v23 = v22;

    id v24 = (void *)MEMORY[0x1AD0BB930]();
    uint64_t v25 = NLGetLogCategory(self);
    std::vector<int>::pointer v26 = [v25 internal];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      std::vector<int>::pointer v27 = NLGetLogIdentifier(self);
      std::vector<int>::pointer v28 = [NSString stringWithFormat:@"%.2f ms spent running inference", v23 * 1000.0];
      *(_DWORD *)std::vector<int> buf = 138543618;
      *(void *)&uint8_t buf[4] = v27;
      __int16 v43 = 2114;
      uint64_t v44 = v28;
      _os_log_impl(&dword_1A6419000, v26, OS_LOG_TYPE_INFO, "%{public}@%{public}@", buf, 0x16u);
    }
    std::vector<int>::pointer v29 = (void *)MEMORY[0x1E4F1C9B8];
    std::string::basic_string[abi:ne180100]<0>(buf, "mlm_embeddings");
    v41 = (long long *)buf;
    unint64_t v30 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_buffers, buf, (uint64_t)&std::piecewise_construct, &v41);
    uint64_t DataSpan = E5RT::BufferObject::GetDataSpan(*((E5RT::BufferObject **)v30 + 5));
    __int16 v32 = [v29 dataWithBytes:DataSpan length:4 * self->_dimension * ((unint64_t)((char *)v48.__end_ - (char *)v48.__begin_) >> 2)];
    if (v45 < 0) {
      operator delete(*(void **)buf);
    }
    if (a4) {
      *a4 = v48.__end_ - v48.__begin_;
    }

    if (v48.__begin_)
    {
      v48.__end_ = v48.__begin_;
      operator delete(v48.__begin_);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v33 = (void *)MEMORY[0x1AD0BB930]();
    uint64_t v34 = NLGetLogCategory(self);
    v35 = [v34 internal];

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      NLGetLogIdentifier(self);
      double v36 = (int *)objc_claimAutoreleasedReturnValue();
      double v37 = [NSString stringWithFormat:@"Execution stream hasn't been created"];
      LODWORD(v48.__begin_) = 138543618;
      *(std::vector<int>::pointer *)((char *)&v48.__begin_ + 4) = v36;
      WORD2(v48.__end_) = 2114;
      *(std::vector<int>::pointer *)((char *)&v48.__end_ + 6) = v37;
      _os_log_impl(&dword_1A6419000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v48, 0x16u);
    }
    __int16 v32 = 0;
  }

  return v32;
}

- (id)textForTokenIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_subwordVocabRef)
  {
    BOOL v5 = (__CFString *)NLEmbeddingSubwordVocabCopyTextForTokenIds();
  }
  else
  {
    id v6 = (void *)MEMORY[0x1AD0BB930]();
    char v7 = NLGetLogCategory(self);
    id v8 = [v7 internal];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NLGetLogIdentifier(self);
      unint64_t v10 = [NSString stringWithFormat:@"Sentence piece tokenizer is not set"];
      int v12 = 138543618;
      double v13 = v9;
      __int16 v14 = 2114;
      int64_t v15 = v10;
      _os_log_impl(&dword_1A6419000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v5 = &stru_1EFB303D0;
  }

  return v5;
}

- (id)tokenIDsForText:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_subwordVocabRef)
  {
    BOOL v5 = [(NLE5Embedding *)self _tokenIDsForText:v4 addBOS:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1AD0BB930]();
    char v7 = NLGetLogCategory(self);
    id v8 = [v7 internal];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NLGetLogIdentifier(self);
      unint64_t v10 = [NSString stringWithFormat:@"Sentence piece tokenizer is not set"];
      int v12 = 138543618;
      double v13 = v9;
      __int16 v14 = 2114;
      int64_t v15 = v10;
      _os_log_impl(&dword_1A6419000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&v12, 0x16u);
    }
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)_tokenIDsForText:(id)a3 addBOS:(BOOL)a4
{
  id v4 = (void *)NLEmbeddingSubwordVocabCopyTokenIdsForText();

  return v4;
}

+ (id)logCategory
{
  return +[NLLogCategory categoryWithName:@"NLE5Embedding"];
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- (unint64_t)maximumSequenceLength
{
  return self->_maximumSequenceLength;
}

- (NSArray)adapters
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAdapters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adapters, 0);
  objc_storeStrong((id *)&self->_loadedFunction, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)&self->_buffers);
  cntrl = self->_main_esop.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  value = self->_stream.__ptr_.__value_;
  self->_stream.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ExecutionStream *))(*(void *)value + 8))(value);
  }
  BOOL v5 = self->_programLibrary.__ptr_.__value_;
  self->_programLibrary.__ptr_.__value_ = 0;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

+ (uint64_t)embeddingModelWithModelPath:useANE:adapters:.cold.1()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)_loadFunction:.cold.1()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

- (uint64_t)_loadFunction:.cold.3()
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

@end