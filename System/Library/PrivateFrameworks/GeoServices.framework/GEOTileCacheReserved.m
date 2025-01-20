@interface GEOTileCacheReserved
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation GEOTileCacheReserved

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = (char *)self + 72;
  *((void *)self + 10) = (char *)self + 72;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

- (void)dealloc
{
  for (uint64_t i = *((void *)self + 10);
        (GEOTileCacheReserved *)i != (GEOTileCacheReserved *)((char *)self + 72);
  v3.receiver = self;
  v3.super_class = (Class)GEOTileCacheReserved;
  [(GEOTileCacheReserved *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_super v3 = (void *)*((void *)self + 14);
  if (v3)
  {
    do
    {
      v4 = (void *)*v3;
      operator delete(v3);
      objc_super v3 = v4;
    }
    while (v4);
  }
  v5 = (void *)*((void *)self + 12);
  *((void *)self + 12) = 0;
  if (v5) {
    operator delete(v5);
  }
  std::__list_imp<CacheItem>::clear((uint64_t *)self + 9);

  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

@end