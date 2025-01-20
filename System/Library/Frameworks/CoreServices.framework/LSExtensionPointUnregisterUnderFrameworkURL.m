@interface LSExtensionPointUnregisterUnderFrameworkURL
@end

@implementation LSExtensionPointUnregisterUnderFrameworkURL

void ___LSExtensionPointUnregisterUnderFrameworkURL_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 52);
  if (v3)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [*(id *)(a1 + 40) path];
    int v8 = _LSAliasMatchesPath_NoIO(v6, v3, v7, 2);

    if (v8)
    {
      v9 = *(void **)(*(void *)(a1 + 48) + 8);
      v10 = (char *)v9[7];
      unint64_t v11 = v9[8];
      if ((unint64_t)v10 >= v11)
      {
        v13 = (char *)v9[6];
        uint64_t v14 = (v10 - v13) >> 2;
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
          v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v9 + 8), v17);
          v13 = (char *)v9[6];
          v10 = (char *)v9[7];
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
          int v21 = *((_DWORD *)v10 - 1);
          v10 -= 4;
          *((_DWORD *)v19 - 1) = v21;
          v19 -= 4;
        }
        v9[6] = v19;
        v9[7] = v12;
        v9[8] = v20;
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *(_DWORD *)v10 = a2;
        v12 = v10 + 4;
      }
      v9[7] = v12;
    }
  }
}

@end