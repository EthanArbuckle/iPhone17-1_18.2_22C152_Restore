@interface GEOZilchDecoderRequest
- (GEOZilchDecoderRequest)initWithDecoder:(id)a3 message:(shared_ptr<zilch::Message>)a4;
- (id).cxx_construct;
- (id)errorHandler;
- (id)pathHandler;
- (void)_finishedDecodingWithPath:(Path<std::shared_ptr<geo::MapEdge>> *)a3;
- (void)cancel;
- (void)decodeWithPathHandler:(id)a3 errorHandler:(id)a4;
- (void)setErrorHandler:(id)a3;
- (void)setPathHandler:(id)a3;
@end

@implementation GEOZilchDecoderRequest

- (GEOZilchDecoderRequest)initWithDecoder:(id)a3 message:(shared_ptr<zilch::Message>)a4
{
  ptr = a4.__ptr_;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOZilchDecoderRequest;
  v7 = [(GEOMapRequest *)&v14 initWithManager:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_decoder, v6);
    v10 = *(Message **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->_message.__cntrl_;
    v8->_message.__ptr_ = v10;
    v8->_message.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__GEOZilchDecoderRequest_initWithDecoder_message___block_invoke;
    v13[3] = &unk_1E53E7840;
    v13[4] = v8;
    MEMORY[0x18C120660](v13);
    operator new();
  }

  return 0;
}

void __50__GEOZilchDecoderRequest_initWithDecoder_message___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(*(void *)(a1 + 32) + 88);
  if (!*v6)
  {
    id v7 = v5;
    objc_storeStrong(v6, a3);
    id v5 = v7;
  }
}

- (void)_finishedDecodingWithPath:(Path<std::shared_ptr<geo::MapEdge>> *)a3
{
  if (a3->var4.var0 != a3->var4.var1)
  {
    id v5 = [(GEOZilchDecoderRequest *)self pathHandler];

    if (v5)
    {
      id v6 = [(GEOZilchDecoderRequest *)self pathHandler];
      ((void (**)(void, Path<std::shared_ptr<geo::MapEdge>> *))v6)[2](v6, a3);
      goto LABEL_10;
    }
    if (a3->var4.var0 != a3->var4.var1) {
      goto LABEL_11;
    }
  }
  id v7 = [(GEOZilchDecoderRequest *)self errorHandler];

  if (!v7) {
    goto LABEL_11;
  }
  firstTileLoadingError = self->_firstTileLoadingError;
  if (firstTileLoadingError) {
    [(NSError *)firstTileLoadingError zilchDecoderTileLoadingError];
  }
  else {
  id v6 = [MEMORY[0x1E4F28C58] zilchDecoderErrorForNoSolution];
  }
  uint64_t v9 = [(GEOZilchDecoderRequest *)self errorHandler];
  v9[2](v9, v6);

LABEL_10:
LABEL_11:
  [(GEOZilchDecoderRequest *)self setPathHandler:0];
  [(GEOZilchDecoderRequest *)self setErrorHandler:0];

  [(GEOMapRequest *)self complete];
}

- (void)decodeWithPathHandler:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(GEOZilchDecoderRequest *)self setPathHandler:v6];
  [(GEOZilchDecoderRequest *)self setErrorHandler:v7];
  v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  finishedSemaphore = self->_finishedSemaphore;
  self->_finishedSemaphore = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_decoder);
  v11 = [WeakRetained decoderQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke;
  block[3] = &unk_1E53D8418;
  block[4] = self;
  dispatch_async(v11, block);
}

void __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 40);
  int v7 = 3;
  uint64_t v8 = 0x404E000000000000;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v12 = 0;
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)v1);
  zilch::GeoCoordinates::GeoCoordinates((zilch::GeoCoordinates *)v2);
  uint64_t v5 = 0;
  long long v4 = 0u;
  long long v3 = 0u;
  memset(&v2[12], 0, 32);
  operator new();
}

void __61__GEOZilchDecoderRequest_decodeWithPathHandler_errorHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 56);
  memset(v6, 0, sizeof(v6));
  std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__init_with_size[abi:ne180100]<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*,zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>*>(v6, v3, *(void *)(a1 + 72), 0x8E38E38E38E38E39 * ((*(void *)(a1 + 72) - v3) >> 3));
  memset(v7, 0, sizeof(v7));
  std::vector<zilch::GeometryPathElement>::__init_with_size[abi:ne180100]<zilch::GeometryPathElement*,zilch::GeometryPathElement*>(v7, *(void *)(a1 + 88), *(void *)(a1 + 96), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 4));
  __p = 0;
  long long v9 = 0;
  uint64_t v10 = 0;
  std::vector<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry,std::allocator<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry>>::__init_with_size[abi:ne180100]<zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*,zilch::Path<std::shared_ptr<geo::MapEdge>>::Entry*>(&__p, *(const void **)(a1 + 112), *(void *)(a1 + 120), (uint64_t)(*(void *)(a1 + 120) - *(void *)(a1 + 112)) >> 4);
  [v2 _finishedDecodingWithPath:&v4];
  if (__p)
  {
    long long v9 = __p;
    operator delete(__p);
  }
  long long v11 = v7;
  std::vector<zilch::GeometryPathElement>::__destroy_vector::operator()[abi:ne180100](&v11);
  long long v11 = (void **)v6;
  std::vector<zilch::RoadPathElement<std::shared_ptr<geo::MapEdge>>>::__destroy_vector::operator()[abi:ne180100](&v11);
}

- (void)cancel
{
  uint64_t v3 = [(GEOZilchDecoderRequest *)self pathHandler];

  if (v3)
  {
    [(GEOZilchDecoderRequest *)self setPathHandler:0];
    geo::ZilchMapModel::cancel((geo::ZilchMapModel *)self->_mapModel.__ptr_.__value_);
    finishedSemaphore = self->_finishedSemaphore;
    if (finishedSemaphore) {
      dispatch_semaphore_wait(finishedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  [(GEOZilchDecoderRequest *)self setErrorHandler:0];
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoderRequest;
  [(GEOMapRequest *)&v5 cancel];
}

- (id)pathHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPathHandler:(id)a3
{
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedSemaphore, 0);
  objc_storeStrong((id *)&self->_firstTileLoadingError, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_pathHandler, 0);
  cntrl = self->_message.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_destroyWeak((id *)&self->_decoder);
  value = self->_mapModel.__ptr_.__value_;
  self->_mapModel.__ptr_.__value_ = 0;
  if (value)
  {
    objc_super v5 = *(void (**)(void))(*(void *)value + 40);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end