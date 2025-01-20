@interface LSTypeEnumerator
@end

@implementation LSTypeEnumerator

void __47___LSTypeEnumerator__prepareWithContext_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32) + 88;
  v4 = *(_DWORD **)(*(void *)(a1 + 32) + 96);
  v5 = (void *)(*(void *)(a1 + 32) + 104);
  if ((unint64_t)v4 >= *v5)
  {
    v7 = *(_DWORD **)v3;
    uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 2;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
      abort();
    }
    uint64_t v10 = *v5 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)v5, v11);
      v7 = *(_DWORD **)v3;
      v4 = *(_DWORD **)(v3 + 8);
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[4 * v8];
    v14 = &v12[4 * v11];
    *(_DWORD *)v13 = a2;
    v6 = v13 + 4;
    while (v4 != v7)
    {
      int v15 = *--v4;
      *((_DWORD *)v13 - 1) = v15;
      v13 -= 4;
    }
    *(void *)uint64_t v3 = v13;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v14;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    _DWORD *v4 = a2;
    v6 = v4 + 1;
  }
  *(void *)(v3 + 8) = v6;
}

@end