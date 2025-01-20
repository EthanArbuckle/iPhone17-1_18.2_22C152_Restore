@interface ASDDSPGraph
- (ASDDSPGraph)init;
- (ASDDSPGraph)initWithDSPGraph:(shared_ptr<DSPGraph::Graph>)a3;
- (BOOL)configure;
- (BOOL)configured;
- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4;
- (BOOL)getProperty:(void *)a3 withSize:(unsigned int *)a4 forID:(unsigned int)a5;
- (BOOL)getPropertySize:(unsigned int *)a3 isWritable:(BOOL *)a4 forID:(unsigned int)a5;
- (BOOL)hasParameter:(unsigned int)a3;
- (BOOL)initialize;
- (BOOL)initialized;
- (BOOL)reset;
- (BOOL)setAUStrip:(id)a3;
- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4;
- (BOOL)setProperty:(const void *)a3 withSize:(unsigned int)a4 forID:(unsigned int)a5;
- (BOOL)setPropertyStrip:(id)a3;
- (BOOL)setVariableSliceDuration:(int64_t)a3 forSampleRate:(int64_t)a4;
- (BOOL)unconfigure;
- (BOOL)uninitialize;
- (NSSet)boxes;
- (NSSet)inputs;
- (NSSet)outputs;
- (NSString)name;
- (id).cxx_construct;
- (id)boxWithName:(id)a3;
- (int64_t)sliceDurationInSamples;
- (shared_ptr<DSPGraph::Graph>)graph;
- (unint64_t)numberOfInputs;
- (unint64_t)numberOfOutputs;
- (void)setName:(id)a3;
@end

@implementation ASDDSPGraph

- (ASDDSPGraph)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = [NSString stringWithUTF8String:"-[ASDDSPGraph init]"];
  [v3 raise:*MEMORY[0x263EFF4A0], @"Do not call %@", v4 format];

  return 0;
}

- (ASDDSPGraph)initWithDSPGraph:(shared_ptr<DSPGraph::Graph>)a3
{
  ptr = a3.__ptr_;
  v11.receiver = self;
  v11.super_class = (Class)ASDDSPGraph;
  v5 = [(ASDDSPGraph *)&v11 init];
  if (v5)
  {
    v6 = *(Graph **)ptr;
    if (!*(void *)ptr)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, v5, @"ASDDSPGraph.mm", 37, @"Invalid parameter not satisfying: %@", @"graph" object file lineNumber description];

      v6 = *(Graph **)ptr;
    }
    uint64_t v7 = *((void *)ptr + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_graph.__cntrl_;
    v5->_graph.__ptr_ = v6;
    v5->_graph.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (BOOL)setVariableSliceDuration:(int64_t)a3 forSampleRate:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__ASDDSPGraph_setVariableSliceDuration_forSampleRate___block_invoke;
  v6[3] = &unk_264772DD8;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  uint64_t v7 = &unk_26D96F928;
  char v8 = 0;
  v9 = &v7;
  char v4 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v7);
  return v4;
}

uint64_t __54__ASDDSPGraph_setVariableSliceDuration_forSampleRate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    [v1 graph];
  }
  else {
    v3 = 0;
  }
  DSPGraph::Graph::setSliceDuration();
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return 1;
}

- (int64_t)sliceDurationInSamples
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__ASDDSPGraph_sliceDurationInSamples__block_invoke;
  v4[3] = &unk_264772E00;
  v4[4] = self;
  v5 = &unk_26D96F970;
  int v6 = 0;
  uint64_t v7 = &v5;
  unsigned int v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __37__ASDDSPGraph_sliceDurationInSamples__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (!v1) {
    return MEMORY[0x2B0];
  }
  [v1 graph];
  uint64_t v2 = *(unsigned int *)(v4 + 688);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (BOOL)configured
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__ASDDSPGraph_configured__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

BOOL __25__ASDDSPGraph_configured__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    int v2 = *(unsigned __int8 *)(v4 + 761);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  else
  {
    int v2 = MEMORY[0x2F9];
  }
  return v2 != 0;
}

- (BOOL)initialized
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__ASDDSPGraph_initialized__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

BOOL __26__ASDDSPGraph_initialized__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    int v2 = *(unsigned __int8 *)(v4 + 762);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  else
  {
    int v2 = MEMORY[0x2FA];
  }
  return v2 != 0;
}

- (BOOL)configure
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __24__ASDDSPGraph_configure__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __24__ASDDSPGraph_configure__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    v1 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  DSPGraph::Graph::configure((DSPGraph::Graph *)v1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

- (BOOL)unconfigure
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__ASDDSPGraph_unconfigure__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __26__ASDDSPGraph_unconfigure__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    v1 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  DSPGraph::Graph::unconfigure((DSPGraph::Graph *)v1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

- (BOOL)initialize
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __25__ASDDSPGraph_initialize__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __25__ASDDSPGraph_initialize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    v1 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  DSPGraph::Graph::initialize((DSPGraph::Graph *)v1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

- (BOOL)uninitialize
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__ASDDSPGraph_uninitialize__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __27__ASDDSPGraph_uninitialize__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    v1 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  DSPGraph::Graph::uninitialize((DSPGraph::Graph *)v1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

- (BOOL)reset
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__ASDDSPGraph_reset__block_invoke;
  v4[3] = &unk_264772E28;
  v4[4] = self;
  v5 = &unk_26D96F928;
  char v6 = 0;
  uint64_t v7 = &v5;
  char v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __20__ASDDSPGraph_reset__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    [v1 graph];
    v1 = v3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  DSPGraph::Graph::reset((DSPGraph::Graph *)v1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

- (BOOL)setAUStrip:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __26__ASDDSPGraph_setAUStrip___block_invoke;
    v8[3] = &unk_264772E50;
    v8[4] = self;
    id v9 = v4;
    uint64_t v10 = &unk_26D96F928;
    char v11 = 0;
    v12 = &v10;
    char v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v8);
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v10);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ASDDSPGraph setAUStrip:]();
    }
    char v6 = 0;
  }

  return v6;
}

BOOL __26__ASDDSPGraph_setAUStrip___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 graph];
    char v2 = v5;
  }
  else
  {
    char v6 = 0;
  }
  int v3 = DSPGraph::Graph::setAUStrip((DSPGraph::Graph *)v2, *(const __CFDictionary **)(a1 + 40));
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v3 == 0;
}

- (BOOL)setPropertyStrip:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__ASDDSPGraph_setPropertyStrip___block_invoke;
    v8[3] = &unk_264772E50;
    v8[4] = self;
    id v9 = v4;
    uint64_t v10 = &unk_26D96F928;
    char v11 = 0;
    v12 = &v10;
    char v6 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v8);
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v10);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ASDDSPGraph setPropertyStrip:]();
    }
    char v6 = 0;
  }

  return v6;
}

uint64_t __32__ASDDSPGraph_setPropertyStrip___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 graph];
    char v2 = v4;
  }
  else
  {
    v5 = 0;
  }
  DSPGraph::Graph::setPropertyStrip((DSPGraph::Graph *)v2, *(const __CFDictionary **)(a1 + 40));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return 1;
}

- (BOOL)getParameter:(float *)a3 forID:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__ASDDSPGraph_getParameter_forID___block_invoke;
  v6[3] = &unk_264772E78;
  v6[4] = self;
  v6[5] = a3;
  unsigned int v7 = a4;
  uint64_t v8 = &unk_26D96F928;
  char v9 = 0;
  uint64_t v10 = &v8;
  char v4 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v8);
  return v4;
}

uint64_t __34__ASDDSPGraph_getParameter_forID___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 graph];
    char v2 = v4;
  }
  else
  {
    v5 = 0;
  }
  **(float **)(a1 + 40) = (*(float (**)(void *, void))(*(void *)v2 + 48))(v2, *(unsigned int *)(a1 + 48));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return 1;
}

- (BOOL)hasParameter:(unsigned int)a3
{
  [(ASDDSPGraph *)self graph];
  char hasParameter = DSPGraph::Graph::hasParameter(v5);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return hasParameter;
}

- (BOOL)setParameter:(float)a3 forID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  LODWORD(v7) = HIBYTE(a4);
  if ((a4 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v7 = 32;
  }
  else {
    uint64_t v7 = v7;
  }
  signed int v8 = (a4 << 8) & 0xFF000000;
  BOOL v9 = v8 == 2130706432 || v8 < 520093697;
  LODWORD(v10) = a4 << 8 >> 24;
  if (v9) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = v10;
  }
  signed int v11 = (a4 << 16) & 0xFF000000;
  BOOL v12 = v11 == 2130706432 || v11 < 520093697;
  LODWORD(v13) = BYTE1(a4);
  if (v12) {
    uint64_t v13 = 32;
  }
  else {
    uint64_t v13 = v13;
  }
  if (a4 << 24 == 2130706432 || (int)(a4 << 24) < 520093697) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = a4;
  }
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v7, v10, v13, v15);
  if ([(ASDDSPGraph *)self hasParameter:v4])
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __34__ASDDSPGraph_setParameter_forID___block_invoke;
    v20[3] = &unk_264772EA0;
    v20[4] = v16;
    v20[5] = self;
    float v21 = a3;
    int v22 = v4;
    *(void *)buf = &unk_26D96F928;
    buf[8] = 0;
    double v27 = COERCE_DOUBLE(buf);
    char v17 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v20);
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](buf);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(ASDDSPGraph *)self name];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = [v19 UTF8String];
      __int16 v24 = 2080;
      uint64_t v25 = [v16 UTF8String];
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DSP graph: %s has no graph level parameter: %s, failed to set value: %f", buf, 0x20u);
    }
    char v17 = 0;
  }

  return v17;
}

uint64_t __34__ASDDSPGraph_setParameter_forID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [*(id *)(a1 + 32) UTF8String];
    id v3 = [*(id *)(a1 + 40) name];
    uint64_t v4 = [v3 UTF8String];
    double v5 = *(float *)(a1 + 48);
    *(_DWORD *)signed int v8 = 136315650;
    *(void *)&v8[4] = v2;
    *(_WORD *)&v8[12] = 2080;
    *(void *)&v8[14] = v4;
    __int16 v9 = 2048;
    double v10 = v5;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting dsp graph level parameter %s on graph: %s to %f", v8, 0x20u);
  }
  char v6 = *(void **)(a1 + 40);
  if (v6)
  {
    [v6 graph];
    char v6 = *(void **)v8;
  }
  else
  {
    *(void *)signed int v8 = 0;
    *(void *)&v8[8] = 0;
  }
  (*(void (**)(void *, void, float))(*(void *)v6 + 40))(v6, *(unsigned int *)(a1 + 52), *(float *)(a1 + 48));
  if (*(void *)&v8[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v8[8]);
  }
  return 1;
}

- (BOOL)getPropertySize:(unsigned int *)a3 isWritable:(BOOL *)a4 forID:(unsigned int)a5
{
  BOOL result = 0;
  if (a3 && a4)
  {
    uint64_t v8 = *(void *)&a5;
    [(ASDDSPGraph *)self graph];
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 64))(v13, v8);
    char v12 = v11;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    if (v12)
    {
      *a3 = v10;
      *a4 = BYTE4(v10);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)getProperty:(void *)a3 withSize:(unsigned int *)a4 forID:(unsigned int)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ASDDSPGraph_getProperty_withSize_forID___block_invoke;
  v7[3] = &unk_264772EC8;
  v7[5] = a4;
  v7[6] = a3;
  v7[4] = self;
  unsigned int v8 = a5;
  __int16 v9 = &unk_26D96F928;
  char v10 = 0;
  char v11 = &v9;
  char v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v9);
  return v5;
}

uint64_t __42__ASDDSPGraph_getProperty_withSize_forID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 graph];
    uint64_t v4 = v6;
    uint64_t v1 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)v4 + 72))(v4, *(unsigned int *)(a1 + 56), v1, v3);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return 1;
}

- (BOOL)setProperty:(const void *)a3 withSize:(unsigned int)a4 forID:(unsigned int)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ASDDSPGraph_setProperty_withSize_forID___block_invoke;
  v7[3] = &unk_264772DD8;
  unsigned int v8 = a5;
  unsigned int v9 = a4;
  v7[4] = self;
  v7[5] = a3;
  char v10 = &unk_26D96F928;
  char v11 = 0;
  uint64_t v12 = &v10;
  char v5 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v7);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v10);
  return v5;
}

uint64_t __42__ASDDSPGraph_setProperty_withSize_forID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 graph];
    uint64_t v2 = v4;
  }
  else
  {
    char v5 = 0;
  }
  (*(void (**)(void *, void, void, void))(*(void *)v2 + 56))(v2, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(void *)(a1 + 40));
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return 1;
}

- (id)boxWithName:(id)a3
{
  v10[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __27__ASDDSPGraph_boxWithName___block_invoke;
  v8[3] = &unk_264772EF0;
  v8[4] = self;
  id v9 = v4;
  v10[0] = &unk_26D96F8E0;
  v10[1] = 0;
  v10[3] = v10;
  id v5 = v4;
  char v6 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v8);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v10);

  return v6;
}

ASDDSPGraphBox *__27__ASDDSPGraph_boxWithName___block_invoke(uint64_t a1)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[*(id *)(a1 + 40) UTF8String]);
  uint64_t v2 = DSPGraph::Graph::box();
  uint64_t v3 = v2;
  if (v13 < 0)
  {
    operator delete(__p);
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    unsigned int v8 = 0;
    goto LABEL_9;
  }
  if (!v2) {
    goto LABEL_8;
  }
LABEL_3:
  id v4 = [ASDDSPGraphBox alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v5 + 8);
  char v6 = *(std::__shared_weak_count **)(v5 + 16);
  uint64_t v10 = v7;
  char v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned int v8 = [(ASDDSPGraphBox *)v4 initWithBox:v3 fromGraph:&v10];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
LABEL_9:
  return v8;
}

- (NSSet)boxes
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__ASDDSPGraph_boxes__block_invoke;
  v4[3] = &unk_264772F18;
  v4[4] = self;
  v5[0] = &unk_26D96F8E0;
  v5[1] = 0;
  v5[3] = v5;
  uint64_t v2 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v5);
  return (NSSet *)v2;
}

id __20__ASDDSPGraph_boxes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  for (i = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24); i; i = (void *)*i)
  {
    id v4 = [ASDDSPGraphBox alloc];
    uint64_t v5 = i[2];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    uint64_t v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v9 = [(ASDDSPGraphBox *)v4 initWithBox:v5 fromGraph:&v11];
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    objc_msgSend(v2, "addObject:", v9, v11);
  }
  return v2;
}

- (NSSet)inputs
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __21__ASDDSPGraph_inputs__block_invoke;
  v4[3] = &unk_264772F18;
  v4[4] = self;
  v5[0] = &unk_26D96F8E0;
  v5[1] = 0;
  v5[3] = v5;
  uint64_t v2 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v5);
  return (NSSet *)v2;
}

id __21__ASDDSPGraph_inputs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  for (unsigned int i = 0; i < DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8)); ++i)
  {
    id v4 = [ASDDSPGraphBox alloc];
    uint64_t v5 = DSPGraph::Graph::in(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    uint64_t v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v9 = [(ASDDSPGraphBox *)v4 initWithBox:v5 fromGraph:&v11];
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    objc_msgSend(v2, "addObject:", v9, v11);
  }
  return v2;
}

- (NSSet)outputs
{
  v5[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __22__ASDDSPGraph_outputs__block_invoke;
  v4[3] = &unk_264772F18;
  v4[4] = self;
  v5[0] = &unk_26D96F8E0;
  v5[1] = 0;
  v5[3] = v5;
  uint64_t v2 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v5);
  return (NSSet *)v2;
}

id __22__ASDDSPGraph_outputs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  for (unsigned int i = 0; i < DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8)); ++i)
  {
    id v4 = [ASDDSPGraphBox alloc];
    uint64_t v5 = DSPGraph::Graph::out(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 8);
    uint64_t v7 = *(std::__shared_weak_count **)(v6 + 16);
    uint64_t v11 = v8;
    uint64_t v12 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v9 = [(ASDDSPGraphBox *)v4 initWithBox:v5 fromGraph:&v11];
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    objc_msgSend(v2, "addObject:", v9, v11);
  }
  return v2;
}

- (NSString)name
{
  ptr = self->_graph.__ptr_;
  uint64_t v3 = (void *)((char *)ptr + 408);
  if (*((char *)ptr + 431) < 0) {
    uint64_t v3 = (void *)*v3;
  }
  return (NSString *)[NSString stringWithUTF8String:v3];
}

- (void)setName:(id)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __23__ASDDSPGraph_setName___block_invoke;
  v6[3] = &unk_264772F40;
  v6[4] = self;
  id v7 = v4;
  v8[0] = &unk_26D96F898;
  v8[3] = v8;
  id v5 = v4;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v6);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v8);
}

void __23__ASDDSPGraph_setName___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) UTF8String];
  JUMPOUT(0x22A63EA80);
}

- (unint64_t)numberOfInputs
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__ASDDSPGraph_numberOfInputs__block_invoke;
  v4[3] = &unk_264772E00;
  v4[4] = self;
  id v5 = &unk_26D96F970;
  int v6 = 0;
  id v7 = &v5;
  unsigned int v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __29__ASDDSPGraph_numberOfInputs__block_invoke(uint64_t a1)
{
  return DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8));
}

- (unint64_t)numberOfOutputs
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__ASDDSPGraph_numberOfOutputs__block_invoke;
  v4[3] = &unk_264772E00;
  v4[4] = self;
  id v5 = &unk_26D96F970;
  int v6 = 0;
  id v7 = &v5;
  unsigned int v2 = ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v5);
  return v2;
}

uint64_t __30__ASDDSPGraph_numberOfOutputs__block_invoke(uint64_t a1)
{
  return DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)(*(void *)(a1 + 32) + 8));
}

- (shared_ptr<DSPGraph::Graph>)graph
{
  cntrl = self->_graph.__cntrl_;
  *unsigned int v2 = self->_graph.__ptr_;
  v2[1] = (Graph *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Graph *)self;
  return result;
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
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)setAUStrip:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AUStrip is nil", v0, 2u);
}

- (void)setPropertyStrip:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "PropertyStrip is nil", v0, 2u);
}

@end