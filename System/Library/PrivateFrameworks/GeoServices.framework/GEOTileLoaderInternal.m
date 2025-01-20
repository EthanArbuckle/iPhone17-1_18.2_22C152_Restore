@interface GEOTileLoaderInternal
- (id).cxx_construct;
@end

@implementation GEOTileLoaderInternal

- (id).cxx_construct
{
  *((void *)self + 1) = (char *)self + 8;
  *((void *)self + 2) = (char *)self + 8;
  *((void *)self + 3) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = (char *)self + 56;
  *((void *)self + 8) = (char *)self + 56;
  *((void *)self + 9) = 0;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  v3 = (void **)*((void *)self + 13);
  v4 = (void **)*((void *)self + 14);
  if (v4 == v3)
  {
    v5 = (void *)((char *)self + 136);
    v4 = (void **)*((void *)self + 13);
  }
  else
  {
    v5 = (void *)((char *)self + 136);
    unint64_t v6 = *((void *)self + 16);
    v7 = &v3[v6 / 0x49];
    unint64_t v8 = (unint64_t)*v7 + 56 * (v6 % 0x49);
    unint64_t v9 = (unint64_t)v3[(*((void *)self + 17) + v6) / 0x49] + 56 * ((*((void *)self + 17) + v6) % 0x49);
    if (v8 != v9)
    {
      do
      {
        std::__list_imp<std::__list_iterator<LoadItem,void *>>::clear((void *)(v8 + 32));
        *(void *)(v8 + 8) = &unk_1ED5136D0;

        v8 += 56;
        if (v8 - (void)*v7 == 4088)
        {
          unint64_t v10 = (unint64_t)v7[1];
          ++v7;
          unint64_t v8 = v10;
        }
      }
      while (v8 != v9);
      v3 = (void **)*((void *)self + 13);
      v4 = (void **)*((void *)self + 14);
    }
  }
  void *v5 = 0;
  unint64_t v11 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = (void **)*((void *)self + 14);
      v3 = (void **)(*((void *)self + 13) + 8);
      *((void *)self + 13) = v3;
      unint64_t v11 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  unint64_t v12 = v11 >> 3;
  if (v12 == 1)
  {
    uint64_t v13 = 36;
    goto LABEL_14;
  }
  if (v12 == 2)
  {
    uint64_t v13 = 73;
LABEL_14:
    *((void *)self + 16) = v13;
  }
  if (v3 != v4)
  {
    do
    {
      v14 = *v3++;
      operator delete(v14);
    }
    while (v3 != v4);
    uint64_t v16 = *((void *)self + 13);
    uint64_t v15 = *((void *)self + 14);
    if (v15 != v16) {
      *((void *)self + 14) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  v17 = (void *)*((void *)self + 12);
  if (v17) {
    operator delete(v17);
  }
  if (*((void *)self + 9))
  {
    uint64_t v18 = *((void *)self + 7);
    v19 = (GEOTileLoaderInternal *)*((void *)self + 8);
    uint64_t v20 = *(void *)v19;
    *(void *)(v20 + 8) = *(void *)(v18 + 8);
    **(void **)(v18 + 8) = v20;
    *((void *)self + 9) = 0;
    if (v19 != (GEOTileLoaderInternal *)((char *)self + 56))
    {
      do
      {
        v21 = (GEOTileLoaderInternal *)*((void *)v19 + 1);
        std::__destroy_at[abi:ne180100]<_CacheRequester<void({block_pointer} {__strong})(unsigned long long)>,0>((uint64_t)v19 + 16);
        operator delete(v19);
        v19 = v21;
      }
      while (v21 != (GEOTileLoaderInternal *)((char *)self + 56));
    }
  }
  uint64_t v22 = *((void *)self + 6);
  *((void *)self + 6) = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  objc_storeStrong((id *)self + 5, 0);
  objc_storeStrong((id *)self + 4, 0);
  if (*((void *)self + 3))
  {
    v23 = (char *)self + 8;
    uint64_t v24 = *((void *)self + 1);
    v25 = (GEOTileLoaderInternal *)*((void *)self + 2);
    uint64_t v26 = *(void *)v25;
    *(void *)(v26 + 8) = *(void *)(v24 + 8);
    **(void **)(v24 + 8) = v26;
    *((void *)self + 3) = 0;
    if (v25 != (GEOTileLoaderInternal *)((char *)self + 8))
    {
      do
      {
        v27 = (GEOTileLoaderInternal *)*((void *)v25 + 1);
        std::__destroy_at[abi:ne180100]<LoadItem,0>((uint64_t)v25 + 16);
        operator delete(v25);
        v25 = v27;
      }
      while (v27 != (GEOTileLoaderInternal *)v23);
    }
  }
}

@end