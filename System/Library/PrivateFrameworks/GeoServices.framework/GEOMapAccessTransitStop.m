@interface GEOMapAccessTransitStop
- (id)findAccessPoints:(id)a3 completionHandler:(id)a4;
- (id)findHall:(id)a3 completionHandler:(id)a4;
- (id)findLinksIn:(id)a3 completionHandler:(id)a4;
- (id)findLinksOut:(id)a3 completionHandler:(id)a4;
- (unint64_t)hallID;
@end

@implementation GEOMapAccessTransitStop

- (unint64_t)hallID
{
  v2 = *(unint64_t **)(*((void *)self->super._node.__ptr_ + 5) + 256);
  if (v2) {
    return *v2;
  }
  else {
    return 0;
  }
}

- (id)findHall:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (self->_hall)
  {
    if (v6) {
      v6[2](v6);
    }
    if (v8)
    {
      v8[2](v8, 0);
      v9 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v10 = *(uint64_t **)(*((void *)self->super._node.__ptr_ + 5) + 256);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        uint64_t v15 = MEMORY[0x1E4F143A8];
        uint64_t v16 = 3221225472;
        v17 = __54__GEOMapAccessTransitStop_findHall_completionHandler___block_invoke;
        v18 = &unk_1E53DAC00;
        v19 = self;
        v20 = v6;
        v12 = (void *)MEMORY[0x18C120660](&v15);
        map = self->super._map;
        [(GEOMapAccessTransitNodeBase *)self coordinate];
        v9 = -[GEOMapAccess findTransitHallWithID:near:hallHandler:completionHandler:](map, "findTransitHallWithID:near:hallHandler:completionHandler:", v11, v12, v8);

        goto LABEL_12;
      }
    }
    if (v7)
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
      v9 = 0;
      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

void __54__GEOMapAccessTransitStop_findHall_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (id)findAccessPoints:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    map = self->super._map;
    unint64_t v9 = [(GEOMapAccessTransitStop *)self hallID];
    [(GEOMapAccessTransitNodeBase *)self coordinate];
    double v11 = v10;
    double v13 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__GEOMapAccessTransitStop_findAccessPoints_completionHandler___block_invoke;
    v16[3] = &unk_1E53DABB0;
    id v17 = v6;
    v14 = -[GEOMapAccess findTransitPointWithParentID:near:type:pointHandler:completionHandler:](map, "findTransitPointWithParentID:near:type:pointHandler:completionHandler:", v9, 1, v16, v7, v11, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __62__GEOMapAccessTransitStop_findAccessPoints_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)findLinksIn:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  map = self->super._map;
  ptr = self->super._node.__ptr_;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__GEOMapAccessTransitStop_findLinksIn_completionHandler___block_invoke;
  v13[3] = &unk_1E53DAC28;
  v13[4] = self;
  id v14 = v6;
  unint64_t v9 = *(void (**)(MapNodeTransit *, GEOMapAccess *, void *, id))(*(void *)ptr + 40);
  id v10 = v6;
  double v11 = v9(ptr, map, v13, a4);

  return v11;
}

void __57__GEOMapAccessTransitStop_findLinksIn_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = [GEOMapAccessTransitLink alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  unint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessTransitLink *)v4 initWithMap:v5 transitEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (id)findLinksOut:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  map = self->super._map;
  ptr = self->super._node.__ptr_;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__GEOMapAccessTransitStop_findLinksOut_completionHandler___block_invoke;
  v13[3] = &unk_1E53DAC28;
  v13[4] = self;
  id v14 = v6;
  unint64_t v9 = *(void (**)(MapNodeTransit *, GEOMapAccess *, void *, id))(*(void *)ptr + 48);
  id v10 = v6;
  double v11 = v9(ptr, map, v13, a4);

  return v11;
}

void __58__GEOMapAccessTransitStop_findLinksOut_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = [GEOMapAccessTransitLink alloc];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v8 = *a2;
  unint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = [(GEOMapAccessTransitLink *)v4 initWithMap:v5 transitEdge:&v8];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

- (void).cxx_destruct
{
}

@end