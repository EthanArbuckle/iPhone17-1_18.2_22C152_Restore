@interface LSLinkedChildApplicationRecordEnumerator
@end

@implementation LSLinkedChildApplicationRecordEnumerator

void __71___LSLinkedChildApplicationRecordEnumerator__prepareWithContext_error___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 32) + 88;
  v5 = *(_DWORD **)(*(void *)(a1 + 32) + 96);
  v6 = (void *)(*(void *)(a1 + 32) + 104);
  if ((unint64_t)v5 >= *v6)
  {
    v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v5 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      abort();
    }
    uint64_t v11 = *v6 - (void)v8;
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
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)v6, v12);
      v8 = *(_DWORD **)v4;
      v5 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v9];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = a3;
    v7 = v14 + 4;
    while (v5 != v8)
    {
      int v16 = *--v5;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *(void *)uint64_t v4 = v14;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    _DWORD *v5 = a3;
    v7 = v5 + 1;
  }
  *(void *)(v4 + 8) = v7;
}

@end