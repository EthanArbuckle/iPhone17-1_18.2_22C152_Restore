@interface LSExtensionPointRecordEnumerator
@end

@implementation LSExtensionPointRecordEnumerator

void __63___LSExtensionPointRecordEnumerator__prepareWithContext_error___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v6 = [*(id *)(a1 + 32) parentApplicationRecord];
  if (v6 && *(_DWORD *)(a3 + 56) != *(_DWORD *)(a1 + 40))
  {
  }
  else
  {
    int v7 = *(_DWORD *)(a1 + 44);
    if (v7)
    {
      int v8 = *(_DWORD *)(a3 + 4);

      if (v8 != v7) {
        return;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void *)(a1 + 32) + 96;
    v10 = *(_DWORD **)(v9 + 8);
    unint64_t v11 = *(void *)(v9 + 16);
    if ((unint64_t)v10 >= v11)
    {
      v13 = *(_DWORD **)v9;
      uint64_t v14 = ((uint64_t)v10 - *(void *)v9) >> 2;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62) {
        abort();
      }
      uint64_t v16 = v11 - (void)v13;
      if (v16 >> 1 > v15) {
        unint64_t v15 = v16 >> 1;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v9 + 16, v17);
        v13 = *(_DWORD **)v9;
        v10 = *(_DWORD **)(v9 + 8);
      }
      else
      {
        v18 = 0;
      }
      v19 = &v18[4 * v14];
      v20 = &v18[4 * v17];
      *(_DWORD *)v19 = a2;
      v12 = v19 + 4;
      while (v10 != v13)
      {
        int v21 = *--v10;
        *((_DWORD *)v19 - 1) = v21;
        v19 -= 4;
      }
      *(void *)uint64_t v9 = v19;
      *(void *)(v9 + 8) = v12;
      *(void *)(v9 + 16) = v20;
      if (v13) {
        operator delete(v13);
      }
    }
    else
    {
      _DWORD *v10 = a2;
      v12 = v10 + 1;
    }
    *(void *)(v9 + 8) = v12;
  }
}

@end