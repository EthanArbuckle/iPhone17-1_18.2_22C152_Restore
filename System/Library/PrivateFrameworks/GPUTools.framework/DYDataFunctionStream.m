@interface DYDataFunctionStream
- (BOOL)resetToFunction:(const Function *)a3;
- (BOOL)swapsByteOrder;
- (DYDataFunctionStream)init;
- (DYDataFunctionStream)initWithData:(id)a3 error:(id *)a4;
- (DYDataFunctionStream)initWithData:(id)a3 header:(const void *)a4 error:(id *)a5;
- (NSData)data;
- (const)peekFunction;
- (const)readFunction;
- (id).cxx_construct;
- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4;
- (void)clearResetMarker;
- (void)dealloc;
- (void)reset;
- (void)setResetMarker;
@end

@implementation DYDataFunctionStream

- (DYDataFunctionStream)init
{
  return 0;
}

- (DYDataFunctionStream)initWithData:(id)a3 error:(id *)a4
{
  return [(DYDataFunctionStream *)self initWithData:a3 header:0 error:a4];
}

- (DYDataFunctionStream)initWithData:(id)a3 header:(const void *)a4 error:(id *)a5
{
  v15.receiver = self;
  v15.super_class = (Class)DYDataFunctionStream;
  v8 = [(DYDataFunctionStream *)&v15 init];
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::Create((NSData *)a3, a4, a5, v13);
    v9 = (uint64_t *)(v8 + 16);
    long long v10 = *(_OWORD *)v13;
    *(_OWORD *)v13 = 0uLL;
    v11 = (std::__shared_weak_count *)*((void *)v8 + 3);
    *((_OWORD *)v8 + 1) = v10;
    if (v11)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      if (v13[1]) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v13[1]);
      }
    }
    if (*v9)
    {
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v13, *v9, *(void *)(*v9 + 16));
      *(_OWORD *)(v8 + 568) = *(_OWORD *)&v13[67];
      *(_OWORD *)(v8 + 584) = *(_OWORD *)&v13[69];
      v8[600] = v14;
      GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v13);
      *(_OWORD *)(v8 + 1144) = *(_OWORD *)(v8 + 568);
      *(_OWORD *)(v8 + 1160) = *(_OWORD *)(v8 + 584);
      v8[1176] = v8[600];
    }
    else
    {

      return 0;
    }
  }
  return (DYDataFunctionStream *)v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYDataFunctionStream;
  [(DYDataFunctionStream *)&v3 dealloc];
}

- (BOOL)swapsByteOrder
{
  return *(unsigned char *)(*((void *)self + 2) + 36);
}

- (void)reset
{
  *((void *)self + 71) = *((void *)self + 143);
  *((_OWORD *)self + 36) = *((_OWORD *)self + 72);
  *((void *)self + 74) = *((void *)self + 146);
  *((unsigned char *)self + 600) = *((unsigned char *)self + 1176);
}

- (void)setResetMarker
{
  *((void *)self + 143) = *((void *)self + 71);
  *((_OWORD *)self + 72) = *((_OWORD *)self + 36);
  *((void *)self + 146) = *((void *)self + 74);
  *((unsigned char *)self + 1176) = *((unsigned char *)self + 600);
}

- (void)clearResetMarker
{
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v3, *((void *)self + 2), *(void *)(*((void *)self + 2) + 16));
  *((void *)self + 143) = v3[67];
  *((_OWORD *)self + 72) = v4;
  *((void *)self + 146) = v5;
  *((unsigned char *)self + 1176) = v6;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v3);
}

- (BOOL)resetToFunction:(const Function *)a3
{
  uint64_t v4 = *((void *)self + 2);
  unint64_t v5 = *((void *)a3 + 55);
  if (v5 < *(void *)(v4 + 24) && v5 >= *(void *)(v4 + 16)) {
    uint64_t v7 = *((void *)a3 + 55);
  }
  else {
    uint64_t v7 = *(void *)(v4 + 24);
  }
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v10, v4, v7);
  *((void *)self + 71) = v11;
  *((_OWORD *)self + 36) = v12;
  *((void *)self + 74) = v13;
  *((unsigned char *)self + 600) = v14;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v10);
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v10, *((void *)self + 2), *(void *)(*((void *)self + 2) + 24));
  BOOL v8 = *((void *)self + 71) != v11;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v10);
  return v8;
}

- (const)peekFunction
{
  v2 = (char *)self + 32;
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v6, *((void *)self + 2), *(void *)(*((void *)self + 2) + 24));
  uint64_t v3 = *((void *)v2 + 67);
  uint64_t v4 = v6[67];
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v6);
  if (v3 == v4) {
    return 0;
  }
  if (*(_DWORD *)v2 == -1 || *((void *)v2 + 68) == *((void *)v2 + 67)) {
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v2);
  }
  return (const Function *)v2;
}

- (const)readFunction
{
  v2 = (char *)self + 32;
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v6, *((void *)self + 2), *(void *)(*((void *)self + 2) + 24));
  uint64_t v3 = *((void *)v2 + 67);
  uint64_t v4 = v6[67];
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v6);
  if (v3 == v4) {
    return 0;
  }
  if (*(_DWORD *)v2 == -1 || *((void *)v2 + 68) == *((void *)v2 + 67)) {
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v2);
  }
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::operator++((uint64_t)v2);
  return (const Function *)v2;
}

- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4
{
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v11, *((void *)self + 2), *(void *)(*((void *)self + 2) + 24));
  unint64_t v7 = 0;
  if (a4)
  {
    BOOL v8 = (char *)self + 32;
    while (1)
    {
      uint64_t v9 = *((void *)v8 + 67);
      if (v9 == v11[67]) {
        break;
      }
      if (*(_DWORD *)v8 == -1 || *((void *)v8 + 68) == v9) {
        GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v8);
      }
      GPUTools::FD::Function::operator=();
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::operator++((uint64_t)v8);
      ++v7;
      a3 = (Function *)((char *)a3 + 536);
      if (a4 == v7)
      {
        unint64_t v7 = a4;
        break;
      }
    }
  }
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v11);
  return v7;
}

- (NSData)data
{
  return (NSData *)*((void *)self + 1);
}

- (void).cxx_destruct
{
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)((char *)self + 608));
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)((char *)self + 32));
  uint64_t v3 = (std::__shared_weak_count *)*((void *)self + 3);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  uint64_t v3 = GPUTools::FD::Function::Function((GPUTools::FD::Function *)((char *)self + 32));
  *(_OWORD *)(v3 + 536) = 0u;
  *(_OWORD *)(v3 + 552) = 0u;
  uint64_t v4 = GPUTools::FD::Function::Function((GPUTools::FD::Function *)((char *)self + 608));
  *(_OWORD *)(v4 + 536) = 0u;
  *(_OWORD *)(v4 + 552) = 0u;
  return self;
}

@end