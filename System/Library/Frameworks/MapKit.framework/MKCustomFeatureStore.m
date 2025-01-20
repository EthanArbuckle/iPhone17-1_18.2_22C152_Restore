@interface MKCustomFeatureStore
@end

@implementation MKCustomFeatureStore

void __46___MKCustomFeatureStore__clearTileAnnotations__block_invoke(uint64_t a1, void *a2)
{
  id v21 = a2;
  v3 = [v21 feature];
  [v3 setDataSource:0];

  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  [v21 coordinate];
  GEOMapPointForCoordinate();
  uint64_t v7 = v5;
  uint64_t v8 = v6;
  v10 = (char *)v4[7];
  unint64_t v9 = v4[8];
  if ((unint64_t)v10 >= v9)
  {
    v12 = (char *)v4[6];
    uint64_t v13 = (v10 - v12) >> 4;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v9 - (void)v12;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    BOOL v16 = (unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0;
    unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    if (!v16) {
      unint64_t v17 = v14;
    }
    if (v17)
    {
      unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v17);
      v12 = (char *)v4[6];
      v10 = (char *)v4[7];
    }
    else
    {
      uint64_t v18 = 0;
    }
    v19 = (void *)(v17 + 16 * v13);
    unint64_t v20 = v17 + 16 * v18;
    void *v19 = v7;
    v19[1] = v8;
    v11 = v19 + 2;
    if (v10 != v12)
    {
      do
      {
        *((_OWORD *)v19 - 1) = *((_OWORD *)v10 - 1);
        v19 -= 2;
        v10 -= 16;
      }
      while (v10 != v12);
      v12 = (char *)v4[6];
    }
    v4[6] = v19;
    v4[7] = v11;
    v4[8] = v20;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    *(void *)v10 = v5;
    *((void *)v10 + 1) = v6;
    v11 = v10 + 16;
  }
  v4[7] = v11;
}

@end