@interface ASDDSPGraphBox
- (ASDDSPGraphBox)init;
- (ASDDSPGraphBox)initWithBox:(void *)a3 fromGraph:(shared_ptr<DSPGraph::Graph>)a4;
- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6;
- (BOOL)getParameterInfo:(AudioUnitParameterInfo *)a3 forID:(unsigned int)a4 inScope:(unsigned int)a5;
- (BOOL)getParameterList:(unsigned int *)a3 numParameterIDs:(int64_t *)a4 inScope:(unsigned int)a5;
- (BOOL)hasParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5;
- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 bufferOffset:(int64_t)a7;
- (BOOL)startInjectingPort:(int64_t)a3 toFile:(id)a4 shouldLoop:(BOOL)a5;
- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4;
- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4 withAudioCapturerOptions:(unint64_t)a5;
- (BOOL)stopInjectingPort:(int64_t)a3;
- (BOOL)stopRecordingPort:(int64_t)a3;
- (NSString)name;
- (id).cxx_construct;
- (int64_t)numInputs;
- (int64_t)numOutputs;
- (void)box;
@end

@implementation ASDDSPGraphBox

- (ASDDSPGraphBox)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = [NSString stringWithUTF8String:"-[ASDDSPGraphBox init]"];
  [v3 raise:*MEMORY[0x263EFF4A0], @"Do not call %@", v4 format];

  return 0;
}

- (ASDDSPGraphBox)initWithBox:(void *)a3 fromGraph:(shared_ptr<DSPGraph::Graph>)a4
{
  ptr = a4.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)ASDDSPGraphBox;
  v7 = [(ASDDSPGraphBox *)&v14 init];
  if (v7)
  {
    if (!a3)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, v7, @"ASDDSPGraphBox.mm", 35, @"Invalid parameter not satisfying: %@", @"box" object file lineNumber description];
    }
    if (!*(void *)ptr)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2, v7, @"ASDDSPGraphBox.mm", 36, @"Invalid parameter not satisfying: %@", @"graph" object file lineNumber description];
    }
    v7->_box = a3;
    v9 = *(Graph **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->_graph.__cntrl_;
    v7->_graph.__ptr_ = v9;
    v7->_graph.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v7;
}

- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__ASDDSPGraphBox_startRecordingPort_toFile___block_invoke;
  v9[3] = &unk_264772EA0;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a3;
  v12 = &unk_26D96F928;
  char v13 = 0;
  objc_super v14 = &v12;
  id v7 = v6;
  LOBYTE(self) = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v12);

  return (char)self;
}

uint64_t __44__ASDDSPGraphBox_startRecordingPort_toFile___block_invoke(uint64_t a1)
{
  (*(void (**)(void, uint64_t, void, uint64_t, void, uint64_t))(**(void **)(*(void *)(a1 + 32) + 8)
                                                                            + 152))(*(void *)(*(void *)(a1 + 32) + 8), [*(id *)(a1 + 40) UTF8String], *(unsigned int *)(a1 + 48), 1, 0, 4130);
  return 1;
}

- (BOOL)startRecordingPort:(int64_t)a3 toFile:(id)a4 withAudioCapturerOptions:(unint64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__ASDDSPGraphBox_startRecordingPort_toFile_withAudioCapturerOptions___block_invoke;
  v11[3] = &unk_264773248;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a3;
  unint64_t v14 = a5;
  uint64_t v15 = &unk_26D96F928;
  char v16 = 0;
  v17 = &v15;
  id v9 = v8;
  LOBYTE(a3) = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v11);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v15);

  return a3;
}

uint64_t __69__ASDDSPGraphBox_startRecordingPort_toFile_withAudioCapturerOptions___block_invoke(uint64_t a1)
{
  (*(void (**)(void, uint64_t, void, uint64_t, void, void))(**(void **)(*(void *)(a1 + 32) + 8)
                                                                           + 152))(*(void *)(*(void *)(a1 + 32) + 8), [*(id *)(a1 + 40) UTF8String], *(unsigned int *)(a1 + 48), 1, 0, *(void *)(a1 + 56));
  return 1;
}

- (BOOL)stopRecordingPort:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ASDDSPGraphBox_stopRecordingPort___block_invoke;
  v5[3] = &unk_264773270;
  v5[4] = self;
  v5[5] = a3;
  id v6 = &unk_26D96F928;
  char v7 = 0;
  id v8 = &v6;
  char v3 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v5);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v6);
  return v3;
}

uint64_t __36__ASDDSPGraphBox_stopRecordingPort___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)startInjectingPort:(int64_t)a3 toFile:(id)a4 shouldLoop:(BOOL)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__ASDDSPGraphBox_startInjectingPort_toFile_shouldLoop___block_invoke;
  v11[3] = &unk_264773298;
  v11[4] = self;
  id v12 = v8;
  int64_t v13 = a3;
  BOOL v14 = a5;
  uint64_t v15 = &unk_26D96F928;
  char v16 = 0;
  v17 = &v15;
  id v9 = v8;
  LOBYTE(a3) = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v11);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v15);

  return a3;
}

uint64_t __55__ASDDSPGraphBox_startInjectingPort_toFile_shouldLoop___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)stopInjectingPort:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ASDDSPGraphBox_stopInjectingPort___block_invoke;
  v5[3] = &unk_264773270;
  v5[4] = self;
  v5[5] = a3;
  id v6 = &unk_26D96F928;
  char v7 = 0;
  id v8 = &v6;
  char v3 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v5);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v6);
  return v3;
}

uint64_t __36__ASDDSPGraphBox_stopInjectingPort___block_invoke(uint64_t a1)
{
  return 1;
}

- (NSString)name
{
  box = (char *)self->_box;
  char v3 = box + 32;
  if (box[55] < 0) {
    char v3 = (void *)*v3;
  }
  return (NSString *)[NSString stringWithUTF8String:v3];
}

- (int64_t)numInputs
{
  return ((*((void *)self->_box + 9) - *((void *)self->_box + 8)) >> 5);
}

- (int64_t)numOutputs
{
  return ((*((void *)self->_box + 12) - *((void *)self->_box + 11)) >> 5);
}

- (BOOL)getParameterList:(unsigned int *)a3 numParameterIDs:(int64_t *)a4 inScope:(unsigned int)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__ASDDSPGraphBox_getParameterList_numParameterIDs_inScope___block_invoke;
  v7[3] = &unk_264772EC8;
  unsigned int v8 = a5;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  uint64_t v9 = &unk_26D96F928;
  char v10 = 0;
  int64_t v11 = &v9;
  char v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v9);
  return v5;
}

uint64_t __59__ASDDSPGraphBox_getParameterList_numParameterIDs_inScope___block_invoke(uint64_t a1)
{
  (*(void (**)(void **__return_ptr))(**(void **)(*(void *)(a1 + 32) + 8) + 96))(&v7);
  v2 = v7;
  char v3 = v8;
  size_t v4 = (unsigned char *)v8 - (unsigned char *)v7;
  **(void **)(a1 + 40) = ((unsigned char *)v8 - (unsigned char *)v7) >> 2;
  char v5 = *(void **)(a1 + 48);
  if (v5 && v3 != v2)
  {
    memmove(v5, v2, v4);
    v2 = v7;
  }
  if (v2)
  {
    unsigned int v8 = v2;
    operator delete(v2);
  }
  return 1;
}

- (BOOL)getParameterInfo:(AudioUnitParameterInfo *)a3 forID:(unsigned int)a4 inScope:(unsigned int)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  (*(void (**)(_OWORD *__return_ptr))(*(void *)self->_box + 104))(v11);
  int v6 = v13;
  if (v13)
  {
    long long v7 = v11[5];
    *(_OWORD *)&a3->clumpID = v11[4];
    *(_OWORD *)&a3->unit = v7;
    *(void *)&a3->flags = v12;
    long long v8 = v11[1];
    *(_OWORD *)a3->name = v11[0];
    *(_OWORD *)&a3->name[16] = v8;
    long long v9 = v11[3];
    *(_OWORD *)&a3->name[32] = v11[2];
    *(_OWORD *)&a3->name[48] = v9;
  }
  return v6 != 0;
}

- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__ASDDSPGraphBox_getParameter_forID_scope_element___block_invoke;
  v8[3] = &unk_264772EC8;
  v8[4] = self;
  v8[5] = a3;
  unsigned int v9 = a4;
  unsigned int v10 = a5;
  unsigned int v11 = a6;
  uint64_t v12 = &unk_26D96F928;
  char v13 = 0;
  uint64_t v14 = &v12;
  char v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v12);
  return v6;
}

uint64_t __51__ASDDSPGraphBox_getParameter_forID_scope_element___block_invoke(uint64_t a1)
{
  **(float **)(a1 + 40) = (*(float (**)(void, void, void, void))(**(void **)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                  + 88))(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  return 1;
}

- (BOOL)hasParameter:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__ASDDSPGraphBox_hasParameter_scope_element___block_invoke;
  v7[3] = &unk_264773270;
  v7[4] = self;
  unsigned int v8 = a4;
  unsigned int v9 = a3;
  unsigned int v10 = &unk_26D96F928;
  char v11 = 0;
  uint64_t v12 = &v10;
  char v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v10);
  return v5;
}

BOOL __45__ASDDSPGraphBox_hasParameter_scope_element___block_invoke(uint64_t a1)
{
  (*(void (**)(_DWORD **__return_ptr))(**(void **)(*(void *)(a1 + 32) + 8) + 96))(&v5);
  v2 = v6;
  char v3 = v5;
  if (v5 != v6)
  {
    char v3 = v5;
    while (*v3 != *(_DWORD *)(a1 + 44))
    {
      if (++v3 == v6)
      {
        char v3 = v6;
        break;
      }
    }
  }
  if (v5)
  {
    char v6 = v5;
    operator delete(v5);
  }
  return v3 != v2;
}

- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 bufferOffset:(int64_t)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__ASDDSPGraphBox_setParameter_forID_scope_element_bufferOffset___block_invoke;
  v9[3] = &unk_2647732C0;
  unsigned int v10 = a4;
  unsigned int v11 = a5;
  unsigned int v12 = a6;
  float v13 = a3;
  v9[4] = self;
  void v9[5] = a7;
  uint64_t v14 = &unk_26D96F928;
  char v15 = 0;
  char v16 = &v14;
  char v7 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v9);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v14);
  return v7;
}

uint64_t __64__ASDDSPGraphBox_setParameter_forID_scope_element_bufferOffset___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void, void, void, float))(**(void **)(*(void *)(a1 + 32) + 8)
                                                                        + 80))(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 40), *(float *)(a1 + 60));
  return 1;
}

- (void)box
{
  return self->_box;
}

- (void).cxx_destruct
{
  cntrl = self->_graph.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end