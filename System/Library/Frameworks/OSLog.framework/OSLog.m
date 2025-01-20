uint64_t _catalog_uuid_add(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(void *)(a1 + 16);
  if (v2) {
    v3 = *(void *)(v2 + 24);
  }
  else {
    v3 = 0;
  }
  return _os_trace_uuid_map_insert((float *)v2, a2, v3);
}

uint64_t _catalog_for_each_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(result + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v5 = ___catalog_for_each_uuid_block_invoke;
  v6 = &unk_1E6CA1AE0;
  uint64_t v7 = a2;
  for (i = *(void **)(v2 + 16); i; i = (void *)*i)
    result = ((uint64_t (*)(void *, void *, void))v5)(v4, i + 2, i[4]);
  return result;
}

uint64_t ___catalog_for_each_uuid_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unsigned int *_catalog_procinfo_for_each_uuidinfo(uint64_t a1, uint64_t a2)
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int **)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  void v4[2] = ___catalog_procinfo_for_each_uuidinfo_block_invoke;
  v4[3] = &unk_1E6CA1B08;
  v4[4] = a2;
  return hashtable_iterate(v2, (uint64_t)v4);
}

uint64_t ___catalog_procinfo_for_each_uuidinfo_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL _catalog_procinfo_uuidinfo_add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24);
  }
  else {
    uint64_t v7 = 0;
  }
  _os_trace_uuid_map_insert((float *)v6, (uint64_t *)(a3 + 14), v7);
  v11[0] = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  uint64_t v8 = hashtable_lookup(*(void *)(a2 + 56), (uint64_t)v11);
  if (!v8)
  {
    uint64_t v9 = _os_trace_calloc();
    *(void *)uint64_t v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(void *)(v9 + 8) = *(void *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    if ((hashtable_insert(*(int **)(a2 + 56), (void *)v9, v9) & 1) == 0)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    ++*(void *)(a1 + 48);
  }
  return v8 != 0;
}

uint64_t _catalog_procinfo_uuidinfo_remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v10[0] = a3;
  uint64_t v3 = *(void *)(a2 + 56);
  if (*(void *)(v3 + 16))
  {
    v5 = (void *)(*(void *)(v3 + 16)
                  + 8
                  * (((unsigned int (**)(void *))hash_fn_array)[*(unsigned __int8 *)(v3 + 8)](v10)
                   % *(_DWORD *)v3));
    uint64_t v6 = (unsigned int (*)(void, void *))hashkey_compare_array[*(unsigned __int8 *)(v3 + 8)];
    while (1)
    {
      uint64_t v7 = v5;
      v5 = (void *)*v5;
      if (!v5) {
        break;
      }
      if (v6(v5[1], v10))
      {
        *uint64_t v7 = *v5;
        uint64_t v8 = (void *)v5[2];
        free(v5);
        --*(_DWORD *)(v3 + 4);
        if (!v8) {
          return 0;
        }
        --*(void *)(a1 + 48);
        free(v8);
        return 1;
      }
    }
  }
  return 0;
}

uint64_t _catalog_procinfo_lookup_pc(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2000000000;
  v6[3] = -1;
  uint64_t v2 = *(unsigned int **)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___catalog_procinfo_lookup_pc_block_invoke;
  v5[3] = &unk_1E6CA1B30;
  v5[5] = &v7;
  v5[6] = a2;
  v5[4] = v6;
  hashtable_iterate(v2, (uint64_t)v5);
  uint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *___catalog_procinfo_lookup_pc_block_invoke(void *result, uint64_t a2, void *a3)
{
  unint64_t v3 = result[6];
  if (v3 >= *a3)
  {
    unint64_t v4 = a3[1];
    if (v3 < v4 + *a3)
    {
      uint64_t v5 = *(void *)(result[4] + 8);
      if (v4 < *(void *)(v5 + 24))
      {
        *(void *)(v5 + 24) = v4;
        *(void *)(*(void *)(result[5] + 8) + 24) = a3;
      }
    }
  }
  return result;
}

uint64_t _catalog_procinfo_lookup_subsystem(uint64_t a1, __int16 a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __int16 v3 = a2;
  return hashtable_lookup(*(void *)(a1 + 64), (uint64_t)&v3);
}

uint64_t _catalog_lookup_procinfo_by_procid(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    __int16 v3 = (void *)(v2 + 16);
    while (1)
    {
      __int16 v3 = (void *)*v3;
      if (!v3) {
        break;
      }
      if (v3[2] == a2) {
        return v3[4];
      }
    }
  }
  return 0;
}

void *_catalog_lookup_procinfo_by_procinfo_key(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return _os_procinfo_map_lookup(*(void **)(a1 + 40), a2, a3);
}

uint64_t _catalog_procinfo_create(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (float **)(a1 + 40);
  uint64_t v5 = _os_procinfo_map_lookup(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5) {
    return (uint64_t)v5;
  }
  uint64_t v6 = _os_trace_calloc();
  uint64_t v5 = (void *)v6;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *(void *)(v6 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  uint64_t v10 = *v4;
  if (*v4) {
    LOWORD(v10) = *((_WORD *)v10 + 12);
  }
  *(_WORD *)uint64_t v6 = (_WORD)v10;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 24);
  }
  else {
    uint64_t v12 = 0;
  }
  _os_trace_uuid_map_insert((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    uint64_t v13 = *(void *)(a1 + 16);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 24);
    }
    else {
      uint64_t v14 = 0;
    }
    _os_trace_uuid_map_insert((float *)v13, v5 + 5, v14);
  }
  uint64_t v15 = _os_trace_calloc();
  *(void *)uint64_t v15 = 16;
  *(unsigned char *)(v15 + 8) = 2;
  *(void *)(v15 + 16) = _os_trace_calloc();
  void v5[7] = v15;
  uint64_t v16 = _os_trace_calloc();
  *(void *)uint64_t v16 = 16;
  *(unsigned char *)(v16 + 8) = 1;
  *(void *)(v16 + 16) = _os_trace_calloc();
  v5[8] = v16;
  if (_os_procinfo_map_insert(v4, v5[1], *((_DWORD *)v5 + 4), (uint64_t)v5)) {
    return (uint64_t)v5;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void *_catalog_subchunk_entry_alloc(uint64_t a1)
{
  uint64_t v2 = (void *)_os_trace_calloc();
  v2[2] = -1;
  uint64_t v3 = _os_trace_calloc();
  *(void *)uint64_t v3 = 16;
  *(unsigned char *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = _os_trace_calloc();
  v2[6] = v3;
  uint64_t v4 = _os_trace_calloc();
  *(void *)uint64_t v4 = 16;
  *(unsigned char *)(v4 + 8) = 1;
  *(void *)(v4 + 16) = _os_trace_calloc();
  v2[5] = v4;
  uint64_t v5 = *(void **)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  *uint64_t v2 = 0;
  v2[1] = v5;
  void *v5 = v2;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v6 + 1;
  return v2;
}

uint64_t _catalog_subchunk_procinfo_add(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t v4 = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    uint64_t v4 = _catalog_subchunk_entry_alloc(a1);
  }
  if (_os_procinfo_map_lookup(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16)))
  {
    uint64_t v5 = (int *)v4[6];
    return hashtable_insert(v5, (void *)a2, 0);
  }
  else
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t catalog_subchunk_string_insert(uint64_t a1, __int16 a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v4 = a2;
  if (*(void *)(a1 + 80)) {
    uint64_t v2 = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    uint64_t v2 = _catalog_subchunk_entry_alloc(a1);
  }
  return hashtable_insert((int *)v2[5], &v4, 0);
}

BOOL catalog_chunk_parse_entries(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    BOOL v10 = 0;
    for (i = 0; i != a4; BOOL v10 = i >= a4)
    {
      unint64_t v12 = *a1;
      if (a2)
      {
        if (a2 < v12 || a2 - v12 < a3) {
          break;
        }
      }
      *a1 = v12 + a3;
      if (!v12) {
        break;
      }
      if (((*(uint64_t (**)(uint64_t, unint64_t, unint64_t, unint64_t *))(a5 + 16))(a5, i, v12, a1) & 1) == 0)break; {
      ++i;
      }
    }
  }
  else
  {
    return 1;
  }
  return v10;
}

BOOL catalog_chunk_parse_section(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  __int16 v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (BOOL v5 = a2 - (unint64_t)v4 >= 8) : (BOOL v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return catalog_chunk_parse_entries(a1, a2, a3, *v4, a4);
  }
  else
  {
    return 0;
  }
}

void _catalog_create()
{
  v0 = (void *)_os_trace_calloc();
  v0[8] = 0;
  v0[9] = v0 + 8;
  v0[1] = -1;
  operator new();
}

void _catalog_procinfo_free(unsigned int **a1)
{
  uint64_t v2 = (void (*)(void))MEMORY[0x1E4F14838];
  hashtable_destroy(a1[7], MEMORY[0x1E4F14838]);
  hashtable_destroy(a1[8], v2);

  free(a1);
}

void _catalog_destroy(uint64_t a1)
{
  _os_trace_uuid_map_clear(*(void **)(a1 + 16));
  _os_trace_str_map_clear(*(void *)(a1 + 24));
  *(void *)(a1 + 32) = 0;
  _os_procinfo_map_clear(*(void **)(a1 + 40), (uint64_t (*)(void))_catalog_procinfo_free);
  uint64_t v2 = *(unsigned int ***)(a1 + 64);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  if (v2)
  {
    do
    {
      uint64_t v3 = *v2;
      hashtable_destroy(v2[6], 0);
      hashtable_destroy(v2[5], 0);
      free(v2);
      uint64_t v2 = (unsigned int **)v3;
    }
    while (v3);
  }
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 8) = -1;
  _os_trace_uuid_map_destroy(*(void ***)(a1 + 16));
  uint64_t v4 = *(void *)(a1 + 24);
  _os_trace_str_map_clear(v4);
  if (v4)
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(v4 + 16));
    BOOL v5 = *(void **)v4;
    *(void *)uint64_t v4 = 0;
    if (v5) {
      operator delete(v5);
    }
    MEMORY[0x1E01A3060](v4, 0x10A0C408EF24B1CLL);
  }
  uint64_t v6 = *(void ***)(a1 + 40);
  _os_procinfo_map_clear(v6, 0);
  if (v6)
  {
    long long v7 = v6[2];
    if (v7)
    {
      do
      {
        long long v8 = (void *)*v7;
        operator delete(v7);
        long long v7 = v8;
      }
      while (v8);
    }
    long long v9 = *v6;
    void *v6 = 0;
    if (v9) {
      operator delete(v9);
    }
    MEMORY[0x1E01A3060](v6, 0x10A0C408EF24B1CLL);
  }

  free((void *)a1);
}

uint64_t _catalog_update_earliest_fhbuf_ts(uint64_t result, unint64_t a2)
{
  if (*(void *)(result + 8) > a2) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t _catalog_create_with_chunk(_DWORD *a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (*a1 == 24587)
  {
    uint64_t v2 = (void *)_os_trace_calloc();
    v2[8] = 0;
    v2[9] = v2 + 8;
    v2[1] = -1;
    operator new();
  }
  if (a2) {
    puts("Error: Incorrect catalog chunk preamble tag");
  }
  return 0;
}

uint64_t __catalog_chunk_parse_uuid_v2_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1;
}

uint64_t __catalog_chunk_parse_uuid_legacy_block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    _chunk_print_uuid(a2, (unsigned __int8 *)a3);
  }
  return 1;
}

uint64_t __catalog_chunk_parse_procinfo_v2_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (_os_procinfo_map_lookup(*(void **)(*(void *)(a1 + 32) + 40), *(void *)(a3 + 8), *(_DWORD *)(a3 + 16))) {
    return 1;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(_DWORD *)(v9 + 4);
  uint64_t v11 = v9 + 40;
  uint64_t v12 = v9 + 32;
  BOOL v13 = v10 == 17;
  if (v10 == 17) {
    uint64_t v14 = v9 + 40;
  }
  else {
    uint64_t v14 = v9 + 32;
  }
  uint64_t v15 = *(unsigned __int16 *)(v9 + 16);
  uint64_t v16 = v11 + v15;
  uint64_t v17 = v12 + v15;
  if (v13) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v17;
  }
  uint64_t v19 = _os_trace_calloc();
  v20 = (unsigned int **)v19;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(void *)(v19 + 8) = *(void *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 20) = *(_DWORD *)(a3 + 24);
  uint64_t v21 = *(unsigned __int16 *)(a3 + 4);
  unint64_t v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF) {
    *(_OWORD *)(v19 + 24) = *(_OWORD *)(v14 + 16 * v21);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF) {
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    }
    else {
      _os_assumes_log();
    }
  }
  uint64_t v26 = _os_trace_calloc();
  *(void *)uint64_t v26 = 16;
  *(unsigned char *)(v26 + 8) = 2;
  *(void *)(v26 + 16) = _os_trace_calloc();
  v20[7] = (unsigned int *)v26;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16;
  *(unsigned char *)(v27 + 8) = 1;
  *(void *)(v27 + 16) = _os_trace_calloc();
  v20[8] = (unsigned int *)v27;
  int v28 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu@%u\n\t%10s : %d\n\t%10s : %u\n\t%10s : %u\n\t%10s : %x\n", a2, "proc id", v20[1], *((_DWORD *)v20 + 4), "pid", *((_DWORD *)v20 + 1), "euid", *((_DWORD *)v20 + 5), "index", *(unsigned __int16 *)v20, "flags", *((unsigned __int16 *)v20 + 1));
    int v28 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v29;
      *(_OWORD *)&out[16] = v29;
      uuid_unparse((const unsigned __int8 *)v20 + 24, out);
      if (*(unsigned char *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      out[0] = 0;
      if (!uuid_is_null((const unsigned __int8 *)v20 + 40)) {
        uuid_unparse((const unsigned __int8 *)v20 + 40, out);
      }
      int v28 = *(unsigned __int8 *)(a1 + 56);
      if (*(unsigned char *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v28 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if (catalog_chunk_parse_procinfo_uuidinfo(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v20, v28 != 0, *(void *)(a1 + 40))&& catalog_chunk_parse_procinfo_subsystem(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v20, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40)))
  {
    if (_os_procinfo_map_insert((float **)(*(void *)(a1 + 32) + 40), (uint64_t)v20[1], *((_DWORD *)v20 + 4), (uint64_t)v20))return 1; {
    _os_assert_log();
    }
    _os_crash();
    __break(1u);
  }
  _catalog_procinfo_free(v20);
  return 0;
}

uint64_t __catalog_chunk_parse_procinfo_legacy_block_invoke(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v8)
  {
    uint64_t v9 = (void *)(v8 + 16);
    while (1)
    {
      uint64_t v9 = (void *)*v9;
      if (!v9) {
        break;
      }
      if (v9[2] == *((void *)a3 + 1))
      {
        if (v9[4]) {
          return 1;
        }
        break;
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(_DWORD *)(v10 + 4);
  uint64_t v12 = v10 + 40;
  uint64_t v13 = v10 + 32;
  BOOL v14 = v11 == 17;
  if (v11 == 17) {
    uint64_t v15 = v10 + 40;
  }
  else {
    uint64_t v15 = v10 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(v10 + 16);
  uint64_t v17 = v12 + v16;
  uint64_t v18 = v13 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = _os_trace_calloc();
  uint64_t v21 = v20;
  uint64_t v22 = *a3;
  unint64_t v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF) {
    *(_OWORD *)(v20 + 24) = *(_OWORD *)(v15 + 16 * v22);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF) {
    *(_OWORD *)(v21 + 40) = *(_OWORD *)(v15 + 16 * v25);
  }
  else {
    _os_assumes_log();
  }
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(void *)(v21 + 8) = *((void *)a3 + 1);
  if (a2 >= 0x10000) {
    _os_assumes_log();
  }
  *(_WORD *)uint64_t v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16;
  *(unsigned char *)(v27 + 8) = 2;
  *(void *)(v27 + 16) = _os_trace_calloc();
  *(void *)(v21 + 56) = v27;
  uint64_t v28 = _os_trace_calloc();
  *(void *)uint64_t v28 = 16;
  *(unsigned char *)(v28 + 8) = 1;
  *(void *)(v28 + 16) = _os_trace_calloc();
  *(void *)(v21 + 64) = v28;
  int v29 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %u\n", (unsigned __int16)a2, "proc id", *(void *)(v21 + 8), "pid", *(_DWORD *)(v21 + 4));
    int v29 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v30;
      *(_OWORD *)&out[16] = v30;
      uuid_unparse((const unsigned __int8 *)(v21 + 24), out);
      if (*(unsigned char *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      uuid_unparse((const unsigned __int8 *)(v21 + 40), out);
      int v29 = *(unsigned __int8 *)(a1 + 56);
      if (*(unsigned char *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v29 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if (catalog_chunk_parse_procinfo_uuidinfo(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), v21, v29 != 0, *(void *)(a1 + 40)) & 1) != 0&& (catalog_chunk_parse_procinfo_subsystem(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), v21, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40)))
  {
    if ((_os_procinfo_map_insert((float **)(*(void *)(a1 + 32) + 40), *(void *)(v21 + 8), *(_DWORD *)(v21 + 16), v21) & 1) == 0)_os_assumes_log(); {
    return 1;
    }
  }
  else
  {
    _catalog_procinfo_free((unsigned int **)v21);
    return 0;
  }
}

BOOL catalog_chunk_parse_subchunk(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  char v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = *(void *)(a4 + 8) + a4 + 16;
  if (a3) {
    printf("\n----- %-30s -----\n", "Catalog Subchunk Section");
  }
  if (*(_DWORD *)(a4 + 4) == 17)
  {
    unint64_t v9 = *(unsigned __int16 *)(a4 + 24);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 0x40000000;
    uint64_t v13 = __catalog_chunk_parse_subchunk_v2_block_invoke;
    BOOL v14 = &__block_descriptor_tmp_72;
    char v17 = v5;
    uint64_t v15 = a2;
    unint64_t v16 = v8;
    if (!catalog_chunk_parse_entries(a1, v8, 0x18uLL, v9, (uint64_t)&v11)) {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 0x40000000;
    uint64_t v13 = __catalog_chunk_parse_subchunk_legacy_block_invoke;
    BOOL v14 = &__block_descriptor_tmp_75;
    char v17 = v5;
    uint64_t v15 = a2;
    unint64_t v16 = v8;
    BOOL result = catalog_chunk_parse_section(a1, v8, 0x20uLL, (uint64_t)&v11);
    if (!result) {
      return result;
    }
  }
  return *a1 <= v8;
}

uint64_t __catalog_chunk_parse_subchunk_v2_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  unint64_t v8 = _catalog_subchunk_entry_alloc(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  int v11 = *((_DWORD *)a3 + 4);
  int v12 = *((_DWORD *)a3 + 5);
  *((_DWORD *)v8 + 8) = v11;
  *((_DWORD *)v8 + 9) = v12;
  uint64_t v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(unsigned char *)(a1 + 48))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "uncomp sz", v11, "comp algo", v12);
    BOOL v14 = *(unsigned char *)(a1 + 48) != 0;
    uint64_t v13 = (unsigned __int16 *)*a4;
  }
  else
  {
    BOOL v14 = 0;
  }
  unint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    uint64_t result = 0;
    if (v15 < (unint64_t)v13 || v15 - (unint64_t)v13 < 4) {
      return result;
    }
  }
  *a4 = (unint64_t)(v13 + 2);
  if (!v13) {
    return 0;
  }
  if (v14) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "procinfos", *(_DWORD *)v13, "indexes");
  }
  if (*(_DWORD *)v13)
  {
    int v17 = 0;
    do
    {
      uint64_t v18 = (unsigned __int16 *)*a4;
      if (v15)
      {
        if (v15 < (unint64_t)v18 || v15 - (unint64_t)v18 < 2) {
          return 0;
        }
      }
      *a4 = (unint64_t)(v18 + 1);
      if (!v18) {
        return 0;
      }
      if (v8) {
        hashtable_insert((int *)v8[6], v18, 0);
      }
      if (v14) {
        printf("%u,", *v18);
      }
    }
    while (++v17 < *(_DWORD *)v13);
  }
  if (v14) {
    putchar(10);
  }
  unint64_t v20 = *(void *)(a1 + 40);
  int v21 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v22 = (unsigned __int16 *)*a4;
  if (v20)
  {
    uint64_t result = 0;
    if (v20 < (unint64_t)v22 || v20 - (unint64_t)v22 < 4) {
      return result;
    }
  }
  *a4 = (unint64_t)(v22 + 2);
  if (!v22) {
    return 0;
  }
  if (v21) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "subcats", *(_DWORD *)v22, "offsets");
  }
  if (*(_DWORD *)v22)
  {
    int v23 = 0;
    do
    {
      uint64_t v24 = (unsigned __int16 *)*a4;
      if (v20)
      {
        if (v20 < (unint64_t)v24 || v20 - (unint64_t)v24 < 2) {
          return 0;
        }
      }
      *a4 = (unint64_t)(v24 + 1);
      if (!v24) {
        return 0;
      }
      if (v8) {
        hashtable_insert((int *)v8[5], v24, 0);
      }
      if (v21) {
        printf("%u,", *v24);
      }
    }
    while (++v23 < *(_DWORD *)v22);
  }
  if (v21) {
    putchar(10);
  }
  unint64_t v26 = *a4;
  if ((*a4 & 7) != 0) {
    unint64_t v26 = (*a4 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *a4 = v26;
  return 1;
}

uint64_t __catalog_chunk_parse_subchunk_legacy_block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  unint64_t v8 = _catalog_subchunk_entry_alloc(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  if (*(unsigned char *)(a1 + 48)) {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "log cnt", *((_DWORD *)a3 + 4), "others cnt", *((_DWORD *)a3 + 5));
  }
  unint64_t v11 = (unint64_t)a3 + 26;
  *a4 = (unint64_t)a3 + 26;
  unint64_t v12 = *(void *)(a1 + 40);
  unint64_t v13 = *((unsigned __int16 *)a3 + 12);
  if (v12)
  {
    BOOL v15 = v12 >= v11;
    unint64_t v14 = v12 - v11;
    BOOL v15 = v15 && v14 >= v13;
    if (!v15) {
      return 0;
    }
  }
  unint64_t v17 = v11 + v13;
  if ((v17 & 7) != 0) {
    unint64_t v17 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *a4 = v17;
  return 1;
}

uint64_t catalog_chunk_parse_procinfo_uuidinfo(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (void *)*a1;
  if (a2)
  {
    if (a2 < (unint64_t)v11 || a2 - (unint64_t)v11 < 8) {
      return 0;
    }
  }
  *a1 = v11 + 1;
  if (!v11) {
    return 0;
  }
  int v13 = *(_DWORD *)(a6 + 4);
  BOOL v14 = v13 == 17;
  if (v13 == 17) {
    uint64_t v15 = a6 + 40;
  }
  else {
    uint64_t v15 = a6 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v17 = a6 + 40 + v16;
  uint64_t v18 = a6 + 32 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  if (a5) {
    printf("\t%10s : %llu\n", "uuidinfos", *v11);
  }
  if (*v11)
  {
    uint64_t v20 = 0;
    unint64_t v29 = v19 - v15;
    while (1)
    {
      int v21 = (void *)*a1;
      if (a2)
      {
        if (a2 < (unint64_t)v21 || a2 - (unint64_t)v21 < 0x10) {
          break;
        }
      }
      *a1 = v21 + 2;
      if (!v21) {
        break;
      }
      uint64_t v30 = v21[1] >> 16;
      if (!hashtable_lookup(*(void *)(a4 + 56), (uint64_t)&v30))
      {
        uint64_t v23 = _os_trace_calloc();
        uint64_t v24 = (unsigned __int8 *)v23;
        *(void *)uint64_t v23 = v21[1] >> 16;
        *(void *)(v23 + 8) = *v21;
        unint64_t v25 = 16 * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF) {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16 * (unsigned __int16)*((_DWORD *)v21 + 2));
        }
        else {
          _os_assumes_log();
        }
        hashtable_insert(*(int **)(a4 + 56), v24, (uint64_t)v24);
        ++*(void *)(a3 + 48);
        if (a5)
        {
          *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uuid_string_t out = v27;
          *(_OWORD *)&out[16] = v27;
          uuid_unparse(v24 + 16, out);
          printf("\t\t<%10s : 0x%llx, %10s : %10llu, %10s : %s>\n", "load addr", *(void *)v24, "size", *((void *)v24 + 1), "uuid", out);
        }
      }
      if ((unint64_t)++v20 >= *v11) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t catalog_chunk_parse_procinfo_subsystem(unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7 = a5;
  unint64_t v11 = a1;
  unint64_t v12 = *a1;
  if (*(_DWORD *)(a6 + 4) != 17)
  {
    if (!a2 || (a2 >= (unint64_t)v12 ? (BOOL v21 = a2 - (unint64_t)v12 >= 8) : (BOOL v21 = 0), v21))
    {
      *a1 = v12 + 4;
      if (v12)
      {
        uint64_t v22 = *(unsigned __int16 *)(a6 + 16);
        uint64_t v23 = *(unsigned __int16 *)(a6 + 18);
        if (a5) {
          printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
        }
        if (*(void *)v12)
        {
          uint64_t v24 = 0;
          uint64_t v38 = a6 + 24 + v22 + 8;
          unint64_t v25 = v23 - (v22 + 8);
          int v36 = v7;
          while (1)
          {
            unint64_t v26 = *v11;
            if (a2)
            {
              if (a2 < (unint64_t)v26 || a2 - (unint64_t)v26 < 4) {
                return 0;
              }
            }
            *unint64_t v11 = v26 + 2;
            if (!v26) {
              return 0;
            }
            if (v7) {
              printf("\t\t<%10s : %3u, %10s : %5hu>\n", "id", *v26, "offset", v26[1]);
            }
            unint64_t v28 = v26[1];
            if (v25 < v28)
            {
LABEL_59:
              _os_assumes_log();
              return 0;
            }
            if (!hashtable_lookup(*(void *)(a4 + 64), (uint64_t)v26))
            {
              unint64_t v29 = v25;
              uint64_t v30 = (char *)(v38 + v28);
              uint64_t v31 = (void *)_os_trace_calloc();
              *(_WORD *)uint64_t v31 = *v26;
              v31[1] = _os_trace_str_map_entry(*(void **)(a3 + 24), v30 + 2);
              uint64_t v32 = _os_trace_str_map_entry(*(void **)(a3 + 24), &v30[*v30 + 2]);
              v31[2] = v32;
              if (!v32 || !v31[1]) {
                _os_assumes_log();
              }
              hashtable_insert(*(int **)(a4 + 64), v31, (uint64_t)v31);
              ++*(void *)(a3 + 56);
              unint64_t v25 = v29;
              int v7 = v36;
            }
            if ((unint64_t)++v24 >= *(void *)v12) {
              goto LABEL_56;
            }
          }
        }
        goto LABEL_56;
      }
    }
    return 0;
  }
  if (a2)
  {
    if (a2 < (unint64_t)v12 || a2 - (unint64_t)v12 < 8) {
      return 0;
    }
  }
  *a1 = v12 + 4;
  if (!v12) {
    return 0;
  }
  uint64_t v14 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v15 = *(unsigned __int16 *)(a6 + 18);
  if (a5) {
    printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
  }
  if (*(void *)v12)
  {
    uint64_t v16 = 0;
    uint64_t v37 = a6 + 40 + v14;
    unint64_t v17 = v15 - v14;
    v35 = v11;
    do
    {
      uint64_t v18 = *v11;
      if (a2)
      {
        if (a2 < (unint64_t)v18 || a2 - (unint64_t)v18 < 6) {
          return 0;
        }
      }
      *unint64_t v11 = v18 + 3;
      if (!v18) {
        return 0;
      }
      if (v7) {
        printf("\t\t<%10s : %3u, %10s : %5hu, %10s : %5hu>\n", "id", *v18, "subsystem", v18[1], "category", v18[2]);
      }
      if (v17 < v18[1] || v17 < v18[2]) {
        goto LABEL_59;
      }
      if (!hashtable_lookup(*(void *)(a4 + 64), (uint64_t)v18))
      {
        uint64_t v20 = (void *)_os_trace_calloc();
        *(_WORD *)uint64_t v20 = *v18;
        v20[1] = _os_trace_str_map_entry(*(void **)(a3 + 24), (char *)(v37 + v18[1]));
        unint64_t v11 = v35;
        v20[2] = _os_trace_str_map_entry(*(void **)(a3 + 24), (char *)(v37 + v18[2]));
        hashtable_insert(*(int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(void *)(a3 + 56);
      }
    }
    while ((unint64_t)++v16 < *(void *)v12);
  }
LABEL_56:
  unint64_t v33 = (unint64_t)*v11;
  if (((unint64_t)*v11 & 7) != 0) {
    unint64_t v33 = ((unint64_t)*v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *unint64_t v11 = (unsigned __int16 *)v33;
  return 1;
}

uint64_t __catalog_chunk_parse_activity_legacy_block_invoke()
{
  return 1;
}

uint64_t _chunk_print_uuid(uint64_t a1, unsigned __int8 *uu)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t _os_trace_uuid_map_insert(float *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = __ROR8__(v6 + 16, 16);
  unint64_t v8 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
  unint64_t v9 = *((void *)a1 + 1);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
    }
    else
    {
      unint64_t v11 = v8 & (v9 - 1);
    }
    unint64_t v12 = *(void **)(*(void *)a1 + 8 * v11);
    if (v12)
    {
      for (unint64_t i = (void *)*v12; i; unint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          if (i[2] == v5 && i[3] == v6) {
            return 0;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  uint64_t v16 = operator new(0x28uLL);
  *uint64_t v16 = 0;
  v16[1] = v8;
  v16[2] = v5;
  v16[3] = v6;
  v16[4] = a3;
  float v17 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v18 = a1[8];
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v9) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v23 = operator new(8 * *(void *)&prime);
          uint64_t v24 = *(void **)a1;
          *(void *)a1 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          unint64_t v26 = (void *)*((void *)a1 + 2);
          if (v26)
          {
            unint64_t v27 = v26[1];
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }
            else
            {
              v27 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v27) = a1 + 4;
            uint64_t v32 = (void *)*v26;
            if (*v26)
            {
              do
              {
                unint64_t v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(void *)&prime) {
                    v33 %= *(void *)&prime;
                  }
                }
                else
                {
                  v33 &= *(void *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v33))
                  {
                    *(void *)(*(void *)a1 + 8 * v33) = v26;
                    goto LABEL_59;
                  }
                  *unint64_t v26 = *v32;
                  *uint64_t v32 = **(void **)(*(void *)a1 + 8 * v33);
                  **(void **)(*(void *)a1 + 8 * v33) = v32;
                  uint64_t v32 = v26;
                }
                unint64_t v33 = v27;
LABEL_59:
                unint64_t v26 = v32;
                uint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }
              while (v32);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_63;
        }
        v39 = *(void **)a1;
        *(void *)a1 = 0;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v9 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_63:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
      else {
        unint64_t v11 = v8;
      }
    }
    else
    {
      unint64_t v11 = (v9 - 1) & v8;
    }
  }
  v34 = *(void **)a1;
  v35 = *(void **)(*(void *)a1 + 8 * v11);
  if (v35)
  {
    *uint64_t v16 = *v35;
LABEL_76:
    void *v35 = v16;
    goto LABEL_77;
  }
  uint64_t v36 = *((void *)a1 + 2);
  *uint64_t v16 = v36;
  *((void *)a1 + 2) = v16;
  v34[v11] = a1 + 4;
  if (v36)
  {
    unint64_t v37 = *(void *)(v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9) {
        v37 %= v9;
      }
    }
    else
    {
      v37 &= v9 - 1;
    }
    v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_76;
  }
LABEL_77:
  ++*((void *)a1 + 3);
  return 1;
}

void *_os_trace_uuid_map_clear(void *result)
{
  if (result)
  {
    v1 = result;
    if (result[3])
    {
      uint64_t result = (void *)result[2];
      if (result)
      {
        do
        {
          uint64_t v2 = (void *)*result;
          operator delete(result);
          uint64_t result = v2;
        }
        while (v2);
      }
      v1[2] = 0;
      uint64_t v3 = v1[1];
      if (v3)
      {
        for (uint64_t i = 0; i != v3; ++i)
          *(void *)(*v1 + 8 * i) = 0;
      }
      v1[3] = 0;
    }
  }
  return result;
}

void *_os_trace_uuid_map_destroy(void **a1)
{
  uint64_t result = _os_trace_uuid_map_clear(a1);
  if (a1)
  {
    uint64_t v3 = a1[2];
    if (v3)
    {
      do
      {
        uint64_t v4 = (void *)*v3;
        operator delete(v3);
        uint64_t v3 = v4;
      }
      while (v4);
    }
    uint64_t v5 = *a1;
    *a1 = 0;
    if (v5) {
      operator delete(v5);
    }
    JUMPOUT(0x1E01A3060);
  }
  return result;
}

uint64_t _os_procinfo_map_insert(float **a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *a1;
  if (!*a1) {
    operator new();
  }
  unint64_t v8 = 0x9DDFEA08EB382D69 * (a2 ^ __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12));
  unint64_t v9 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12) ^ (v8 >> 47);
  unint64_t v10 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v9 ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v9 ^ v8)) >> 47));
  unint64_t v11 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
  unint64_t v12 = *((void *)v7 + 1);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
      if (v11 >= v12) {
        unint64_t v14 = v11 % v12;
      }
    }
    else
    {
      unint64_t v14 = v11 & (v12 - 1);
    }
    uint64_t v15 = *(uint64_t ***)(*(void *)v7 + 8 * v14);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = (uint64_t *)*i)
      {
        unint64_t v17 = i[1];
        if (v17 == v11)
        {
          if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
            return 0;
          }
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v14) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  }
  BOOL v19 = operator new(0x28uLL);
  *BOOL v19 = 0;
  v19[1] = v11;
  v19[2] = a2;
  *((_DWORD *)v19 + 6) = a3;
  v19[4] = a4;
  float v20 = (float)(unint64_t)(*((void *)v7 + 3) + 1);
  float v21 = v7[8];
  if (!v12 || (float)(v21 * (float)v12) < v20)
  {
    BOOL v22 = 1;
    if (v12 >= 3) {
      BOOL v22 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v12);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v12 = *((void *)v7 + 1);
    if (*(void *)&prime > v12) {
      goto LABEL_36;
    }
    if (*(void *)&prime < v12)
    {
      unint64_t v32 = vcvtps_u32_f32((float)*((unint64_t *)v7 + 3) / v7[8]);
      if (v12 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v12)
      {
        unint64_t v12 = *((void *)v7 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v26 = operator new(8 * *(void *)&prime);
          unint64_t v27 = *(void **)v7;
          *(void *)uint64_t v7 = v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          *((int8x8_t *)v7 + 1) = prime;
          do
            *(void *)(*(void *)v7 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          unint64_t v29 = (void *)*((void *)v7 + 2);
          if (v29)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)v7 + 8 * v30) = v7 + 4;
            v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*(void *)v7 + 8 * v36))
                  {
                    *(void *)(*(void *)v7 + 8 * v36) = v29;
                    goto LABEL_61;
                  }
                  *unint64_t v29 = *v35;
                  void *v35 = **(void **)(*(void *)v7 + 8 * v36);
                  **(void **)(*(void *)v7 + 8 * v36) = v35;
                  v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_61:
                unint64_t v29 = v35;
                v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        v42 = *(void **)v7;
        *(void *)uint64_t v7 = 0;
        if (v42) {
          operator delete(v42);
        }
        unint64_t v12 = 0;
        *((void *)v7 + 1) = 0;
      }
    }
LABEL_65:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v14 = v11 % v12;
      }
      else {
        unint64_t v14 = v11;
      }
    }
    else
    {
      unint64_t v14 = (v12 - 1) & v11;
    }
  }
  unint64_t v37 = *(void **)v7;
  uint64_t v38 = *(void **)(*(void *)v7 + 8 * v14);
  if (v38)
  {
    *BOOL v19 = *v38;
LABEL_78:
    *uint64_t v38 = v19;
    goto LABEL_79;
  }
  uint64_t v39 = *((void *)v7 + 2);
  *BOOL v19 = v39;
  *((void *)v7 + 2) = v19;
  v37[v14] = v7 + 4;
  if (v39)
  {
    unint64_t v40 = *(void *)(v39 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v40 >= v12) {
        v40 %= v12;
      }
    }
    else
    {
      v40 &= v12 - 1;
    }
    uint64_t v38 = (void *)(*(void *)v7 + 8 * v40);
    goto LABEL_78;
  }
LABEL_79:
  ++*((void *)v7 + 3);
  return 1;
}

void *_os_procinfo_map_lookup(void *result, uint64_t a2, unsigned int a3)
{
  if (result)
  {
    int8x8_t v3 = (int8x8_t)result[1];
    if (v3)
    {
      uint64_t v4 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12);
      unint64_t v5 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
      uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
      v6.i16[0] = vaddlv_u8(v6);
      if (v6.u32[0] > 1uLL)
      {
        unint64_t v7 = (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
        if (v5 >= *(void *)&v3) {
          unint64_t v7 = v5 % *(void *)&v3;
        }
      }
      else
      {
        unint64_t v7 = v5 & (*(void *)&v3 - 1);
      }
      unint64_t v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (uint64_t i = *v8; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v10 = i[1];
          if (v5 == v10)
          {
            if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
              return (void *)i[4];
            }
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v10 >= *(void *)&v3) {
                v10 %= *(void *)&v3;
              }
            }
            else
            {
              v10 &= *(void *)&v3 - 1;
            }
            if (v10 != v7) {
              return 0;
            }
          }
        }
      }
    }
    return 0;
  }
  return result;
}

void *_os_procinfo_map_clear(void *result, uint64_t (*a2)(void))
{
  if (result)
  {
    int8x8_t v3 = result;
    if (a2)
    {
      for (uint64_t i = (void *)result[2]; i; uint64_t i = (void *)*i)
        uint64_t result = (void *)a2(i[4]);
    }
    if (v3[3])
    {
      uint64_t result = (void *)v3[2];
      if (result)
      {
        do
        {
          unint64_t v5 = (void *)*result;
          operator delete(result);
          uint64_t result = v5;
        }
        while (v5);
      }
      v3[2] = 0;
      uint64_t v6 = v3[1];
      if (v6)
      {
        for (uint64_t j = 0; j != v6; ++j)
          *(void *)(*v3 + 8 * j) = 0;
      }
      v3[3] = 0;
    }
  }
  return result;
}

uint64_t _os_trace_str_map_insert(uint64_t **a1, char *__s, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  if (!*a1) {
    operator new();
  }
  std::string::basic_string[abi:nn180100]<0>(__p, __s);
  char v5 = HIBYTE(v45);
  if (v45 >= 0) {
    uint64_t v6 = (uint64_t *)__p;
  }
  else {
    uint64_t v6 = (uint64_t *)__p[0];
  }
  if (v45 >= 0) {
    unint64_t v7 = HIBYTE(v45);
  }
  else {
    unint64_t v7 = (unint64_t)__p[1];
  }
  unint64_t v8 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v6, v7);
  unint64_t v9 = v8;
  unint64_t v10 = v4[1];
  if (!v10)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_26;
  }
  uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v13 = v8;
    if (v8 >= v10) {
      unint64_t v13 = v8 % v10;
    }
  }
  else
  {
    unint64_t v13 = (v10 - 1) & v8;
  }
  unint64_t v14 = *(unsigned __int8 ***)(*v4 + 8 * v13);
  if (!v14 || (uint64_t v15 = *v14) == 0)
  {
LABEL_26:
    unint64_t v17 = v4 + 2;
    float v18 = operator new(0x30uLL);
    *float v18 = 0;
    v18[1] = v9;
    uint64_t v19 = v45;
    *((_OWORD *)v18 + 1) = *(_OWORD *)__p;
    __p[1] = 0;
    uint64_t v45 = 0;
    __p[0] = 0;
    v18[4] = v19;
    v18[5] = a3;
    float v20 = (float)(unint64_t)(v4[3] + 1);
    float v21 = *((float *)v4 + 8);
    if (v10 && (float)(v21 * (float)v10) >= v20)
    {
LABEL_72:
      uint64_t v37 = *v4;
      uint64_t v38 = *(void **)(*v4 + 8 * v13);
      if (v38)
      {
        *float v18 = *v38;
      }
      else
      {
        uint64_t v39 = (void *)*v17;
        *float v18 = *v17;
        *unint64_t v17 = v18;
        *(void *)(v37 + 8 * v13) = v17;
        if (!v39) {
          goto LABEL_81;
        }
        unint64_t v40 = v39[1];
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v40 >= v10) {
            v40 %= v10;
          }
        }
        else
        {
          v40 &= v10 - 1;
        }
        uint64_t v38 = (void *)(*v4 + 8 * v40);
      }
      *uint64_t v38 = v18;
LABEL_81:
      ++v4[3];
      uint64_t v41 = 1;
      if (v45 < 0) {
        goto LABEL_82;
      }
      return v41;
    }
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v10 = v4[1];
    if (*(void *)&prime > v10) {
      goto LABEL_38;
    }
    if (*(void *)&prime < v10)
    {
      unint64_t v32 = vcvtps_u32_f32((float)(unint64_t)v4[3] / *((float *)v4 + 8));
      if (v10 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v10)
      {
        unint64_t v10 = v4[1];
      }
      else
      {
        if (prime)
        {
LABEL_38:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          unint64_t v26 = operator new(8 * *(void *)&prime);
          unint64_t v27 = (void *)*v4;
          *uint64_t v4 = (uint64_t)v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          v4[1] = (uint64_t)prime;
          do
            *(void *)(*v4 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          unint64_t v29 = (void *)*v17;
          if (*v17)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*v4 + 8 * v30) = v17;
            v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*v4 + 8 * v36))
                  {
                    *(void *)(*v4 + 8 * v36) = v29;
                    goto LABEL_63;
                  }
                  *unint64_t v29 = *v35;
                  void *v35 = **(void **)(*v4 + 8 * v36);
                  **(void **)(*v4 + 8 * v36) = v35;
                  v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_63:
                unint64_t v29 = v35;
                v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_67;
        }
        v43 = (void *)*v4;
        *uint64_t v4 = 0;
        if (v43) {
          operator delete(v43);
        }
        unint64_t v10 = 0;
        v4[1] = 0;
      }
    }
LABEL_67:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v13 = v9 % v10;
      }
      else {
        unint64_t v13 = v9;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v9;
    }
    goto LABEL_72;
  }
  while (1)
  {
    unint64_t v16 = *((void *)v15 + 1);
    if (v16 == v9) {
      break;
    }
    if (v12 > 1)
    {
      if (v16 >= v10) {
        v16 %= v10;
      }
    }
    else
    {
      v16 &= v10 - 1;
    }
    if (v16 != v13) {
      goto LABEL_26;
    }
LABEL_25:
    uint64_t v15 = *(unsigned __int8 **)v15;
    if (!v15) {
      goto LABEL_26;
    }
  }
  if (!std::equal_to<std::string>::operator()[abi:nn180100](v15 + 16, (unsigned __int8 *)__p)) {
    goto LABEL_25;
  }
  uint64_t v41 = 0;
  if (v5 < 0) {
LABEL_82:
  }
    operator delete(__p[0]);
  return v41;
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void *_os_trace_str_map_entry(void *result, char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v2 = result;
    std::string::basic_string[abi:nn180100]<0>(v16, a2);
    int v3 = (char)v17;
    uint64_t v4 = (void *)v16[0];
    if ((v17 & 0x80u) == 0) {
      int v5 = v16;
    }
    else {
      int v5 = (uint64_t *)v16[0];
    }
    if ((v17 & 0x80u) == 0) {
      unint64_t v6 = v17;
    }
    else {
      unint64_t v6 = v16[1];
    }
    unint64_t v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v5, v6);
    int8x8_t v8 = (int8x8_t)v2[1];
    if (!*(void *)&v8) {
      goto LABEL_25;
    }
    unint64_t v9 = v7;
    uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v12 = v7;
      if (v7 >= *(void *)&v8) {
        unint64_t v12 = v7 % *(void *)&v8;
      }
    }
    else
    {
      unint64_t v12 = (*(void *)&v8 - 1) & v7;
    }
    BOOL v13 = *(unsigned __int8 ***)(*v2 + 8 * v12);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v9 == v15)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v16)) {
            break;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v15 >= *(void *)&v8) {
              v15 %= *(void *)&v8;
            }
          }
          else
          {
            v15 &= *(void *)&v8 - 1;
          }
          if (v15 != v12) {
            goto LABEL_25;
          }
        }
      }
    }
    else
    {
LABEL_25:
      uint64_t i = 0;
    }
    if (v3 < 0)
    {
      operator delete(v4);
      if (i)
      {
LABEL_28:
        uint64_t result = i + 16;
        if ((char)i[39] < 0) {
          return (void *)*result;
        }
        return result;
      }
    }
    else if (i)
    {
      goto LABEL_28;
    }
    return 0;
  }
  return result;
}

void _os_trace_str_map_clear(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(*(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(void **__p)
{
  if (__p)
  {
    v1 = __p;
    do
    {
      uint64_t v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0) {
        operator delete(v1[2]);
      }
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void hashtable_destroy(unsigned int *a1, void (*a2)(void))
{
  if (*((void *)a1 + 2))
  {
    unint64_t v3 = *a1;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        unint64_t v6 = *(void **)(*((void *)a1 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            unint64_t v7 = (void *)*v6;
            if (a2) {
              a2(v6[2]);
            }
            free(v6);
            --a1[1];
            unint64_t v6 = v7;
          }
          while (v7);
          unint64_t v3 = *a1;
        }
      }
    }
    if (a1[1])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    free(*((void **)a1 + 2));
  }

  free(a1);
}

uint64_t hashtable_lookup(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v4 = (void *)(*(void *)(a1 + 16) + 8 * (hash_fn_array[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    int v5 = (unsigned int (*)(void, uint64_t))hashkey_compare_array[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      uint64_t v4 = (void *)*v4;
      if (!v4) {
        break;
      }
      if (v5(v4[1], a2)) {
        return v4[2];
      }
    }
  }
  return 0;
}

BOOL hashkey_compare_uint64(uint64_t a1, void *a2)
{
  return *a2 == a1;
}

BOOL hashkey_compare_uint16(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

uint64_t hash_uint64(void *a1)
{
  unint64_t v1 = *a1 + ~(*a1 << 32);
  unint64_t v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t hash_uint16(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t hashtable_insert(int *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = ((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2);
  unsigned int v7 = *a1;
  if (!*((void *)a1 + 2)) {
    goto LABEL_8;
  }
  int8x8_t v8 = (void *)(*((void *)a1 + 2)
                + 8
                * (((unsigned int (**)(void *))hash_fn_array)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  unint64_t v9 = (uint64_t (*)(void, void *))hashkey_compare_array[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    int8x8_t v8 = (void *)*v8;
    if (!v8) {
      break;
    }
    if (v9(v8[1], a2)) {
      return 0;
    }
  }
  if (!*((void *)a1 + 2)) {
LABEL_8:
  }
    *((void *)a1 + 2) = _os_trace_calloc();
  unsigned int v11 = v6 % v7;
  int v12 = *((unsigned __int8 *)a1 + 8);
  BOOL v13 = (void *)_os_trace_calloc();
  *BOOL v13 = 0;
  v13[2] = a3;
  if (v12 == 2)
  {
    v13[1] = *a2;
  }
  else if (v12 == 1)
  {
    *((_WORD *)v13 + 4) = *(_WORD *)a2;
  }
  else
  {
    free(v13);
    BOOL v13 = 0;
  }
  uint64_t v14 = *((void *)a1 + 2);
  *BOOL v13 = *(void *)(v14 + 8 * v11);
  *(void *)(v14 + 8 * v11) = v13;
  ++a1[1];
  return 1;
}

unsigned int *hashtable_iterate(unsigned int *result, uint64_t a2)
{
  if (*((void *)result + 2))
  {
    unint64_t v2 = result;
    unint64_t v3 = *result;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        unsigned int v6 = *(void **)(*((void *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            int v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1) {
              int8x8_t v8 = v6 + 1;
            }
            else {
              int8x8_t v8 = 0;
            }
            if (v7 == 2) {
              unint64_t v9 = v6 + 1;
            }
            else {
              unint64_t v9 = v8;
            }
            uint64_t result = (unsigned int *)(*(uint64_t (**)(uint64_t, void *, void))(a2 + 16))(a2, v9, v6[2]);
            unsigned int v6 = (void *)*v6;
          }
          while (v6);
          unint64_t v3 = *v2;
        }
      }
    }
  }
  return result;
}

uint64_t _os_trace_persistdir_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_persist_path;
}

void ___os_trace_shared_paths_init_block_invoke()
{
  _os_trace_persist_path = (uint64_t)"/private/var/db/diagnostics";
  _os_trace_timesync_path = (uint64_t)"/private/var/db/diagnostics/timesync";
  _os_trace_uuidtext_path = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t _os_trace_timesyncdir_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_timesync_path;
}

uint64_t _os_trace_uuiddb_path()
{
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  return _os_trace_uuidtext_path;
}

uint64_t _os_trace_get_path(int a1)
{
  switch(a1)
  {
    case 0:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_persist_path;
      break;
    case 1:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_timesync_path;
      break;
    case 2:
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      uint64_t result = _os_trace_uuidtext_path;
      break;
    case 3:
      uint64_t result = MEMORY[0x1F40CA0E8]();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t _timesync_validate(uint64_t a1, uint64_t a2, unint64_t *a3, void *a4)
{
  unsigned int v6 = (char *)_os_trace_mmap_at();
  if (!v6)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
    if (!*__error()) {
      return v7;
    }
LABEL_28:
    _os_assumes_log();
    return v7;
  }
  for (unint64_t i = 0; i <= 0xAAAAAAAAAAAAAAAALL; unint64_t i = v9 + v12)
  {
    if (i >= 0xAAAAAAAAAAAAAAAALL)
    {
      int v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
      uint64_t v14 = 1;
      uint64_t v7 = 1;
      goto LABEL_25;
    }
    unint64_t v9 = i;
    uint8x8_t v10 = &v6[i];
    int v11 = *(unsigned __int16 *)&v6[i];
    if (v11 > 48047)
    {
      if (v11 == 48048)
      {
        if (*((_WORD *)v10 + 1) != 48) {
          break;
        }
        uint64_t v12 = 48;
      }
      else
      {
        if (v11 != 57005) {
          break;
        }
        uint64_t v12 = *((unsigned __int16 *)v10 + 1);
      }
      continue;
    }
    if (v11 == 27986)
    {
      if (*((_WORD *)v10 + 1) != 88) {
        break;
      }
      uint64_t v12 = 88;
      continue;
    }
    if (v11 != 29524 || *((_WORD *)v10 + 1) != 32) {
      break;
    }
    uint64_t v12 = 32;
  }
  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = *(void *)v10;
  }
  int v13 = munmap(v6, 0xAAAAAAAAAAAAAAAALL);
  uint64_t v14 = 0;
  uint64_t v7 = 0;
LABEL_25:
  if (v13 == -1)
  {
    __error();
    uint64_t v7 = v14;
    goto LABEL_28;
  }
  return v7;
}

uint64_t ___timesync_tidy_and_count_files_block_invoke(void *a1, char *__str)
{
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  unint64_t v3 = strtoull(__str, 0, 16);
  uint64_t v4 = *(void *)(a1[5] + 8);
  if (v3 < *(void *)(v4 + 24)) {
    *(void *)(v4 + 24) = v3;
  }
  uint64_t v5 = *(void *)(a1[6] + 8);
  if (v3 > *(void *)(v5 + 24)) {
    *(void *)(v5 + 24) = v3;
  }
  return 1;
}

uint64_t _timesync_repair(int a1, const char *a2, uint64_t a3)
{
  int v4 = openat(a1, a2, 16777478);
  if (v4 == -1)
  {
    __error();
    _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = _os_trace_mmap_at();
  if (v6)
  {
    uint64_t v7 = (char *)v6;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      uint8x8_t v10 = &v7[v8];
      unsigned int v11 = *(unsigned __int16 *)&v7[v8];
      if (v11 > 0xBBAF)
      {
        if (v11 == 48048)
        {
          if (*((_WORD *)v10 + 1) != 48) {
            goto LABEL_22;
          }
          unsigned int v12 = 48;
        }
        else
        {
          if (v11 != 57005) {
            goto LABEL_22;
          }
          unsigned int v12 = *((unsigned __int16 *)v10 + 1);
        }
      }
      else if (v11 == 27986)
      {
        if (*((_WORD *)v10 + 1) != 88) {
          goto LABEL_22;
        }
        unsigned int v12 = 88;
      }
      else
      {
        if (v11 != 29524 || *((_WORD *)v10 + 1) != 32)
        {
LABEL_22:
          unsigned __int16 v14 = *(_WORD *)&v7[v8];
          unint64_t v15 = &v7[v8];
          unint64_t v16 = 0xAAAAAAAAAAAAAAAALL - v8;
          while (1)
          {
            if (v14 == 27986)
            {
              if (*((_WORD *)v15 + 1) == 88) {
                goto LABEL_34;
              }
            }
            else if (v14 == 29524)
            {
              if (*((_WORD *)v15 + 1) == 32) {
                goto LABEL_34;
              }
            }
            else if (v14 == 48048 && *((_WORD *)v15 + 1) == 48)
            {
LABEL_34:
              unint64_t v13 = v15 - v10;
LABEL_35:
              if (v13 >= 0xFFFF)
              {
                LOWORD(v12) = -8;
              }
              else
              {
LABEL_36:
                LOWORD(v12) = v13;
                if (!(_WORD)v13)
                {
                  LOWORD(v12) = *((_WORD *)v10 + 1);
                  goto LABEL_43;
                }
              }
              (*(void (**)(uint64_t, unint64_t))(a3 + 16))(a3, v8);
              if (lseek(v5, v8, 0) == -1 || (uint64_t v18 = _os_trace_write(), v18 == -1))
              {
                __error();
                _os_assumes_log();
              }
              else if ((v18 & 0x8000000000000000) == 0)
              {
                uint64_t v9 = (v9 + 1);
                goto LABEL_43;
              }
              uint64_t v9 = 0xFFFFFFFFLL;
LABEL_50:
              if (munmap(v7, 0xAAAAAAAAAAAAAAAALL) == -1)
              {
                __error();
                _os_assumes_log();
              }
              if (close(v5) != -1) {
                return v9;
              }
              int v21 = *__error();
              uint64_t result = *__error();
              if (v21 != 9)
              {
LABEL_55:
                _os_assumes_log();
                __error();
                _os_assumes_log();
                return v9;
              }
              qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
              qword_1EAA9B130 = result;
              __break(1u);
              goto LABEL_57;
            }
            if (v16 <= 7)
            {
              unint64_t v13 = (unsigned __int16)(-21846 - v8);
              goto LABEL_35;
            }
            v16 -= 8;
            unsigned __int16 v17 = *((_WORD *)v15 + 4);
            v15 += 8;
            unsigned __int16 v14 = v17;
          }
        }
        unsigned int v12 = 32;
      }
      if (v8 + v12 > 0xAAAAAAAAAAAAAAAALL)
      {
        LOWORD(v13) = -21846 - v8;
        goto LABEL_36;
      }
LABEL_43:
      v8 += (unsigned __int16)v12;
      if (v8 >= 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_50;
      }
    }
  }
  if (*__error()) {
    _os_assumes_log();
  }
  if (close(v5) != -1) {
    return 0xFFFFFFFFLL;
  }
  int v19 = *__error();
  uint64_t result = *__error();
  if (v19 != 9)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_55;
  }
LABEL_57:
  qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EAA9B130 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_db_openat(int a1, const char *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _os_trace_zalloc();
  int v5 = openat(a1, a2, 0);
  *(_DWORD *)uint64_t v4 = v5;
  if (v5 != -1)
  {
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2000000000;
    int v37 = 0;
    uint64_t v30 = 0;
    unint64_t v31 = &v30;
    uint64_t v32 = 0x2000000000;
    uint64_t v33 = -1;
    uint64_t v26 = 0;
    unint64_t v27 = &v26;
    uint64_t v28 = 0x2000000000;
    uint64_t v29 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 0x40000000;
    int v21 = ___timesync_tidy_and_count_files_block_invoke;
    uint64_t v22 = &unk_1E6CA1C58;
    unint64_t v23 = &v34;
    unint64_t v24 = &v30;
    unint64_t v25 = &v26;
    int v6 = dup(v5);
    if (v6 == -1) {
      goto LABEL_16;
    }
    int v7 = v6;
    if (lseek(v6, 0, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    unint64_t v8 = fdopendir(v7);
    if (!v8)
    {
      int v14 = *__error();
      if (close(v7) == -1)
      {
        int v19 = *__error();
        uint64_t result = *__error();
        if (v19 == 9) {
          goto LABEL_34;
        }
        _os_assumes_log();
      }
      *__error() = v14;
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x1E4F14390];
LABEL_7:
    while (1)
    {
      unsigned int v11 = readdir(v9);
      if (!v11) {
        break;
      }
      if ((v11->d_type | 8) == 8)
      {
        uint64_t v12 = 0;
        d_name = v11->d_name;
        while ((d_name[v12] & 0x80000000) == 0
             && (*(_DWORD *)(v10 + 4 * d_name[v12] + 60) & 0x10000) != 0)
        {
          if (++v12 == 16)
          {
            if (strcmp(&v11->d_name[16], ".timesync") || (v21(v20, d_name) & 1) != 0) {
              goto LABEL_7;
            }
            goto LABEL_15;
          }
        }
      }
    }
LABEL_15:
    if (closedir(v9) == -1)
    {
LABEL_16:
      __error();
      _os_assumes_log();
    }
LABEL_19:
    int v15 = *((_DWORD *)v35 + 6);
    if (v15 >= 1)
    {
      *(void *)(v4 + 8) = v31[3];
      *(void *)(v4 + 16) = v27[3];
    }
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    if (v15 >= 1 && (_timesync_reset(v4) & 0x80000000) == 0) {
      return v4;
    }
    goto LABEL_25;
  }
  __error();
  _os_assumes_log();
LABEL_25:
  int v16 = *__error();
  if ((*(_DWORD *)v4 & 0x80000000) != 0 || close(*(_DWORD *)v4) != -1) {
    goto LABEL_27;
  }
  int v18 = *__error();
  uint64_t result = *__error();
  if (v18 != 9)
  {
    _os_assumes_log();
LABEL_27:
    free((void *)v4);
    uint64_t v4 = 0;
    *__error() = v16;
    return v4;
  }
  qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EAA9B130 = result;
  __break(1u);
LABEL_34:
  qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EAA9B130 = result;
  __break(1u);
  return result;
}

uint64_t _timesync_reset(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  _timesync_munmap_file(a1);
  *(void *)(a1 + 24) = *(void *)(a1 + 8);
  while ((_timesync_mmap_file((void *)a1) & 0x80000000) != 0)
  {
    unint64_t v2 = *(void *)(a1 + 16);
    unint64_t v3 = *(void *)(a1 + 24) + 1;
    *(void *)(a1 + 24) = v3;
    if (v3 > v2) {
      return 0xFFFFFFFFLL;
    }
  }
  _timesync_process_boot_entry(a1);
  v6[0] = *(void *)(a1 + 32);
  entry = _timesync_next_entry(*(unsigned __int16 **)(a1 + 48), v6);
  uint64_t result = 0;
  *(void *)(a1 + 48) = entry;
  return result;
}

uint64_t _timesync_munmap_file(uint64_t a1)
{
  unint64_t v3 = (void *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    uint64_t result = munmap((void *)result, *(void *)(a1 + 32));
    if (result == -1)
    {
      __error();
      uint64_t result = _os_assumes_log();
    }
    *unint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t _timesync_mmap_file(void *a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  memset(v7, 170, 18);
  uint64_t v5 = a1[3];
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v5);
  unint64_t v2 = (unsigned __int16 *)_os_trace_mmap_at();
  a1[5] = v2;
  if (!v2)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    return 0xFFFFFFFFLL;
  }
  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    _timesync_munmap_file((uint64_t)a1);
    a1[5] = 0;
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0;
  a1[6] = v2;
  return v3;
}

uint64_t _timesync_process_boot_entry(uint64_t result)
{
  unint64_t v1 = *(long long **)(result + 48);
  if (*((_DWORD *)v1 + 6))
  {
    if (*((_DWORD *)v1 + 7))
    {
      long long v2 = *v1;
      long long v3 = v1[1];
      *(_OWORD *)(result + 88) = v1[2];
      *(_OWORD *)(result + 72) = v3;
      *(_OWORD *)(result + 56) = v2;
      *(void *)(result + 112) = 0;
      *(_OWORD *)(result + 120) = *(_OWORD *)(result + 88);
      return result;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

char *_timesync_next_entry(unsigned __int16 *a1, void *a2)
{
  unsigned int v2 = *a1;
  if (v2 > 0xBBAF)
  {
    if (v2 == 48048)
    {
      if (a1[1] != 48) {
        goto LABEL_17;
      }
      uint64_t v3 = 48;
    }
    else
    {
      if (v2 != 57005) {
        goto LABEL_17;
      }
      uint64_t v3 = a1[1];
    }
  }
  else
  {
    if (v2 != 27986)
    {
      if (v2 == 29524 && a1[1] == 32)
      {
        uint64_t v3 = 32;
        goto LABEL_13;
      }
LABEL_17:
      _os_assumes_log();
      return 0;
    }
    if (a1[1] != 88) {
      goto LABEL_17;
    }
    uint64_t v3 = 88;
  }
LABEL_13:
  uint64_t v4 = *a2 - v3;
  *a2 = v4;
  uint64_t v5 = (char *)a1 + v3;
  if (v4 >= 1) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t _timesync_db_open(const char *a1)
{
  return _timesync_db_openat(-2, a1);
}

uint64_t _timesync_db_dup(int *a1)
{
  return _timesync_db_openat(*a1, ".");
}

uint64_t _timesync_advance(uint64_t result)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v1 = *(unsigned __int16 **)(result + 48);
  if (!v1) {
    return result;
  }
  unsigned int v2 = (void *)result;
  if (*v1 == 48048)
  {
    _timesync_process_boot_entry(result);
    uint64_t v3 = (unsigned __int16 *)v2[6];
  }
  else
  {
    long long v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 120) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    uint64_t v3 = v1;
  }
  v8[0] = v2[4] - (void)v3 + v2[5];
  while (1)
  {
    uint64_t result = (uint64_t)_timesync_next_entry(v1, v8);
    unint64_t v1 = (unsigned __int16 *)result;
    if (!result) {
      break;
    }
LABEL_10:
    int v7 = *v1;
    if (v7 == 48048)
    {
      if (*((void *)v1 + 1) != v2[8] || *((void *)v1 + 2) != v2[9]) {
        goto LABEL_17;
      }
    }
    else if (v7 == 29524)
    {
      goto LABEL_17;
    }
  }
  uint64_t result = _timesync_munmap_file((uint64_t)v2);
  unint64_t v5 = v2[2];
  unint64_t v6 = v2[3] + 1;
  v2[3] = v6;
  if (v6 <= v5)
  {
    uint64_t result = _timesync_mmap_file(v2);
    if ((result & 0x80000000) == 0)
    {
      unint64_t v1 = (unsigned __int16 *)v2[6];
      v8[0] = v2[4];
      if (!v1) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }
  unint64_t v1 = 0;
LABEL_17:
  v2[6] = v1;
  return result;
}

uint64_t _timesync_mach_timebase(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 80);
  return result;
}

unint64_t _timesync_continuous_to_wall_time(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  if (*a2 != *(void *)(a1 + 64) || a2[1] != *(void *)(a1 + 72)) {
    goto LABEL_8;
  }
  unint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 48);
  if (!v9 || *(_WORD *)v9 != 29524)
  {
    if (v8 > a3) {
      goto LABEL_7;
    }
LABEL_19:
    if (a4)
    {
      *a4 = *(void *)(a1 + 128);
      unint64_t v8 = *(void *)(a1 + 112);
    }
    return (a3 - v8) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(void *)(a1 + 120);
  }
  if (v8 <= a3 && *(void *)(v9 + 8) > a3) {
    goto LABEL_19;
  }
LABEL_7:
  if (v8 <= a3)
  {
LABEL_22:
    return _timesync_advance_and_calculate(a1, a3, a4);
  }
LABEL_8:
  _timesync_reset(a1);
LABEL_9:
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  if (*a2 == v10 && a2[1] == v11) {
    goto LABEL_22;
  }
  while (1)
  {
    uint64_t v12 = *(unsigned __int16 **)(a1 + 48);
    if (!v12) {
      return -1;
    }
    if (*v12 == 48048 && (*((void *)v12 + 1) != v10 || *((void *)v12 + 2) != v11))
    {
      _timesync_advance(a1);
      goto LABEL_9;
    }
    _timesync_advance(a1);
  }
}

unint64_t _timesync_advance_and_calculate(uint64_t a1, unint64_t a2, void *a3)
{
  while (1)
  {
    unint64_t v6 = *(void *)(a1 + 112);
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      if (*(_WORD *)v7 == 29524) {
        break;
      }
    }
    if (v6 <= a2) {
      goto LABEL_8;
    }
LABEL_7:
    _timesync_advance(a1);
  }
  if (v6 > a2 || *(void *)(v7 + 8) <= a2) {
    goto LABEL_7;
  }
LABEL_8:
  if (a3)
  {
    *a3 = *(void *)(a1 + 128);
    unint64_t v6 = *(void *)(a1 + 112);
  }
  return (a2 - v6) * *(unsigned int *)(a1 + 80) / *(unsigned int *)(a1 + 84) + *(void *)(a1 + 120);
}

unint64_t _timesync_wall_time_to_continuous(uint64_t a1, unint64_t a2, unint64_t a3, _OWORD *a4)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  *a4 = *(_OWORD *)_timesync_range_find_startboot(a1, a2, a3, v5);
  return v5[0];
}

uint64_t _timesync_range_find_startboot(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  _timesync_reset(a1);
  if (a2 - 1 >= a3) {
    a3 = -1;
  }
  for (unint64_t i = *(unsigned __int16 **)(a1 + 48); i; unint64_t i = *(unsigned __int16 **)(a1 + 48))
  {
    unint64_t v9 = *(void *)(a1 + 120);
    if (v9 <= a3)
    {
      if (v9 > a2) {
        break;
      }
      if (*i != 48048)
      {
        unint64_t v10 = (*((void *)i + 1) - *(void *)(a1 + 112))
            * (unint64_t)*(unsigned int *)(a1 + 80)
            / *(unsigned int *)(a1 + 84)
            + v9;
LABEL_10:
        if (v10 > a2) {
          break;
        }
        goto LABEL_11;
      }
      unint64_t v10 = *((void *)i + 4);
      if (v10 <= a3) {
        goto LABEL_10;
      }
    }
LABEL_11:
    _timesync_advance(a1);
  }
  unint64_t v11 = *(void *)(a1 + 120);
  BOOL v12 = a2 >= v11;
  unint64_t v13 = a2 - v11;
  if (v12) {
    unint64_t v14 = *(void *)(a1 + 112) + v13 * *(unsigned int *)(a1 + 84) / *(unsigned int *)(a1 + 80);
  }
  else {
    unint64_t v14 = *(void *)(a1 + 112);
  }
  *a4 = v14;
  return a1 + 64;
}

void _timesync_range_create()
{
}

void _timesync_range_create_impl()
{
  uint64_t v0 = _os_trace_zalloc();
  *(void *)uint64_t v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_1DC764170;
  operator new();
}

BOOL ___timesync_range_create_impl_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(void *)(a1 + 32) >= a3;
}

__n128 ___timesync_range_create_impl_block_invoke_2(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

void _timesync_range_create_true_max()
{
}

uint64_t _timesync_range_count(uint64_t a1)
{
  if (*(void *)a1) {
    return *(void *)(*(void *)a1 + 24);
  }
  else {
    return 0;
  }
}

void _timesync_range_destroy(void ***a1)
{
  _os_trace_uuid_map_destroy(*a1);

  free(a1);
}

uint64_t _os_trace_device_formatted_for_content_protection()
{
  if (_os_trace_device_formatted_for_content_protection_once != -1) {
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_83);
  }
  return _os_trace_device_formatted_for_content_protection_formatted;
}

uint64_t ___os_trace_device_formatted_for_content_protection_block_invoke()
{
  uint64_t result = MKBDeviceFormattedForContentProtection();
  _os_trace_device_formatted_for_content_protection_formatted = result == 1;
  return result;
}

BOOL _os_trace_device_unlocked_since_boot()
{
  if (_os_trace_device_unlocked_since_boot_unlocked) {
    return 1;
  }
  if (_os_trace_device_formatted_for_content_protection_once != -1) {
    dispatch_once(&_os_trace_device_formatted_for_content_protection_once, &__block_literal_global_83);
  }
  if (_os_trace_device_formatted_for_content_protection_formatted) {
    BOOL result = MKBDeviceUnlockedSinceBoot() == 1;
  }
  else {
    BOOL result = 1;
  }
  _os_trace_device_unlocked_since_boot_unlocked = result;
  return result;
}

BOOL _os_trace_peer_is_admin(_xpc_connection_s *a1)
{
  return xpc_connection_get_euid(a1) == 0;
}

char *_os_trace_development_getenv(const char *a1)
{
  if (!os_variant_allows_internal_security_policies()) {
    return 0;
  }

  return getenv(a1);
}

uint64_t _os_trace_is_kernel_64_bit()
{
  if (_os_trace_is_kernel_64_bit_k64_once != -1) {
    dispatch_once(&_os_trace_is_kernel_64_bit_k64_once, &__block_literal_global_4);
  }
  return _os_trace_is_kernel_64_bit_k64;
}

uint64_t ___os_trace_is_kernel_64_bit_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)uint64_t v3 = xmmword_1DC7641C0;
  memset(__b, 170, sizeof(__b));
  size_t v1 = 648;
  uint64_t result = sysctl(v3, 4u, __b, &v1, 0, 0);
  if (result == -1)
  {
    __error();
    uint64_t result = _os_assumes_log();
  }
  _os_trace_is_kernel_64_bit_k64 = (__b[32] & 4) != 0;
  return result;
}

uint64_t _os_trace_uuiddb_get_pathsuffix(uint64_t result, int a2, char *__str, size_t __size)
{
  uint64_t v6 = result;
  if (a2 <= 16)
  {
    if ((a2 - 1) < 2)
    {
      uint64_t v7 = 1;
LABEL_5:
      uint64_t result = snprintf(__str, __size, "%02X");
      goto LABEL_10;
    }
    if (a2 == 3)
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
LABEL_17:
    qword_1EAA9B100 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
    qword_1EAA9B130 = a2;
    __break(1u);
    return result;
  }
  uint64_t v7 = -1;
  if ((a2 - 17) < 2) {
    goto LABEL_5;
  }
  if (a2 != 19) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t result = snprintf(__str, __size, "dsc");
LABEL_10:
  if (v7 == -1) {
    return result;
  }
  uint64_t v8 = (int)result + 1;
  if (v8 + 2 * (16 - v7) >= __size)
  {
    qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_1EAA9B130 = __size;
    __break(1u);
    goto LABEL_17;
  }
  __str[(int)result] = 47;
  unint64_t v9 = &__str[v8];
  do
  {
    *unint64_t v9 = a0123456789abcd[(unint64_t)*(unsigned __int8 *)(v6 + v7) >> 4];
    v9[1] = a0123456789abcd[*(unsigned char *)(v6 + v7) & 0xF];
    v9 += 2;
    ++v7;
  }
  while (v7 != 16);
  *unint64_t v9 = 0;
  return result;
}

uint64_t ___os_trace_uuiddb_path_sandbox_can_read_data_block_invoke()
{
  getpid();
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  uint64_t result = sandbox_check();
  _os_trace_uuiddb_path_sandbox_can_read_data_can_read = result == 0;
  return result;
}

BOOL _os_trace_uuiddb_path_exists(const char *a1, uint64_t a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    int v6 = snprintf(__b, 0x400uLL, "%s/", a1);
LABEL_9:
    _os_trace_uuiddb_get_pathsuffix(a2, a3, &__b[v6], 1024 - v6);
    return access(__b, 0) == 0;
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_once != -1) {
    dispatch_once(&_os_trace_uuiddb_path_sandbox_can_read_data_once, &__block_literal_global_94);
  }
  if (_os_trace_uuiddb_path_sandbox_can_read_data_can_read)
  {
    memset(__b, 170, sizeof(__b));
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    int v6 = snprintf(__b, 0x400uLL, "%s/", (const char *)_os_trace_uuidtext_path);
    goto LABEL_9;
  }
  return 0;
}

FTS *_os_trace_uuiddb_foreach(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v30[2] = *(char **)MEMORY[0x1E4F143B8];
  v30[0] = a1;
  v30[1] = 0;
  uint64_t result = fts_open(v30, 84, 0);
  if (result)
  {
    unint64_t v10 = result;
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    v29[0] = 0xAAAAAAAAAAAAAAAALL;
    v29[1] = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = fts_read(v10);
    if (v11)
    {
      BOOL v12 = v11;
      char v13 = 0;
      do
      {
        uint64_t fts_info = v12->fts_info;
        switch(v12->fts_info)
        {
          case 1u:
            if (v12->fts_level == 1)
            {
              if (!strcmp(v12->fts_name, "dsc"))
              {
                char v13 = 1;
                goto LABEL_6;
              }
              if (v12->fts_namelen == 2)
              {
                unsigned int v24 = v12->fts_name[0] - 48;
                int v25 = v24 > 0x36 ? -1 : dword_1DC7641D0[v24];
                unsigned int v26 = v12->fts_name[1] - 48;
                int v27 = v26 > 0x36 ? -1 : dword_1DC7641D0[v26];
                int v28 = v27 | (16 * v25);
                if ((v28 & 0x80000000) == 0)
                {
                  LOBYTE(v29[0]) = v28;
                  goto LABEL_6;
                }
              }
            }
            else if (!v12->fts_level)
            {
              goto LABEL_6;
            }
            (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
            fts_set(v10, v12, 4);
            goto LABEL_6;
          case 2u:
            v12->fts_errno = 62;
            goto LABEL_5;
          case 3u:
          case 4u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
            goto LABEL_5;
          case 6u:
            v13 &= v12->fts_level != 1;
            goto LABEL_6;
          case 8u:
            int fts_level = (unsigned __int16)v12->fts_level;
            if (fts_level != 2) {
              goto LABEL_33;
            }
            if (v13) {
              unint64_t v16 = 32;
            }
            else {
              unint64_t v16 = 30;
            }
            if (v16 != v12->fts_namelen) {
              goto LABEL_5;
            }
            unint64_t v17 = 0;
            uint64_t v18 = (v13 & 1) == 0;
            break;
          default:
            qword_1EAA9B100 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
            qword_1EAA9B130 = fts_info;
            __break(1u);
            return result;
        }
        while (1)
        {
          unsigned int v19 = v12->fts_name[v17] - 48;
          int v20 = v19 > 0x36 ? -1 : dword_1DC7641D0[v19];
          unsigned int v21 = v12->fts_name[v17 + 1] - 48;
          int v22 = v21 > 0x36 ? -1 : dword_1DC7641D0[v21];
          int v23 = v22 | (16 * v20);
          if (v23 < 0) {
            break;
          }
          *((unsigned char *)v29 + v18++) = v23;
          v17 += 2;
          if (v17 >= v16)
          {
            (*(void (**)(uint64_t, FTSENT *, void *, void))(a4 + 16))(a4, v12, v29, v13 & 1);
            goto LABEL_6;
          }
        }
        int fts_level = (unsigned __int16)v12->fts_level;
LABEL_33:
        if (fts_level != 1 || strcmp(v12->fts_name, ".migrated")) {
LABEL_5:
        }
          (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v12);
LABEL_6:
        BOOL v12 = fts_read(v10);
      }
      while (v12);
    }
    if (fts_close(v10) == -1)
    {
      __error();
      _os_assumes_log();
    }
    return (FTS *)(*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
  }
  return result;
}

__n128 _os_trace_uuiddb_dsc_validate_hdr(uint64_t a1, unint64_t a2, __n128 *a3)
{
  if (a2 - 0x80000000 < 0xFFFFFFFF80000010 || *(_DWORD *)a1 != 1685283688) {
    return result;
  }
  int v5 = a2;
  int v6 = *(unsigned __int16 *)(a1 + 4);
  if (v6 != 2)
  {
    if (v6 != 1) {
      return result;
    }
    uint64_t v7 = *(unsigned int *)(a1 + 8);
    uint64_t v8 = (16 * v7) & 0xFFFFFFF0;
    if (16 * v7 != v8 || v8 == 4294967280) {
      return result;
    }
    int v10 = 16 * v7 + 16;
    uint64_t v11 = *(unsigned int *)(a1 + 12);
    BOOL v12 = __CFADD__(v10, 28 * v11);
    unint64_t v13 = (v10 + 28 * v11);
    BOOL v14 = v12;
    if (v11 > 0x9249249 || v14) {
      return result;
    }
    if (v13 <= a2)
    {
      if (v7)
      {
        int v15 = (unsigned int *)(a1 + 28);
        uint64_t v16 = *(unsigned int *)(a1 + 8);
        while (1)
        {
          unint64_t v17 = *(v15 - 1);
          BOOL v12 = a2 >= v17;
          unint64_t v18 = a2 - v17;
          if (!v12 || v18 < *v15 || *(v15 - 3) >= v11) {
            return result;
          }
          v15 += 4;
          if (!--v16) {
            goto LABEL_44;
          }
        }
      }
      if (v11)
      {
LABEL_44:
        uint64_t v30 = (unsigned int *)(a1 + 16 * v7 + 40);
        do
        {
          unsigned int v31 = *v30;
          v30 += 7;
          if (v31 >= a2) {
            return result;
          }
        }
        while (--v11);
      }
      if (*(unsigned char *)(a2 + a1 - 1)) {
        return result;
      }
      uint64_t v32 = _os_trace_calloc();
      uint64_t v33 = v32;
      uint64_t v34 = *(unsigned int *)(a1 + 8);
      if (v34)
      {
        uint64_t v35 = (_DWORD *)(v32 + 16);
        uint64_t v36 = (void *)(a1 + 24);
        do
        {
          *((void *)v35 - 2) = *((unsigned int *)v36 - 1);
          *((void *)v35 - 1) = *v36;
          _DWORD *v35 = *((_DWORD *)v36 - 2);
          v35 += 6;
          v36 += 2;
          --v34;
        }
        while (v34);
      }
      uint64_t v37 = _os_trace_calloc();
      uint64_t v38 = v37;
      if (*(_DWORD *)(a1 + 12))
      {
        unint64_t v39 = 0;
        uint64_t v40 = a1 + 16 * v7 + 20;
        uint64_t v41 = v37;
        do
        {
          *(void *)uint64_t v41 = *(unsigned int *)(v40 - 4);
          *(_DWORD *)(v41 + 8) = *(_DWORD *)v40;
          *(_OWORD *)(v41 + 12) = *(_OWORD *)(v40 + 4);
          *(_DWORD *)(v41 + 28) = *(_DWORD *)(v40 + 20);
          ++v39;
          v41 += 32;
          v40 += 28;
        }
        while (v39 < *(unsigned int *)(a1 + 12));
      }
      uint64_t v42 = _os_trace_calloc();
      *(void *)(v42 + 8) = a1;
      *(void *)(v42 + 16) = v33;
      *(void *)(v42 + 24) = v38;
LABEL_61:
      __n128 result = *a3;
      *(__n128 *)(v42 + 32) = *a3;
      *(_DWORD *)(v42 + 48) = v5;
      return result;
    }
LABEL_62:
    _os_assumes_log();
    return result;
  }
  uint64_t v19 = *(unsigned int *)(a1 + 8);
  unint64_t v20 = (24 * v19) & 0xFFFFFFF8;
  if (24 * v19 != v20 || v20 > 0xFFFFFFEF) {
    return result;
  }
  int v22 = 24 * v19 + 16;
  uint64_t v23 = *(unsigned int *)(a1 + 12);
  BOOL v12 = __CFADD__(v22, 32 * v23);
  unint64_t v24 = (v22 + 32 * v23);
  BOOL v25 = v12;
  if (v23 >> 27 || v25) {
    return result;
  }
  if (v24 > a2) {
    goto LABEL_62;
  }
  if (v19)
  {
    unsigned int v26 = (_DWORD *)(a1 + 32);
    uint64_t v27 = *(unsigned int *)(a1 + 8);
    while (1)
    {
      unint64_t v28 = *(v26 - 2);
      BOOL v12 = a2 >= v28;
      unint64_t v29 = a2 - v28;
      if (!v12 || v29 < *(v26 - 1) || *v26 >= v23) {
        break;
      }
      v26 += 6;
      if (!--v27) {
        goto LABEL_56;
      }
    }
  }
  else
  {
    if (!v23)
    {
LABEL_59:
      if (*(unsigned char *)(a2 + a1 - 1)) {
        return result;
      }
      uint64_t v45 = a1 + 16 + 24 * v19;
      uint64_t v42 = _os_trace_calloc();
      *(void *)(v42 + 8) = a1;
      *(void *)(v42 + 16) = a1 + 16;
      *(void *)(v42 + 24) = v45;
      goto LABEL_61;
    }
LABEL_56:
    uint64_t v43 = (unsigned int *)(a1 + 24 * v19 + 44);
    while (1)
    {
      unsigned int v44 = *v43;
      v43 += 8;
      if (v44 >= a2) {
        break;
      }
      if (!--v23) {
        goto LABEL_59;
      }
    }
  }
  return result;
}

uint64_t *_os_trace_uuiddb_get_dsc_map_fd(uint64_t a1, __n128 *a2)
{
  return _os_trace_uuiddb_get_dsc_map_impl(a1, 0, a2, 1);
}

uint64_t *_os_trace_uuiddb_get_dsc_map_impl(uint64_t a1, char *a2, __n128 *a3, int a4)
{
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = _os_trace_uuiddb_get_dsc_map_impl__dsc_map_head;
    if (_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head)
    {
      int v10 = (void *)_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head;
      while (v10[4] != a3->n128_u64[0] || v10[5] != a3->n128_u64[1])
      {
        int v10 = (void *)*v10;
        if (!v10) {
          goto LABEL_7;
        }
      }
      if (v8) {
        _os_trace_uuiddb_dsc_map_destroy((uint64_t)v8);
      }
      return v10;
    }
LABEL_7:
    if (!a4) {
      return 0;
    }
    if (!v8) {
      break;
    }
LABEL_18:
    *uint64_t v8 = v9;
    uint64_t v12 = v9;
    atomic_compare_exchange_strong_explicit(&_os_trace_uuiddb_get_dsc_map_impl__dsc_map_head, (unint64_t *)&v12, (unint64_t)v8, memory_order_release, memory_order_relaxed);
    if (v12 == v9) {
      return v8;
    }
  }
  if (a1 == -1)
  {
    if (!a2)
    {
      if (_os_trace_shared_paths_init_once != -1) {
        dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
      }
      a2 = (char *)_os_trace_uuidtext_path;
    }
    a1 = open(a2, 0);
    if (a1 == -1)
    {
      __error();
      _os_assumes_log();
      return 0;
    }
  }
  _os_trace_uuiddb_dsc_map_create(a1, a3);
  uint64_t v8 = v11;
  if (!a2 || close(a1) != -1)
  {
    if (!v8) {
      return v8;
    }
    goto LABEL_18;
  }
  int v13 = *__error();
  __n128 result = (uint64_t *)*__error();
  if (v13 != 9)
  {
    _os_assumes_log();
    if (!v8) {
      return v8;
    }
    goto LABEL_18;
  }
  qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1EAA9B130 = (uint64_t)result;
  __break(1u);
  return result;
}

void _os_trace_uuiddb_dsc_map_destroy(uint64_t a1)
{
  unsigned int v2 = *(_WORD **)(a1 + 8);
  if (v2[2] == 1)
  {
    free(*(void **)(a1 + 16));
    free(*(void **)(a1 + 24));
    unsigned int v2 = *(_WORD **)(a1 + 8);
  }
  if (munmap(v2, *(unsigned int *)(a1 + 48)) == -1)
  {
    __error();
    _os_assumes_log();
  }

  free((void *)a1);
}

void _os_trace_uuiddb_dsc_map_create(uint64_t a1, __n128 *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  _os_trace_uuiddb_get_pathsuffix((uint64_t)a2, 3, __b, 0x400uLL);
  uint64_t v3 = _os_trace_mmap_at();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    _os_trace_uuiddb_dsc_validate_hdr(v3, 0xAAAAAAAAuLL, a2);
    if (!v5 && munmap(v4, 0xAAAAAAAAAAAAAAAALL) == -1)
    {
      __error();
      _os_assumes_log();
    }
  }
}

void _os_trace_uuiddb_dsc_run_block_on_map(char *a1, __n128 *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  if (!a1)
  {
    if (_os_trace_shared_paths_init_once != -1) {
      dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
    }
    uint64_t v5 = (char *)_os_trace_uuidtext_path;
  }
  uint64_t v6 = open(v5, 0);
  if (v6 == -1)
  {
    __error();
    _os_assumes_log();
    return;
  }
  uint64_t v7 = v6;
  dsc_map_impl = _os_trace_uuiddb_get_dsc_map_impl(0xFFFFFFFFLL, v5, a2, 0);
  BOOL v9 = dsc_map_impl != 0;
  if (dsc_map_impl || (_os_trace_uuiddb_dsc_map_create(v7, a2), (dsc_map_impl = v10) != 0))
  {
    (*(void (**)(uint64_t, uint64_t *))(a3 + 16))(a3, dsc_map_impl);
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = 1;
    if (!v7) {
      goto LABEL_10;
    }
  }
  if (close(v7) == -1)
  {
    int v11 = *__error();
    uint64_t v12 = *__error();
    if (v11 == 9)
    {
      qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1EAA9B130 = v12;
      __break(1u);
      return;
    }
    _os_assumes_log();
  }
LABEL_10:
  if (!v9)
  {
    _os_trace_uuiddb_dsc_map_destroy((uint64_t)dsc_map_impl);
  }
}

uint64_t _os_trace_uuiddb_dsc_map_resolve_entry(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v6 = *(_DWORD *)(v5 + 12);
  if (!v6) {
    return 0;
  }
  unsigned int v7 = 0;
  uint64_t v8 = *(void *)(a1 + 24);
  unsigned int v9 = *(_DWORD *)(v5 + 12);
  do
  {
    uint64_t v10 = (v9 + v7) >> 1;
    unint64_t v11 = *(void *)(v8 + 32 * v10);
    BOOL v12 = a2 >= v11;
    unint64_t v13 = a2 - v11;
    if (v12)
    {
      if (v13 < *(unsigned int *)(v8 + 32 * v10 + 8)) {
        goto LABEL_10;
      }
      unsigned int v7 = v10 + 1;
    }
    else
    {
      unsigned int v9 = (v9 + v7) >> 1;
    }
  }
  while (v7 < v9);
  uint64_t v14 = 0;
  if (*(_DWORD *)(v8 + 8)) {
    return v14;
  }
  LODWORD(v10) = 0;
LABEL_10:
  if (v10 >= v6) {
    return 0;
  }
  int v15 = (void *)(v8 + 32 * v10);
  if (a3) {
    *a3 = (char *)v15 + 12;
  }
  if (a4) {
    *a4 = *(void *)(a1 + 8) + *(unsigned int *)(v8 + 32 * v10 + 28);
  }
  if (a5) {
    *a5 = *v15;
  }
  return 1;
}

const char *_os_trace_uuiddb_dsc_map_resolve_string(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0) {
    return "%s";
  }
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(unsigned int *)(v2 + 8);
  if (!v3) {
    return 0;
  }
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  while (1)
  {
    uint64_t v6 = (v3 + v4) >> 1;
    unint64_t v7 = *(void *)(v5 + 24 * v6);
    BOOL v8 = a2 >= v7;
    unint64_t v9 = a2 - v7;
    if (!v8) {
      goto LABEL_8;
    }
    if (v9 < *(unsigned int *)(v5 + 24 * v6 + 12)) {
      return (const char *)(v2 + *(unsigned int *)(v5 + 24 * v6 + 8) + v9);
    }
    unsigned int v4 = v6 + 1;
    uint64_t v6 = v3;
LABEL_8:
    uint64_t v3 = v6;
    if (v4 >= v6) {
      return 0;
    }
  }
}

uint64_t _os_trace_uuiddb_dsc_foreach_range_with_uuid(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 8);
  if (*(_DWORD *)(v3 + 8))
  {
    uint64_t v6 = (void *)result;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = v6[2];
      uint64_t v10 = v6[3] + 32 * *(unsigned int *)(v9 + v7 + 16);
      uint64_t v12 = *(void *)(v10 + 12);
      uint64_t v11 = v10 + 12;
      if (v12 == *a2 && *(void *)(v11 + 8) == a2[1])
      {
        __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, v3 + *(unsigned int *)(v9 + v7 + 8), *(unsigned int *)(v9 + v7 + 12));
        if (!result) {
          return result;
        }
        uint64_t v3 = v6[1];
      }
      ++v8;
      v7 += 24;
    }
    while (v8 < *(unsigned int *)(v3 + 8));
  }
  return result;
}

uint64_t _os_trace_uuiddb_dsc_foreach_uuid(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if (*(_DWORD *)(v2 + 12))
  {
    uint64_t v4 = result;
    unint64_t v5 = 0;
    uint64_t v6 = 28;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, *(void *)(v4 + 24) + v6 - 16, v2 + *(unsigned int *)(*(void *)(v4 + 24) + v6));
      if ((result & 1) == 0) {
        break;
      }
      ++v5;
      uint64_t v2 = *(void *)(v4 + 8);
      v6 += 32;
    }
    while (v5 < *(unsigned int *)(v2 + 12));
  }
  return result;
}

uint64_t _os_trace_kic_mode()
{
  if (_os_trace_kic_mode_o != -1) {
    dispatch_once(&_os_trace_kic_mode_o, &__block_literal_global_12);
  }
  return _os_trace_kic_mode_kic;
}

char *___os_trace_kic_mode_block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  size_t v1 = 1024;
  _os_trace_kic_mode_kic = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  __n128 result = (char *)sysctlbyname("kern.bootargs", __b, &v1, 0, 0);
  if (!result)
  {
    if (strstr(__b, "libtrace_kic=0")) {
      _os_trace_kic_mode_kic = 0;
    }
    __n128 result = strstr(__b, "libtrace_kic=1");
    if (result) {
      _os_trace_kic_mode_kic = 1;
    }
  }
  return result;
}

void _os_trace_uuiddb_make_kernel_cache_uuid(unsigned __int8 *a1, const unsigned __int8 *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)&v7[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v4;
  *(_OWORD *)uint64_t v7 = v4;
  size_t v5 = 37;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v5, 0, 0))
  {
    uuid_copy(a1, a2);
    a1[15] = ~a1[15];
  }
  else
  {
    uuid_parse(in, a1);
  }
}

uint64_t _internal_log_assumes(uint64_t a1)
{
  v3[5] = *MEMORY[0x1E4F143B8];
  if (_internal_log_once != -1) {
    dispatch_once_f(&_internal_log_once, 0, (dispatch_function_t)_internal_log_queue_init);
  }
  if (!dispatch_get_specific((const void *)_internal_log_q_key))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 0x40000000;
    v3[2] = ___internal_log_block_invoke;
    v3[3] = &__block_descriptor_tmp_107;
    v3[4] = a1;
    dispatch_sync((dispatch_queue_t)_internal_log_q, v3);
  }
  return 1;
}

uint64_t ___internal_log_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  size_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.tm_isdst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  time_t v6 = time(0);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  uint64_t v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400) {
      __b[1022] = 10;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
    if ((_internal_log_fd & 0x80000000) == 0
      || (uint64_t result = _internal_log_open(), (_internal_log_fd & 0x80000000) == 0)
      && (_internal_log_rotate_if_needed(), uint64_t result = _internal_log_fd,
                                            (_internal_log_fd & 0x80000000) == 0))
    {
      _os_trace_write();
      return _internal_log_rotate_if_needed();
    }
  }
  return result;
}

uint64_t _internal_log_rotate_if_needed()
{
  dispatch_assert_queue_V2((dispatch_queue_t)_internal_log_q);
  off_t v0 = lseek(_internal_log_fd, 0, 2);
  uint64_t result = fsync(_internal_log_fd);
  if (v0 >= 0x100000)
  {
    if (close(_internal_log_fd) == -1)
    {
      int v3 = *__error();
      uint64_t result = *__error();
      if (v3 == 9)
      {
        qword_1EAA9B100 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1EAA9B130 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    rename((const std::__fs::filesystem::path *)_internal_log_file_0, (const std::__fs::filesystem::path *)_internal_log_file_1, v2);
    return _internal_log_open();
  }
  return result;
}

uint64_t _internal_log_open()
{
  uint64_t result = open((const char *)_internal_log_file_0, 778, 420);
  _internal_log_fd = result;
  if ((result & 0x80000000) == 0)
  {
    return fchown(result, 0x110u, 0x110u);
  }
  return result;
}

int *_internal_log_queue_init()
{
  asprintf((char **)&_internal_queue_target, "com.apple.%s.log", "logd");
  if (!_internal_queue_target)
  {
    uint64_t v1 = *__error();
    qword_1EAA9B100 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_1EAA9B130 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_1EAA9B100 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_1EAA9B130 = v2;
    __break(1u);
    return result;
  }
  _internal_log_q = (uint64_t)dispatch_queue_create_with_target_V2((const char *)_internal_queue_target, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)_internal_log_q, (const void *)_internal_log_q_key, (void *)_internal_log_q, 0);
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  asprintf((char **)&_internal_log_file_0, "%s/%s.0.log", (const char *)_os_trace_persist_path, "logd");
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  uint64_t result = (int *)asprintf((char **)&_internal_log_file_1, "%s/%s.1.log", (const char *)_os_trace_persist_path, "logd");
  if (!_internal_log_file_0 || !_internal_log_file_1) {
    goto LABEL_10;
  }
  return result;
}

id makeComponents(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v3 = [v1 decomposedMessage];
  if ([v3 state])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  else
  {
    uint64_t v5 = [v3 placeholderCount];
    if (v5 != -1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 + 1;
      do
      {
        uint64_t v8 = [[OSLogMessageComponent alloc] initWithDecomposedMessage:v3 atIndex:v6];
        [v2 addObject:v8];

        ++v6;
      }
      while (v7 != v6);
    }
    id v4 = v2;
  }
  uint64_t v9 = v4;

  return v9;
}

id convertEventProxyToEntry(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 type];
  int v3 = 0;
  if (v2 <= 1023)
  {
    if ((unint64_t)(v2 - 513) >= 3) {
      goto LABEL_14;
    }
    id v4 = off_1E6CA1A48;
  }
  else if (v2 > 1535)
  {
    if (v2 == 1536)
    {
      id v4 = &off_1E6CA1A60;
    }
    else
    {
      if (v2 != 2560) {
        goto LABEL_14;
      }
      id v4 = off_1E6CA1A40;
    }
  }
  else if (v2 == 1024)
  {
    id v4 = off_1E6CA1A58;
  }
  else
  {
    if (v2 != 1280) {
      goto LABEL_14;
    }
    id v4 = off_1E6CA1A50;
  }
  int v3 = (void *)[objc_alloc(*v4) initWithEventProxy:v1];
LABEL_14:

  return v3;
}

void sub_1DC762D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC762F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DC763270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F930]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_trace_calloc()
{
  return MEMORY[0x1F40CA088]();
}

uint64_t _os_trace_mmap_at()
{
  return MEMORY[0x1F40CA0D8]();
}

uint64_t _os_trace_realloc()
{
  return MEMORY[0x1F40CA0F8]();
}

uint64_t _os_trace_write()
{
  return MEMORY[0x1F40CA110]();
}

uint64_t _os_trace_zalloc()
{
  return MEMORY[0x1F40CA120]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return MEMORY[0x1F40CBDF8](*(void *)&a1);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CC078](*(void *)&a1);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1F40CC310](a1, a2, *(void *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40CD100](*(void *)&a1, a2, *(void *)&a3);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC08](connection);
}