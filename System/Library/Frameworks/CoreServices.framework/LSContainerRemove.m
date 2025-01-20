@interface LSContainerRemove
@end

@implementation LSContainerRemove

void ___LSContainerRemove_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 40))
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5 = (char *)v4[7];
    unint64_t v6 = v4[8];
    if ((unint64_t)v5 >= v6)
    {
      v8 = (char *)v4[6];
      uint64_t v9 = (v5 - v8) >> 2;
      unint64_t v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 62) {
        abort();
      }
      uint64_t v11 = v6 - (void)v8;
      if (v11 >> 1 > v10) {
        unint64_t v10 = v11 >> 1;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v4 + 8), v12);
        v8 = (char *)v4[6];
        v5 = (char *)v4[7];
      }
      else
      {
        v13 = 0;
      }
      v14 = &v13[4 * v9];
      v15 = &v13[4 * v12];
      *(_DWORD *)v14 = a2;
      v7 = v14 + 4;
      while (v5 != v8)
      {
        int v16 = *((_DWORD *)v5 - 1);
        v5 -= 4;
        *((_DWORD *)v14 - 1) = v16;
        v14 -= 4;
      }
      v4[6] = v14;
      v4[7] = v7;
      v4[8] = v15;
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *(_DWORD *)v5 = a2;
      v7 = v5 + 4;
    }
    v4[7] = v7;
  }
}

void ___LSContainerRemove_block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 4) == *(_DWORD *)(a1 + 40))
  {
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
    v5 = (char *)v4[7];
    unint64_t v6 = v4[8];
    if ((unint64_t)v5 >= v6)
    {
      v8 = (char *)v4[6];
      uint64_t v9 = (v5 - v8) >> 2;
      unint64_t v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 62) {
        abort();
      }
      uint64_t v11 = v6 - (void)v8;
      if (v11 >> 1 > v10) {
        unint64_t v10 = v11 >> 1;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v10;
      }
      if (v12)
      {
        v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v4 + 8), v12);
        v8 = (char *)v4[6];
        v5 = (char *)v4[7];
      }
      else
      {
        v13 = 0;
      }
      v14 = &v13[4 * v9];
      v15 = &v13[4 * v12];
      *(_DWORD *)v14 = a2;
      v7 = v14 + 4;
      while (v5 != v8)
      {
        int v16 = *((_DWORD *)v5 - 1);
        v5 -= 4;
        *((_DWORD *)v14 - 1) = v16;
        v14 -= 4;
      }
      v4[6] = v14;
      v4[7] = v7;
      v4[8] = v15;
      if (v8) {
        operator delete(v8);
      }
    }
    else
    {
      *(_DWORD *)v5 = a2;
      v7 = v5 + 4;
    }
    v4[7] = v7;
  }
}

@end