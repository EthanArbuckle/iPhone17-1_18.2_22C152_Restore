@interface MPSGraphCaptureContext
- (MPSGraphCaptureContext)initWithOutputFolderPath:(id)a3 graphName:(id)a4;
- (id)addFunctionWithBitCode:(id)a3 metalFunctionName:(id)a4 reflection:(id)a5;
- (id)constantBufferName:(id)a3;
- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4;
- (id)functionNameForPipeline:(id)a3;
- (id)reflectionForPipeline:(id)a3;
- (id)wrapComputeEncoder:(id)a3;
- (void)addPipeline:(id)a3 functionName:(id)a4 withReflection:(id)a5;
- (void)createNodeWithDispatchInfo:(id)a3 encoderContext:(void *)a4;
- (void)dealloc;
- (void)setConstantBuffer:(id)a3;
- (void)setFeeds:(id)a3 names:(id)a4;
- (void)setInputBuffers:(id)a3 names:(id)a4;
- (void)setOutputBuffers:(id)a3 names:(id)a4;
- (void)setResults:(id)a3 names:(id)a4;
- (void)writeToJsonFile:(__sFILE *)a3;
- (void)writejsonFile:(id)a3;
@end

@implementation MPSGraphCaptureContext

- (MPSGraphCaptureContext)initWithOutputFolderPath:(id)a3 graphName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MPSGraphCaptureContext;
  v8 = [(MPSGraphCaptureContext *)&v26 init];
  MEMORY[0x1852FE5D0]();
  uint64_t v9 = objc_opt_new();
  nodes = v8->_nodes;
  v8->_nodes = (NSMutableArray *)v9;

  uint64_t v11 = objc_opt_new();
  links = v8->_links;
  v8->_links = (NSMutableArray *)v11;

  uint64_t v13 = objc_opt_new();
  functions = v8->_functions;
  v8->_functions = (NSMutableArray *)v13;

  uint64_t v15 = objc_opt_new();
  data = v8->_data;
  v8->_data = (NSMutableArray *)v15;

  uint64_t v17 = objc_opt_new();
  portLinks = v8->_portLinks;
  v8->_portLinks = (NSMutableArray *)v17;

  uint64_t v19 = objc_opt_new();
  pipelineReflectionDictionary = v8->_pipelineReflectionDictionary;
  v8->_pipelineReflectionDictionary = (NSMutableDictionary *)v19;

  uint64_t v21 = objc_opt_new();
  pipelineFunctionNameDictionary = v8->_pipelineFunctionNameDictionary;
  v8->_pipelineFunctionNameDictionary = (NSMutableDictionary *)v21;

  uint64_t v23 = objc_opt_new();
  constantBuffers = v8->_constantBuffers;
  v8->_constantBuffers = (NSMutableDictionary *)v23;

  operator new();
}

- (void)dealloc
{
  context = (void **)self->_context;
  if (context)
  {
    v4 = context[7];
    if (v4)
    {
      do
      {
        v5 = (void *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    id v6 = context[5];
    context[5] = 0;
    if (v6) {
      operator delete(v6);
    }
    id v7 = context[2];
    if (v7)
    {
      do
      {
        v8 = (void *)*v7;
        operator delete(v7);
        id v7 = v8;
      }
      while (v8);
    }
    uint64_t v9 = *context;
    *context = 0;
    if (v9) {
      operator delete(v9);
    }
    MEMORY[0x1852FDE70](context, 0x10A0C40864A76ABLL);
  }
  self->_context = 0;
  v10.receiver = self;
  v10.super_class = (Class)MPSGraphCaptureContext;
  [(MPSGraphCaptureContext *)&v10 dealloc];
}

- (void)setInputBuffers:(id)a3 names:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  getGraphPorts((uint64_t)"input", v9, v6, (uint64_t)self->_context);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputPorts = self->_inputPorts;
  self->_inputPorts = v7;
}

- (void)setOutputBuffers:(id)a3 names:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  getGraphPorts((uint64_t)"output", v9, v6, (uint64_t)self->_context + 40);
  id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputPorts = self->_outputPorts;
  self->_outputPorts = v7;
}

- (void)setFeeds:(id)a3 names:(id)a4
{
  id v7 = a4;
  id v6 = getBuffersFromTensorDatas(a3);
  [(MPSGraphCaptureContext *)self setInputBuffers:v6 names:v7];
}

- (void)setResults:(id)a3 names:(id)a4
{
  id v7 = a4;
  id v6 = getBuffersFromTensorDatas(a3);
  [(MPSGraphCaptureContext *)self setOutputBuffers:v6 names:v7];
}

- (id)dataWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(NSMutableArray *)self->_data count];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"data%u", v7);
  id v9 = [(NSString *)self->_outputFolderPath UTF8String];
  size_t v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10) {
LABEL_8:
  }
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  id v15 = v8;
  std::string::append(&__dst, (const std::string::value_type *)[v15 UTF8String]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v16 = &__dst;
  }
  else {
    v16 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  uint64_t v17 = fopen((const char *)v16, "wb");
  if (!v17 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  fwrite(a3, 1uLL, a4, v17);
  fclose(v17);
  v22[0] = @"Name";
  v22[1] = @"FilePath";
  v23[0] = v15;
  v23[1] = v15;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  [(NSMutableArray *)self->_data addObject:v18];
  id v19 = v15;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }

  return v19;
}

- (void)setConstantBuffer:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:v4];
  id v7 = v4;
  id v6 = -[MPSGraphCaptureContext dataWithBytes:length:](self, "dataWithBytes:length:", [v7 contents], objc_msgSend(v7, "length"));
  [(NSMutableDictionary *)self->_constantBuffers setObject:v6 forKeyedSubscript:v5];
}

- (id)constantBufferName:(id)a3
{
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  v5 = [(NSMutableDictionary *)self->_constantBuffers objectForKeyedSubscript:v4];

  return v5;
}

- (id)addFunctionWithBitCode:(id)a3 metalFunctionName:(id)a4 reflection:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v35 = a4;
  id v38 = a5;
  uint64_t v8 = [(NSMutableArray *)self->_functions count];
  v36 = objc_msgSend(NSString, "stringWithFormat:", @"function%u", v8);
  id v33 = [NSString stringWithFormat:@"%@.bc", v36];
  id v9 = [(NSString *)self->_outputFolderPath UTF8String];
  size_t v10 = strlen(v9);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_8;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10) {
LABEL_8:
  }
    memmove(p_dst, v9, v11);
  v31 = self;
  p_dst->__r_.__value_.__s.__data_[v11] = 0;
  id v34 = v33;
  std::string::append(&__dst, (const std::string::value_type *)[v34 UTF8String]);
  id v37 = v32;
  id v15 = (const void *)[v37 bytes];
  size_t v16 = [v37 length];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v17 = &__dst;
  }
  else {
    uint64_t v17 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  v18 = fopen((const char *)v17, "wb");
  fwrite(v15, 1uLL, v16, v18);
  fclose(v18);
  v39 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v19 = [v38 arguments];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if (![v23 type])
        {
          v49[0] = @"Name";
          v24 = [v23 name];
          v49[1] = @"Buffer";
          v50[0] = v24;
          v47 = @"BindIndex";
          v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "index"));
          v48 = v25;
          objc_super v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          v50[1] = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];

          [v39 addObject:v27];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v20);
  }

  v45[0] = @"Name";
  v45[1] = @"AirBitcodeFile";
  v46[0] = v36;
  v46[1] = v34;
  v45[2] = @"MetalFunctionName";
  v45[3] = @"Ports";
  v46[2] = v35;
  v46[3] = v39;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:4];
  [(NSMutableArray *)v31->_functions addObject:v28];
  id v29 = v36;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }

  return v29;
}

- (void)addPipeline:(id)a3 functionName:(id)a4 withReflection:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  [(NSMutableDictionary *)self->_pipelineReflectionDictionary setObject:v8 forKeyedSubscript:v9];
  [(NSMutableDictionary *)self->_pipelineFunctionNameDictionary setObject:v10 forKeyedSubscript:v9];
}

- (id)reflectionForPipeline:(id)a3
{
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  v5 = [(NSMutableDictionary *)self->_pipelineReflectionDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (id)functionNameForPipeline:(id)a3
{
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  v5 = [(NSMutableDictionary *)self->_pipelineFunctionNameDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (id)wrapComputeEncoder:(id)a3
{
  id v4 = a3;
  v5 = [[MPSCaptureCommandEncoder alloc] initWithCommandEncoder:v4 captureContext:self];

  return v5;
}

- (void)createNodeWithDispatchInfo:(id)a3 encoderContext:(void *)a4
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v88 = a3;
  v93 = objc_opt_new();
  v96 = (uint64_t *)a4;
  id v86 = *((id *)a4 + 3);
  MPSLibrary::getComputePipelineStateInfo();
  id v90 = v122;
  v87 = [MEMORY[0x1E4F29238] valueWithPointer:v86];
  v89 = -[NSMutableDictionary objectForKeyedSubscript:](self->_pipelineFileNameDictionary, "objectForKeyedSubscript:");
  v102 = self;
  if (!v89)
  {
    id v6 = v121;
    uint64_t v7 = [(MPSGraphCaptureContext *)self addFunctionWithBitCode:v123 metalFunctionName:v6 reflection:v90];
    [(NSMutableDictionary *)self->_pipelineFileNameDictionary setObject:v7 forKeyedSubscript:v87];
    v89 = (void *)v7;
    id v8 = [v90 performanceStatistics];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F35190]];
      std::string::size_type v11 = v10;
      if (v10 && (int)[v10 intValue] >= 1)
      {
        v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x1E4FBA240], (uint64_t)"Function ", 9);
        uint64_t v13 = (const char *)[v6 UTF8String];
        size_t v14 = strlen(v13);
        id v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v13, v14);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" spilled ", 9);
        size_t v16 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" bytes\n", 7);
        v102->_doNotWriteJsonFile = 1;
      }
    }
    self = v102;
  }
  uint64_t v17 = [(NSMutableArray *)self->_nodes count];
  v91 = [MEMORY[0x1E4F1CA48] array];
  v94 = [MEMORY[0x1E4F1CA48] array];
  v100 = objc_msgSend(NSString, "stringWithFormat:", @"node%u", v17);
  objc_msgSend(v93, "setObject:forKeyedSubscript:");
  [v93 setObject:v89 forKeyedSubscript:@"Function"];
  [v93 setObject:v91 forKeyedSubscript:@"OutputPortStorage"];
  [v93 setObject:v88 forKeyedSubscript:@"Dispatch"];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = [v90 arguments];
  uint64_t v98 = [obj countByEnumeratingWithState:&v117 objects:v158 count:16];
  if (v98)
  {
    uint64_t v97 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v118 != v97) {
          objc_enumerationMutation(obj);
        }
        v103 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        if ([v103 type] == 1)
        {
          if (!*(void *)(v96[4] + 8 * [v103 index])) {
            continue;
          }
          v156[0] = @"Size";
          v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
          v157[0] = v18;
          v156[1] = @"BindIndex";
          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v103, "index"));
          v157[1] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v157 forKeys:v156 count:2];

          [v94 addObject:v20];
          goto LABEL_20;
        }
        if ([v103 type]) {
          continue;
        }
        uint64_t v21 = [v103 index];
        uint64_t v22 = v21;
        uint64_t v23 = *v96;
        uint64_t v24 = *v96 + 32 * v21;
        uint64_t v101 = *(void *)(v24 + 8);
        if (*(unsigned char *)(v24 + 16))
        {
          v154[0] = @"Source";
          v152[0] = @"Data";
          v25 = [MEMORY[0x1E4F1CA98] null];
          v153[0] = v25;
          v152[1] = @"Port";
          v153[1] = *(void *)(v23 + 32 * v22 + 24);
          objc_super v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v153 forKeys:v152 count:2];
          v155[0] = v26;
          v154[1] = @"Offset";
          v27 = [NSNumber numberWithUnsignedInteger:v101];
          v155[1] = v27;
          v154[2] = @"Dest";
          v151[0] = v100;
          v150[0] = @"Node";
          v150[1] = @"Port";
          v28 = [v103 name];
          v151[1] = v28;
          id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:2];
          v155[2] = v29;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v155 forKeys:v154 count:3];

          [(NSMutableArray *)v102->_links addObject:v20];
          goto LABEL_20;
        }
        v30 = *(void **)(v23 + 32 * v21);
        if (v30)
        {
          id v31 = v30;
          context = self->_context;
          id v33 = v31;
          id v34 = std::__hash_table<std::__hash_value_type<void *,void *>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,void *>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,void *>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,void *>>>::find<void *>(context, (unint64_t)v33);
          v106 = v33;
          if (v34)
          {
            id v35 = (id)v34[3];

            if (v35)
            {
              v148[0] = @"Source";
              v147[0] = v102->_graphName;
              v146[0] = @"Graph";
              v146[1] = @"Port";
              v36 = [v35 objectForKeyedSubscript:@"Name"];
              v147[1] = v36;
              id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:2];
              v149[0] = v37;
              v148[1] = @"Offset";
              id v38 = [NSNumber numberWithUnsignedInteger:v101];
              v149[1] = v38;
              v148[2] = @"Dest";
              v145[0] = v100;
              v144[0] = @"Node";
              v144[1] = @"Port";
              v39 = [v103 name];
              v145[1] = v39;
              long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:2];
              v149[2] = v40;
              long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:3];

              [(NSMutableArray *)v102->_portLinks addObject:v41];
              char v42 = 1;
              goto LABEL_26;
            }
            char v42 = 0;
          }
          else
          {
            char v42 = 0;
            id v35 = v33;
LABEL_26:
          }
          lastNodeWrittingToBuffer = v102->_lastNodeWrittingToBuffer;
          v44 = [MEMORY[0x1E4F29238] valueWithPointer:v106];
          v92 = [(NSMutableDictionary *)lastNodeWrittingToBuffer objectForKeyedSubscript:v44];

          if (v92)
          {
            long long v115 = 0u;
            long long v116 = 0u;
            long long v114 = 0u;
            long long v113 = 0u;
            id v104 = v92;
            uint64_t v45 = [v104 countByEnumeratingWithState:&v113 objects:v143 count:16];
            if (v45)
            {
              uint64_t v105 = *(void *)v114;
              do
              {
                for (uint64_t j = 0; j != v45; ++j)
                {
                  if (*(void *)v114 != v105) {
                    objc_enumerationMutation(v104);
                  }
                  v47 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                  id v48 = [v47 objectForKeyedSubscript:@"BufferInfo"];
                  v49 = (uint64_t *)[v48 bytes];

                  uint64_t v50 = *v49;
                  if (v50 == [v106 length])
                  {
                    uint64_t v51 = v49[1];
                    if (v51 == [v106 gpuAddress])
                    {
                      uint64_t v52 = [v47 objectForKeyedSubscript:@"Node"];
                      v141[0] = @"Source";
                      v139[0] = @"Node";
                      v53 = [v52 objectForKeyedSubscript:@"Name"];
                      v140[0] = v53;
                      v139[1] = @"Port";
                      v54 = [v47 objectForKeyedSubscript:@"Argument"];
                      v140[1] = v54;
                      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:2];
                      v142[0] = v55;
                      v141[1] = @"Offset";
                      v56 = [NSNumber numberWithUnsignedInteger:v101];
                      v142[1] = v56;
                      v141[2] = @"Dest";
                      v138[0] = v100;
                      v137[0] = @"Node";
                      v137[1] = @"Port";
                      v57 = [v103 name];
                      v138[1] = v57;
                      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:v137 count:2];
                      v142[2] = v58;
                      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];

                      [(NSMutableArray *)v102->_links addObject:v59];
                      char v42 = 1;
                    }
                  }
                }
                uint64_t v45 = [v104 countByEnumeratingWithState:&v113 objects:v143 count:16];
              }
              while (v45);
            }
          }
          uint64_t v20 = v106;
          if ([v103 access] == 1)
          {
            v60 = (char *)v102->_context + 40;
            id v61 = v106;
            v62 = std::__hash_table<std::__hash_value_type<void *,void *>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,void *>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,void *>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,void *>>>::find<void *>(v60, (unint64_t)v61);
            if (v62)
            {
              id v63 = (id)v62[3];

              if (v63)
              {
                v135[0] = @"Dest";
                v134[0] = v102->_graphName;
                v133[0] = @"Graph";
                v133[1] = @"Port";
                v64 = [v63 objectForKeyedSubscript:@"Name"];
                v134[1] = v64;
                v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:2];
                v136[0] = v65;
                v135[1] = @"Source";
                v132[0] = v100;
                v131[0] = @"Node";
                v131[1] = @"Port";
                v66 = [v103 name];
                v132[1] = v66;
                v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
                v136[1] = v67;
                v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:2];

                [(NSMutableArray *)v102->_portLinks addObject:v68];
                goto LABEL_46;
              }
            }
            else
            {
            }
            if ((v42 & 1) == 0)
            {
LABEL_46:
              v129[0] = @"Port";
              v69 = [v103 name];
              v130[0] = v69;
              v129[1] = @"Buffer";
              v127[0] = @"Size";
              v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v61, "length"));
              v128[0] = v70;
              v127[1] = @"Offset";
              v71 = [NSNumber numberWithUnsignedInteger:v101];
              v128[1] = v71;
              v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
              v130[1] = v72;
              v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];

              [v91 addObject:v73];
            }
            uint64_t v20 = v106;
          }
LABEL_20:

          self = v102;
          continue;
        }
      }
      uint64_t v98 = [obj countByEnumeratingWithState:&v117 objects:v158 count:16];
    }
    while (v98);
  }

  if ([v94 count]) {
    [v93 setObject:v94 forKeyedSubscript:@"ThreadgroupBuffers"];
  }
  v74 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v75 = [v90 arguments];
  uint64_t v76 = [v75 countByEnumeratingWithState:&v109 objects:v126 count:16];
  if (v76)
  {
    uint64_t v77 = *(void *)v110;
    do
    {
      for (uint64_t k = 0; k != v76; ++k)
      {
        if (*(void *)v110 != v77) {
          objc_enumerationMutation(v75);
        }
        v79 = *(void **)(*((void *)&v109 + 1) + 8 * k);
        if (![v79 type] && objc_msgSend(v79, "access") == 1)
        {
          id v80 = *(id *)(*v96 + 32 * [v79 index]);
          v108[0] = [v80 length];
          v108[1] = [v80 gpuAddress];
          v125[0] = v93;
          v124[0] = @"Node";
          v124[1] = @"Argument";
          v81 = [v79 name];
          v125[1] = v81;
          v124[2] = @"BufferInfo";
          v82 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v108 length:16];
          v125[2] = v82;
          v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:3];

          v84 = [MEMORY[0x1E4F29238] valueWithPointer:v80];
          v85 = [v74 objectForKeyedSubscript:v84];
          if (!v85)
          {
            v85 = objc_opt_new();
            [v74 setObject:v85 forKeyedSubscript:v84];
          }
          [v85 addObject:v83];
        }
      }
      uint64_t v76 = [v75 countByEnumeratingWithState:&v109 objects:v126 count:16];
    }
    while (v76);
  }

  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __68__MPSGraphCaptureContext_createNodeWithDispatchInfo_encoderContext___block_invoke;
  v107[3] = &unk_1E4FC14B8;
  v107[4] = v102;
  [v74 enumerateKeysAndObjectsUsingBlock:v107];
  [(NSMutableArray *)v102->_nodes addObject:v93];
}

uint64_t __68__MPSGraphCaptureContext_createNodeWithDispatchInfo_encoderContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setObject:a3 forKeyedSubscript:a2];
}

- (void)writeToJsonFile:(__sFILE *)a3
{
  id v4 = self;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v33 = @"Graph";
  graphName = self->_graphName;
  v31[0] = @"Name";
  v31[1] = @"MetalArguments";
  v32[0] = graphName;
  v32[1] = &stru_1EC9D55D0;
  v32[2] = self->_functions;
  v31[2] = @"Functions";
  v31[3] = @"Ports";
  v29[0] = @"Inputs";
  v29[1] = @"Outputs";
  outputPorts = self->_outputPorts;
  v30[0] = self->_inputPorts;
  v30[1] = outputPorts;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  data = v4->_data;
  v32[3] = v7;
  v31[4] = @"Data";
  v31[5] = @"Nodes";
  nodes = v4->_nodes;
  v32[4] = data;
  v32[5] = nodes;
  links = v4->_links;
  v31[6] = @"Links";
  v31[7] = @"PortLinks";
  portLinks = v4->_portLinks;
  v32[6] = links;
  v32[7] = portLinks;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:8];
  v34[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v4 = (MPSGraphCaptureContext *)((char *)v4 + 8);
  Class isa = v4->super.super.isa;
  v4->super.super.Class isa = (Class)v13;

  Class v15 = v4->super.super.isa;
  id v28 = 0;
  size_t v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:9 error:&v28];
  id v17 = v28;
  id v18 = v16;
  id v19 = (const void *)[v18 bytes];
  unint64_t v20 = [v18 length];
  size_t v21 = v20;
  if (v20 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    p_dst = (void **)operator new(v23 + 1);
    std::string __dst = p_dst;
    unint64_t v27 = v24 | 0x8000000000000000;
    goto LABEL_8;
  }
  HIBYTE(v27) = v20;
  p_dst = (void **)&__dst;
  if (v20) {
LABEL_8:
  }
    memmove(p_dst, v19, v21);
  *((unsigned char *)p_dst + v21) = 0;
  id v25 = v18;
  fwrite((const void *)[v25 bytes], objc_msgSend(v25, "length"), 1uLL, a3);
  if (SHIBYTE(v27) < 0) {
    operator delete(__dst);
  }
}

- (void)writejsonFile:(id)a3
{
  id v4 = a3;
  if (self->_doNotWriteJsonFile) {
    goto LABEL_16;
  }
  v5 = [(NSString *)self->_outputFolderPath UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_dst = (std::string *)operator new(v9 + 1);
    __dst.__r_.__value_.__l.__size_ = v7;
    __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
    p_dst = &__dst;
    if (!v6) {
      goto LABEL_10;
    }
  }
  memmove(p_dst, v5, v7);
LABEL_10:
  p_dst->__r_.__value_.__s.__data_[v7] = 0;
  std::string::append(&__dst, "/");
  std::string::append(&__dst, (const std::string::value_type *)[v4 UTF8String]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v11 = &__dst;
  }
  else {
    std::string::size_type v11 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  v12 = fopen((const char *)v11, "w");
  if (!v12 && MTLReportFailureTypeEnabled())
  {
    uint64_t v13 = &__dst;
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v13 = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    size_t v14 = v13;
    MTLReportFailure();
  }
  -[MPSGraphCaptureContext writeToJsonFile:](self, "writeToJsonFile:", v12, v14);
  fclose(v12);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphName, 0);
  objc_storeStrong((id *)&self->_outputFolderPath, 0);
  objc_storeStrong((id *)&self->_lastNodeWrittingToBuffer, 0);
  objc_storeStrong((id *)&self->_constantBuffers, 0);
  objc_storeStrong((id *)&self->_pipelineFileNameDictionary, 0);
  objc_storeStrong((id *)&self->_pipelineFunctionNameDictionary, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionDictionary, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_portLinks, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_jsonData, 0);
}

@end