@interface DYGLFunctionPlayer
- (BOOL)recreateContexts;
- (DYGLCaptureSessionInfo)captureSessionInfo;
- (DYGLFunctionPlayer)initWithCaptureStore:(id)a3;
- (EAGLContext)context;
- (NSMutableDictionary)contextDictionary;
- (__GLIContextRec)gliContext;
- (__GLIFunctionDispatchRec)gliDispatch;
- (id).cxx_construct;
- (id)contextForContextIdentifier:(unint64_t)a3;
- (void)_dispatchGLFunction;
- (void)currentContextInfo;
- (void)dealloc;
- (void)deleteCurrentContext;
- (void)executeGraphicsFunction;
- (void)executePlatformFunction;
- (void)newContextInfo;
- (void)setCurrentContext:(unint64_t)a3;
- (void)setRecreateContexts:(BOOL)a3;
- (void)updateCurrentStateWithNewContext:(id)a3 contextID:(unint64_t)a4 sharegroupID:(unint64_t)a5;
@end

@implementation DYGLFunctionPlayer

- (DYGLFunctionPlayer)initWithCaptureStore:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYGLFunctionPlayer;
  v3 = [(DYFunctionPlayer *)&v5 initWithCaptureStore:a3];
  if (v3)
  {
    v3->_captureSessionInfo = [[DYGLCaptureSessionInfo alloc] initWithCaptureStore:[(DYFunctionPlayer *)v3 captureStore]];
    v3->_sharegroupMap = (DYIntKeyedDictionary *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYGLFunctionPlayer;
  [(DYFunctionPlayer *)&v3 dealloc];
}

- (void)newContextInfo
{
  return 0;
}

- (void)updateCurrentStateWithNewContext:(id)a3 contextID:(unint64_t)a4 sharegroupID:(unint64_t)a5
{
  unint64_t v31 = a4;
  if (!a4) {
    __assert_rtn("-[DYGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:]", (const char *)&unk_24F5A48FF, 0, "contextID != 0ull");
  }
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F980]) = (Class)a4;
  self->_ctx = (EAGLContext *)objc_msgSend(a3, "dy_platformContext");
  self->_gli_ctx = (__GLIContextRec *)GLIContextFromEAGLContext();
  self->_disp = (__GLIFunctionDispatchRec *)GLCFrontDispatch();
  v9 = [(DYGLFunctionPlayer *)self newContextInfo];
  id v10 = a3;
  id v11 = (id)v9[9];
  if (v11 != v10)
  {

    v9[9] = v10;
    id v10 = 0;
  }

  v9[11] = a5;
  self->_currentContextInfo = v9;
  p_contextInfoMap = &self->_contextInfoMap;
  unint64_t value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v15 = a4;
      if (value <= a4) {
        unint64_t v15 = a4 % value;
      }
    }
    else
    {
      unint64_t v15 = (value - 1) & a4;
    }
    v16 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[v15];
    if (v16)
    {
      v17 = (void *)*v16;
      if (v17)
      {
        if (v14.u32[0] < 2uLL)
        {
          unint64_t v18 = value - 1;
          while (1)
          {
            uint64_t v20 = v17[1];
            if (v20 == a4)
            {
              if (v17[2] == a4) {
                goto LABEL_32;
              }
            }
            else if ((v20 & v18) != v15)
            {
              goto LABEL_24;
            }
            v17 = (void *)*v17;
            if (!v17) {
              goto LABEL_24;
            }
          }
        }
        do
        {
          unint64_t v19 = v17[1];
          if (v19 == a4)
          {
            if (v17[2] == a4) {
LABEL_32:
            }
              __assert_rtn("-[DYGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:]", (const char *)&unk_24F5A48FF, 0, "_contextInfoMap.find(contextID) == _contextInfoMap.end()");
          }
          else
          {
            if (v19 >= value) {
              v19 %= value;
            }
            if (v19 != v15) {
              break;
            }
          }
          v17 = (void *)*v17;
        }
        while (v17);
      }
    }
  }
LABEL_24:
  v30 = v9;
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>((uint64_t)p_contextInfoMap, &v31, (uint64_t *)&v31, (uint64_t *)&v30);
  uint64_t v21 = (uint64_t)v30;
  v30 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  v22 = (NSMutableDictionary *)objc_opt_new();
  self->_ctx_dict = v22;
  v23 = (NSMutableDictionary *)v9[10];
  if (v23 != v22)
  {

    v9[10] = v22;
    v22 = 0;
  }

  v24 = (NSMutableDictionary *)[(DYIntKeyedDictionary *)self->_sharegroupMap objectForIntKey:a5];
  self->_sharegroup_dict = v24;
  if (v24)
  {
    int v25 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v24, "objectForKey:", @"ref_count"), "unsignedIntValue");
    v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:(v25 + 1)];
    [(NSMutableDictionary *)self->_sharegroup_dict setObject:v26 forKey:@"ref_count"];
  }
  else
  {
    v27 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:1];
    id v28 = objc_alloc(MEMORY[0x263EFF9A0]);
    v29 = (NSMutableDictionary *)objc_msgSend(v28, "initWithObjectsAndKeys:", v27, @"ref_count", 0, v30, v31);
    self->_sharegroup_dict = v29;
    [(DYIntKeyedDictionary *)self->_sharegroupMap setObject:v29 forIntKey:a5];

    [(DYGLFunctionPlayer *)self initializeNewSharegroupInfoDictionary];
  }
}

- (void)setCurrentContext:(unint64_t)a3
{
  uint64_t v4 = (int)*MEMORY[0x263F3F980];
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)a3;
  if (a3)
  {
    unint64_t value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (!value) {
      goto LABEL_29;
    }
    uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v7 = a3;
      if (value <= a3) {
        unint64_t v7 = a3 % value;
      }
    }
    else
    {
      unint64_t v7 = (value - 1) & a3;
    }
    v8 = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value_[v7];
    if (!v8 || (v9 = (void *)*v8) == 0) {
LABEL_29:
    }
      __assert_rtn("-[DYGLFunctionPlayer setCurrentContext:]", (const char *)&unk_24F5A48FF, 0, "iter != _contextInfoMap.end()");
    if (v6.u32[0] < 2uLL)
    {
      unint64_t v10 = value - 1;
      while (1)
      {
        uint64_t v12 = v9[1];
        if (v12 == a3)
        {
          if (v9[2] == a3) {
            goto LABEL_22;
          }
        }
        else if ((v12 & v10) != v7)
        {
          goto LABEL_29;
        }
        v9 = (void *)*v9;
        if (!v9) {
          goto LABEL_29;
        }
      }
    }
    while (1)
    {
      unint64_t v11 = v9[1];
      if (v11 == a3)
      {
        if (v9[2] == a3)
        {
LABEL_22:
          v13 = (NSMutableDictionary **)v9[3];
          self->_currentContextInfo = v13;
          if (!v13) {
            __assert_rtn("-[DYGLFunctionPlayer setCurrentContext:]", (const char *)&unk_24F5A48FF, 0, "_currentContextInfo");
          }
          self->_ctx_dict = v13[10];
          self->_sharegroup_dict = (NSMutableDictionary *)[(DYIntKeyedDictionary *)self->_sharegroupMap objectForIntKey:*((void *)self->_currentContextInfo + 11)];
          uint8x8_t v14 = (EAGLContext *)objc_msgSend(*((id *)self->_currentContextInfo + 9), "dy_platformContext");
          self->_ctx = v14;
          if (v14)
          {
            self->_gli_ctx = (__GLIContextRec *)GLIContextFromEAGLContext();
            unint64_t v15 = (__GLIFunctionDispatchRec *)GLCFrontDispatch();
            goto LABEL_25;
          }
          return;
        }
      }
      else
      {
        if (v11 >= value) {
          v11 %= value;
        }
        if (v11 != v7) {
          goto LABEL_29;
        }
      }
      v9 = (void *)*v9;
      if (!v9) {
        goto LABEL_29;
      }
    }
  }
  unint64_t v15 = 0;
  self->_currentContextInfo = 0;
  *(Class *)((char *)&self->super.super.isa + v4) = 0;
  self->_ctx = 0;
  self->_ctx_dict = 0;
  self->_sharegroup_dict = 0;
  self->_gli_ctx = 0;
LABEL_25:
  self->_disp = v15;
}

- (void)deleteCurrentContext
{
  int v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_sharegroup_dict, "objectForKey:", @"ref_count"), "unsignedIntValue");
  if (v3 == 1)
  {
    [(DYIntKeyedDictionary *)self->_sharegroupMap removeObjectForIntKey:*((void *)self->_currentContextInfo + 11)];
  }
  else
  {
    uint64_t v4 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:(v3 - 1)];
    [(NSMutableDictionary *)self->_sharegroup_dict setObject:v4 forKey:@"ref_count"];
  }
  p_contextInfoMap = &self->_contextInfoMap;
  uint64_t v6 = (int)*MEMORY[0x263F3F980];
  unint64_t v7 = *(unint64_t *)((char *)&self->super.super.isa + v6);
  unint64_t value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if ((value & (value - 1)) != 0)
  {
    unint64_t v10 = *(unint64_t *)((char *)&self->super.super.isa + v6);
    if (v7 >= value) {
      unint64_t v10 = v7 % value;
    }
    v9 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[v10];
    do
    {
      do
        v9 = (void *)*v9;
      while (v9[1] != v7);
    }
    while (v9[2] != v7);
  }
  else
  {
    v9 = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_[(value - 1) & v7];
    do
    {
      do
        v9 = (void *)*v9;
      while (v9[1] != v7);
    }
    while (v9[2] != v7);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::unique_ptr<GPUTools::Playback::GL::ContextInfo>>>>::remove(p_contextInfoMap, v9, (uint64_t)&__p);
  unint64_t v11 = __p;
  __p = 0;
  if (v11)
  {
    if (v14)
    {
      uint64_t v12 = v11[3];
      v11[3] = 0;
      if (v12) {
        (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
      }
    }
    operator delete(v11);
  }
  self->_currentContextInfo = 0;
  *(Class *)((char *)&self->super.super.isa + v6) = 0;
  self->_ctx = 0;
  self->_ctx_dict = 0;
  self->_sharegroup_dict = 0;
  self->_gli_ctx = 0;
  self->_disp = 0;
}

- (id)contextForContextIdentifier:(unint64_t)a3
{
  unint64_t value = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    goto LABEL_24;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = a3;
    if (value <= a3) {
      unint64_t v5 = a3 % value;
    }
  }
  else
  {
    unint64_t v5 = (value - 1) & a3;
  }
  uint64_t v6 = self->_contextInfoMap.__table_.__bucket_list_.__ptr_.__value_[v5];
  if (!v6 || (unint64_t v7 = (void *)*v6) == 0) {
LABEL_24:
  }
    __assert_rtn("-[DYGLFunctionPlayer contextForContextIdentifier:]", (const char *)&unk_24F5A48FF, 0, "iter != _contextInfoMap.end()");
  if (v4.u32[0] < 2uLL)
  {
    unint64_t v8 = value - 1;
    while (1)
    {
      uint64_t v10 = v7[1];
      if (v10 == a3)
      {
        if (v7[2] == a3) {
          goto LABEL_21;
        }
      }
      else if ((v10 & v8) != v5)
      {
        goto LABEL_24;
      }
      unint64_t v7 = (void *)*v7;
      if (!v7) {
        goto LABEL_24;
      }
    }
  }
  while (1)
  {
    unint64_t v9 = v7[1];
    if (v9 == a3) {
      break;
    }
    if (v9 >= value) {
      v9 %= value;
    }
    if (v9 != v5) {
      goto LABEL_24;
    }
LABEL_11:
    unint64_t v7 = (void *)*v7;
    if (!v7) {
      goto LABEL_24;
    }
  }
  if (v7[2] != a3) {
    goto LABEL_11;
  }
LABEL_21:
  unint64_t v11 = *(void **)(v7[3] + 72);
  return (id)objc_msgSend(v11, "dy_platformContext");
}

- (void)_dispatchGLFunction
{
  uint64_t v3 = (int)*MEMORY[0x263F3F9A8];
  [(DYFunctionPlayer *)self processArguments];
  uint64_t v4 = (int)*MEMORY[0x263F3F9B0];
  dy_dispatch();
  if (((*(_WORD **)((char *)&self->super.super.isa + v3))[23] & 0x10) != 0)
  {
    id v5 = (id)[[NSString alloc] initWithCString:(*(void **)((char *)&self->super.super.isa + v3))[3] encoding:1];
    NSMapInsert(*(NSMapTable **)((char *)&self->super.super.isa + (int)*MEMORY[0x263F3F9B8]), v5, **(const void ***)((char *)&self->super.super.isa + v4));
  }
}

- (void)executeGraphicsFunction
{
  if ([(DYFunctionPlayer *)self shouldExecuteGraphicsFunction])
  {
    [(DYGLFunctionPlayer *)self _dispatchGLFunction];
    if (*((unsigned char *)self->_currentContextInfo + 96))
    {
      BOOL v3 = 0;
      uint64_t v4 = self;
    }
    else
    {
      BOOL v3 = ((unsigned int (*)(__GLIContextRec *))self->_disp->get_error)(self->_gli_ctx) != 0;
      uint64_t v4 = self;
    }
    [(DYGLFunctionPlayer *)v4 performPostGraphicsFunctionDispatchActions:v3];
  }
}

- (void)executePlatformFunction
{
  uint64_t v2 = (int)*MEMORY[0x263F3F9A8];
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + v2);
  uint64_t v4 = v3 + 48;
  switch(*(_DWORD *)v3)
  {
    case 0xFFFFD009:
      uint64_t v6 = **(unsigned int **)(v3 + 72);
      disp = self->_disp;
      *(void *)&long long v48 = 0;
      ((void (*)(__GLIContextRec *, uint64_t, uint64_t, long long *))disp->get_buffer_pointerv)(self->_gli_ctx, v6, 35005, &v48);
      __int16 v8 = *(_WORD *)(v3 + 118);
      if ((v8 & 0x28) != 0)
      {
        unint64_t v9 = [(DYFunctionPlayer *)self captureStore];
        uint64_t v10 = *(void **)(v3 + 96);
        if ((v8 & 8) != 0) {
          [(DYCaptureStore *)v9 readDataForFilenameBuffer:v10 buffer:**(void **)(v3 + 120) + (void)v48 size:**(void **)(v3 + 144) error:0];
        }
        else {
          [(DYCaptureStore *)v9 readDataForFilePosition:*v10 buffer:**(void **)(v3 + 120) + (void)v48 size:**(void **)(v3 + 144) error:0];
        }
      }
      else
      {
        memcpy((void *)(**(void **)(v3 + 120) + v48), *(const void **)(v3 + 96), **(void **)(v3 + 144));
      }
      return;
    case 0xFFFFD00B:
      currentContextInfo = self->_currentContextInfo;
      currentContextInfo[8] = **(void **)(v3 + 96);
      __int16 v12 = *(_WORD *)(v3 + 94);
      if ((v12 & 0x28) == 0)
      {
        currentContextInfo[7] = *(void *)(v3 + 72);
        return;
      }
      currentContextInfo[7] = 0;
      v13 = [(DYFunctionPlayer *)self captureStore];
      char v14 = *(void **)(v3 + 72);
      if ((v12 & 8) != 0)
      {
        [(DYCaptureStore *)v13 getInfo:&v48 forFilenameBuffer:v14 error:0];
        uint64_t v15 = DWORD1(v49);
        unint64_t v16 = (DWORD1(v49) + 15) & 0x1FFFFFFF0;
        uint64_t v17 = currentContextInfo[6];
        if (v17) {
          goto LABEL_8;
        }
LABEL_26:
        operator new();
      }
      [(DYCaptureStore *)v13 getInfo:&v48 forFilePosition:*v14 error:0];
      uint64_t v15 = DWORD1(v49);
      unint64_t v16 = (DWORD1(v49) + 15) & 0x1FFFFFFF0;
      uint64_t v17 = currentContextInfo[6];
      if (!v17) {
        goto LABEL_26;
      }
LABEL_8:
      unint64_t v18 = *(void **)(*(void *)(currentContextInfo[2]
                                   + (((unint64_t)(v17 + currentContextInfo[5] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * ((v17 + currentContextInfo[5] - 1) & 0x1FF));
      if (v18[1] - v18[4] < v16) {
        operator new();
      }
      v44 = *(void **)(*(void *)(currentContextInfo[2]
                                   + (((unint64_t)(v17 + currentContextInfo[5] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * ((v17 + currentContextInfo[5] - 1) & 0x1FF));
      uint64_t v51 = 0;
      v45 = [(DYFunctionPlayer *)self captureStore];
      if ([(DYCaptureStore *)v45 readDataForFilePosition:(void)v48 buffer:v44[4] + *v44 size:v15 error:&v51] == -1)
      {
        _DYOLog();
      }
      else
      {
        uint64_t v46 = v18[4];
        uint64_t v47 = ((v16 + v18[5] - 1) & -v18[5]) + v46;
        v18[3] = v46;
        v18[4] = v47;
      }
      return;
    case 0xFFFFD00C:
      unsigned int v19 = *(unsigned __int16 *)(v3 + 10);
      uint64_t v20 = v4 + 24 * *(unsigned __int16 *)(v3 + 10);
      int v21 = **(_DWORD **)(v20 - 24);
      v22 = *(uint64_t **)(v20 - 48);
      uint64_t v23 = *v22;
      v24 = self->_currentContextInfo;
      uint64_t v25 = v24[7];
      if (!v25)
      {
        unint64_t v26 = v24[6] + v24[5] - 1;
        v27 = *(void **)(*(void *)(v24[2] + ((v26 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v26 & 0x1FF));
        uint64_t v25 = v27[3] + *v27;
      }
      int v28 = *(_DWORD *)(v20 - 36);
      uint64_t *v22 = v23 - v24[8] + v25;
      *(_DWORD *)(v4 + 24 * v19 - 36) = 13;
      *(_DWORD *)uint64_t v3 = v21;
      *(_WORD *)(v3 + 10) = v19 - 1;
      if ([(DYFunctionPlayer *)self shouldExecuteGraphicsFunction]) {
        [(DYGLFunctionPlayer *)self executeGraphicsFunction];
      }
      uint64_t v29 = *(uint64_t *)((char *)&self->super.super.isa + v2);
      *(_DWORD *)uint64_t v29 = -12276;
      unsigned __int16 v30 = *(_WORD *)(v29 + 10) + 1;
      *(_WORD *)(v29 + 10) = v30;
      uint64_t v31 = v4 + 24 * v30;
      **(void **)(v31 - 48) = v23;
      *(_DWORD *)(v31 - 36) = v28;
      return;
    case 0xFFFFD00D:
      v32 = self->_currentContextInfo;
      uint64_t v33 = v32[6];
      if (v33)
      {
        unint64_t v34 = v33 + v32[5] - 1;
        uint64_t v35 = *(void *)(v32[2] + ((v34 >> 6) & 0x3FFFFFFFFFFFFF8));
        uint64_t v36 = 8 * (v34 & 0x1FF);
        v37 = *(void **)(v35 + v36);
        *(void *)(v35 + v36) = 0;
        uint64_t v38 = ((*v37 + v37[5] - 1) & -v37[5]) - *v37;
        v37[3] = v38;
        v37[4] = v38;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v48 = 0u;
        std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__move_assign(v32 + 1, (uint64_t)&v48);
        std::deque<std::unique_ptr<GPUTools::VMBuffer>>::~deque[abi:ne180100]((uint64_t)&v48);
        uint64_t v39 = v32[3];
        uint64_t v40 = v32[2];
        *(void *)&long long v48 = v37;
        if (v39 == v40) {
          uint64_t v41 = 0;
        }
        else {
          uint64_t v41 = ((v39 - v40) << 6) - 1;
        }
        uint64_t v42 = v32[6];
        unint64_t v43 = v42 + v32[5];
        if (v41 == v43)
        {
          std::deque<std::unique_ptr<GPUTools::VMBuffer>>::__add_back_capacity((uint64_t)(v32 + 1));
          uint64_t v40 = v32[2];
          uint64_t v42 = v32[6];
          unint64_t v43 = v32[5] + v42;
        }
        *(void *)(*(void *)(v40 + ((v43 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v43 & 0x1FF)) = v37;
        v32[6] = v42 + 1;
      }
      return;
    default:
      return;
  }
}

- (DYGLCaptureSessionInfo)captureSessionInfo
{
  return self->_captureSessionInfo;
}

- (EAGLContext)context
{
  return self->_ctx;
}

- (NSMutableDictionary)contextDictionary
{
  return self->_ctx_dict;
}

- (__GLIContextRec)gliContext
{
  return self->_gli_ctx;
}

- (__GLIFunctionDispatchRec)gliDispatch
{
  return self->_disp;
}

- (BOOL)recreateContexts
{
  return self->_recreateContexts;
}

- (void)setRecreateContexts:(BOOL)a3
{
  self->_recreateContexts = a3;
}

- (void)currentContextInfo
{
  return self->_currentContextInfo;
}

- (void).cxx_destruct
{
  p_contextInfoMap = &self->_contextInfoMap;
  next = self->_contextInfoMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      id v5 = (void *)*next;
      uint64_t v6 = next[3];
      next[3] = 0;
      if (v6) {
        (*(void (**)(uint64_t, SEL))(*(void *)v6 + 8))(v6, a2);
      }
      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  unint64_t value = p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_;
  p_contextInfoMap->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 86) = 0u;
  *((_OWORD *)self + 87) = 0u;
  *((_DWORD *)self + 352) = 1065353216;
  return self;
}

- (uint64_t)updateCurrentStateWithNewContext:(uint64_t)a1 contextID:sharegroupID:.cold.1(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

@end