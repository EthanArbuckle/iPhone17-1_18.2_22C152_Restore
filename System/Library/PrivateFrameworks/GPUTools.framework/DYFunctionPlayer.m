@interface DYFunctionPlayer
+ (CGSize)shrinkSourceSize:(CGSize)a3 toDestSize:(CGSize)a4;
- (BOOL)isFrameBoundary;
- (BOOL)mainExecutionMode;
- (BOOL)shouldExecuteGraphicsFunction;
- (BOOL)skipOptionalFunctions;
- (CoreFunction)function;
- (DYCaptureStore)captureStore;
- (DYFunctionPlayer)init;
- (DYFunctionPlayer)initWithCaptureStore:(id)a3;
- (DYPlaybackEngine)engine;
- (id).cxx_construct;
- (unint64_t)ctxID;
- (unsigned)currentExecutionModeFunctionIndex;
- (unsigned)currentFileFunctionIndex;
- (unsigned)frameCounter;
- (void)addPointerDataSizeMap:(void *)a3;
- (void)copyDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4;
- (void)dealloc;
- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4;
- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5;
- (void)performNewExecutionFileActions;
- (void)prepareForCaptureExecution;
- (void)prepareForNonCaptureExecution;
- (void)processArguments;
- (void)releaseArguments;
- (void)releaseDataForArgument:(int)a3;
- (void)releaseDataForPosition:(unint64_t)a3;
- (void)requestDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4 position:(unint64_t *)a5;
- (void)requestDataForPosition:(unint64_t)a3 dataSize:(unint64_t *)a4;
- (void)setCurrentContext:(unint64_t)a3;
- (void)setEngine:(id)a3;
- (void)setFrameCounter:(unsigned int)a3;
- (void)setSkipOptionalFunctions:(BOOL)a3;
@end

@implementation DYFunctionPlayer

- (DYFunctionPlayer)init
{
  return 0;
}

- (DYFunctionPlayer)initWithCaptureStore:(id)a3
{
  if (!a3) {
    __assert_rtn("-[DYFunctionPlayer initWithCaptureStore:]", ", 0, "captureStore"");
  }
  v19.receiver = self;
  v19.super_class = (Class)DYFunctionPlayer;
  v4 = [(DYFunctionPlayer *)&v19 init];
  if (v4)
  {
    v4->_captureStore = (DYCaptureStore *)a3;
    v4->_skipOptionalFunctions = 1;
    p_executePlatformSEL = &v4->_executePlatformSEL;
    if (sel_executePlatformFunction)
    {
      SEL *p_executePlatformSEL = sel_executePlatformFunction;
      v6 = sel_executePlatformFunction;
    }
    else
    {
      v6 = 0;
      SEL *p_executePlatformSEL = 0;
    }
    uint64_t v7 = [(DYFunctionPlayer *)v4 methodForSelector:v6];
    v4->_executePlatform = (void *)v7;
    if (v7)
    {
      p_executeGraphicsSEL = &v4->_executeGraphicsSEL;
      if (sel_executeGraphicsFunction)
      {
        SEL *p_executeGraphicsSEL = sel_executeGraphicsFunction;
        v9 = sel_executeGraphicsFunction;
      }
      else
      {
        v9 = 0;
        SEL *p_executeGraphicsSEL = 0;
      }
      uint64_t v10 = [(DYFunctionPlayer *)v4 methodForSelector:v9];
      v4->_executeGraphics = (void *)v10;
      if (v10)
      {
        p_shouldExecuteGraphicsSEL = &v4->_shouldExecuteGraphicsSEL;
        if (sel_shouldExecuteGraphicsFunction)
        {
          SEL *p_shouldExecuteGraphicsSEL = sel_shouldExecuteGraphicsFunction;
          v12 = sel_shouldExecuteGraphicsFunction;
        }
        else
        {
          v12 = 0;
          SEL *p_shouldExecuteGraphicsSEL = 0;
        }
        uint64_t v13 = [(DYFunctionPlayer *)v4 methodForSelector:v12];
        v4->_shouldExecuteGraphics = (void *)v13;
        if (v13)
        {
          p_isFrameBoundarySEL = &v4->_isFrameBoundarySEL;
          if (sel_isFrameBoundary)
          {
            SEL *p_isFrameBoundarySEL = sel_isFrameBoundary;
            v15 = sel_isFrameBoundary;
          }
          else
          {
            v15 = 0;
            SEL *p_isFrameBoundarySEL = 0;
          }
          uint64_t v16 = [(DYFunctionPlayer *)v4 methodForSelector:v15];
          v4->_isFrameBoundary = (void *)v16;
          if (v16)
          {
            v4->_retval_buffer = malloc_type_malloc(0x80uLL, 0x495FC8D5uLL);
            v4->_variables = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:1282 capacity:0];
            return v4;
          }
          v18 = "_isFrameBoundary";
        }
        else
        {
          v18 = "_shouldExecuteGraphics";
        }
      }
      else
      {
        v18 = "_executeGraphics";
      }
    }
    else
    {
      v18 = "_executePlatform";
    }
    __assert_rtn("-[DYFunctionPlayer initWithCaptureStore:]", "", 0, v18);
  }
  return v4;
}

- (void)dealloc
{
  retval_buffer = self->_retval_buffer;
  if (retval_buffer) {
    free(retval_buffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)DYFunctionPlayer;
  [(DYFunctionPlayer *)&v4 dealloc];
}

- (void)prepareForNonCaptureExecution
{
  self->_mainExecutionMode = 0;
  self->_currentExecutionModeFunctionIndex = 0;
}

- (void)prepareForCaptureExecution
{
  self->_mainExecutionMode = 1;
  self->_currentExecutionModeFunctionIndex = 0;
  self->_frameCounter = 0;
  self->_lastCommandWasFrameBoundary = 1;
  if ([(DYPlaybackEngine *)[(DYFunctionPlayer *)self engine] loopCount] >= 3)
  {
    GPUTools::Playback::MemoryManager::Begin(&self->_memoryManager._state);
  }
}

- (void)performNewExecutionFileActions
{
  self->_currentFileFunctionIndex = 0;
}

- (BOOL)isFrameBoundary
{
  return 0;
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4
{
}

- (void)executeFunctions:(CoreFunction *)a3 count:(unint64_t)a4 subCommandIndex:(unsigned int)a5
{
  self->_function = a3;
  if (a4)
  {
    v6 = &a3[a4];
    p_memoryManager = &self->_memoryManager;
    p_currentExecutionModeFunctionIndex = (int32x2_t *)&self->_currentExecutionModeFunctionIndex;
    while (1)
    {
      v9 = (void *)MEMORY[0x2533604C0]();
      if (((_BYTE)[(DYFunctionPlayer *)self function][4] & 2) == 0
        && (![(DYFunctionPlayer *)self skipOptionalFunctions]
         || ((_BYTE)[(DYFunctionPlayer *)self function][5] & 1) == 0))
      {
        break;
      }
LABEL_25:
      uint64_t v16 = self->_function + 1;
      self->_function = v16;
      int32x2_t *p_currentExecutionModeFunctionIndex = vadd_s32(*p_currentExecutionModeFunctionIndex, (int32x2_t)0x100000001);
      if (v16 == v6) {
        return;
      }
    }
    uint64_t v10 = (uint64_t)[(DYFunctionPlayer *)self function][16];
    if (v10 != [(DYFunctionPlayer *)self ctxID]) {
      [(DYFunctionPlayer *)self setCurrentContext:(void)[(DYFunctionPlayer *)self function][16]];
    }
    if ([(DYFunctionPlayer *)self mainExecutionMode] && self->_lastCommandWasFrameBoundary)
    {
      self->_lastCommandWasFrameBoundary = 0;
      [(DYFunctionPlayer *)self performNewFrameActions];
    }
    if (self->_isFrameBoundarySEL) {
      SEL isFrameBoundarySEL = self->_isFrameBoundarySEL;
    }
    else {
      SEL isFrameBoundarySEL = 0;
    }
    int v12 = ((uint64_t (*)(DYFunctionPlayer *, SEL))self->_isFrameBoundary)(self, isFrameBoundarySEL);
    if ([(DYFunctionPlayer *)self mainExecutionMode] && v12)
    {
      [(DYFunctionPlayer *)self setFrameCounter:[(DYFunctionPlayer *)self frameCounter] + 1];
      [(DYFunctionPlayer *)self performPreDispatchFrameBoundaryActions];
    }
    if (*(_DWORD *)[(DYFunctionPlayer *)self function] >= 0xFFFFD000)
    {
      executePlatform = (void (*)(DYFunctionPlayer *, SEL))self->_executePlatform;
      SEL executePlatformSEL = self->_executePlatformSEL;
      if (executePlatformSEL) {
        goto LABEL_19;
      }
    }
    else
    {
      executePlatform = (void (*)(DYFunctionPlayer *, SEL))self->_executeGraphics;
      SEL executePlatformSEL = self->_executeGraphicsSEL;
      if (executePlatformSEL)
      {
LABEL_19:
        SEL v15 = executePlatformSEL;
LABEL_22:
        executePlatform(self, v15);
        if (([(DYFunctionPlayer *)self mainExecutionMode] & v12) == 1)
        {
          [(DYFunctionPlayer *)self performPostDispatchFrameBoundaryActions];
          self->_lastCommandWasFrameBoundary = 1;
        }
        GPUTools::Playback::MemoryManager::AllocClear((GPUTools::Playback::MemoryManager *)p_memoryManager);
        [(DYFunctionPlayer *)self releaseArguments];
        goto LABEL_25;
      }
    }
    SEL v15 = 0;
    goto LABEL_22;
  }
}

- (void)copyDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v12 = 0;
  if (([(DYCaptureStore *)[(DYFunctionPlayer *)self captureStore] getInfo:&v10 forFilenameBuffer:a3 error:&v12] & 1) == 0|| (uint64_t v7 = (void *)GPUTools::Playback::MemoryManager::Alloc((GPUTools::Playback::MemoryManager *)&self->_memoryManager, v11), v8 = [(DYFunctionPlayer *)self captureStore], [(DYCaptureStore *)v8 readDataForFilePosition:v10 buffer:v7 size:v11 error:&v12] == -1))
  {
    [NSString stringWithUTF8String:a3];
    _DYOLog();
    return 0;
  }
  else if (a4)
  {
    *a4 = v11;
  }
  return v7;
}

- (void)releaseDataForPosition:(unint64_t)a3
{
  objc_super v4 = [(DYFunctionPlayer *)self captureStore];
  [(DYCaptureStore *)v4 releaseBytesForFilePosition:a3];
}

- (void)requestDataForPosition:(unint64_t)a3 dataSize:(unint64_t *)a4
{
  if (a4) {
    *a4 = 0;
  }
  v5 = 0;
  uint64_t v6 = 0;
  if ([(DYCaptureStore *)[(DYFunctionPlayer *)self captureStore] requestDataForFilePosition:a3 buffer:&v5 size:a4 error:&v6])return v5; {
  _DYOLog();
  }
  return 0;
}

- (void)requestDataForFilename:(const char *)a3 dataSize:(unint64_t *)a4 position:(unint64_t *)a5
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v10 = 0;
  if ([(DYCaptureStore *)[(DYFunctionPlayer *)self captureStore] getInfo:v9 forFilenameBuffer:a3 error:&v10])
  {
    *a5 = v9[0];
    return -[DYFunctionPlayer requestDataForPosition:dataSize:](self, "requestDataForPosition:dataSize:");
  }
  else
  {
    [NSString stringWithUTF8String:a3];
    _DYOLog();
    return 0;
  }
}

- (void)addPointerDataSizeMap:(void *)a3
{
}

- (void)releaseDataForArgument:(int)a3
{
  v3 = (char *)self + 24 * a3;
  objc_super v4 = v3 + 984;
  uint64_t v5 = *((void *)v3 + 123);
  if (v5 != *((void *)v3 + 122))
  {
    unint64_t v7 = 0;
    v8 = (uint64_t *)(v3 + 976);
    uint64_t v5 = *((void *)v3 + 122);
    do
    {
      [(DYFunctionPlayer *)self releaseDataForPosition:*(void *)(v5 + 8 * v7++)];
      uint64_t v5 = *v8;
    }
    while (v7 < (*v4 - *v8) >> 3);
  }
  void *v4 = v5;
}

- (void)releaseArguments
{
  function = self->_function;
  if (function->argument_count)
  {
    uint64_t v4 = 0;
    arguments = function->arguments;
    argumentStorePositions = self->_argumentStorePositions;
    uint64_t v7 = 24 * function->argument_count;
    do
    {
      if (arguments->value)
      {
        if (argumentStorePositions[v4].__begin_ != argumentStorePositions[v4].__end_) {
          [(DYFunctionPlayer *)self releaseDataForArgument:v4];
        }
        ++v4;
      }
      ++arguments;
      v7 -= 24;
    }
    while (v7);
  }
}

- (void)processArguments
{
  function = self->_function;
  if (function->argument_count)
  {
    uint64_t v3 = 0;
    arguments = function->arguments;
    uint64_t v5 = (uint64_t)&function->arguments[function->argument_count];
    argumentStorePositions = self->_argumentStorePositions;
    argumentURLs = self->_argumentURLs;
    uint64_t v119 = v5;
    p_memoryManager = (GPUTools::Playback::MemoryManager *)&self->_memoryManager;
    p_dataSizeMap = &self->_dataSizeMap;
    pointers = self->_pointers;
    argumentPointers = self->_argumentPointers;
    v121 = self->_pointers;
    while (1)
    {
      uint64_t v7 = (uint64_t *)&argumentURLs[v3];
      std::vector<std::pair<std::string,BOOL>>::__clear[abi:ne180100](v7);
      v8 = &argumentStorePositions[v3];
      p_begin = (void **)&v8->__begin_;
      v8->__end_ = v8->__begin_;
      p_end = (char **)&v8->__end_;
      unsigned __int16 flags = arguments->flags;
      if ((flags & 8) != 0) {
        break;
      }
      if ((flags & 0x20) != 0)
      {
        if ((flags & 1) == 0)
        {
          uint64_t v20 = *(void *)arguments->value;
          uint64_t v134 = 0;
          v21 = (uint64_t *)&pointers[v3];
          uint64_t *v21 = (uint64_t)[(DYFunctionPlayer *)self requestDataForPosition:v20 dataSize:&v134];
          uint64_t v22 = v134;
          v135 = v21;
          std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v21, (uint64_t)&std::piecewise_construct, &v135)[3] = v22;
          argumentPointers[v3] = v21;
          v23 = *p_end;
          v24 = &argumentStorePositions[v3];
          unint64_t value = (unint64_t)v24->__end_cap_.__value_;
          p_end_cap = &v24->__end_cap_;
          unint64_t v25 = value;
          if ((unint64_t)*p_end >= value)
          {
            v79 = (char *)*p_begin;
            uint64_t v80 = (v23 - (unsigned char *)*p_begin) >> 3;
            unint64_t v81 = v80 + 1;
            if ((unint64_t)(v80 + 1) >> 61) {
              goto LABEL_139;
            }
            uint64_t v82 = v25 - (void)v79;
            if (v82 >> 2 > v81) {
              unint64_t v81 = v82 >> 2;
            }
            if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v83 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v83 = v81;
            }
            if (v83)
            {
              v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)p_end_cap, v83);
              v23 = *p_end;
              v79 = (char *)*p_begin;
            }
            else
            {
              v84 = 0;
            }
            v96 = &v84[8 * v80];
            *(void *)v96 = v20;
            v28 = v96 + 8;
            while (v23 != v79)
            {
              uint64_t v97 = *((void *)v23 - 1);
              v23 -= 8;
              *((void *)v96 - 1) = v97;
              v96 -= 8;
            }
            *p_begin = v96;
            *p_end = v28;
            p_end_cap->__value_ = (unint64_t *)&v84[8 * v83];
            if (v79) {
              operator delete(v79);
            }
          }
          else
          {
            *(void *)v23 = v20;
            v28 = v23 + 8;
          }
          *p_end = v28;
          v98 = &argumentURLs[v3];
          end = v98->__end_;
          v100 = &v98->__end_;
          v99 = end;
          v102 = v100[1];
          if (end >= v102)
          {
            uint64_t v104 = ((uint64_t)v99 - *v7) >> 5;
            unint64_t v105 = v104 + 1;
            if ((unint64_t)(v104 + 1) >> 59) {
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v106 = (uint64_t)v102 - *v7;
            if (v106 >> 4 > v105) {
              unint64_t v105 = v106 >> 4;
            }
            if ((unint64_t)v106 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v107 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v107 = v105;
            }
            v139 = (__compressed_pair<std::pair<std::string, BOOL> *, std::allocator<std::pair<std::string, BOOL>>> *)(v100 + 1);
            v108 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>((uint64_t)(v100 + 1), v107);
            v109 = &v108[4 * v104];
            v135 = v108;
            v136 = v109;
            v138 = &v108[4 * v110];
            uint64_t *v109 = 0;
            v109[1] = 0;
            v109[2] = 0;
            *((unsigned char *)v109 + 24) = 1;
            v137 = v109 + 4;
            std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(v7, &v135);
            v103 = *v100;
            std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)&v135);
          }
          else
          {
            void *v99 = 0;
            v99[1] = 0;
            v99[2] = 0;
            *((unsigned char *)v99 + 24) = 1;
            v103 = v99 + 4;
            *v100 = v99 + 4;
          }
          *v100 = v103;
          goto LABEL_137;
        }
        v129 = (uint64_t *)&argumentURLs[v3];
        uint64_t v122 = v3;
        uint64_t v29 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
        if (arguments->length)
        {
          unint64_t v53 = 0;
          v127 = arguments->value;
          v54 = &argumentStorePositions[v122].__end_cap_;
          v55 = &argumentURLs[v122];
          v56 = &v55->__end_;
          v57 = &v55->__end_cap_;
          do
          {
            uint64_t v58 = v127[v53];
            if (v58 == -1)
            {
              *(void *)(v29 + 8 * v53) = 0;
            }
            else
            {
              uint64_t v134 = 0;
              *(void *)(v29 + 8 * v53) = [(DYFunctionPlayer *)self requestDataForPosition:v58 dataSize:&v134];
              v59 = *p_end;
              if ((unint64_t *)*p_end >= v54->__value_)
              {
                v61 = (char *)*p_begin;
                uint64_t v62 = (v59 - (unsigned char *)*p_begin) >> 3;
                unint64_t v63 = v62 + 1;
                if ((unint64_t)(v62 + 1) >> 61) {
                  goto LABEL_139;
                }
                uint64_t v64 = (char *)v54->__value_ - v61;
                if (v64 >> 2 > v63) {
                  unint64_t v63 = v64 >> 2;
                }
                if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v65 = v63;
                }
                if (v65)
                {
                  v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v54, v65);
                  v59 = *p_end;
                  v61 = (char *)*p_begin;
                }
                else
                {
                  v66 = 0;
                }
                v67 = &v66[8 * v62];
                *(void *)v67 = v58;
                v60 = v67 + 8;
                while (v59 != v61)
                {
                  uint64_t v68 = *((void *)v59 - 1);
                  v59 -= 8;
                  *((void *)v67 - 1) = v68;
                  v67 -= 8;
                }
                *p_begin = v67;
                *p_end = v60;
                v54->__value_ = (unint64_t *)&v66[8 * v65];
                if (v61) {
                  operator delete(v61);
                }
              }
              else
              {
                *(void *)v59 = v58;
                v60 = v59 + 8;
              }
              *p_end = v60;
              uint64_t v69 = v134;
              v135 = (uint64_t *)(v29 + 8 * v53);
              std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v69;
            }
            v70 = *v56;
            if (*v56 >= v57->__value_)
            {
              uint64_t v72 = ((uint64_t)v70 - *v129) >> 5;
              unint64_t v73 = v72 + 1;
              if ((unint64_t)(v72 + 1) >> 59) {
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v74 = (uint64_t)v57->__value_ - *v129;
              if (v74 >> 4 > v73) {
                unint64_t v73 = v74 >> 4;
              }
              if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v75 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v75 = v73;
              }
              v139 = v57;
              v76 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>((uint64_t)v57, v75);
              v77 = &v76[4 * v72];
              v135 = v76;
              v136 = v77;
              v138 = &v76[4 * v78];
              v77[1] = 0;
              v77[2] = 0;
              uint64_t *v77 = 0;
              *((unsigned char *)v77 + 24) = 1;
              v137 = v77 + 4;
              std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(v129, &v135);
              v71 = *v56;
              std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)&v135);
            }
            else
            {
              void *v70 = 0;
              v70[1] = 0;
              v70[2] = 0;
              *((unsigned char *)v70 + 24) = 1;
              v71 = v70 + 4;
              *v56 = v70 + 4;
            }
            *v56 = v71;
            ++v53;
          }
          while (v53 < arguments->length);
        }
        goto LABEL_84;
      }
      if ((flags & 0x10) != 0)
      {
        v52 = (void *)[[NSString alloc] initWithBytesNoCopy:arguments->value length:strlen((const char *)arguments->value) encoding:1 freeWhenDone:0];
        pointers[v3] = NSMapGet(self->_variables, v52);
        argumentPointers[v3] = &pointers[v3];
      }
      else
      {
        if ((flags & 2) != 0) {
          goto LABEL_104;
        }
        if (flags)
        {
          if ((flags & 0x40) != 0)
          {
LABEL_104:
            v91 = (const char *)arguments->value;
            uint64_t v92 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
            uint64_t length = arguments->length;
            if (arguments->length)
            {
              v94 = (void *)v92;
              do
              {
                unsigned int v95 = *(_DWORD *)v91;
                v91 += 4;
                *v94++ = (char *)arguments->value + v95;
                --length;
              }
              while (length);
            }
            unint64_t v11 = (char *)&pointers[v3];
            *(void *)unint64_t v11 = v92;
            goto LABEL_108;
          }
        }
        else if (arguments->core_type != 13)
        {
          unint64_t v11 = (char *)arguments->value;
LABEL_108:
          argumentPointers[v3] = v11;
          goto LABEL_137;
        }
        pointers[v3] = arguments->value;
        argumentPointers[v3] = &pointers[v3];
      }
LABEL_137:
      ++v3;
      if (++arguments == (Argument *)v5) {
        return;
      }
    }
    v128 = (uint64_t *)&argumentURLs[v3];
    if ((flags & 1) == 0)
    {
      if (arguments->value) {
        uint64_t v12 = (char *)arguments->value;
      }
      else {
        uint64_t v12 = "";
      }
      if (*v12)
      {
        uint64_t v133 = 0;
        uint64_t v134 = 0;
        pointers[v3] = [(DYFunctionPlayer *)self requestDataForFilename:v12 dataSize:&v134 position:&v133];
        uint64_t v13 = v133;
        if (v133 != -1)
        {
          v14 = *p_end;
          SEL v15 = &argumentStorePositions[v3];
          unint64_t v18 = (unint64_t)v15->__end_cap_.__value_;
          v17 = &v15->__end_cap_;
          unint64_t v16 = v18;
          if ((unint64_t)*p_end >= v18)
          {
            v85 = (char *)*p_begin;
            uint64_t v86 = (v14 - (unsigned char *)*p_begin) >> 3;
            unint64_t v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 61) {
LABEL_139:
            }
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            uint64_t v88 = v16 - (void)v85;
            if (v88 >> 2 > v87) {
              unint64_t v87 = v88 >> 2;
            }
            if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v89 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v89 = v87;
            }
            if (v89)
            {
              v90 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v17, v89);
              v14 = *p_end;
              v85 = (char *)*p_begin;
              uint64_t v13 = v133;
            }
            else
            {
              v90 = 0;
            }
            v111 = &v90[8 * v86];
            *(void *)v111 = v13;
            objc_super v19 = v111 + 8;
            while (v14 != v85)
            {
              uint64_t v112 = *((void *)v14 - 1);
              v14 -= 8;
              *((void *)v111 - 1) = v112;
              v111 -= 8;
            }
            *p_begin = v111;
            *p_end = v19;
            v17->__value_ = (unint64_t *)&v90[8 * v89];
            if (v85) {
              operator delete(v85);
            }
          }
          else
          {
            *(void *)v14 = v133;
            objc_super v19 = v14 + 8;
          }
          *p_end = v19;
        }
        uint64_t v113 = v134;
        v135 = (uint64_t *)&pointers[v3];
        std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v113;
      }
      else
      {
        pointers[v3] = 0;
      }
      argumentPointers[v3] = &pointers[v3];
      v135 = (uint64_t *)v12;
      v136 = 0;
      v114 = &argumentURLs[v3];
      v116 = v114->__end_;
      v115 = v114->__end_cap_.__value_;
      v117 = (uint64_t *)&v114->__end_;
      if (v116 >= v115)
      {
        uint64_t v118 = std::vector<std::pair<std::string,BOOL>>::__emplace_back_slow_path<std::pair<char const*,BOOL>>(v128, (uint64_t)&v135);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v116, v12);
        v116[24] = (_BYTE)v136;
        uint64_t v118 = (uint64_t)(v116 + 32);
        uint64_t *v117 = (uint64_t)(v116 + 32);
      }
      uint64_t *v117 = v118;
      pointers = v121;
      goto LABEL_137;
    }
    uint64_t v122 = v3;
    uint64_t v29 = GPUTools::Playback::MemoryManager::Alloc(p_memoryManager, 8 * arguments->length);
    uint64_t v30 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)arguments);
    if (arguments->length)
    {
      uint64_t v31 = v30;
      unint64_t v32 = 0;
      v126 = &argumentStorePositions[v3].__end_cap_;
      v33 = &argumentURLs[v3];
      v34 = (uint64_t *)&v33->__end_;
      v35 = &v33->__end_cap_;
      do
      {
        uint64_t v36 = *(void *)v31;
        if ((*(_WORD *)(v31 + 22) & 0x40) != 0) {
          v37 = (uint64_t *)(*(unsigned int *)(v36 + 4 * v32) + v36);
        }
        else {
          v37 = *(uint64_t **)(v36 + 8 * v32);
        }
        if (*(unsigned char *)v37)
        {
          uint64_t v133 = 0;
          uint64_t v134 = 0;
          *(void *)(v29 + 8 * v32) = [(DYFunctionPlayer *)self requestDataForFilename:v37 dataSize:&v134 position:&v133];
          uint64_t v38 = v133;
          if (v133 != -1)
          {
            v39 = *p_end;
            if ((unint64_t *)*p_end >= v126->__value_)
            {
              v41 = (char *)*p_begin;
              uint64_t v42 = (v39 - (unsigned char *)*p_begin) >> 3;
              unint64_t v43 = v42 + 1;
              if ((unint64_t)(v42 + 1) >> 61) {
                goto LABEL_139;
              }
              uint64_t v44 = (char *)v126->__value_ - v41;
              if (v44 >> 2 > v43) {
                unint64_t v43 = v44 >> 2;
              }
              if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v45 = v43;
              }
              if (v45)
              {
                v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)v126, v45);
                v39 = *p_end;
                v41 = (char *)*p_begin;
                uint64_t v38 = v133;
              }
              else
              {
                v46 = 0;
              }
              v47 = &v46[8 * v42];
              *(void *)v47 = v38;
              v40 = v47 + 8;
              while (v39 != v41)
              {
                uint64_t v48 = *((void *)v39 - 1);
                v39 -= 8;
                *((void *)v47 - 1) = v48;
                v47 -= 8;
              }
              *p_begin = v47;
              *p_end = v40;
              v126->__value_ = (unint64_t *)&v46[8 * v45];
              if (v41) {
                operator delete(v41);
              }
            }
            else
            {
              *(void *)v39 = v133;
              v40 = v39 + 8;
            }
            *p_end = v40;
          }
          uint64_t v49 = v134;
          v135 = (uint64_t *)(v29 + 8 * v32);
          std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>((uint64_t)p_dataSizeMap, v135, (uint64_t)&std::piecewise_construct, &v135)[3] = v49;
        }
        else
        {
          *(void *)(v29 + 8 * v32) = 0;
        }
        v135 = v37;
        v136 = 0;
        uint64_t v50 = *v34;
        if ((void *)*v34 >= v35->__value_)
        {
          uint64_t v51 = std::vector<std::pair<std::string,BOOL>>::__emplace_back_slow_path<std::pair<char const*,BOOL>>(v128, (uint64_t)&v135);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>((void *)*v34, (char *)v37);
          *(unsigned char *)(v50 + 24) = (_BYTE)v136;
          uint64_t v51 = v50 + 32;
          uint64_t *v34 = v50 + 32;
        }
        uint64_t *v34 = v51;
        ++v32;
      }
      while (v32 < arguments->length);
    }
LABEL_84:
    pointers = v121;
    uint64_t v3 = v122;
    v121[v122] = (void *)v29;
    argumentPointers[v122] = &v121[v122];
    uint64_t v5 = v119;
    goto LABEL_137;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  return 1;
}

- (void)setCurrentContext:(unint64_t)a3
{
  self->_ctxID = a3;
}

+ (CGSize)shrinkSourceSize:(CGSize)a3 toDestSize:(CGSize)a4
{
  double v4 = a4.width / a3.width;
  double v5 = a4.height / a3.height;
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v5 < 1.0 || v4 < 1.0) {
    double v8 = v6;
  }
  else {
    double v8 = 1.0;
  }
  double v9 = a3.width * v8;
  double v10 = a3.height * v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (DYCaptureStore)captureStore
{
  return self->_captureStore;
}

- (unint64_t)ctxID
{
  return self->_ctxID;
}

- (CoreFunction)function
{
  return self->_function;
}

- (DYPlaybackEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  self->_engine = (DYPlaybackEngine *)a3;
}

- (BOOL)skipOptionalFunctions
{
  return self->_skipOptionalFunctions;
}

- (void)setSkipOptionalFunctions:(BOOL)a3
{
  self->_skipOptionalFunctions = a3;
}

- (unsigned)frameCounter
{
  return self->_frameCounter;
}

- (void)setFrameCounter:(unsigned int)a3
{
  self->_frameCounter = a3;
}

- (BOOL)mainExecutionMode
{
  return self->_mainExecutionMode;
}

- (unsigned)currentFileFunctionIndex
{
  return self->_currentFileFunctionIndex;
}

- (unsigned)currentExecutionModeFunctionIndex
{
  return self->_currentExecutionModeFunctionIndex;
}

- (void).cxx_destruct
{
  for (unint64_t i = 0; i != -384; i -= 24)
  {
    begin = self->_argumentStorePositions[i / 0x18 + 15].__begin_;
    if (begin)
    {
      self->_argumentStorePositions[i / 0x18 + 15].__end_ = begin;
      operator delete(begin);
    }
  }
  for (unint64_t j = 0; j != -384; j -= 24)
  {
    double v6 = &self->_argumentURLs[j / 0x18 + 15];
    std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v6);
  }
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&self->_dataSizeMap);
  GPUTools::Playback::SequenceCache::~SequenceCache((GPUTools::Playback::SequenceCache *)&self->_functionIndexSequence);
  GPUTools::Playback::MemoryManager::~MemoryManager((GPUTools::Playback::MemoryManager *)&self->_memoryManager);
}

- (id).cxx_construct
{
  GPUTools::Playback::MemoryManager::MemoryManager((GPUTools::Playback::MemoryManager *)&self->_memoryManager, 16, v2);
  GPUTools::Playback::SequenceCache::SequenceCache((GPUTools::Playback::SequenceCache *)&self->_functionIndexSequence);
  self->_dataSizeMap.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_dataSizeMap.__table_.__p1_.__value_.__next_ = 0u;
  self->_dataSizeMap.__table_.__p3_.__value_ = 1.0;
  *(_OWORD *)&self->_argumentURLs[0].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[0].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[1].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[2].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[2].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[3].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[4].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[4].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[5].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[6].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[6].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[7].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[8].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[8].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[9].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[10].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[10].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[11].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[12].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[12].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[13].__end_ = 0u;
  *(_OWORD *)&self->_argumentURLs[14].__begin_ = 0u;
  *(_OWORD *)&self->_argumentURLs[14].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentURLs[15].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[15].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[14].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[14].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[13].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[12].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[12].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[11].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[10].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[10].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[9].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[8].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[8].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[7].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[6].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[6].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[5].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[4].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[4].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[3].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[2].__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[1].__end_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[2].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[0].__begin_ = 0u;
  *(_OWORD *)&self->_argumentStorePositions[0].__end_cap_.__value_ = 0u;
  return self;
}

@end