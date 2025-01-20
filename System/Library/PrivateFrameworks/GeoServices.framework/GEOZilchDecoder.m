@interface GEOZilchDecoder
+ (BOOL)decodingSupported;
- (GEOMapAccessRestrictions)mapAccessRestrictions;
- (GEOZilchDecoder)init;
- (OS_dispatch_queue)decoderQueue;
- (id).cxx_construct;
- (id)decodeZilchMessage:(shared_ptr<zilch:(id)a4 :(id)a5 Message>)a3 pathHandler:errorHandler:;
- (id)requestQueue;
- (void)requestComplete:(id)a3;
- (void)setMapAccessRestrictions:(id)a3;
- (void)setRequestQueue:(id)a3;
- (void)trackRequest:(id)a3;
@end

@implementation GEOZilchDecoder

+ (BOOL)decodingSupported
{
  return +[GEOMapAccess supportsRoadMapAccess];
}

- (GEOZilchDecoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOZilchDecoder;
  v2 = [(GEOMapRequestManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create();
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v3;

    [(GEOZilchDecoder *)v2 setRequestQueue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

- (id)requestQueue
{
  return *((id *)self + 4);
}

- (void)setRequestQueue:(id)a3
{
}

- (id)decodeZilchMessage:(shared_ptr<zilch:(id)a4 :(id)a5 Message>)a3 pathHandler:errorHandler:
{
  ptr = a3.__ptr_;
  v8 = a3.__cntrl_;
  id v9 = a4;
  v10 = [GEOZilchDecoderRequest alloc];
  v11 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v14 = *(void *)ptr;
  v15 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12 = [(GEOZilchDecoderRequest *)v10 initWithDecoder:self message:&v14];
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  -[GEOZilchDecoderRequest decodeWithPathHandler:errorHandler:](v12, "decodeWithPathHandler:errorHandler:", v8, v9, v14);

  return v12;
}

- (void)trackRequest:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoder;
  [(GEOMapRequestManager *)&v5 trackRequest:v4];
  std::mutex::unlock((std::mutex *)((char *)self + 40));
}

- (void)requestComplete:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 40));
  v5.receiver = self;
  v5.super_class = (Class)GEOZilchDecoder;
  [(GEOMapRequestManager *)&v5 requestComplete:v4];
  std::mutex::unlock((std::mutex *)((char *)self + 40));
}

- (OS_dispatch_queue)decoderQueue
{
  return (OS_dispatch_queue *)*((void *)self + 3);
}

- (GEOMapAccessRestrictions)mapAccessRestrictions
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 13);

  return (GEOMapAccessRestrictions *)WeakRetained;
}

- (void)setMapAccessRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 13);
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  objc_storeStrong((id *)self + 4, 0);

  objc_storeStrong((id *)self + 3, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  return self;
}

@end